Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2295D105
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 17:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782406.1191895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shVtx-0003pW-4y; Fri, 23 Aug 2024 15:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782406.1191895; Fri, 23 Aug 2024 15:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shVtx-0003ng-27; Fri, 23 Aug 2024 15:08:33 +0000
Received: by outflank-mailman (input) for mailman id 782406;
 Fri, 23 Aug 2024 15:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shVtv-0003na-Bk
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 15:08:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e1ba1e0-6161-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 17:08:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bed83487aeso2370987a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 08:08:29 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c044ddbf0fsm2179464a12.15.2024.08.23.08.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 08:08:28 -0700 (PDT)
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
X-Inumbo-ID: 8e1ba1e0-6161-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724425709; x=1725030509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VT7svKsPUSrkaGv1sbHwS5D8HHM82C4ULQJ5gPv1TjA=;
        b=ZCG/2+8nteSD+YUTZqiEl33BmVAjtmRQVR/FagUEbrT4IAvdJRCC7MqnGu77KijxtZ
         YGBinz8dQqXztTqHHOfc1MdFMTw4hfKAM5Od5EXi2SkDdK6wS7Li8eXiPK8lNlx1U0qv
         Tmkrkn9Amz77lLufG++i23cmy9ym8XMhbCWCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724425709; x=1725030509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT7svKsPUSrkaGv1sbHwS5D8HHM82C4ULQJ5gPv1TjA=;
        b=kYLrQQz3a+csHKLifPOm01uC0Q8tEptf5/HPzz3TiH6xI3ey3D2ofvMSWUd1YUV2bf
         8+E9eqTSQcSCn5B2SNTsAiwbcEfnoRgHRgrfD1jnPvYa+2i1uVATp8ubh5i1Y+xlntkW
         Qe6PMHRz7FHlADXj8SNjV5EhbukKsoDqFBpxYXOPo3maNs0T3RIx4RVIrbd9sZoWrtye
         1c1WTxgfLa44+VGbR4eLL3sBV0joM2BG1oza4YHvsPsp87Sk4nIfflerV8dXoBgUTZ+1
         T/kOBj4rE0prkaWPVjdpcqctwGEi90+RHiXhLQ/OzF6fbs5Vkj9EDp8E2YjiBjWBdpxs
         GxLw==
X-Forwarded-Encrypted: i=1; AJvYcCUAyxCy1lvTXO/oRAOfSn96pBgwsKTLv2EqUSkIURBixokHcK2z90UpPVnGEM1ood8Tn7a7bpfE1BI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqqm1ZKCmDxwI8XHXbX087tiw4tPc4p93iTwjikcDfFwhgzt52
	FML6VblTEBPAfxhWZuToUHO8201sn+N9a6KuiC6A6/rDyU08ogwiCsmEaXscE6U=
X-Google-Smtp-Source: AGHT+IEzN/+Q0Dvka9xERUVQsDduYfqJOG0E8V7rAnW2s76SP9XujhdwanbGlqwjpt/r8IjpcXvVvQ==
X-Received: by 2002:a50:cb86:0:b0:5be:f1a7:c2cd with SMTP id 4fb4d7f45d1cf-5c0891afa15mr1510764a12.31.1724425708771;
        Fri, 23 Aug 2024 08:08:28 -0700 (PDT)
Message-ID: <4d88b5d1-592e-4756-b093-6cbf1ca08948@citrix.com>
Date: Fri, 23 Aug 2024 16:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] x86emul/test: rename "cp"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
 <fb9e2081-16d5-4dc4-92f5-fb55f313304b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fb9e2081-16d5-4dc4-92f5-fb55f313304b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2024 9:51 am, Jan Beulich wrote:
> In preparation of introducing a const struct cpu_policy * local in
> x86_emulate(), rename that global variable to something more suitable:
> "cp" is our commonly used name for function parameters or local
> variables of type struct cpu_policy *, and the present name of the
> global could hence have interfered already.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-base over dropping of Xeon Phi support.

Bah - still need to reinstate part of that patch.  The model numbers
need to stay.  /me adds it to the todo list.

For this patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,
with one request for this patch a couple of thoughts for separate patches.

> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -123,7 +123,7 @@ static inline uint64_t xgetbv(uint32_t x
>  }
>  
>  /* Intentionally checking OSXSAVE here. */
> -#define cpu_has_xsave     (cp.basic.raw[1].c & (1u << 27))
> +#define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))

Right now we deliberately don't emit names for APIC, OSXSAVE and OSPKE,
because the values won't be correct in a guest's policy.  But this is a
legitimate corner case.

What about this?

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 601eec608983..1b56958f07e7 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -382,10 +382,11 @@ def crunch_numbers(state):
             if name and name[0] in "0123456789":
                 name = "_" + name
 
-            # Don't generate names for features fast-forwarded from other
-            # state
+            # For dynamic features (fast forwarded from other state), also
+            # prefix with an underscore to highlight that extra care
needs to
+            # be taken.
             if name in ("APIC", "OSXSAVE", "OSPKE"):
-                name = ""
+                name = "_" + name
 
             names.append(name.lower())
 
which would make the expression become cpu_policy.basic._osxsave and
avoid the opencoded number.

> @@ -133,63 +133,63 @@ static inline bool xcr0_mask(uint64_t ma
>  unsigned int rdpkru(void);
>  void wrpkru(unsigned int val);
>  
> -#define cache_line_size() (cp.basic.clflush_size * 8)
> -#define cpu_has_fpu        cp.basic.fpu
> -#define cpu_has_mmx        cp.basic.mmx
> -#define cpu_has_fxsr       cp.basic.fxsr
> -#define cpu_has_sse        cp.basic.sse
> -#define cpu_has_sse2       cp.basic.sse2
> -#define cpu_has_sse3       cp.basic.sse3
> -#define cpu_has_pclmulqdq  cp.basic.pclmulqdq
> -#define cpu_has_ssse3      cp.basic.ssse3
> -#define cpu_has_fma       (cp.basic.fma && xcr0_mask(6))
> -#define cpu_has_sse4_1     cp.basic.sse4_1
> -#define cpu_has_sse4_2     cp.basic.sse4_2
> -#define cpu_has_popcnt     cp.basic.popcnt
> -#define cpu_has_aesni      cp.basic.aesni
> -#define cpu_has_avx       (cp.basic.avx  && xcr0_mask(6))
> -#define cpu_has_f16c      (cp.basic.f16c && xcr0_mask(6))
> -
> -#define cpu_has_avx2      (cp.feat.avx2 && xcr0_mask(6))
> -#define cpu_has_bmi1       cp.feat.bmi1
> -#define cpu_has_bmi2       cp.feat.bmi2
> -#define cpu_has_avx512f   (cp.feat.avx512f  && xcr0_mask(0xe6))
> -#define cpu_has_avx512dq  (cp.feat.avx512dq && xcr0_mask(0xe6))
> -#define cpu_has_avx512_ifma (cp.feat.avx512_ifma && xcr0_mask(0xe6))
> -#define cpu_has_avx512cd  (cp.feat.avx512cd && xcr0_mask(0xe6))
> -#define cpu_has_sha        cp.feat.sha
> -#define cpu_has_avx512bw  (cp.feat.avx512bw && xcr0_mask(0xe6))
> -#define cpu_has_avx512vl  (cp.feat.avx512vl && xcr0_mask(0xe6))
> -#define cpu_has_avx512_vbmi (cp.feat.avx512_vbmi && xcr0_mask(0xe6))
> -#define cpu_has_avx512_vbmi2 (cp.feat.avx512_vbmi2 && xcr0_mask(0xe6))
> -#define cpu_has_gfni       cp.feat.gfni
> -#define cpu_has_vaes      (cp.feat.vaes && xcr0_mask(6))
> -#define cpu_has_vpclmulqdq (cp.feat.vpclmulqdq && xcr0_mask(6))
> -#define cpu_has_avx512_vnni (cp.feat.avx512_vnni && xcr0_mask(0xe6))
> -#define cpu_has_avx512_bitalg (cp.feat.avx512_bitalg && xcr0_mask(0xe6))
> -#define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
> -#define cpu_has_movdiri    cp.feat.movdiri
> -#define cpu_has_movdir64b  cp.feat.movdir64b
> -#define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
> -#define cpu_has_serialize  cp.feat.serialize
> -#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
> -#define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
> -#define cpu_has_sm3        (cp.feat.sm3 && xcr0_mask(6))
> -#define cpu_has_sm4        (cp.feat.sm4 && xcr0_mask(6))
> -#define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
> -#define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
> -#define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
> -#define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
> -#define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
> -#define cpu_has_avx_vnni_int16 (cp.feat.avx_vnni_int16 && xcr0_mask(6))

Can we take the opportunity to realign these vertically?

Also, we have X86_XCR0_* constants in a helpful place now.  Could we do
something like:

#define XCR0_AVX xcr0_mask(X86_XCR0_YMM | X86_XCR0_SSE)
#define XCR0_AVX512 ...

So that these expressions now read

#define cpu_has_$X (... && XCR0_AVX)

rather than forcing the reader to know %xcr0 by raw hex?

~Andrew

