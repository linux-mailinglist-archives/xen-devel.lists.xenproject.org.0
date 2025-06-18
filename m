Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA4ADEEC5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019173.1395983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtPj-0002WN-Mp; Wed, 18 Jun 2025 14:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019173.1395983; Wed, 18 Jun 2025 14:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtPj-0002TG-Ia; Wed, 18 Jun 2025 14:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1019173;
 Wed, 18 Jun 2025 14:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtPi-0002TA-9F
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:05:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426709c9-4c4d-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:05:16 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5534edc646dso7433374e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:05:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748ed8a6491sm1179421b3a.1.2025.06.18.07.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:05:14 -0700 (PDT)
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
X-Inumbo-ID: 426709c9-4c4d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750255515; x=1750860315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HrNauj7Dv/2e5ZxaVJfUMDwVxhzpC1WcBA/E+PqJi2A=;
        b=UoK8GZgrXR+UH2fpxWlhOcUQkLoMVrED0+KfnGrLQ7NJ6Z1bN6ImFb/KqRbSrqIj0m
         J6Kfg4WwNnyMF+UlyU1YT57zFRitji9NasFknITtOHHbSUm/FuNBPjiYeYCzcpe98nlJ
         REvWz67sUXklbydGhmxa2XlPEkGOf03ilJcRaPJvyNVrvIPBxsJEG3Z2UFH7ALJ9Idv/
         zaehhsJ6ov/8uP12JaVoiURINLgJKV9FQuK3AE6ZaXVaK54ov5tPo2aWWycLq8Auho3+
         Q6YUHaqeeMWSGVfK329vl7HAB80heFu447WHGzmCSdWvzq8q/cZIEoqZP4/bUOvLBCR0
         w0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255515; x=1750860315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrNauj7Dv/2e5ZxaVJfUMDwVxhzpC1WcBA/E+PqJi2A=;
        b=AC6mhVQOzLCdmTFqlvI9Re81OVeDP9e1xF7a52CW90mQ1sxGdkstunHpurxXqgGOtu
         LC5nNwqrRqdoonNs3P8lHzPaYt2Hg07SuoGFLEYxgbMSj4GF6CvZ+dhx9X4XeMwUVs5m
         FtMkh2TCI8bXvrOqKiuL0CVlscuow3EnoKn4myCQWDV8cDT8xK56P8nw5N0mWhOSckQq
         dP7SGM1Bp/2z3g6+4xyXSMJ7ftJ2ofvthFxjWX8kdFr5+9MeJ0gN/047KRJk7Fp/QVhs
         RKjHufVdCHz+H8jRyeuE/LHPTfyPXhIMZjg0o3vGITYHtNP2d9bQhSXosGeoEyCtUhDP
         X8lA==
X-Forwarded-Encrypted: i=1; AJvYcCVmGlK4TsPKHmgJWRjjWimRZdngtjQtLoJNYp9dLn9i3Za30xE3q7mdKMtkqwSueYfqA1Cdjl745A4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeT6W54ntZGhpCl8MkJufxn5oJWcGvIm5GiLfOhqY3dXLcOfOE
	Ww3P8vzOQX9/ZqF0MgpfOSUs/MlDu/2MQbWJRa+zGnD3xGNrKv1XH98DD0g2lwPB0Q==
X-Gm-Gg: ASbGncv3owA3j3qcrtMFsJVwXGDqT4VoQP8dLs6IBm5F2pAzTyNbHMPU11vFmBA665q
	6qOnbtejE0nuileeve+qMKT7oM6V8ayOJPZ0kAMwvC+d/XLacxxacWctAzghs29HOOj5QNHsTuu
	0Y2vYN3YJ3f7Hwq0QYQCajXySwYepVETbuhB5IkbaTxCD5yMNIZtl96vYci8TNG76k9zmAugFeb
	IRNDRoRtk/j2KSutf2lVczDQpryNHRanZVKspV54Arflsau3QWTvJZEBSTdZBF57BwRwAwKQPlc
	erf+bB3Q39iE8Xel+/XICU5nU/jDRNBoLSFxnwPALYEbdmEP8guX4dX2SJw6728zkDtqo7w9STf
	wUxCw4Pt1WYOHYziGScryKMoRl6KbabLkS4SahA4JDev+NKY=
X-Google-Smtp-Source: AGHT+IGZWZ6TWBH05InKBCAkg1vMRsxZqMs9iWSHwf04GeVkAFeje1/SWFg7A6M/rlr0aqvV7DrV7A==
X-Received: by 2002:a05:6512:2344:b0:553:2e4e:cf74 with SMTP id 2adb3069b0e04-553b6f28380mr4829840e87.27.1750255514901;
        Wed, 18 Jun 2025 07:05:14 -0700 (PDT)
Message-ID: <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
Date: Wed, 18 Jun 2025 16:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      pdev->vpci->msix = msix;
>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>  
> -    return 0;
> +    spin_lock(&pdev->vpci->lock);
> +    rc = vpci_make_msix_hole(pdev);
> +    spin_unlock(&pdev->vpci->lock);

If you add a call to vpci_make_msix_hole() here, doesn't it need (or at
least want) removing somewhere else? Otherwise maybe a code comment is
warranted next to the new call site?

> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
> +    static const vpci_capability_t finit##_t = { \
> +        .id = (cap), \
> +        .init = (finit), \
> +        .cleanup = (fclean), \
> +        .is_ext = (ext), \
> +    }; \
> +    static const vpci_capability_t *const finit##_entry  \
> +        __used_section(".data.rel.ro.vpci") = &finit##_t

Could you remind me why the extra level of indirection is necessary here?
That is, why can't .data.rel.ro.vpci be an array of vpci_capability_t?

Jan

