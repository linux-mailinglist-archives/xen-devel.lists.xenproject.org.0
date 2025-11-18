Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE08C6A132
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 15:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164876.1491739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMx3-0006QG-87; Tue, 18 Nov 2025 14:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164876.1491739; Tue, 18 Nov 2025 14:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMx3-0006N8-44; Tue, 18 Nov 2025 14:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1164876;
 Tue, 18 Nov 2025 14:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLMx1-0006N2-9e
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 14:44:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 277a0c56-c48d-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 15:44:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so9925783a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 06:44:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f880fsm12946303a12.11.2025.11.18.06.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:44:56 -0800 (PST)
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
X-Inumbo-ID: 277a0c56-c48d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763477097; x=1764081897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ucow77cbI8N4lr6/qwzGUs/Z9NiazRSQJfUlUtdrAAM=;
        b=WojvoSnXqd7lj2g2Z/WE4Z76MpzEvsFnbAZSa2mdQ4g1cccJdl4g9qMCrlodKbPbMy
         T8m3sMHm9KVDbexVHjx7QIsY2uJ8UjaiUn7WL+i65nghVYKwnbt3EtrOQ/GixYznOG5t
         502d5S/CTPGf10UtRYMAIfmfNfBP0nUC7fsjouFJ/3AcKD3vci1fKPv7+8KjMKRl2/D2
         fU3zyNMZm/+xyXity11Fii6Gu/0qR9IcZypg0FUD1zOjXgIgd141t+7Sd0lUEFUhOWue
         9vHbmEoq1Fjxx/CaHVKdIbZiuMt2C/CbnKNKObitwnAXrDU6Mx+gOSy8w1ZL9MpajNzA
         KPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477097; x=1764081897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucow77cbI8N4lr6/qwzGUs/Z9NiazRSQJfUlUtdrAAM=;
        b=S9MmZIuh9HA7Z9A1Vr592gWo0gGzRIH3tWULb6k6H2hjvuaS2NX/6FLnfyp7jtin3O
         1gC+Z08UtQY/6ZuT/RPjmmkIo5N/L7fZjvButEC4wvmUOKK5qX1ZzptM3BdMPPeEDecO
         a915y6xmVNT5LLQbsqY1f182OcLISpuq+qUDFW59waw6Px/notDV24lpIxsrx5+BEXOU
         YHpGkQ47gJ/3E5oLHHzzb3TTWkiEgNqmYCeN2X9/luWzmmWUxcMiXZa2Q7jp9Mh3JQAo
         lnrh6pm2kQNyw60tvHrfRGX4vVPCzyogoQYEO7m2fav6P1dmGxr+7NfpuK4lYlHoJHa8
         lKng==
X-Forwarded-Encrypted: i=1; AJvYcCWAs6TRjcMZamh29GHEoWkU1QJ4AvwiDqCvAT7qFbdnV9Xinozu5CXN6xIu21yX9unZ6ccRn/dlKkg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0DbNIDkMAQDT658T35x+AyFq3StY+YebExRqpqt6Q9LrySslP
	iLcXRWZpadmUQSXS/aVA/blR6CQtacMOk539Y4ahVpz55+FaGKglPrb/2dEZVkl7wQ==
X-Gm-Gg: ASbGncvU79QcSGL4v2fksbJz6YhLLO0FENAN8W/t6S8gTiw62b1XA5OIfq47Ap0vPUf
	3/VH2UbSHmGeAmqQQMeaHhwzuYR2+TtHOvSbHPZWNlTRGAjFdUGxVrfTmIk6oaYNAfnb9pS1bcO
	F73MT1SH1AZ9dbA6VvWxisq7I/+wasok1B9w6A2IlKXHzX45BCIxkBMcyCreX8ixrZBwgedFOxD
	q9FyRwtbSKqDZeclZt/sqKjcDlcKF7Rf9vd+iLA37EcCpxnXtIBrgwVYXREbQFIdBNZ2RZtaB6I
	aFj11+avj9oSpRefnZlOnfwEW2w74iWz1WH0Cl2JWXHiHTKVgy+UiOSSlmEXe8LYX1WU8Eiks2H
	1xjbmDpRx8/uwaN6Yi1Pt32p5hXZK4d07BKix/z++7Inb7DbFeXH6bYuwZg/nyr3ZFiDTwfRBFF
	BmEGsOY3NO7hMMV8qm87kKskNy1LrYTSkJsAO8JfVfgIvTUn7fmdaqPpUrwCIKUYZM0vmWbiyy2
	HlrOGVSKHO8QQ==
X-Google-Smtp-Source: AGHT+IGqnm97LrN6tMHIFyAVw+ZcaKuFEukctFTS3uV4dEkCIhJyDwTvwxx511U/p0/TOuttMVtyJA==
X-Received: by 2002:a05:6402:13c8:b0:637:e94a:fb56 with SMTP id 4fb4d7f45d1cf-64350eb9461mr17734463a12.35.1763477097573;
        Tue, 18 Nov 2025 06:44:57 -0800 (PST)
Message-ID: <0b6a62c4-969c-4dd9-be72-064d8971910e@suse.com>
Date: Tue, 18 Nov 2025 15:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] xen/pci: assign discovered devices to hwdom
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
 <af67b9cbc1dff78440afdd15ebe1856fbebe98e1.1763462211.git.mykyta_poturai@epam.com>
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
In-Reply-To: <af67b9cbc1dff78440afdd15ebe1856fbebe98e1.1763462211.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2025 14:36, Mykyta Poturai wrote:
> @@ -1041,6 +1042,12 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>  }
>  
> +static bool __hwdom_init pdev_is_endpoint(const struct pci_dev *pdev)
> +{
> +    enum pdev_type type = pdev_type(pdev->seg, pdev->bus, pdev->devfn);
> +    return type == DEV_TYPE_PCIe_ENDPOINT || type == DEV_TYPE_PCI;

Once again - blank line please before the main return of a function (or, for
that matter, between declaration(s) and statement(s)).

> @@ -1221,6 +1228,10 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>              if ( !pdev )
>                  continue;
>  
> +            /* Hide real bridges from HWdom when it's using the emulated one */
> +            if ( has_vpci_bridge(hardware_domain) && !pdev_is_endpoint(pdev) )
> +                pci_hide_device(pdev->seg, pdev->bus, pdev->devfn);

As said elsewhere, when you hide bridges without introducing virtual counterparts,
everything behind the bridge also needs hiding.

Jan

