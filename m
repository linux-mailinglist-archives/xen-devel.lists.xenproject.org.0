Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMr1DcX4iWn5FAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:09:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D96111A45
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225582.1532118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpStW-0004r5-Us; Mon, 09 Feb 2026 15:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225582.1532118; Mon, 09 Feb 2026 15:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpStW-0004pC-S2; Mon, 09 Feb 2026 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1225582;
 Mon, 09 Feb 2026 15:09:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpStV-0004p1-EE
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:09:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da4b886-05c9-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:09:44 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso46721035e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:09:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629756bc3sm25515164f8f.39.2026.02.09.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 07:09:43 -0800 (PST)
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
X-Inumbo-ID: 5da4b886-05c9-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770649784; x=1771254584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NFqhPU3ixu+cd/Sd0srCUcKhJb4WoHYVYY7p70lHgmI=;
        b=d2+HmAB7s7i78ijTwfLWmQR+YGJArnf4hjAD5/FC5lCeI6qPm9k52VJh3ISETLeaXi
         NwlhXMPd0hzip3ZITeVKwpq6wvaaEDsiyHZFeu6VfGei7fp0MYFyBFzO0/NPKouHfzPL
         8vzO3G7AZzPuJnAOIKHI8Id1io56XCuTqRlK5JDVl9RGAGn3p3i9PbOALhUDTwoje7Tc
         JoSHal81QhrH9IjnhcLZ4tv6lC0I9mYlJ4gn9QbBbIEXIuhrtUKzP0cbR0A37I6jXJRt
         ReRiz0DuigjL0jTTnG9vOA/Mkzy1Uu/x4HgL49Fw8atOAyQem4omCZij64yhOpMbB0BE
         pXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649784; x=1771254584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFqhPU3ixu+cd/Sd0srCUcKhJb4WoHYVYY7p70lHgmI=;
        b=T+DXawvGJ+DpYcqsTAhZLs95+mpz6dlkFOVv/wYV6YRW6Z8wCPsyX7Sx1YxAOt3Kva
         TkSfGSoUh2CHyMKZQ9l0JXMKqaQZCkIhfMYGML8x8n1PPg2MCwcqmb5BC922ALjDSXna
         +IatJox/XW1leUeBFJ2T7dITKQX33HKaEQo3TAbN5MxBb3xyLj2rk5Qj93ijCRvIY2BP
         uBVkJEk86Q2uaULsq/NMZGPGfuOZdaGNu/pIzPk0WVH7CzUaQ78iBpvEjFLA6ePstfHv
         TFn8w08G8oPEzUkKm+mYTSMgt3EPinInfypTbdopm7Ut4wR9RcuH7dWIp/NbHth008PW
         1kvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTsthpEBhfm/wKNTuJjuF06eNr4woAsgV6lAsCnHkkt3XXjn32rn0cccepPMWQuMfS85soH4ko74M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5mc6VbYS594L8H12hjun7kFGr2Brd4RWved9AGybe8W9OAJh7
	Gea0d6mSTX4vNuocen1oOq65mRgTBujyl7Vhd3s+2aIfZeT6jdlJTd/IiAIicfNCLA==
X-Gm-Gg: AZuq6aIHFd8E+Lr6CzUfVoDcbZfPJI8PmOMMx05xiBOHsSh3YckjGpY4QKfrlq+RxBV
	CiBZUtT9Emp73SB5gmPYDywb6gg3LceXL+jVaC1SRmkNYJL1dkgKtBvDY/5LF8FOBvfR9AYf0dz
	QvLxS8ajg78AUUa5FTMl573bo8NFZSkPysBMQioTh4z1QZvaEgrZ97An0vPL+d6GvOAQKGELhY0
	e2U8L60lwgpVaL/zsIZcwp31pSoy9Yd7vIm0NErJegtSBqCqNu5ntDImmjRL2mULxGvQaOIdRZY
	gLzFG/QYKkdOQcMd4LQKn6ZLLMUzKbH8S3YoRxMtUKlEVCSH/hP2wOS4pQtgHL4aEvLridKExnl
	0recOD9VEghzZ8Jy5fQIjpVPGO6Z81WIZVCQsRbMwlw19L6rhc3s0rzWW2ouvEhiAPTAETcMM79
	vSPvUWH+dtPO401sFyOYC5EDAEUSsJZVtMXRCG2/sGWKfDlwLjKMTC7yvP20cCC4VX1WX7DR3Wb
	co=
X-Received: by 2002:a5d:494b:0:b0:437:71b2:6f23 with SMTP id ffacd0b85a97d-43771b270a0mr3178235f8f.5.1770649783763;
        Mon, 09 Feb 2026 07:09:43 -0800 (PST)
Message-ID: <7a3b72b4-23f9-410f-8d0d-08d9adaaf1a7@suse.com>
Date: Mon, 9 Feb 2026 16:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: roger.pau@citrix.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260206210554.126443-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 97D96111A45
X-Rspamd-Action: no action

On 06.02.2026 22:05, Stefano Stabellini wrote:
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,14 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
>  
> +config NESTED_VIRT
> +	bool "Nested virtualization support"
> +	depends on AMD_SVM || INTEL_VMX

Should be HVM? Or else have separate NESTED_SVM and NESTED_VMX?

> +	default n

Please omit such a redundant line.

> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -26,6 +26,13 @@
>  #define nsvm_efer_svm_enabled(v) \
>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
>  
> +#define NSVM_INTR_NOTHANDLED     3
> +#define NSVM_INTR_NOTINTERCEPTED 2
> +#define NSVM_INTR_FORCEVMEXIT    1
> +#define NSVM_INTR_MASKED         0

It feels suspicious that all of these need moving ...

> +#ifdef CONFIG_NESTED_VIRT

... ahead of this.

> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
>  
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT

Same here.

> --- a/xen/arch/x86/mm/hap/Makefile
> +++ b/xen/arch/x86/mm/hap/Makefile
> @@ -2,5 +2,5 @@ obj-y += hap.o
>  obj-y += guest_walk_2.o
>  obj-y += guest_walk_3.o
>  obj-y += guest_walk_4.o
> -obj-y += nested_hap.o
> -obj-$(CONFIG_INTEL_VMX) += nested_ept.o
> +obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
> +obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) += nested_ept.o

Maybe slightly easier to read as

nested-y := nested_hap.o
nested-$(CONFIG_INTEL_VMX) += nested_ept.o
obj-$(CONFIG_NESTED_VIRT) += $(nested-y)

> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
> +    if ( hvm_nested_virt_supported() )
> +        pi->capabilities |= XEN_SYSCTL_PHYSCAP_nestedhvm;
>  }
>  
>  long arch_do_sysctl(
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
>  /* Xen supports the Grant v1 and/or v2 ABIs. */
>  #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
>  #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
> +/* The platform supports nested HVM. */
> +#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)

Doesn't this want introducing up front, for the tool stack to make use of?

Jan

