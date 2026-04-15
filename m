Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3hLtMkND32nzRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 09:50:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2A401895
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 09:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282199.1564853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCv0k-0007xF-AJ; Wed, 15 Apr 2026 07:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282199.1564853; Wed, 15 Apr 2026 07:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCv0k-0007uN-7a; Wed, 15 Apr 2026 07:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1282199;
 Wed, 15 Apr 2026 07:50:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCv0i-0007uH-4O
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 07:50:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCv0f-009SHF-CZ
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 09:50:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df432e-5cb7-0a2a0a5109dd-0a2a450286d2-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 09:50:06 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df432e-42fa-0a2a45020019-d155dd29a8bc-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 09:50:06 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43d70c30767so2014780f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 00:50:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d6desm3437664f8f.3.2026.04.15.00.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 00:50:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776239406; x=1776844206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yr8dJFrwU5yb3+vX6Kokpw1l7MzGMIO02Sxm13Ouz1k=;
        b=kZOwhvEX7jzRxXIFvwtUv1F02taufBdubjZDnKfU28B7DTTAP5FKv9RrwkW9SsVES3
         qW6hcR3KHvq3bMSVOJFx3CxgHE6LPZnk3Usy2qn9Olf1qAyXGbzoDCe6takfdXAWj3Fw
         74EyJi5zSG5J0dCpZs+z7dL1vP+Z4Qh2LjZHEp31YlrZSwSPWzNuSHJiRsrG6sOYaHux
         3a0gyv5QaAIUrGq34SVJ/Qo1oCUyZNAmAtOUYbqvNoRlgjpDA7wiNSAgzwhco87EBuhX
         LyPYogoVR+h2/9+AFl8REnjqu63QA721z0LZkOOoj3K4670oYLJ6k1i0X94qDM2HSDMr
         K7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239406; x=1776844206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yr8dJFrwU5yb3+vX6Kokpw1l7MzGMIO02Sxm13Ouz1k=;
        b=NI+Q1wfn7RdRTWuqk2hQXUBKsTxPWZ0d5FEz0pCTRiwexnAlI9jiwOv6odMiXEpFGF
         +9Yfo1FhHsGmglkMAEQdZKP1HvUX4C9vaqFOd0PvVyQPo3MdsJrG6rWzY2SMcYBKu+IK
         9uS7bINwrBbkBikLbMSBNvHnHFZkZ2hqjRoJuII3BP480i+MTyMPmYg7YZWDZ5T9IGn8
         OoIke+mGG82yRpfplt2r7WP1Y4LzjwnongHPWNvj7MJIERqmh8b0IAgm/vTXKEDk6TmX
         56NVXlNsYpREuQtfoA4hMo+jF8EySZBDkGYBl3BuL6/RDK9R36B0Ha5lcJUvBRGJtB1N
         TuIg==
X-Forwarded-Encrypted: i=1; AFNElJ8qrLt2CXum2+splm3wKEuC39yMIMxpMwK/IZwZ0XkZFW0RFokxK9ecT1tefmH5nBu3DaNuPs3SLW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUA+q3ANedsdJbelvoYkXRgc8hggmxm0Up+/4em+6RiFxsZ8M8
	CN3+gocviWcUvozIO/2d42zgVfah6UGW6rYV8ccEaIVMmac0bTWK4XVu
X-Gm-Gg: AeBDieta3qaAK7NGXmQxQo/HHBiMCJ9QzBRuCIhO6IBdeQY3c9teBvVZ2PswZtvPjLw
	b2PiJiX3uvA4zPTSqT2klxkyjLSzYQIwTsCT8EUgjXbmb1FwSnkarB8FFOkLFUjh/ihtSAkOB4r
	qb5LoQBAp0gSik2nBg0TWFCYkPNV6dwFNoL4Dmc1AsdkCd0j5AiNoxBEqaTW3GcX1EntZEjxtjf
	2Bb+tgjXD7E7wPkFLtnC0RNk/SJltwQvqmiNVCdXTIuLh7RqoBsflajHz+sYqc2DTSsNx5kw6IC
	+G7FtigO7KCpiMlgUpUiPj5jUOQdTEz+DXwLLg5GJU+AGwTORNwt4TW+zRdAHgJRQIfO+RK/NOx
	HT/P8L/H+x/Pn5lsrzKVomS+H/2EJVwBUHz9rMErO9hFI3kMPQdoymvi2ZIDzViFc/X0oSpqJDO
	A8ZSCKZ3m7BRWHRrzbKibI1yN8tsXS7AIEuLCfrMUnJ9Dk3ZH5ysR5LViqFLX5iY5cvpqZq2sL9
	pvZ2zGMuWf1+g==
X-Received: by 2002:a05:6000:2087:b0:43d:779e:afa8 with SMTP id ffacd0b85a97d-43d779eb19amr17848318f8f.16.1776239405883;
        Wed, 15 Apr 2026 00:50:05 -0700 (PDT)
Message-ID: <6f4b3a0b-8c13-4c54-afa1-2893aa967254@gmail.com>
Date: Wed, 15 Apr 2026 09:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 21/27] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <61311834fef7cf8a736a8fa972b6461bbfd46e6d.1773157782.git.oleksii.kurochko@gmail.com>
 <cf20ebc8-ff58-456d-a7f6-c844cb427306@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cf20ebc8-ff58-456d-a7f6-c844cb427306@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776239406-45333CD1-4E509466/10/73395122804
X-purgate-type: spam
X-purgate-size: 1176
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: 6DF2A401895
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 4:58 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> @@ -96,4 +97,7 @@ void intc_handle_external_irqs(struct cpu_user_regs *regs);
>>   
>>   int intc_make_domu_dt_node(const struct kernel_info *kinfo);
>>   
>> +int domain_vintc_init(struct domain *d);
>> +void domain_vintc_deinit(struct domain *d);
> 
> The former has a caller added, but the later hasn't.

As arch_domain_destroy() is stub at the moment, domain_vintc_deinit() 
isn't called.

> 
>> @@ -87,3 +88,42 @@ int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>       return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>>                                                            irq_ranges);
>>   }
>> +
>> +int __init domain_vintc_init(struct domain *d)
> 
> The __init here and below is questionable again.

This function is called during construction domain only, what happen 
when __init section exists. So it is okay to have __init here.

Any use cases where it isn't true?

It could be wrong for domain_vintc_deinit() as it could be called when 
__init section was freed.

~ Oleksii

