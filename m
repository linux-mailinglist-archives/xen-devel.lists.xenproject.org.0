Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E330B736CC2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551845.861592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb77-0003Om-SB; Tue, 20 Jun 2023 13:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551845.861592; Tue, 20 Jun 2023 13:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb77-0003Md-P1; Tue, 20 Jun 2023 13:09:41 +0000
Received: by outflank-mailman (input) for mailman id 551845;
 Tue, 20 Jun 2023 13:09:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBb76-0003MO-Ug
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBb76-0006Md-2D; Tue, 20 Jun 2023 13:09:40 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBb75-00088k-NU; Tue, 20 Jun 2023 13:09:39 +0000
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
	bh=30Af2gWNHxouc6996u7ibrcSH/xkCGbCHh1LyDr6d4k=; b=Tsjb/PR3pS7v1XdM3ykSgOI8z8
	njLSZaalL4bREgPMGycceJKHxkFw4qyp1d819g/f7dndSa3lnlFXH7YPnhzPz7IYIjEA99tC3lHAQ
	pxs/a0du7hCJfCkKm5MyBPbP6MM4hXbk3rP9/ng85spNhPOPOkEfDW1P2+0WmUIZ0Hno=;
Message-ID: <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
Date: Tue, 20 Jun 2023 14:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> Today all Xenstore nodes are stored in a TDB data base. This data base
> has several disadvantages:
> 
> - it is using a fixed sized hash table, resulting in high memory
>    overhead for small installations with only very few VMs, and a rather
>    large performance hit for systems with lots of VMs due to many
>    collisions
> 
> - Xenstore is only single-threaded, while TDB is designed to be fit
>    for multi-threaded use cases, resulting in much higher code
>    complexity than needed
> 
> - special use cases of Xenstore are not possible to implement with TDB
>    in an effective way, while an implementation of a data base tailored
>    for Xenstore could simplify some handling (e.g. transactions) a lot
> 
> So drop using TDB and store the nodes directly in memory making them
> easily accessible. Use a hash-based lookup mechanism for fast lookup
> of nodes by their full path.
> 
> For now only replace TDB keeping the current access functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        | 153 ++++++++++---------------
>   tools/xenstore/xenstored_core.h        |   5 +-
>   tools/xenstore/xenstored_transaction.c |   1 -
>   3 files changed, 62 insertions(+), 97 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 12c584f09b..9b44de9d31 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -53,7 +53,6 @@
>   #include "xenstored_domain.h"
>   #include "xenstored_control.h"
>   #include "xenstored_lu.h"
> -#include "tdb.h"
>   
>   #ifndef NO_SOCKETS
>   #if defined(HAVE_SYSTEMD)
> @@ -85,7 +84,7 @@ bool keep_orphans = false;
>   static int reopen_log_pipe[2];
>   static int reopen_log_pipe0_pollfd_idx = -1;
>   char *tracefile = NULL;
> -static TDB_CONTEXT *tdb_ctx = NULL;
> +static struct hashtable *nodes;
>   unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
>   
>   static const char *sockmsg_string(enum xsd_sockmsg_type type);
> @@ -556,28 +555,29 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   	}
>   }
>   
> -static void set_tdb_key(const char *name, TDB_DATA *key)
> -{
> -	/*
> -	 * Dropping const is fine here, as the key will never be modified
> -	 * by TDB.
> -	 */
> -	key->dptr = (char *)name;
> -	key->dsize = strlen(name);
> -}
> -
>   void *db_fetch(const char *db_name, size_t *size)
>   {
> -	TDB_DATA key, data;
> +	struct xs_tdb_record_hdr *hdr;

AFAICT, this could be const.

> +	void *p;

p will point to xs_tdb_record_hdr, right? If so, I think it should be 
xs_tdb_record_hdr.

>   
> -	set_tdb_key(db_name, &key);
> -	data = tdb_fetch(tdb_ctx, key);
> -	if (!data.dptr)
> -		errno = (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) ? ENOENT : EIO;
> -	else
> -		*size = data.dsize;
> +	hdr = hashtable_search(nodes, db_name);
> +	if (!hdr) {
> +		errno = ENOENT;
> +		return NULL;
> +	}
> +
> +	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
> +		hdr->datalen + hdr->childlen;

AFAICT, this is the same computation as in write_node_raw. Can we 
introduce a wrapper for it?

> +
> +	p = talloc_size(NULL, *size);
> +	if (!p) {
> +		errno = ENOMEM;
> +		return NULL;
> +	}
>   
> -	return data.dptr;
> +	memcpy(p, hdr, *size);

It would be a good opportunity to explain the reasoning behind returning 
a fresh value rather than a pointer on the DB entry.

> +
> +	return p;
>   }
>   
>   static void get_acc_data(const char *name, struct node_account_data *acc)
> @@ -621,12 +621,10 @@ int db_write(struct connection *conn, const char *db_name, void *data,
>   	struct xs_tdb_record_hdr *hdr = data;
>   	struct node_account_data old_acc = {};
>   	unsigned int old_domid, new_domid;
> +	size_t name_len = strlen(db_name);
> +	const char *name;
>   	int ret;
> -	TDB_DATA key, dat;
>   
> -	set_tdb_key(db_name, &key);
> -	dat.dptr = data;
> -	dat.dsize = size;
>   	if (!acc)
>   		old_acc.memory = -1;
>   	else
> @@ -642,29 +640,36 @@ int db_write(struct connection *conn, const char *db_name, void *data,
>   	 */
>   	if (old_acc.memory)
>   		domain_memory_add_nochk(conn, old_domid,
> -					-old_acc.memory - key.dsize);
> -	ret = domain_memory_add(conn, new_domid, size + key.dsize,
> +					-old_acc.memory - name_len);
> +	ret = domain_memory_add(conn, new_domid, size + name_len,
>   				no_quota_check);
>   	if (ret) {
>   		/* Error path, so no quota check. */
>   		if (old_acc.memory)
>   			domain_memory_add_nochk(conn, old_domid,
> -						old_acc.memory + key.dsize);
> +						old_acc.memory + name_len);
>   		return ret;
>   	}
>   
> -	/* TDB should set errno, but doesn't even set ecode AFAICT. */
> -	if (tdb_store(tdb_ctx, key, dat,
> -		      (flag == NODE_CREATE) ? TDB_INSERT : TDB_MODIFY) != 0) {
> -		domain_memory_add_nochk(conn, new_domid, -size - key.dsize);
> +	if (flag == NODE_CREATE) {
> +		/* db_name could be modified later, so allocate a copy. */
> +		name = talloc_strdup(data, db_name);
> +		ret = name ? hashtable_add(nodes, name, data) : ENOMEM;
> +	} else
> +		ret = hashtable_replace(nodes, db_name, data);
> +
> +	if (ret) {
> +		/* Free data, as it isn't owned by hashtable now. */
> +		talloc_free(data);
> +		domain_memory_add_nochk(conn, new_domid, -size - name_len);
>   		/* Error path, so no quota check. */
>   		if (old_acc.memory)
>   			domain_memory_add_nochk(conn, old_domid,
> -						old_acc.memory + key.dsize);
> -		errno = EIO;
> +						old_acc.memory + name_len);
> +		errno = ret;
>   		return errno;
>   	}
> -	trace_tdb("store %s size %zu\n", db_name, size + key.dsize);
> +	trace_tdb("store %s size %zu\n", db_name, size + name_len);
>   
>   	if (acc) {
>   		/* Don't use new_domid, as it might be a transaction node. */
> @@ -680,9 +685,6 @@ int db_delete(struct connection *conn, const char *name,

AFAICT, we will always return 0 after this patch. Do you plan to 
clean-up the return type?

>   {
>   	struct node_account_data tmp_acc;
>   	unsigned int domid;
> -	TDB_DATA key;
> -
> -	set_tdb_key(name, &key);
>   
>   	if (!acc) {
>   		acc = &tmp_acc;
> @@ -691,15 +693,13 @@ int db_delete(struct connection *conn, const char *name,
>   
>   	get_acc_data(name, acc);
>   
> -	if (tdb_delete(tdb_ctx, key)) {
> -		errno = EIO;
> -		return errno;
> -	}
> +	hashtable_remove(nodes, name);
>   	trace_tdb("delete %s\n", name);
>   
>   	if (acc->memory) {
>   		domid = get_acc_domid(conn, name, acc->domid);
> -		domain_memory_add_nochk(conn, domid, -acc->memory - key.dsize);
> +		domain_memory_add_nochk(conn, domid,
> +					-acc->memory - strlen(name));
>   	}
>   
>   	return 0;
> @@ -2352,43 +2352,29 @@ static void manual_node(const char *name, const char *child)
>   	talloc_free(node);
>   }
>   
> -static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
> +static unsigned int hash_from_key_fn(const void *k)
>   {
> -	va_list ap;
> -	char *s;
> -	int saved_errno = errno;
> +	const char *str = k;
> +	unsigned int hash = 5381;
> +	char c;
>   
> -	va_start(ap, fmt);
> -	s = talloc_vasprintf(NULL, fmt, ap);
> -	va_end(ap);
> +	while ((c = *str++))
> +		hash = ((hash << 5) + hash) + (unsigned int)c;
>   
> -	if (s) {
> -		trace("TDB: %s\n", s);
> -		syslog(LOG_ERR, "TDB: %s",  s);
> -		if (verbose)
> -			xprintf("TDB: %s", s);
> -		talloc_free(s);
> -	} else {
> -		trace("talloc failure during logging\n");
> -		syslog(LOG_ERR, "talloc failure during logging\n");
> -	}
> +	return hash;
> +}
>   
> -	errno = saved_errno;
> +static int keys_equal_fn(const void *key1, const void *key2)
> +{
> +	return 0 == strcmp(key1, key2);
>   }
>   
>   void setup_structure(bool live_update)
>   {
> -	char *tdbname;
> -
> -	tdbname = talloc_strdup(talloc_autofree_context(), "/dev/mem");
> -	if (!tdbname)
> -		barf_perror("Could not create tdbname");
> -
> -	tdb_ctx = tdb_open_ex(tdbname, 7919, TDB_INTERNAL | TDB_NOLOCK,
> -			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
> -			      0640, &tdb_logger, NULL);
> -	if (!tdb_ctx)
> -		barf_perror("Could not create tdb file %s", tdbname);
> +	nodes = create_hashtable(NULL, "nodes", hash_from_key_fn, keys_equal_fn,
> +				 HASHTABLE_FREE_KEY | HASHTABLE_FREE_VALUE);
> +	if (!nodes)
> +		barf_perror("Could not create nodes hashtable");
>   
>   	if (live_update)
>   		manual_node("/", NULL);
> @@ -2402,24 +2388,6 @@ void setup_structure(bool live_update)
>   	}
>   }
>   
> -static unsigned int hash_from_key_fn(const void *k)
> -{
> -	const char *str = k;
> -	unsigned int hash = 5381;
> -	char c;
> -
> -	while ((c = *str++))
> -		hash = ((hash << 5) + hash) + (unsigned int)c;
> -
> -	return hash;
> -}
> -
> -
> -static int keys_equal_fn(const void *key1, const void *key2)
> -{
> -	return 0 == strcmp(key1, key2);
> -}
> -
>   int remember_string(struct hashtable *hash, const char *str)
>   {
>   	char *k = talloc_strdup(NULL, str);
> @@ -2479,12 +2447,11 @@ static int check_store_enoent(const void *ctx, struct connection *conn,
>   /**
>    * Helper to clean_store below.
>    */
> -static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
> -			void *private)
> +static int clean_store_(const void *key, void *val, void *private)
>   {
>   	struct hashtable *reachable = private;
>   	char *slash;
> -	char * name = talloc_strndup(NULL, key.dptr, key.dsize);
> +	char *name = talloc_strdup(NULL, key);
>   
>   	if (!name) {
>   		log("clean_store: ENOMEM");
> @@ -2514,7 +2481,7 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
>    */
>   static void clean_store(struct check_store_data *data)
>   {
> -	tdb_traverse(tdb_ctx, &clean_store_, data->reachable);
> +	hashtable_iterate(nodes, clean_store_, data->reachable);
>   	domain_check_acc(data->domains);
>   }
>   
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index e922dce775..63c2110135 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -33,7 +33,6 @@
>   #include "xenstore_lib.h"
>   #include "xenstore_state.h"
>   #include "list.h"
> -#include "tdb.h"
>   #include "hashtable.h"
>   
>   #ifndef O_CLOEXEC
> @@ -236,13 +235,13 @@ static inline unsigned int get_node_owner(const struct node *node)
>   	return node->perms.p[0].id;
>   }
>   
> -/* Write a node to the tdb data base. */
> +/* Write a node to the data base. */
>   int write_node_raw(struct connection *conn, const char *db_name,
>   		   struct node *node, int flag, bool no_quota_check);
>   #define NODE_CREATE 0
>   #define NODE_MODIFY 1
>   
> -/* Get a node from the tdb data base. */
> +/* Get a node from the data base. */
>   struct node *read_node(struct connection *conn, const void *ctx,
>   		       const char *name);
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index c51edf432f..21700c2e84 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -403,7 +403,6 @@ static int finalize_transaction(struct connection *conn,
>   				       ? NODE_CREATE : NODE_MODIFY;
>   				*is_corrupt |= db_write(conn, i->node, data,
>   							size, NULL, flag, true);
> -				talloc_free(data);

It is not clear to me why this free was removed.

>   				if (db_delete(conn, i->trans_name, NULL))
>   					*is_corrupt = true;
>   			} else {

Cheers,

-- 
Julien Grall

