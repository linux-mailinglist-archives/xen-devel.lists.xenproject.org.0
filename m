Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD2A5BF77
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907935.1315128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1try0o-0006H6-Cn; Tue, 11 Mar 2025 11:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907935.1315128; Tue, 11 Mar 2025 11:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1try0o-0006Ep-9b; Tue, 11 Mar 2025 11:43:06 +0000
Received: by outflank-mailman (input) for mailman id 907935;
 Tue, 11 Mar 2025 11:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1try0n-0006Ej-79
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:43:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdfbce39-fe6d-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:43:04 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso21455615e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:43:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf27f8ef3sm82676935e9.11.2025.03.11.04.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 04:43:02 -0700 (PDT)
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
X-Inumbo-ID: fdfbce39-fe6d-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741693383; x=1742298183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmv143IPjlIa7TGdcoEdnJnBb+vnuvoiBmNX4lh20wM=;
        b=bEpcQNZWC6OwQDAd8HzXyiMyaGabGq2BJaGMFN3MsQosaz+OEIV/qczV+T/vw7Jfym
         gcyFaj0GG87dENwzAUp/8O2yliZWOYpz2ZQOo+Y8cXVVq+LmxmNkf2y0z5AazC82FaaD
         Jtc6BdWj63a3HQTSCYXoMagNzGSuBlTyAO5seAFwWhFGLWeHxC37xQSEv26cVXSOi/nj
         SDIhBuxXyt+tVIwV0Ot9VQBAsgiektc3WlkkCuk5i59Yyqenfm6LMIQ7Y0b6/k4hUhMR
         jT3xjb8ayNtONAdEf7mEAoappA5WJGt7nZ6qGLrqRDi/gTW92PhxtP4dR2VCdpXI5+F1
         msUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741693383; x=1742298183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmv143IPjlIa7TGdcoEdnJnBb+vnuvoiBmNX4lh20wM=;
        b=gew+IOpbVzpYMSbRALkLUDzjRDCeA4pmvOY0lLJukY9fyPXl3OFvN/7Jm+acCkRcPq
         601lGRqRsmAHOUz7XthbMZSAHMf7qeqo28vHeWl5TasdW/2Rkr3tKazlQz7h/JdXCZnA
         Y58W2xr2ybBhieqrsMsv0n/1WztTLRpRrs2TJYpU6UVlJAJbafZ6Qhw294yrMLlTDhoq
         HdGMvasa4pKk12zdhlXqYhO/YpRr2rKOCHczf2CQLwWciSKQy0fJzn+qkEtce0SiPfjo
         RJ8ZuWkkNi1xIHp9DXwqjPPIJ3KxiY+lCu9wjNjU2Jn3+OTX8hCYaWwqpAK74Or97xP7
         JgxA==
X-Forwarded-Encrypted: i=1; AJvYcCUw33lq+NLXJPj51t0MUTIGI8+GdqlFt75WRiWfUt4K/64t08n1ebJZdgDzRatWfVXcicnmANOL/f0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUXpF2Z1qELFG2MM8Yy2JJj0JqSPXtSzXt8P+bDwEFuCH00jcK
	Yo5QkSBVkw/e7Hjqg8XpOkcvxTbSb2TFkk9CNjMmZD4NUpEz174+AnLny6j+tw==
X-Gm-Gg: ASbGncvctGbWtdm+NjHxMuY0ZuxwcuEDAkE7Xgiig8SIpXunuMUuZL41LDepeY8M0V2
	8AmwPlHBCxUzjiPYAVSDXNOma30pL9W7jXUEYQa4PyhZQN4qnm73lwKnhs4eVbzUs5MsMuWPAKt
	DSGxNbFreIfykZbgQSM0t9v1aHweg1vNjP6vzdBFw5M9B+vFFDO+FN9/Ls8XoRijBMH2P4AsHNY
	2cuZTJ8x55b8Qycik1Z1EBjTIBYehiJmMtn0vqj0F01RFvfOfoOcwRFFrl7lLgwXQzGkLFIc17w
	4N9eAlNaKT8MhAq7vqQPTjH4exfZkbXbc6NDveGbYVswnUiJWqXhxVFqoA9cZERLZdQnFjlGjEG
	9wWh2Y8cKP5H1XE1cdB1ZsKby32+VDg==
X-Google-Smtp-Source: AGHT+IH6yHeL4EoTswVO2FZWN926l4yMuLRtp9wTbljow29BOOg4XEzJleItR0Btu+dsiQGkJ+EmeA==
X-Received: by 2002:a5d:47c2:0:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-3926bfe070cmr5221101f8f.39.1741693383240;
        Tue, 11 Mar 2025 04:43:03 -0700 (PDT)
Message-ID: <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
Date: Tue, 11 Mar 2025 12:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
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
In-Reply-To: <20250311111618.1850927-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 12:16, Grygorii Strashko wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -526,6 +526,12 @@ S:	Supported
>  F:	xen/arch/arm/include/asm/tee/
>  F:	xen/arch/arm/tee/
>  
> +SCI MEDIATORS
> +M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> +S:	Supported
> +F:	xen/arch/arm/sci
> +F:	xen/include/asm-arm/sci
> +
>  TOOLSTACK
>  M:	Anthony PERARD <anthony.perard@vates.tech>
>  S:	Supported

Please can you respect alphabetical sorting in this file?

> @@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
>          ret = iommu_do_domctl(op, d, u_domctl);
> +
> +        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
> +        {
> +            /*
> +             * TODO: RFC
> +             * This change will allow to pass DT nodes/devices to
> +             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
> +             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
> +             * is disabled) without failure.
> +             */
> +            ret = sci_do_domctl(op, d, u_domctl);
> +        }
>          break;

Despite the comment I fear I don't understand what you're trying to do here.
In any event you may not clobber the original "ret", if all you do is some
"add-on".

> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -18,6 +18,7 @@ enum device_class
>      DEVICE_IOMMU,
>      DEVICE_INTERRUPT_CONTROLLER,
>      DEVICE_PCI_HOSTBRIDGE,
> +    DEVICE_ARM_SCI,
>      /* Use for error */
>      DEVICE_UNKNOWN,

This is a generic header - I don't see how anything arch-specific could
validly end up here.

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>  #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>  
> +#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> @@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t arm_sci_type;
>  };

You're not re-using a pre-existing padding field, so I don't see how you
can get away without bumping XEN_DOMCTL_INTERFACE_VERSION.

Jan

