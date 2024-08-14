Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAA95216C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 19:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777598.1187711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seHzw-0008C4-4S; Wed, 14 Aug 2024 17:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777598.1187711; Wed, 14 Aug 2024 17:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seHzw-00089l-0M; Wed, 14 Aug 2024 17:41:24 +0000
Received: by outflank-mailman (input) for mailman id 777598;
 Wed, 14 Aug 2024 17:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2uER=PN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seHzu-00089e-Ol
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 17:41:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a62fbb4-5a64-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 19:41:20 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso13351566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 10:41:20 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e0e4sm196401866b.165.2024.08.14.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 10:41:18 -0700 (PDT)
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
X-Inumbo-ID: 6a62fbb4-5a64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723657279; x=1724262079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HAxl4KeHMZmAhh8dL7a9JS0Cebxnd4F5pXcRV1lUPAI=;
        b=Acwh+kUejf+QTIbNvRSEbJlqRp4iHGpLKd/rWVcRSmzIDmmr3mU6EwmtS//BW3UcC1
         AvSNDzx/vCWdQ93z0GY/wN6DqcpsOdnPB0w+IoB211F+5KOw9avWUPX7ixumFY/dtDSm
         RMm7cblI9pInWXb6wYpAvjmJbsCwd9YyqHwcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723657279; x=1724262079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAxl4KeHMZmAhh8dL7a9JS0Cebxnd4F5pXcRV1lUPAI=;
        b=fGGtqBufeIz7fc+BYb44+Oe0YcVO2iSMAgIf3BXtHq+1kUzAqx43CIrrC87yq63IW6
         jaPSgxcaf70nEjxJj8rcK15kyHSZo0ED+Hv3J7jA4oYpWTP/EGpG9rkCYEj7HwDTEscx
         oTrRMH5XJ8oA7AuQQsXuSYNc/jKICVFUFT7wFCgF4pMP7JbQ5Yu+nzmZja0Oq3fw+s6Y
         fqrqDA4/wEKCkRvIQV0O+yvbEawoGQS9pmXoGvgrTOClMJGT3lbZVtAXjpNXB9xrS6KJ
         mCWP3wWAwjp5KgBXChDhP03ftd9FSX28VoojSm0Jx0WMAqddYEueok36SaqSZNXttkny
         +Agg==
X-Forwarded-Encrypted: i=1; AJvYcCXNH8/PJmotx84oWaAOrBhLkEHLNpKCBscn2Yn5k2VvPeLZFeXZXwW1ri/m92jr/F+vrulObDR6Gca5BPu0Y5Q8nrOPftb4E8reQmMzw7Q=
X-Gm-Message-State: AOJu0YzfOJgwcs5UKk0x6bBF7WLus10eCmn+IWXrCGKX/49ptAeIEpwb
	S8xpwcr2L0SmB1Ojzkl7bBZZdGMgSfaQC8ICbd8e5LBoSG+Gjq/vSj7RVnY0Buw=
X-Google-Smtp-Source: AGHT+IERX3Mj//Gw8DhjPQ7wvn76n+sKI/nG2jntPx8fYB9X8qr9pZWmljM4qBzoyVBYiRL4yKGfRA==
X-Received: by 2002:a17:907:d5a4:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a8367006615mr250999666b.51.1723657279361;
        Wed, 14 Aug 2024 10:41:19 -0700 (PDT)
Message-ID: <92e8407c-4f49-4393-bb58-07a8410b6ee0@citrix.com>
Date: Wed, 14 Aug 2024 18:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Matthew Barnes <matthew.barnes@cloud.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2024 4:52 pm, Matthew Barnes wrote:
> Upon running `xen-cpuid -d` on a host machine with Sapphire Rapids

I presume you mean -v ?

> within Dom0, there exist unrecognised features.
>
> This patch adds these features as macros to the CPU featureset,
> disabled by default.
>
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
>  xen/include/public/arch-x86/cpufeatureset.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index abab78fa86db..db633bd5c128 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -121,6 +121,7 @@ XEN_CPUFEATURE(SMX,           1*32+ 6) /*   Safer Mode Extensions */
>  XEN_CPUFEATURE(EIST,          1*32+ 7) /*   Enhanced SpeedStep */
>  XEN_CPUFEATURE(TM2,           1*32+ 8) /*   Thermal Monitor 2 */
>  XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensions-3 */
> +XEN_CPUFEATURE(SDGB,          1*32+11) /*   Silicon Debugging */
>  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
>  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
>  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
> @@ -181,6 +182,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /*A  XSAVEOPT instruction */
>  XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
>  XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
>  XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
> +XEN_CPUFEATURE(XFD,           4*32+ 4) /*   Extended Feature Disable */

/* MSR_XFD{,_ERR} (eXtended Feature Disable) */

>  
>  /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
>  XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
> @@ -221,6 +223,7 @@ XEN_CPUFEATURE(AVX512_VBMI,   6*32+ 1) /*A  AVX-512 Vector Byte Manipulation Ins
>  XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
> +XEN_CPUFEATURE(WAITPKG,       6*32+ 5) /*   User-level monitoring support */

UMONITOR/UMWAIT/TPAUSE

It's more than just monitoring support.

>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
>  XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
> @@ -228,13 +231,16 @@ XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
>  XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
>  XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
> +XEN_CPUFEATURE(TME_EN,        6*32+13) /*   TME MSR support */

Just TME as a name.  We don't tend to have suffixes like
enabled/supported because they're just line-noise.

As a comment, go for Total Memory Encryption.  It's more than just an MSR.

>  XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
> +XEN_CPUFEATURE(LA57,          6*32+16) /*   57-bit linear addressing and five-level paging */

"5-level paging (57-bit linear addresses)" is more concise.

>  XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
>  XEN_CPUFEATURE(BLD,           6*32+24) /*   BusLock Detect (#DB trap) support */
>  XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
>  XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
>  XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
>  XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
> +XEN_CPUFEATURE(SGX_LC,        6*32+30) /*   SGX Launch Configuration */

This is an irritating case where the SDM disagrees with all the
whitepapers on the name.  Everywhere else calls it Control, not
Configuration (and technically, "Flexible" at that).

I doubt the difference matters in practice.

>  XEN_CPUFEATURE(PKS,           6*32+31) /*H  Protection Key for Supervisor */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
> @@ -264,6 +270,7 @@ XEN_CPUFEATURE(BTC_NO,        8*32+29) /*A  Hardware not vulnerable to Branch Ty
>  XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
>  
>  /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
> +XEN_CPUFEATURE(SGX_KEYS,      9*32+ 1) /*   Attestation Services for Intel SGX */

Again, "SGX Attestation Service" is more concise.

>  XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*   Xeon Phi AVX512 Neural Network Instructions */
>  XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*   Xeon Phi AVX512 Multiply Accumulation Single Precision */
>  XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
> @@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
> +XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   Platform configuration support */

"PCONFIG insn".  That's a lot more meaningful to someone glancing at
this file.  "platform configuration" is a functionally infinite set of
things.

>  XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
>  XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
> +XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operations on bfloat16 numbers */
>  XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
>  XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
> +XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operations on 8-bit integers */
>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
> @@ -363,6 +373,8 @@ XEN_CPUFEATURE(GDS_CTRL,           16*32+25) /*   MCU_OPT_CTRL.GDS_MIT_{DIS,LOCK
>  XEN_CPUFEATURE(GDS_NO,             16*32+26) /*A  No Gather Data Sampling */
>  XEN_CPUFEATURE(RFDS_NO,            16*32+27) /*A  No Register File Data Sampling */
>  XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by VERW */
> +XEN_CPUFEATURE(IGN_UMONITOR_SUPPORT, 16*32+29) /*  UMONITOR Ignore support */
> +XEN_CPUFEATURE(MON_UMON_MITG_SUPPORT, 16*32+30) /*  (U)MONITOR Mitigation support */

These two want splitting out into separate patch, which does more than
just this.

Read the whitepaper:
https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/monitor-umonitor-performance-guidance.html

and we want all 5 new enumerations, even the new CPUID bit (because it
will start existing on GNR/CWF I believe).  Also, ARCH_CAPS is special
because it's duplicated here and in msr-index.h

Finally, somewhere in the Intel bringup code, if we see
ARCH_CAPS.IGN_UMON then we want to force MCU_OPT.IGN_UMON (because we
don't support UMONITOR) and clear MCU_OPT.MON_MITG.

The ucode-load defaults are safe for Xen (this is why we didn't XSA it
on the embargo date), but there's a corner case if something earlier in
the boot chain decided to activate the less-safe mode.

~Andrew

