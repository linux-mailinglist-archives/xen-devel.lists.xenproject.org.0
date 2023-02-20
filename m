Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3DF69D6A7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 00:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498439.769320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUF8Y-0006bo-RQ; Mon, 20 Feb 2023 22:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498439.769320; Mon, 20 Feb 2023 22:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUF8Y-0006ZB-Og; Mon, 20 Feb 2023 22:59:58 +0000
Received: by outflank-mailman (input) for mailman id 498439;
 Mon, 20 Feb 2023 22:59:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUF8X-0006Z0-5h
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:59:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUF8W-0006Mi-FW; Mon, 20 Feb 2023 22:59:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUF8W-0000HG-AA; Mon, 20 Feb 2023 22:59:56 +0000
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
	bh=tQ4NbY+LiMHhPOMMU2aC2tHZpVLZ/60wRRM3PzucVPE=; b=3qRTSLjWpnq9l8Yd65VIWNhx3S
	A06P4Di0qy1FvIRN1C/zNaH9tXSH2WF1RgcY/Be63s1hlT/q4UeR/+GBxZ92hGqmaoYdpo/1/ALXq
	koMnpChjfbJt0eh8QCWaVTMcAasKR7s5BIyiI4NYTzgTad5KujLeHIha7J89hG9+sEbA=;
Message-ID: <0f78fffe-5e53-5881-b5ac-421d1faa5e99@xen.org>
Date: Mon, 20 Feb 2023 22:59:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 09/13] tools/xenstore: add TDB access trace support
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230120100028.11142-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/01/2023 10:00, Juergen Gross wrote:
> Add a new trace switch "tdb" and the related trace calls.
> 
> The "tdb" switch is off per default.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

With one remark (see below):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   tools/xenstore/xenstored_core.c        | 8 +++++++-
>   tools/xenstore/xenstored_core.h        | 6 ++++++
>   tools/xenstore/xenstored_transaction.c | 7 ++++++-
>   3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 558ef491b1..49e196e7ae 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -589,6 +589,8 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
>   		if (old_data.dptr == NULL) {
>   			acc->memory = 0;
>   		} else {
> +			trace_tdb("read %s size %zu\n", key->dptr,
> +				  old_data.dsize + key->dsize);
>   			hdr = (void *)old_data.dptr;
>   			acc->memory = old_data.dsize;
>   			acc->domid = hdr->perms[0].id;
> @@ -655,6 +657,7 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
>   		errno = EIO;
>   		return errno;
>   	}
> +	trace_tdb("store %s size %zu\n", key->dptr, data->dsize + key->dsize);
>   
>   	if (acc) {
>   		/* Don't use new_domid, as it might be a transaction node. */
> @@ -682,6 +685,7 @@ int do_tdb_delete(struct connection *conn, TDB_DATA *key,
>   		errno = EIO;
>   		return errno;
>   	}
> +	trace_tdb("delete %s\n", key->dptr);
>   
>   	if (acc->memory) {
>   		domid = get_acc_domid(conn, key, acc->domid);
> @@ -731,6 +735,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   		goto error;
>   	}
>   
> +	trace_tdb("read %s size %zu\n", key.dptr, data.dsize + key.dsize);
> +
>   	node->parent = NULL;
>   	talloc_steal(node, data.dptr);
>   
> @@ -2746,7 +2752,7 @@ static void set_quota(const char *arg, bool soft)
>   
>   /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
>   const char *const trace_switches[] = {
> -	"obj", "io", "wrl", "acc",
> +	"obj", "io", "wrl", "acc", "tdb",
>   	NULL
>   };
>   
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 3e0734a6c6..419a144396 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -303,8 +303,14 @@ extern unsigned int trace_flags;
>   #define TRACE_IO	0x00000002
>   #define TRACE_WRL	0x00000004
>   #define TRACE_ACC	0x00000008
> +#define TRACE_TDB	0x00000010
>   extern const char *const trace_switches[];
>   int set_trace_switch(const char *arg);

Add a newline here.

> +#define trace_tdb(...)				\
> +do {						\
> +	if (trace_flags & TRACE_TDB)		\
> +		trace("tdb: " __VA_ARGS__);	\
> +} while (0)
>   
>   extern TDB_CONTEXT *tdb_ctx;
>   extern int dom0_domid;
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 1aa9d3cb3d..19a1175d1b 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -366,8 +366,11 @@ static int finalize_transaction(struct connection *conn,
>   				if (tdb_error(tdb_ctx) != TDB_ERR_NOEXIST)
>   					return EIO;
>   				gen = NO_GENERATION;
> -			} else
> +			} else {
> +				trace_tdb("read %s size %zu\n", key.dptr,
> +					  key.dsize + data.dsize);
>   				gen = hdr->generation;
> +			}
>   			talloc_free(data.dptr);
>   			if (i->generation != gen)
>   				return EAGAIN;
> @@ -391,6 +394,8 @@ static int finalize_transaction(struct connection *conn,
>   			set_tdb_key(i->trans_name, &ta_key);
>   			data = tdb_fetch(tdb_ctx, ta_key);
>   			if (data.dptr) {
> +				trace_tdb("read %s size %zu\n", ta_key.dptr,
> +					  ta_key.dsize + data.dsize);
>   				hdr = (void *)data.dptr;
>   				hdr->generation = ++generation;
>   				*is_corrupt |= do_tdb_write(conn, &key, &data,

Cheers,

-- 
Julien Grall

