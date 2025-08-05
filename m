Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AACBB1B05D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070154.1433809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDGM-00074E-4O; Tue, 05 Aug 2025 08:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070154.1433809; Tue, 05 Aug 2025 08:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDGM-00071Z-10; Tue, 05 Aug 2025 08:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1070154;
 Tue, 05 Aug 2025 08:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujDGK-00071S-Go
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:43:12 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c5bf04-71d8-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 10:43:11 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af95d5c0736so371859966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:43:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af95734a066sm473288766b.44.2025.08.05.01.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:43:10 -0700 (PDT)
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
X-Inumbo-ID: 37c5bf04-71d8-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754383391; x=1754988191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V4fSyvszulgMiK4p6iZF4g3R+UZYXDJHthT6RzS213w=;
        b=DazP84ZdpEcrIiYNUu4/6tQ526TrNE+msP6dYEk8GLCE+EfUJnOQDgvEgP1RSiI6Wn
         5tPd7WdyK2ktgPXLghQ5z2haE/CAe8xQWFk2Kf0T9M2vgUC8ImF7egCyALzmBFDToLaz
         UcE4X8R34I1mzt9/rIH64mLYPrIV+ZevIbQ3LJJ2NYBNZX7qxL8MgDaL9mzYdOxOykss
         pJV/28/FHNKPVxY94DN046/UQMc+0Wi09qgv7X0QWW8I/koqy3T1LsmUkNMcYy9EOukn
         gY+NOZRxcwJWnY8udNVH2f0nBsaFgILOrajtPNbUhn6S2QZKsCKRwQRpliCx1M4S6jFe
         ytCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383391; x=1754988191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4fSyvszulgMiK4p6iZF4g3R+UZYXDJHthT6RzS213w=;
        b=LbzOdm3ES/qFQuQf4o3us9TNVNXlQSwoh9LMOfgj1YF3CkAG6uRlc1JFDEvSKDOPrs
         JdCSxzJeHSynYwu14uEC4fIX4TAhMWME4G3H3HKviF/BS3srYXrOh6eT4YY7otNUy/8k
         9eYHSwI6dlpVPZZ/kC+6KYkUk0N6koEM0TjvWaODXBG6apcNvFq5T8g31WAVXJyja1jf
         XdFpdmGnqNCUQz86NAbKA/GQqe/Bmzo/FfHstV9ndzHCoKG2Fm/RopTU2xw/nhpb+F8p
         mWWAw/8bPuv54apPPd9gESdeQAJr7Kh9vLpqvGfbGVP+YrsWoJyFtgkCVA+AfrEpcGIs
         1stg==
X-Forwarded-Encrypted: i=1; AJvYcCWlmL94U0jc5zgnkJk14q/lW2GLEMR+aPdrRcXriH4vhScd3iv/nvR5XfLzbUNi9LCd49YNWwy7IZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIsEn/gjvvzSo4Fpp5eeXt3Sjn0p5HbE28xGstpyPzpZKpwElv
	VWEYdaa9gKpUVDMhNO7LohVQsn7xFekPo+XiPhkYeQ3B7QB7frRrmCb3898VvWgrpA==
X-Gm-Gg: ASbGnctILw3R1uxO6OQEpsdzPPZUl8EQHrc+CDIgb0mYOhw7RDl2c1UBmrf1x2bP3sr
	68snK+IukckksmxXk9znI3g3ulkxPnw0DM9SFkQJVyrtsA/qVkDjlu7eyHEzBSJVnokecJwraBD
	3HQ+LuvfrZ2tyVWWEjhv55FYWVihV2BAp5ScgEJQhVK2y/1H1HsgCBa6ed8zYNHinaayejDPhtC
	LKjeHwfGV8VLypnQv5y22USkyhZkumi0/u5dev0jYobUZEoyV3/jyfq+RBjVEh48/F70bHGptlZ
	kYlIEkvbwU7IIUKDWWDZhfEjNHIy/wiYpnJCyog8NYIqhb1PDvFhGPy2f0w6vJ6COLFnOCZydPp
	QLA5U+BcymPT8PwutHoCAlr0kf1B60NXCMKnFYGnhJH+fF1OE56ik9Xb4ZHXC0b7syiG07o+5B1
	UHm8a0y9I=
X-Google-Smtp-Source: AGHT+IHSwlbHv+hWiAJogUWtSvd96V21OesInd0hVXYR0ClHmVXvjZPM5ALoobdKfxh7Rw+op28wtQ==
X-Received: by 2002:a17:907:3e14:b0:af9:7b49:c0 with SMTP id a640c23a62f3a-af97b49031amr319861166b.29.1754383390614;
        Tue, 05 Aug 2025 01:43:10 -0700 (PDT)
Message-ID: <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
Date: Tue, 5 Aug 2025 10:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250805034906.1014212-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 05:49, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
> +{
> +    int rc;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( !msix_pos )
> +        return 0;
> +
> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    if ( vpci->msix )
> +    {
> +        list_del(&vpci->msix->next);
> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +            if ( vpci->msix->table[i] )
> +                iounmap(vpci->msix->table[i]);
> +
> +        XFREE(vpci->msix);
> +    }
> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports MSIX by default. So here let the control register of MSIX
> +     * be Read-Only is to ensure MSIX disabled.
> +     */
> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> +                           msix_control_reg(msix_pos), 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

Here as well as for MSI: Wouldn't this better be limited to the init-failure
case? No point in adding a register hook (and possibly emitting a misleading
log message) when we're tearing down anyway. IOW I think the ->cleanup()
hook needs a boolean parameter, unless the distinction of the two cases can
be (reliably) inferred from some other property.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -321,6 +321,27 @@ void vpci_deassign_device(struct pci_dev *pdev)
>                      &pdev->domain->vpci_dev_assigned_map);
>  #endif
>  
> +    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = &__start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        unsigned int pos = 0;
> +
> +        if ( !capability->is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else if ( is_hardware_domain(pdev->domain) )
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> +
> +        if ( pos && capability->cleanup )
> +        {
> +            int rc = capability->cleanup(pdev);
> +            if ( rc )
> +                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
> +                       pdev->domain, &pdev->sbdf,
> +                       capability->is_ext ? "extended" : "legacy", cap, rc);
> +        }
> +    }

With this imo the patch subject is now wrong, too.

Jan

