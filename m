Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEekFveWlWk1SgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 11:39:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22331558D1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 11:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235426.1538414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsexc-0004aL-Ii; Wed, 18 Feb 2026 10:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235426.1538414; Wed, 18 Feb 2026 10:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsexc-0004YH-FX; Wed, 18 Feb 2026 10:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1235426;
 Wed, 18 Feb 2026 10:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUrD=AW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsexa-0004YB-TO
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 10:39:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ecf01c5-0cb6-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 11:39:09 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so4323464f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 02:39:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc9b2sm38027741f8f.21.2026.02.18.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 02:39:08 -0800 (PST)
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
X-Inumbo-ID: 0ecf01c5-0cb6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771411149; x=1772015949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vencrR2JmyyQ4hs7UisWeiRVl7NoQiOERDUJ2NlUUTA=;
        b=lqcNIgY1tgiazp2e6ENW8WA+7vhXuhbsK9PsREFDAz9rh75vE37Ht9HgGmMF0I/4Cp
         KhvBWdvFd2w/720U3pokgLM+yAkNY1tF0Y/52/jBQbXXySlZuYT4j9T4r0noV4B56NYo
         xzk0yyKPiA5QihDOKQ87G43At4Hwg4rNSkQ+SGq0NpCMY44NUF8NhcImV41ezgd/GYbo
         bW9wjqRgcBMBuDQovAvtoTK3DIfOL+us5bytnZ5I1Ik3NpUDS3YukuzUqjDUgvPS/6yf
         UmoID/4+Jw+Q3Akxd3YJTOs2cbcN8UfcqBS0JlfcoIHa8jG5zZOISdmWg+PLHL5we11L
         Y8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411149; x=1772015949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vencrR2JmyyQ4hs7UisWeiRVl7NoQiOERDUJ2NlUUTA=;
        b=tvL1f6fQLtEp+SzatduYT+26K10NvmU1tgJErtnxlL+6RyUDhf/NKmbmQyQQleiApf
         xpQh/XJHjEzS3B5JqfZZtfXYHtzbM235Fw8QHulwU0taLrF7mve7/XoZ5F3Mhth8I//U
         mjGGTxiuf3ArbpiB+qAYDb/wX2aFkH/dmGXJlij3CGB79DpMUdLv3U8evqWAkUJjBrLm
         GvQ5KguT6LtS1ql1gP45w0WJlvXYieOA3bPBrSseZNLucHkPWhULf+Dw/8aatppugu95
         KmjlTIsjDR9aVxS1PHvLJkH6ZX1M2obpuLe/pIluHxon4Nk8KTvdMdAB6eMdNcvjxNM3
         qoXw==
X-Forwarded-Encrypted: i=1; AJvYcCWhc+rCPHNPNPjOSz6rRg7DvuyQTPsPWfuNHr7ce+xWLYRSaZyU8OMC12B/dlf66QdCAopaSGRAiOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqpR7jJYDzJXupssdIHOqE5LP8yZE294dI8LEovwLv4B9MKq+f
	g5lvhkSZ0LKDFwVuQ+8S+xYxWnozGztBZpN8aDOqYuNhc/vgawzFEaF+
X-Gm-Gg: AZuq6aJE4qvbnffnMhlYEl2930gMVJd+ir3UuKsrBCO1Dv/abFWTFHRhMINiXqiqJBz
	svvn0PUmGDSD+La14VsHSQuj2dnqMCgUJShgcEq3kkxx7w5qut6KLYN/DFNJ60jHfeWnDCBUyhw
	l8PpeHjhRvEhsMVxzh9Cme1XnW8WfkWxsaYh+uoVX6yPcMhlVA9cMsd518KYsfMIWEprSKoFl4+
	B/qJ5Dfm4zvkisPNann4jgpnS5vRXSpakUSvKUDtASPRjAAOI7iExXQQHc7fvHNYnXchd5pO3Su
	uPccRPoJzYEA5b8TM9+8kDaMqYDNmots+OuQ50pf8ulM8pAXAD+pcR23E83oxe/Dd8zTcBQpdnZ
	pqv81TGrttt8IEcRgUpvUXHABz0y6DLF6qAqo4aGqvEVY/VMs5l5eXhjAkFrp1Jp2+7jjHQLV2L
	iN5xOYoQfeClIEGZYLUjnvzsS9HEoIW1TCXtA29Y84bkS2CwMPNgqA6Sv+pGpD/yfjZSiQw2RLc
	ro=
X-Received: by 2002:a5d:5f88:0:b0:436:23a2:5e25 with SMTP id ffacd0b85a97d-4379791b776mr31153185f8f.44.1771411148954;
        Wed, 18 Feb 2026 02:39:08 -0800 (PST)
Message-ID: <760d7b95-2e76-453c-8d13-ca4432eb22e5@gmail.com>
Date: Wed, 18 Feb 2026 11:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B22331558D1
X-Rspamd-Action: no action


On 2/13/26 2:11 PM, Jan Beulich wrote:
> On 13.02.2026 13:54, Oleksii Kurochko wrote:
>> On 2/12/26 5:39 PM, Jan Beulich wrote:
>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>> --- a/xen/include/public/arch-riscv.h
>>>> +++ b/xen/include/public/arch-riscv.h
>>>> @@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
>>>>    
>>>>    #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>>    
>>>> +#define GUEST_RAM_BANKS   1
>>>> +
>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>> +
>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>>> Hmm, does RISC-V really want to go with compile-time constants here?
>> It is needed for allocate_memory() for guest domains, so it is expected
>> to be compile-time constant with the current code of common dom0less
>> approach.
>>
>> It represents the start of RAM address for DomU and the maximum RAM size
>> (the actual size will be calculated based on what is mentioned in DomU node
>> in dts) and then will be used to generate memory node for DomU (GUEST_RAM0_BASE
>> as RAM start address and min(GUEST_RAM0_SIZE, dts->domU->memory->size) as a
>> RAM size).
>>
>>>    And
>>> if so, why would guests be limited to just 2 Gb?
>> It is enough for guest domain I am using in dom0less mode.
> And what others may want to use RISC-V for once it actually becomes usable
> isn't relevant? As you start adding things to the public headers, you will
> need to understand that you can't change easily what once was put there.
> Everything there is part of the ABI, and the ABI needs to remain stable
> (within certain limits).

Considering this ...

>
>>> That may more efficiently
>>> be RV32 guests then, with perhaps just an RV32 hypervisor.
>> I  didn't get this point. Could you please explain differently what do you
>> mean?
> If all you want are 2Gb guests, why would such guests be 64-bit? And with
> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
> even a 32-bit hypervisor would suffice?

... now I can agree that Xen should permit bigger amount of RAM. At least,
(2^34-1) should be allowed for RV32 and so for RV64 so it could be used
like a base for both of them. As RV64 allows (2^56 - 1) it makes sense
to add another bank to cover range from 2^34 to (2^56 -1) for RV64 (and ifdef
this second bank for  RV64).

Would it be better?

~ Oleksii


