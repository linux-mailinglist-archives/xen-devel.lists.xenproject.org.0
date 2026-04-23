Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDyGETQj6mnKuwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B5453427
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292110.1570687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFuOr-00010Y-Vv; Thu, 23 Apr 2026 13:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292110.1570687; Thu, 23 Apr 2026 13:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFuOr-0000xx-Sv; Thu, 23 Apr 2026 13:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1292110;
 Thu, 23 Apr 2026 13:47:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFuOq-0000xo-CK
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 13:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFuOp-00BOrw-PI
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:47:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea22ea-e002-0a2a0a5209dd-0a2a4504a594-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:47:23 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ea22eb-1dec-0a2a45040019-d155a72cf104-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:47:23 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a62a049c1fso3967626e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 06:47:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc64bsm5314499e87.31.2026.04.23.06.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 06:47:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952043; x=1777556843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zL/QTwRekXjkViFAyijHzcrWgAnvayF89IMbugwrwiE=;
        b=WnaieEVUZF0MN2BJR/LW1S9Gt/7B5oC6CoeB17PYp/Kw9ngJddLkDn4VYhhrMCnZw9
         Mx+O2XxctWpuCXRDvVZKewyjxZsDdPay7+n+W59d5neI6nIFQgfzNUjOgO2SUZ4Tj4LS
         uOil1L54jW9oVYZHk33q2hOPzLBmr/v922uvQj2VIw7kKGSq+/GELhI7baQNXeyzwO5q
         1pDf7ie4Jr8Nzeb0i16Zi4YNdCUtvgNJM6blpvhUVm3bsyk03SLM7SfQxw+oB7HATyW0
         g2CNkzzNA+/RyEQvd3nZCjRByzZ+a6xuEfYhe81DvW8YTYfxoEAzn7Exr7LyqMandAZ4
         Y6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952043; x=1777556843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL/QTwRekXjkViFAyijHzcrWgAnvayF89IMbugwrwiE=;
        b=jroCgr8Igzc/6nFFi/70uyBehowUU92SqpHLGjVoX6kMzbNYRKsHoTxT0fVxrupPL9
         JPtZVDdjffoIYX6vm0udmKeJGPGjlDiqt2Wyjx+kG/yvHqcL16pfFq1VOpwBqcXYwIzf
         uWGciqIhYAU+RkTT3iqLSDC803qIpgxslBHzE5qZ+MAaAqhlnjNlyP8AdiBjPODzzs9n
         FqOMShAWVfU9XL4dMq+lE/hUjZcVkhKOuQEbuBQHHLITsxivFlUhIfN10oEc9oiCeS+b
         0PN72OYIzabJ2ivhUgyAHE7gOu/MJ3LYpnRu1yiy3xoggmwJgUOjM7T4WDXF/RQacakr
         9nhA==
X-Forwarded-Encrypted: i=1; AFNElJ/7pjENu9IZ5fnRypZalmF8YVsgZxXJEhyoJWoBSutSYTfeev2ALqfSWsKPZ3VvF3y7AH3gHkxtzps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbfyn+W39digGhCtkZQlX3fFD0wyXwRR+83H9bu2Wd8PaB3+vG
	hXv2n6BeXs+UQ0e1HC+rCYWDtDwszy3p3yC1egdiJMDp6HupkCQtdgsI
X-Gm-Gg: AeBDievKV6HAGpfFx798MtpOlp5hFdgimxUWSObdgL/k+e4pTNHWp7gMhPnhqDK1UYP
	NpDTGORaRn9W01RSeWbOgq7gv9CRHqoB6bPDXl9kFKEKMdzHbeg+WWa4poolaW0xGj9IOzAzCyE
	+mipOeBfbf10CtrGfVFMiUN/sj4fzWA9VYgTHz7EripEG3UvAFRaTtkYdEujHj/LzO8dcL5NLAZ
	gXRLtCnsgCbl/mkonDVE/I1nQ7sI4EQKYK16K5hD4sqyrQD6QR5OOMVCGUVnZttGyY/FkDBOjs6
	kZQVkuUVQjkpnEZ4SuxbVZ+H2nu6DNZRkhMAuZ3ncd7E9a+VfZeqRJBwBulTL+oqr1hEHGrWEZK
	eKNEOMz0KdJAQRZ7848k0Avgx5TkS88lM2jNbvbC6EMxe22fLVjxpCoRaHhsqKVaCsd9rEu5lC+
	Eky44CIG6Fl4Ua2qouxFsmx5urjAM1MVmQuAK2AHDGh9lm8Y9YTWGTIl9Ip6bUFpLulZKoDkP8T
	96Rs2LNkDZOjA==
X-Received: by 2002:a05:6512:3193:b0:5a3:ed0a:efb4 with SMTP id 2adb3069b0e04-5a417303404mr9216605e87.38.1776952042563;
        Thu, 23 Apr 2026 06:47:22 -0700 (PDT)
Message-ID: <cde7a080-4501-4641-8848-2035e2370ab3@gmail.com>
Date: Thu, 23 Apr 2026 15:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] xen/riscv: introduce p2m_gpa_bits
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <87d8050f252fb76e241a40809763e60d9874e902.1775836193.git.oleksii.kurochko@gmail.com>
 <14ae97df-cb9b-4b43-bb39-6b9395ad918b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <14ae97df-cb9b-4b43-bb39-6b9395ad918b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776952043-4B96A3FF-04756393/10/73395122804
X-purgate-type: spam
X-purgate-size: 965
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A6B5453427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 11:46 AM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>> common/device-tree/domain-build.c uses p2m_gpa_bits to determine the
>> upper bound of the GPA space when searching for unused regions, so it
>> must be defined when CONFIG_DOMAIN_BUILD_HELPERS=y.
>>
>> The variable is initialised to PADDR_BITS and narrowed in p2m_init() to
>> the GPA width of the selected G-stage mode, allowing an external entity
>> (e.g. an IOMMU) to restrict it further if needed.
>>
>> p2m_gpa_bits is a global rather than a per-domain value, which is
>> acceptable for now because all domains are required to use the same
>> G-stage MMU mode, as dom0less common code allocates it per all
>> domains.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Pretty hesitantly:

Could you please clarify what specifically you don't like here?

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii

