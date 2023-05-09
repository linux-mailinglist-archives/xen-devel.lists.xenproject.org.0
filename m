Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B406FCE77
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 21:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532473.828711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwStZ-00029q-EA; Tue, 09 May 2023 19:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532473.828711; Tue, 09 May 2023 19:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwStZ-00026u-AW; Tue, 09 May 2023 19:21:09 +0000
Received: by outflank-mailman (input) for mailman id 532473;
 Tue, 09 May 2023 19:21:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwStY-00026o-AH
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 19:21:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwStX-0001Xk-9X; Tue, 09 May 2023 19:21:07 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwStX-00079a-3c; Tue, 09 May 2023 19:21:07 +0000
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
	bh=mHt51Vtzo2mlWRAJ6DVCVqnXZcgvCer1AAjKv0QYQgg=; b=VrJ0Df6XAVZq03lvngDAbssqX2
	yqMJY5nFLxtYHvgB5VQ+iyQnhbPubEOHx6TZ4y+Dr1e8erXi3a5iRGhKlmf2NGLdvHwmLkOrlttAF
	xzyOwmQiHlzHRr016cBB0diBlDJU/4DsD8YTfcQjOI8WIRqwhV9ChW0852zCQKejL/uE=;
Message-ID: <90f5dfd0-e18a-7fcb-9048-057a0656a2b3@xen.org>
Date: Tue, 9 May 2023 20:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 12/14] tools/xenstore: use generic accounting for
 remaining quotas
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> The maxrequests, node size, number of node permissions, and path length
> quota are a little bit special, as they are either active in
> transactions only (maxrequests), or they are just per item instead of
> count values. Nevertheless being able to know the maximum number of
> those quota related values per domain would be beneficial, so add them
> to the generic accounting.
> 
> The per domain value will never show current numbers other than zero,
> but the maximum number seen can be gathered the same way as the number
> of nodes during a transaction.
> 
> To be able to use the const qualifier for a new function switch
> domain_is_unprivileged() to take a const pointer, too.
> 
> For printing the quota/max values, adapt the print format string to
> the longest quota name (now 17 characters long).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V5:
> - add comment (Julien Grall)
> - add missing quota printing (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c        | 15 +++++----
>   tools/xenstore/xenstored_core.h        |  2 +-
>   tools/xenstore/xenstored_domain.c      | 45 +++++++++++++++++++++-----
>   tools/xenstore/xenstored_domain.h      |  6 ++++
>   tools/xenstore/xenstored_transaction.c |  4 +--
>   tools/xenstore/xenstored_watch.c       |  2 +-
>   6 files changed, 55 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index c98d30561f..fce73b883e 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -799,8 +799,9 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
>   		+ node->perms.num * sizeof(node->perms.p[0])
>   		+ node->datalen + node->childlen;
>   
> -	if (!no_quota_check && domain_is_unprivileged(conn) &&
> -	    data.dsize >= quota_max_entry_size) {
> +	/* Call domain_max_chk() in any case in order to record max values. */
> +	if (domain_max_chk(conn, ACC_NODESZ, data.dsize, quota_max_entry_size)
> +	    && !no_quota_check) {
>   		errno = ENOSPC;
>   		return errno;
>   	}
> @@ -1170,7 +1171,7 @@ static bool valid_chars(const char *node)
>   		       "0123456789-/_@") == strlen(node));
>   }
>   
> -bool is_valid_nodename(const char *node)
> +bool is_valid_nodename(const struct connection *conn, const char *node)
>   {
>   	int local_off = 0;
>   	unsigned int domid;
> @@ -1190,7 +1191,8 @@ bool is_valid_nodename(const char *node)
>   	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
>   		local_off = 0;
>   
> -	if (strlen(node) > local_off + quota_max_path_len)
> +	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off,
> +			   quota_max_path_len))
>   		return false;
>   
>   	return valid_chars(node);
> @@ -1252,7 +1254,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
>   	*canonical_name = canonicalize(conn, ctx, name);
>   	if (!*canonical_name)
>   		return NULL;
> -	if (!is_valid_nodename(*canonical_name)) {
> +	if (!is_valid_nodename(conn, *canonical_name)) {
>   		errno = EINVAL;
>   		return NULL;
>   	}
> @@ -1778,8 +1780,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   		return EINVAL;
>   
>   	perms.num--;
> -	if (domain_is_unprivileged(conn) &&
> -	    perms.num > quota_nb_perms_per_node)
> +	if (domain_max_chk(conn, ACC_NPERM, perms.num, quota_nb_perms_per_node))
>   		return ENOSPC;
>   
>   	permstr = in->buffer + strlen(in->buffer) + 1;
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 3564d85d7d..9339820156 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -258,7 +258,7 @@ void check_store(void);
>   void corrupt(struct connection *conn, const char *fmt, ...);
>   
>   /* Is this a valid node name? */
> -bool is_valid_nodename(const char *node);
> +bool is_valid_nodename(const struct connection *conn, const char *node);
>   
>   /* Get name of parent node. */
>   char *get_parent(const void *ctx, const char *node);
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 6f3a27765a..b3a719569e 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -431,7 +431,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   		return ENOMEM;
>   
>   #define ent(t, e) \
> -	resp = talloc_asprintf_append(resp, "%-16s: %8u (max: %8u\n", #t, \
> +	resp = talloc_asprintf_append(resp, "%-17s: %8u (max: %8u\n", #t, \
>   				      d->acc[e].val, d->acc[e].max); \
>   	if (!resp) return ENOMEM
>   
> @@ -440,6 +440,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   	ent(transactions, ACC_TRANS);
>   	ent(outstanding, ACC_OUTST);
>   	ent(memory, ACC_MEM);
> +	ent(transaction-nodes, ACC_TRANSNODES);
> +	ent(node-permissions, ACC_NPERM);
> +	ent(path-length, ACC_PATHLEN);
> +	ent(node-size, ACC_NODESZ);
>   
>   #undef ent
>   
> @@ -457,7 +461,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
>   		return ENOMEM;
>   
>   #define ent(t, e) \
> -	resp = talloc_asprintf_append(resp, "%-16s: %8u\n", #t,   \
> +	resp = talloc_asprintf_append(resp, "%-17s: %8u\n", #t,   \
>   				      acc_global_max[e]);         \
>   	if (!resp) return ENOMEM
>   
> @@ -466,6 +470,10 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
>   	ent(transactions, ACC_TRANS);
>   	ent(outstanding, ACC_OUTST);
>   	ent(memory, ACC_MEM);
> +	ent(transaction-nodes, ACC_TRANSNODES);
> +	ent(node-permissions, ACC_NPERM);
> +	ent(path-length, ACC_PATHLEN);
> +	ent(node-size, ACC_NODESZ);
>   
>   #undef ent
>   
> @@ -1079,12 +1087,22 @@ int domain_adjust_node_perms(struct node *node)
>   	return 0;
>   }
>   
> +static void domain_acc_valid_max(struct domain *d, enum accitem what,
> +				 unsigned int val)
> +{
> +	assert(what < ARRAY_SIZE(d->acc));
> +	assert(what < ARRAY_SIZE(acc_global_max));
> +
> +	if (val > d->acc[what].max)
> +		d->acc[what].max = val;
> +	if (val > acc_global_max[what] && domid_is_unprivileged(d->domid))
> +		acc_global_max[what] = val;
> +}
> +
>   static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
>   {
>   	unsigned int val;
>   
> -	assert(what < ARRAY_SIZE(d->acc));
> -

I didn't have a chance to reply on your comment on the previous version. 
So doing it here:

 > Following this reasoning I'd need to put it into even more functions.

Possibly. But for now, the discussion is about not removing the existing 
one (see more below).

 > And an
assert() triggering a little bit late is no real problem, as it will abort
xenstored anyway.

Not really. Xenstored would only be aborted if the condition is false. 
If it is not, we would return an error. That said, the condition that a 
change to be true in some condition.

But now you are relying on the compiler to never optimize out the check. 
We know that compilers can remove NULL check if a pointer was 
dereferenced beforehand. I wouldn't be surprised if they can do the same 
trick with accessing an array first and then checking the bound. So the 
abort() may actually never happen.

 > Additionally with the global and the per-domain arrays now covering all
possible quotas, it would even be reasonable to drop the assert()s in
domain_acc_valid_max() completely.

I have two concerns:
   * This is the state after this series. But I don't see what would 
prevent any change in the future.
   * If I am not mistaken none of the compilers properly enforce the 
enum in C. So you could in theory pass an outside value without the 
compiler shouting at you.

So to me, this is not warrant to completely drop the assert(). If we 
discard the latter point, the ideal would be a BUILD_BUG_ON() to tie the 
enum with the array but IIRC it is not possible to use BUILD_BUG_ON() 
with an enum. Therefore, the assert() should the best at the moment.

Ideally, we should add the assert() in other places. But, this is not 
something I think should be requested here. My only request is to not 
removing the existing one.

Cheers,

-- 
Julien Grall

