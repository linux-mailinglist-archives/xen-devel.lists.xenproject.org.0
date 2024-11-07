Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E59BFA99
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831430.1246734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qAg-0000dG-Ru; Thu, 07 Nov 2024 00:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831430.1246734; Thu, 07 Nov 2024 00:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qAg-0000aA-Na; Thu, 07 Nov 2024 00:14:46 +0000
Received: by outflank-mailman (input) for mailman id 831430;
 Thu, 07 Nov 2024 00:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8qAe-0000a2-QP
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:14:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4780c2be-9c9d-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:14:40 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so241058f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 16:14:39 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04136sm128730f8f.97.2024.11.06.16.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 16:14:38 -0800 (PST)
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
X-Inumbo-ID: 4780c2be-9c9d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ3ODBjMmJlLTljOWQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTM4NDgwLjAxODk1NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730938479; x=1731543279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A3IYPChvG9mz1mDcI7O/kOqBHEdLNysE+NFaE6/WO2M=;
        b=Da3x2+qJBwo2pq8FR19GI/eqWob+10Jg0RuCPLer5OPxi+AwQDBqOKogYHD2eurkoi
         3bN9HJpJ7MxnRdVDu9oUM/zsDpLqjjG4rkztxy3IDBdYuu70K+nQLmEW09smgP41FWlH
         LwLUKKKrI+Svkda5Pyk8cInVgbcEB2rHxyR+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730938479; x=1731543279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3IYPChvG9mz1mDcI7O/kOqBHEdLNysE+NFaE6/WO2M=;
        b=MOZs1JPlrD3C9SgGw/VoKpLgn14+Ks1L2i3DtyfeMa93LfzKFTgHNQx2H0B7aTStJm
         U4l6DJUASoAQp5rhrfUlKMKsTwwFdaovpUQ9tV8WfMHbEgHcrVtpzhcADwdn41SN3LCI
         1EOfB/t0m/L+eGjMwGRq9MBPo1AYtOJljCbr78PhtGqDS9JcExyJRPhrky0Ps26eK19E
         co17xB8Mlpv0Ehi2XCp+Ozy3tkzReoCJI8pMZi2/k79j4Egdv4jD3F34mxU3QE43woMb
         kOJsPPjUyFH2jqhV1Wjo+eFpxbSIzH2lY4wG5qvPdSpw6Sp9iL+VEsvt3e84irLi9xL0
         vmAg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8MTrgrWnIhN/ELjYE9B3UHrD1N20baNGqYFelgSg1R2mFCnx9N/k+13DMz7TzoLtCoKta150jAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFAo4AxKIWuYegb5zthZc6I1CTqU5xZmW2uQ+XowczuLA1HddP
	81oWPKcrBnOTeqJHH1oWDg9K1w2pLYkdCClMHlKHSdi6KbO0MLrvhjJRkPRhfEM=
X-Google-Smtp-Source: AGHT+IGBiji5BL5OQLWPJh52Xc/BxIH98My5WxsQnX6umd/uYGVimtD4i5XLihJL2HLLGSbI7LMmjQ==
X-Received: by 2002:a05:6000:4213:b0:37d:f4b:b6ab with SMTP id ffacd0b85a97d-381edb2c0d1mr76499f8f.59.1730938478971;
        Wed, 06 Nov 2024 16:14:38 -0800 (PST)
Message-ID: <53590a98-f4cc-42cb-b85b-9820fcedecf3@citrix.com>
Date: Thu, 7 Nov 2024 00:14:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
 <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 11:06 pm, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> With all the components used to construct dom0 encapsulated in struct
>> boot_info
>> and struct boot_module, it is no longer necessary to pass all them as
>> parameters down the domain construction call chain. Change the
>> parameter list
>> to pass the struct boot_info instance and the struct domain reference.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - renamed from "x86/boot: convert create_dom0 to use boot info"
>>
>> Changes since v5:
>> - change headroom back to unsigned long
>> - make mod_idx unsigned int
>> ---
>>   xen/arch/x86/dom0_build.c             |  9 ++--
>>   xen/arch/x86/hvm/dom0_build.c         | 49 +++++++++++++---------
>>   xen/arch/x86/include/asm/dom0_build.h | 13 ++----
>>   xen/arch/x86/include/asm/setup.h      |  7 ++--
>>   xen/arch/x86/pv/dom0_build.c          | 59 ++++++++++++++++-----------
>>   xen/arch/x86/setup.c                  | 33 ++++++++-------
>>   6 files changed, 95 insertions(+), 75 deletions(-)
>>
>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>> b/xen/arch/x86/hvm/dom0_build.c
>> index a4ac262db463..cd97f94a168a 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>
>> @@ -1301,16 +1302,25 @@ static void __hwdom_init
>> pvh_setup_mmcfg(struct domain *d)
>>       }
>>   }
>>   -int __init dom0_construct_pvh(struct domain *d, const module_t
>> *image,
>> -                              unsigned long image_headroom,
>> -                              module_t *initrd,
>> -                              const char *cmdline)
>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>   {
>>       paddr_t entry, start_info;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>>       int rc;
>>         printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n",
>> d->domain_id);
>>   +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
>
> Here and ...
>
>> +        panic("Missing kernel boot module for %pd construction\n", d);
>> +
>> +    image = &bi->mods[rc];
>> +
>> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
>> +    if ( rc > 0 || rc < bi->nr_modules )
>
> ... here.  Can we just check rc < bi->nr_modules for validity?

You could, but eventually MISRA will say no and I suspect it will then
be made your problem to fix.

In this case, we ought to have an `unsigned int idx` and not (re)use rc.

Also, we panic far earlier in __start_xen() if there's no dom0 kernel,
so I think we can just assert that rather than having a logically dead
panic() path.


>   Valid modules are 0...nr_modules and not found is MAX_NR_BOOTMODS +
> 1.  It eliminates these unecessary double checks.  This would apply to
> 04/12 "x86/boot: introduce module release" as well.
>
>> +        initrd = &bi->mods[rc];
>> +
>>       if ( is_hardware_domain(d) )
>>       {
>>           /*
>
>
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index c1f44502a1ac..594874cd8d85 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>
>> @@ -374,10 +371,13 @@ static int __init dom0_construct(struct domain *d,
>>       unsigned int flush_flags = 0;
>>       start_info_t *si;
>>       struct vcpu *v = d->vcpu[0];
>> -    void *image_base = bootstrap_map(image);
>> -    unsigned long image_len = image->mod_end;
>> -    void *image_start = image_base + image_headroom;
>> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>> +    void *image_base;
>> +    unsigned long image_len;
>> +    void *image_start;
>> +    unsigned long initrd_len = 0;
>> +    const char *cmdline;
>>       l4_pgentry_t *l4tab = NULL, *l4start = NULL;
>>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>> @@ -414,6 +414,23 @@ static int __init dom0_construct(struct domain *d,
>>         printk(XENLOG_INFO "*** Building a PV Dom%d ***\n",
>> d->domain_id);
>>   +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( unlikely(i < 0 || i > bi->nr_modules) )
>
> Single check here.

Similar argument.  Except it turns out that i is used for precisely two
loops in dom0_construct() both of which are from 0 to either 4 or 32.

So it very much can be converted to being an unsigned variable, and then
this works nicely.

That said, drop the unlikely().   This is an init function run once, and
all it is doing is reducing legibility.

>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index aba9df8620ef..d9785acf89b6 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -977,10 +977,7 @@ static unsigned int __init copy_bios_e820(struct
>> e820entry *map, unsigned int li
>>       return n;
>>   }
>>   -static struct domain *__init create_dom0(const module_t *image,
>> -                                         unsigned long headroom,
>> -                                         module_t *initrd, const
>> char *kextra,
>> -                                         const char *loader)
>> +static struct domain *__init create_dom0(struct boot_info *bi)
>>   {
>>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>   @@ -997,6 +994,14 @@ static struct domain *__init create_dom0(const
>> module_t *image,
>>       };
>>       struct domain *d;
>>       domid_t domid;
>> +    struct boot_module *image;
>> +    unsigned int idx;
>> +
>> +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( unlikely(idx < 0 || idx > bi->nr_modules) )
>
> Single check here please.

I'm surprised that the compiler didn't complain about "idx < 0" being
tautological here.

~Andrew

