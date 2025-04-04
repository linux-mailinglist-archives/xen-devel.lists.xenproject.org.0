Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FEAA7BAD6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938094.1338901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0eLC-0004n9-3p; Fri, 04 Apr 2025 10:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938094.1338901; Fri, 04 Apr 2025 10:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0eLC-0004jy-0X; Fri, 04 Apr 2025 10:32:02 +0000
Received: by outflank-mailman (input) for mailman id 938094;
 Fri, 04 Apr 2025 10:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9O5F=WW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0eLB-0004js-9I
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:32:01 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9d873e-1140-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 12:32:00 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so12632325e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:32:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a6796sm4079859f8f.31.2025.04.04.03.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 03:31:59 -0700 (PDT)
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
X-Inumbo-ID: 0a9d873e-1140-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743762720; x=1744367520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5TbxEItRPN++jDfqsq6UNaHPrqlCWgTQrcy3YyqfQac=;
        b=vwtJioy8iKrdykADhz7xpO/uDZq3fyXgvkgH+kMYecS0V8B4RAbyqLKyG4dPevQquJ
         sh+MjUXF6R/Yqu0ItTnXLJTLto8yiEW9iCNS/015s2QvGT6WgLeCDHZ6e3M3wynJDfD5
         rbu9tBMojUIcnS8cJJilHd7N9Bsy2go7MTFNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762720; x=1744367520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TbxEItRPN++jDfqsq6UNaHPrqlCWgTQrcy3YyqfQac=;
        b=OzWUpOLb9xTbnYJ5kFNXpDYK0PESxSAMUl8ty23xc+F7xkn0x5J7I/LgVtuMlJrIsH
         LU98MvrGkCieYP7dXbWPwm2yIZEoEa+uD3s2/BJ9rSyy6WlYJlGPfpv7T82n9Hpvezlh
         wVeOfRjqJz1I0fkHx+KQOJk2ej+D2KIw5JqtdB97ezV1Tk4RoQJEbEFp/GA3Vj9kgUic
         LZ+yc3uyUURJR4bcOs/m+7StbU60oNgd5uHdZr7+50I0nsJmsNIUZL8UZflVxbR+CW6l
         iGE4Lgfjtsi+3brtTi5XMCUQg0Yw0cvjiKTXVrJFo9lvQGo/4wT8fWvixZDzNTVPXRiu
         zGXg==
X-Forwarded-Encrypted: i=1; AJvYcCWIeiUPJSTFHCaHk6hrC/BZwlo3E5K13AR1Fyu3xpY685wv7UMIYW0Ii5isUauDTUVT9HPA1SyEOdQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj+7JikGgS+1MVtkNrzEeuQ1SaMRimcDvNXE1t+pSgkGEquelZ
	g8RdXS4Y8haBjk557EHSyeTCTpEyN4aH7ksreTJANykwZs+/wcccQz1dYLucY4c=
X-Gm-Gg: ASbGncupT6GsluFdz5fRaGwkhbo0KL81HygjJTale8IhknishxDGnjscrNECD7cv9HZ
	ylx/GrqKFEMHrzW7bIOwWbxGj9x4+xYKB6bpbJMEOP0aV7/ZwvcX7m6HpqIBbjbtKceNrjn6zb8
	8B1mJQAUiZ+0iYTE+b6wOGSDKO/XHDTq1Zf1Dz3Rq+cX4avEgi21o6WNHCUDGPG8qFaNMLO2tJj
	5Yin0hFHdWgoBEvI3yejYnKFS+Jz5CqqJ6DtF/jXRLPtqL4oYvM/Jf6hk2+evVBqB85UN9wjiaK
	Ku2z4Y7SnCHF7tPfQDNW/sALdUpirv4eHsmXP3t0vQHi3FYbt8efabnCDMBKP5OCLbvJpLAbuEe
	FJbGRYhEwIA==
X-Google-Smtp-Source: AGHT+IEVaG2GNm3TwomAmEioIJFOXPaDcaWH9p5jjBm3mDCfMQzg5x06A6jRRuMvCLDRKSnH1do8Dg==
X-Received: by 2002:a05:6000:4027:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39d0de28abfmr1924854f8f.27.1743762719745;
        Fri, 04 Apr 2025 03:31:59 -0700 (PDT)
Message-ID: <af55a92a-6120-4796-9d5d-c6dc0e7a57c5@citrix.com>
Date: Fri, 4 Apr 2025 11:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/amd: Add guest support for AMD TCE
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1743756934.git.teddy.astie@vates.tech>
 <885867a86eb41fd78df24b6599312b54be8e20ca.1743756934.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <885867a86eb41fd78df24b6599312b54be8e20ca.1743756934.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 10:49 am, Teddy Astie wrote:
> AMD Translation Cache Extension is a flag that can be enabled in the EFER MSR to optimize
> some TLB flushes. Expose this flag to guest if supported by hardware.
>
> AMD Architecture Developer Manual describe this feature as follow
>> Setting this bit to 1 changes how the INVLPG, INVLPGB, and INVPCID instructions operate
>> on TLB entries. When this bit is 0, these instructions remove the target PTE from the
>> TLB as well as all upper-level table entries that are cached in the TLB, whether or not
>> they are associated with the target PTE. When this bit is set, these instructions will
>> remove the target PTE and only those upper-level entries that lead to the target PTE in
>> the page table hierarchy, leaving unrelated upper-level entries intact. This may provide
>> a performance benefit.
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

You probably want to note that Linux 6.14(?) now uses this feature.

You definitely need to discuss that it's only in HAP VMs.  i.e. no PV,
and no Shadow.

Personally, I'd drop the quote from the APM.  You've already said "to
optimise some TLB flushes".  Anyone wanting to know details about the
feature needs to read the APM anyway.


> ---
>  CHANGELOG.md                                | 1 +
>  xen/arch/x86/hvm/hvm.c                      | 3 +++
>  xen/arch/x86/include/asm/msr-index.h        | 3 ++-
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8f6afa5c85..dbfecefbd4 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
>       capability usage is not yet supported on PVH dom0).
>     - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
> +   - Guest support for AMD Translation Cache Extension feature.
>  
>  ### Removed
>  
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5950f3160f..184357b042 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -959,6 +959,9 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
>      if ( (value & EFER_FFXSE) && !p->extd.ffxsr )
>          return "FFXSE without feature";
>  
> +    if ( (value & EFER_TCE) && !p->extd.tce )
> +        return "TCE without feature";
> +
>      if ( (value & EFER_AIBRSE) && !p->extd.auto_ibrs )
>          return "AutoIBRS without feature";
>  

Not for this patch, but it's probably time we made hvm_efer_valid() work
more like hvm_cr4_guest_valid_bits().

The only interesting bit is the specific diagnostic for LMA/LME/CR0
mismatch, and I don't think the complexity is worth it for just that.

> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 22d9e76e55..d8576aec1c 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -200,11 +200,12 @@
>  #define  EFER_NXE                           (_AC(1, ULL) << 11) /* No Execute Enable */
>  #define  EFER_SVME                          (_AC(1, ULL) << 12) /* Secure Virtual Machine Enable */
>  #define  EFER_FFXSE                         (_AC(1, ULL) << 14) /* Fast FXSAVE/FXRSTOR */
> +#define  EFER_TCE                           (_AC(1, ULL) << 15) /* Translation Cache Extensions */
>  #define  EFER_AIBRSE                        (_AC(1, ULL) << 21) /* Automatic IBRS Enable */
>  
>  #define EFER_KNOWN_MASK \
>      (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
> -     EFER_AIBRSE)
> +     EFER_TCE | EFER_AIBRSE)

Sorry, missed one aspect.  You need to filter TSE out in guest_efer()
for PV guests.

>  
>  #define MSR_STAR                            _AC(0xc0000081, U) /* legacy mode SYSCALL target */
>  #define MSR_LSTAR                           _AC(0xc0000082, U) /* long mode SYSCALL target */
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index cc6e984a88..8182d2dbed 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -170,6 +170,7 @@ XEN_CPUFEATURE(SKINIT,        3*32+12) /*   SKINIT/STGI instructions */
>  XEN_CPUFEATURE(WDT,           3*32+13) /*   Watchdog timer */
>  XEN_CPUFEATURE(LWP,           3*32+15) /*   Light Weight Profiling */
>  XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
> +XEN_CPUFEATURE(TCE,           3*32+17) /*H  Translation Cache Extension support */

I'd suggest dropping the "support".  It doesn't add anything here.

~Andrew

