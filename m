Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D012A6527AF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467323.726376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7j1N-0006hd-1i; Tue, 20 Dec 2022 20:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467323.726376; Tue, 20 Dec 2022 20:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7j1M-0006eY-UT; Tue, 20 Dec 2022 20:15:28 +0000
Received: by outflank-mailman (input) for mailman id 467323;
 Tue, 20 Dec 2022 20:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7j1L-0006eS-Lw
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:15:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7j1K-00037c-Ri; Tue, 20 Dec 2022 20:15:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7j1K-0008RV-Ly; Tue, 20 Dec 2022 20:15:26 +0000
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
	bh=9y29kkmqSF4/DEuF7lisCiCReGpr1kRPfTzENj3yqqY=; b=TUfLlqI8+GQC6fcsg2/XDA8T6a
	h2ksb8cZzBqji9I7Ed6KIs+xBi6h+ytjYqgPlBDmAt0ajRvunQtfpIvrb6wyVbPP8QO9E+9rgM327
	A3nf/0s9H1u5numUokyN27p3DOE3BW1+BkjjK9lDXOekm5F3ER7vv9LYzGmebkiF6gvg=;
Message-ID: <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
Date: Tue, 20 Dec 2022 20:15:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2022 16:00, Juergen Gross wrote:
> Rework the interface and the internals of the per-domain node
> accounting:
> 
> - rename the functions to domain_nbentry_*() in order to better match
>    the related counter name
> 
> - switch from node pointer to domid as interface, as all nodes have the
>    owner filled in

The downside is now you have may place open-coding 
"...->perms->p[0].id". IHMO this is making the code more complicated. So 
can you introduce a few wrappers that would take a node and then convert 
to the owner?

> 
> - use a common internal function for adding a value to the counter
> 
> For the transaction case add a helper function to get the list head
> of the per-transaction changed domains, enabling to eliminate the
> transaction_entry_*() functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        |  22 ++---
>   tools/xenstore/xenstored_domain.c      | 122 +++++++++++--------------
>   tools/xenstore/xenstored_domain.h      |  10 +-
>   tools/xenstore/xenstored_transaction.c |  15 +--
>   tools/xenstore/xenstored_transaction.h |   7 +-
>   5 files changed, 72 insertions(+), 104 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index f96714e1b8..61569cecbb 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1459,7 +1459,7 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
>   static int destroy_node(struct connection *conn, struct node *node)
>   {
>   	destroy_node_rm(conn, node);
> -	domain_entry_dec(conn, node);
> +	domain_nbentry_dec(conn, node->perms.p[0].id);
>   
>   	/*
>   	 * It is not possible to easily revert the changes in a transaction.
> @@ -1498,7 +1498,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>   	for (i = node; i; i = i->parent) {
>   		/* i->parent is set for each new node, so check quota. */
>   		if (i->parent &&
> -		    domain_entry(conn) >= quota_nb_entry_per_domain) {
> +		    domain_nbentry(conn) >= quota_nb_entry_per_domain) {
>   			ret = ENOSPC;
>   			goto err;
>   		}
> @@ -1509,7 +1509,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>   
>   		/* Account for new node */
>   		if (i->parent) {
> -			if (domain_entry_inc(conn, i)) {
> +			if (domain_nbentry_inc(conn, i->perms.p[0].id)) {
>   				destroy_node_rm(conn, i);
>   				return NULL;
>   			}
> @@ -1662,7 +1662,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
>   	watch_exact = strcmp(root, node->name);
>   	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
>   
> -	domain_entry_dec(conn, node);
> +	domain_nbentry_dec(conn, node->perms.p[0].id);
>   
>   	return WALK_TREE_RM_CHILDENTRY;
>   }
> @@ -1802,25 +1802,25 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   		return EPERM;
>   
>   	old_perms = node->perms;
> -	domain_entry_dec(conn, node);
> +	domain_nbentry_dec(conn, node->perms.p[0].id);
>   	node->perms = perms;
> -	if (domain_entry_inc(conn, node)) {
> +	if (domain_nbentry_inc(conn, node->perms.p[0].id)) {
>   		node->perms = old_perms;
>   		/*
>   		 * This should never fail because we had a reference on the
>   		 * domain before and Xenstored is single-threaded.
>   		 */
> -		domain_entry_inc(conn, node);
> +		domain_nbentry_inc(conn, node->perms.p[0].id);
>   		return ENOMEM;
>   	}
>   
>   	if (write_node(conn, node, false)) {
>   		int saved_errno = errno;
>   
> -		domain_entry_dec(conn, node);
> +		domain_nbentry_dec(conn, node->perms.p[0].id);
>   		node->perms = old_perms;
>   		/* No failure possible as above. */
> -		domain_entry_inc(conn, node);
> +		domain_nbentry_inc(conn, node->perms.p[0].id);
>   
>   		errno = saved_errno;
>   		return errno;
> @@ -2392,7 +2392,7 @@ void setup_structure(bool live_update)
>   		manual_node("/tool/xenstored", NULL);
>   		manual_node("@releaseDomain", NULL);
>   		manual_node("@introduceDomain", NULL);
> -		domain_entry_fix(dom0_domid, 5, true);
> +		domain_nbentry_fix(dom0_domid, 5, true);
>   	}
>   
>   	check_store();
> @@ -3400,7 +3400,7 @@ void read_state_node(const void *ctx, const void *state)
>   	if (write_node_raw(NULL, &key, node, true))
>   		barf("write node error restoring node");
>   
> -	if (domain_entry_inc(&conn, node))
> +	if (domain_nbentry_inc(&conn, node->perms.p[0].id))
>   		barf("node accounting error restoring node");
>   
>   	talloc_free(node);
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 3216119e83..40b24056c5 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -249,7 +249,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
>   		domain->nbentry--;
>   		node->perms.p[0].id = priv_domid;
>   		node->acc.memory = 0;
> -		domain_entry_inc(NULL, node);
> +		domain_nbentry_inc(NULL, priv_domid);
>   		if (write_node_raw(NULL, &key, node, true)) {
>   			/* That's unfortunate. We only can try to continue. */
>   			syslog(LOG_ERR,
> @@ -559,7 +559,7 @@ int acc_fix_domains(struct list_head *head, bool update)
>   	int cnt;
>   
>   	list_for_each_entry(cd, head, list) {
> -		cnt = domain_entry_fix(cd->domid, cd->nbentry, update);
> +		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
>   		if (!update) {
>   			if (cnt >= quota_nb_entry_per_domain)
>   				return ENOSPC;
> @@ -604,18 +604,19 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
>   	return cd;
>   }
>   
> -int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
> -			unsigned int domid)
> +static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
> +			       unsigned int domid)
>   {
>   	struct changed_domain *cd;
>   
>   	cd = acc_get_changed_domain(ctx, head, domid);
>   	if (!cd)
> -		return errno;
> +		return 0;
>   
> +	errno = 0;
>   	cd->nbentry += val;
>   
> -	return 0;
> +	return cd->nbentry;

You just introduced this helper in the previous patch (i.e. #9). So can 
you get the interface correct from the start? This will make easier to 
review the series.

I don't mind too much if you add the static here. Although, it would 
have been nice if we avoid changing code just introduced.

>   }
>   
>   static void domain_conn_reset(struct domain *domain)
> @@ -988,30 +989,6 @@ void domain_deinit(void)
>   		xenevtchn_unbind(xce_handle, virq_port);
>   }
>   
> -int domain_entry_inc(struct connection *conn, struct node *node)
> -{
> -	struct domain *d;
> -	unsigned int domid;
> -
> -	if (!node->perms.p)
> -		return 0;
> -
> -	domid = node->perms.p[0].id;
> -
> -	if (conn && conn->transaction) {
> -		transaction_entry_inc(conn->transaction, domid);
> -	} else {
> -		d = (conn && domid == conn->id && conn->domain) ? conn->domain
> -		    : find_or_alloc_existing_domain(domid);
> -		if (d)
> -			d->nbentry++;
> -		else
> -			return ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
>   /*
>    * Check whether a domain was created before or after a specific generation
>    * count (used for testing whether a node permission is older than a domain).
> @@ -1079,62 +1056,67 @@ int domain_adjust_node_perms(struct node *node)
>   	return 0;
>   }
>   
> -void domain_entry_dec(struct connection *conn, struct node *node)
> +static int domain_nbentry_add(struct connection *conn, unsigned int domid,
> +			      int add, bool dom_exists)

The name of the variable suggests that that if it is false then it 
doesn't exists. However, looking at how you use it, it is more a "Can 
struct domain be allocated?". So I would rename it to 
"dom_alloc_allowed" or similar.

>   {
>   	struct domain *d;
> -	unsigned int domid;
> -
> -	if (!node->perms.p)
> -		return;
> +	struct list_head *head;
> +	int ret;
>   
> -	domid = node->perms.p ? node->perms.p[0].id : conn->id;
> +	if (conn && domid == conn->id && conn->domain)
> +		d = conn->domain;
> +	else if (dom_exists) {
> +		d = find_domain_struct(domid);
> +		if (!d) {
> +			errno = ENOENT;
> +			corrupt(conn, "Missing domain %u\n", domid);
> +			return -1;
> +		}
> +	} else {
> +		d = find_or_alloc_existing_domain(domid);
> +		if (!d) {
> +			errno = ENOMEM;
> +			return -1;
> +		}
> +	}
>   
>   	if (conn && conn->transaction) {
> -		transaction_entry_dec(conn->transaction, domid);
> -	} else {
> -		d = (conn && domid == conn->id && conn->domain) ? conn->domain
> -		    : find_domain_struct(domid);
> -		if (d) {
> -			d->nbentry--;
> -		} else {
> -			errno = ENOENT;
> -			corrupt(conn,
> -				"Node \"%s\" owned by non-existing domain %u\n",
> -				node->name, domid);
> +		head = transaction_get_changed_domains(conn->transaction);
> +		ret = acc_add_dom_nbentry(conn->transaction, head, add, domid);
> +		if (errno) {
> +			fail_transaction(conn->transaction);
> +			return -1;
>   		}
> +		return d->nbentry + ret;

It is not entirely clear why you are return "d->nbentry + ret" here. If 
it is ...

>   	}
> +
> +	d->nbentry += add;
> +
> +	return d->nbentry;
>   }
>   
> -int domain_entry_fix(unsigned int domid, int num, bool update)
> +int domain_nbentry_inc(struct connection *conn, unsigned int domid)
>   {
> -	struct domain *d;
> -	int cnt;
> +	return (domain_nbentry_add(conn, domid, 1, false) < 0) ? errno : 0;
> +}
>   
> -	if (update) {
> -		d = find_domain_struct(domid);
> -		assert(d);
> -	} else {
> -		/*
> -		 * We are called first with update == false in order to catch
> -		 * any error. So do a possible allocation and check for error
> -		 * only in this case, as in the case of update == true nothing
> -		 * can go wrong anymore as the allocation already happened.
> -		 */
> -		d = find_or_alloc_existing_domain(domid);
> -		if (!d)
> -			return -1;
> -	}
> +int domain_nbentry_dec(struct connection *conn, unsigned int domid)
> +{
> +	return (domain_nbentry_add(conn, domid, -1, true) < 0) ? errno : 0;

... to make sure domain_nbentry_add() is not returning a negative value. 
Then it would not work.

A good example imagine you have a transaction removing nodes from tree 
but not adding any. Then the "ret" would be negative.

Meanwhile the nodes are also removed outside of the transaction. So the 
sum of "d->nbentry + ret" would be negative resulting to a failure here.

Such change of behavior should pointed in the commit message. But then I 
am not convinced this should be part of this commit which is mainly 
reworking an interface (e.g. no functional change is expected).

Cheers,

-- 
Julien Grall

