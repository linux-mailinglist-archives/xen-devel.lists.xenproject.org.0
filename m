Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B628AA7681
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 17:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974764.1362522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAsjC-0000wu-2q; Fri, 02 May 2025 15:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974764.1362522; Fri, 02 May 2025 15:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAsjC-0000vS-02; Fri, 02 May 2025 15:55:06 +0000
Received: by outflank-mailman (input) for mailman id 974764;
 Fri, 02 May 2025 15:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+YV=XS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAsjB-0000vJ-1s
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 15:55:05 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2c8887-276d-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 17:54:59 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so10746185e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 08:54:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89ee39esm48052015e9.21.2025.05.02.08.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 08:54:58 -0700 (PDT)
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
X-Inumbo-ID: cd2c8887-276d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746201299; x=1746806099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi72cNcyfy2TI1qmArEUF3+MXRZBe79I7OYwovHbUS4=;
        b=M0kJ4JbeEu5ErxLXY/c60EsORuumGkIhNrM5Inu5/nqkVcrAVqJVhOWnEHO7SQI5ln
         r1Q+T53MMzdto4oQCRXkWZEAh7MwmQZZ+76dFzPeFXenMftWxo/eLvErhby+F2joC7Uf
         ZSopmsvEwlvKSeKgogCbz6SNOX8AF9Fzbatic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201299; x=1746806099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi72cNcyfy2TI1qmArEUF3+MXRZBe79I7OYwovHbUS4=;
        b=ecW/30oPkDKZMrQ19s6wbgQOvC9XaL89LWVGkOVnoVSsnbpgJMvfp048EmLpmyU4sI
         v2/QEz1waKaIpECvIlf0uUzT2l121YkAwTMwj1KlarPxbq1Tu9hKcRx5BLOGEqqtXdbN
         FTu1usfDizGw5QwNFMWRVE4v7LjRm/FlcejiBycr+9biQb+WXYdS/2b+VCpYpe8yCLRp
         ZwyKuHD1Tid95ENaYdSG476Bhe+GTGqkL/cbzSjNMFPjKBV6c8qtx4uBc+HUyfMD+FJY
         0DRr7nkZHRxANXnfNXIKByfBR7qYrvJVjsUOds7beaOjkK44ZI7QsYgdTAAZ/TaBRQko
         Um/g==
X-Forwarded-Encrypted: i=1; AJvYcCVW372gosSmNKpkcIcKR+2i6XPv/MOKKPoRT8E2Pr8r1UlYFS/1WLEypxqER3duaGGvd7XbxfczUwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrUmrQ3xDdY4SyyjWkKPZpnN1nGLfsF2x1A8aPUaG9DRM/wnyg
	q/VqD1HOCdGz+ehJs+S0kZIIj7sumnf19hBKd2wb31T23Jrs+SQbtnYt+Pb6ngA=
X-Gm-Gg: ASbGncvvn3fzuHodf91ULGDrxo/97GKuw2wjo5FSuZUyaod84/Yp2DIVIy66RxbrOXD
	YZqa4gOOnUmoDfTb0oIThNAB9Bq+7kStnlwKVn2lTPY4SMnGIR3m2MoPHa/znFNLYBwhvpyczcb
	FTb8RIHmqyo69hsWvwhvtzC6xiTdxsPpoEAGn8Z9Vetbf2gnNaFJaAThWfMMx+RRbSeBMd6OyQL
	NP4S/NOzyh5i16LbM9GM5sSiCVPiu3Ki57ZKQE6wm1sDFNlzdx9See/bfkBcp75eR/sAg7TEeLu
	gmr/h8C3rpHravxSrJASBdbmL7xRHE5LKeFyRkyy3OLabkoWfg3GUZ0uOrFhNPwP2fSB7sK/8u8
	TE9qQOg==
X-Google-Smtp-Source: AGHT+IGiaofBegO2iXj0ONfsdk9hjfE6Ph0PojUUhX66HXglCBNzz/PS0aB3QEGzRSqBsQr48sEhAw==
X-Received: by 2002:a05:600c:4f87:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-441bbec6a6dmr30137315e9.18.1746201299080;
        Fri, 02 May 2025 08:54:59 -0700 (PDT)
Message-ID: <5cb6ef01-290f-4891-a90a-9998a7e60ba1@citrix.com>
Date: Fri, 2 May 2025 16:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: cpuid features for Sierra Forest
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
References: <20250502151709.1542875-1-kevin.lampis@cloud.com>
Content-Language: en-GB
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250502151709.1542875-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2025 4:17 pm, Kevin Lampis wrote:
> Add new cpuid features for Sierra Forest.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>

One minor thing, you should have CC'd the x86 maintainers on this patch,
which I've done.

> ---
>  xen/include/public/arch-x86/cpufeatureset.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index cc6e984a88..c0587be972 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -304,13 +304,18 @@ XEN_CPUFEATURE(SM3,          10*32+ 1) /*A  SM3 Instructions */
>  XEN_CPUFEATURE(SM4,          10*32+ 2) /*A  SM4 Instructions */
>  XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
>  XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
> +XEN_CPUFEATURE(LASS,         10*32+ 6) /*   Linear Address Space Separation */
>  XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
> +XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+ 8) /*   ArchPerfMonExt */

This is a corner case, but I typically take out the space before the 10
to keep the latter part aligned.

(Although this is going to suck for ARCH_PERF_MON2 which is coming soon
too.)

>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
>  XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
> +XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
> +XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   RDMSRLIST/WRMSRLIST/WRMSRNS */
> +XEN_CPUFEATURE(INVD_DISABLE, 10*32+30) /*   INVD_DISABLE_POST_BIOS_DONE */

I see this is the name Intel gave it, but "NO_INVD" is shorter and the
semantic is only relevant to very early firmware.

Also, 36 years late, but at least the fix has gotten out eventually... 
AMD fixed this decades ago by treating INVD as WBINVD.

>  
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
> @@ -340,6 +345,7 @@ XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*S  MSR_SPEC_CTRL.RRSBA_DIS_* */
>  XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
>  XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*S  MSR_SPEC_CTRL.BHI_DIS_S */
>  XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
> +XEN_CPUFEATURE(UC_LOCK_DISABLE,    13*32+ 6) /*   UC-lock disable */

We tend to abbreviate to DIS.  (Intel is inconsistent on whether they do
or not.)

>  
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
>  
> @@ -349,7 +355,9 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>  XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
>  XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
>  XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
> +XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET_UIF */

For the comment, "UIRET updates UIF" which is a bit better than simply
restating the name.  (Although Intel's "flexible update of ..." when
they mean "oops we didn't design it right to start with" can stay in the
Intel manual).

>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
> +XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
>  
>  /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
>  XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
> @@ -368,6 +376,7 @@ XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing
>  XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
>  XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
>  XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
> +XEN_CPUFEATURE(MCU_ENUMERATION,    16*32+16) /*   MCU_ENUMERATION */

I don't have a better suggestion, but I'm not thrilled by the name
MCU_ENUMERATION.

It's a whole bunch of different microcode loading changes.

~Andrew

