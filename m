Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CL6tGbqAQmrX8gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:27:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F253E6DC04A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dXJQD9qX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347579.1605414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCwW-0001FL-EC; Mon, 29 Jun 2026 14:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347579.1605414; Mon, 29 Jun 2026 14:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCwW-0001Dw-BP; Mon, 29 Jun 2026 14:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1347579;
 Mon, 29 Jun 2026 14:26:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weCwU-0001Dq-KY
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:26:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCwT-00D9r3-9Q
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:26:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a42808d-2eae-0a2a0a5409dd-0a2a4502ec76-32
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:26:33 +0200
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a428098-5a27-0a2a45020019-d155d0b3eca6-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:26:33 +0200
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-39669bcaadfso36345901fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:26:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aeb4d0b8acsm1490689e87.57.2026.06.29.07.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:26:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782743192; x=1783347992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qPp0ShMDWpSXBP73Z2ztZUp1PjL4clZ+5pXUaWwXuVk=;
        b=dXJQD9qX3VefwjllEc7x2yvKr2WjZfpyYQu8BPgWq3qo87+TkAfzVksniduihNJilj
         vTHOW1/VIq/0OVw8wpxgJ9IHmV/T0KSPzFMqNUb1AdPkMUjHGu5NIKKuqU+UNr01yFqU
         KIeOIvwGhGZHWOxC6SCYiwQPuLtBAduHA3dvJdkfuDj6akiQq2lzDS3FfM43TLCVWkT7
         ZMfcPE3nL5lilKkLKPtxUoR++c6f+HyrPii1cRJKUvGbyPTinv6VWW29w2bNMOLtV1z2
         0Enxfqs3ILACFJGasQIN5FTMZSxe7b5IwPcEt4C+PdhJ3ISyd5K6HSgr3Seo1HJfyd1a
         cDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743192; x=1783347992;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPp0ShMDWpSXBP73Z2ztZUp1PjL4clZ+5pXUaWwXuVk=;
        b=WuPY1x0m8fcxjJCdHkNBC+4/Rd5/8Y5aB6+oCKeKfsmt25ZHavNzqBGsPLj4s+E0Kn
         MbgpzZ1ba06kwVhEpvrHQf+EIfWv/Fuz9lyoocJvV5BsjIooCeiXu92oGltIunixt8T4
         1Ghwb9DTGTM0ipqwdbECZO9KLO+7SlyIh3iMgmRUa52My4fSOknhzG0tZeR3d6+cVdq+
         t/3fDCC7M0TYF0fXjMCO8PqXURFATF6hMtIgmnksPN7yQZYNY0zT2zZ82enCul278Q9Q
         0qKOH4zNBOMm4orVLYMUXsaRzFZmuoHjRDef0hcnBdCg8OEPz+HrFbxk11HAqLIR+oVV
         FS+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoObWRWnK+a5cGKtU9RfYdQmUn7mtiSTGEb3uFXfsbbYUmDTHXTYiiIf9xT/Y4F5qbuqkjC2YuPtFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ3zdZzsAK7pVdy2/t10lQrPUVKFSUR65nMCsM76dbiXmq1qlM
	GkyfZCFbiUd+kblutbq9B9VlOfY7Yxva01wQMbRvCiYFBvbaNO7sWw/R
X-Gm-Gg: AfdE7cll9cKAm4aXrgYSSaEGd358RjQzQSMkIewAebCxI2/dWJLekJOH8z8R6cWBTux
	jzTSSYLFYqDe/9VbUPtOR05S7XbJ/cEb7/lr2A5R4SGmfojGYXVdSchAmduzHXplZUV1qOXZ/eE
	pkBdFu0nhbgipvnLlJhgtbB7yT9L1q8BV6yu7QeHrkHoX8+c7mq2csw0G1bXWubCoPyJfxf483o
	NXWN8fdKErtK8q7DqZTx8PmHDwro+ftg8fkz939e9LK5xAMGOFNxzfeDNrbbSi01BKGoQEkNYR4
	NRpYWFUJGEhC1jEQLCFt4lojymF72NmyPj6vw+cYVvJVZTP6ofF2R3YD7RtV8P5gSKhFtIeAvER
	i/qkdTKldKln2+0oJ2draK2ySy6Ek/Pvux8u3ErXbwLzNpKTNQp45oEm2wzpnG8bWMoTXNcwOSb
	JFRG67eFdNVTo/PdlWIB9QRZdFF7Nuel/v4T6Hijz4FmWTJJSAoBWGS7gkwmO8FVY1mVw=
X-Received: by 2002:a05:6512:651b:b0:5ae:b0aa:fbfc with SMTP id 2adb3069b0e04-5aeb0aafcb3mr1725172e87.34.1782743192356;
        Mon, 29 Jun 2026 07:26:32 -0700 (PDT)
Message-ID: <3d1e8a4b-888e-4948-bcf9-1302dcb80a14@gmail.com>
Date: Mon, 29 Jun 2026 16:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/4] xen/ppc: introduce a dummy irq_to_desc()
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-3-roger.pau@citrix.com>
 <f3aa7825-15a8-44aa-851b-f7a85c19bdc4@gmail.com>
Content-Language: en-US
In-Reply-To: <f3aa7825-15a8-44aa-851b-f7a85c19bdc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782743193-4E5147C5-86669801/10/73395122804
X-purgate-type: spam
X-purgate-size: 1167
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:tpearson@raptorengineering.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F253E6DC04A



On 6/29/26 12:09 PM, Oleksii Kurochko wrote:
> 
> 
> On 6/29/26 11:45 AM, Roger Pau Monne wrote:
>> In preparation for irq_to_desc() being called by common IRQ code.
>> PowerPC doesn't have an irq_desc array defined, so it cannot use the
>> generic irq_to_desc macro in the common header.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>   xen/arch/ppc/include/asm/irq.h | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/ 
>> asm/irq.h
>> index 5c37d0cf2500..fa70fd7d46dc 100644
>> --- a/xen/arch/ppc/include/asm/irq.h
>> +++ b/xen/arch/ppc/include/asm/irq.h
>> @@ -30,4 +30,10 @@ static inline int platform_get_irq(const struct 
>> dt_device_node *device, int inde
>>       BUG_ON("unimplemented");
>>   }
>> +static inline void *irq_to_desc(unsigned int irq)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +#define irq_to_desc irq_to_desc
>> +
>>   #endif /* __ASM_PPC_IRQ_H__ */
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

