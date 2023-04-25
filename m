Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B16EE71F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526292.817957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMpi-0007Ri-1X; Tue, 25 Apr 2023 17:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526292.817957; Tue, 25 Apr 2023 17:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMph-0007ON-Un; Tue, 25 Apr 2023 17:52:05 +0000
Received: by outflank-mailman (input) for mailman id 526292;
 Tue, 25 Apr 2023 17:52:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1prMpg-0007OF-Nn
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:52:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1prMpg-0002yN-0C; Tue, 25 Apr 2023 17:52:04 +0000
Received: from [54.239.6.184] (helo=[192.168.17.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1prMpf-0000dA-Pq; Tue, 25 Apr 2023 17:52:03 +0000
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
	bh=8rz7ZWQK/maqLdu7iUYZ+4Yz4thkHd8UA1FC4lCo+bw=; b=xdHVcf7gHgJkvpfjDuc3BQDxnC
	42GqgfAr7ouiftKZs1gREO9PmdoZV5EnxKb2xpKUvBCjp00d0ADqzpnb7K8FqTDk73azSKt4wImWQ
	54Dqb4hubhy+1r11HN8PnaRUzCQMbIxQ6ilLHInDox7ozl9k2TpLMDXGlBNnybU2y67U=;
Message-ID: <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
Date: Tue, 25 Apr 2023 18:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> Instead of modifying accounting data and undo those modifications in
> case of an error during further processing, add a framework for
> collecting the needed changes and commit them only when the whole
> operation has succeeded.
> 
> This scheme can reuse large parts of the per transaction accounting.
> The changed_domain handling can be reused, but the array size of the
> accounting data should be possible to be different for both use cases.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - call acc_commit() earlier (Julien Grall)
> - add assert() to acc_commit()
> - use fixed sized acc array in struct changed_domain (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c   |  9 ++++--
>   tools/xenstore/xenstored_core.h   |  3 ++
>   tools/xenstore/xenstored_domain.c | 53 ++++++++++++++++++++++++++++++-
>   tools/xenstore/xenstored_domain.h |  5 ++-
>   4 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 3ca68681e3..84335f5f3d 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1023,6 +1023,9 @@ static void send_error(struct connection *conn, int error)
>   			break;
>   		}
>   	}
> +
> +	acc_drop(conn);
> +
>   	send_reply(conn, XS_ERROR, xsd_errors[i].errstring,
>   			  strlen(xsd_errors[i].errstring) + 1);
>   }
> @@ -1034,6 +1037,9 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
>   
>   	assert(type != XS_WATCH_EVENT);
>   
> +	conn->in = NULL;

AFAIU, you are setting conn->in to NULL in order to please..

> +	acc_commit(conn);

... this call. However in case of an error like...

> +
>   	if ( len > XENSTORE_PAYLOAD_MAX ) { >   		send_error(conn, E2BIG);

... here, send_reply() will be called again. But the error will not be 
set because conn->in is NULL.

So I think you want to restore conn->in rewrite acc_commit(). The 
ordering would also deserve an explanation in a comment.

>   		return;
> @@ -1059,8 +1065,6 @@ void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
>   		}
>   	}
>   
> -	conn->in = NULL;
> -
>   	/* Update relevant header fields and fill in the message body. */
>   	bdata->hdr.msg.type = type;
>   	bdata->hdr.msg.len = len;
> @@ -2195,6 +2199,7 @@ struct connection *new_connection(const struct interface_funcs *funcs)
>   	new->is_stalled = false;
>   	new->transaction_started = 0;
>   	INIT_LIST_HEAD(&new->out_list);
> +	INIT_LIST_HEAD(&new->acc_list);
>   	INIT_LIST_HEAD(&new->ref_list);
>   	INIT_LIST_HEAD(&new->watches);
>   	INIT_LIST_HEAD(&new->transaction_list);
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index c59b06551f..1f811f38cb 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -139,6 +139,9 @@ struct connection
>   	struct list_head out_list;
>   	uint64_t timeout_msec;
>   
> +	/* Not yet committed accounting data (valid if in != NULL). */
> +	struct list_head acc_list;
> +
>   	/* Referenced requests no longer pending. */
>   	struct list_head ref_list;
>   
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 30fb9acec6..144cbafb73 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -91,6 +91,8 @@ struct domain
>   	bool wrl_delay_logged;
>   };
>   
> +#define ACC_CHD_N (ACC_TR_N < ACC_REQ_N ? ACC_REQ_N : ACC_TR_N)

Both ACC_TR_N and ACC_REQ_N are fixed. Can you explain why we need this 
magic?

Related, wouldn't it be better to define it in the enum?

> +
>   struct changed_domain
>   {
>   	/* List of all changed domains. */
> @@ -100,7 +102,7 @@ struct changed_domain
>   	unsigned int domid;
>   
>   	/* Accounting data. */
> -	int acc[ACC_TR_N];
> +	int acc[ACC_CHD_N];
>   };
>   
>   static struct hashtable *domhash;
> @@ -1070,6 +1072,7 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
>   			  enum accitem what, int add, bool no_dom_alloc)
>   {
>   	struct domain *d;
> +	struct changed_domain *cd;
>   	struct list_head *head;
>   	int ret;
>   
> @@ -1090,6 +1093,22 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
>   		}
>   	}
>   
> +	/* Temporary accounting data until final commit? */
> +	if (conn && conn->in && what < ACC_REQ_N) {
> +		/* Consider transaction local data. */
> +		ret = 0;
> +		if (conn->transaction && what < ACC_TR_N) {
> +			head = transaction_get_changed_domains(
> +				conn->transaction);
> +			cd = acc_find_changed_domain(head, domid);
> +			if (cd)
> +				ret = cd->acc[what];
> +		}
> +		ret += acc_add_changed_dom(conn->in, &conn->acc_list, what,
> +					   add, domid);
> +		return errno ? -1 : domain_acc_add_valid(d, what, ret);
> +	}
> +
>   	if (conn && conn->transaction && what < ACC_TR_N) {
>   		head = transaction_get_changed_domains(conn->transaction);
>   		ret = acc_add_changed_dom(conn->transaction, head, what,
> @@ -1106,6 +1125,38 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
>   	return d->acc[what];
>   }
>   
> +void acc_drop(struct connection *conn)
> +{
> +	struct changed_domain *cd;
> +
> +	while ((cd = list_top(&conn->acc_list, struct changed_domain, list))) {
> +		list_del(&cd->list);
> +		talloc_free(cd);
> +	}
> +}
> +
> +void acc_commit(struct connection *conn)
> +{
> +	struct changed_domain *cd;
> +	enum accitem what;
> +
> +	/*
> +	 * Make sure domain_acc_add() below can't add additional data to
> +	 * to be committed accounting records.
> +	 */
> +	assert(!conn->in);
> +
> +	while ((cd = list_top(&conn->acc_list, struct changed_domain, list))) {
> +		list_del(&cd->list);
> +		for (what = 0; what < ACC_REQ_N; what++)
> +			if (cd->acc[what])
> +				domain_acc_add(conn, cd->domid, what,
> +					       cd->acc[what], true);
> +
> +		talloc_free(cd);
> +	}
> +}
> +
>   int domain_nbentry_inc(struct connection *conn, unsigned int domid)
>   {
>   	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index 9d05eb01da..6355ad4f37 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -25,7 +25,8 @@
>    * a per transaction array.
>    */
>   enum accitem {
> -	ACC_NODES,
> +	ACC_REQ_N,		/* Number of elements per request. */
> +	ACC_NODES = ACC_REQ_N,
>   	ACC_TR_N,		/* Number of elements per transaction. */
>   	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
>   };
> @@ -113,6 +114,8 @@ int domain_get_quota(const void *ctx, struct connection *conn,
>    * If "update" is true, "chk_quota" is ignored.
>    */
>   int acc_fix_domains(struct list_head *head, bool chk_quota, bool update);
> +void acc_drop(struct connection *conn);
> +void acc_commit(struct connection *conn);
>   
>   /* Write rate limiting */
>   

Cheers,

-- 
Julien Grall

