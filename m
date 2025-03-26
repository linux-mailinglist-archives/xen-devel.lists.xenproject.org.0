Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5001BA717E8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927824.1330580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRF7-0002if-Qv; Wed, 26 Mar 2025 13:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927824.1330580; Wed, 26 Mar 2025 13:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRF7-0002gc-O4; Wed, 26 Mar 2025 13:56:29 +0000
Received: by outflank-mailman (input) for mailman id 927824;
 Wed, 26 Mar 2025 13:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txRF6-0002gW-9F
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 13:56:28 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c69f79d-0a4a-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 14:56:27 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so3661897f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 06:56:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957d9sm16827029f8f.9.2025.03.26.06.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:56:26 -0700 (PDT)
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
X-Inumbo-ID: 1c69f79d-0a4a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742997386; x=1743602186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hTAURXrIYg+pgGyFJqihA3P7qspP6ZkkzTE7cCePTXQ=;
        b=AuIeic4vucGd3/8/FIZGb88Y8AgccTuhlhI06kDzHk1p0bz2/+Jo3TIAsluoOC9c0q
         ndUzNqtkpQ6gMfQAHkruV7FLsZix3PZPuhzCJMunFL9yEWZ+gqR8HgEOIS85aUIV/CoZ
         JtE3wt70BESt8qjELMDxYqNsHFt+AeVYRUxvHdPF48TeddIXEDixjlTjce9bsyGdD0XF
         xqCIW6uuMoIfQbao19vHnZNQ23WCVbeYpASDS2zFztzSGU8N7R0LzJMxxxuDgkLfVXRj
         m1GQqrilB51Ia4MfxLoRVTgLZDqKgNt61JxKafnBG2JTiB/7HsgNl2Kb19948L65uT0s
         0CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997386; x=1743602186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTAURXrIYg+pgGyFJqihA3P7qspP6ZkkzTE7cCePTXQ=;
        b=W0k8/9+IioSYOrab0C6EYZ6ucYiIDkkOMphWvjcCSpfiQl0ktq5ycQ9/yyJ99jzV/n
         fgvNXYTwXc+aWfTdVXbwdJVWNVPRIzEhFJRM8Ei8SDLybF2H9jTkZqSB0AjXkhx8jrPk
         kw0R2oLSBDe2KKw3SQGy+fVKF8og2X5W2NZRvPAqUQL8A+oHagcEwcXXgf/bHH4bHMWA
         7BJlMMYH2NqKFDjEbKt4D95XDuEQ7adb9/1h8ijAH29G2VaD4q+TYQS77VtFPc9ko3ZB
         M9XQT5ifC149eSm8VAqIq9ck+nc7lAgbrYwbxA/oHlLkps557p1BjllWezUjRjTZYW0V
         fAFw==
X-Forwarded-Encrypted: i=1; AJvYcCXA97v06ZS4lDDo62f4GKntOE/+PXBZEuO7FhAMJDOxL5LoooyMi2CQBAJewXhPm9z/FThBAoeRNP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh4NuPWUkErQ85RxJ3ABTsaw2mH5BqaKDZ0JpcQjvQk+9MkAaM
	b2R0Gj1CUQBgcHeXBG6GBSZ1Z7SAJl4PU+JIfBTKy9JvhOieZK+6quEUdt4rdw==
X-Gm-Gg: ASbGncubRRwzjrEtc5pGLjf4T0TmRJkSwa2fMLzjqctffGgR9FG27tbkpHPzh6Qv42Q
	2tdACKVLOvY0+IaYAFjFwCSYWPc4+hw+LlpCQLZ6fWlvVsuYjA7DoMZ9v8KwKCqt/gWHvK8O4iZ
	WmUDbTkP7isz3wSjAsJrwxxMLmYE5pX1w+E6L2/WPgHx7Xcr/wD05FkjNDlOn3ofgLIburl30vA
	Hej5dUBcg0Dji/nqO8G0glvdld3ZH3D2THJN5UaSKC+ncpS2M+Yw2OduOuk8HhTtRyF/0FFECpM
	uq7JTqpAhpJfyeA6aPn1drGvae3AYiCbye5BKGmBklAnIfK93AKp0gMAGfaTS6t7g3LkkvWzOpt
	xFISc3NQuAnv3+Zvz5nDbpCTZSkqzEg==
X-Google-Smtp-Source: AGHT+IGWAcxGjJbRNF/SDlmTINXHnUjzL5WcQ2tFsgybH+4iuH+O54LdwIKfjlhYtBEf2cddqRJZ8A==
X-Received: by 2002:a05:6000:4012:b0:391:4674:b10f with SMTP id ffacd0b85a97d-3997f92d312mr17335151f8f.36.1742997386433;
        Wed, 26 Mar 2025 06:56:26 -0700 (PDT)
Message-ID: <141c8421-77fb-45fa-a892-94713c74113d@suse.com>
Date: Wed, 26 Mar 2025 14:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] xen/domain: introduce domid_alloc()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-5-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250318233617.849903-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2367,8 +2367,15 @@ void __init create_dom0(void)
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>      };
>      unsigned int flags = CDF_privileged;
> +    domid_t domid;
>      int rc;
>  
> +    rc = domid_alloc(get_initial_domain_id());
> +    if ( rc < 0 )
> +        panic("Cannot use domain ID %d (rc = %d)\n",
> +              get_initial_domain_id(), rc);
> +    domid = rc;
> +
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>      dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>      dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
> @@ -2391,19 +2398,21 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |= CDF_directmap;
>  
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    dom0 = domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));
>  
>      if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
> +        panic("Error initializing LLC coloring for domain %d (rc = %d)\n",
> +              domid, rc);
>  
>      if ( alloc_dom0_vcpu0(dom0) == NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating domain %d vcpu0\n", domid);
>  
>      rc = construct_dom0(dom0);
>      if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
> +        panic("Could not set up guest OS for domain %d (rc = %d)\n",
> +              domid, rc);
>  }

Assuming we really needed this new function, why would there be an Arm side
change to Dom0 creation, but no equivalent change on the x86 side?

Jan

