Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C879D673
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600675.936408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6Nm-00076D-OG; Tue, 12 Sep 2023 16:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600675.936408; Tue, 12 Sep 2023 16:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6Nm-000749-LW; Tue, 12 Sep 2023 16:36:58 +0000
Received: by outflank-mailman (input) for mailman id 600675;
 Tue, 12 Sep 2023 16:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg6Nk-00073x-Pg
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:36:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 951cf9a3-518a-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 18:36:54 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-401187f8071so159845e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 09:36:54 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s1-20020a5d69c1000000b0031aef72a021sm13205812wrw.86.2023.09.12.09.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 09:36:53 -0700 (PDT)
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
X-Inumbo-ID: 951cf9a3-518a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694536614; x=1695141414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRePid9ddAaDLRNWMEYEsshp8tenmvsrTpXkCoB1bkE=;
        b=Bv4zVIIDGmhjxY7bJTE/nrt2MLTDJJ1jNQ064XGf5HRV3GgBzIB1W3KEcL7v4XEBNL
         BdHibYU19MTLcEOjXYvKHiNzwPtS2iLxQXPyLMwW/WHvgh4UmqsMPXgqLmXpVLHLz/Lq
         cRVQwd0fxq9cfeVvVy2TlISm2SGwBl8+8Q3EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694536614; x=1695141414;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRePid9ddAaDLRNWMEYEsshp8tenmvsrTpXkCoB1bkE=;
        b=MWpzXn3XhPhF+DKW4GGfLUXfRftnmpEep7ME4L/D4antIteV6A+Csbnhf1mSxHeH7Q
         g20wAQ1S1HhF1N00Rt3isIa5s2VtR4DTHNciNF2k+UDopU72XHqJ3PUI03Vtx1gnqfCA
         VTL3F2BFFxfdF2JE17oF57KxYXhmJqx3N0OJ2T4Wh2KiMDuW2CFzmsMnop0kiMUvhmq7
         RfX1YjtaqXh1xKO+xRXkYz4CHbNG9KeoaFTmY2dYPwPG6KNzMDGLfQ18gUsJ5/rSwhIC
         U0eWFygadw6mNVL53vhr0Gp3Q6niKyE2eywRvN8VFJvhOnnWyh75FRIf+Ywjj178HyLq
         nbEA==
X-Gm-Message-State: AOJu0Yy1o9Od5nmTOEHcE/yNk+VpAnXiSTT81KZw7GSmlsfCxlh9JdcG
	O3mR630FTz6v/ikkJNxYovywXw==
X-Google-Smtp-Source: AGHT+IGwS53HtXWfcMiAwnZ6hjq/jjbXI4cuUr4QqiI8ggbWeNolJT1CpkL2JoNNn3fQYQPjrw81FQ==
X-Received: by 2002:a05:600c:3b04:b0:3fe:d67d:5040 with SMTP id m4-20020a05600c3b0400b003fed67d5040mr2743493wms.5.1694536613965;
        Tue, 12 Sep 2023 09:36:53 -0700 (PDT)
Message-ID: <989ebefa-42f1-cac7-e2d3-f4bcd1e4b662@citrix.com>
Date: Tue, 12 Sep 2023 17:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
In-Reply-To: <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2023 5:35 pm, Andrew Cooper wrote:
> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
>> set, and will also attempt to unconditionally access HWCR if the TSC is
>> reported as Invariant.
>>
>> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
>> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
>> a suitable solution.
>>
>> In order to fix expose an empty HWCR.
> At first I was thinking a straight up revert, but AMD's CPUID Faulting
> is an architectural bit in here so it's worth keeping the register around.
>
>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Not sure whether we want to expose something when is_cpufreq_controller() is
>> true, seeing as there's a special wrmsr handler for the same MSR in that case.
>> Likely should be done for PV only, but also likely quite bogus.
>>
>> Missing reported by as the issue came from the QubesOS tracker.
> Well - we can at least have a:
>
> Link: https://github.com/QubesOS/qubes-issues/issues/8502
>
> in the commit message, and it's probably worth asking Solène / Marek
> (both CC'd) if they want a Reported-by tag.
>
>> ---
>>  xen/arch/x86/msr.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index 3f0450259cdf..964d500ff8a1 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>      case MSR_K8_HWCR:
>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>              goto gp_fault;
>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>> +        /*
>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>> +         * also poke at PSTATE0.
>> +         */
> While this is true, the justification for removing this is because
> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
>
> Also because it's addition without writing into the migration stream was
> bogus irrespective of the specifics of the bit.
>
> I'm still of the opinion that it's buggy for OpenBSD to be looking at
> model specific bits when virtualised, but given my latest reading of the
> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
> can see TSC_FREQ_SEL.
>
> In some theoretical future where the toolstack better understands MSRs
> and (non)migratable VMs (which is the QubesOS usecase), then it would in
> principle be fine to construct a VM which can see the host TSC_FREQ_SEL
> and PSTATE* values.
>
> Preferably with an adjusted comment, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Sorry - I meant to be clearer here.  I'd suggest just deleting the
comment and leaving an unconditional return of 0 (which will become
conditional when we wire up CPUID Faulting).

MSR_HWCR *is* an architectural MSR on any 64bit AMD system, so shouldn't
fault.

~Andrew

