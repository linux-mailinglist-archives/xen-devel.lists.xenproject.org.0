Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25E845C8C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674524.1049512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZdz-0006KX-9i; Thu, 01 Feb 2024 16:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674524.1049512; Thu, 01 Feb 2024 16:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZdz-0006IL-70; Thu, 01 Feb 2024 16:10:27 +0000
Received: by outflank-mailman (input) for mailman id 674524;
 Thu, 01 Feb 2024 16:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zkz=JK=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rVZdx-0006IF-KU
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:10:25 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67de5e1c-c11c-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 17:10:24 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b1b21c020so260087f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 08:10:24 -0800 (PST)
Received: from [10.95.167.50] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a056000100f00b0033aee3bfac5sm10679554wrx.16.2024.02.01.08.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 08:10:21 -0800 (PST)
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
X-Inumbo-ID: 67de5e1c-c11c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706803823; x=1707408623; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvgKt6vyIvLQ9cao7dV112oZw/spOoZQuBNAwiuVdb8=;
        b=iurUL+SnHD4LNJg78ueat7VSRM0I27B6HsnDT4SEJIvxH/PEv8RIELZIYHnuUvGBaU
         YFFiBb/Z/xNcS+qdHxOKYff2cnRIrmRdrLNqENNExQZduFsVAXq2hRLO22h+4p7itKVn
         5MlB1xjVGSBfXa48azbKEjfHtDp0tgga+bdFgxemtZWQZifD+Gw4ytr7T4TCO6/SKDN6
         mFIiK1NjcQA89/n+p/9H4cQ28JYYdqheFlGQyO05Lk2AF2u65qXE86p5xpJg1fArF/3P
         O2U/z0SuXL2wER7QRyS66Ewg6uwXZLFzSLDKPrbV/Zfh2MI6YqNyt+d4ueB76Uc6PTcs
         amoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706803823; x=1707408623;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvgKt6vyIvLQ9cao7dV112oZw/spOoZQuBNAwiuVdb8=;
        b=XaiKaafrnVbYZY6CA9euQViexG+uGRvYyct9tw5kc3bq3txlnD04uh9rgsyMMPjMnd
         Ad8BPqCKssprXAP1FC7gYl7rzrGceldlwN0UOYneiFKfV0mGGhQlW3+fGVOn0ljz/hbG
         oL3rk4lw0sF8yqHMDBKoj5T+Ly4QhxeONJMAC6pwWTKfmB3AN6HP2WS/ciryTd/Gm4Cj
         CN4/n3ZgBLiIJEvReITa79OnMtVoAO18kHlB1c1AXLCMs0GPegdv0k/XIVHptV/G699t
         Bhwxwck2ZqHLba2D+f5tGVzb0Gg/rR1aOvbwtc5IDpOQwpMMW7uxgjVN/qk7hNR3xJWv
         Mu7g==
X-Gm-Message-State: AOJu0Yy+BVmpc+Uxt/lp+seeBQ2gUYq4mLDXg8juS+fn6ZqyQMFfiVuN
	U7NDeONnhjhvNauhRcqaTyTRQjhKgSRDS3JNNFi6M6tvOICuuxln
X-Google-Smtp-Source: AGHT+IEJ1m79KnyLHr6GvYPcIVi1Yn5A5Nr4MDBCO78RLOXhhcFiwoz/B1H/xeAutDcnO1f9DXmivw==
X-Received: by 2002:a5d:6b81:0:b0:33a:fec8:e46a with SMTP id n1-20020a5d6b81000000b0033afec8e46amr4267477wrx.11.1706803823477;
        Thu, 01 Feb 2024 08:10:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCViOqOOszIhKkGMgLBmqB92mrQNRdR7OnPceOL0Z9LSVRHf4dJA9gJwG7JBTlRP94BQ48gsy/QsdPjZgPY6BhSE176aU/sPB+whQerq9g1p2xjSj4t+4gumT/sTyp1gCIf9yoShBiM=
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <383c1d4a-175f-4e23-b884-b9d9c1dce4da@xen.org>
Date: Thu, 1 Feb 2024 16:10:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH net] xen-netback: properly sync TX responses
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
Organization: Xen Project
In-Reply-To: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2024 13:03, Jan Beulich wrote:
> Invoking the make_tx_response() / push_tx_responses() pair with no lock
> held would be acceptable only if all such invocations happened from the
> same context (NAPI instance or dealloc thread). Since this isn't the
> case, and since the interface "spec" also doesn't demand that multicast
> operations may only be performed with no in-flight transmits,
> MCAST_{ADD,DEL} processing also needs to acquire the response lock
> around the invocations.
> 
> To prevent similar mistakes going forward, "downgrade" the present
> functions to private helpers of just the two remaining ones using them
> directly, with no forward declarations anymore. This involves renaming
> what so far was make_tx_response(), for the new function of that name
> to serve the new (wrapper) purpose.
> 
> While there,
> - constify the txp parameters,
> - correct xenvif_idx_release()'s status parameter's type,
> - rename {,_}make_tx_response()'s status parameters for consistency with
>    xenvif_idx_release()'s.
> 
> Fixes: 210c34dcd8d9 ("xen-netback: add support for multicast control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course this could be split into two or even more separate changes,
> but I think these transformations are best done all in one go.
> 
> It remains questionable whether push_tx_responses() really needs
> invoking after every single _make_tx_response().
> 
> MCAST_{ADD,DEL} are odd also from another perspective: They're supposed
> to come with "dummy requests", with the comment in the public header
> leaving open what that means.

IIRC the only reference I had at the time was Solaris code... I don't 
really there being any documentation of the feature. I think that 
https://github.com/illumos/illumos-gate/blob/master/usr/src/uts/common/xen/io/xnb.c 
is probably similar to the code I looked at to determine what the 
Solaris frontend expected. So I think 'dummy' means 'ignored'.

> Netback doesn't check dummy-ness (e.g.
> size being zero). Furthermore the description in the public header
> doesn't really make clear that there's a restriction of one such "extra"
> per dummy request. Yet the way xenvif_get_extras() works precludes
> multiple ADDs or multiple DELs in a single dummy request (only the last
> one would be honored afaict). While the way xenvif_tx_build_gops() works
> precludes an ADD and a DEL coming together in a single dummy request
> (the DEL would be ignored).

It appears the Solaris backend never coped with multiple extra_info so 
what the 'correct' semantic would be is unclear.

Anyway...

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -104,13 +104,12 @@ bool provides_xdp_headroom = true;
>   module_param(provides_xdp_headroom, bool, 0644);
>   
>   static void xenvif_idx_release(struct xenvif_queue *queue, u16 pending_idx,
> -			       u8 status);
> +			       s8 status);
>   
>   static void make_tx_response(struct xenvif_queue *queue,
> -			     struct xen_netif_tx_request *txp,
> +			     const struct xen_netif_tx_request *txp,
>   			     unsigned int extra_count,
> -			     s8       st);
> -static void push_tx_responses(struct xenvif_queue *queue);
> +			     s8 status);
>   
>   static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx);
>   
> @@ -208,13 +207,9 @@ static void xenvif_tx_err(struct xenvif_
>   			  unsigned int extra_count, RING_IDX end)
>   {
>   	RING_IDX cons = queue->tx.req_cons;
> -	unsigned long flags;
>   
>   	do {
> -		spin_lock_irqsave(&queue->response_lock, flags);
>   		make_tx_response(queue, txp, extra_count, XEN_NETIF_RSP_ERROR);
> -		push_tx_responses(queue);
> -		spin_unlock_irqrestore(&queue->response_lock, flags);
>   		if (cons == end)
>   			break;
>   		RING_COPY_REQUEST(&queue->tx, cons++, txp);
> @@ -465,12 +460,7 @@ static void xenvif_get_requests(struct x
>   	for (shinfo->nr_frags = 0; nr_slots > 0 && shinfo->nr_frags < MAX_SKB_FRAGS;
>   	     nr_slots--) {
>   		if (unlikely(!txp->size)) {
> -			unsigned long flags;
> -
> -			spin_lock_irqsave(&queue->response_lock, flags);
>   			make_tx_response(queue, txp, 0, XEN_NETIF_RSP_OKAY);
> -			push_tx_responses(queue);
> -			spin_unlock_irqrestore(&queue->response_lock, flags);
>   			++txp;
>   			continue;
>   		}
> @@ -496,14 +486,8 @@ static void xenvif_get_requests(struct x
>   
>   		for (shinfo->nr_frags = 0; shinfo->nr_frags < nr_slots; ++txp) {
>   			if (unlikely(!txp->size)) {
> -				unsigned long flags;
> -
> -				spin_lock_irqsave(&queue->response_lock, flags);
>   				make_tx_response(queue, txp, 0,
>   						 XEN_NETIF_RSP_OKAY);
> -				push_tx_responses(queue);
> -				spin_unlock_irqrestore(&queue->response_lock,
> -						       flags);
>   				continue;
>   			}
>   
> @@ -995,7 +979,6 @@ static void xenvif_tx_build_gops(struct
>   					 (ret == 0) ?
>   					 XEN_NETIF_RSP_OKAY :
>   					 XEN_NETIF_RSP_ERROR);
> -			push_tx_responses(queue);
>   			continue;
>   		}
>   
> @@ -1007,7 +990,6 @@ static void xenvif_tx_build_gops(struct
>   
>   			make_tx_response(queue, &txreq, extra_count,
>   					 XEN_NETIF_RSP_OKAY);
> -			push_tx_responses(queue);
>   			continue;
>   		}
>   
> @@ -1433,8 +1415,35 @@ int xenvif_tx_action(struct xenvif_queue
>   	return work_done;
>   }
>   
> +static void _make_tx_response(struct xenvif_queue *queue,
> +			     const struct xen_netif_tx_request *txp,
> +			     unsigned int extra_count,
> +			     s8 status)
> +{
> +	RING_IDX i = queue->tx.rsp_prod_pvt;
> +	struct xen_netif_tx_response *resp;
> +
> +	resp = RING_GET_RESPONSE(&queue->tx, i);
> +	resp->id     = txp->id;
> +	resp->status = status;
> +
> +	while (extra_count-- != 0)
> +		RING_GET_RESPONSE(&queue->tx, ++i)->status = XEN_NETIF_RSP_NULL;
> +
> +	queue->tx.rsp_prod_pvt = ++i;
> +}
> +
> +static void push_tx_responses(struct xenvif_queue *queue)
> +{
> +	int notify;
> +
> +	RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&queue->tx, notify);
> +	if (notify)
> +		notify_remote_via_irq(queue->tx_irq);
> +}
> +
>   static void xenvif_idx_release(struct xenvif_queue *queue, u16 pending_idx,
> -			       u8 status)
> +			       s8 status)
>   {
>   	struct pending_tx_info *pending_tx_info;
>   	pending_ring_idx_t index;
> @@ -1444,8 +1453,8 @@ static void xenvif_idx_release(struct xe
>   
>   	spin_lock_irqsave(&queue->response_lock, flags);
>   
> -	make_tx_response(queue, &pending_tx_info->req,
> -			 pending_tx_info->extra_count, status);
> +	_make_tx_response(queue, &pending_tx_info->req,
> +			  pending_tx_info->extra_count, status);
>   
>   	/* Release the pending index before pusing the Tx response so
>   	 * its available before a new Tx request is pushed by the
> @@ -1459,32 +1468,19 @@ static void xenvif_idx_release(struct xe
>   	spin_unlock_irqrestore(&queue->response_lock, flags);
>   }
>   
> -
>   static void make_tx_response(struct xenvif_queue *queue,
> -			     struct xen_netif_tx_request *txp,
> +			     const struct xen_netif_tx_request *txp,
>   			     unsigned int extra_count,
> -			     s8       st)
> +			     s8 status)
>   {
> -	RING_IDX i = queue->tx.rsp_prod_pvt;
> -	struct xen_netif_tx_response *resp;
> -
> -	resp = RING_GET_RESPONSE(&queue->tx, i);
> -	resp->id     = txp->id;
> -	resp->status = st;
> -
> -	while (extra_count-- != 0)
> -		RING_GET_RESPONSE(&queue->tx, ++i)->status = XEN_NETIF_RSP_NULL;
> +	unsigned long flags;
>   
> -	queue->tx.rsp_prod_pvt = ++i;
> -}
> +	spin_lock_irqsave(&queue->response_lock, flags);
>   
> -static void push_tx_responses(struct xenvif_queue *queue)
> -{
> -	int notify;
> +	_make_tx_response(queue, txp, extra_count, status);
> +	push_tx_responses(queue);
>   
> -	RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&queue->tx, notify);
> -	if (notify)
> -		notify_remote_via_irq(queue->tx_irq);
> +	spin_unlock_irqrestore(&queue->response_lock, flags);
>   }
>   
>   static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx)


