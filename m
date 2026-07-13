Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+fICN2bVGraoAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 10:03:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2774879B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 10:03:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cLonAvoZ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361521.1613729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBdC-0000nv-OG; Mon, 13 Jul 2026 08:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361521.1613729; Mon, 13 Jul 2026 08:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjBdC-0000lW-LA; Mon, 13 Jul 2026 08:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1361521;
 Mon, 13 Jul 2026 08:03:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjBdB-0000lA-0o
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 08:03:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjBd9-006WYv-OU
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 10:03:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549bbf-bab6-0a2a0a5309dd-0a2a4505cdd8-0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 10:03:11 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a549bbf-4f1d-0a2a45050019-d155a731d078-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 10:03:11 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5aebd52488cso3036431e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 01:03:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b023b5931bsm1909355e87.42.2026.07.13.01.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:03:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783929791; x=1784534591; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJaaNBM0vez1sanSbzaR4Enuu25yBNyUXntF2Fw+5h0=;
        b=cLonAvoZhLGW61UeT8sbFwMRTUFTffqU2CeWyb0UIiqkjE6UbhuRQYg8P6xaLoxpPw
         r1dmfiEiAS9LQs/XNf4pR8NRzBMGX5t/FItgwobns4W12sCUbZtZxMIxxOy39lD7eCK3
         +I4PbdrhEwvpYhZfEY7pFf7fW0aDAmsGk1FFgDH+oJZb2ahZU55YypSOiYQLe/+eCDoU
         UkOxcada1hdJjcTO3yaWe87V3nr0X3v0pJzBDHtJU/t22m2uV5oyKT7HIJgsd3tlu/81
         zmeHoISY1WetwvjLT7k9JcIBGEJc1qT8seidzAUE99ncWKH6AXbA8UR6udaJO7Tem+Lg
         QkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929791; x=1784534591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJaaNBM0vez1sanSbzaR4Enuu25yBNyUXntF2Fw+5h0=;
        b=aY2X6SuuxhLPDUhvguEfErnoa3FfcW9vT9bQxRcW8YBmIlw0LtixcbYiaBzZUkLFvz
         YhGxxOHr+s+g0I/WD8mY79vsgyE+NiUn3PvZrvIawxqrfgnSz5N06A2Q8Kz75DjRXNSw
         BzecgueJqUcrJv6n+mi7tb60cx6XhpT0vBtEYKXS4w0CUWoeYT/TAJhzSCqoOMt5LiOh
         g7Xl6U8ErLRMD/LWS3n5h2W8/LSbiTNglhJbu+WBFg/g0JydwfGnGYyp8yU/jOAa87Gu
         6EZ+Uxdj5i1nPxJvSLIZqFck0XSn3pd/tbwtx7gOqhrr29QLM5aKJ4CcytderTi2nRYA
         Fu5w==
X-Forwarded-Encrypted: i=1; AHgh+RqeaVAimtW3jzklmdjQpxUx02ECwu9AUDY61biSHioSIGuSUpAWA69hDQTDhOddXqkQMoHhM/ze0GA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIO+ZBCW0uG7fbXFxcyeTEHNnrIIjg6qcVIXHq9ajvA2CLGMPr
	RhmXu4ob3GBwDHYWpppmyylo6uK7QzKydW2NFPjGrDlN2vMjxG3OLzWW
X-Gm-Gg: AfdE7cliR0tn4D3ACbjYt2hUsT4hdqvnGLQRWNdKG+Z1uEybRb0+JpJ4i0fDrak4Yzg
	JQbdsUhOVBDBlJsF5o20577nvQiQuAPaoPyJ5jMTlwwa/kYW+6I89tWCstFyDY52UH4CfOEX5q9
	suS5mlE/c+JtDD0LRtrJioF5RBB6J7zoUJaXzvftGpnv2rJyKl7KHfLpNE+T8r/Dz9aZwFF8F3D
	yRLA48pO5Mq/X1RWR11mqaJpftvAdJoPoM/+BV6xsPhQcD32qTcY875o/eKrOeKwj6dXRj87gEF
	B3bsI1GGSwlZIxGmsC8poFgRkMfNct1e+tdLtw+VQ+vp2z0cQOWbQ8CcCVT3QUDKBB+xqm/Gebx
	jSmXZEzjH1guOAjb3Je00PWr07p3UHJrIdAosW1NYUYwG3dFmyOx1+6Zfk8vKws09V7pyp6Ts2J
	BUOcgc826CguDgFIHKlonW1QviGTOA/gKVH8xSd6AMdDhm3JFG5jsI/t6yiY6k2yhAnyY=
X-Received: by 2002:a05:6512:1253:b0:5b0:1b78:495f with SMTP id 2adb3069b0e04-5b0236b29fcmr1724653e87.43.1783929790938;
        Mon, 13 Jul 2026 01:03:10 -0700 (PDT)
Message-ID: <90c3eced-ab82-4934-9ef8-bf664768f955@gmail.com>
Date: Mon, 13 Jul 2026 10:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/arm: derive GIC CPU interface ID fields from
 the vGIC
To: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783929791-DA94612E-84A444C5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1452
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ED2774879B



On 7/10/26 11:31 AM, Mykola Kvach wrote:
> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from
> domain_cpuinfo, which is initialized from the sanitized host CPU feature
> state. This does not necessarily match the virtual interrupt controller
> configured for a domain.
> 
> On a GICv3 or newer host, a vGICv2 domain can observe a nonzero GIC
> field even though Xen disables EL1 access to the GIC CPU system register
> interface for that domain. On a GICv4.1 host, a vGICv3 domain can
> observe encoding 0b0011, which advertises GICv4.1 CPU interface support
> that Xen's vGICv3 model does not expose.
> 
> Derive both fields from d->arch.vgic.version in every trap path. Expose
> 0b0000 for vGICv2 and 0b0001 for vGICv3. This covers
> ID_AA64PFR0_EL1 and the ID_PFR1_EL1 alias in AArch64 state, as well as
> ID_PFR1 accessed through CP15 in AArch32 state.
> 
> This is consistent with KVM, which derives both ID fields from the
> configured virtual GIC model.
> 
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

Considering that patches mentioned in Fixes are from 2020 it doesn't 
like that the bug is too critical unless maintainers tell that we have 
to take it I think it would be better to postpone the patch until 4.22 
release.

Thanks.

~ Oleksii


