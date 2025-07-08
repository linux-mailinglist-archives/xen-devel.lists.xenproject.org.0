Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED93AFCC0B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036525.1408781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Na-0005Ln-Q4; Tue, 08 Jul 2025 13:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036525.1408781; Tue, 08 Jul 2025 13:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Na-0005JO-Mp; Tue, 08 Jul 2025 13:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1036525;
 Tue, 08 Jul 2025 13:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8NZ-0005JI-9i
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:29:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81ce82cf-5bff-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:29:00 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so2801904f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455d755sm106109235ad.105.2025.07.08.06.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:28:58 -0700 (PDT)
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
X-Inumbo-ID: 81ce82cf-5bff-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751981339; x=1752586139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f7xnpOrVD02CCbRZOBfzqE8SreKQMqvY6CpRo3O8TQ8=;
        b=ce350mVZjQ3tyupfn7gbrLoHAKDhp7ENJlsHakP7uAfK698Mn3JKTw/MTLXeT0Ij/3
         hk+59bsmKk2qbx9GbcxiO9ntaNEsVpjNbcRNhoFA9prIHsCmBUDej/jN+IXd4ZQTiftI
         UtY6ptdhSPA1Etnk67nhVX+0JegxqFWInY9aDUb5jZZuZrM0r22BM3524cVUm9AeCGfJ
         e6FhEz00+XdZ1hG8+8D0nZfZKXzMEeblH8eqTUhkfFn9AAxuD9rqmAsqeP6WLTF2JS0K
         UV8yonodei2ZjEihMVD7mEQVmi3VEWS9wF85tJdqdZEltRrmuC/6xWFV2SbpZnVxQ74k
         NKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981339; x=1752586139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7xnpOrVD02CCbRZOBfzqE8SreKQMqvY6CpRo3O8TQ8=;
        b=lvNNsGPnA0OAyrWwgtF2LNaADPCV9x88ZTwG+z7x1dE9Ge0qcI6mw9xizrjc2sjHi1
         sEjWgb15BOFjyT3dwYRixzuBTn8089vaff9my4TEu0ikVBlB9ak9J17mn+HqCHUwCUvY
         gY2tlXzoGwj8rCsVSXfB/2jz6FJpXvn7qC1G+EcBhDO21sglWgZXpaYarB0JEpdqxas5
         KFKiJ5IRF85uzvfof0yl3L1g1VIjE+idHOBdfE2E7ilUix1/q8QW17m1fE0IL7LE03zN
         tTLlbXbzu7QZIK6031Mfyv2gSQpfqUD16LegT+pedrmknnBc/MY4Sj5AfnLdtmVmozUm
         Qw1A==
X-Forwarded-Encrypted: i=1; AJvYcCX4avrIU7znVIolxHaJfYllP61oJsipG/a3HJOx3EvIemzz7QBAh+iTd6m2ag3HBvFNFolR31uP5Og=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybL4UjGFkSmtjHfUhfjfdJJ3tgVmSZ1ijSZMtDpjK5Yfi4MkHL
	sCzR5ycZoyzndCCzI1X6u6uRBTQFU4abD+/aDmzr4ARKNPCXw8ybLyfzcug9oEP9Uw==
X-Gm-Gg: ASbGncvTdLlZNNLfltFsXJsWXKkfB0wCQ6d9nTFSK3vjv6QNleFjXI1iMq2AaCOlg3E
	UmKvjmSgbpIEMt5eTux8SnkA79eLn3nRfJWW3AceRRH0tE2erUYWTeY/eZfGcCXKDm/CRZv0TOI
	oGYUbh/QSvoqTs5v10UnO7qc/hXoSO/WDYeMKk/RGm3pjTWvGru6XQIeCEsZ+F1qhudsoHEiLrf
	hNP3pEPsdLIAJDdjbSwxkwhMjrBzf3fQb441x1IbbF4kDFuOu+n4ljZFRAoDdjf4S/JPOQ61Qew
	ntEwMbC01CTihULFQuBKAfsX9aEibzVNGK+9+PJ+SLShkNA/1O78JPVMXmG4nNrs89e9RfvoQsA
	q15TceU0ueexbLfL8STdZ3+GvMWWDO/aUMFG6V5HYFVbWYRY=
X-Google-Smtp-Source: AGHT+IH4ljdqMqo9lDvGaH50EfH6qdIivW5OJOUUHrpPkSby4wkB9be0MqKeITYbjDBfSwSfSFNBng==
X-Received: by 2002:a05:6000:4912:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3b5dde845f8mr2470336f8f.10.1751981339462;
        Tue, 08 Jul 2025 06:28:59 -0700 (PDT)
Message-ID: <8a7b1a65-f5c2-4992-a935-3c134d55a2f1@suse.com>
Date: Tue, 8 Jul 2025 15:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: introduce AMD_MCE_NONFATAL
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Xenia.Ragiadakou@amd.com, Jason.Andryuk@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <20250708000712.2731666-2-stefano.stabellini@amd.com>
 <DB6LN9YLAF8J.1OV1IDMXC7F0Q@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <DB6LN9YLAF8J.1OV1IDMXC7F0Q@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 12:25, Alejandro Vallejo wrote:
> On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -10,6 +10,21 @@ config AMD
>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>  	  must be enabled for Xen to work suitably on AMD platforms.
>>  
>> +config AMD_MCE_NONFATAL
>> +	bool "Check for non-fatal MCEs on AMD CPUs"
>> +	default y
>> +	depends on AMD
>> +	help
>> +	  Check for non-fatal MCE errors.
>> +
>> +	  When this option is on (default), Xen regularly checks for
>> +	  non-fatal MCEs potentially occurring on all physical CPUs. The
>> +	  checking is done via timers and IPI interrupts, which is
>> +	  acceptable in most configurations, but not for real-time.
>> +
>> +	  Turn this option off if you plan on deploying real-time workloads
>> +	  on Xen.
>> +
> 
> This being in the CPU vendor submenu seems off. I'd expect only a list of
> silicon vendors here. I think it ought to be in the regular Kconfig file.

Whether in this file or the regular one is up for discussion, but yes,
definitely not inside the vendor menu.

>> --- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
>> +++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
>> @@ -191,7 +191,8 @@ static void cf_check mce_amd_work_fn(void *data)
>>  
>>  void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
>>  {
>> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
>> +	if ( !IS_ENABLED(CONFIG_AMD_MCE_NONFATAL) ||
>> +	     (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) )
>>  		return;
>>  
>>  	/* Assume we are on K8 or newer AMD or Hygon CPU here */
> 
> It can be made more general to remove more code. What do you think of removing
> all non-fatals and getting rid of the initcall altogether?

I think such a more general approach would be quite a bit better.

Jan

> 	diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> 	index 5fb18db1aa..a4b892a1aa 100644
> 	--- a/xen/arch/x86/Kconfig.cpu
> 	+++ b/xen/arch/x86/Kconfig.cpu
> 	@@ -10,6 +10,20 @@ config AMD
> 	          May be turned off in builds targetting other vendors.  Otherwise,
> 	          must be enabled for Xen to work suitably on AMD platforms.
> 
> 	+config MCE_NONFATAL
> 	+       bool "Check for non-fatal MCEs"
> 	+       default y
> 	+       help
> 	+         Check for non-fatal MCE errors.
> 	+
> 	+         When this option is on (default), Xen regularly checks for
> 	+         non-fatal MCEs potentially occurring on all physical CPUs. The
> 	+         checking is done via timers and IPI interrupts, which is
> 	+         acceptable in most configurations, but not for real-time.
> 	+
> 	+         Turn this option off if you plan on deploying real-time workloads
> 	+         on Xen.
> 	+
> 	 config INTEL
> 	        bool "Support Intel CPUs"
> 	        default y
> 	diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Makefile
> 	index e6cb4dd503..c70b441888 100644
> 	--- a/xen/arch/x86/cpu/mcheck/Makefile
> 	+++ b/xen/arch/x86/cpu/mcheck/Makefile
> 	@@ -1,12 +1,12 @@
> 	-obj-$(CONFIG_AMD) += amd_nonfatal.o
> 	+obj-$(filter $(CONFIG_AMD),$(CONFIG_MCE_NONFATAL)) += amd_nonfatal.o
> 	 obj-$(CONFIG_AMD) += mce_amd.o
> 	 obj-y += mcaction.o
> 	 obj-y += barrier.o
> 	-obj-$(CONFIG_INTEL) += intel-nonfatal.o
> 	+obj-$(filter $(CONFIG_INTEL),$(CONFIG_MCE_NONFATAL)) += intel-nonfatal.o
> 	 obj-y += mctelem.o
> 	 obj-y += mce.o
> 	 obj-y += mce-apei.o
> 	 obj-$(CONFIG_INTEL) += mce_intel.o
> 	-obj-y += non-fatal.o
> 	+obj-$(CONFIG_MCE_NONFATAL) += non-fatal.o
> 	 obj-y += util.o
> 	 obj-y += vmce.o
> 
> ... with the Kconfig option probably in the regular x86 Kconfig rather than
> Kconfig.cpu
> 
> Thoughts?
> 
> Cheers,
> Alejandro


