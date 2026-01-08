Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CFD05D1A
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 20:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198062.1515330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdvbl-0006hf-8C; Thu, 08 Jan 2026 19:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198062.1515330; Thu, 08 Jan 2026 19:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdvbl-0006fl-5R; Thu, 08 Jan 2026 19:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1198062;
 Thu, 08 Jan 2026 19:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdvbk-0006fe-6n
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 19:23:44 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b29e824-ecc7-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 20:23:42 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b8440cb2dbeso351357366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 11:23:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5126d6sm886346166b.50.2026.01.08.11.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 11:23:41 -0800 (PST)
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
X-Inumbo-ID: 8b29e824-ecc7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767900222; x=1768505022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtjjgoXU0F5/I8+gXmjFZ3YHHHMSjoQgl8yEYuGXjJ0=;
        b=YpUYrhhECdF/gk2s56JjG+U8uu4AFKTe85sXGQRWlf17QIW9E9j3xWtnvlWiYoyJDS
         Uq+pnMovgQO5ygzls1cTXFDtsuaZoCdYh6XkjkiG/pWC4we5EiQaFZl5RpG1U+89P4mG
         x83mY8GwME5h3n9xURWqTyJpt2YZVS+WZC8KiUwnAZ4QB6okoTctmxQyjP0df3p2itg9
         e8w6tgag+hVla0Ity6D/2jGcsyilRL3q/22PjIpgyHmIbIgbnSmweiC/NVDfAD/1pumT
         fEG1t5/NXaPsLVu5aBwBOZT0F/upo32UZdpgqNz0jVRK5TvrmtXBNGpbZDAsqnXWx4kN
         ISag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767900222; x=1768505022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtjjgoXU0F5/I8+gXmjFZ3YHHHMSjoQgl8yEYuGXjJ0=;
        b=aA4BLhn8gjSfJPoE9tiBRw3DIuVzBzjcV0UFbShogmmZ2cRUBVitspmAKfhvMDkIih
         lCHurDwVoj0yB7JuWSFvvBGyqDkALMMDUzFtep7cM9jHBTPVJquDXFNfDUXFqpZoGzeM
         AbClqHebM6WJOt6gTuzP5cC8Pjgu0C2tQjbhcvRd36htkTAPgqn+FbboibVWb57YTlCR
         PMsdB3YZYBguiXMLLVU8VYwNEr9fyoXQtSOzRjGubzgWswILc6RrpPLzlN5/mLmh33RK
         +Ym0/tJjXGcTZwX2uUJZPXW99IcNjMnpYchQmgjDi+I207sLh7ZElykvjg6WijOWWvMJ
         lxAA==
X-Forwarded-Encrypted: i=1; AJvYcCUxPwbbgtcj75zGQMgbjvGq9EBh94Sxvk2MnbUXfykwcVUkw7JnK+WAqTY/cM3pDRmDAS96yeDZ8Tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmOO6VgptpE3Ysl5rtAP2Bg5b/mJiv8Sp+mE8sf7tDSqUTGul/
	w7FhkF4YziCriF4JcXx3LoTg4OFUAlaMQ4EwvKBXOZ9F2hoDyJfHiSBV
X-Gm-Gg: AY/fxX747v0VGObbHiBdX5SmyOkdtg97veC7zhLjvqpF5mvE/ObpCPZ945Ad2xSZbk+
	owcS2qVutaMPRq8pTUMSY4yGqg6T1G/sXmSXyw3BFl8ttsXoOroQD+ANI4Rn7Db7TCRgkxzvjHd
	bEg/Q8rtKWPtbcy8s2kmqOElFTi891UHzNf1ZnI/QFLHPv82y4d9csfZB7mTzRccGPmDdmA4tdb
	NAlsl+wqS/BFxmmdZqe/D3wDvIMH3VZJFKqO+N42Sw4SHphyhFD0lJAAhEsDjsqB8rSLByE3kAk
	/RllemPpJfnDYuZTnSgXu2fi/uv8sZ3EYtpH5Wf/+i2TS2waSO1Q4eLVc8kqnqKJV8OTwa6g/XJ
	1O5olPJYTxTiIHB8BTCaBa1ep+evX+kVxyYQhmVY/RKB5CXX9AtpuyNi+vZWORAoK2j88oeBb0A
	YUurPZKuTPKiMT7206k0wx8hYwKcxZkZMqeXY5QZwCmpQNmNWzsJe7aliYrz8GjMs=
X-Google-Smtp-Source: AGHT+IHyXB3kzGq9Y2KRpiE0WybncQNF+mg9qopLFnEgYtkqvSVddg0K9rpXfNdUw0jzTEgbMr1b7A==
X-Received: by 2002:a17:907:3e20:b0:b76:5393:758d with SMTP id a640c23a62f3a-b8445345c45mr615622966b.34.1767900221923;
        Thu, 08 Jan 2026 11:23:41 -0800 (PST)
Message-ID: <b3857e3f-a7a0-44e6-91d5-529e765e1ab4@gmail.com>
Date: Thu, 8 Jan 2026 20:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <3850c51d41b1ab67a453ca70c0a44172185274f6.1767694781.git.oleksii.kurochko@gmail.com>
 <6ac0b4d8-3762-427e-a856-be9118e90dc0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6ac0b4d8-3762-427e-a856-be9118e90dc0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 9:41 AM, Jan Beulich wrote:
> On 07.01.2026 17:34, Oleksii Kurochko wrote:
>> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
>> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
>> match the known values, which leads to:
>>    GICv3: No valid GICC entries exist.
>> as observed on the AmpereOne platform.
>>
>> To fix this, import the logic from Linux commit 9eb1c92b47c7:
>>    The BAD_MADT_GICC_ENTRY check is a little too strict because
>>    it rejects MADT entries that don't match the currently known
>>    lengths. We should remove this restriction to avoid problems
>>    if the table length changes. Future code which might depend on
>>    additional fields should be written to validate those fields
>>    before using them, rather than trying to globally check
>>    known MADT version lengths.
>>
>>    Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>>    Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>    [lorenzo.pieralisi@arm.com: added MADT macro comments]
>>    Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>>    Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>>    Cc: Will Deacon <will.deacon@arm.com>
>>    Cc: Catalin Marinas <catalin.marinas@arm.com>
>>    Cc: Al Stone <ahs3@redhat.com>
>>    Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>>    Signed-off-by: Will Deacon <will.deacon@arm.com>
>>
>> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
>> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
>> instead of ACPI_MADT_GICC_LENGTH.
>>
>> [1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
>>
>> Reported-By: Yann Dirson <yann.dirson@vates.tech>
>> Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> I ran CI tests where it made sense for this patch, as I don’t see any CI job
>> that builds Xen with CONFIG_ACPI=y:
>>    https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2229673951
>>
>> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
>> AmpereOne platform.
>> ---
>> Changes in v2:
>>   - Update the commit message:
>>     - Use more characters for commit ID.
>>     - Drop 'import from'.
>>   - Add Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>.
> Was this a legitimate thing to do, considering ...
>
>>   - Make the local variables host_gicc const in  gic_get_hwdom_madt_size().
>>     (header variable isn't const as container_of() will discard 'const' qualifier
>>     and so compilation error will occur).
>>   - Return 0 instead of panic() in gic_get_hwdom_madt_size().
> ... all of these (plus leaving partly unaddressed a comment from Julien)?

Probably you are right, it was to early. I will drop it and ask Stefano to re-review.

>
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -418,8 +418,18 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
>>   {
>>       unsigned long madt_size;
>>   
>> +    struct acpi_subtable_header *header;
> Why is there a blank line left between declarations? In unusual situations (very
> many variables, for example) that may be okay, but otherwise the first blank line
> generally wants to separate decls from statements.

It was visually better for me to have header and host_gicc variable in a "separate
block". I can drop a blank line.

>
> Also Julien asked for this to be const. You claimed a compile error would occur
> if you do, but afaict that's only because ...
>
>> +    const struct acpi_madt_generic_interrupt *host_gicc;
>> +
>> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
>> +    if ( !header )
>> +        return 0;
>> +
>> +    host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>> +                             header);
> ... you don't use const properly here as well.

Oh, right, I missed to add const for the second argument of container_of().

>
> Finally (possibly not for this patch, but mentioning since originally it was
> pointed out as an option) the function imo wants to become __init anyway, for
> (as said by Julien) its only caller being so.

I didn't put __init here as you mentioned it was pointed out as an option. Anyway
I think I will put __init in the next patch version.

Thanks.

~ Oleksii


