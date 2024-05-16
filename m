Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B48C7405
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722950.1127362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xep-0004l3-9U; Thu, 16 May 2024 09:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722950.1127362; Thu, 16 May 2024 09:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xep-0004i7-6D; Thu, 16 May 2024 09:44:15 +0000
Received: by outflank-mailman (input) for mailman id 722950;
 Thu, 16 May 2024 09:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Xen-0004i1-W0
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:44:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d971b0a2-1368-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:44:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5731ffcc905so3460809a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:44:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8a55f2e8sm279374766b.126.2024.05.16.02.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:44:11 -0700 (PDT)
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
X-Inumbo-ID: d971b0a2-1368-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715852651; x=1716457451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwPUykx1X9pX6Ql4hdD+Q07RasmI59xDJhwjudis6nI=;
        b=J6ZuAeMz1vE+fwkzx5iorzO1026S2QVhNvQ7riGO+kC39cP6aghpYnYQIeszVBFLay
         Lr5LBdnW0ic2sDu8EKVkpus8gx705L5GMtYPll4bV8Ebc7y65BC1hjPUxodMIddOT5X+
         1ExZk5jIBIbwZ6KVaOR+5f8MER1a2ExtvalJpFL7zeMfzom0/Xf1+wL4+7zbb3jaJkoy
         lRhQkVx1GkE8qxrsatdd/HL4fSG6IW2JTyE/CxV27OY4SJBOCNpQdMFMRC2kwqPhL7Rn
         LaLVjM68rBCVGZXM9XHiu1H3d5Rq5i3qXduUEdgzQ/ESFSojNd78W55xkOsIGSUsY5fa
         c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715852651; x=1716457451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwPUykx1X9pX6Ql4hdD+Q07RasmI59xDJhwjudis6nI=;
        b=bXxgdDcbsJ7bcbhzf6w4S08une8A8CPVPlkyfAickQp5bv7CrhCxxRYR6aArqAmfSk
         mJDHfHjc3nYhZboc+/jk/TVj4gO271KiiABocwMT8yGfISQvw/b2/aPwJpeJ77xInxSG
         RwEZ4hytfFa+IyWmhqL1hWhBMtwCSBXnfzQhTJ0D62O3x7U3g7VySYYbcn2tq4jE/gST
         EG2Zs6Wp4Ms49gmobjIRWRbhtS8tcP/pPR/ZQ3RfNDBqufS2aWDrVUwvBA0nr2WrmIp2
         S3QUMXaENYxk3UpB3pTYfvRZOPQNhHLG6YL5k7KbbTbj++IEznjzXhDoeUO7F/D7KrKD
         bHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Zh7iv1uOEM7h3fHOLn0VO+J3joTQtHbD926VHwsQ8rvaMv9Ra6Mtqim+A5wIw/hnWcqArEqC652bL4gs9Z6X8H/IoERtf+0+8eDvitc=
X-Gm-Message-State: AOJu0YzNWPXLkh3xBVIlkjiYtY5EsqsSONSJrHc+cCZIzIhBTTsl55WE
	6bVLLNCmCaRgLtxmEGgbt/qRRM+upH8CX9uOmXu6gd2VbEsMbD3vKK5p7PwvYw==
X-Google-Smtp-Source: AGHT+IFeTAPs8gquwPfYVcg5IcYeVDhDVWUtgbnw16PzBGMUKX4lX9h4GSJzPbNrwbKl1Gms0+TB7A==
X-Received: by 2002:a17:907:3f28:b0:a59:bd78:34ca with SMTP id a640c23a62f3a-a5a2d5c89f3mr1458778366b.36.1715852651355;
        Thu, 16 May 2024 02:44:11 -0700 (PDT)
Message-ID: <7cffa5fc-7e23-4acf-98c3-56929025bbd9@suse.com>
Date: Thu, 16 May 2024 11:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/6] x86/MCE: add default switch case in
 init_nonfatal_mce_checker()
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <01aad263ad60f37ed74138b5abf2733361bb7d25.1715673586.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <01aad263ad60f37ed74138b5abf2733361bb7d25.1715673586.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 10:26, Sergiy Kibrik wrote:
> The default switch case block is likely wanted here, to handle situation
> e.g. of unexpected c->x86_vendor value -- then no mcheck init is done, but
> misleading message still gets logged anyway.

With "likely" dropped I'm okay with this as far as the addition of the default
label goes. However, ...

> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
> @@ -29,9 +29,13 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>  		amd_nonfatal_mcheck_init(c);
>  		break;
> +
>  	case X86_VENDOR_INTEL:
>  		intel_nonfatal_mcheck_init(c);
>  		break;
> +
> +	default:
> +		return -ENODEV;
>  	}
>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>  	return 0;

... converting this to an error return still isn't justified. On one hand it's
benign because we still don't check return values from initcalls. Yet otoh it
isn't really an error, is it?

Jan

