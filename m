Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E86F55D6
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529083.823069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9Ym-0006BV-Uf; Wed, 03 May 2023 10:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529083.823069; Wed, 03 May 2023 10:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9Ym-00069T-Rh; Wed, 03 May 2023 10:18:08 +0000
Received: by outflank-mailman (input) for mailman id 529083;
 Wed, 03 May 2023 10:18:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pu9Yl-00069N-Cu
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:18:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu9Yk-00078e-E8; Wed, 03 May 2023 10:18:06 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu9Yk-0004ko-79; Wed, 03 May 2023 10:18:06 +0000
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
	bh=MFnrBR4HCIIlWL1rbTcejWiIvoGKmGhxOCDBSwCs6GI=; b=MDOaEpj0CPWx3z7qbqDK8J+gQ1
	Uf9l/7buGbt2TEJyfcwek2XDQNOtico9tmQLuiYD8Y3k/gRbwXfqTawoiozi0EDF40FRRK0esbfOO
	ge3t4T99vzFG6G8Y1pNtndf0Jd3ukLhr6waRQIlvrxxn3QWP/BjCO9n82IatppGyNqlg=;
Message-ID: <e4f8a0e6-7a4c-3193-ce38-e43891f063ed@xen.org>
Date: Wed, 3 May 2023 11:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 12/13] tools/xenstore: use generic accounting for
 remaining quotas
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/04/2023 08:03, Juergen Gross wrote:
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
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        | 14 ++++-----
>   tools/xenstore/xenstored_core.h        |  2 +-
>   tools/xenstore/xenstored_domain.c      | 39 ++++++++++++++++++++------
>   tools/xenstore/xenstored_domain.h      |  6 ++++
>   tools/xenstore/xenstored_transaction.c |  4 +--
>   tools/xenstore/xenstored_watch.c       |  2 +-
>   6 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 88c569b7d5..65df2866bf 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -799,8 +799,8 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
>   		+ node->perms.num * sizeof(node->perms.p[0])
>   		+ node->datalen + node->childlen;
>   
> -	if (!no_quota_check && domain_is_unprivileged(conn) &&
> -	    data.dsize >= quota_max_entry_size) {
> +	if (domain_max_chk(conn, ACC_NODESZ, data.dsize, quota_max_entry_size)
> +	    && !no_quota_check) {

It feels a bit odd to move the !no_quota_check right after the actual 
check. But AFAICT, you are doing it because domain_max_chk() will also 
update the maximum value seen by the current quota.

Is that correct? If so, it would be worth mentioning it in a comment.

>   		errno = ENOSPC;
>   		return errno;
>   	}
> @@ -1168,7 +1168,7 @@ static bool valid_chars(const char *node)
>   		       "0123456789-/_@") == strlen(node));
>   }
>   
> -bool is_valid_nodename(const char *node)
> +bool is_valid_nodename(const struct connection *conn, const char *node)
>   {
>   	int local_off = 0;
>   	unsigned int domid;
> @@ -1188,7 +1188,8 @@ bool is_valid_nodename(const char *node)
>   	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
>   		local_off = 0;
>   
> -	if (strlen(node) > local_off + quota_max_path_len)
> +	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off,
> +			   quota_max_path_len))
>   		return false;
>   
>   	return valid_chars(node);
> @@ -1250,7 +1251,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
>   	*canonical_name = canonicalize(conn, ctx, name);
>   	if (!*canonical_name)
>   		return NULL;
> -	if (!is_valid_nodename(*canonical_name)) {
> +	if (!is_valid_nodename(conn, *canonical_name)) {
>   		errno = EINVAL;
>   		return NULL;
>   	}
> @@ -1775,8 +1776,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
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
> index d21f31da92..49e2c5c82a 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -433,7 +433,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   		return ENOMEM;
>   
>   #define ent(t, e) \
> -	resp = talloc_asprintf_append(resp, "%-16s: %8u (max: %8u\n", #t, \
> +	resp = talloc_asprintf_append(resp, "%-17s: %8u (max: %8u\n", #t, \

This changes feels a bit unrelated. Can you mention why this is 
necessary in the commit message?

>   				      d->acc[e].val, d->acc[e].max); \
>   	if (!resp) return ENOMEM
>   
> @@ -442,6 +442,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   	ent(transactions, ACC_TRANS);
>   	ent(outstanding, ACC_OUTST);
>   	ent(memory, ACC_MEM);
> +	ent(transaction-nodes, ACC_TRANSNODES);

You seem to convert multiple quotas but only print one. Why?

>   
>   #undef ent
>   
> @@ -459,7 +460,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
>   		return ENOMEM;
>   
>   #define ent(t, e) \
> -	resp = talloc_asprintf_append(resp, "%-16s: %8u\n", #t,   \
> +	resp = talloc_asprintf_append(resp, "%-17s: %8u\n", #t,   \
>   				      acc_global_max[e]);         \

Ditto.

>   	if (!resp) return ENOMEM
>   
> @@ -468,6 +469,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn)
>   	ent(transactions, ACC_TRANS);
>   	ent(outstanding, ACC_OUTST);
>   	ent(memory, ACC_MEM);
> +	ent(transaction-nodes, ACC_TRANSNODES);
>   
>   #undef ent
>   
> @@ -1081,12 +1083,22 @@ int domain_adjust_node_perms(struct node *node)
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

I think this assert should be kept because...

> -
>   	if ((add < 0 && -add > d->acc[what].val) ||

... of this check. Otherwise, you would check that 'what' is within the 
bounds after the use.

>   	    (add > 0 && (INT_MAX - d->acc[what].val) < add)) {
>   		/*
> @@ -1100,10 +1112,7 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
>   	}
>   
>   	val = d->acc[what].val + add;
> -	if (val > d->acc[what].max)
> -		d->acc[what].max = val;
> -	if (val > acc_global_max[what] && domid_is_unprivileged(d->domid))
> -		acc_global_max[what] = val;
> +	domain_acc_valid_max(d, what, val);
>   
>   	return val;
>   }
> @@ -1221,6 +1230,20 @@ void domain_reset_global_acc(void)
>   	hashtable_iterate(domhash, domain_reset_global_acc_sub, NULL);
>   }
>   
> +bool domain_max_chk(const struct connection *conn, enum accitem what,
> +		    unsigned int val, unsigned int quota)
> +{
> +	if (!conn || !conn->domain)
> +		return false;
> +
> +	if (domain_is_unprivileged(conn) && val > quota)
> +		return true;
> +
> +	domain_acc_valid_max(conn->domain, what, val);
> +
> +	return false;
> +}
> +
>   int domain_nbentry_inc(struct connection *conn, unsigned int domid)
>   {
>   	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index b55c9bcc2d..3e17b63659 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -32,6 +32,10 @@ enum accitem {
>   	ACC_OUTST,
>   	ACC_MEM,
>   	ACC_TRANS,
> +	ACC_TRANSNODES,
> +	ACC_NPERM,
> +	ACC_PATHLEN,
> +	ACC_NODESZ,
>   	ACC_N,			/* Number of elements per domain. */
>   };
>   
> @@ -128,6 +132,8 @@ void acc_drop(struct connection *conn);
>   void acc_commit(struct connection *conn);
>   int domain_max_global_acc(const void *ctx, struct connection *conn);
>   void domain_reset_global_acc(void);
> +bool domain_max_chk(const struct connection *conn, unsigned int what,
> +		    unsigned int val, unsigned int quota);
>   
>   /* Write rate limiting */
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 1c14b8579a..0b256f9b18 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -252,8 +252,8 @@ int access_node(struct connection *conn, struct node *node,
>   
>   	i = find_accessed_node(trans, node->name);
>   	if (!i) {
> -		if (trans->nodes >= quota_trans_nodes &&
> -		    domain_is_unprivileged(conn)) {
> +		if (domain_max_chk(conn, ACC_TRANSNODES, trans->nodes + 1,
> +				   quota_trans_nodes)) {
>   			ret = ENOSPC;
>   			goto err;
>   		}
> diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
> index e30cd89be3..61b1e3421e 100644
> --- a/tools/xenstore/xenstored_watch.c
> +++ b/tools/xenstore/xenstored_watch.c
> @@ -176,7 +176,7 @@ static int check_watch_path(struct connection *conn, const void *ctx,
>   		*path = canonicalize(conn, ctx, *path);
>   		if (!*path)
>   			return errno;
> -		if (!is_valid_nodename(*path))
> +		if (!is_valid_nodename(conn, *path))
>   			goto inval;
>   	}
>   

Cheers,

-- 
Julien Grall

