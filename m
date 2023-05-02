Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D031E6F49F5
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 20:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528776.822338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvAL-00085b-Hp; Tue, 02 May 2023 18:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528776.822338; Tue, 02 May 2023 18:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvAL-00083v-ES; Tue, 02 May 2023 18:55:57 +0000
Received: by outflank-mailman (input) for mailman id 528776;
 Tue, 02 May 2023 18:55:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvAJ-00083p-PY
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 18:55:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvAI-0003hh-TJ; Tue, 02 May 2023 18:55:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.27.23]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvAI-0005Bb-Mq; Tue, 02 May 2023 18:55:54 +0000
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
	bh=/ZyE9fpt/78nDThThdz/kDxQb85mcyv/qvVJpj6ieEk=; b=Qzgu9OvVgcAEZYAA0/Y0wse8EM
	2fyoW52R3LXF9ib8fWeQDRaPeuzvLMralupIneW8Q4KK7xKn6+kbRFQl9kQFcqHWghK6wSN7gCCY6
	ZCBoM+t+Vdcq/bdq9vmhM8KIf3c8Io9owrsl45fBkvip4PafUUiTt8/xzG/zlmLHBSUk=;
Message-ID: <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
Date: Tue, 2 May 2023 19:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> Add the node accounting to the accounting information buffering in
> order to avoid having to undo it in case of failure.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c   | 21 ++-------------------
>   tools/xenstore/xenstored_domain.h |  4 ++--
>   2 files changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 84335f5f3d..92a40ccf3f 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1452,7 +1452,6 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
>   static int destroy_node(struct connection *conn, struct node *node)
>   {
>   	destroy_node_rm(conn, node);
> -	domain_nbentry_dec(conn, get_node_owner(node));
>   
>   	/*
>   	 * It is not possible to easily revert the changes in a transaction.
> @@ -1797,27 +1796,11 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   	old_perms = node->perms;
>   	domain_nbentry_dec(conn, get_node_owner(node));

IIRC, we originally said that domain_nbentry_dec() could never fail in a 
non-transaction case. But with your current rework, the function can now 
fail because of an allocation failure.

Therefore, shouldn't we now check the error? (Possibly in a patch 
beforehand).

>   	node->perms = perms;
> -	if (domain_nbentry_inc(conn, get_node_owner(node))) {
> -		node->perms = old_perms;
> -		/*
> -		 * This should never fail because we had a reference on the
> -		 * domain before and Xenstored is single-threaded.
> -		 */
> -		domain_nbentry_inc(conn, get_node_owner(node));
> +	if (domain_nbentry_inc(conn, get_node_owner(node)))
>   		return ENOMEM;
> -	}
>   
> -	if (write_node(conn, node, false)) {
> -		int saved_errno = errno;
> -
> -		domain_nbentry_dec(conn, get_node_owner(node));
> -		node->perms = old_perms;
> -		/* No failure possible as above. */
> -		domain_nbentry_inc(conn, get_node_owner(node));
> -
> -		errno = saved_errno;
> +	if (write_node(conn, node, false))
>   		return errno;
> -	}
>   
>   	fire_watches(conn, ctx, name, node, false, &old_perms);
>   	send_ack(conn, XS_SET_PERMS);
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index 6355ad4f37..e669f57b80 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -25,9 +25,9 @@
>    * a per transaction array.
>    */
>   enum accitem {
> +	ACC_NODES,
>   	ACC_REQ_N,		/* Number of elements per request. */
> -	ACC_NODES = ACC_REQ_N,
> -	ACC_TR_N,		/* Number of elements per transaction. */
> +	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
>   	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
>   };
>   

Cheers,

-- 
Julien Grall

