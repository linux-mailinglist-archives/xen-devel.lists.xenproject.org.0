Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIcaGQ1i32lhSQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 12:01:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE84030E1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 12:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282240.1564871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCx2d-0007W6-8m; Wed, 15 Apr 2026 10:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282240.1564871; Wed, 15 Apr 2026 10:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCx2d-0007Up-5O; Wed, 15 Apr 2026 10:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1282240;
 Wed, 15 Apr 2026 10:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCx2c-0007Uj-4d
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 10:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCx2b-00CaMR-H5
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:00:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df61aa-bab6-0a2a0a5309dd-0a2a4505d82c-14
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 12:00:13 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df61ad-3760-0a2a45050019-d155dd2ec1cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 12:00:13 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d04fc3bf2so3916226f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 03:00:13 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d6d3sm4063430f8f.8.2026.04.15.03.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 03:00:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776247213; x=1776852013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44CQNYnrERcsZdmbdj2+0ek2N0Tk9JZJVu6xznulA34=;
        b=iX/wF+9ecbDtt5zO26oi4BKGxrwxpYekE0ZMbjPkFPE0Xb8tvVWQeh+GiQj4GpEr3Z
         6v91w9hh+3EnGgSyHTPZnFKKWrv3FqSZVL00zQjGWv+yPqL5+oTC5ghFO8n2E6EN/4Xu
         MRdeMW8dOl5TAxVFt72EvApv2RAaRDtPUoUL0O63hgiuDizVl7NyO3vWgZwDctbmx3nx
         QAp3WO9UIA34Nl0xUfAzQ8hHyC+u49RvOhJlT16FBz7eVUzUsKqzNibHJpprCakWQxra
         DKsjdycFD7C6lqHUvf4t7ickd3/DSK9uiX57YljdeqyOMz7kyAu1mebMQ18aia3BpPDv
         f4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247213; x=1776852013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44CQNYnrERcsZdmbdj2+0ek2N0Tk9JZJVu6xznulA34=;
        b=H2w5TypSxid3dzGSvgQxBtinvTU/RoHPaujN2HQp4i0Amiqi0GbKmf0lvxi0DrxKTX
         U5P41sTbBCqnpqfBi+OD+SA/HiK0CXC1hXI4W5FCcLfCFfh+JCjqNTkLL/+1lf3uU59F
         tCff0DIaFTelm2NNDbs7rzUZGQopZAF6rFV/zQCTjpls9avRa+kQ9oH/g4q4jZ8lmR8F
         EgVeEOspupiwdzWAmi4zAIjqEO03EPpJkt/Sdc0LzqfRKWLUgLN0S+ElDfQYgJprtlwx
         S8TJ3ZpOASff7FD81HnZIteVYTxqKRQnRypGf8mOd6P7txwTqJgIEet4kPedz1g2B9tN
         ZEAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iaWOqAY9NnOZE46ZXXLoldbzhgCGmNi3LrCV4S1EZ9xix6r08Khq8D3O2UKnUioi+mfCK/Jjx4NI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5z7MeAjS+lT7VsGEzQJQ4hXI55O78s9QB9pEoEtAn2pXgQNAY
	8aM1j1jMZEVaoDW4yhszNix9S0oFhPaZpWmDQ2m614hRFTvuaoC9PZ8L
X-Gm-Gg: AeBDieu3t2J+9ZjKU6Bg+KRCD8xxp1HH1LZtEPoqMAQ/6eoBtRsih92emnz3/wIHM/+
	mWyVQHL6cJ9/FT37UgHpfslmFDLo1wEVHHSZeeQXYITRgJXNOl6zbXFwa/4R/yESMitzZT/CAna
	5Ze2WiN7AVjKf38wP1CUrwGMy3NeV3rbdNBEJxDCDnhzWCb5SfRMeA8PE0q/InX7INqDzPrDsuF
	mX3wMieQ+qnZtIr1kvpUh2aa5LVAfEcHJRay4wyoBRMjq2Um2erv3Fv9r1WkKmqucA9+P+xjD7y
	Kqa/wtus1IOiMxg+ff46YRJLufKPK1Dbi9+YL6hlv+RQgXgiroNiOV9vqMnyJ/08P8+JxlFSX5l
	CzBCYeaKgh10PeqYfYy+5U6GzBjZYqHg0Fi3IWMOgODGGO/IszP1qJ6C9lJxh8t8VnqjBWbdxkl
	YqGOhIhNAwp/vvMe+9UNnainXnf7uJCQOLqBnLkhST2B4U3ebc4ZofhK4ix/s73Vu0XDVp4ORKb
	wOsZDxJ6ytKSvXob+0MHGle
X-Received: by 2002:a5d:64e3:0:b0:43d:7b90:fa23 with SMTP id ffacd0b85a97d-43d7b90fe37mr16606962f8f.29.1776247212507;
        Wed, 15 Apr 2026 03:00:12 -0700 (PDT)
Message-ID: <d8c22d64-8b03-4354-bebc-062499ac010a@gmail.com>
Date: Wed, 15 Apr 2026 12:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 27/27] xen/riscv: add initial dom0less infrastructure
 support
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
 <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
 <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776247213-3959396F-BAABC2A3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4546
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: 71BE84030E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/26 4:11 PM, Jan Beulich wrote:
> On 10.03.2026 18:09, Oleksii Kurochko wrote:
>> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
>> providing the minimal architecture hooks required by the common
>> dom0less infrastructure.
>>
>> Add stub implementations for architecture-specific helpers used when
>> building domains from the device tree. These currently perform no
>> additional work but allow the generic dom0less code to build and run
>> on RISC-V.
>>
>> Introduce max_init_domid as a runtime variable rather than a constant
>> so that it can be updated during dom0less domain creation.
>>
>> Provide missing helpers and definitions required by the domain
>> construction code,
> 
> I'm wondering about the splitting among patches: There's half a dozen
> (effectively stub) functions which are added here, and then there is
> the single init_vuart() which was split out into the earlier patch.
> What's the pattern behind this, i.e. why isn't init_vuart() also
> being added here?

If it'll be more convenient I am okay to merge prev. patch with the 
current one.

init_vuart() is in a separate patch as it has some useful functionality 
inside and thereby it will be more convenient to review.

> 
>> including domain bitness helpers and the
>> p2m_set_allocation() prototype.
>>
>> Additionally define the guest magic memory region in the public
>> RISC-V interface.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Open questions:
>>   - Shouldn't declaration/defintion of max_init_domid move to common code
>>     instead of having it for each architecture separately? If yes, then what
>>     would be the best place.
> 
> What would you use to decide whether the declaration or #define is
> needed? (Plausible headers to put it can surely be found: console.h,
> domain.h, and perhaps more.)

I thought about to wrap that with CONFIG_DOM0LESS_BOOT as the 
declaration is needed only for this case, for all other cases it is just 
#define.

Or as an option we could always use declaration all the time. It won't 
increase size of Xen too much or decrease performance because of 
variable access.

> 
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -20,6 +20,14 @@ struct hvm_domain
>>       uint64_t              params[HVM_NR_PARAMS];
>>   };
>>   
>> +#ifdef CONFIG_RISCV_64
>> +#define is_32bit_domain(d) (0)
>> +#define is_64bit_domain(d) (1)
>> +#else
>> +#define is_32bit_domain(d) (1)
>> +#define is_64bit_domain(d) (0)
>> +#endif
> 
> First, please use true/false. Then, while I agree with the RV32 part, 32-bit
> guests surely will need to be an option on a 64-bit hypervisor. Imo you'd
> better introduced a field in struct arch_domain to carry that information
> (or to derive it from) right away. That wouldn't be set to non-zero for the
> time being, i.e. that same constant-true/false would still result.
> 
> Otherwise I don't see why you use #ifdef; you could then have things
> simpler as
> 
> #define is_32bit_domain(d) IS_ENABLED(CONFIG_RISCV_32)
> #define is_64bit_domain(d) IS_ENABLED(CONFIG_RISCV_64)
> 
> (but I specifically don't recommend going this route).

I will introduce a type in struct arch_domain then.

> 
>> --- a/xen/include/public/arch-riscv.h
>> +++ b/xen/include/public/arch-riscv.h
>> @@ -58,6 +58,9 @@ typedef uint64_t xen_ulong_t;
>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>>   
>> +#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>> +#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
> 
> What is this, and why does it need putting in the public interface? 

In other patch series such related things will live in 
asm/guest-layout.h. It will be moved there after rebase on top of that 
patch series.

It is needed now only for common dom0less code compilation as at the 
moment we don't use xenstore pages for dom0less.

But generally it is region which is used to allocate "magic pages" 
-special pages that facilitate communication between the guest and the 
Xen hypervisor such as Console, XenStore pages etc.

I have in my TODO to understand how to remove requirement to have this 
fixed region from dom0less common code.

Plus
> how come the numbers are exactly the same as what Arm uses?

It could be different. But this region is free for RISC-V too so it is 
fine to re-use.

~ Oleksii

