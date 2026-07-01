Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bzhAGC4xRWre8QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:24:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C2A6EF370
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:24:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N/ptbj7j";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1350141.1607702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewnS-0002nL-6D; Wed, 01 Jul 2026 15:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350141.1607702; Wed, 01 Jul 2026 15:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewnS-0002l3-3M; Wed, 01 Jul 2026 15:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1350141;
 Wed, 01 Jul 2026 15:24:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wewnQ-0002kx-Pp
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:24:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewnP-00ASPr-Qr
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:24:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a45310e-e002-0a2a0a5209dd-0a2a4508d0c6-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:24:15 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a45311f-edec-0a2a45080019-d155802bf0bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:24:15 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso7061995e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:24:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4d9daasm87438345e9.9.2026.07.01.08.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 08:24:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782919455; x=1783524255; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzAlXR1UrnSnynnOL2U7ASX4RUa5MGuJNSO2hUFkhrY=;
        b=N/ptbj7jwA5HCcah8ZmrrQ7PCrieYRzw44ujr50Z4Iho0JTzhjh2PmVsf/Mv+jecK8
         TrCTVvwZePLcU1P5aOzZW09CcqHCeUXhWsTQQBGbBjOo8qZnhOaAfE+QnUSmEeWqPav6
         6FsW76o6qBJtYsnFfE7G7+vPiF66VqScyYlkNjQJYMTTCsKapy4/y/aUXsEgcEdTG8cO
         BlOejJxTezq7uZWZ1IUJCtxp8qElH/PibBJih4JJedqmUFZE/UTrBQlkh7xZ9egdnsbR
         jY5izydwN64AHb4oYE6K/YCEZbRMyqDg6/HgK4hkbaP6KlsVeogQjXv313IIwqXDTQ38
         /dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919455; x=1783524255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzAlXR1UrnSnynnOL2U7ASX4RUa5MGuJNSO2hUFkhrY=;
        b=pEVKJQzqAscHAKZwvr0q1wQTorLw6nYxyZFKMauf+4BAKfpwQt8CraCW/SV7yE41Ea
         ta7LF7TCen0w6J0jiZ+AtoejUh7NSZA1WVJiRJClLESLlgA+yJqQA1oTinMYGcS/P5kp
         rhZmFtAAHtwZQE6RLBHnXZ4SWddgX644LJJnCYsDKyBIkwJiyHp8R6/QdZ7yHrd7Qov3
         IJEvwmfq304NGRNak8uDXXWp4oqYqhvRPbmdtdx1eSeDqcf5ceSsjbG/XhZf2+jqrdaR
         1yxq0ztcYMfBReLij3KHcCE4VsBK+GZpXqJ2nFosMtKT32GYHXzSoQAHhsq5HMEUkxwq
         mszg==
X-Forwarded-Encrypted: i=1; AFNElJ/mT/5OpAsp4N04p3s97mkiXEfM0nGYTi6Ne79yJKjgu+QEwVYqNcoFLcoo7qmXoUzlxsvTj5rSgLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1ENGHcMmw+bAgF4GsIVkoeZmLA0fapSo5BHw6s6grQscYlF43
	BueLT4cFY8+UtC+Z3hZbP5e3uh2wYDV9Q9m6pDCMKQqaKtZjIdo7ua7t
X-Gm-Gg: AfdE7cmJrqZjBHA4bIqAedJbxkGIsb+6lTro3sqkrAhCZubTxjAHTiFkGYnh2Xyz3bW
	JXkdQDxgyxdNpgO/DV1GkDHwq8R94qqAXxJx1ITH8+0O+n9FXvds19kDTPcOGOF5YOYJ6h/OZA+
	Oyze3XLfP82msQfXj0s3Gs/29+ZGlNYNzZOaKT1WLVomvJbi5oN8esfucL0fDCKurM71Fn2ZhRB
	0vWrZ4i4/7dNxEK4db13unTQw8yZO+WUD0ej2GMhTA2pljhOcao7r7J/GEhtcH/LbtJqRsUfen1
	6nT7zpKApPTjrCCpyGH2sjjIEWJsia9BJopeyQIwoKA8mwGltrhJ5F/BElbsaZYvNzyJ2SWObFt
	s4aUX0p/L8G1UfEig4BgpNYibduaVMyBsg3ybV4p90WYJDhv464hIU9A4kgn38Ub2LlRbW0jm+L
	HuNTiVnJMU5lQIhHwLhlPxcp/yXGC/L0d7d8+0YT60CaBpv2TDLSmpSYcsjddWi27wVWA=
X-Received: by 2002:a05:600c:35d2:b0:493:c3f9:65a2 with SMTP id 5b1f17b1804b1-493c3f9664bmr16518835e9.5.1782919454882;
        Wed, 01 Jul 2026 08:24:14 -0700 (PDT)
Message-ID: <c7aff2d8-14a7-4921-93d4-67228d871074@gmail.com>
Date: Wed, 1 Jul 2026 17:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/25] xen/riscv: add initial dom0less infrastructure
 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
 <131fc20c-1353-49fc-8f77-1ca13628ff17@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <131fc20c-1353-49fc-8f77-1ca13628ff17@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1782919455-A11293FC-C6D416F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3629
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5C2A6EF370



On 6/30/26 9:28 AM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
>> providing the minimal architecture hooks required by the common
>> dom0less infrastructure.
>>
>> Add stub implementations for architecture-specific helpers used when
>> building domains from the device tree. These allow the generic
>> dom0less code to build and let a basic DomU be constructed on RISC-V.
>> construct_hwdom() and make_hypervisor_node() are still stubs returning
>> an error: Dom0/hwdom construction isn't supported yet, and the
>> hypervisor node generation (needed by domains with
>> DOM0LESS_ENHANCED_NO_XS set) is not implemented. Both are marked with
>> a TODO and are not reached by the currently supported configurations.
>>
>> Provide missing helpers and definitions required by the domain
>> construction code, including domain bitness helpers and the
>> p2m_set_allocation() prototype.
>>
>> Additionally define the guest magic memory region (GUEST_MAGIC_BASE /
>> GUEST_MAGIC_SIZE) in asm/guest-layout.h. The base is arbitrary; the
>> only constraint is that the region must not overlap guest RAM or the
>> emulated device regions. It is placed in the unused gap below
>> GUEST_RAM0_BASE (0x80000000); the constraints are documented next to
>> the #define-s.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> Nevertheless, ...
> 
>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>> @@ -32,4 +32,16 @@
>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>   
>> +/*
>> + * The guest magic region holds Xen-reserved pages mapped into the guest's
>> + * physical address space (shared info, grant table, etc.). The only real
>> + * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
>> + * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
>> + * above; the exact base is otherwise arbitrary. Here it is placed in the
>> + * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
>> + * bank would work equally well.
>> + */
>> +#define GUEST_MAGIC_BASE  _UL(0x79000000)
>> +#define GUEST_MAGIC_SIZE  _UL(0x01000000)
> 
> ... while 16Mb may seem a lot, it feels pretty little for 64-bit guests.
> Even in just Sv39 mode they have ample VA space to map a bigger region.
> (As iirc indicated before, a static upper bound looks questionable to me
> anyway.)

I think the comment should be updated as for grants will be separate region.

For all others, it looks like 16MB is more then enough. For example, Arm 
has only 4 used pages (CONSOLE=0, XENSTORE=1, MEMACCESS=2, VUART=3).

So will you be okay with reworking of the comment to:
/*
  * The guest magic region holds the Xen-reserved pages mapped into the
  * guest's physical address space. The only real constraint on
  * GUEST_MAGIC_BASE/SIZE is that the region must not overlap guest RAM
  * (the GUEST_RAMx banks) or the emulated device regions defined above;
  * the exact base is otherwise arbitrary. Here it is placed in the 
unused gap
  * below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM bank 
would work
  * equally well.
  */

And add to the commit message that:
```
A separate region for grant tables will be introduced at the same time 
as the introduction of the grant table for RISC-V.
```

~ Oleksii

