Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819A6F4A3A
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 21:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528791.822378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvWm-00049S-6z; Tue, 02 May 2023 19:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528791.822378; Tue, 02 May 2023 19:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvWm-00046z-40; Tue, 02 May 2023 19:19:08 +0000
Received: by outflank-mailman (input) for mailman id 528791;
 Tue, 02 May 2023 19:19:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvWk-00046t-Jq
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 19:19:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvWk-0004GX-CF
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 19:19:06 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.27.23]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvWk-00068z-7D
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 19:19:06 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=EBnYYM8HG9bUiwwQLUhRg9xb2vnvYthtANZybEVBW+w=; b=OT1Pl1ozn/hkxMrVGH22QAUg6o
	2D2AwFJUyT/w7fWhH1JYZcd/rYPxIsRhaz4ep9xaq2jcXYKEK4wQm6XlTolkp/EZqiON11q+iVTix
	bggIHuaWi1LWGsOQLQFYsLm7RCDbg9nYoJRbEHa+BmmJWOIY/zMLsO6xWFtsu39fFMoQ=;
Message-ID: <5b61ce7e-639c-4f2d-6cb9-421679d30d9d@xen.org>
Date: Tue, 2 May 2023 20:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 10/13] tools/xenstore: switch transaction accounting to
 generic accounting
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/04/2023 08:03, Juergen Gross wrote:
> As transaction accounting is active for unprivileged domains only, it
> can easily be added to the generic per-domain accounting.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        |  3 +--
>   tools/xenstore/xenstored_core.h        |  1 -
>   tools/xenstore/xenstored_domain.c      | 21 ++++++++++++++++++---
>   tools/xenstore/xenstored_domain.h      |  4 ++++
>   tools/xenstore/xenstored_transaction.c | 12 +++++-------
>   5 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 2d481fcad9..88c569b7d5 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2083,7 +2083,7 @@ static void consider_message(struct connection *conn)
>   	 * stalled. This will ignore new requests until Live-Update happened
>   	 * or it was aborted.
>   	 */
> -	if (lu_is_pending() && conn->transaction_started == 0 &&
> +	if (lu_is_pending() && conn->ta_start_time == 0 &&

NIT: I know there are some places in the code checking for 
conn->ta_start_time == 0. But it feels like a better replacement to 
"conn->transaction_started" is "list_empty(...)".

I agree this is going to be more expensive. But you are switching the 
transaction accounting to a generic infrastructure which is pretty heavy 
compare to a simple addition/substraction. So I think a "list_empty()" 
would be OK here.

>   	    conn->in->hdr.msg.type == XS_TRANSACTION_START) {
>   		trace("Delaying transaction start for connection %p req_id %u\n",
>   		      conn, conn->in->hdr.msg.req_id);
> @@ -2190,7 +2190,6 @@ struct connection *new_connection(const struct interface_funcs *funcs)
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
> index 1caa60bb14..40bcc1dbfa 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -419,12 +419,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
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
> @@ -435,7 +433,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   
>   	ent(nodes, d->acc[ACC_NODES]);
>   	ent(watches, d->acc[ACC_WATCH]);
> -	ent(transactions, ta);
> +	ent(transactions, d->acc[ACC_TRANS]);
>   	ent(outstanding, d->acc[ACC_OUTST]);
>   	ent(memory, d->acc[ACC_MEM]);
>   
> @@ -1297,6 +1295,23 @@ void domain_outstanding_dec(struct connection *conn, unsigned int domid)
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
> index 0d61bf4344..abc766f343 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -31,6 +31,7 @@ enum accitem {
>   	ACC_WATCH = ACC_TR_N,
>   	ACC_OUTST,
>   	ACC_MEM,
> +	ACC_TRANS,
>   	ACC_N,			/* Number of elements per domain. */
>   };
>   
> @@ -112,6 +113,9 @@ void domain_watch_dec(struct connection *conn);
>   int domain_watch(struct connection *conn);
>   void domain_outstanding_inc(struct connection *conn, unsigned int domid);
>   void domain_outstanding_dec(struct connection *conn, unsigned int domid);
> +void domain_transaction_inc(struct connection *conn);
> +void domain_transaction_dec(struct connection *conn);
> +unsigned int domain_transaction_get(struct connection *conn);
>   int domain_get_quota(const void *ctx, struct connection *conn,
>   		     unsigned int domid);
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 11c8bcec84..1c14b8579a 100644
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
> @@ -505,9 +504,9 @@ int do_transaction_start(const void *ctx, struct connection *conn,
>   	list_add_tail(&trans->list, &conn->transaction_list);
>   	talloc_steal(conn, trans);
>   	talloc_set_destructor(trans, destroy_transaction);
> -	if (!conn->transaction_started)
> +	if (!conn->ta_start_time)

I think it would make more sense to move this if just before the 
list_add_tail() and use (list_empty()) for the checked. This would make 
the code more consistent...

>   		conn->ta_start_time = time(NULL);
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

... with this check and also easier to spot they are related.

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

