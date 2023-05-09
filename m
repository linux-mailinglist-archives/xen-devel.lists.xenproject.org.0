Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694F6FCDFF
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532441.828661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSOA-0003vc-V1; Tue, 09 May 2023 18:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532441.828661; Tue, 09 May 2023 18:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSOA-0003sZ-SF; Tue, 09 May 2023 18:48:42 +0000
Received: by outflank-mailman (input) for mailman id 532441;
 Tue, 09 May 2023 18:48:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwSO9-0003sR-VU
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:48:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSO9-0000kJ-BN; Tue, 09 May 2023 18:48:41 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSO9-0005qs-5m; Tue, 09 May 2023 18:48:41 +0000
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
	bh=Mt0OIZGEiU3mU2IsfnTro9G8M3qLcOeJASvvzdcfPCQ=; b=Zg1pXIZnGfMrXU3u6Hnf2iLLXu
	xYvwWe0M0cPG9IEIIqiZFwUBwczt0Fr2wObn9jt+FaNSiorfBYlFmIEZKgbxwzrGrz3kvQ6EcrDML
	JxIQ2vGN08BS0VB8US3tiNHH5tmI2gdjkZ28uikR9i5SSCBBwiYE2hAwc9vtSTP5IEa8=;
Message-ID: <0398e6f6-c2c5-9329-627d-2dfaa818e406@xen.org>
Date: Tue, 9 May 2023 19:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 07/14] tools/xenstore: use accounting data array for
 per-domain values
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/05/2023 12:47, Juergen Gross wrote:
> Add the accounting of per-domain usage of Xenstore memory, watches, and
> outstanding requests to the array based mechanism.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> V5:
> - drop domid parameter from domain_outstanding_inc() (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c   |   4 +-
>   tools/xenstore/xenstored_domain.c | 109 +++++++++++-------------------
>   tools/xenstore/xenstored_domain.h |   8 ++-
>   3 files changed, 48 insertions(+), 73 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 4d1debeba1..e7f86f9487 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -255,7 +255,7 @@ static void free_buffered_data(struct buffered_data *out,
>   			req->pend.ref.event_cnt--;
>   			if (!req->pend.ref.event_cnt && !req->on_out_list) {
>   				if (req->on_ref_list) {
> -					domain_outstanding_domid_dec(
> +					domain_outstanding_dec(conn,
>   						req->pend.ref.domid);
>   					list_del(&req->list);
>   				}
> @@ -271,7 +271,7 @@ static void free_buffered_data(struct buffered_data *out,
>   		out->on_ref_list = true;
>   		return;
>   	} else
> -		domain_outstanding_dec(conn);
> +		domain_outstanding_dec(conn, conn->id);
>   
>   	talloc_free(out);
>   }
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 7770c4f395..a35ed97fd7 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -72,19 +72,12 @@ struct domain
>   	/* Accounting data for this domain. */
>   	unsigned int acc[ACC_N];
>   
> -	/* Amount of memory allocated for this domain. */
> -	int memory;
> +	/* Memory quota data for this domain. */
>   	bool soft_quota_reported;
>   	bool hard_quota_reported;
>   	time_t mem_last_msg;
>   #define MEM_WARN_MINTIME_SEC 10
>   
> -	/* number of watch for this domain */
> -	int nbwatch;
> -
> -	/* Number of outstanding requests. */
> -	int nboutstanding;
> -
>   	/* write rate limit */
>   	wrl_creditt wrl_credit; /* [ -wrl_config_writecost, +_dburst ] */
>   	struct wrl_timestampt wrl_timestamp;
> @@ -200,14 +193,15 @@ static bool domain_can_write(struct connection *conn)
>   
>   static bool domain_can_read(struct connection *conn)
>   {
> -	struct xenstore_domain_interface *intf = conn->domain->interface;
> +	struct domain *domain = conn->domain;
> +	struct xenstore_domain_interface *intf = domain->interface;
>   
>   	if (domain_is_unprivileged(conn)) {
> -		if (conn->domain->wrl_credit < 0)
> +		if (domain->wrl_credit < 0)
>   			return false;
> -		if (conn->domain->nboutstanding >= quota_req_outstanding)
> +		if (domain->acc[ACC_OUTST] >= quota_req_outstanding)
>   			return false;
> -		if (conn->domain->memory >= quota_memory_per_domain_hard &&
> +		if (domain->acc[ACC_MEM] >= quota_memory_per_domain_hard &&
>   		    quota_memory_per_domain_hard)
>   			return false;
>   	}
> @@ -438,10 +432,10 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>   	if (!resp) return ENOMEM
>   
>   	ent(nodes, d->acc[ACC_NODES]);
> -	ent(watches, d->nbwatch);
> +	ent(watches, d->acc[ACC_WATCH]);
>   	ent(transactions, ta);
> -	ent(outstanding, d->nboutstanding);
> -	ent(memory, d->memory);
> +	ent(outstanding, d->acc[ACC_OUTST]);
> +	ent(memory, d->acc[ACC_MEM]);
>   
>   #undef ent
>   
> @@ -1187,14 +1181,16 @@ unsigned int domain_nbentry(struct connection *conn)
>   	       ? domain_acc_add(conn, conn->id, ACC_NODES, 0, true) : 0;
>   }
>   
> -static bool domain_chk_quota(struct domain *domain, int mem)
> +static bool domain_chk_quota(struct connection *conn, unsigned int mem)
>   {
>   	time_t now;
> +	struct domain *domain;
>   
> -	if (!domain || !domid_is_unprivileged(domain->domid) ||
> -	    (domain->conn && domain->conn->is_ignored))
> +	if (!conn || !domid_is_unprivileged(conn->id) ||
> +	    conn->is_ignored)
>   		return false;
>   
> +	domain = conn->domain;
>   	now = time(NULL);
>   
>   	if (mem >= quota_memory_per_domain_hard &&
> @@ -1239,80 +1235,57 @@ static bool domain_chk_quota(struct domain *domain, int mem)
>   int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
>   		      bool no_quota_check)
>   {
> -	struct domain *domain;
> +	int ret;
>   
> -	domain = find_domain_struct(domid);
> -	if (domain) {
> -		/*
> -		 * domain_chk_quota() will print warning and also store whether
> -		 * the soft/hard quota has been hit. So check no_quota_check
> -		 * *after*.
> -		 */
> -		if (domain_chk_quota(domain, domain->memory + mem) &&
> -		    !no_quota_check)
> -			return ENOMEM;
> -		domain->memory += mem;
> -	} else {
> -		/*
> -		 * The domain the memory is to be accounted for should always
> -		 * exist, as accounting is done either for a domain related to
> -		 * the current connection, or for the domain owning a node
> -		 * (which is always existing, as the owner of the node is
> -		 * tested to exist and deleted or replaced by domid 0 if not).
> -		 * So not finding the related domain MUST be an error in the
> -		 * data base.
> -		 */
> -		errno = ENOENT;
> -		corrupt(NULL, "Accounting called for non-existing domain %u\n",
> -			domid);
> -		return ENOENT;
> -	}
> +	ret = domain_acc_add(conn, domid, ACC_MEM, 0, true);
> +	if (ret < 0)
> +		return -ret;
> +
> +	/*
> +	 * domain_chk_quota() will print warning and also store whether the
> +	 * soft/hard quota has been hit. So check no_quota_check *after*.
> +	 */
> +	if (domain_chk_quota(conn, ret + mem) && !no_quota_check)
> +		return ENOMEM;
> +
> +	/*
> +	 * The domain the memory is to be accounted for should always exist,
> +	 * as accounting is done either for a domain related to the current
> +	 * connection, or for the domain owning a node (which is always
> +	 * existing, as the owner of the node is tested to exist and deleted
> +	 * or replaced by domid 0 if not).
> +	 * So not finding the related domain MUST be an error in the data base.
> +	 */
> +	domain_acc_add(conn, domid, ACC_MEM, mem, true);
>   
>   	return 0;
>   }
>   
>   void domain_watch_inc(struct connection *conn)
>   {
> -	if (!conn || !conn->domain)
> -		return;
> -	conn->domain->nbwatch++;
> +	domain_acc_add(conn, conn->id, ACC_WATCH, 1, true);
>   }
>   
>   void domain_watch_dec(struct connection *conn)
>   {
> -	if (!conn || !conn->domain)
> -		return;
> -	if (conn->domain->nbwatch)
> -		conn->domain->nbwatch--;
> +	domain_acc_add(conn, conn->id, ACC_WATCH, -1, true);
>   }
>   
>   int domain_watch(struct connection *conn)
>   {
>   	return (domain_is_unprivileged(conn))
> -		? conn->domain->nbwatch
> +		? domain_acc_add(conn, conn->id, ACC_WATCH, 0, true)
>   		: 0;
>   }
>   
>   void domain_outstanding_inc(struct connection *conn)
>   {
> -	if (!conn || !conn->domain)
> -		return;
> -	conn->domain->nboutstanding++;
> +	domain_acc_add(conn, conn->id, ACC_OUTST, 1, true);
>   }
>   
> -void domain_outstanding_dec(struct connection *conn)
> +void domain_outstanding_dec(struct connection *conn, unsigned int domid)
>   {
> -	if (!conn || !conn->domain)
> -		return;
> -	conn->domain->nboutstanding--;
> -}
> -
> -void domain_outstanding_domid_dec(unsigned int domid)
> -{
> -	struct domain *d = find_domain_by_domid(domid);
> -
> -	if (d)
> -		d->nboutstanding--;
> +	domain_acc_add(conn, domid, ACC_OUTST, -1, true);
>   }
>   
>   static wrl_creditt wrl_config_writecost      = WRL_FACTOR;
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index b94548fd7d..086133407b 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -29,7 +29,10 @@ enum accitem {
>   	ACC_REQ_N,		/* Number of elements per request. */
>   	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
>   	ACC_CHD_N = ACC_TR_N,	/* max(ACC_REQ_N, ACC_TR_N), for changed dom. */
> -	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
> +	ACC_WATCH = ACC_TR_N,
> +	ACC_OUTST,
> +	ACC_MEM,
> +	ACC_N,			/* Number of elements per domain. */
>   };
>   
>   void handle_event(void);
> @@ -109,8 +112,7 @@ void domain_watch_inc(struct connection *conn);
>   void domain_watch_dec(struct connection *conn);
>   int domain_watch(struct connection *conn);
>   void domain_outstanding_inc(struct connection *conn);
> -void domain_outstanding_dec(struct connection *conn);
> -void domain_outstanding_domid_dec(unsigned int domid);
> +void domain_outstanding_dec(struct connection *conn, unsigned int domid);
>   int domain_get_quota(const void *ctx, struct connection *conn,
>   		     unsigned int domid);
>   

-- 
Julien Grall

