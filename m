Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A89F2E2B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857673.1269889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Mq-0005pu-66; Mon, 16 Dec 2024 10:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857673.1269889; Mon, 16 Dec 2024 10:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Mq-0005oA-3W; Mon, 16 Dec 2024 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 857673;
 Mon, 16 Dec 2024 10:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8Mo-0005o4-1U
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:30:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06f1c55-bb98-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 11:30:21 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so2946888f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:30:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801bb00sm7656051f8f.62.2024.12.16.02.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 02:30:20 -0800 (PST)
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
X-Inumbo-ID: c06f1c55-bb98-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734345020; x=1734949820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe3FOJmPSksOXmyBucYR8GgKOnpN39f2Q3+pJbrENks=;
        b=dM0zciDPWNgRXRbU4AifTjst/sVhpBeohYrwwt25Ff8uXQt9XNg6/ZG0Y4uggspkwk
         QHhMToErsZOsGsbMn4WROzCNF3M+Cw8izBN3KMDAxBNIPPikjb0smJFslXm96kmWl9/7
         gueJLAWkxjUq9VcXOTnghCltWfJHtw7q1fr4kdJVdolwxliEmh5R0j0dRh0YiNhv6M/O
         52fqGhIQ2HPFqdCcwj+XPG3jXZ04uWd+RkQPu7oQuaCVAQWToYLozGchMB9exjGjNzlN
         K2zvp/dL8oplbI6/7iY2SLnEyKnkbEZ9uy5xhK9IAPfYRd1c8Nos8QzRpqVVSaAank+s
         im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345020; x=1734949820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe3FOJmPSksOXmyBucYR8GgKOnpN39f2Q3+pJbrENks=;
        b=de/5W0LCxfuU15w5QfYwlFjck8cy1QbPIxO5T25H30gBFHEeAKkomu4BSQuuQ94aE5
         9FAfE/xbITo6EpfR+nkZJNwl4RimXrZqEBjiFgny31CljtjuTiOLbl9efb7YA1X9siRt
         dIZwiXAyB7gduen/ZBmZVpDFreJZhWbw6qi2v538y+pAyz2UVTJ3WKwYXVCcQp24oKs9
         J1h9vlPv9H9EbvEwqexC6ebLNMoC/LSNwlHzvpRD4yFSFt5QfSfl7lsh1Vqb5t8LF8XA
         J0vmOQiGCOuPobt3T8YodZGZ544xVLOHvI87txMF1GXCE/9z2A3+DzF8L7wO7DEHspQr
         /BFQ==
X-Gm-Message-State: AOJu0YwQZ3jrbA/WQHRqjVCYeH+QES4YMBDe9A2YrF8GVC6CLOIShE8q
	N8FIZgFt3394IT+JJzmsoyPwIKNNzAOCjL2okA3WHmHrq+k6Sx30e+rJV8NIuQ==
X-Gm-Gg: ASbGncspk9n2LJUWx7yuCHfdiUItkzXCTN+dXVOPRVR7qTS3T8//5MtpVtj7gV/DaW5
	Dz6Vf8GgjKsOfLFVU2Hj6krLx8H3KD9ovsZh+WPpbQBMqZW7tXX6DMOtTydlIpZDEl0yIqVy68O
	WhzCPLGf4nbFcMlX2RShQKC2uaDeqMjYTcZvIqjMvhFz+8GvfOvGYIFXrfBza0I9YC57wc96+6h
	57gQ35Ztb4AUpNLOUzHYQx8rjeGDcLUHf0q6XpCeTL7B9OR2dR5aiNRL5lpy0yXQP+e9beCVpJQ
	ieQK6N4EEMVxtyh9efchudjDpVM6m/NWAfebgkDoTg==
X-Google-Smtp-Source: AGHT+IGhfMj/Fwz6l4IANvZ4VACgxfhv+8KRu1kxz2qNjfFnzorfImoGQdNIJA7WB9alz6otwp0h/A==
X-Received: by 2002:a05:6000:18a5:b0:385:e43a:4ded with SMTP id ffacd0b85a97d-3888e0c17f8mr9283915f8f.57.1734345020584;
        Mon, 16 Dec 2024 02:30:20 -0800 (PST)
Message-ID: <0773afe1-e892-4df5-a19e-25c55458e5cc@suse.com>
Date: Mon, 16 Dec 2024 11:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <Z1__--RWN68hsOCX@macbook.local>
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
In-Reply-To: <Z1__--RWN68hsOCX@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2024 11:24, Roger Pau Monné wrote:
> On Fri, Dec 13, 2024 at 01:42:32PM +0800, Jiqian Chen wrote:
>> +static int cf_check init_rebar(struct pci_dev *pdev)
>> +{
>> +    uint32_t ctrl;
>> +    unsigned int rebar_offset, nbars;
>> +
>> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
> 
> You can do the init at definition:
> 
>     uint32_t ctrl;
>     unsigned int nbars;
>     unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
>                                                         PCI_EXT_CAP_ID_REBAR);
> 
> 
>> +
>> +    if ( !rebar_offset )
>> +        return 0;
>> +
>> +    if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        printk("ReBar is not supported for domUs\n");
> 
> This needs a bit more information IMO:
> 
> printk(XENLOG_ERR
>        "%pd %pp: resizable BAR capability not supported for unprivileged domains\n",
>        pdev->domain, &pdev->sbdf);
> 
> I wonder if this should instead be an XSM check, but that would
> require a new XSM hook to process permissions for PCI capabilities.

Ultimately perhaps, but right now we need to bail here irrespective of
XSM policy, as the DomU side simply is unimplemented.

Jan

