Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E38405EC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 14:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672940.1047041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rURID-0001Oh-7y; Mon, 29 Jan 2024 13:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672940.1047041; Mon, 29 Jan 2024 13:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rURID-0001N8-54; Mon, 29 Jan 2024 13:03:17 +0000
Received: by outflank-mailman (input) for mailman id 672940;
 Mon, 29 Jan 2024 13:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9RcU=JH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rURIC-0001N1-3m
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 13:03:16 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a84c8f-bea6-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 14:03:11 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso31918281fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 05:03:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b11-20020a02a58b000000b00470b9ccdf99sm770944jam.163.2024.01.29.05.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 05:03:10 -0800 (PST)
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
X-Inumbo-ID: c1a84c8f-bea6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706533391; x=1707138191; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHIEFIGhwN1rI8WFK4Xy23QAZj6uJyTSbj27NLSCFP0=;
        b=AKaazcwO8UioOY25UtT2bPznMf9Z2M56RPmKELIdN8F4u5lPvrDsGKOOsT6mntMfhR
         TXzfsj7aXas3iDTyCXFLNLkY0dHA97TJ7o50XLWksEf+qYkebT4xDYuVEhplvyzfl/ks
         pWNjhoKCYHZl5qQZG8Jg2QqVJlg4J8eptSoB+NU3zDwGjDgcf6VjSHdf3Y/xtikP8ERv
         ep5iFp21mlE2dveq76q6bwaPH6E5Oh1A/T1XWw6+Wnig/rz25ZBBmdFFJY/8EDHN4Iue
         y7IZig38EQDIKsIVNMezhyOpcWa2eqKT8yu6y3TrwPtDyzWwfoY1bC4yioNB1YUWUnFR
         s9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706533391; x=1707138191;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHIEFIGhwN1rI8WFK4Xy23QAZj6uJyTSbj27NLSCFP0=;
        b=wU139/qjZmzZXHMANTJOmrfw/nMlO70p8isKokP1NJHLOUAWZMs9Kp9DtTIff2zfAP
         3DoCBrXSXqgCCheEhSIjNuWlZ/mrVS2tcWwwcHmO4tJH4aRz8JLXtmnd/CFuD73l8/Eq
         H4IgVEv/J1yhn3fMKqSdelYH5HkyJBuz2hys9MqIVT6daOZJsEeMhKTDkWEiKhZ3OXrh
         Raxrea/NEKg11Q7z/yZgtoJkslbkFE/GZq/ZoaBqpUey0yiERWG9+lrCNQl1nlNzs6Xd
         odbfd/DhOzFVOZNyt6Aj44OklvSGpSUPdKnfT5RYQUd7tQPum0UPLOF2Q7mfjA7rwGWB
         GhvQ==
X-Gm-Message-State: AOJu0YxJ4fkkstaPxAnnCrIx8W78LcoGH7v+uGluSUHKjtSqeudsEqws
	SfuPZ/TzWGGHDcGTY6vbBkq8tgMepug56OIvn2i4cfxn872vd0jSmVFRne2+1laxHUrFpGHq9YM
	=
X-Google-Smtp-Source: AGHT+IGYPIqY7FXJoQZW+r6G/xWCsPNaz5p6AoN/yvvFk6bhqM/S0S7rwD88oYgpi4bW4sDngqYHlQ==
X-Received: by 2002:a2e:b0f6:0:b0:2cf:1f0b:5119 with SMTP id h22-20020a2eb0f6000000b002cf1f0b5119mr4313619ljl.17.1706533391207;
        Mon, 29 Jan 2024 05:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV72qncXuWBl3gcVE57EQABcPsNc/VOru7M6KW49bgmTjzn1+m4JEcNh1WqyHMokb1C2QgHwlOfEfjOqg1LBeQxewXGBsyaA2Wc5qjceDKhnueY0+OOMOrvkigO9A==
Message-ID: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
Date: Mon, 29 Jan 2024 14:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH net] xen-netback: properly sync TX responses
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Invoking the make_tx_response() / push_tx_responses() pair with no lock
held would be acceptable only if all such invocations happened from the
same context (NAPI instance or dealloc thread). Since this isn't the
case, and since the interface "spec" also doesn't demand that multicast
operations may only be performed with no in-flight transmits,
MCAST_{ADD,DEL} processing also needs to acquire the response lock
around the invocations.

To prevent similar mistakes going forward, "downgrade" the present
functions to private helpers of just the two remaining ones using them
directly, with no forward declarations anymore. This involves renaming
what so far was make_tx_response(), for the new function of that name
to serve the new (wrapper) purpose.

While there,
- constify the txp parameters,
- correct xenvif_idx_release()'s status parameter's type,
- rename {,_}make_tx_response()'s status parameters for consistency with
  xenvif_idx_release()'s.

Fixes: 210c34dcd8d9 ("xen-netback: add support for multicast control")
Cc: stable@vger.kernel.org
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this could be split into two or even more separate changes,
but I think these transformations are best done all in one go.

It remains questionable whether push_tx_responses() really needs
invoking after every single _make_tx_response().

MCAST_{ADD,DEL} are odd also from another perspective: They're supposed
to come with "dummy requests", with the comment in the public header
leaving open what that means. Netback doesn't check dummy-ness (e.g.
size being zero). Furthermore the description in the public header
doesn't really make clear that there's a restriction of one such "extra"
per dummy request. Yet the way xenvif_get_extras() works precludes
multiple ADDs or multiple DELs in a single dummy request (only the last
one would be honored afaict). While the way xenvif_tx_build_gops() works
precludes an ADD and a DEL coming together in a single dummy request
(the DEL would be ignored).

--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -104,13 +104,12 @@ bool provides_xdp_headroom = true;
 module_param(provides_xdp_headroom, bool, 0644);
 
 static void xenvif_idx_release(struct xenvif_queue *queue, u16 pending_idx,
-			       u8 status);
+			       s8 status);
 
 static void make_tx_response(struct xenvif_queue *queue,
-			     struct xen_netif_tx_request *txp,
+			     const struct xen_netif_tx_request *txp,
 			     unsigned int extra_count,
-			     s8       st);
-static void push_tx_responses(struct xenvif_queue *queue);
+			     s8 status);
 
 static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx);
 
@@ -208,13 +207,9 @@ static void xenvif_tx_err(struct xenvif_
 			  unsigned int extra_count, RING_IDX end)
 {
 	RING_IDX cons = queue->tx.req_cons;
-	unsigned long flags;
 
 	do {
-		spin_lock_irqsave(&queue->response_lock, flags);
 		make_tx_response(queue, txp, extra_count, XEN_NETIF_RSP_ERROR);
-		push_tx_responses(queue);
-		spin_unlock_irqrestore(&queue->response_lock, flags);
 		if (cons == end)
 			break;
 		RING_COPY_REQUEST(&queue->tx, cons++, txp);
@@ -465,12 +460,7 @@ static void xenvif_get_requests(struct x
 	for (shinfo->nr_frags = 0; nr_slots > 0 && shinfo->nr_frags < MAX_SKB_FRAGS;
 	     nr_slots--) {
 		if (unlikely(!txp->size)) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&queue->response_lock, flags);
 			make_tx_response(queue, txp, 0, XEN_NETIF_RSP_OKAY);
-			push_tx_responses(queue);
-			spin_unlock_irqrestore(&queue->response_lock, flags);
 			++txp;
 			continue;
 		}
@@ -496,14 +486,8 @@ static void xenvif_get_requests(struct x
 
 		for (shinfo->nr_frags = 0; shinfo->nr_frags < nr_slots; ++txp) {
 			if (unlikely(!txp->size)) {
-				unsigned long flags;
-
-				spin_lock_irqsave(&queue->response_lock, flags);
 				make_tx_response(queue, txp, 0,
 						 XEN_NETIF_RSP_OKAY);
-				push_tx_responses(queue);
-				spin_unlock_irqrestore(&queue->response_lock,
-						       flags);
 				continue;
 			}
 
@@ -995,7 +979,6 @@ static void xenvif_tx_build_gops(struct
 					 (ret == 0) ?
 					 XEN_NETIF_RSP_OKAY :
 					 XEN_NETIF_RSP_ERROR);
-			push_tx_responses(queue);
 			continue;
 		}
 
@@ -1007,7 +990,6 @@ static void xenvif_tx_build_gops(struct
 
 			make_tx_response(queue, &txreq, extra_count,
 					 XEN_NETIF_RSP_OKAY);
-			push_tx_responses(queue);
 			continue;
 		}
 
@@ -1433,8 +1415,35 @@ int xenvif_tx_action(struct xenvif_queue
 	return work_done;
 }
 
+static void _make_tx_response(struct xenvif_queue *queue,
+			     const struct xen_netif_tx_request *txp,
+			     unsigned int extra_count,
+			     s8 status)
+{
+	RING_IDX i = queue->tx.rsp_prod_pvt;
+	struct xen_netif_tx_response *resp;
+
+	resp = RING_GET_RESPONSE(&queue->tx, i);
+	resp->id     = txp->id;
+	resp->status = status;
+
+	while (extra_count-- != 0)
+		RING_GET_RESPONSE(&queue->tx, ++i)->status = XEN_NETIF_RSP_NULL;
+
+	queue->tx.rsp_prod_pvt = ++i;
+}
+
+static void push_tx_responses(struct xenvif_queue *queue)
+{
+	int notify;
+
+	RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&queue->tx, notify);
+	if (notify)
+		notify_remote_via_irq(queue->tx_irq);
+}
+
 static void xenvif_idx_release(struct xenvif_queue *queue, u16 pending_idx,
-			       u8 status)
+			       s8 status)
 {
 	struct pending_tx_info *pending_tx_info;
 	pending_ring_idx_t index;
@@ -1444,8 +1453,8 @@ static void xenvif_idx_release(struct xe
 
 	spin_lock_irqsave(&queue->response_lock, flags);
 
-	make_tx_response(queue, &pending_tx_info->req,
-			 pending_tx_info->extra_count, status);
+	_make_tx_response(queue, &pending_tx_info->req,
+			  pending_tx_info->extra_count, status);
 
 	/* Release the pending index before pusing the Tx response so
 	 * its available before a new Tx request is pushed by the
@@ -1459,32 +1468,19 @@ static void xenvif_idx_release(struct xe
 	spin_unlock_irqrestore(&queue->response_lock, flags);
 }
 
-
 static void make_tx_response(struct xenvif_queue *queue,
-			     struct xen_netif_tx_request *txp,
+			     const struct xen_netif_tx_request *txp,
 			     unsigned int extra_count,
-			     s8       st)
+			     s8 status)
 {
-	RING_IDX i = queue->tx.rsp_prod_pvt;
-	struct xen_netif_tx_response *resp;
-
-	resp = RING_GET_RESPONSE(&queue->tx, i);
-	resp->id     = txp->id;
-	resp->status = st;
-
-	while (extra_count-- != 0)
-		RING_GET_RESPONSE(&queue->tx, ++i)->status = XEN_NETIF_RSP_NULL;
+	unsigned long flags;
 
-	queue->tx.rsp_prod_pvt = ++i;
-}
+	spin_lock_irqsave(&queue->response_lock, flags);
 
-static void push_tx_responses(struct xenvif_queue *queue)
-{
-	int notify;
+	_make_tx_response(queue, txp, extra_count, status);
+	push_tx_responses(queue);
 
-	RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&queue->tx, notify);
-	if (notify)
-		notify_remote_via_irq(queue->tx_irq);
+	spin_unlock_irqrestore(&queue->response_lock, flags);
 }
 
 static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx)

