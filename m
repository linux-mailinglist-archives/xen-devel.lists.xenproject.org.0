Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82FB3084B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 23:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089309.1446932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCl5-00037M-9v; Thu, 21 Aug 2025 21:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089309.1446932; Thu, 21 Aug 2025 21:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCl5-00035u-6C; Thu, 21 Aug 2025 21:23:43 +0000
Received: by outflank-mailman (input) for mailman id 1089309;
 Thu, 21 Aug 2025 21:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upCl4-00035o-JM
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 21:23:42 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b7dac8a-7ed5-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 23:23:40 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1963so882188f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 14:23:40 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50d5dd4asm11348105e9.0.2025.08.21.14.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 14:23:39 -0700 (PDT)
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
X-Inumbo-ID: 1b7dac8a-7ed5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755811420; x=1756416220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=01vrXnuz+3OKzmvzM69/VLqtpRQ7SJTpeIbl//QMCME=;
        b=ejvLO/Zu8bg7FUcRTXAx7zZEPiGYgg0c6rQAmLUqOrwX3mLvYAQvLkffLILBjaj72/
         SlL+tXXGEOEsp+w4MR/Y/WDW38VuzWT8HQLR8P0InZQdyKC9MzHySRYwJQPbZoLGTDiP
         wpUfAzxsb3APBKcExjtcxBW/3ITl1nQu23o3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755811420; x=1756416220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01vrXnuz+3OKzmvzM69/VLqtpRQ7SJTpeIbl//QMCME=;
        b=bLX4VrAyLqEnMlduS2rdTTTETUCGcAvtpteJr62OWizY44Pm0Ab286bFg+bw2zoIdM
         NKpca+xk0mlsPLZbrjKchHFgOrVHV3Y9AeAgXTSIQPT2hj2qcR+bX0XtuLMiIzSyvUv3
         zgw7hYvf6yecBR+AP90vf2R585BypVsIj/bUvYylI0Jb/oLg2FuS2Kx7oIZkXbmx/7m0
         e/jiCSlnM1eLkitCl/rmHOPSPCtWUG0mEVMkDDJ21wjB6xzduc9A4wcLsx+rwjkYMDKi
         nUE/FwSkLBhgLMhxBMeC2BruJMPGEcQ4/hSIgHnXvBnnSWrc9+I4C5uoKSQ3S1I+GkV0
         KfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHLeeOze2X7YQGP/9PENkJouaO3Qax7yn5dMV+ZelWfkhzM0lNQxaCRQGAoYQ55uJAIUAx+3vFdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRATarutavPdOrLRAt+09tgi5kyyuI+GgPNqdogumyuK+jkdfr
	eQeED6v6C3c4KQFeU10nUXhswRm83HvM9XH4wqxpfNPUJgRjlEbNjuZFsw2GAzn/8o0=
X-Gm-Gg: ASbGncvwo9ccXjEmPgMwsa0pqrkXE1dkFFvHMo9oC8oiP8KsmyvJj8MmLgwa1OLXm34
	H/ASzN3TDLrNl5SWMVjjcDwY2nMsvL/Jpodni79cfPZUz4ycaZghYDJkPBrJ1QddhaSI2jDk0mU
	VK4LOz7nUeB2Q1KlTBwEE6Ux+4P393oZpot9LbZeaIABahAEAIevE0uoMY0DLPlsyoIH+InAOZV
	MKG/goMUGsTDD94O4oMiIIQf0gbvY765Yk86INQC5Md9X1O/+LknOQ7hwYg/C3xyL2rhn9OcasU
	fjB0MkP/EuHC6CXPDImAe80VrrszaG+vD0/6rBCHqXuWny4qyCHmQe1nV+36jb+GkqhdMKrOM2c
	qQvshh0Ut7dhb4YTQy0zOQZigGGE3YcbOkJsxjnvq9jW9jTF9rSRd74SfbMbzv3WDw8luz/jd59
	cjM18=
X-Google-Smtp-Source: AGHT+IFFdAfLefFX2Nqc4L6GZrpLASQW8/dBKR9MB3h0W4MQ466jdrE9Whs7ExF2pcKH95FL37OMNQ==
X-Received: by 2002:a05:6000:240c:b0:3bd:148e:22d with SMTP id ffacd0b85a97d-3c5d808ff01mr343954f8f.0.1755811419696;
        Thu, 21 Aug 2025 14:23:39 -0700 (PDT)
Message-ID: <3a0820be-a4cb-4c23-b478-7f453bed92da@citrix.com>
Date: Thu, 21 Aug 2025 22:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 12:20 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.
>>
>> Most supported toolchains don't understand the FRED instructions yet.  ERETU
>> and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
>> more complicated and deferred for now.
>>
>> I have intentionally named the FRED MSRs differently to the spec.  In the
>> spec, the stack pointer names alias the TSS fields of the same name, despite
>> very different semantics.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -57,6 +57,10 @@ config HAS_CC_CET_IBT
>>  	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
>>  	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
>>  
>> +config HAS_AS_FRED
>> +	# binutils >= 2.41 or LLVM >= 19
>> +	def_bool $(as-instr,eretu;lkgs %ax)
> ..., as per your reply, this preferably dropped

Having now got the PV side complete (I think), I can indeed drop this,
but I need

diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 71308d9dafc8..0a98676c1604 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -18,7 +18,7 @@ XEN_CPUFEATURE(ARCH_PERFMON,      X86_SYNTH( 3)) /* Intel Architectural PerfMon
 XEN_CPUFEATURE(TSC_RELIABLE,      X86_SYNTH( 4)) /* TSC is known to be reliable */
 XEN_CPUFEATURE(XTOPOLOGY,         X86_SYNTH( 5)) /* cpu topology enum extensions */
 XEN_CPUFEATURE(CPUID_FAULTING,    X86_SYNTH( 6)) /* cpuid faulting */
-/* Bit 7 unused */
+XEN_CPUFEATURE(XEN_FRED,          X86_SYNTH( 7)) /* Xen uses FRED */
 XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */


too for a fastpath in assembly.  I've folded it into this patch.

~Andrew

