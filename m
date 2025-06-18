Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FFBADF007
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019250.1396063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRu2c-0003YK-4G; Wed, 18 Jun 2025 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019250.1396063; Wed, 18 Jun 2025 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRu2c-0003VK-0j; Wed, 18 Jun 2025 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1019250;
 Wed, 18 Jun 2025 14:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRu2a-0003VE-OE
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:45:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df50a249-4c52-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:45:26 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54836cb7fso5007284f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:45:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3157a49efc3sm491909a91.0.2025.06.18.07.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:45:25 -0700 (PDT)
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
X-Inumbo-ID: df50a249-4c52-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750257926; x=1750862726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+XASsST3cWO87tPgiOV+zhv1u4r6grC2HguwT9UrXTQ=;
        b=WywX2Bp4M7YYw/mJ8gehwMZgMM2mIn+19jSI2KgUgh0G2mf+jZgsLUtoKU1Zxc2AS0
         8CbSmUDktFQ12ha7QiyctkPXvp2HGsHN/tDRMKijVic2tkrGlv6bbEvyJxYJ3KmWT9IA
         jVS7SPqU5dD/7Ny2Oc7skdD75vsTX+7IoEV90SMXVPa1cqu6vqneA2N/xJcinLkPFj+T
         TBXU8NNADy9+NToO0a7yZrnYoKGPCNQuz6oWwxQv3GukINBY6bbJJxLbbbEaedt9NpPu
         izIqYsFKuD//7pOihFmexD2qA8v4+D2eZDTLfzfRTDpqOVI0NrXDSthm5OWjdaVY1DYI
         J4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257926; x=1750862726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XASsST3cWO87tPgiOV+zhv1u4r6grC2HguwT9UrXTQ=;
        b=AFJ/o4VZVKKx+nsBVvN7JQdyjiiXkg4ee56K+CH5byCNAjO/dPt8UBy4C/ZTwwdRxh
         ggdgGSIzolmnB//G2TyDQv11Avp5FC97tkgvpRwsoXw8I6lZyELH2DYUzObiJMsI4t7e
         h1sAcNfutuQCAoSJBXL1q1vM0OXdf5mfX4vBgS/X0s/zCEQ2c3UvIzQN1+i/ODrdVeif
         9a+y48KX5YagtFoWTKsx2XLCO93rZLwXZAr/vDQ33EgBkd8AchgUmBSAMq3KO7QETqNZ
         TKjJWWOBm59fDDCNLuaT5b7cqyFRvdiDICK8OTXDjqA9KIJkdF090wz3HDrFUphzzNfE
         lKrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBLeN632G2udnYCyEbkDnNiDH+zjFjEiYQX8CaYPsGaXLzyPMwcNfSCdr4SHVQYMxMXyAdrvgwK9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaCxlqJKwo5CrOICasizdUmQMrlNzFwmSWfp1O0H11tf5HzhQh
	vJpIOew2cadWNbUbGW1m8zmOjGzpNPLBc9HwJcvyTwzORhTyW24KapIhedJHLSCH5w==
X-Gm-Gg: ASbGncvg2BCZTLAeo4ibFIa2BD3v+JX1lnhi3RwKEGAi9euJBHUvkB6lq2uvG/vfrBC
	Y1EBSnZSawqfAzKUGpjILytLLNaHIllxO7CPjedetFnjtVGTvCYzohZHb8m0HMnHTnZ2FQhSywU
	fzOcaJ3Fd03NwtMxIdW7JnO/lwX3b8RbIllP7FtY5khjOqxbPw1EBNyaBt6NWx4ll+SAAVEoog7
	+W0DCrFiz1qe+YxGDPtul9bzb3oLEt+xZdZq/hS8heU/6YcwyqA7hKqVr51Aakjmkbpz+ZxaP8F
	uNePDAd8VBwKFt5V/yAN0cRaoSxkDAbSwtrmsSsF9YDBV4f7U/MW7JgSKA7eAM/1p+G4tm/5Uu4
	UOB5oB7naB2z63OtbYLg6xpezpgRBgLVXRXWsiuM5niBG5gA=
X-Google-Smtp-Source: AGHT+IGO1IxositLoD9YW2v3fdgVJtLbTsXN9S1jAIEiD3wvJuUdFV4spQhyXGfnbDZ5lna73EycJg==
X-Received: by 2002:a05:6000:2882:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a57237d8c8mr14133062f8f.23.1750257926005;
        Wed, 18 Jun 2025 07:45:26 -0700 (PDT)
Message-ID: <773c448a-d814-458f-ad83-e9740e724408@suse.com>
Date: Wed, 18 Jun 2025 16:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(struct pci_dev *pdev)
> +{
> +    int rc;
> +    unsigned int end, size;
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
> +
> +    size = end - ctrl;
> +
> +    rc = vpci_remove_registers(vpci, ctrl, size);
> +    if ( rc )
> +        return rc;

This is a difficult one: It's not a good idea to simply return here, yet
at the same time the handling of the register we're unable to remove may
still require e.g. ...

> +    XFREE(vpci->msi);

... this. There may therefore be more work required, such that in the
end we're able to ...

> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);

... try this at least on a best effort basis.

More generally: I don't think failure here (or in other .cleanup hook
functions) may go entirely silently.

Jan

