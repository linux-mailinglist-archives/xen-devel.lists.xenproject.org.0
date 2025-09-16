Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA8B59A49
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 16:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124706.1466952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWlO-00086C-JF; Tue, 16 Sep 2025 14:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124706.1466952; Tue, 16 Sep 2025 14:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWlO-000844-Gi; Tue, 16 Sep 2025 14:34:34 +0000
Received: by outflank-mailman (input) for mailman id 1124706;
 Tue, 16 Sep 2025 14:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyWlN-00083y-8H
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 14:34:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f4891f-930a-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 16:34:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45f29dd8490so26383925e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 07:34:31 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-267b0bbabe6sm39874955ad.107.2025.09.16.07.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 07:34:30 -0700 (PDT)
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
X-Inumbo-ID: 41f4891f-930a-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758033271; x=1758638071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpH/rE8zcXN2ig4ftQNEaMDs8lFxshbqYSLJz+hrQQc=;
        b=XAWjouNcS8RLmrJnPNAQLHIsZER5NGZJOpmK3WfBpxmuLZ2Vavvr2N+97wW+4M2k/e
         1668Dg5hsacSvpEgFQtV2GLWeiT0VnwqVLoPdu2xgGUliYx0mFFtfqFMTJOAyKk1hvvX
         JyVmtRyAKIHxlgYOLLcNi/VVT+2cCXFNmGSP9OmvmPbtt/47FVQV8VtNbG37pXzFn50+
         8b+EjV7EW7wfJKLZVAeoms6aAS78zUR4nho9E7d6LR46IOuCzSH7zLBDHlWt17qslXBV
         /CzH2X0XT5WA0nwLsIcC04P1wCq96fI7hJ/QOw6d9aJZ71CBzDTuKMGVZJ7VswD6DrLg
         sTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758033271; x=1758638071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpH/rE8zcXN2ig4ftQNEaMDs8lFxshbqYSLJz+hrQQc=;
        b=u5Q69KDJHrbTz4Od1V1586aBgEkfoxnkB5C32QiuEOuetVei2tBhLcc0mo09No1iY2
         msR33TJj7m2BlIPaFDy8Z1zMzsZKIiGI4YSq4+MI+j+P3BxX9WNh/dbjwORbovHtfWZn
         dTvpGDGzcupAefXy+Wb52Dz5hk5H9zMMF7gHX7awWV6u95IDqfauJZCQB+tzGQaqdph1
         r33we9A7iqFx/EDadiWakt6hGnH+418KC8NcHZN7xT3SJNY6yzTWqTalC5jKAj+6vZWO
         zdNj+gJdqPhQ8g15Voj7uA64DZOF6fgslir9sEgOTe+GelHYvlpl9oc0M+yVSvL8vd86
         UfOA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJeS3B0uplJoXjsV3KomrNK/C03EXUQqgXb+SQok54N2I2ubpkV896qbQ2tm+luAulViyw4cOx6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9ahfaF7QVDd1iTSKtc8LQxA3t6Ai6fTYZVwY0fEqBfOlNLJ3i
	M+xGRw+SCh1vasG8SL/+yNLoUVyBRVM0PreWrGJMlaqw/52fLw0Y87CFe/OYimrt+w==
X-Gm-Gg: ASbGncsUaryE1S8PGYbiZQN9iBI6teQP4SF8LQHIJ4Zx1/Qc/LR2G3yr46kwUmEoVVo
	obQrCmX7ywHzVNdYIsGMA+kctLxDSjQWFcEcHEHpt14F0jQBY6BsSTHdG2H5FAAJXTtBs3pD1Dc
	Aj/QFU5857cNGIywW60OuHlO+6OBX6GBDj0O2t+QCtY/7/BVSb1IMzdOxCLchZGEzs2KN+yP759
	uCW0YXRtnfFXYH4dm8pR3084OL45MixDg9wI+JRbUrZFojLkpK68K1HjnlXw6YN2llPL1IocNqP
	UAQ1Gf15Dmpty58nDxg7NYqNPZv1Z/D/+kT1sMWhK1K85hQSGSvyGfh8WA1/WqVpWFvnzEBtG0M
	WRaG/EgEQHNBbyAD1MUv+hVtEKuiCZr8=
X-Google-Smtp-Source: AGHT+IGX0J2hSiBNJPvcdSdZRPpeHnaf9gwVgsDqWqEp3Coz6yA5oObsjz48XAQieSOyYJtAX6FFsw==
X-Received: by 2002:a05:6000:2283:b0:3e7:6196:fdf2 with SMTP id ffacd0b85a97d-3e765a0981amr12523016f8f.47.1758033270809;
        Tue, 16 Sep 2025 07:34:30 -0700 (PDT)
Message-ID: <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
Date: Tue, 16 Sep 2025 16:34:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250916103251.2144449-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 12:32, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
> HVM Intel VT-x support can be gracefully disabled, but it still keeps VMX
> code partially built-in, because HVM code uses mix of:
> 
>  - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
>  - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg
> 
> for runtime VMX availability checking. As result compiler DCE can't remove
> all, unreachable VMX code.
> 
> Fix it by sticking to "cpu_has_vmx" macro usage only which is updated to
> account CONFIG_INTEL_VMX cfg.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Hi
> 
> It could be good to have it in 4.21, so vmx/svm disabling
> option will be in complete state within 4.21 version.

Imo this isn't release critical and has come too late. It's of course
Oleksii's call in the end.

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>  #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>  #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
> +#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
> +                                 boot_cpu_has(X86_FEATURE_VMX))

I'm pretty sure using_vmx() was introduced precisely to avoid the use of
IS_ENABLED() here. What is completely missing from the description is a
discussion of the effect of this change on pre-existing uses of the
macro. ISTR there being at least one instance which would break with
that change. And no, I'm not looking forward to digging that out again,
when I already did at the time the using_vmx() was suggested and then
implemented. (I can't exclude it was the SVM counterpart; we want to
keep both in sync in any event, imo.)

Jan

