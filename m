Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D8758691
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 23:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565501.883687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrxM-0001dS-2r; Tue, 18 Jul 2023 21:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565501.883687; Tue, 18 Jul 2023 21:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrxM-0001Zk-0A; Tue, 18 Jul 2023 21:10:04 +0000
Received: by outflank-mailman (input) for mailman id 565501;
 Tue, 18 Jul 2023 21:10:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLrxL-0001Qw-Bm
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 21:10:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrxK-0004WH-5n; Tue, 18 Jul 2023 21:10:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrxK-0007qW-0O; Tue, 18 Jul 2023 21:10:02 +0000
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
	bh=E1FVtb8DlyFsQZcfojJ/HfCp09E2q897nlhML+T790g=; b=aJ/wlGN/l66tkkhDikBZ/F5m6S
	qzFdHrEtlxuDxDZAtq5WhdGjMWFzmYhN7qHWJnXpcVIrbddXX69rJ4DppWlhkcAEvPOUKIAlD1DjC
	0tHvEOnPPOIXEIEUB8NyZeCskrpqCCE5cMTECydLM/UvBQmDWb3aD+mU4ryaEWvnjCKU=;
Message-ID: <e68b7364-545b-ff31-3371-3a682603ead7@xen.org>
Date: Tue, 18 Jul 2023 22:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 14/18] tools/xenstore: move copying of node data out of
 db_fetch()
In-Reply-To: <20230710065947.4201-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Today the node data is copied in db_fetch() on each data base read in
> order to avoid accidental data base modifications when working on a
> node.
> 
> read_node() is the only caller of db_fetch() which isn't freeing the
> returned data area immediately after using it. The other callers don't
> modify the returned data, so they don't need the data to be copied.

This reads as the return value of db_fetch() should be const. This will 
at least make more obvious to the caller that the value is not supposed 
to be modified.

> 
> Move copying of the data into read_node(), resulting in a speedup of
> the other callers due to no memory allocation and no copying being
> needed anymore.
> 
> As db_fetch() can't return any error other than ENOENT now, error
> handling for the callers can be simplified.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   tools/xenstore/xenstored_core.c        | 41 ++++++++++----------------
>   tools/xenstore/xenstored_transaction.c |  3 --
>   2 files changed, 16 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 11da470b20..d5c9054fe9 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -557,8 +557,7 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   
>   struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
>   {
> -	const struct xs_tdb_record_hdr *hdr;
> -	struct xs_tdb_record_hdr *p;
> +	struct xs_tdb_record_hdr *hdr;
>   
>   	hdr = hashtable_search(nodes, db_name);
>   	if (!hdr) {
> @@ -569,18 +568,9 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
>   	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
>   		hdr->datalen + hdr->childlen;
>   
> -	p = talloc_size(NULL, *size);
> -	if (!p) {
> -		errno = ENOMEM;
> -		return NULL;
> -	}
> -
>   	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
>   
> -	/* Return a copy, avoiding a potential modification in the DB. */
> -	memcpy(p, hdr, *size);
> -
> -	return p;
> +	return hdr;
>   }
>   
>   static void get_acc_data(const char *name, struct node_account_data *acc)
> @@ -597,7 +587,6 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
>   			acc->memory = size;
>   			acc->domid = hdr->perms[0].id;
>   		}
> -		talloc_free(hdr);
>   	}
>   }
>   
> @@ -731,30 +720,32 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   	hdr = db_fetch(db_name, &size);
>   
>   	if (hdr == NULL) {
> -		if (errno == ENOENT) {
> -			node->generation = NO_GENERATION;
> -			err = access_node(conn, node, NODE_ACCESS_READ, NULL);
> -			errno = err ? : ENOENT;
> -		} else {
> -			log("DB error on read: %s", strerror(errno));
> -			errno = EIO;
> -		}
> +		node->generation = NO_GENERATION;
> +		err = access_node(conn, node, NODE_ACCESS_READ, NULL);
> +		errno = err ? : ENOENT;
>   		goto error;
>   	}
>   
>   	node->parent = NULL;
> -	talloc_steal(node, hdr);
>   
>   	/* Datalen, childlen, number of permissions */
>   	node->generation = hdr->generation;
>   	node->perms.num = hdr->num_perms;
>   	node->datalen = hdr->datalen;
>   	node->childlen = hdr->childlen;
> +	node->acc.domid = hdr->perms[0].id;
> +	node->acc.memory = size;
> +
> +	/* Copy node data to new memory area, starting with permissions. */
> +	size -= sizeof(*hdr);
> +	node->perms.p = talloc_size(node, size);
> +	if (node->perms.p == NULL) {
> +		errno = ENOMEM;
> +		goto error;
> +	}
> +	memcpy(node->perms.p, hdr->perms, size);
>   
>   	/* Permissions are struct xs_permissions. */

Is this comment still relevant?

> -	node->perms.p = hdr->perms;
> -	node->acc.domid = get_node_owner(node);
> -	node->acc.memory = size;
>   	if (domain_adjust_node_perms(node))
>   		goto error;
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 5d7da82aad..e3e05a1d84 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -365,13 +365,10 @@ static int finalize_transaction(struct connection *conn,
>   		if (i->check_gen) {
>   			hdr = db_fetch(i->node, &size);
>   			if (!hdr) {
> -				if (errno != ENOENT)
> -					return errno;
>   				gen = NO_GENERATION;
>   			} else {
>   				gen = hdr->generation;
>   			}
> -			talloc_free(hdr);
>   			if (i->generation != gen)
>   				return EAGAIN;
>   		}

Cheers,

-- 
Julien Grall

