Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8DA8422E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945429.1343622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qWn-0002y7-GR; Thu, 10 Apr 2025 11:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945429.1343622; Thu, 10 Apr 2025 11:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qWn-0002wS-DN; Thu, 10 Apr 2025 11:57:05 +0000
Received: by outflank-mailman (input) for mailman id 945429;
 Thu, 10 Apr 2025 11:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qWm-0002wM-G8
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:57:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea3ac072-1602-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:57:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so397636f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:57:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f113csm4604847f8f.69.2025.04.10.04.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 04:57:01 -0700 (PDT)
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
X-Inumbo-ID: ea3ac072-1602-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744286222; x=1744891022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=do1Wi7oLFRJaRZvoXJnSSLBlYYEdKpoUKjqvoGJNm3o=;
        b=bR3G508Kr1GBqmLVL1tPV5G8R3xVXZl4c7dytitC7SyQ3yhbHf0JVw5Q3cokRyAZ+C
         8lNKjIo4WTbWgBGJIBHgLZQmZyr03PXihtc3jaIBGb5G0/zHX7KDj9fZVKGgN22do1co
         INUy8OcvG4MWct/WXJ2/v3ggLaiOl8m5DwLWpSLfgykHGxhO3EWY/YP3CZL+ZCtZwIPF
         lb/3zDb+PU7a0Z1AF0DCOgjT/DvQhW/6kpJxKioUQHcvT/6eJtdFFOoJZnjcPbKwnWDB
         6V3iiUi1KA1Vx5EVgA0ETW8m2jK1jj3Gu77y5ugQWSxAhp4AKaedGstiJWl/DfFzjgJ/
         SK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286222; x=1744891022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=do1Wi7oLFRJaRZvoXJnSSLBlYYEdKpoUKjqvoGJNm3o=;
        b=O0wCpC5CvitCGH2FpTybapW+Q3cC7B91xSgpAM3oCRLJQUyOEpiQs8fnGqO6Y/nPPK
         8q8FQwoEtOhx6j27b1XLt8TgQCbViOIKV7d0hGfCjcFWOj+iQZS0waTo5cGv134xbVFz
         NO/j934coCIUwmL0C47B+VHaDxdW7jA8fwEgXsa2IPeipFq24unj7eYpZJBhJ3T2IDP0
         6V1Z5YsQT36VXHieUm6Rs5HJOvOgc6JswZ3Chrf4Y1YV8GiDUbQQaTcNLuLojQp3XFDl
         hw1Jv2w8CgJOiequFkt0XouOGtOPKVDaN+5V2GzjPZkCz5hgDFKK2IOwjekfVSgNpD4A
         54Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWM8drOolXCKk9Skq5mjQIylspELR7YD3b8jcAncB9io/0hWnTTuLLs5xeI91YhfhlAB26XXT7J14s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/NVtD5HqHvCOcmtAx0Z/eWXoKOVs3zgKzL5k0OlCb8IBwAGuC
	rD/GOd/2RoE5/v7hHkFbNdmWSvk8Q8hI/HP2rv3eJtLD3At+Y3QXowP05HbqYg==
X-Gm-Gg: ASbGncuOdBknb9d1/j6lTr33s05nl8IA75inzXSIYDA4JEud9l/rI+I3czRcxQvalk0
	swSWYFM5F5IOiMTWmtxSdeh0SIc1hsUQRDnl0/JVcfePOsN1ehGZmM36uhfUh45zGioIMOqAd2G
	PlJ7Nt5r7c00vHn9DqdOEi25yDH6gzuwM0uMyIoExal7qivjTWnDkHJuBIhZwWSKFdbIBBy+N/b
	EXpTEDmEtArLRM54p509LuRC/pUBx6P3FY7mQ7HRXv/SB4lyRXLiaWkih+0ipeWxsEa5mr56WSF
	WCu2YmGyAUzbNKRifW6WzLcgiAOFVwA1dAZi9Va5KpvVVnBpdTzByseXoOHC5FDFMsJ1aiggitQ
	CfNEwJB6qUGpYYIfgFAiNGPtcOQ==
X-Google-Smtp-Source: AGHT+IEOjeR3Q5x4HFu/xD3K/NUTcrwv1T9mHd2Grxj9ZpEZOKSnVYpuXfFrVH9NBs+kFZ/3PyTs9A==
X-Received: by 2002:a5d:5f4f:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d8fda7660mr2006063f8f.48.1744286222057;
        Thu, 10 Apr 2025 04:57:02 -0700 (PDT)
Message-ID: <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
Date: Thu, 10 Apr 2025 13:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-14-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>              bd->domid = (domid_t)val;
>              printk("  domid: %d\n", bd->domid);
>          }
> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
> +            {
> +                printk("  failed processing mode for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +
> +            printk("  mode: ");
> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
> +            {
> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
> +                    printk("HVM\n");
> +                else
> +                    printk("PVH\n");
> +            }
> +            else
> +                printk("PV\n");
> +        }

My prior questions here remain: What's the significance of
BUILD_MODE_ENABLE_DM when set alongside BUILD_MODE_PARAVIRT? What about
any of the other bits being set?

Jan

