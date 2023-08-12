Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E8779FDF
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 14:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582883.912873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUnL4-0002Ue-PI; Sat, 12 Aug 2023 12:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582883.912873; Sat, 12 Aug 2023 12:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUnL4-0002SP-MX; Sat, 12 Aug 2023 12:03:26 +0000
Received: by outflank-mailman (input) for mailman id 582883;
 Sat, 12 Aug 2023 12:03:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUnL2-0002SJ-A5
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 12:03:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUnL1-0005Cv-2R; Sat, 12 Aug 2023 12:03:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUnL0-0003r4-Qy; Sat, 12 Aug 2023 12:03:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=j+6o5VnTDkDx/22/siLMXan3FAAtn/Kp2tXtThKU2ds=; b=v19gQyMtL3bdwdiHzJxdVDsuAV
	mX5LCZNHC4bowvVnFL3gmtSULF8ZMHIoCeap7YNafeJzEygF7e6kHxeuTBtdKeb0wb+9Fu/XjKDG4
	QikfHIayZFcykRJLs3VlvGvRajJ0oBPeK9bl6IMO6ipcBD1XdSt98gxKM25POHJdhOIM=;
Message-ID: <389197ab-92fa-b3ad-969f-29dcda402b21@xen.org>
Date: Sat, 12 Aug 2023 13:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-25-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

One more remark.

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

As you use bool, I find a bit confusing that 'true' would be returned on 
error while 'false' indicate it is ok. I feel the inverse is more intuitive.

I can understand this is a matter of taste. So the only thing I would 
ask is documenting this oddity as I can foresee someone that 
misinterpreting the return.

Cheers,

-- 
Julien Grall

