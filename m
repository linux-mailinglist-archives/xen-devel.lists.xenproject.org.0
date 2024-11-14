Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822B9C87A8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836256.1252142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXBM-0000A6-Th; Thu, 14 Nov 2024 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836256.1252142; Thu, 14 Nov 2024 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXBM-00007a-Pi; Thu, 14 Nov 2024 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 836256;
 Thu, 14 Nov 2024 10:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBXBL-00007P-J2
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:34:35 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08481603-a274-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:34:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so4159315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:34:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae3128bsm1070522f8f.102.2024.11.14.02.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:34:30 -0800 (PST)
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
X-Inumbo-ID: 08481603-a274-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA4NDgxNjAzLWEyNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTgwNDcxLjI2NDI3Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731580470; x=1732185270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQcqdhWUVH4y/IRc/KGcURjU4F3lshCy5VAppvhlgc8=;
        b=f3GpG/liXNYN4zpOxSPocc2mvmvx8RoDT5x1Nw8f33IQlTGTz6jmk9ypdGJOv4NudG
         XvNL2k2oqfxWWZQsYIsPaDs/TJHrBiaHfJ9a+y9XWpJzpn3u29+T4B1s5SbCHlzhC9Y/
         pXvYMjsuw8Te1TqMjLilEHAQBJnm5G0ecQnLjn1kWRcuxM1wRTUgNnYZsbAcPq3CZ9aR
         QSQcNisQq96TfvOZqj4GxCsS78L7SIwfVtri+TWayy/+7uonS0HMxhEnihksXpuqPdhh
         HQr19z064d0Vx9hflTIcFjTXMX5mXjRycvV0w2Wp8G7CN1ppA08uzU5D0K0Oz7KOmzpW
         KLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731580470; x=1732185270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQcqdhWUVH4y/IRc/KGcURjU4F3lshCy5VAppvhlgc8=;
        b=EkzdiBRZpspPZQelPATov7DARj3roB8jiAKZb+Dp2UWSuDalUNSAUdTRAfEeGrvEAZ
         E05ZhzSLYDy1DcZezbkLDL/vyfgn69N82GTKcwW5SJhnsVd4ZgDoh2TR2LkisJNEVvdy
         pX7SfICYJdicwctdKoW/MERGHV+pd8g3/72QsvHYHmYBvsYbm2vwv3iV48ax1LD5bTcz
         zsmql3TeR9ZrL5R1o9w5CRHG1UEM1EaLFad7l+izVp6ipmSwrSxBZlSOd7BYkoX5u2xN
         0E1Ewobj5gLcFCq237CrGUQ4mwCkSxq9uUB8j/l1S0Q5wuQBm45dqIk4e9nYiqptC5Ir
         /ZRA==
X-Forwarded-Encrypted: i=1; AJvYcCUSYYoL53p7RU0xFkUjCj+miQVYLcJu/EzrKL9R2i1QUtp/Jx5q7Gwsm/3ISY5BkecTNv9kMD7mReA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxna/tlzOn9gAVnqtw3Cj2B0dh3JdcOA5uDLadLey0B7CVNsO9C
	BNaq7dPkLfpJlIvleArwAPno9Yf4lNr99FW0Tfv/qjoxIzE8Fp6FRspFhV2G/A==
X-Google-Smtp-Source: AGHT+IF46UPiGjtZH3ucI3OYn/Olvn5KtsAAG2g5V9JwjlqNL6pGvseM0S0ebrG8fj3616p+7eRv6A==
X-Received: by 2002:a05:6000:1f89:b0:37d:4e03:635c with SMTP id ffacd0b85a97d-3820df71d80mr4659361f8f.21.1731580470594;
        Thu, 14 Nov 2024 02:34:30 -0800 (PST)
Message-ID: <975e3dbd-40e8-49c6-8aab-7e7bde1a233f@suse.com>
Date: Thu, 14 Nov 2024 11:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
 <20241112205321.186622-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241112205321.186622-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 21:53, Stewart Hildebrand wrote:
> Add links between a VF's struct pci_dev and its associated PF struct
> pci_dev.
> 
> The hardware domain is expected to add a PF first before adding
> associated VFs. Similarly, the hardware domain is expected to remove the
> associated VFs before removing the PF. If adding/removing happens out of
> order, print a warning and return an error. This means that VFs can only
> exist with an associated PF.
> 
> Additionally, if the hardware domain attempts to remove a PF with VFs
> still present, mark the PF and VFs broken, because Linux Dom0 has been
> observed to not respect the error returned.
> 
> Move the call to pci_get_pdev() down to avoid dropping and re-acquiring
> the pcidevs_lock(). Drop the call to pci_add_device() as it is invalid
> to add a VF without an existing PF.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I'm okay with this, so in principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>

A few comments nevertheless, which may result in there wanting to be
another revision.

> ---
> Candidate for backport to 4.19 (the next patch depends on this one)

With this dependency (we definitely want to backport the other patch) ...

> v6->v7:
> * cope with multiple invocations of pci_add_device for VFs
> * get rid of enclosing struct for single member
> * during PF removal attempt with VFs still present:
>     * keep PF
>     * mark broken
>     * don't unlink
>     * return error
> * during VF add:
>     * initialize pf_pdev in declaration
>     * remove logic catering to adding VFs without PF

... I'd like to point out that this change has an at least theoretical
risk of causing regressions. I therefore wonder whether that wouldn't
better be a separate change, not to be backported.

> @@ -703,7 +696,38 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * extended function.
>           */
>          if ( pdev->info.is_virtfn )
> -            pdev->info.is_extfn = pf_is_extfn;
> +        {
> +            struct pci_dev *pf_pdev = pci_get_pdev(NULL,
> +                                                   PCI_SBDF(seg,
> +                                                           info->physfn.bus,
> +                                                           info->physfn.devfn));
> +            struct pci_dev *vf_pdev;

const?

> +            bool already_added = false;
> +
> +            if ( !pf_pdev )
> +            {
> +                printk(XENLOG_WARNING
> +                       "Attempted to add SR-IOV device VF %pp without PF %pp\n",

I'd omit "device" here.

(These changes alone I'd be happy to do while committing.)

> +                       &pdev->sbdf,
> +                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
> +                free_pdev(pseg, pdev);
> +                ret = -ENODEV;
> +                goto out;
> +            }
> +
> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;

There's a comment related to this, partly visible in patch context above.
That comment imo needs moving here. And correcting while moving (it's
inverted imo, or at least worded ambiguously).

> +            pdev->pf_pdev = pf_pdev;
> +            list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
> +            {
> +                if ( vf_pdev == pdev )
> +                {
> +                    already_added = true;
> +                    break;
> +                }
> +            }
> +            if ( !already_added )
> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
> +        }
>      }

Personally, as I have a dislike for excess variables, I'd have gotten away
without "already_added". Instead of setting it to true, vf_pdev could be
set to NULL. Others may, however, consider this "obfuscation" or alike.

Jan

