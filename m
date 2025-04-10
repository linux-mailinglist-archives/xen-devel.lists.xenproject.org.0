Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD958A8428E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945508.1343704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qhx-0001uj-6Y; Thu, 10 Apr 2025 12:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945508.1343704; Thu, 10 Apr 2025 12:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qhx-0001rb-3l; Thu, 10 Apr 2025 12:08:37 +0000
Received: by outflank-mailman (input) for mailman id 945508;
 Thu, 10 Apr 2025 12:08:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qhv-0001rV-JB
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:08:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8605056d-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:08:33 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso431675f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:08:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89362d00sm4535420f8f.4.2025.04.10.05.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:08:32 -0700 (PDT)
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
X-Inumbo-ID: 8605056d-1604-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744286913; x=1744891713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/NEbbRxn/M2PCOfnGIBVW9pPiofX2V2LO0dwI2k9Jh8=;
        b=WVuEaD69TU+Wjpe6DBtir1Z9RAk2W/mV/D3sa9X2pzBx0gsNJ9PLQIgZOxvW7FSFfZ
         BMB1+3MMITzWSa4ElqhzzkOxS8KpoqpyQwmUdqIk6DDY8vAbAsPeg26Ju1a/ls0udKnF
         HM+LyI0LRVeikbSoe4wqApp8/2w1OrphB/p8Qc0nPlw/dxABRBid2coT1KUXa3q9Prsb
         9Yr6wc1rSP9eCf/DoKs/3/eQr31GJVPFjocMT5ShupqrVZ/LgD/BSLhE5QRTZuIOI0/R
         XtEIwfSZKa/UQUeJrZtsvIIo7HbfkESxAx0sQrauc8BPae6i4bsFodSSOrV5AbZ2sIt4
         nZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286913; x=1744891713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NEbbRxn/M2PCOfnGIBVW9pPiofX2V2LO0dwI2k9Jh8=;
        b=l8mMrzKMVuri3Enu1cri44ywv9b1KGdj9jx5AmumxoJgbK5NGPg4sqq0SNlAW0koIP
         amnQXGwOCmv3k+EU+HalFCHI1fvnfnso4j+KQNiNwMXNdhcxb5KQ2siuTpTh9J5Eo3/W
         3sVFwCsv6g9TFp1gp8SGikL1ZI6pwlUyH6QuxPBVr+wCN6spIAVul1UX3CeUd2woHuQY
         OXPntrtnCdNkmJ7sFndpCXs1jMU+rrvQQUkvK7y6mCkrNycRVwsc3+mZ7dA7no9rxBZ+
         j30uJYjvQQ3ry6p6xzTRs9KGbd2Gyg20NoNFJ694Mo0q+kg2ClvmumlDZTXi+ps4cDyG
         ULEw==
X-Forwarded-Encrypted: i=1; AJvYcCVjtM/AOPW+RZ+C3GcBRJqhUDtw+oJ0NlMvbDBfjDm50/HvyzPiTzn7JsZHpMMb1uQvEqifSu0Bg7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbxCQInL7/Y3j80rYxuk2u97cdBt8CakeZ0d9cqnCHOwwgC0Or
	satDdgOyi/R8T+um+9pN+iV5IlcsnFDbEzg0YQ5J9BY37aK/lIPDJm8v+/58DA==
X-Gm-Gg: ASbGnctuoTn7Qj8hxAZZbiosyDNjdQyhmCgBr+mpJvNLRFThZg3N8+5tbFrDgxnkkLO
	ZZJZo4s5ecD5Y9WczhwV0BnQNI45YUMfCVe+DNinIEWHzURMFT91Gq3FmXBHZMhyeI0fWT1S0/u
	K0hBfzHZ25Nff/VTLP5IGhIICPXV7XRAyBI3wsaraMPLK1Jcb8pmYxmipTITwS9piu+PHwKbL8R
	aB98mVRgiMZoCDhEjwMNsk8QaHFbfZrMeCMvEC187oVNRLTqu8Ip+uWBya3GAWeKJIexgw5/2EH
	DksfjjLmscKy8HxHJc1MxbDyJJJjPpxkmeGW29FPufkD2l8odFf6EhLNaSVDlge7m2h0WR6maI+
	fA1dysJ1/MZTmxxvSro1vU1Agug==
X-Google-Smtp-Source: AGHT+IFNZCgrYDFFexDJJlLHGQLjf+k3KtXBbQTqijQ9MdtTozukB90LDM2+gp0UJHI8jchZ7G5I7w==
X-Received: by 2002:a05:6000:4313:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39d8f2781f4mr2393724f8f.3.1744286912871;
        Thu, 10 Apr 2025 05:08:32 -0700 (PDT)
Message-ID: <c1e5af91-8f84-458d-a9b8-ab9758b5cbce@suse.com>
Date: Thu, 10 Apr 2025 14:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
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
 <20250408160802.49870-16-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-16-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Introduce the `cpus` property, named as such for dom0less compatibility, that
> represents the maximum number of vpcus to allocate for a domain. In the device

Nit: vcpus

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -246,6 +246,17 @@ static int __init process_domain_node(
>              bd->max_pages = PFN_DOWN(kb * SZ_1K);
>              printk("  max memory: %ld kb\n", kb);
>          }
> +        else if ( strncmp(prop_name, "cpus", name_len) == 0 )
> +        {
> +            uint32_t val = UINT_MAX;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )

And again the same nit.

> +            {
> +                printk("  failed processing max_vcpus for domain %s\n", name);

There's no "max_vcpus" being processed here; that purely ...

> +                return -EINVAL;
> +            }
> +            bd->max_vcpus = val;

... the internal name we use for the struct field etc. The user observing the
message ought to be able to easily associate it back with the DT item.

Jan

