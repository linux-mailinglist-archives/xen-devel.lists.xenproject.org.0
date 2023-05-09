Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B166FCDFD
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532435.828650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSMB-0003Ht-Fi; Tue, 09 May 2023 18:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532435.828650; Tue, 09 May 2023 18:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSMB-0003Ed-Co; Tue, 09 May 2023 18:46:39 +0000
Received: by outflank-mailman (input) for mailman id 532435;
 Tue, 09 May 2023 18:46:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwSMA-0003EX-2y
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:46:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSM9-0000h0-D4; Tue, 09 May 2023 18:46:37 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSM9-0005nT-6G; Tue, 09 May 2023 18:46:37 +0000
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
	bh=Cte6XHuqNiyt7bJbnbNBdUlKdoCQf/YJv2ZJHQr6nrU=; b=DfvHfXMotQSiJbsOIQAlq8EaFQ
	GvLUFFRdbEcA2DrSfP8+ERVHat/Uh6hw8NcgkWyLvqG5Z0yQhrcaqFh4RaN8UMgVsdQrlVPe8tJLD
	LGfGJRzcyNqxbQ4lMGLkzHvc30Yzajyt+JRL9ZnyT/c0CnpKXIBjf4j5hYyD760sbGuw=;
Message-ID: <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
Date: Tue, 9 May 2023 19:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> Add the node accounting to the accounting information buffering in
> order to avoid having to undo it in case of failure.
> 
> This requires to call domain_nbentry_dec() before any changes to the
> data base, as it can return an error now.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V5:
> - add error handling after domain_nbentry_dec() calls (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c   | 29 +++++++----------------------
>   tools/xenstore/xenstored_domain.h |  4 ++--
>   2 files changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 8392bdec9b..22da434e2a 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1454,7 +1454,6 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
>   static int destroy_node(struct connection *conn, struct node *node)
>   {
>   	destroy_node_rm(conn, node);
> -	domain_nbentry_dec(conn, get_node_owner(node));
>   
>   	/*
>   	 * It is not possible to easily revert the changes in a transaction.
> @@ -1645,6 +1644,9 @@ static int delnode_sub(const void *ctx, struct connection *conn,
>   	if (ret > 0)
>   		return WALK_TREE_SUCCESS_STOP;
>   
> +	if (domain_nbentry_dec(conn, get_node_owner(node)))
> +		return WALK_TREE_ERROR_STOP;

I think there is a potential issue with the buffering here. In case of 
failure, the node could have been removed, but the quota would not be 
properly accounted.

Also, I think a comment would be warrant to explain why we are returning 
WALK_TREE_ERROR_STOP here when...

> +
>   	/* In case of error stop the walk. */
>   	if (!ret && do_tdb_delete(conn, &key, &node->acc))
>   		return WALK_TREE_SUCCESS_STOP;

... this is not the case when do_tdb_delete() fails for some reasons.

> @@ -1657,8 +1659,6 @@ static int delnode_sub(const void *ctx, struct connection *conn,
>   	watch_exact = strcmp(root, node->name);
>   	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
>   
> -	domain_nbentry_dec(conn, get_node_owner(node));
> -
>   	return WALK_TREE_RM_CHILDENTRY;
>   }
>   
> @@ -1797,29 +1797,14 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   		return EPERM;
>   
>   	old_perms = node->perms;
> -	domain_nbentry_dec(conn, get_node_owner(node));
> +	if (domain_nbentry_dec(conn, get_node_owner(node)))
> +		return ENOMEM;
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
> -
> -	if (write_node(conn, node, false)) {
> -		int saved_errno = errno;
>   
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
> index e40657216b..466549709f 100644
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
>   	ACC_CHD_N = ACC_TR_N,	/* max(ACC_REQ_N, ACC_TR_N), for changed dom. */
>   	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
>   };


Cheers,

-- 
Julien Grall

