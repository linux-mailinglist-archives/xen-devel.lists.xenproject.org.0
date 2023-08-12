Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19C779FCD
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 13:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582869.912863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUnEV-0000mQ-O3; Sat, 12 Aug 2023 11:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582869.912863; Sat, 12 Aug 2023 11:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUnEV-0000ji-LM; Sat, 12 Aug 2023 11:56:39 +0000
Received: by outflank-mailman (input) for mailman id 582869;
 Sat, 12 Aug 2023 11:56:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUnET-0000ja-WC
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 11:56:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUnES-00053A-W6; Sat, 12 Aug 2023 11:56:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUnES-0003V4-O4; Sat, 12 Aug 2023 11:56:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=3h5FOuYvaFnZ5IBRBqjiVpoEsNyN9kIDAstxCoirOLY=; b=CcKqDD1290jYOnZA8xFKsYRoCn
	9NKB/JBQwNEfJn0/NBy+ESQhqjBDET3/W2It1uyLwEPtGInu6rRwiSOewr1UvhbPD7pCWljnBtV5B
	bZ8uFATjfXP8xh+UqnIDhqDt5kLwlUkXRu5Rc2hq7euJY1Ck2YbrXVJKj1jfCQ2zZRTA=;
Message-ID: <2b73a5f6-0fd1-bf58-569e-f53cabfa7987@xen.org>
Date: Sat, 12 Aug 2023 12:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
In-Reply-To: <20230724110247.10520-25-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Today get_node_canonicalized() is the only caller of get_node().
> 
> In order to prepare introducing a get_node() variant returning a
> pointer to const struct node, do the following restructuring:
> 
> - move the call of read_node() from get_node() into
>    get_node_canonicalized()
> 
> - rename get_node() to get_node_chk_perm()
> 
> - rename get_node_canonicalized() to get_node()
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstore/xenstored_core.c | 57 +++++++++++++++------------------
>   1 file changed, 25 insertions(+), 32 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index ec20bc042d..fa07bc0c31 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -996,27 +996,26 @@ static int errno_from_parents(struct connection *conn, const void *ctx,
>    * If it fails, returns NULL and sets errno.
>    * Temporary memory allocations are done with ctx.
>    */
> -static struct node *get_node(struct connection *conn,
> -			     const void *ctx,
> -			     const char *name,
> -			     unsigned int perm)
> +static bool get_node_chk_perm(struct connection *conn, const void *ctx,
> +			      const struct node *node, const char *name,
> +			      unsigned int perm)
>   {
> -	struct node *node;
>   	struct node_perms perms;
> +	bool err = false;
>   
> -	node = read_node(conn, ctx, name);
>   	/* If we don't have permission, we don't have node. */
>   	if (node) {
>   		node_to_node_perms(node, &perms);
>   		if ((perm_for_conn(conn, &perms) & perm) != perm) {
>   			errno = EACCES;
> -			node = NULL;
> +			err = true;
>   		}
>   	}
>   	/* Clean up errno if they weren't supposed to know. */
> -	if (!node && !read_node_can_propagate_errno())
> +	if (err && !read_node_can_propagate_errno())

Looking at the caller for get_node_chk_perm(), node could be NULL. In 
this case, err would be false. So there is a change of behavior here.

It is not entirely clear why it is fine. But it might be better to have 
err equals to true when node is NULL.

Cheers,

-- 
Julien Grall

