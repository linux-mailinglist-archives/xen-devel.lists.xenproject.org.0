Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CA736AE3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551694.861343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZT9-0004bs-Po; Tue, 20 Jun 2023 11:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551694.861343; Tue, 20 Jun 2023 11:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZT9-0004Zz-Ls; Tue, 20 Jun 2023 11:24:19 +0000
Received: by outflank-mailman (input) for mailman id 551694;
 Tue, 20 Jun 2023 11:24:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBZT8-0004Zt-Gj
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:24:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZT7-0003vN-He; Tue, 20 Jun 2023 11:24:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZT7-0003tz-An; Tue, 20 Jun 2023 11:24:17 +0000
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
	bh=LmA1evkkjFRKhVJy6VrCUxPAIZvdf+LuM7r2+s9P2mo=; b=Lxou3yNLfXlPsd5Y6TdYiNGIkL
	BeikhnY8gRRAy/79iz4mKMYb4kvFgLs3/qX3K4g5hcdrvkKvPCYWfxahfuUHcsa+BOuAYEvro/81I
	hc5MOpZNwt8EbrWlbAMGnTLfyPRVb2z2/FTYBnZq4ZsGouzjkVeuCInqf59MJJFNgPQg=;
Message-ID: <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
Date: Tue, 20 Jun 2023 12:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index f7cb035f26..7fc6d73e5a 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -358,11 +358,12 @@ extern xengnttab_handle **xgt_handle;
>   
>   int remember_string(struct hashtable *hash, const char *str);
>   
> +/* Data base access functions. */
>   void set_tdb_key(const char *name, TDB_DATA *key);
>   int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
>   		 struct node_account_data *acc, int flag, bool no_quota_check);
> -int do_tdb_delete(struct connection *conn, TDB_DATA *key,
> -		  struct node_account_data *acc);
> +int db_delete(struct connection *conn, const char *name,
> +	      struct node_account_data *acc);
>   
>   void conn_free_buffered_data(struct connection *conn);
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 1646c07040..bf173f3d1d 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -385,8 +385,7 @@ static int finalize_transaction(struct connection *conn,
>   		/* Entries for unmodified nodes can be removed early. */
>   		if (!i->modified) {
>   			if (i->ta_node) {
> -				set_tdb_key(i->trans_name, &ta_key);
> -				if (do_tdb_delete(conn, &ta_key, NULL))
> +				if (db_delete(conn, i->trans_name, NULL))
>   					return EIO;
>   			}
>   			list_del(&i->list);
> @@ -395,21 +394,21 @@ static int finalize_transaction(struct connection *conn,
>   	}
>   
>   	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
> -		set_tdb_key(i->node, &key);

It is not clear to me why you are moving later the call to set_tdb_key() 
in this patch.

>   		if (i->ta_node) {
>   			set_tdb_key(i->trans_name, &ta_key);
>   			data = tdb_fetch(tdb_ctx, ta_key);
>   			if (data.dptr) {
> -				trace_tdb("read %s size %zu\n", ta_key.dptr,
> +				trace_tdb("read %s size %zu\n", i->trans_name,

This change seems unrelated to this patch.

>   					  ta_key.dsize + data.dsize);
>   				hdr = (void *)data.dptr;
>   				hdr->generation = ++generation;
>   				flag = (i->generation == NO_GENERATION)
>   				       ? NODE_CREATE : NODE_MODIFY;
> +				set_tdb_key(i->node, &key);
>   				*is_corrupt |= do_tdb_write(conn, &key, &data,
>   							    NULL, flag, true);
>   				talloc_free(data.dptr);
> -				if (do_tdb_delete(conn, &ta_key, NULL))
> +				if (db_delete(conn, i->trans_name, NULL))
>   					*is_corrupt = true;
>   			} else {
>   				*is_corrupt = true;
> @@ -422,7 +421,7 @@ static int finalize_transaction(struct connection *conn,
>   			 */
>   			*is_corrupt |= (i->generation == NO_GENERATION)
>   				       ? false
> -				       : do_tdb_delete(conn, &key, NULL);
> +				       : db_delete(conn, i->node, NULL);
>   		}
>   		if (i->fire_watch)
>   			fire_watches(conn, trans, i->node, NULL, i->watch_exact,
> @@ -439,15 +438,12 @@ static int destroy_transaction(void *_transaction)
>   {
>   	struct transaction *trans = _transaction;
>   	struct accessed_node *i;
> -	TDB_DATA key;
>   
>   	wrl_ntransactions--;
>   	trace_destroy(trans, "transaction");
>   	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
> -		if (i->ta_node) {
> -			set_tdb_key(i->trans_name, &key);
> -			do_tdb_delete(trans->conn, &key, NULL);
> -		}
> +		if (i->ta_node)
> +			db_delete(trans->conn, i->trans_name, NULL);
>   		list_del(&i->list);
>   		talloc_free(i);
>   	}

Cheers,

-- 
Julien Grall

