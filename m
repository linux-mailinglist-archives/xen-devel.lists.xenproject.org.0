Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9274735D8C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 20:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551324.860822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJr1-0004Ox-Kf; Mon, 19 Jun 2023 18:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551324.860822; Mon, 19 Jun 2023 18:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJr1-0004MA-H9; Mon, 19 Jun 2023 18:43:55 +0000
Received: by outflank-mailman (input) for mailman id 551324;
 Mon, 19 Jun 2023 18:43:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBJr0-0004M4-Ch
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 18:43:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJqy-0005LQ-QB; Mon, 19 Jun 2023 18:43:52 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJqy-00033R-Hh; Mon, 19 Jun 2023 18:43:52 +0000
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
	bh=EHUQrVteVQhqlmGj5W2KN/bhKnvKeeOb5yihC+iWzY8=; b=3nlm4/UkqA4Vi1jgDfPfHAOhzT
	pUaNyEKFDVoVeChrQtJcJtvqzKkAjWKtxxH00dNIEdOGQvzsqJk4eG/gxUjQYFQbpoSmref34/1/T
	XxVQ7Pqe6YdiNqchA6QMFqyoRMeYcxVl+lrlx0Nnpbf3AULhg2RnvwkXdAr7G3lTizlA=;
Message-ID: <ddd6f5ca-f559-5b25-618f-723b3a1fb7a3@xen.org>
Date: Mon, 19 Jun 2023 19:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 01/11] tools/xenstore: explicitly specify create or modify
 for tdb_store()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> Instead of using TDB_REPLACE for either creating or modifying a TDB
> entry, use either TDB_INSERT or TDB_MODIFY when calling tdb_store().
> 
> At higher function levels use the abstract flag values NODE_CREATE
> and NODE_MODIFY.
> 
> This is for preparing to get rid of TDB.

IIUC, you want to make the change so don't need to check if the node 
exists when we are creating a new node. If so, isn't this change also 
beneficial for TDB?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        | 29 ++++++++++++++------------
>   tools/xenstore/xenstored_core.h        |  6 ++++--
>   tools/xenstore/xenstored_domain.c      |  2 +-
>   tools/xenstore/xenstored_transaction.c |  8 +++++--
>   4 files changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 31a862b715..90c0bc7423 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -601,7 +601,7 @@ static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
>   }
>   
>   int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
> -		 struct node_account_data *acc, bool no_quota_check)
> +		 struct node_account_data *acc, int flag, bool no_quota_check)

'int' is the wrong type for a flag.

Is flag only meant to have two values? If yes, then it would be best to 
switch to bool (with define if you still want explicit name).

If not, then I think this should be an enum.

Rather than bool, I would also be happy if you want enum with two values.

>   {
>   	struct xs_tdb_record_hdr *hdr = (void *)data->dptr;
>   	struct node_account_data old_acc = {};
> @@ -635,7 +635,8 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
>   	}
>   
>   	/* TDB should set errno, but doesn't even set ecode AFAICT. */
> -	if (tdb_store(tdb_ctx, *key, *data, TDB_REPLACE) != 0) {
> +	if (tdb_store(tdb_ctx, *key, *data,
> +		      (flag == NODE_CREATE) ? TDB_INSERT : TDB_MODIFY) != 0) {
>   		domain_memory_add_nochk(conn, new_domid,
>   					-data->dsize - key->dsize);
>   		/* Error path, so no quota check. */
> @@ -774,7 +775,7 @@ static bool read_node_can_propagate_errno(void)
>   }
>   
>   int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
> -		   bool no_quota_check)
> +		   int flag, bool no_quota_check)
>   {
>   	TDB_DATA data;
>   	void *p;
> @@ -812,7 +813,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
>   	p += node->datalen;
>   	memcpy(p, node->children, node->childlen);
>   
> -	if (do_tdb_write(conn, key, &data, &node->acc, no_quota_check))
> +	if (do_tdb_write(conn, key, &data, &node->acc, flag, no_quota_check))
>   		return EIO;
>   
>   	return 0;
> @@ -823,14 +824,14 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
>    * node->key. This can later be used if the change needs to be reverted.
>    */
>   static int write_node(struct connection *conn, struct node *node,
> -		      bool no_quota_check)
> +		      int flag, bool no_quota_check)
>   {
>   	int ret;
>   
>   	if (access_node(conn, node, NODE_ACCESS_WRITE, &node->key))
>   		return errno;
>   
> -	ret = write_node_raw(conn, &node->key, node, no_quota_check);
> +	ret = write_node_raw(conn, &node->key, node, flag, no_quota_check);
>   	if (ret && conn && conn->transaction) {
>   		/*
>   		 * Reverting access_node() is hard, so just fail the
> @@ -1496,7 +1497,8 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>   			goto err;
>   		}
>   
> -		ret = write_node(conn, i, false);
> +		ret = write_node(conn, i, i->parent ? NODE_CREATE : NODE_MODIFY,
> +				 false);
>   		if (ret)
>   			goto err;
>   
> @@ -1560,7 +1562,7 @@ static int do_write(const void *ctx, struct connection *conn,
>   	} else {
>   		node->data = in->buffer + offset;
>   		node->datalen = datalen;
> -		if (write_node(conn, node, false))
> +		if (write_node(conn, node, NODE_MODIFY, false))
>   			return errno;
>   	}
>   
> @@ -1610,7 +1612,7 @@ static int remove_child_entry(struct connection *conn, struct node *node,
>   	memdel(node->children, offset, childlen + 1, node->childlen);
>   	node->childlen -= childlen + 1;
>   
> -	return write_node(conn, node, true);
> +	return write_node(conn, node, NODE_MODIFY, true);
>   }
>   
>   static int delete_child(struct connection *conn,
> @@ -1807,7 +1809,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   	if (domain_nbentry_inc(conn, get_node_owner(node)))
>   		return ENOMEM;
>   
> -	if (write_node(conn, node, false))
> +	if (write_node(conn, node, NODE_MODIFY, false))
>   		return errno;
>   
>   	fire_watches(conn, ctx, name, node, false, &old_perms);
> @@ -2321,7 +2323,7 @@ static void manual_node(const char *name, const char *child)
>   	if (child)
>   		node->childlen = strlen(child) + 1;
>   
> -	if (write_node(NULL, node, false))
> +	if (write_node(NULL, node, NODE_CREATE, false))
>   		barf_perror("Could not create initial node %s", name);
>   	talloc_free(node);
>   }
> @@ -3469,12 +3471,13 @@ void read_state_node(const void *ctx, const void *state)
>   			barf("allocation error restoring node");
>   
>   		set_tdb_key(parentname, &key);
> -		if (write_node_raw(NULL, &key, parent, true))
> +		if (write_node_raw(NULL, &key, parent, NODE_MODIFY, true))
>   			barf("write parent error restoring node");
>   	}
>   
>   	set_tdb_key(name, &key);
> -	if (write_node_raw(NULL, &key, node, true))
> +	if (write_node_raw(NULL, &key, node,
> +			   strcmp(name, "/") ? NODE_CREATE : NODE_MODIFY, true))

I think a comment for the check would be useful. AFAUI, this is because 
"/" is always created before restoring the state.

>   		barf("write node error restoring node");
>   
>   	if (domain_nbentry_inc(&conn, get_node_owner(node)))
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 84a611cbb5..9291efec17 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -238,7 +238,9 @@ static inline unsigned int get_node_owner(const struct node *node)
>   
>   /* Write a node to the tdb data base. */
>   int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
> -		   bool no_quota_check);
> +		   int flag, bool no_quota_check);
> +#define NODE_CREATE 0
> +#define NODE_MODIFY 1
>   
>   /* Get a node from the tdb data base. */
>   struct node *read_node(struct connection *conn, const void *ctx,
> @@ -358,7 +360,7 @@ int remember_string(struct hashtable *hash, const char *str);
>   
>   void set_tdb_key(const char *name, TDB_DATA *key);
>   int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
> -		 struct node_account_data *acc, bool no_quota_check);
> +		 struct node_account_data *acc, int flag, bool no_quota_check);
>   int do_tdb_delete(struct connection *conn, TDB_DATA *key,
>   		  struct node_account_data *acc);
>   
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 60d3aa1ddb..7bc49ec97c 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -523,7 +523,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
>   		node->perms.p[0].id = priv_domid;
>   		node->acc.memory = 0;
>   		domain_nbentry_inc(NULL, priv_domid);
> -		if (write_node_raw(NULL, &key, node, true)) {
> +		if (write_node_raw(NULL, &key, node, NODE_MODIFY, true)) {
>   			/* That's unfortunate. We only can try to continue. */
>   			syslog(LOG_ERR,
>   			       "error when moving orphaned node %s to dom0\n",
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 334f1609f1..0655073de7 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -290,7 +290,8 @@ int access_node(struct connection *conn, struct node *node,
>   			i->check_gen = true;
>   			if (node->generation != NO_GENERATION) {
>   				set_tdb_key(i->trans_name, &local_key);
> -				ret = write_node_raw(conn, &local_key, node, true);
> +				ret = write_node_raw(conn, &local_key, node,
> +						     NODE_CREATE, true);
>   				if (ret)
>   					goto err;
>   				i->ta_node = true;
> @@ -363,6 +364,7 @@ static int finalize_transaction(struct connection *conn,
>   	TDB_DATA key, ta_key, data;
>   	struct xs_tdb_record_hdr *hdr;
>   	uint64_t gen;
> +	int flag;
>   
>   	list_for_each_entry_safe(i, n, &trans->accessed, list) {
>   		if (i->check_gen) {
> @@ -405,8 +407,10 @@ static int finalize_transaction(struct connection *conn,
>   					  ta_key.dsize + data.dsize);
>   				hdr = (void *)data.dptr;
>   				hdr->generation = ++generation;
> +				flag = (i->generation == NO_GENERATION)
> +				       ? NODE_CREATE : NODE_MODIFY;
>   				*is_corrupt |= do_tdb_write(conn, &key, &data,
> -							    NULL, true);
> +							    NULL, flag, true);
>   				talloc_free(data.dptr);
>   				if (do_tdb_delete(conn, &ta_key, NULL))
>   					*is_corrupt = true;

Cheers,

-- 
Julien Grall

