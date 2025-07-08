Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA238AFCEB6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 17:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036798.1409262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZA0a-000716-Ei; Tue, 08 Jul 2025 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036798.1409262; Tue, 08 Jul 2025 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZA0a-0006yn-BH; Tue, 08 Jul 2025 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1036798;
 Tue, 08 Jul 2025 15:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZA0Z-0006yh-0e
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 15:13:23 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15e830f4-5c0e-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 17:13:21 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso4008589f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 08:13:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42bea01sm12275221b3a.147.2025.07.08.08.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 08:13:20 -0700 (PDT)
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
X-Inumbo-ID: 15e830f4-5c0e-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751987601; x=1752592401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ddtKwieZ5u/1q1CTWFsnFi6TT/H13kirH4p/OycLPg=;
        b=G3SCL/Mwa14+X5zejPrA0Dojqoi3xXI64Qwg8rk0/0CVGwMsddt/iOB3lZTF87YTbd
         L3O/n3tBxUbpgwX3bQ8ewqOCXT+9qcMXWrF3D2TN062HjxZqEymIyhulhRhK5U/Ct/LZ
         q959/hBUuP+cBTVzq7b7OklQTRXxOl7aQpnIIeBQK9Ej3Lnast8eYj/9TUItzsYqdRGB
         xCSjHP2uI4Ve6YJyGa4lmeHxwKyTxF75o7/s8Zpf705Reb+HJ6+FwMPNX0Rv2TgrFzVc
         PHgkdvGmEKaCVTy3SRmaSxecKgPJjCAFZCTZ26SLaZCLRvtLQ+hjhlCafqHQVo/IwtFw
         xtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751987601; x=1752592401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ddtKwieZ5u/1q1CTWFsnFi6TT/H13kirH4p/OycLPg=;
        b=E+OYlj3OMeDlXvfJnQymTby9EgPZYWh6ZnrClIh2gZ/t671D1msB7uzETqliYY7M5l
         Bb8iTYZ9tiOyzfKof5cyRGb3NsP5uM4MCVw7t7oZbNIa5yKY3EvCPVe6lkz5xPs8IO4v
         Gnf0z7vA7rKaxfSQ5Nke7ifSYllpO16eh3Bf936Uf8Yy7dY7ZMUlMJN9hfsqg6lA7YXT
         AYc/+pzOxfMVAQbtaIvWx0DTrbk3jcBIl/le7+5anma9JE1nXK+TCmFZKPm79eLLizDE
         lH66fq3rOjig2pkq4A/kv9aBBaF6kaeKfLRaQbtjqyAwLz+D8K3sj25u4AWGc79xS+O5
         mq4A==
X-Forwarded-Encrypted: i=1; AJvYcCXvahLPYUaN8KQoGENtCQFlkRhp4Tppqx56TNHUYvb2NXR8n2Aconyo0k7c2nJab99vOQvN8HjOpdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWeo6F/uPeNJuv0St/221R4aPlj3Qpyp7gEi41jKfoL9T5yXUK
	3rladBvqI5oSSCvaWrHOQ57zI+0Ux31P6rERdISMe/Zwom29WphXqtjIBJzOi4AyZNpKGDS3a68
	YYnc=
X-Gm-Gg: ASbGncvah7Gk69NMT4sHxGevXzTDF34LUIlv6z/aW8RpkjwoMfA8EwbsNr42rVRHYb4
	0PCQWJlXW22+Q15OXoyEaPYJVRuQ3+5svv9Hfz31Oc4jnJpRMpukGVLwI4xUch2yLMUuzdq1ixE
	yy9rfx79kV7oNh6S/CEmCaMVx3Th1qsIpOpwFKWEJ88woih53ut6s84iw0i2mzjXRL42IhCQCYm
	M++S9uiV5kuXcWMvFq4IyQ/+4CFJEy30atnumfKHA7NfuENKMuXjYYRFLY77kx1gbZXg3w4GBUu
	Es36nf2jYKwGBIyjUA54BctgBCmIdvwn5VjS6iaeen02pwmPFFO7HpnWONfuvxqTxF3tVlRZwqa
	1VsK9RfW72zIzAEnOHC1bxpKxy6+Rqzxf1nKKeoTvCyADBqOy3ODBFNcECw==
X-Google-Smtp-Source: AGHT+IExMFO3OtfzlDg/lRdtcjqnG4paa7cdqwT0r29e3gG9iIF584pIvHTEistO88aUxcZ+2LNCMQ==
X-Received: by 2002:a05:6000:1449:b0:3b3:9c75:a4fb with SMTP id ffacd0b85a97d-3b497029621mr15104108f8f.33.1751987600726;
        Tue, 08 Jul 2025 08:13:20 -0700 (PDT)
Message-ID: <83abcd7b-e742-4a0e-814f-1f2b801eaff9@suse.com>
Date: Tue, 8 Jul 2025 17:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] vpci/msi: Free MSI resources when init_msi() fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-8-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250704070803.314366-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 09:08, Jiqian Chen wrote:
> ---
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msi() to be const.
> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>   directly, instead try to free msi and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>   init_msi() since we need that every handler realize that msi is NULL
>   when msi is free but handlers are still in there.

Imo this latter change would better have been a separate patch. I'm not
going to insist though (also I really can't, for not being a maintainer
of this file).

> @@ -193,6 +234,42 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(const struct pci_dev *pdev)
> +{
> +    int rc;
> +    unsigned int end;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return 0;
> +
> +    if ( vpci->msi->masking )
> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> +    else
> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;

What's this "- 2" for? If there's no masking support, you want to cut off
_at_ the mask register, not 2 bytes ahead of it? Just like you cut off at
the pending bits register when there is masking support.

> +    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
> +    if ( rc )
> +        printk(XENLOG_WARNING "%pd %pp: fail to remove MSI handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +
> +    XFREE(vpci->msi);
> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports MSI by default. So here let the control register of MSI
> +     * be Read-Only is to ensure MSI disabled.
> +     */
> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add MSI ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

Imo the uses of XENLOG_ERR and XENLOG_WARNING want to change places. The latter
is extremely likely to be a follow-on failure from the first one failing. Plus
the latter failing is covered by what you add to control_read(). Which leaves
as the only case where this is really an error (and XENLOG_ERR might then be
warranted in both places) if the former succeeds and only the latter fails.

Hmm, then again vpci_init_capabilities() would too issue an error message in
that case. Perhaps keep as is then.

Jan

