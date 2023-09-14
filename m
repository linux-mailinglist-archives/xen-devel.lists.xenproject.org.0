Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F27A06DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602295.938774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmyZ-0007ih-TZ; Thu, 14 Sep 2023 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602295.938774; Thu, 14 Sep 2023 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmyZ-0007ft-Qv; Thu, 14 Sep 2023 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 602295;
 Thu, 14 Sep 2023 14:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgmyX-0007fX-NS
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:05:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb206da0-5307-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:05:43 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-404732a0700so5843295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:05:43 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfe550000000b0031980294e9fsm1839303wrm.116.2023.09.14.07.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 07:05:42 -0700 (PDT)
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
X-Inumbo-ID: cb206da0-5307-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694700343; x=1695305143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4vYOPKXU60d+VwTOR7zcpHoS7EW3RwNwXYL0thebH04=;
        b=oVVw2puaY5GnvwQhao47kvVsHDHJ/70OWSP+/aKMQ82knHGL0tKeza9pXVA+8httkj
         bJQSWfBNiEJKCCheRBo6eAtdqqkxsgGmceMJb/FVwxczeORxb3Iqju+XQUXFf1lpgZk2
         D0U/6Xj57tn39UtjAJrS/zs5oAj/Ntesl2bdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694700343; x=1695305143;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vYOPKXU60d+VwTOR7zcpHoS7EW3RwNwXYL0thebH04=;
        b=d8uluYmUsp+bU49Zx7XnvmrPHVBRsaZmX3VZz2/aVoKO/TF1lXAiNmhmiF7JTOVOjK
         R192uj6QKxD0M+zctgfBh+WXEef1r1ctthT0T49f1DJsE3wDEzPPVtTWFoHrFAP2fquS
         iQdtYzNL1rJiu7bBabCibwMyuyByvA71IVhe9rnF2npqv39oS09ACsnE/WXbKKp3HeP5
         tO1Y4l6bywanSxe8aflvoTBWm8XQnaATiEWXwX8WSrfewfCDU6KB2sB/Y+2SPBKkU6Y5
         xjVOwguXg7r5QpB48teTu3BN6nr9ZKy8ifQpyz7pXTxieL2tCoP3jZLUGKNLEd5899dA
         Gg5w==
X-Gm-Message-State: AOJu0Ywgbm972oSbZqKofPQp+7gvnsVUit875KzRXEazVKbkib/hYYJO
	pK0m5rEZNkMqhYaz+2acVH7vZw==
X-Google-Smtp-Source: AGHT+IEyocHSn+uMmNECVz8ii8zQMuIDZmm28KTVIUinAogCrqYkG9ProhxotsEPQjJrSGm8ruhh3w==
X-Received: by 2002:a7b:c44b:0:b0:3f7:f2d0:b904 with SMTP id l11-20020a7bc44b000000b003f7f2d0b904mr4542256wmi.8.1694700342824;
        Thu, 14 Sep 2023 07:05:42 -0700 (PDT)
Message-ID: <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com>
Date: Thu, 14 Sep 2023 15:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
 jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
 jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
In-Reply-To: <20230914044805.301390-4-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 5:47 am, Xin Li wrote:
> Add an always inline API __wrmsrns() to embed the WRMSRNS instruction
> into the code.
>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> ---
>  arch/x86/include/asm/msr.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index 65ec1965cd28..c284ff9ebe67 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -97,6 +97,19 @@ static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
>  		     : : "c" (msr), "a"(low), "d" (high) : "memory");
>  }
>  
> +/*
> + * WRMSRNS behaves exactly like WRMSR with the only difference being
> + * that it is not a serializing instruction by default.
> + */
> +static __always_inline void __wrmsrns(u32 msr, u32 low, u32 high)
> +{
> +	/* Instruction opcode for WRMSRNS; supported in binutils >= 2.40. */
> +	asm volatile("1: .byte 0x0f,0x01,0xc6\n"
> +		     "2:\n"
> +		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
> +		     : : "c" (msr), "a"(low), "d" (high));
> +}
> +
>  #define native_rdmsr(msr, val1, val2)			\
>  do {							\
>  	u64 __val = __rdmsr((msr));			\
> @@ -297,6 +310,11 @@ do {							\
>  
>  #endif	/* !CONFIG_PARAVIRT_XXL */
>  
> +static __always_inline void wrmsrns(u32 msr, u64 val)
> +{
> +	__wrmsrns(msr, val, val >> 32);
> +}

This API works in terms of this series where every WRMSRNS is hidden
behind a FRED check, but it's an awkward interface to use anywhere else
in the kernel.

I fully understand that you expect all FRED capable systems to have
WRMSRNS, but it is not a hard requirement and you will end up with
simpler (and therefore better) logic by deleting the dependency.

As a "normal" user of the WRMSR APIs, the programmer only cares about:

1) wrmsr() -> needs to be serialising
2) wrmsr_ns() -> safe to be non-serialising


In Xen, I added something of the form:

/* Non-serialising WRMSR, when available.  Falls back to a serialising
WRMSR. */
static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
{
    /*
     * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
     * prefix to avoid a trailing NOP.
     */
    alternative_input(".byte 0x2e; wrmsr",
                      ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
                      "c" (msr), "a" (lo), "d" (hi));
}

and despite what Juergen said, I'm going to recommend that you do wire
this through the paravirt infrastructure, for the benefit of regular
users having a nice API, not because XenPV is expecting to do something
wildly different here.


I'd actually go as far as suggesting that you break patches 1-3 into
different series and e.g. update the regular context switch path to use
the WRMSRNS-falling-back-to-WRMSR helpers, just to get started.

~Andrew

