Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A994EA7B269
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 01:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937507.1338460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0U4V-0000wR-V0; Thu, 03 Apr 2025 23:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937507.1338460; Thu, 03 Apr 2025 23:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0U4V-0000tv-Rn; Thu, 03 Apr 2025 23:34:07 +0000
Received: by outflank-mailman (input) for mailman id 937507;
 Thu, 03 Apr 2025 23:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0U4U-0000tp-LK
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 23:34:06 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213080cb-10e4-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 01:34:04 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948021a45so13629365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 16:34:04 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b8ad6sm3015037f8f.56.2025.04.03.16.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 16:34:02 -0700 (PDT)
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
X-Inumbo-ID: 213080cb-10e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743723244; x=1744328044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pZhPqoScu5SMQXGF+Jvvt/YlCe12voqNnLYGfEPyy14=;
        b=M1m96zyrgD8YgFhXyBo5ey3XMoNqzv4ZFCZeQ0W+5ssGHuYxCcbjHwUOcg+K/xdLVk
         Mf1JjlxzP1ocrmlX8DKI2khNMHhX1FLaEpi3Zu6giP3Wj/yj9ah10QUke2FB7WHAZZtp
         YiquKNOJ1u94uLSw+cjuxAzqiZfi6AVWb7iv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723244; x=1744328044;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZhPqoScu5SMQXGF+Jvvt/YlCe12voqNnLYGfEPyy14=;
        b=FleAtleUBW6vP1AsKdjc4NLPerKz3/eFBMLxrLjgiRgTghafpoAHdWtmPQ4bopPoAE
         6LYvJWoT9XE149TF96/67ldkzJA0t7SvRMNyEBYJ8jqMb5SMNGqE3TsxIzkp3Efg9B5H
         trwyqD1rnUXu28toIAzGcZaEfYngRJ7jcvS9Pu99BNI8KChjws93QhVxIIy0yIeu5Kl/
         5PwOAjNIiUGv4yhu7PX5BBjjmCF/rBwZDeWUTWyZMJfuEw1ZnG+H1ajz0LKO4TJ78t7r
         GnKTAYtEhuO4BRLSfeNadqJt2Vv1SuIAOAPlW+CvaZTk+uBX4LMwrQnyCaOWFor+5cNu
         zTWw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWtzT7sGW7ti2ybh4Wd/njCDUnRp3CItGGHlvxaJZngDdEX8ye4mKSlqRD46cFg1C3wJm5hGwu7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUoCQu5cGxstB+pJtWrd1077uosV93lAI/LZHop1OFpiVQ+nEy
	prQrX62U19b4WiqgHMWudD/8gwq/7W08zQTq7YjZNJJfIa8WBYUQspcn9sus850=
X-Gm-Gg: ASbGncuoaBxL3wbHzG8CBe8mju5+jKFO5I0nGBCEveaeMzfMXEXq1/mVFLwCCzzY/OI
	q+/WIn3D3roLxHYYDuRi5d9s7ueERSNmV1pO/O5w3st1tm/nw99hbZFMnrp81TYVWsTUm/TYqxz
	y7qMk6vis6kRScCfaDv3mjn8gGGEbfxc5B2HGqoS7pzXFWRu//jTYdh57BAM6pxoEBOliV8jmC+
	gJHeuC84/0BZFu0RfGlrHRodPpobIMMOwgetVlJLLywPzepie/jh9Iy242T7OlgTlc8LrNVmX6T
	KnahVY5DhDPFjCsPc65yhfWCGWIAa5BC/fj4992BqQ4/LW4Zlf8c+nwo3mRQ/VpvoVY4IBUiDl4
	o88QXl8dyuQ==
X-Google-Smtp-Source: AGHT+IHeuKRlXTuz5Ym38+UEqRntwM55R2B74LCvz5EYZxB8KsQDSbaJNXYXchKHcM8d/Efb6Lk9tA==
X-Received: by 2002:a05:6000:18ac:b0:391:3406:b4e2 with SMTP id ffacd0b85a97d-39d14662dc1mr370650f8f.49.1743723243889;
        Thu, 03 Apr 2025 16:34:03 -0700 (PDT)
Message-ID: <9870999d-3a45-4c2b-a37b-2651e4d53c3b@citrix.com>
Date: Fri, 4 Apr 2025 00:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop XSAVEOPT and CLWB build flags
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: "Alexander M. Merritt" <alexander@edera.dev>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
 <c07ec835-3c69-4cf9-ba6a-39d6152393bf@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <c07ec835-3c69-4cf9-ba6a-39d6152393bf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 12:28 am, Andrew Cooper wrote:
> On 04/04/2025 12:22 am, Alexander M. Merritt wrote:
>> The new toolchain baseline knows both the XSAVEOPT and CLWB instructions.
> I know that's what I wrote on the ticket, but what I'd forgotten was
> that we only use XSAVEOPT for it's operand.
>
> Really what we're doing here is knowing CLWB, and also getting rid of
> the XSAVEOPT workaround for somewhat-more-old toolchains.
>
>> Resolves: https://gitlab.com/xen-project/xen/-/work_items/205
>> Signed-off-by: Alexander M. Merritt <alexander@edera.dev>
>> ---
>>  xen/arch/x86/arch.mk              |  2 --
>>  xen/arch/x86/flushtlb.c           | 28 +---------------------------
>>  xen/arch/x86/include/asm/system.h |  7 -------
>>  3 files changed, 1 insertion(+), 36 deletions(-)
>>
>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>> index 258e459bec..baa83418bc 100644
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -15,9 +15,7 @@ $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
>>  $(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
>>  $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
>>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>> -$(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>> -$(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
>>  $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
>>  $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
>>  $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
>> diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
>> index 65be0474a8..962bb87d69 100644
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -313,33 +313,7 @@ void cache_writeback(const void *addr, unsigned int size)
>>      clflush_size = current_cpu_data.x86_clflush_size ?: 16;
>>      addr -= (unsigned long)addr & (clflush_size - 1);
>>      for ( ; addr < end; addr += clflush_size )
>> -    {
>> -/*
>> - * The arguments to a macro must not include preprocessor directives. Doing so
>> - * results in undefined behavior, so we have to create some defines here in
>> - * order to avoid it.
>> - */
>> -#if defined(HAVE_AS_CLWB)
>> -# define CLWB_ENCODING "clwb %[p]"
>> -#elif defined(HAVE_AS_XSAVEOPT)
>> -# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
>> -#else
>> -# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
>> -#endif
>> -
>> -#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
>> -#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
>> -# define INPUT BASE_INPUT
>> -#else
>> -# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
>> -#endif
>> -
>> -        asm volatile (CLWB_ENCODING :: INPUT(addr));
>> -
>> -#undef INPUT
>> -#undef BASE_INPUT
>> -#undef CLWB_ENCODING
>> -    }
>> +        asm volatile ("clwb %[p]" :: [p] "m" (*(const char *)(addr)));
> One minor note about whitespace.  We typically have spaces inside the
> outermost brackets on asm statements, as per the clwb() example below.
>
> Also, given the expression is so simple, I'd just use %0 and drop the
> [p].  It's just line-verbosity here.
>
> Can fix both on commit if you're happy.
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Also, I forgot to write in the ticket, clflushopt wants similar
treatment, even if there isn't an outward define for it.  I think the
following two hunks should do:

~Andrew

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 18748b2bc805..ef30ef546336 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -287,7 +287,7 @@ void cache_flush(const void *addr, unsigned int size)
          * of letting the alternative framework fill the gap by
appending nops.
          */
         alternative_io("ds; clflush %[p]",
-                       "data16 clflush %[p]", /* clflushopt */
+                       "clflushopt %[p]",
                        X86_FEATURE_CLFLUSHOPT,
                        /* no outputs */,
                        [p] "m" (*(const char *)(addr)));
diff --git a/xen/arch/x86/include/asm/system.h
b/xen/arch/x86/include/asm/system.h
index 73cb16ca68d6..6f5b6d502911 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -23,7 +23,7 @@ static inline void clflush(const void *p)
 
 static inline void clflushopt(const void *p)
 {
-    asm volatile ( "data16 clflush %0" :: "m" (*(const char *)p) );
+    asm volatile ( "clflushopt %0" :: "m" (*(const char *)p) );
 }
 
 static inline void clwb(const void *p)


