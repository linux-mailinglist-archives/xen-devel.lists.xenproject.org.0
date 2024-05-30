Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219638D4D13
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 15:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732735.1138775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCg8i-0003O8-QO; Thu, 30 May 2024 13:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732735.1138775; Thu, 30 May 2024 13:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCg8i-0003MI-N5; Thu, 30 May 2024 13:48:20 +0000
Received: by outflank-mailman (input) for mailman id 732735;
 Thu, 30 May 2024 13:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=za+F=NB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCg8h-0003MC-Et
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 13:48:19 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 449adc4f-1e8b-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 15:48:17 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e72b8931caso9268351fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 06:48:17 -0700 (PDT)
Received: from [10.80.5.21] ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579d65934ddsm5250799a12.38.2024.05.30.06.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 06:48:16 -0700 (PDT)
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
X-Inumbo-ID: 449adc4f-1e8b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717076897; x=1717681697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5U4QsW9eP5bbrjen53u+l8DlvxSzZvlDhAIrTvwM3Q=;
        b=V3JORDLJ6DTAlGrpz/pddCFSiJHP6IvOdFQSeKTvk9zPwb8P0E2gexazaMqp1+s346
         PBOSWIrC5pHOZOhSfRkYF4SUt/a6g+begbqH+uviFvib13Dgw43RG2jtYZn9++TEVesu
         TruL89fW0ao8iydnYPzFe/+pTqg9DH9dp3jlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076897; x=1717681697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5U4QsW9eP5bbrjen53u+l8DlvxSzZvlDhAIrTvwM3Q=;
        b=cOVlhbXfUMkkt6d8x6Y9jUuGuDUrkJA7rSLYpOjbRipUZjx8xeuwxAeacUJa0scaR8
         Nr0NRYNJqg6REzMslD0uWspmvddq0RzrRr0poOCp9N5AFToKrH/QnzOHTUxcx+6MgG5g
         Hooib7I4+9Bezm740FAqUBWRAOjZlrlS1MvAcr5SzVMsYXwd/0t3d3dvMConpj5eNifi
         /bcQgxk2Lr9Q/b09xmKSqcICG7jcdA/7OWRRoS6Tnxj96xNtJkKG0BheNoCgLNFqlsVy
         jadmHEH8ajU1MA61ZEWzwN+Eam0sy91WL1Fb0WIDfWMXS+QwwE8RpdhvjUTi4AKPXj3O
         L65A==
X-Forwarded-Encrypted: i=1; AJvYcCX8T7JORmuNo6eOk0pxpPU6byDribKhvyiKqaKGc7qk30jKnfArniJ2YUa8WEQR2zCUamYe1VlEKEaxn4k5jFb0nK01OgI9opIQuaZkgpo=
X-Gm-Message-State: AOJu0Yw60eU4IZtOPWK9hV9hncWUjsDOmyX8HoimDn7Q5vIEfGD4aOu5
	Sd/quKK24+jlwm93dIxZsRpt0oG3c2pBEhS5/Rb9IvH1IaB3e23tjuevjiVM1io=
X-Google-Smtp-Source: AGHT+IHyxnbdapBD3o3qDyHk96NDfdqHc30OIhVvFlOaBfN2C6DCWzPG825yuBpYNV0FBpMt/jIR1A==
X-Received: by 2002:a2e:8096:0:b0:2ea:7e50:6c94 with SMTP id 38308e7fff4ca-2ea8479e99amr10751361fa.16.1717076896645;
        Thu, 30 May 2024 06:48:16 -0700 (PDT)
Message-ID: <e6b9fc65-365b-4a38-8181-a76d576939e4@cloud.com>
Date: Thu, 30 May 2024 14:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
 <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2024 12:08, Andrew Cooper wrote:
> On 29/05/2024 3:32 pm, Alejandro Vallejo wrote:
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f033d22785be..b70b22d55fcf 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,6 +2,17 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>> +{
>> +    /*
>> +     * TODO: Derive x2APIC ID from the topology information inside `p`
>> +     *       rather than from the vCPU ID alone. This bodge is a temporary
>> +     *       measure until all infra is in place to retrieve or derive the
>> +     *       initial x2APIC ID from migrated domains.
>> +     */
>> +    return id * 2;
>> +}
>> +
> 
> I'm afraid it's nonsensical to try and derive x2APIC ID from a
> policy+vcpu_id.

That's debatable, and we clearly have different views, however...

> 
> Take a step back, and think the data through.
> 
> A VM has:
> * A unique APIC_ID for each vCPU
> * Info in CPUID describing how to decompose the APIC_ID into topology
> 
> Right now, because this is all completely broken, we have:
> * Hardcoded APIC_ID = vCPU_ID * 2
> * Total nonsense in CPUID
> 
> 
> When constructing a VM, the toolstack (given suitable admin
> guidance/defaults) *must* choose both:
> * The APIC_ID themselves
> * The CPUID topo data to match
> 
> i.e. this series should be editing the toolstack's call to
> xc_domain_hvm_setcontext().
> 
> It's not, because AFAICT you're depending on the migration compatibility
> logic and inserting a new hardcoded assumption about symmetry of the layout.
> 
> 
> The data flows we need are:
> 
> (New) create:
> * Toolstack chooses both parts of topo information
> * Xen needs a default, which reasonably can be APIC_ID=vCPU_ID when the
> rest of the data flow has been cleaned up.  But this is needs to be
> explicit in vcpu_create() and without reference to the policy.
> 
> And to be clear, it's fine for now for the toolstack to choose a
> symmetric layout and pick appropriate APIC_IDs+CPUID for this, but it
> needs to be the toolstack making this decision, not Xen inventing state
> out of thin air based on the toolstack only giving half the information.
> 
> (New) migrate:
> * Data from the stream, exactly as presented
> 
> (Compat) migrate:
> * Synthesize the missing xapic_id field in LAPIC_REGs as APIC_ID=vCPU_ID
> * 2.
> 
> I'm pretty sure this will be a net reduction in complexity in this
> series.  It definitely reduces the Xen complexity.
> 
> ~Andrew

... I didn't know toolstack could send hvmcontexts during non-migrated
domain creation. That's neat!

I was going to defend my approach (because it does make sense), but
there's an extra benefit from yours you didn't seem to notice. With the
x2apicid in the migration stream (patches 1 and parts of 2) it's not
only possible to set the APIC ID from toolstack per vCPU with the
contexts, but it would also allow toolstack to be responsible to
preinitialize all the APICs in x2apic mode when any of them is 255 or more.

I'll try to do that soon-ish. I suspect the pain points are going to be
making it work nicely as well on 1vCPU systems with no APIC (are those
expected to work?).

I'm not looking forward to re-testing all of this again...

Cheers,
Alejandro

