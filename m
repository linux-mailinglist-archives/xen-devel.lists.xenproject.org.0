Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA16B2A079
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085990.1444236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny88-0002lz-Kj; Mon, 18 Aug 2025 11:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085990.1444236; Mon, 18 Aug 2025 11:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uny88-0002jR-Hf; Mon, 18 Aug 2025 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1085990;
 Mon, 18 Aug 2025 11:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLF1=26=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uny87-0002jL-Pc
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:34:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495ca0f2-7c27-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:34:22 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so18942735e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:34:22 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6d89b9sm178054575e9.12.2025.08.18.04.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:34:20 -0700 (PDT)
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
X-Inumbo-ID: 495ca0f2-7c27-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755516862; x=1756121662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6vCaLmNz9+UO5Qx4SPmdQn+wAOeMPN1Ed6InYeDMSaA=;
        b=v6/QW1w/az4lVB+gMZdYfTMQnS/JVLz38wBNqYfvdAQbHYY6n6zPokJWy51p8/ekIK
         9+siB3I0zzN3nzDDRhJnmJjsM0rp+KJlZAdmK1d5k189SpslWK8xVS85UYCEX5ysfSFE
         lUuYEGNS51OMFIsw2j4IZU/eq5KvsAcOlmfDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516862; x=1756121662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vCaLmNz9+UO5Qx4SPmdQn+wAOeMPN1Ed6InYeDMSaA=;
        b=MyIMToCvSdbtWI3307RbcJNy16Jw5lI9/DUsjfLmPrnle2kgJzxWbb+VNWfQeGMgMm
         ysB+yZfp1snZVmqfXeihv25ONTBUPStX2mgZ8yqh404ujJ11D3bK6w5fruG+KTZJ49zG
         BOk2XVOOzjhlT4zngv+cn3cdNm4VkDaJ2F2lol52lB20+IO1t+jBMqY08A2Ep8U6BHf8
         GQnrn7lp36kLN+41A/wXvqCCbwXqAFLGbbRIved34WaOR6dmhmIkUzIiQnBIc1P938M2
         qQkit/ctTzcCeBgf06X+qgSmL/5ptEk8t/VAdFOKAiRWlTTMy4VVpCW3EC5mb+QvlBUd
         JcsA==
X-Gm-Message-State: AOJu0YzKQnxWMast/b9dgOk/QFg/XXUaIxR7riSXWnw02Tvo7DMQUv+q
	xy1jcDuNmkyR/M94KFZLvgJCkcA/71rOsN+GqoqhgMGdMUQT50+M13jDOu2fr1Rbg1/qCXE8ujt
	6O37U
X-Gm-Gg: ASbGncuCVV/5kAXLtx6f42gIRrkwPIArUCPCrGLm6nHY3DBRb+WjH42DhZ5YJ91/p5O
	izuVgV4ZuMRXWwkQ/I9fXWbBdgxuIPeD2KwsvRgtpaJ7DG8YBvtejNOUn9Nz2DefN9EQwsSCI9T
	5EMtLYPDaOmI+7ke3kfW6NyCiIu91owgnpof8/8LU0wxceqWAi5yAhyRt06tjwkVwjyHjy8Xrlu
	kcMHyXvih9Ezg0menHiifaPFCPv/EgrigqZ7/+XrqTm4y9a0cLa8Dl2nGelDwZUndckizTCBLqc
	z3gBtyFxAoU0IWeWuGGGE3BONdMC8kpUiSc+RFMM7tfsIIMqeFKpdEl1hFk+7WgTFG8tXVLfdox
	7zeNP4e8mhxAsuzqTSPyUVPYU9Ft34QneTJRYZ2NJcrS4z3+RIQfdkQXrXmqCpMbh5AuV
X-Google-Smtp-Source: AGHT+IGE2g5baiho1qnB3timfn15519c1j3lKW5Nz5zJyQDJ0zBmfagu8YqwacrLOFHb6Ir8e28y2w==
X-Received: by 2002:a05:600c:138f:b0:459:db71:74d7 with SMTP id 5b1f17b1804b1-45a26795f2bmr58332385e9.27.1755516861730;
        Mon, 18 Aug 2025 04:34:21 -0700 (PDT)
Message-ID: <356c3daa-f532-4450-a634-3ecfbdedff91@citrix.com>
Date: Mon, 18 Aug 2025 12:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] x86/msr: Change rdmsr() to have normal API
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-12-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20250815204117.3312742-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 9:41 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 530b9eb39abc..9c6b8c291d6e 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -329,6 +329,7 @@ static inline u32 phys_pkg_id(u32 cpuid_apic, int index_msb)
>  void __init early_cpu_init(bool verbose)
>  {
>  	struct cpuinfo_x86 *c = &boot_cpu_data;
> +	uint64_t val;
>  	u32 eax, ebx, ecx, edx;
>  
>  	c->x86_cache_alignment = 32;
> @@ -412,10 +413,11 @@ void __init early_cpu_init(bool verbose)
>  			    &c->x86_capability[FEATURESET_7c0],
>  			    &c->x86_capability[FEATURESET_7d0]);
>  
> -		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
> -			rdmsr(MSR_ARCH_CAPABILITIES,
> -			      c->x86_capability[FEATURESET_m10Al],
> -			      c->x86_capability[FEATURESET_m10Ah]);
> +		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
> +			val = rdmsr(MSR_ARCH_CAPABILITIES);
> +			c->x86_capability[FEATURESET_m10Al] = val;
> +			c->x86_capability[FEATURESET_m10Al] = val >> 32;

This is a typo.  Fixed locally.

~Andrew

