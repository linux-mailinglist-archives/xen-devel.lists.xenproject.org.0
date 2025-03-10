Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1EA5914F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 11:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906403.1313854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traVE-0001FP-Jw; Mon, 10 Mar 2025 10:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906403.1313854; Mon, 10 Mar 2025 10:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traVE-0001D6-H6; Mon, 10 Mar 2025 10:36:56 +0000
Received: by outflank-mailman (input) for mailman id 906403;
 Mon, 10 Mar 2025 10:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1traVD-0001D0-8L
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 10:36:55 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94cb25c5-fd9b-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 11:36:53 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so745949f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 03:36:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba87csm14800007f8f.17.2025.03.10.03.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:36:52 -0700 (PDT)
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
X-Inumbo-ID: 94cb25c5-fd9b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741603012; x=1742207812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xxruKh367t5nmxEuw1EmnVaO6W08iJH00rfq67GMJVY=;
        b=AxVvAfIUL6ESgOcoedCVyYtSVPfN96UZ2DUrHp1By2EQ1A6FuijfnnM2EKtZnSoTpr
         zWXos9RYuQpMrBYVev/XFlpaktP3XdT1zfEH4QdqW373vSOyLEcN7vcj6Y84BdBhDi5j
         8nhTloa5qJ1/n4VteofczXV4eed6Ou4Nv4V+V4L4DWivygvrJtit0RnTqbGLpNTy00s4
         H392OWhJmrRosgnxwVAVnUhB5nQAo5cbnsZFXSEnp65r8fm5sGTNgQQj7Gxv/Nz2Ga9P
         h/x2bMQ4V0FpbKKYAHRBE3MozplFSgMa5E6joBpf3wuoQoivldLwdQi61nECHY/4Q2gy
         nu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603012; x=1742207812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxruKh367t5nmxEuw1EmnVaO6W08iJH00rfq67GMJVY=;
        b=lmVNL2Y3zLpFODcIIaQpxZVTB1HtVzHzwT2n5GGZH+LtwG8LhgPz/S5z05W9WbFZV7
         lGD9w8iwHRwiWfxUOrT3NJkeUSyZABgF4LNeRX34Xm3UTGW5GPq7Vak/qvCwMtBfuUlo
         LNiz5Z0mVvB/4j4JEDysCgRF4oPt29yWWUA7TIsOZJ2lh9pg6wG3OIRrHJyONAKvM5OJ
         OaaYXFbJcsetyAzHdbJEHvap1Pf29rtFigWfV8kAD+mGU73kUTY96BfUK1G4adm7XKfO
         oKdrN7MvQ1kmGUarVVnRe0tJtcxS2VTNmm9b/1MjhgtziEX2U9ENVWBF0psM2BXODFrA
         8YuA==
X-Forwarded-Encrypted: i=1; AJvYcCXQsAr32qjLHzDaaSgePywy/fqcskHQEYVoggOilapFymZLcByjklzOxOFsTsN9UUclGZE/sTH6yTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF78a0dny1DF5Jg2+ew1JTjr6EgeKyzo89UJAZaDmwGanZSRd7
	eJyMFnuuipEe4ExYnOOTQHopheZL2SLx2+/b7Y7XthGQ+Vs5lJKWDo1z6ka95A==
X-Gm-Gg: ASbGncvaMecp4mJ5v9iH9UGcvyZd3ULycc6SCgcGXQKUprsX5QVdrDHDzhifejCzfF3
	KTy8GrfeIpdAN3GsSl+BgfwdpnuAaE5TScVv9IpkXpwPdJxmgtCRBkactCqWx10cvM4DgSALmSZ
	24Kz9ICvXYnbBdiNHKorlQQ8z+pZo1H5p2K9JAhH/qRQlZpjT1ig7GTb6QrDivGpm5pjj1EwCQt
	7KIiygR942f87pjqkGbLOTCU0obtoVYtxfLRt/SiSSAKH0ZCQ1l4lvbclJ+0AtnAkAMZ1j+hZ0w
	PmxlOkAg/akvSu7+1K+cVMnEcdpRczaXSbVys0ZMzyi1/6HThUfQDkmsxNCpsibKF3uaGCjrrnK
	yQNZqGRMo5ruhf44+wiKLpYV8xw56ng==
X-Google-Smtp-Source: AGHT+IGeO4yTGC58MRRmlIHR6sIaf6azf5UDzV10+C64R/ID3UhTXRCb57T0ZMe2PAf1SmAnrzQ25A==
X-Received: by 2002:a05:6000:144d:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39132d9908fmr7003530f8f.40.1741603012535;
        Mon, 10 Mar 2025 03:36:52 -0700 (PDT)
Message-ID: <c037b420-d732-45fd-adc5-12792c1bc187@suse.com>
Date: Mon, 10 Mar 2025 11:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: add HVM-specific Kconfig
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250207220302.4190210-1-dmukhin@ford.com>
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
In-Reply-To: <20250207220302.4190210-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 23:03, dmkhn@proton.me wrote:
> Add separate menu for configuring HVM build-time settings to help organizing
> HVM-specific options.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I think it would be nice if "organizing" was further qualified, to really see
_why_ the change is being made. A particular benefit that Roger points out is
that this way all HVM-dependent options moved here will then appear in a sub-
menu like fashion in the tool.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -30,7 +30,6 @@ config X86
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN
>  	select HAS_VMAP
> -	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF

As said before, personally I'd prefer if this didn't move.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -0,0 +1,73 @@
> +menuconfig HVM
> +	bool "HVM support"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default !PV_SHIM
> +	select COMPAT
> +	select HAS_VPCI
> +	select IOREQ_SERVER
> +	select MEM_ACCESS_ALWAYS_ON
> +	help
> +	  Interfaces to support HVM domains.  HVM domains require hardware
> +	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> +	  guests which have no specific Xen knowledge.
> +
> +	  This option is needed if you want to run HVM or PVH domains.
> +
> +	  If unsure, say Y.
> +
> +if HVM
> +
> +config AMD_SVM
> +	bool "AMD-V" if EXPERT
> +	default y
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  AMD Virtualization Technology (AMD-V).
> +	  If your system includes a processor with AMD-V support, say Y.
> +	  If in doubt, say Y.
> +
> +config INTEL_VMX
> +	bool "Intel VT-x" if EXPERT
> +	default y
> +	select ARCH_VCPU_IOREQ_COMPLETION
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  Intel Virtualization Technology (Intel VT-x).
> +	  If your system includes a processor with Intel VT-x support, say Y.
> +	  If in doubt, say Y.

Perhaps not to be done right here, but still: I guess the "default" of these
want to change to use AMD / INTEL respectively. While we permit enabling the
virt extension support separately, generally there's little point doing so
by default when the corresponding CPU support code was disabled.

> +config ALTP2M
> +	bool "Alternate P2M support" if EXPERT
> +	depends on INTEL_VMX
> +	default y
> +	help
> +	  Alternate-p2m allows a guest to manage multiple p2m guest physical
> +	  "memory views" (as opposed to a single p2m).
> +	  Useful for memory introspection.
> +
> +	  If unsure, stay with defaults.
> +
> +config MEM_PAGING
> +	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> +
> +config MEM_SHARING
> +	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> +
> +config HVM_FEP
> +	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
> +	default DEBUG
> +	help
> +	  Compiles in a feature that allows HVM guest to arbitrarily
> +	  exercise the instruction emulator.
> +
> +	  This feature can only be enabled during boot time with
> +	  appropriate hypervisor command line option. Please read
> +	  hypervisor command line documentation before trying to use
> +	  this feature.
> +
> +	  This is strictly for testing purposes, and not appropriate
> +	  for use in production.
> +
> +	  If unsure, say N.

Please can this move ahead of at least the two MEM_* ones, maybe even ahead
of ALTP2M?

Jan

