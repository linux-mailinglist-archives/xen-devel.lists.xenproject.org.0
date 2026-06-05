Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jjtzBxiXImp3agEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 11:30:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F02646DA6
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 11:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bXbHj+37;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329281.1593500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQrn-0002zE-Gb; Fri, 05 Jun 2026 09:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329281.1593500; Fri, 05 Jun 2026 09:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQrn-0002wQ-Dl; Fri, 05 Jun 2026 09:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1329281;
 Fri, 05 Jun 2026 09:29:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVQrl-0002wK-Vb
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:29:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVQrl-00AHg9-1e
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 11:29:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2296ea-bab6-0a2a0a5309dd-0a2a450590e4-20
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:29:25 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2296f4-aaa8-0a2a45050019-d1558035b840-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:29:24 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b7866869so19873245e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:29:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f5612sm23045297f8f.15.2026.06.05.02.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 02:29:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780651764; x=1781256564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiPdAtVLe52MfyJeeBoTlx6ayAoGl070v+c9t4vP7R8=;
        b=bXbHj+37opfn4tpOskVkyACd5MRTwak433Vf/xZlVbGKFy3qE4jyChhhD/WD8rNga5
         lJHiZ3E3jKrTPegYU8dl8alrHYWaXC4NG2woJfXE9XY4oodReRyZ/x4fD7yMPEOvi5Tr
         +JatoL3G6sp9EzqmbZdDjI0dZ+isgwnVVuafKyGxle0QUZZDJNpe/3Z9XEnw2QCmRPDG
         CmETdqyIAkURfRtkGNmZJQxL5F1FQlQM45B69g7A+pZ09f+rdki03iaFCaRhrd6b9Bie
         Okv8D4BtpjnI7aXdbDiRpUwLa3FhjQHbVlQB1LUNl/wYvyWp0RQjNApDIZnzbjwlPhbj
         WQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780651764; x=1781256564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiPdAtVLe52MfyJeeBoTlx6ayAoGl070v+c9t4vP7R8=;
        b=LOcYTf34fG1ddwxhtnGEQmvEAaWss9MdQ8xJX0W4OybGNycPwTaDQF6t3rlURoytY6
         MgUiMRTVWMyhYiJ1XjykAk2an+IaykcX2fV/mVFjZwcPaeqvRRqzU9oSCzLz/gQg5k11
         cMlHJ+7MK/HBMBnAzXNcTJSl9JVmRfLmiXaplqURXJNHS7QxJshgjPTB2PYVHinK7GI8
         E02MtT7KFXpNEkUjO7ZrAfWY37HgkdnPVIer0TANr5ssKTw9FCNplRUBNBCQhX9AvrD5
         eqvu+KpG4w2zsU503YJRmZ0Xfp+3Ha06YUNc5BLGA2irPlH4HeoCpyvLKKUB56A96aW3
         GHsw==
X-Forwarded-Encrypted: i=1; AFNElJ/N3A76NLPZQkPvfqU6TzVI8gup5DFD7jW3y6dl0j2BjNGnjZ8aC5MZNiLmG6rWsxdEeZF+qRb6DMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPDFy4fUP80WXhfnsitYI07aNDQXGIufH6G3/cc0KiSTCPHaUe
	4x50qQYfETQNKO/AB6D2/D1MP6R2Wpa/FrTwO0Dmq07khseLZQYva4Wm
X-Gm-Gg: Acq92OFD9tz2NJWVNHPdovABbCCgrg+EdQ3Hn2ZlUsC5MRzFJ7R6745bwcHBaMokkTX
	d7OflzpwVhEgMaHQcrMjV2CzQpNKie/QfqiGko9LICWoJYukPmHaLcszAbGkVZ6/nW7WJOe9sxv
	WhZyTw4vjC2HEqbL4VgZHVF0kejbqSHY2zUOH+VFgqooLYZfaqiZy6e3KxlCstPw3iacRWiM84Y
	CyK98waZAKMZIxpYWlk9B7r+eKEH1YOYeCWvKM3fD5xkugJ2NFSy+PKPWeqPNCURZDQcXHOl134
	2T8qfgPr7EdabjgeyFnBNNtiuY5cJT2FDZGJikJY+ufDIaXd66fwSFDsxqy+FBZemOSsnorGoL1
	URUhLnQmHzlwbjL53Fi6dRtIo6F1k1i+1IhTKcUoNsbVyX6r9wZwGDctydVItyGdLsSsZNNigfC
	q45tz6ofeJZUzHg5qBrO7v4ZJ77G0Ec2DbWP6PegyGoBgbHcKq7wSuqLavWnwQj6+DWrSMyDJpB
	OzZV3dOQ+46/jXJ
X-Received: by 2002:a05:600c:674f:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490c25ed266mr45063825e9.13.1780651763794;
        Fri, 05 Jun 2026 02:29:23 -0700 (PDT)
Message-ID: <eef6f785-7a9c-452b-aae6-9e1986227c7b@gmail.com>
Date: Fri, 5 Jun 2026 11:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/26] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
 <3da2f796-4dc7-408a-9ec9-f0e8bb02b1a9@suse.com>
 <f4d899ba-8a27-48dd-a724-55557b345647@gmail.com>
 <88c0f573-087b-4f66-9045-1f480e4aa83c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <88c0f573-087b-4f66-9045-1f480e4aa83c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780651764-DAF6E443-A091AEFA/10/73395122804
X-purgate-type: spam
X-purgate-size: 4895
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,microchip.com:email];
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
X-Rspamd-Queue-Id: 77F02646DA6



On 6/5/26 9:31 AM, Jan Beulich wrote:
> On 04.06.2026 16:21, Oleksii Kurochko wrote:
>>
>>
>> On 6/3/26 5:21 PM, Jan Beulich wrote:
>>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>>> Guests using the IMSIC interrupt controller require a corresponding
>>>> Device Tree description.
>>>>
>>>> Add support for generating an IMSIC node when building the guest DT.
>>>> This allows guests to discover and use the IMSIC interrupt controller.
>>>>
>>>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>    - s/imsic_make_reg_property/guest_imsic_make_reg_property.
>>>>    - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
>>>>    - Use initalizer for regs[] array in imsic_make_reg_property().
>>>>    - Move buf[] insde the for() loop.
>>>>    - Correct check of returned phandle.
>>>>    - Drop local variable len.
>>>>    - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
>>>>    - Drop initializer for local variable data.
>>>>    - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
>>>>    - Drop next_phandle as it is now in common code.
>>>>    - Introduce vcpu_imsic_deinit.
>>>>    - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
>>>> ---
>>>>    xen/arch/riscv/imsic.c                    | 127 +++++++++++++++++++++-
>>>>    xen/arch/riscv/include/asm/guest-layout.h |   2 +
>>>>    2 files changed, 128 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>>>> index ceea6778d9dc..19cbacdf96e1 100644
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -13,9 +13,12 @@
>>>>    #include <xen/const.h>
>>>>    #include <xen/cpumask.h>
>>>>    #include <xen/device_tree.h>
>>>> +#include <xen/domain.h>
>>>>    #include <xen/errno.h>
>>>> +#include <xen/fdt-domain-build.h>
>>>>    #include <xen/fdt-kernel.h>
>>>>    #include <xen/init.h>
>>>> +#include <xen/libfdt/libfdt.h>
>>>>    #include <xen/macros.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/smp.h>
>>>> @@ -35,6 +38,11 @@ static struct imsic_config imsic_cfg = {
>>>>        .lock = SPIN_LOCK_UNLOCKED,
>>>>    };
>>>>    
>>>> +static unsigned int __ro_after_init guest_num_msis;
>>>
>>> How come this is __ro_after_init, when it's ...
>>>
>>>> @@ -291,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>>>            return -ENOENT;
>>>>        }
>>>>    
>>>> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>>>> +        guest_num_msis = tmp;
>>>> +    else
>>>> +        guest_num_msis = imsic_cfg.nr_ids;
>>>
>>> ... written by a non-__init function?
>>
>> __ro_after_init should be dropped. I will use __read_mostly instead.
>>
>>    Plus are you again inheriting a host
>>> property into guests without saying why?
>>
>> Based on the discussion for similar place around vAPLIC code in the
>> previous patch I will add here or the comment why or introduce
>> VIMISC_NR_IDS and use it instead.
>>
>>>
>>>> @@ -524,8 +537,120 @@ int __init imsic_init(const struct dt_device_node *node)
>>>>        return rc;
>>>>    }
>>>>    
>>>> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>>>
>>> Same question again as to __init throughout here.
>>
>>   From Arm code I understood that libxl creates the interrupt controller
>> node in userspace before handing the FDT to Xen so this and related
>> functions won't be called by userspace.
> 
> Hmm, okay, on the v3 submission I'll have to keep that in mind, and call
> paths will need checking accordingly.
> 

I will update the commit message with clarification why __init is used 
here and connected functions.

>>>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>>>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>>>> @@ -5,6 +5,8 @@
>>>>    
>>>>    #define GUEST_APLIC_S_BASE 0xd000000
>>>>    
>>>> +#define GUEST_IMSIC_S_BASE 0x28000000
>>>> +
>>>>    #define GUEST_RAM_BANKS   2
>>>
>>> Is this going to become an unannotated collection of (seemingly) random
>>> numbers?
>>
>> Could you please clarify what kind of annotation you would expect to see
>> here? It's just an address, which is typically used for IMSIC by QEMU,
>> so I chose the same notation for the guest address as well.
> 
> Well, how could I have known? The description says nothing, and there are
> also no comments. The numbers here look entirely arbitrary, and if someone
> wanted to change them, it wouldn't be clear at all what constraints need
> taking into consideration.

I will add the comment or update the commit message with information why 
this numbers were choosen.

Thanks.

~ Oleksii


