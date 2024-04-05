Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438F899DB1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701285.1095619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsj7H-0004tO-G3; Fri, 05 Apr 2024 12:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701285.1095619; Fri, 05 Apr 2024 12:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsj7H-0004r8-DT; Fri, 05 Apr 2024 12:56:23 +0000
Received: by outflank-mailman (input) for mailman id 701285;
 Fri, 05 Apr 2024 12:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rsj7F-0004r2-6E
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:56:21 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5215262-f34b-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:56:18 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d718efedb2so36744601fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:56:18 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 eb16-20020a170907281000b00a51ad1c08f6sm237285ejc.71.2024.04.05.05.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:56:17 -0700 (PDT)
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
X-Inumbo-ID: e5215262-f34b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712321778; x=1712926578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6BeinTfkFRY511Zesj2csWGlc6XaX/bZ6aS0GxaTcE=;
        b=Xcd4eZVrVefoY6YD346fSMR4JaeQVt3MENe6V2zDi4pUEVVdQt6B78Mgk5eLSiVNGD
         eSsaqCQ/253AXS0rHqlPq35WR6uw6ib9cCG3hBrzaGHkwIB0dcaPoo+u0nd7N9/5GVkf
         7MU/GAIgSqVm8NiBjxyKvUudqsNYBzxIs8+PtrnrC1LiWEwg0+ob8Hqu8vFrqfnWTH2t
         MEHdpceZcHkTndw6ytc2rcxl/VOeKdM9cCLMUJB0wdj8b3cY19BzRNqt0qWUABrQzMv1
         6+MMlPSG9eV9FXQEAd4xp3CKYTfQoa4XIv1/OvkeCGvjz8dvsBQOXy1RCvPg6WKY2e7v
         uvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321778; x=1712926578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6BeinTfkFRY511Zesj2csWGlc6XaX/bZ6aS0GxaTcE=;
        b=Gp4qt3wB+eYbcGEr5jYG6Y4/LZiyYSF/yXtawo3EHL9L6J5BOCyDfj2vFKsKaCFqyc
         5WC9m3ZCQubAsBA+6rQoFeacoEX4snjR7aG80d3DrC11Ikuz7HKbp3e+XAko38r0E4S+
         t0fKyHAIijlfda+5dnFQdq25NaxO+Qajx1V7ZemYQF9i1KzI6xu5+UC6rAVVBjYHhYg+
         QaWTvFMKiUzsC4DlO/ig5ml05LUiDQexDrY3TgFgQFrpG87d/QU14jNc9NcDnji1jqUA
         wF1fAPCEYJJLBWer4GUi5vBrRtC7FJ9/jcRbgrBBhcBy6VogkHhFSvumWV+fthJwL3l1
         veNA==
X-Forwarded-Encrypted: i=1; AJvYcCWlA5LlP2zbgIB7+M0fmLMJFa6133aML+NeyF3S3NIOvl4d5mabWKE4NaDWKzd6gC6+Vy+3eYeubszAi8JYE/fvMYw2bRa+5JQStNWWQqU=
X-Gm-Message-State: AOJu0Yx62YLm5ZvDqZKeJhqDVHuAJ5EYXwHjtjbOzHFonqMweaedQUY5
	fE8UJcqrklD0VgpIlb8HawdpphxU4e+9z3J6uYANzPr9onrFKZ2L2/gs9wb+QJE=
X-Google-Smtp-Source: AGHT+IFpfy6C/SfFTK8IkMTuBphFt/yBIUbFgzlwGpKi0zL14YuaT4NJUKruE+ynKd8LPsEBIG0RFQ==
X-Received: by 2002:ac2:5050:0:b0:516:d1ba:ca70 with SMTP id a16-20020ac25050000000b00516d1baca70mr1353262lfm.31.1712321778108;
        Fri, 05 Apr 2024 05:56:18 -0700 (PDT)
Message-ID: <b145edd1-cde8-4c05-bd70-86c7e3a48666@suse.com>
Date: Fri, 5 Apr 2024 14:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/xen: return a sane initial apic id when running
 as PV guest
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20240405123434.24822-1-jgross@suse.com>
 <20240405123434.24822-3-jgross@suse.com>
 <f8fb1990-11e8-459d-a365-6dc277f34a6b@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <f8fb1990-11e8-459d-a365-6dc277f34a6b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.04.24 14:50, Andrew Cooper wrote:
> On 05/04/2024 1:34 pm, Juergen Gross wrote:
>> With recent sanity checks for topology information added, there are now
>> warnings issued for APs when running as a Xen PV guest:
>>
>>    [Firmware Bug]: CPU   1: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0001
>>
>> This is due to the initial APIC ID obtained via CPUID for PV guests is
>> always 0.
> 
> /sigh
> 
>  From Xen:
> 
>      switch ( leaf )
>      {
>      case 0x1:
>          /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;
>          if ( is_hvm_domain(d) )
>              res->b |= (v->vcpu_id * 2) << 24;
> 
> 
> I think there's a very good chance it was random prior to Xen 4.6.  That
> used to come straight out of a CPUID value, so would get the APIC ID of
> whichever pCPU it was scheduled on.
> 
>> Avoid the warnings by synthesizing the CPUID data to contain the same
>> initial APIC ID as xen_pv_smp_config() is using for registering the
>> APIC IDs of all CPUs.
>>
>> Fixes: 52128a7a21f7 ("86/cpu/topology: Make the APIC mismatch warnings complete")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/xen/enlighten_pv.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
>> index ace2eb054053..965e4ca36024 100644
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -219,13 +219,20 @@ static __read_mostly unsigned int cpuid_leaf5_edx_val;
>>   static void xen_cpuid(unsigned int *ax, unsigned int *bx,
>>   		      unsigned int *cx, unsigned int *dx)
>>   {
>> -	unsigned maskebx = ~0;
>> +	unsigned int maskebx = ~0;
>> +	unsigned int or_ebx = 0;
>>   
>>   	/*
>>   	 * Mask out inconvenient features, to try and disable as many
>>   	 * unsupported kernel subsystems as possible.
>>   	 */
>>   	switch (*ax) {
>> +	case 0x1:
>> +		/* Replace initial APIC ID in bits 24-31 of EBX. */
>> +		maskebx = 0x00ffffff;
>> +		or_ebx = smp_processor_id() << 24;
> 
> I think the comment wants to cross-reference explicitly with
> xen_pv_smp_config(), because what we care about here is the two sources
> of information matching.

I can add that as a comment. OTOH I'd really hope someone changing this
code later would look into the commit message of the patch adding it. :-)

> 
> Also while you're at it, the x2APIC ID in leaf 0xb.

I'm not sure this is functionally relevant in PV guests.

Note that my patch is only meant to silence warnings during boot. It is not
needed for the system working correctly (at least I think so).


Juergen

