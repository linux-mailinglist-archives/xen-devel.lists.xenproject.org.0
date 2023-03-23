Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380246C6894
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513842.795463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKDK-0000Yt-Tf; Thu, 23 Mar 2023 12:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513842.795463; Thu, 23 Mar 2023 12:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKDK-0000WJ-Qm; Thu, 23 Mar 2023 12:38:42 +0000
Received: by outflank-mailman (input) for mailman id 513842;
 Thu, 23 Mar 2023 12:38:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pfKDJ-0000WD-Aj
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:38:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKDI-0007CQ-Gz; Thu, 23 Mar 2023 12:38:40 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.18.79]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKDI-0008QW-8t; Thu, 23 Mar 2023 12:38:40 +0000
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
	bh=efMjBDYKcSEzs1ZCLbZDhUWeCi4aNZSD5rSs1DYVw00=; b=A8JI7NAFA6Hx1HXbrgzZkAEx81
	ZhsyOMePsh/WKh0UsP9/vnWMsbsMris+r1ahWuciTGlmuJC1tbvIjx+1rp0AqDNj+M6VxQrgkrHyj
	7Bz2YuC6hMp4cPr/+FEPtS10gzEplBIJgIzxO5Nq4pDY2zGuT1/Sdt1i7xL92Sk+Hd5c=;
Message-ID: <a8e71268-6111-d4d5-5cba-ed141dba530d@xen.org>
Date: Thu, 23 Mar 2023 12:38:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] tools/xenstore: fix quota check in acc_fix_domains()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230224155848.31036-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230224155848.31036-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/02/2023 15:58, Juergen Gross wrote:
> Today when finalizing a transaction the number of node quota is checked
> to not being exceeded after the transaction. This check is always done,
> even if the transaction is being performed by a privileged connection,
> or if there were no nodes created in the transaction.
> 
> Correct that by checking quota only if:
> - the transaction is being performed by an unprivileged guest, and
> - at least one node was created in the transaction
> 
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: f2bebf72c4d5 ("xenstore: rework of transaction handling")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        |  3 +++
>   tools/xenstore/xenstored_domain.c      |  4 ++--
>   tools/xenstore/xenstored_domain.h      |  2 +-
>   tools/xenstore/xenstored_transaction.c | 16 ++++++++++++++--
>   tools/xenstore/xenstored_transaction.h |  3 +++
>   5 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index a61db2db2d..3ca68681e3 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1472,6 +1472,9 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>   	if (!node)
>   		return NULL;
>   
> +	if (conn && conn->transaction)
> +		ta_node_created(conn->transaction);
> +
>   	node->data = data;
>   	node->datalen = datalen;
>   
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index d7fc2fafc7..f62be2245c 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -544,7 +544,7 @@ static struct domain *find_domain_by_domid(unsigned int domid)
>   	return (d && d->introduced) ? d : NULL;
>   }
>   
> -int acc_fix_domains(struct list_head *head, bool update)
> +int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
>   {
>   	struct changed_domain *cd;
>   	int cnt;
> @@ -552,7 +552,7 @@ int acc_fix_domains(struct list_head *head, bool update)
>   	list_for_each_entry(cd, head, list) {
>   		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
>   		if (!update) {
> -			if (cnt >= quota_nb_entry_per_domain)
> +			if (chk_quota && cnt >= quota_nb_entry_per_domain)
>   				return ENOSPC;
>   			if (cnt < 0)
>   				return ENOMEM;
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index dc4660861e..ec6aa00cc7 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -96,7 +96,7 @@ void domain_outstanding_dec(struct connection *conn);
>   void domain_outstanding_domid_dec(unsigned int domid);
>   int domain_get_quota(const void *ctx, struct connection *conn,
>   		     unsigned int domid);
> -int acc_fix_domains(struct list_head *head, bool update);
> +int acc_fix_domains(struct list_head *head, bool chk_quota, bool update);

Depending on the answer below, I would suggest to write that 'chk_quota' 
is ignored when ``update`` is true.

>   
>   /* Write rate limiting */
>   
> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 1aa9d3cb3d..2b15506953 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -160,12 +160,20 @@ struct transaction
>   	/* List of changed domains - to record the changed domain entry number */
>   	struct list_head changed_domains;
>   
> +	/* There was at least one node created in the transaction. */
> +	bool node_created;
> +
>   	/* Flag for letting transaction fail. */
>   	bool fail;
>   };
>   
>   uint64_t generation;
>   
> +void ta_node_created(struct transaction *trans)
> +{
> +	trans->node_created = true;
> +}
> +
>   static struct accessed_node *find_accessed_node(struct transaction *trans,
>   						const char *name)
>   {
> @@ -509,6 +517,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
>   	const char *arg = onearg(in);
>   	struct transaction *trans;
>   	bool is_corrupt = false;
> +	bool chk_quota;
>   	int ret;
>   
>   	if (!arg || (!streq(arg, "T") && !streq(arg, "F")))
> @@ -523,13 +532,16 @@ int do_transaction_end(const void *ctx, struct connection *conn,
>   	if (!conn->transaction_started)
>   		conn->ta_start_time = 0;
>   
> +	chk_quota = trans->node_created && domain_is_unprivileged(conn);
> +
>   	/* Attach transaction to ctx for auto-cleanup */
>   	talloc_steal(ctx, trans);
>   
>   	if (streq(arg, "T")) {
>   		if (trans->fail)
>   			return ENOMEM;
> -		ret = acc_fix_domains(&trans->changed_domains, false);
> +		ret = acc_fix_domains(&trans->changed_domains, chk_quota,
> +				      false);
>   		if (ret)
>   			return ret;
>   		ret = finalize_transaction(conn, trans, &is_corrupt);
> @@ -539,7 +551,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
>   		wrl_apply_debit_trans_commit(conn);
>   
>   		/* fix domain entry for each changed domain */
> -		acc_fix_domains(&trans->changed_domains, true);
> +		acc_fix_domains(&trans->changed_domains, false, true);

In theory, shouldn't we pass 'chk_quota' rather than false? In practice, 
I know it doesn't make any difference between this is an update.

>   
>   		if (is_corrupt)
>   			corrupt(conn, "transaction inconsistency");
> diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
> index b6f8cb7d0a..883145163f 100644
> --- a/tools/xenstore/xenstored_transaction.h
> +++ b/tools/xenstore/xenstored_transaction.h
> @@ -36,6 +36,9 @@ int do_transaction_end(const void *ctx, struct connection *conn,
>   
>   struct transaction *transaction_lookup(struct connection *conn, uint32_t id);
>   
> +/* Set flag for created node. */
> +void ta_node_created(struct transaction *trans);
> +
>   /* This node was accessed. */
>   int __must_check access_node(struct connection *conn, struct node *node,
>                                enum node_access_type type, TDB_DATA *key);

Cheers,

-- 
Julien Grall

