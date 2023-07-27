Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2A765E76
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571278.894755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8vP-0003Ob-7C; Thu, 27 Jul 2023 21:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571278.894755; Thu, 27 Jul 2023 21:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8vP-0003Ms-35; Thu, 27 Jul 2023 21:53:35 +0000
Received: by outflank-mailman (input) for mailman id 571278;
 Thu, 27 Jul 2023 21:53:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP8vN-0003Mi-I3
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:53:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8vM-0000or-Bg; Thu, 27 Jul 2023 21:53:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8vM-0002Pr-5o; Thu, 27 Jul 2023 21:53:32 +0000
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
	bh=TISJ2XuhdxJPN9lbAfjWf4Mb9yyp86YpyDdTAW16H7U=; b=Y/2HpGre8g+cFsM6kVEvegTLVg
	Lt8CUi4CvbcIMD23By7w4p5s19EmDaf3LSFo3wZ0+En7FTwrvqUeuUD5UDqXgSpIydgGHIgYd2uLN
	c+Xk/RDV99waAUGjKQrkPo3EKQ3pBBbKWR+X0egFkqPUVsqi4C7NEhaZaiN/ed4w5yvI=;
Message-ID: <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
Date: Thu, 27 Jul 2023 22:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <20230724110247.10520-18-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Struct xs_tdb_record_hdr is used for nodes stored in the data base.
> When working on a node, struct node is being used, which is including
> the same information as struct xs_tdb_record_hdr, but in a different
> format. Rework struct xs_tdb_record_hdr in order to prepare including
> it in struct node.
> 
> Do the following modifications:
> 
> - move its definition to xenstored_core.h, as the reason to put it into
>    utils.h are no longer existing
> 
> - rename it to struct node_hdr, as the "tdb" in its name has only
>    historical reasons
> 
> - replace the empty permission array at the end with a comment about
>    the layout of data in the data base (concatenation of header,
>    permissions, node contents, and children list)
> 
> - use narrower types for num_perms and datalen, as those are naturally
>    limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as it is
>    in theory basically unlimited)

The assumption is XENSTORE_PAYLOAD_MAX will never change and/or always 
apply for all the connection. I am aware of at least one downstream use 
where this is not the case.

I am happy to use narrower types, but I would at least like some checks 
in Xenstore to ensure the limits are not reached.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   tools/xenstore/utils.h                 |  9 -------
>   tools/xenstore/xenstored_core.c        | 35 +++++++++++++++-----------
>   tools/xenstore/xenstored_core.h        | 20 ++++++++++++++-
>   tools/xenstore/xenstored_transaction.c |  6 ++---
>   4 files changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
> index 028ecb9d7a..405d662ea2 100644
> --- a/tools/xenstore/utils.h
> +++ b/tools/xenstore/utils.h
> @@ -9,15 +9,6 @@
>   
>   #include "xenstore_lib.h"
>   
> -/* Header of the node record in tdb. */
> -struct xs_tdb_record_hdr {
> -	uint64_t generation;
> -	uint32_t num_perms;
> -	uint32_t datalen;
> -	uint32_t childlen;
> -	struct xs_permissions perms[0];
> -};
> -
>   /* Is A == B ? */
>   #define streq(a,b) (strcmp((a),(b)) == 0)
>   
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 1f5f118f1c..86b7c9bf36 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -555,9 +555,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   	}
>   }
>   
> -const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
> +const struct node_hdr *db_fetch(const char *db_name, size_t *size)
>   {
> -	struct xs_tdb_record_hdr *hdr;
> +	struct node_hdr *hdr;
>   
>   	hdr = hashtable_search(nodes, db_name);
>   	if (!hdr) {
> @@ -565,7 +565,7 @@ const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
>   		return NULL;
>   	}
>   
> -	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
> +	*size = sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
>   		hdr->datalen + hdr->childlen;
>   
>   	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
> @@ -573,10 +573,15 @@ const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
>   	return hdr;
>   }
>   
> +static struct xs_permissions *perms_from_node_hdr(const struct node_hdr *hdr)

I don't much like the casting-away the const here. Looking at the code, 
most of the users seems to not modify the value. So how about return 
const here and open-coding or casting-away the const in the caller (with 
a proper explanation)?

> +{
> +	return (struct xs_permissions *)(hdr + 1);
> +}
> +
>   static void get_acc_data(const char *name, struct node_account_data *acc)
>   {
>   	size_t size;
> -	const struct xs_tdb_record_hdr *hdr;
> +	const struct node_hdr *hdr;
>   
>   	if (acc->memory < 0) {
>   		hdr = db_fetch(name, &size);
> @@ -585,7 +590,7 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
>   			acc->memory = 0;
>   		} else {
>   			acc->memory = size;
> -			acc->domid = hdr->perms[0].id;
> +			acc->domid = perms_from_node_hdr(hdr)->id;
>   		}
>   	}
>   }
> @@ -606,7 +611,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
>   	     size_t size, struct node_account_data *acc,
>   	     enum write_node_mode mode, bool no_quota_check)
>   {
> -	const struct xs_tdb_record_hdr *hdr = data;
> +	const struct node_hdr *hdr = data;
>   	struct node_account_data old_acc = {};
>   	unsigned int old_domid, new_domid;
>   	size_t name_len = strlen(db_name);
> @@ -620,7 +625,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
>   
>   	get_acc_data(db_name, &old_acc);
>   	old_domid = get_acc_domid(conn, db_name, old_acc.domid);
> -	new_domid = get_acc_domid(conn, db_name, hdr->perms[0].id);
> +	new_domid = get_acc_domid(conn, db_name, perms_from_node_hdr(hdr)->id);
>   
>   	/*
>   	 * Don't check for ENOENT, as we want to be able to switch orphaned
> @@ -661,7 +666,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
>   
>   	if (acc) {
>   		/* Don't use new_domid, as it might be a transaction node. */
> -		acc->domid = hdr->perms[0].id;
> +		acc->domid = perms_from_node_hdr(hdr)->id;
>   		acc->memory = size;
>   	}
>   
> @@ -699,7 +704,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   		       const char *name)
>   {
>   	size_t size;
> -	const struct xs_tdb_record_hdr *hdr;
> +	const struct node_hdr *hdr;
>   	struct node *node;
>   	const char *db_name;
>   	int err;
> @@ -733,12 +738,12 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   	node->perms.num = hdr->num_perms;
>   	node->datalen = hdr->datalen;
>   	node->childlen = hdr->childlen;
> -	node->acc.domid = hdr->perms[0].id;
> +	node->acc.domid = perms_from_node_hdr(hdr)->id;
>   	node->acc.memory = size;
>   
>   	/* Copy node data to new memory area, starting with permissions. */
>   	size -= sizeof(*hdr);
> -	node->perms.p = talloc_memdup(node, hdr->perms, size);
> +	node->perms.p = talloc_memdup(node, perms_from_node_hdr(hdr), size);
>   	if (node->perms.p == NULL) {
>   		errno = ENOMEM;
>   		goto error;
> @@ -785,7 +790,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
>   	void *data;
>   	size_t size;
>   	void *p;
> -	struct xs_tdb_record_hdr *hdr;
> +	struct node_hdr *hdr;
>   
>   	if (domain_adjust_node_perms(node))
>   		return errno;
> @@ -812,9 +817,9 @@ int write_node_raw(struct connection *conn, const char *db_name,
>   	hdr->datalen = node->datalen;
>   	hdr->childlen = node->childlen;
>   
> -	memcpy(hdr->perms, node->perms.p,
> -	       node->perms.num * sizeof(*node->perms.p));
> -	p = hdr->perms + node->perms.num;
> +	p = perms_from_node_hdr(hdr);
> +	memcpy(p, node->perms.p, node->perms.num * sizeof(*node->perms.p));
> +	p += node->perms.num * sizeof(*node->perms.p);
>   	memcpy(p, node->data, node->datalen);
>   	p += node->datalen;
>   	memcpy(p, node->children, node->childlen);
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 6d1578ce97..c965709090 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -168,6 +168,24 @@ struct connection
>   };
>   extern struct list_head connections;
>   
> +/*
> + * Header of the node record in the data base.
> + * In the data base the memory of the node is a single memory chunk with the
> + * following format:
> + * struct {
> + *     node_hdr hdr;
> + *     struct xs_permissions perms[hdr.num_perms];
> + *     char data[hdr.datalen];
> + *     char children[hdr.childlen];
> + * };
> + */
> +struct node_hdr {
> +	uint64_t generation;
> +	uint16_t num_perms;

OOI, do you have a use case where a node would be shared with more than 
255 domains?

> +	uint16_t datalen;
> +	uint32_t childlen;
> +};
> +
>   struct node_perms {
>   	unsigned int num;
>   	struct xs_permissions *p;
> @@ -362,7 +380,7 @@ extern xengnttab_handle **xgt_handle;
>   int remember_string(struct hashtable *hash, const char *str);
>   
>   /* Data base access functions. */
> -const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
> +const struct node_hdr *db_fetch(const char *db_name, size_t *size);
>   int db_write(struct connection *conn, const char *db_name, const void *data,
>   	     size_t size, struct node_account_data *acc,
>   	     enum write_node_mode mode, bool no_quota_check);
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index a90283dcc5..9ca73b9874 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -357,7 +357,7 @@ static int finalize_transaction(struct connection *conn,
>   {
>   	struct accessed_node *i, *n;
>   	size_t size;
> -	const struct xs_tdb_record_hdr *hdr;
> +	const struct node_hdr *hdr;
>   	uint64_t gen;
>   
>   	list_for_each_entry_safe(i, n, &trans->accessed, list) {
> @@ -394,12 +394,12 @@ static int finalize_transaction(struct connection *conn,
>   				 * generation count.
>   				 */
>   				enum write_node_mode mode;
> -				struct xs_tdb_record_hdr *own;
> +				struct node_hdr *own;
>   
>   				talloc_increase_ref_count(hdr);
>   				db_delete(conn, i->trans_name, NULL);
>   
> -				own = (struct xs_tdb_record_hdr *)hdr;
> +				own = (struct node_hdr *)hdr;
>   				own->generation = ++generation;
>   				mode = (i->generation == NO_GENERATION)
>   				       ? NODE_CREATE : NODE_MODIFY;

Cheers,

-- 
Julien Grall

