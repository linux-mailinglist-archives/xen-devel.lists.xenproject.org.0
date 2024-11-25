Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D669D89F0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842892.1258558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbdM-0006AT-CS; Mon, 25 Nov 2024 16:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842892.1258558; Mon, 25 Nov 2024 16:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbdM-00067q-91; Mon, 25 Nov 2024 16:08:20 +0000
Received: by outflank-mailman (input) for mailman id 842892;
 Mon, 25 Nov 2024 16:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFbdK-00067k-Gm
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:08:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 797ba0c7-ab47-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 17:08:14 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so5755643a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 08:08:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fc777sm4284085a12.68.2024.11.25.08.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:08:13 -0800 (PST)
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
X-Inumbo-ID: 797ba0c7-ab47-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5N2JhMGM3LWFiNDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTUwODk0LjI5ODUxNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732550894; x=1733155694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvlmYYBlKKPQcgag3pzc6nmwLlKCitIK8hEIfIiz/fU=;
        b=Cq8wsJi1L5b/rPw4ity4zbX5hvBQMf3FvQnEV3W7URMHmVZHgmNa1nEu7EaBIIvjrz
         3/zL4WeKrZ0GVwpOrXO4cqOq+RRcfbSCIvZMWECfokCp7gi+qRjGycfLehmOA8u0vShX
         LxdZy5CgnhXU9iesNlunVKHtJE+kYJ0vPgtollbXkHTup7Bestrwlx7Z3eZaZhjt3jL+
         Ao84HptLvE/xYF2YdvGUFkdB0xjOcTD+z07K2TewVZ+VhPGgw3PVh9HOB+QS6M7f/Pgv
         AgR+Q5nD3q1gp1OnF+2hDXli6/75PTRnhUUVaNJ1j4H4ZiR0c85z2brUEC1BKJ708GwY
         cVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550894; x=1733155694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvlmYYBlKKPQcgag3pzc6nmwLlKCitIK8hEIfIiz/fU=;
        b=ODYz7HywnVLR0Qw+Omd+HOQX8RB8WyXauvH5IMcswGS/NHegUlMwDbtXE3zoeT5y/C
         0DTqojZvda4JJcoZBqIZlJP3qihrY1hyyz5e/gMvpn3j4ztZehyBFy7CS/LwHMwznwlY
         NTA4g8LZ3Vfbzs8YTPIOo8qvhbKyVSpVTMuDI5u3FHVsr26NhI3RXMz3vdD8MVl2/JMW
         jUlk9I9g4x7aC/hvXC1PcKSkU09DKxyNYxcjC4ewkLqlSwhnw9pCBHauUY5W95V3BbQI
         BcE1f9rlkgURpVc3YfjvBF5zY99FvKB1K0WV8CYNWYILaZYRjBUSis8uZMJY1ZbAxH8j
         FOlA==
X-Forwarded-Encrypted: i=1; AJvYcCVIC3Xov6mPkly6ExL7G2+MEOdwxTZ3h54b6PL4rs8mS4rNJFLGN2NJobTEb21ashrYXXFsJpRBhBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3rMcit0ABvI5Jgiufry7J2nbU0hl3CM+JKG8igV81ZYxIBdOz
	e3b22cWWoNg9ftj7+fqJztI8KsL4E6ILhajgurReaQSG4FAtFm6O9Gdw5sDucNZ2FvbUuBn+yhU
	=
X-Gm-Gg: ASbGncsWgyFUghe/XXrVtHeB+0TC+SAjPczIrT0cjCSEPXcd5FMreNahSHpVESzrAUk
	fyUq+dM0tRMQSMMg28glcPGLS9ugefZDNAszOYLrIUmGlGyFRtCd1PY3VjpS+hxYMi0Qdo8H5Za
	Xe/6nY3P+Q9WKqp9hawMSIvl2T41I+VoLFtKxcSEGCS5hEgRI+0nQjPy/5C25vucbO8zDyRSxw3
	H1GDGL38Htx3tRv9KZmanPhHgk17oisY5pcLODYSoFC/fPKonPrszeKYio2lEAkcYzfuukG9KU9
	oOF/CxKz7PoVuJ8DwolbtAgJf0dQwNS6gPk=
X-Google-Smtp-Source: AGHT+IG9sXlbF0rT2nSeazX98Vy20eNs+j5tQK9iuzDf1kFoXT3v1zkHGZCv8Ko4cUqrKKr3FUSwEQ==
X-Received: by 2002:a05:6402:5186:b0:5cf:4f4:95dc with SMTP id 4fb4d7f45d1cf-5d0207b135bmr11629118a12.29.1732550893612;
        Mon, 25 Nov 2024 08:08:13 -0800 (PST)
Message-ID: <4fca39e6-6c59-49cc-9f76-9fc226c49f8b@suse.com>
Date: Mon, 25 Nov 2024 17:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241115160905.551224-1-stewart.hildebrand@amd.com>
 <20241115160905.551224-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241115160905.551224-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 17:09, Stewart Hildebrand wrote:
> Add links between a VF's struct pci_dev and its associated PF struct
> pci_dev.
> 
> The hardware domain is expected to remove the associated VFs before
> removing the PF. If removal happens out of order, print a warning and
> return an error. This means that VFs can only exist with an associated
> PF.
> 
> Additionally, if the hardware domain attempts to remove a PF with VFs
> still present, mark the PF and VFs broken, because Linux Dom0 has been
> observed to not respect the error returned.
> 
> Move the calls to pci_get_pdev() and pci_add_device() down to avoid
> dropping and re-acquiring the pcidevs_lock().
> 
> Check !pdev->pf_pdev before adding the VF to the list to guard against
> adding it multiple times.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -698,12 +691,48 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( info )
>      {
>          pdev->info = *info;
> -        /*
> -         * VF's 'is_extfn' field is used to indicate whether its PF is an
> -         * extended function.
> -         */
>          if ( pdev->info.is_virtfn )
> -            pdev->info.is_extfn = pf_is_extfn;
> +        {
> +            struct pci_dev *pf_pdev =
> +                pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
> +                                            info->physfn.devfn));
> +
> +            if ( !pf_pdev )
> +            {
> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> +                                     NULL, node);
> +                if ( ret )
> +                {
> +                    printk(XENLOG_WARNING
> +                           "Failed to add SR-IOV device PF %pp for VF %pp\n",
> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);
> +                    free_pdev(pseg, pdev);
> +                    goto out;
> +                }
> +                pf_pdev = pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
> +                                                      info->physfn.devfn));
> +                if ( !pf_pdev )
> +                {
> +                    printk(XENLOG_ERR
> +                           "Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n",
> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);
> +                    ASSERT_UNREACHABLE();
> +                    free_pdev(pseg, pdev);
> +                    ret = -EILSEQ;
> +                    goto out;
> +                }
> +            }
> +
> +            if ( !pdev->pf_pdev )
> +            {
> +                /* VF inherits its 'is_extfn' from PF */
> +                pdev->info.is_extfn = pf_pdev->info.is_extfn;
> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
> +                pdev->pf_pdev = pf_pdev;

As a general pattern, I think filling fields before adding to lists is preferable.
For now it doesn't really matter here (lock held here and while removing), yet
still: Thoughts towards flipping the last two lines above, perhaps while committing?

Jan

