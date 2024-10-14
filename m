Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791299BFFE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 08:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818417.1231736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0EXL-0000oF-Pm; Mon, 14 Oct 2024 06:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818417.1231736; Mon, 14 Oct 2024 06:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0EXL-0000lA-NB; Mon, 14 Oct 2024 06:26:35 +0000
Received: by outflank-mailman (input) for mailman id 818417;
 Mon, 14 Oct 2024 06:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0EXJ-0000l4-Ue
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 06:26:33 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40e20315-89f5-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 08:26:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43058268d91so36752795e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 13 Oct 2024 23:26:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7edebfsm10428658f8f.98.2024.10.13.23.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Oct 2024 23:26:31 -0700 (PDT)
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
X-Inumbo-ID: 40e20315-89f5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728887191; x=1729491991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7sjrvZxe02GtRHTorA7slIsi4zGYRseKcSlrWTPapQA=;
        b=BYJbvRwpzf4WQ84u5ZdYLI7oYfz9Q86hH78AKDpc4h/AHf/5oRr0fhDdu6X7iM14pT
         TuKVX1TeEtCxLZGZ8BQdOoc1Sv5wOX/oVXLLaQdsCDRIc44TaXncE7vdCeGSU3EoBjCh
         tLRgADad4zRnmZ1kjoR2tTj6oYawO9c8AhXlXZBw3elpE4ATJuSNEQyO3TRn7p5Dj55Z
         EGLLuUd0oWzdb8UXR3nbiHbbXubTlp+f1j/CsGWbVrRGIpKlZCzWYz84cO0I3bScksby
         Lqu6IneD7VeBYi1cg+T+PTYIozmnzzoftZGSpLYusTm90ozZHAjuPOLtrdud14Y5URRQ
         /eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728887191; x=1729491991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sjrvZxe02GtRHTorA7slIsi4zGYRseKcSlrWTPapQA=;
        b=ZP1wwTRMi4eu+lLzlOF19XiyPLifc74LbWBJUnihkVhtJeCw5cKhfCJSRhVYxjBcCo
         wQzXt9LdsICHRQex/TT1rxPEMLJa04M54MwvNMMI7DOjVIdIyD1yiTnjrc9NLeCr08gv
         rjd8ucbxqbI9lzSAhgoJnQqWIDGTGy2Fm1AAF02fJWFiygQOjmXAMsx64eceAUyrtD5U
         D/GEu6fgN8U7rgMmSfB2q9VVrp72o76uqM5PmxI9Lc4zkcJYLOHz1oHV3gY9ROdYAfxv
         PEiKePnBU2UyXh/S0lwZ5XflrDGEbHqi3rwPzETZoKocMp55wFCR1tzEulR0qvY3PoJY
         P5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUvCdzjnQzCJ/aacqrjSA6XVLyra/v+9cp5YJYzgFm4cHc4kAZLcRxh39qcfQFS2G/+445WFwygJ5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLVs/YTFGLUKiXCxt+oyZqsfr/rfanPHqOrpflYtfiK4LItvNL
	hKiXmz9rBsDq706L01dgxJwWPbnU1DYCzlSuOXUZZ3uGZf1/znUZbiwPz8bTnA==
X-Google-Smtp-Source: AGHT+IFbcFVpk9yWP+iCtD7fKgy9hgYZPeoPNCFB8BH0pxWF84xBYymqV0Y/GYve2yYmGdFrlbxArw==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b95c:65ba with SMTP id 5b1f17b1804b1-4311dea3c4emr92301585e9.6.1728887191651;
        Sun, 13 Oct 2024 23:26:31 -0700 (PDT)
Message-ID: <63633a26-3b9a-4d74-96c7-3528ae0c504f@suse.com>
Date: Mon, 14 Oct 2024 08:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] tools/libacpi: Use LUT of APIC IDs rather than
 function pointer
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-7-alejandro.vallejo@cloud.com>
 <28e07993-9463-49a5-ba75-e012056e5ab2@suse.com>
 <D4T423OR4IAU.D5ZUN0WIO0UK@cloud.com>
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
In-Reply-To: <D4T423OR4IAU.D5ZUN0WIO0UK@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 18:17, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 3:25 PM BST, Jan Beulich wrote:
>> On 01.10.2024 14:38, Alejandro Vallejo wrote:
>>> @@ -148,7 +148,7 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
>>>          lapic->length  = sizeof(*lapic);
>>>          /* Processor ID must match processor-object IDs in the DSDT. */
>>>          lapic->acpi_processor_id = i;
>>> -        lapic->apic_id = config->lapic_id(i);
>>> +        lapic->apic_id = config->cpu_to_apicid[i];
>>
>> Perhaps assert (like you do in an earlier patch) that the ID is small
>> enough?
> 
> Actually, I just remembered why I didn't. libacpi is pulled into libxl, which
> is integrated into libvirt. A failed assert here would kill the application,
> which is not very nice.
> 
> HVM is already protected by the mp tables assert, so I'm not terribly worried
> about it and, while PVH is not, it would crash pretty quickly due to the
> corruption.
> 
> I'd rather have the domain crashing rather than virt-manager.

Fair enough.

Jan

