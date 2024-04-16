Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C248A6C3C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 15:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706963.1104391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwipZ-0000Ix-60; Tue, 16 Apr 2024 13:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706963.1104391; Tue, 16 Apr 2024 13:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwipZ-0000HM-2a; Tue, 16 Apr 2024 13:26:37 +0000
Received: by outflank-mailman (input) for mailman id 706963;
 Tue, 16 Apr 2024 13:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYTd=LV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwipY-0000HG-9a
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 13:26:36 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1d21af3-fbf4-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 15:26:35 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-78ecacab93bso387092485a.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 06:26:35 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vv10-20020a05620a562a00b0078d6c4b0b3bsm7567665qkn.26.2024.04.16.06.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 06:26:33 -0700 (PDT)
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
X-Inumbo-ID: f1d21af3-fbf4-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713273994; x=1713878794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dfTilTUZYTUJNw0Z8dLBhB4zRThATqAWOOkGBPtcBww=;
        b=DJmg0YDrfsuMua9TPXLqe2b8jZYjbbsSia474Szh63GfXUS27fSge8W/Ta8GBh14Rf
         Q//2pfR4lIgqVBQD6Mdv3CS5c+tph0vg2uckkUPiZHN6eSxlMs6qXuN+kslVhlO7Wyzo
         4+j6GhwMhXud9OkxMx9VFoq9H9TdQMeLuvhcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713273994; x=1713878794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfTilTUZYTUJNw0Z8dLBhB4zRThATqAWOOkGBPtcBww=;
        b=mxSjiEzdaUzuFKOIgtnCrOU4GT4szSefYgvywBdUXMSAhPxWw2kfjp5FYc+9eHZH6P
         yDOSUf8hnWlaPwLx58gxiu7uMRSKKOoRJmPOmPaoE+6RPwEZX6FsQxyPvY5TMep3l7KW
         08XIKF5zBnNsJPIGAQNdmyvYWATHoG2A3pKNgG35fvpbyI0qTy1SNbXRR5EijNrUkDbH
         qg+j7lTfwZ/0zPakrZZrM9dngsFsDQ+sSsTh36iB20Sw8YzgRWnS64+8m7UgsnuPU9hg
         1gK6SYQcTHdsGs9QEMLsgByCJkSrlePCCLuk4CxLWVPVt5pC5RG2PqBHSSuCMPKq4qBD
         E4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWtWmDe2G9hkb0nh8Cf26kGrQUw1foeRhAtVYPYIE9d93RI5QZnDQTnbTi9RuZ5ru1Jzx3rpiPA7r/diW7dmLxSSMi3B8Rs+Q4zFGq44uE=
X-Gm-Message-State: AOJu0YwmgA3GaLKObZ4YCVyK7XDDQ4WAB4MnuWSxms+j9iT7le/xDp+x
	+da3WLHzVq6oE0AmzDDUZO8Dyf/sMmGSve2aU6OUWoJUVGQMx3bOocS2HYxfPbI=
X-Google-Smtp-Source: AGHT+IFLYRds+ATwIc0DkLopLz7zWPGg12iJtKzl9Km1JB1ZQ0wdzLW+Ir33OrC6DhWy0EO0+Ld6mA==
X-Received: by 2002:a37:e20b:0:b0:78d:74ed:ae90 with SMTP id g11-20020a37e20b000000b0078d74edae90mr13538346qki.26.1713273993797;
        Tue, 16 Apr 2024 06:26:33 -0700 (PDT)
Message-ID: <fb54fefb-404f-43a4-aea9-28649927c353@citrix.com>
Date: Tue, 16 Apr 2024 14:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 13/15] x86: wire cpu_has_{svm/vmx}_* to false when
 svm/vmx not enabled
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/04/2024 7:46 am, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>
> To be able to use cpu_has_{svm/vmx}_* macros in common code without enclosing
> them inside #ifdef guards when the respective virtualization technology is
> not enabled, define corresponding helper routines as false when not applicable.
>
> No functional change intended.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/include/asm/hvm/svm/svm.h  | 8 ++++++++
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 7 +++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
> index 4eeeb25da9..7e8cdb4a27 100644
> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -38,10 +38,18 @@ extern u32 svm_feature_flags;
>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>  
> +#ifdef CONFIG_SVM
>  static inline bool cpu_has_svm_feature(unsigned int feat)
>  {
>      return svm_feature_flags & (1u << feat);
>  }
> +#else
> +static inline bool cpu_has_svm_feature(unsigned int feat)
> +{
> +    return false;
> +}
> +#endif
> +
>  #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
>  #define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
>  #define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> index fd197e2603..2d927d3100 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -287,10 +287,17 @@ extern uint64_t vmx_tertiary_exec_control;
>  #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
>  extern u64 vmx_ept_vpid_cap;
>  
> +#ifdef CONFIG_VMX
>  static inline bool vmx_ctrl_has_feature(uint64_t control, unsigned long feature)
>  {
>      return control & feature;
>  }
> +#else
> +static inline bool vmx_ctrl_has_feature(uint64_t control, unsigned long feature)
> +{
> +    return false;
> +}
> +#endif
>  
>  #define VMX_MISC_ACTIVITY_MASK                  0x000001c0
>  #define VMX_MISC_PROC_TRACE                     0x00004000

I'm afraid this is going in an unhelpful direction.  We want to move
both of these files to be local to arch/x86/hvm/{vmx,svm}/.

cpu_has_svm_* isn't actually used outside of svm/; only the plain
SVM_FEATURE_* constants are, and that's only because they're not
expressed as plain cpu features yet.

cpu_has_vmx_* has a few more users, but most are unlikely to remain in
this form.  One critical set of changes to fix vulnerabilities in
nested-virt is to make almost of of these decisions based on per-domain
state, not host state.  The aspects which are host state should be in
regular cpu features.

I already volunteered to sort out the SEV feature leaf properly, and I
was going to do the SVM leaf while I was at it.  If you can wait a few
days, I might be able to make half of this problem disappear.

~Andrew

