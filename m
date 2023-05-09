Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CDC6FCE03
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532445.828670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSQR-0005Jf-B0; Tue, 09 May 2023 18:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532445.828670; Tue, 09 May 2023 18:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSQR-0005Hm-7q; Tue, 09 May 2023 18:51:03 +0000
Received: by outflank-mailman (input) for mailman id 532445;
 Tue, 09 May 2023 18:51:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwSQQ-0005Hg-3V
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:51:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSQP-0000n0-G4; Tue, 09 May 2023 18:51:01 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSQP-0005s8-AH; Tue, 09 May 2023 18:51:01 +0000
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
	bh=739NiJzUDoX5x+NVpd1GQWU9M4J/I0b8LtRpGLWxTAg=; b=f4N5MU5Svkzj6iWljmmYGm+aR0
	whc1TjtlgkoZH5T8ziYH1NE+NZTECbpADCaY6RG2/vgYA8yEiMfc9BMND/nvyHQt5a7m/91t9o9Ui
	vHdmR7L9EgplP1m7MLKM/7J2Pur0Iu942X4SZp16iS1K5VV1IJ0cdn9eJW5itCqsH5Xk=;
Message-ID: <81b70f6b-2953-4d31-f25e-5c96fff50f60@xen.org>
Date: Tue, 9 May 2023 19:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 10/14] tools/xenstore: switch transaction accounting to
 generic accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> As transaction accounting is active for unprivileged domains only, it
> can easily be added to the generic per-domain accounting.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V5:
> - use list_empty(&conn->transaction_list) for detection of "no
>    transaction active" (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c        |  3 +--
>   tools/xenstore/xenstored_core.h        |  1 -
>   tools/xenstore/xenstored_domain.c      | 21 ++++++++++++++++++---
>   tools/xenstore/xenstored_domain.h      |  4 ++++
>   tools/xenstore/xenstored_transaction.c | 14 ++++++--------
>   5 files changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 3caf9e45dc..c98d30561f 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2087,7 +2087,7 @@ static void consider_message(struct connection *conn)
>   	 * stalled. This will ignore new requests until Live-Update happened
>   	 * or it was aborted.
>   	 */
> -	if (lu_is_pending() && conn->transaction_started == 0 &&
> +	if (lu_is_pending() && list_empty(&conn->transaction_list) &&
>   	    conn->in->hdr.msg.type == XS_TRANSACTION_START) {
>   		trace("Delaying transaction start for connection %p req_id %u\n",
>   		      conn, conn->in->hdr.msg.req_id);
> @@ -2194,7 +2194,6 @@ struct connection *new_connection(const struct interface_funcs *funcs)
>   	new->funcs = funcs;
>   	new->is_ignored = false;
>   	new->is_stalled = false;
> -	new->transaction_started = 0;
>   	INIT_LIST_HEAD(&new->out_list);
>   	INIT_LIST_HEAD(&new->acc_list);
>   	INIT_LIST_HEAD(&new->ref_list);
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 5a11dc1231..3564d85d7d 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -151,7 +151,6 @@ struct connection
>   	/* List of in-progress transactions. */
>   	struct list_head transaction_list;
>   	uint32_t next_transaction_id;
> -	unsigned int transaction_started;
>   	time_t ta_start_time;
>   
>   	/* List of delayed requests. */
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 03825ca24b..25c6d20036 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -417,12 +417,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   {
>   	struct domain *d = find_domain_struct(domid);
>   	char *resp;
> -	int ta;
>   
>   	if (!d)
>   		return ENOENT;
>   
> -	ta = d->conn ? d->conn->transaction_started : 0;
>   	resp = talloc_asprintf(ctx, "Domain %u:\n", domid);
>   	if (!resp)
>   		return ENOMEM;
> @@ -433,7 +431,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   
>   	ent(nodes, d->acc[ACC_NODES]);
>   	ent(watches, d->acc[ACC_WATCH]);
> -	ent(transactions, ta);
> +	ent(transactions, d->acc[ACC_TRANS]);
>   	ent(outstanding, d->acc[ACC_OUTST]);
>   	ent(memory, d->acc[ACC_MEM]);
>   
> @@ -1298,6 +1296,23 @@ void domain_outstanding_dec(struct connection *conn, unsigned int domid)
>   	domain_acc_add(conn, domid, ACC_OUTST, -1, true);
>   }
>   
> +void domain_transaction_inc(struct connection *conn)
> +{
> +	domain_acc_add(conn, conn->id, ACC_TRANS, 1, true);
> +}
> +
> +void domain_transaction_dec(struct connection *conn)
> +{
> +	domain_acc_add(conn, conn->id, ACC_TRANS, -1, true);
> +}
> +
> +unsigned int domain_transaction_get(struct connection *conn)
> +{
> +	return (domain_is_unprivileged(conn))
> +		? domain_acc_add(conn, conn->id, ACC_TRANS, 0, true)
> +		: 0;
> +}
> +
>   static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
>   static wrl_creditt wrl_config_rate           = WRL_RATE   * WRL_FACTOR;
>   static wrl_creditt wrl_config_dburst         = WRL_DBURST * WRL_FACTOR;
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index 086133407b..01b6f1861b 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -32,6 +32,7 @@ enum accitem {
>   	ACC_WATCH = ACC_TR_N,
>   	ACC_OUTST,
>   	ACC_MEM,
> +	ACC_TRANS,
>   	ACC_N,			/* Number of elements per domain. */
>   };
>   
> @@ -113,6 +114,9 @@ void domain_watch_dec(struct connection *conn);
>   int domain_watch(struct connection *conn);
>   void domain_outstanding_inc(struct connection *conn);
>   void domain_outstanding_dec(struct connection *conn, unsigned int domid);
> +void domain_transaction_inc(struct connection *conn);
> +void domain_transaction_dec(struct connection *conn);
> +unsigned int domain_transaction_get(struct connection *conn);
>   int domain_get_quota(const void *ctx, struct connection *conn,
>   		     unsigned int domid);
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 11c8bcec84..b9e9d76a1f 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -479,8 +479,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
>   	if (conn->transaction)
>   		return EBUSY;
>   
> -	if (domain_is_unprivileged(conn) &&
> -	    conn->transaction_started > quota_max_transaction)
> +	if (domain_transaction_get(conn) > quota_max_transaction)
>   		return ENOSPC;
>   
>   	/* Attach transaction to ctx for autofree until it's complete */
> @@ -502,12 +501,12 @@ int do_transaction_start(const void *ctx, struct connection *conn,
>   	} while (!IS_ERR(exists));
>   
>   	/* Now we own it. */

This comment now feels a bit misplaced. I think ...

> +	if (list_empty(&conn->transaction_list))
> +		conn->ta_start_time = time(NULL);
... the two lines should be added before.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

>   	list_add_tail(&trans->list, &conn->transaction_list);
>   	talloc_steal(conn, trans);
>   	talloc_set_destructor(trans, destroy_transaction);
> -	if (!conn->transaction_started)
> -		conn->ta_start_time = time(NULL);
> -	conn->transaction_started++;
> +	domain_transaction_inc(conn);
>   	wrl_ntransactions++;
>   
>   	snprintf(id_str, sizeof(id_str), "%u", trans->id);
> @@ -533,8 +532,8 @@ int do_transaction_end(const void *ctx, struct connection *conn,
>   
>   	conn->transaction = NULL;
>   	list_del(&trans->list);
> -	conn->transaction_started--;
> -	if (!conn->transaction_started)
> +	domain_transaction_dec(conn);
> +	if (list_empty(&conn->transaction_list))
>   		conn->ta_start_time = 0;
>   
>   	chk_quota = trans->node_created && domain_is_unprivileged(conn);
> @@ -588,7 +587,6 @@ void conn_delete_all_transactions(struct connection *conn)
>   
>   	assert(conn->transaction == NULL);
>   
> -	conn->transaction_started = 0;
>   	conn->ta_start_time = 0;
>   }
>   

Cheers,

-- 
Julien Grall

