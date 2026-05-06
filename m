Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIjSHv5V+2n+ZQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:53:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBF4DCAB4
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301841.1576004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKdcd-0007UL-To; Wed, 06 May 2026 14:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301841.1576004; Wed, 06 May 2026 14:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKdcd-0007Ri-Qo; Wed, 06 May 2026 14:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1301841;
 Wed, 06 May 2026 14:53:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKdcc-0007Rb-Bf
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:53:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKdcb-009zh5-On
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:53:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb55ba-2eae-0a2a0a5409dd-0a2a4507e240-38
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:53:09 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb55d5-229c-0a2a45070019-d155d02ac10e-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:53:09 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-66b2d49ffb0so8905752a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:53:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55f513fb1sm90320666b.59.2026.05.06.07.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 07:53:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778079189; x=1778683989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8eCso9JF5h9nnziTzZhX3HW4IUp9A3EoU1q779h1Qs=;
        b=WSRjnhNntorNHDZayMTc5qkzQmlzvValy5WIp+absPB94hDKp9DIvbENnfTSq4LBpC
         JcSS1GyukmrJ5R4ovOZuxsSyj+VfAQWc89M43JjAOImVXrN8wMbT0z63LcqwbAId6cc9
         VTrlxl1RZMLxb+TqS7w0Lh1jsd8PAvxq5m7XIyh2IoLBVbD7dYGKcy0OagX2tT51ns6q
         0ajs1rxwre6Mq/AANivT69kTdEajB5qq+JD9dZpY2hc+Nct+/S5oMVY83HIOHTmPLkrE
         +LjEuJE34Q/71Wc0z71KHtU06fsx+2yKZ1UpMPK2y10qjeJ+Kf++gEBEkTyA8kp0Dgj7
         KkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079189; x=1778683989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8eCso9JF5h9nnziTzZhX3HW4IUp9A3EoU1q779h1Qs=;
        b=U+eKCkvGhestu+pYFeHJm5IHcbeeYNzYLgtgFRl9gxyg19UaYtqEPYxVxiFa6MN58B
         sjsdQLXo+qz5Zbn6bcyR4jLDcyOyhjbgJ2MyPoLTfJfCn8ldnkiWtnnJoLY9ltTrtFLd
         v4YTdsuGpDfXcPKvs3mOTCvDlO8KUTiP7Hsjic/qLALfqG7OGe4/3bAosuJXASni43J/
         WRhIcwyjbr40Ptfl7eArF6RQB9fP71qujPtt31iomkV3Ftr7+2pq0eRgeLpG9/WEpykh
         q+oK23WYMtm+rVazUqPrvMYo7i6nHXdsq4gfQ0VIaq87Soch+tpCWKk3TpmsZPisdTa1
         +8aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dRKhFse83vTMZ54k7QFUsVzwpFT9c2gKCdWZ6upD9FjjoPGm8u37l0KimDj09QFrOE80/YsdUv50=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxwtk55M9FuaQqMoUYRvmjGx/i96Wv3hTnOG4IIgN9QMj+QPUQQ
	VETqjzQ2Mjmyn65v88WkzE3vDNQrd1CoxsUMS06L1ZHAEDKN0HynS0Ab
X-Gm-Gg: AeBDievDPuo8Rt1K7hvy+m7LZJAXgUTRW0TetDFcq8KaUoMQrcb5H5KED+qrIT+GJC1
	9CzJkzoJnLyClkgll/OdkKUyxX/gwqZeSuyTZaqgYA+m+XJkQSybpXOy1hfPr4V+l0RyFede1sP
	hdrUSWQy/7PTW2Plm3nzL/u0hGRmzBZERv2iFM+yuuBZoYpdWAOi1HzMWZ5V8LWu4wPeFKmRI1/
	vLS/hOB25R18lZf+TgN76tY7p9Wsl7hAapTgNhEyVUYNxhSiE+JbsxKRYt7hA2Ma/p+GhEHV6S7
	PIYKHGwr+6JWZ0W/de7ZHcDpwwOf3Z+dYnWCsO5RqXM5psJ1bbDN1wTfAkyaZhgy0lXB6/IBUAW
	yqMl1JCUKML9el5TJqw0CTgOCHvlBKRKt8sw8W4V288fjqyZnysn5AgcfO9+Gui+fTUGWl6scpA
	mQ7/L5J+Q3ikhuuRxC4ZhtpkH9oAjQhypgnghXzHg62tG0w96GxnFOwDnmwmytivlnOVGsn9Ah9
	RNqMvhvcNvWdQ==
X-Received: by 2002:a17:907:709:b0:bb7:beb9:b6d5 with SMTP id a640c23a62f3a-bc56da16349mr234983766b.39.1778079189084;
        Wed, 06 May 2026 07:53:09 -0700 (PDT)
Message-ID: <082f5c79-0cf9-4eef-b80c-e5e9b594576d@gmail.com>
Date: Wed, 6 May 2026 16:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778079189-23175C48-A1A24B29/10/73395122804
X-purgate-type: spam
X-purgate-size: 1190
X-Rspamd-Queue-Id: 14EBF4DCAB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/4/26 4:05 PM, Jan Beulich wrote:
>> --- a/xen/include/xen/fdt-kernel.h
>> +++ b/xen/include/xen/fdt-kernel.h
>> @@ -59,8 +59,15 @@ struct kernel_info {
>>           struct {
>>               paddr_t kernel_addr;
>>               paddr_t len;
>> -#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
>> -            paddr_t text_offset; /* 64-bit Image only */
>> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV)
>> +            /*
>> +             * ARM: 64-bit Image only.
>> +             * RISC-V: both 32-bit and 64-bit Images.
>> +             */
>> +            paddr_t text_offset;
>> +#endif
>> +#if defined(CONFIG_RISCV)
>> +            uint64_t image_size; /* Effective size of Image */
> As this (apparently) is for both RV64 and RV32 - can the latter really have
> wider than 32-bit image sizes? If not - use size_t or unsigned long here?

It seems like we want to have uint64_t as it is explicitly mentioned in 
image header:

https://elixir.bootlin.com/linux/v7.0.1/source/arch/riscv/include/asm/image.h#L57

and also it is used .dword here:

https://elixir.bootlin.com/linux/v7.0.1/source/arch/riscv/kernel/head.S#L55

~ Oleksii

