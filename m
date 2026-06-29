Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihNCNW5EQmrQ3AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:09:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62B6D8B71
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:09:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FLuvsA59;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347434.1605288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8vo-0002t8-8R; Mon, 29 Jun 2026 10:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347434.1605288; Mon, 29 Jun 2026 10:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8vo-0002pI-5X; Mon, 29 Jun 2026 10:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1347434;
 Mon, 29 Jun 2026 10:09:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we8vm-0002pC-Ix
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:09:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8vl-0034kP-Vp
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:09:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a424445-e002-0a2a0a5209dd-0a2a4501d356-48
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:09:33 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a42445d-400f-0a2a45010019-d155dd2dec2e-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:09:33 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so3200842f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:09:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm50574795f8f.9.2026.06.29.03.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:09:32 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782727773; x=1783332573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J7crPza2txJo6zGn2WAQ3UH7EPrTtciJ4vYC2TRTao=;
        b=FLuvsA596Ppof2/UhHrkSRicxVjsU7LY7vVZnBxth1Z+o3ncnn9Wb/p4GwaxjUq4FQ
         iGWDcgGs0S82PyjxoIdAGU2TD6RdvMSfsaqO8DCI8TvjR3dZAqSZ4ptRoo9YB+tb65V+
         elLENzF4cdk/Lz6NVRpX2aPr+aJbl127ZphMStnCPX9C895Z6YxxSE5Fst2atV/oFEDW
         v9f5DQwL0JicizysN7j2dswzHUp7vvYLVglSHz/vKABx8L9SdBe6BnLVe1MXSahUvDlL
         9uf/TW9H3ZVP7LbN00tIx15+wvMQhgqyr24yAzz+VNOV3F0+efNEGXmdWQLltQkIRt3I
         1aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727773; x=1783332573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J7crPza2txJo6zGn2WAQ3UH7EPrTtciJ4vYC2TRTao=;
        b=HoJICV6GEz8knf+TvwuNolA6YyqU0yPh6wkn1bxJk9kbNsggry/7I0uu8qrCBrjtrn
         rSXR4pIWuiCuj0Mx9aCY26rdbYbraqMLmssghhitDs3rVJvK13EotBnPPb/cQvW8IM0O
         hBfCUoFkkEBObgTHVVUyxgMWXaum/s6Rdbv37tE9Q+iABTYT/xn8Uy1J88I9Jy9D+a8n
         KLEx+gMFyxpsYlAr0nmi8LjdK/aiwRHX6c7dNyDD8sSDyMxlq1u6aEFFMSsMLGk/QUdH
         yZ5GaOh3yAsGH87Gwz9JMkq53Bbrm6RWumCn4/ikga99qPSw3BWKjx9jwvReqW0EYleG
         9C9A==
X-Forwarded-Encrypted: i=1; AFNElJ/8tHDgUOfAY22JTXLZ235FkTzSRVwbx2X+Y2ZuF4hROjz+23nEFI8Ld29ioPO/NQZDwvOUAXScGfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4Z2JUwPn+jo4Xh2h5mC7eH11PyRgY1qUQYA75QWl+GzjiNxtd
	dB12IpfFCcftgEhPNgJ73cq+0byOVQUA4vklPew5itzXYAFYERjXUnTK
X-Gm-Gg: AfdE7cmDeraBJtXAdiQndkBNT21Bi+yME9fV0ahYpA57fuU0AYqGdnmJAw1VLiq6usr
	lSvl0RdmDJXv+DE2CnEAa3kA3hUJvjVZAukxUM0Q9afaoT2K/7gxbDNQbj8WdqoM7BDO3UTQjBq
	yueIipj9k9hkGP485KWAoQJRvpf7GeM6ey/NEmLF6GcymjyBIfS2nw6qLxVvWpgPgTGyfZVcyIc
	ov5vYWgjJmg/Sel/qyHpBVuLJAtDnamf3y5Xwx9sAN4x+J0jIBxoTViTW7YxWC43jOYQ9mjIDML
	BOZjUU7WlbMGxz41/ywROoFS4rq6Dhe0KUJXAfa+ZLNSHY/xlKvAgjoWwLCrvtDUUXoLU5/Xzxi
	xPyqgjFgiK8xqEk6bz0LdKlHV9NgUJx0pKcL3GRJx5T4bm8O8MMEw1JqIsjvGih0LD/MALv2oxa
	mgQnEWsGr41FjsOr3IV3sxa7yrD4h6b/N4q43wf/vINznCAmO/p1hZ4IU40/DVhW2cztQ=
X-Received: by 2002:a05:600c:8b30:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-49392c91fbdmr128187855e9.33.1782727773350;
        Mon, 29 Jun 2026 03:09:33 -0700 (PDT)
Message-ID: <f3aa7825-15a8-44aa-851b-f7a85c19bdc4@gmail.com>
Date: Mon, 29 Jun 2026 12:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/4] xen/ppc: introduce a dummy irq_to_desc()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-3-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260629094531.55555-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782727773-838C81E0-C5EDE67B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1013
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[citrix.com:server fail,lists.xenproject.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:tpearson@raptorengineering.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D62B6D8B71



On 6/29/26 11:45 AM, Roger Pau Monne wrote:
> In preparation for irq_to_desc() being called by common IRQ code.
> PowerPC doesn't have an irq_desc array defined, so it cannot use the
> generic irq_to_desc macro in the common header.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/ppc/include/asm/irq.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/irq.h
> index 5c37d0cf2500..fa70fd7d46dc 100644
> --- a/xen/arch/ppc/include/asm/irq.h
> +++ b/xen/arch/ppc/include/asm/irq.h
> @@ -30,4 +30,10 @@ static inline int platform_get_irq(const struct dt_device_node *device, int inde
>       BUG_ON("unimplemented");
>   }
>   
> +static inline void *irq_to_desc(unsigned int irq)
> +{
> +    BUG_ON("unimplemented");
> +}
> +#define irq_to_desc irq_to_desc
> +
>   #endif /* __ASM_PPC_IRQ_H__ */

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

