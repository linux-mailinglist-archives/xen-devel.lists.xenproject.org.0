Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3679E5A1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601199.937147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNdP-0002uO-N5; Wed, 13 Sep 2023 11:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601199.937147; Wed, 13 Sep 2023 11:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNdP-0002rh-K9; Wed, 13 Sep 2023 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 601199;
 Wed, 13 Sep 2023 11:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJSs=E5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgNdO-0002rb-T3
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 11:02:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdcbb7f3-5224-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 13:02:12 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so72369655e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 04:02:12 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y13-20020adffa4d000000b0031f5f0d0be0sm15097709wrr.31.2023.09.13.04.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 04:02:11 -0700 (PDT)
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
X-Inumbo-ID: fdcbb7f3-5224-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694602932; x=1695207732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gOQlyMg+xT3Fe92J4JQw8w6Xevu0DIcUn6vz/vBhwyo=;
        b=jmvhgHMiWlyQCg0/w7Tyym/5xCf/eYaiDT381YHAA5nwJ9BpZ82GriTdBpHYdfHL2f
         8ZDB+2NhN0hZYkIhGfa1a38AFnpNn/+jEu5a6qVGxcD/lhOEOyg3RCUUI8Z2BUo1uZM2
         8vw5kbYsQ6mb4XR+JLze1nMNKJSCsRtkOsmUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694602932; x=1695207732;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOQlyMg+xT3Fe92J4JQw8w6Xevu0DIcUn6vz/vBhwyo=;
        b=qBhkJdKVT+9ZcTnxD20W0PUv1huDiwk8kxD1/yT4WyYHQhHb8EPN5S2oUhSfFNPv35
         2XL8Ln95pLgQQtJHbz1MLWxXFaCA5MlOWW8dZlh3laDLxCRNHL/MIBWCp8aOXQbc3Yq+
         QD3tfOoqwgcv/fvN+EwZGMYthh/RsbVuiTitlyRLQXZG5qzlkCxmFQoj9xPhajoFmpvO
         whLJvNZqEOP9kFOAHs+hXu79q/I0sJ6K7uX39IxLfQABDs+dejvWJ5ARIiiCN0GZfI6a
         EF3bN8n6H2ZWSkVuKQIEg27XjmmOl+13rNRaMO49l1sG592x2AyG9cQJcLHO0UMJ1pLI
         swQQ==
X-Gm-Message-State: AOJu0Yy7V+c+ErsU5FnAKHDRRYDQg/otH5B2aSg/iw8lMfjLgYUepzPh
	JWocp/ghJqk2xEglqQ8QsL72WA==
X-Google-Smtp-Source: AGHT+IGJCL9Yil3JhsMmRfziQP/rqfvGrGn2jAuj73r9RhoAOw//CRvS9ukVJtZThaMqykRu5bmyqg==
X-Received: by 2002:a05:600c:3794:b0:3fe:d71a:d84e with SMTP id o20-20020a05600c379400b003fed71ad84emr1884842wmr.1.1694602932094;
        Wed, 13 Sep 2023 04:02:12 -0700 (PDT)
Message-ID: <fca202a8-2716-6ed1-c2ce-707deeddb3ab@citrix.com>
Date: Wed, 13 Sep 2023 12:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 the arch/x86 maintainers <x86@kernel.org>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
In-Reply-To: <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2023 7:18 am, Jan Beulich wrote:
> On 12.09.2023 18:35, Andrew Cooper wrote:
>> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>      case MSR_K8_HWCR:
>>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>              goto gp_fault;
>>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>>> +        /*
>>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>>> +         * also poke at PSTATE0.
>>> +         */
>> While this is true, the justification for removing this is because
>> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
>>
>> Also because it's addition without writing into the migration stream was
>> bogus irrespective of the specifics of the bit.
>>
>> I'm still of the opinion that it's buggy for OpenBSD to be looking at
>> model specific bits when virtualised, but given my latest reading of the
>> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
>> can see TSC_FREQ_SEL.
> I'm afraid I'm still at a loss seeing what wording in which PPR makes you
> see a connection. If there was a connection, I'd like to ask that we at
> least properly consider exposing PSTATE0 (or if necessary all PSTATEn) as
> well, with zero value (i.e. in particular with the valid bit clear),
> rather than exposing a r/o bit with the wrong value, upsetting Linux.

This mess is caused by the erroneous advertising of a model specific
bit, and there's no way in hell that giving the guest even more model
specific data is going to fix it.

The PSTATE MSRs are entirely model specific, fully read/write, and the
Enable bit is not an enable bit; its a "not valid yet" bit that firmware
is required to adjust to be consistent across the coherency fabric.

Linux is simply wrong with it's printk() under virt, and wants adjusting.

~Andrew

