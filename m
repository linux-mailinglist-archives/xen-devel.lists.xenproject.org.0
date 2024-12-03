Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E889E15D7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847434.1262521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOKY-0007qG-Ne; Tue, 03 Dec 2024 08:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847434.1262521; Tue, 03 Dec 2024 08:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOKY-0007oJ-KN; Tue, 03 Dec 2024 08:32:26 +0000
Received: by outflank-mailman (input) for mailman id 847434;
 Tue, 03 Dec 2024 08:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=On7Z=S4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIOKX-0007oD-4B
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:32:25 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eaedcfc-b151-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:32:23 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa53a971480so782806966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 00:32:24 -0800 (PST)
Received: from [192.168.86.29] ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599908be5sm587424566b.140.2024.12.03.00.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 00:32:23 -0800 (PST)
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
X-Inumbo-ID: 1eaedcfc-b151-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733214743; x=1733819543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5dk7L1AB/1OawhJt16KYVFGRl5D8ofJSiY5t4igpxCw=;
        b=SdRnf5s+ap5PoTh51TIHYAL3d2voSElFEYsOBMLwOqFxbiBlD7k80flq40ch1Gzdo7
         s97rqrfPRkBI4DXFV+pE6fCAewvpG87+g1eYo929MYjjlAc4PaEQHNkQdyTujf4qtIOK
         NOr7HtHfLaH5yhpjRxidH9ygY0KF/9xE6+lqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733214743; x=1733819543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dk7L1AB/1OawhJt16KYVFGRl5D8ofJSiY5t4igpxCw=;
        b=DSbhs+5p5AHFX6A/4pKXZ4rkbyxFmqSkV633hM0N8ThWVemWW5dM8sDwNTBb9bQA7j
         eFrOyB/IWazWUUNNm7weNorAGi0h2O0YspHgeyLFnk/2fHeQto71FeixguFAOAgowMEb
         BHZ9Kfppi6Jt6DWhOCGXy5lAJt/mXD9oQzr92lJF0fHUDzFlVuiviu5c4VZ4iZwhg4J7
         OTdiajXJsaVMVIZz8jHnrJOGYxkjbFmt8lPH39Gc600Ui+6KZZl/MaECJ7k4p8z8SIav
         z17F/ouxdoGZZ4r2P1IavRGDl5TQ8DMscgp0bVBX1xPfwSa/itHHOXWQ7aa+hJAJvold
         z74Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXUsCOAC6CxVnE40Kkk/dHTKkICgDwwjB6XIl76Dc4hpPBCA8wRPG6DxUhsSL+TuokQ3ULTjLThPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzSRZ9SUgyRJWiR0VH72y2zLazjfCYm7IeqcQ/Kb8C1WvokZ0Q
	JgckSW0YMX13pAe1QzwhfuPbJUe6O4xwyTRawFpOTWPwSYNPiwLtLRH5mTI6nL4=
X-Gm-Gg: ASbGncvLJaFS5MbChpJucAcJTqFMvTcI6611vrtf9lhuso4UBsqlm7I6zba5hOh2YtY
	8wl7UJo9OzCmWUb6l8hUBfraL6xY6ihBA3v3UvsiHPTkkIeGwpsTMq4yvnvJ3v9xq0dgTorS4CE
	lPghUIJ07xQEr7P/Bu41JuDxiwR0veAmfMoQIBDeuBzSLr9wMj/2qrU0Do+dxgvFhPu2Rx37U3o
	LzTTUfarobmw0ZaD0INGBMKlNNjX+J5cfo2bL+Hjnc4HVATmFxeb9N25nBVA0A=
X-Google-Smtp-Source: AGHT+IELCOvDrv+Ho44zAn5o8KCGBM6fqjdabvtg/iWF5vV9/xb7m71gInBVAEjztX3zCzj0M0ENBQ==
X-Received: by 2002:a17:906:30cf:b0:aa5:274b:60e4 with SMTP id a640c23a62f3a-aa5f7d9558cmr124047966b.29.1733214743569;
        Tue, 03 Dec 2024 00:32:23 -0800 (PST)
Message-ID: <99fb0003-8ad6-403a-9340-40d9dc322429@citrix.com>
Date: Tue, 3 Dec 2024 08:32:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] xen/x86: add CPPC feature flag for AMD
 processors
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-2-Penny.Zheng@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241203081111.463400-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 8:11 am, Penny Zheng wrote:
> Add Collaborative Processor Performance Control feature flag for
> AMD processors.
>
> amd-pstate is the AMD CPU performance scaling driver that
> introduces a new CPU frequency control mechanism on modern AMD
> APU and CPU series.
> There are two types of hardware implementations: "Full MSR Support"
> and "Shared Memory Support".
>
> Right now, xen will only implement "Full MSR Support", and this new
> feature flag indicates whether processor has this feature or not.

Do you have a reference to where this is documented?

>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/arch/x86/include/asm/cpufeature.h       | 1 +
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
> index 3a06b6f297..6935703e71 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -170,6 +170,7 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_amd_ssbd        boot_cpu_has(X86_FEATURE_AMD_SSBD)
>  #define cpu_has_virt_ssbd       boot_cpu_has(X86_FEATURE_VIRT_SSBD)
>  #define cpu_has_ssb_no          boot_cpu_has(X86_FEATURE_SSB_NO)
> +#define cpu_has_cppc            boot_cpu_has(X86_FEATURE_CPPC)
>  #define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTO_IBRS)
>  
>  /* CPUID level 0x00000007:0.edx */
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 8fa3fb711a..15f707639b 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -265,6 +265,7 @@ XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number
>  XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
>  XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
>  XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
> +XEN_CPUFEATURE(CPPC,          8*32+27) /*A  Collaborative Processor Performance Control */

There needs to be no "A" in this patch, because it's certainly not ready
to advertise to guests yet.

If you're intending it for eventual use by guests, then the "A" only
goes back in at the end of the series when the support to correctly
virtualise it appears, but it looks like it will be Xen-only.

~Andrew

