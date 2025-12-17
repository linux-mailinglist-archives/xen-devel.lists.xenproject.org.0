Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3FCC87DF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 16:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188856.1509889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtb1-0006Qo-2d; Wed, 17 Dec 2025 15:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188856.1509889; Wed, 17 Dec 2025 15:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtb0-0006N0-Ts; Wed, 17 Dec 2025 15:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1188856;
 Wed, 17 Dec 2025 15:37:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVtaz-0006KO-E8
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 15:37:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54db21ce-db5e-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 16:37:44 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b79e7112398so1147742666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 07:37:44 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7ff90481edsm468504566b.34.2025.12.17.07.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 07:37:43 -0800 (PST)
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
X-Inumbo-ID: 54db21ce-db5e-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765985864; x=1766590664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HckJ8z4ErRqks7W4b2m+C2DmrfPMINuN05vvWMpfNgg=;
        b=SWecz9mr6av526T6wmSx0z3HRtBXF9OFlkvOVDboNqqBdIL2Kl9JobzsUCmc3Ueyns
         iWKNJdoifK67s+xgB2Jpdtl9kwICL0Ip0egIWTWshbjbacAZ92UJa+bE7WTl4LAixrHU
         0GsKZN4/nHodz3TK9wu/7QU9ZX4EAhI1KDv6IztgE/3jpU4iuGxiW6aZglMVTDDfkKGE
         L1WSZ1hJPZUcH18u3xrHipeFYPxT5lmkbfVd4acbV9weewe0/Z0eMP5gewYJPVRJ2+b9
         iEVLxdo9Hzqv7FGzWFb564yByGYoA00fMfPyKm/2Q50nW1feXlkEFG1kW9BTNs23l7B2
         EOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985864; x=1766590664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HckJ8z4ErRqks7W4b2m+C2DmrfPMINuN05vvWMpfNgg=;
        b=vh8z/NZAPR+tUWe++gMdxy6BCrpkSn65pYeoIY5jxZ0rJm0S/uyTuAyke/e5pxiShj
         pgHpbh0FJnalzL0S/QGmH35lNmODI5wpI4vr0j6CyvHD5QBMS+9Um+EcZX0TT+m65t8v
         vTZ2PP3yp7GeTTE4NlRT7EG0f/mvl+qGoxRqknwrCRyPNWJ1Rd2uAokWS/KOpm2OvBNU
         e2Ojw20i65kRS9uH9MQARIsVCn2msSnV8OqtW29WsbZk48RpJN3Cpx6G6velK4ef2PqI
         8wdOnnj2F1NZHsZ+ZF8G+VHFq67q2iW4lUZ3vR0SR3hJWUV7o2ucShG264gb79ONAHJJ
         BMKw==
X-Forwarded-Encrypted: i=1; AJvYcCXCYJ/+a1BGyGlCi9J6BsPW3pww33ORBb8n+/n1H8GXRwN994tLyCoMnb6E1i6fitKgYugf5MV/x9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXql3m+DSQGm6C0CAfc2TBVuvcnMc5plsSZslsKtevsyf4hjNF
	t9zSjPDQzHz0qUhSR9AWFN5aQ6wMQiu2ZPofgE5lEpsdeI4hXUBrVLdu
X-Gm-Gg: AY/fxX5APdxmH1n7sIiGT8n1vaY33dbbwAOtz1FZANkLo0D8mx9y5bI/zbHdCPsauwv
	DGfqOiLtx8UnqQOMu6Qs07j4y8fCZFedbhmO011R70ucpSvEnuhBTUU4Y4ZErhEOFAWvCMSpUVF
	WNacyI9uuppADp5x3TAlXFnUoeHqFNuh8slq45mFCrm4dtRtaf+7royGg+705+jAZn039hHC06J
	VRV24NP7yTFNgME2RAHgDIYQOQWa8mNVvFwvRdy2Uv+pTKFicgHmdty+vRFAlcF6+GdeHk7wvAn
	OdfSbbY3hAf6Od4CVo7arqn561iJx8ENWrb87t+bxUkdgBW+vlQ+iCjTHT0D/OnaE8BVFtHAAU/
	hAmYh7HGdhxGC0KHINiN38/+QknIa/WbuGQ+tN0wcd6YpKpt303U10V7vBj107p2vadvKnv1BkU
	nxWbjmTMTpuvHTDX8fSiw7a2n8p4PygE9II6XBVWapzwOLx56/yqicN/5z3ARcsQZV3iRremoa3
	kc=
X-Google-Smtp-Source: AGHT+IGSdeISRy+HvZiudkm+cKzuNTH3tuGa1XGE6FDSUUUQhwJDL9iagHVO03MD4D3zaU79FF2IUg==
X-Received: by 2002:a17:907:db03:b0:b73:1634:6d71 with SMTP id a640c23a62f3a-b7d23693326mr1889704866b.26.1765985863641;
        Wed, 17 Dec 2025 07:37:43 -0800 (PST)
Message-ID: <7bec6dab-9776-4f94-b121-0be696be78d8@gmail.com>
Date: Wed, 17 Dec 2025 16:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move alloc/free_vcpu_struct() to common code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <5f75053750a9fca2b5fecf1dcf6f097b25e8f27f.1765967934.git.oleksii.kurochko@gmail.com>
 <8aee5daf-be3b-4f10-aa38-b8c1504ba0b4@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8aee5daf-be3b-4f10-aa38-b8c1504ba0b4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/17/25 12:46 PM, Andrew Cooper wrote:
> On 17/12/2025 10:53 am, Oleksii Kurochko wrote:
>> alloc_vcpu_struct() and free_vcpu_struct() contain little
>> architecture-specific logic and are suitable for sharing across
>> architectures. Move both helpers to common code.
>>
>> To support the remaining architectural differences, introduce
>> arch_vcpu_struct_memflags(), allowing architectures to override the
>> memory flags passed to alloc_xenheap_pages(). This is currently needed
>> by x86, which may require MEMF_bits(32) for HVM guests using shadow
>> paging.
> You lost the comment explaining the restriction.  This needs adding back.
>
>> Move the definition of MAX_PAGES_PER_VCPU to xen/domain.h and default
>> it to 1. Retain the ARM64 exception (with CONFIG_NEW_VGIC) where two
>> pages are required due to larger per-IRQ structures.
> CONFIG_NEW_VGIC is still off by default, unsupported, and has had no
> work on it since it's introduction in 2018.
>
> There are a lot of good reasons to enforce struct vcpu being a single
> page allocation, not least because an allocation can fail due to
> fragmentation despite there being enough free RAM.
>
> I would far rather that common code enforced it being page size, and
> NEW_VGIC gets deleted or adjusted to cope, than to make it this easy for
> architectures to shoot themselves in the foot.

I am not sure that everyone would agree to simply drop|NEW_VGIC|.

Based on the commit message ...:
     ARM: new VGIC: Allocate two pages for struct vcpu
     
     At the moment we allocate exactly one page for struct vcpu on ARM, also
     have a check in place to prevent it growing beyond 4KB.
     As the struct includes the state of all 32 private (per-VCPU) interrupts,
     we are at 3840 bytes on arm64 at the moment already. Growing the per-IRQ
     VGIC structure even slightly makes the VCPU quickly exceed the 4K limit.
     The new VGIC will need more space per virtual IRQ. I spent a few hours
     trying to trim this down, but couldn't get it below 4KB, even with the
     nasty hacks piling up to save some bytes here and there.
     It turns out that beyond efficiency, maybe, there is no real technical
     reason this struct has to fit in one page, so lifting the limit to two
     pages seems like the most pragmatic solution.
     Restrict the compilation error to compiling with the new VGIC and for
     ARM64 only.

... Given this, I initially thought it would be difficult to adjust.
However, it seems there might be enough to do the following ...:
@@ -238,7 +238,7 @@ struct arch_vcpu
      union gic_state_data gic;
      uint64_t lr_mask;
  
-    struct vgic_cpu vgic;
+    struct vgic_cpu *vgic;
  
      /* Timer registers  */
      register_t cntkctl;

... with|vgic| allocated in|vcpu_vgic_init()| and freed in|vcpu_vgic_free()|.

I only checked whether this is sufficient to build with ...:
    #if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
    -#define MAX_PAGES_PER_VCPU  2
    +#define MAX_PAGES_PER_VCPU  1
    #endif
   
   $ grep -nE "^(CONFIG_NEW_VGIC|CONFIG_ARM_64)=y" xen/.config
   13:CONFIG_ARM_64=y
   28:CONFIG_NEW_VGIC=y
... and it seems to work.

The question to the Arm maintainers is whether you would be fine with such a
solution.

~ Oleksii


>
>> The ARM implementation of alloc/free_vcpu_struct() is removed and
>> replaced by the common version. Stub implementations are also dropped
>> from PPC and RISC-V.
>>
>> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
>> common/domain.c, as they are no longer used outside common code.
>>
>> No functional changes.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>

