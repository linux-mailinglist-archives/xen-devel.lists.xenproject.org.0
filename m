Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A7670BB3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479905.744005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuZI-0005hB-Q5; Tue, 17 Jan 2023 22:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479905.744005; Tue, 17 Jan 2023 22:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHuZI-0005eL-MO; Tue, 17 Jan 2023 22:36:36 +0000
Received: by outflank-mailman (input) for mailman id 479905;
 Tue, 17 Jan 2023 22:36:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHuZG-0005eD-VP
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:36:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHuZG-0005Xj-4f; Tue, 17 Jan 2023 22:36:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHuZG-0001Mk-03; Tue, 17 Jan 2023 22:36:34 +0000
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
	bh=XYe4maePp7zmVmQU5gus58pAOG/ID5cGJENFvQ4i/sw=; b=oeCB03jrtE+YWYnZ7GGTFbxaDj
	xgfHYkIiZ2Z0iIgm0a2NTVgiuIw6rSzgxUy6OFQENMyOU/oG15ul25YyBRgy8rTdOjBisXtcSdVbm
	Y8bWppjmuOa5N5PDAAJxN7vqSogUlvl4FkkhjeckJzWKc2SRIjueJot9amnqSOsX0NgI=;
Message-ID: <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
Date: Tue, 17 Jan 2023 22:36:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
In-Reply-To: <20230117091124.22170-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Today check_store() is only testing the correctness of the node tree.
> 
> Add verification of the accounting data (number of nodes)  and correct

NIT: one too many space before 'and'.

> the data if it is wrong.
> 
> Do the initial check_store() call only after Xenstore entries of a
> live update have been read.

Can you clarify whether this is needed for the rest of the patch, or 
simply a nice thing to have in general?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c   | 62 ++++++++++++++++------
>   tools/xenstore/xenstored_domain.c | 86 +++++++++++++++++++++++++++++++
>   tools/xenstore/xenstored_domain.h |  4 ++
>   3 files changed, 137 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 3099077a86..e201f14053 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2389,8 +2389,6 @@ void setup_structure(bool live_update)
>   		manual_node("@introduceDomain", NULL);
>   		domain_nbentry_fix(dom0_domid, 5, true);
>   	}
> -
> -	check_store();
>   }
>   
>   static unsigned int hash_from_key_fn(void *k)
> @@ -2433,20 +2431,28 @@ int remember_string(struct hashtable *hash, const char *str)
>    * As we go, we record each node in the given reachable hashtable.  These
>    * entries will be used later in clean_store.
>    */
> +
> +struct check_store_data {
> +	struct hashtable *reachable;
> +	struct hashtable *domains;
> +};
> +
>   static int check_store_step(const void *ctx, struct connection *conn,
>   			    struct node *node, void *arg)
>   {
> -	struct hashtable *reachable = arg;
> +	struct check_store_data *data = arg;
>   
> -	if (hashtable_search(reachable, (void *)node->name)) {
> +	if (hashtable_search(data->reachable, (void *)node->name)) {

IIUC the cast is only necessary because hashtable_search() expects a 
non-const value. I can't think for a reason for the key to be non-const. 
So I will look to send a follow-up patch.

> +
> +void domain_check_acc_add(const struct node *node, struct hashtable *domains)
> +{
> +	struct domain_acc *dom;
> +	unsigned int domid;
> +
> +	domid = node->perms.p[0].id;

This could be replaced with get_node_owner().

> +	dom = hashtable_search(domains, &domid);
> +	if (!dom)
> +		log("Node %s owned by unknown domain %u", node->name, domid);
> +	else
> +		dom->nodes++;
> +}
> +
> +static int domain_check_acc_sub(const void *k, void *v, void *arg)

I find the suffix 'sub' misleading because we have a function with a 
very similar name (instead suffixed 'sub'). Yet, AFAICT, it is not meant 
to substract.

So I would prefix with '_cb' instead.

Cheers,

-- 
Julien Grall

