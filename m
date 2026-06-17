Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SCnKEg6EMmpg1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:25:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB26990A6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:25:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JuRpvAtI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340270.1601322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNx-00076B-3w; Wed, 17 Jun 2026 11:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340270.1601322; Wed, 17 Jun 2026 11:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNx-00073l-0k; Wed, 17 Jun 2026 11:24:45 +0000
Received: by outflank-mailman (input) for mailman id 1340270;
 Wed, 17 Jun 2026 11:24:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoNw-00073Y-0v
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoNv-00FQkN-Cf
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:24:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283e2-2eae-0a2a0a5409dd-0a2a4501e52e-28
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:43 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283fb-c1f2-0a2a45010019-d1558035c128-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so40865095e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:24:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa510e7sm183139075e9.7.2026.06.17.04.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:24:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695483; x=1782300283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMmTDZAZQ5CYBrZ84kNhUKDDllyUx8mmPG2Ey5EmUQw=;
        b=JuRpvAtIKrjGIRq8YHu/T/yi8GHZ8i8E6uRbIPJZQg5OKAiC4zJ3i4SKGqquleBJNO
         bQbY7V4KgGz6ZlpKVhQxEng1WNUO3Lkzianl2yROluq7TX0HVnOq4nbQy7C7fU457qYA
         RUNqBFWuJLSdQSNan9iRXgxD8gHG6s3eoHuFgUXPkxdk4v7DlVHGyMlJ+T/F/1qLDdaK
         ovTAm3NYoQq90l3vNKG26if/r7bVWee+57ciZaOiGxCPk5bQAAINdz2paWiwjRFMx0MP
         uz46tzBS/6OH6k9fLx3YJWsfC+1pLS5XOPYde+bFRKk3KhrU1cMUdI390PVlCnO4rPki
         EeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695483; x=1782300283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMmTDZAZQ5CYBrZ84kNhUKDDllyUx8mmPG2Ey5EmUQw=;
        b=KZUOo9Bv4PbqHEptGB6io4CFJ7hILPDRerD/CMt6W2Tv5noTVgLrtOpIUi5W0fDQIC
         Lu96B0YC8ydGKQjAHYx+oacl86huFGub6YgjI7bpPeDF7HTuxgeSVCR2lSEF5ZaDgjPZ
         Y3Fa87duJ8bkgGwYRVSKCIADw/vf1Lv/it4Ws+qxQIItmelBOrrTgPFi6WzdnAFLlx/k
         UMGsiY+UxQsWZInDAOvE8e3qvrtnq/ugrXi8MoE3KzzdiEcK91a03aCqdwMN8suSDHCm
         rlQ2eO07j016JhlmrhktCDxbdio+1CrKZwG4678gRq/NTcz7yfBBFjFzyqH3guyFqyl3
         Rlhg==
X-Gm-Message-State: AOJu0Yx8K10aj3meEA5kqW1XrEMWuHG3hQdU/DbKsrzM9nCj0j7RDn3D
	Ak9gygJFv+yjcJ82tSJcn2sIRwAJAb8xDBNYdbF1/u8QYePC2vsfepv6cxqRcw==
X-Gm-Gg: Acq92OGB+2t+0P/GgclLomg0BspuD1JvUufh0nuStB1B6bkrc4iqtz8oERIPSUk7gFw
	h2HNXE42bm1j/LczbKZszWPSlsMr3of1blvpmm0tY5rtVBBOggdh0Z2ZONqtfBtPXJlFf4NOm5/
	vmZN4O0joqDMmcl+ETKrYD+zZTX9cNDksHaSRtP3uCgL4ykZW1CcXsAff18yPyfdns1fbEi7foL
	fxJknOGb4eHNONhdl+MXRaWPuL3tvL4y0GY33kXgJLSVZrQFTFt1rOEkrZ/W0NkuFOGWbJWAIlY
	QZhLboTVB4U2fP9lAQIUQr9ZETvMaN/K+yOZ2ylwZ9v60iqh47qSVIlIgEoX5Q1UKN+Ualk5xVh
	+tjlnLrj5zxU137r4mBfyKs0Py+ZyHcPoOmO8UemMlWwdC1xQ1eqB57chPTbeNHIkJqE18PYb0V
	z1kZyCr1QGedcQWca7nD32VkwNsE+1JWC0vES1aBIm2MnZvnr23ry8GFmRg7ESINsqGZzjnNP9+
	K8ZVw==
X-Received: by 2002:a05:600c:3541:b0:492:1f06:ec9b with SMTP id 5b1f17b1804b1-4923412f3bemr46205235e9.24.1781695482521;
        Wed, 17 Jun 2026 04:24:42 -0700 (PDT)
Message-ID: <ce811c62-3fb4-4389-b51b-1e01a1c0f0b5@gmail.com>
Date: Wed, 17 Jun 2026 13:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] xen/riscv: create APLIC DT node for guest
 domains
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781695483-AC457FF4-891315CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 353
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16FB26990A6



On 6/17/26 1:17 PM, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,8 @@
>   
>   #include <public/xen.h>
>   
> +#define GUEST_APLIC_S_BASE __ULL(0xd000000)
> +

It should be here _ULL(...) or even _UL().

Sorry for inconvenience.

~ Oleksii


