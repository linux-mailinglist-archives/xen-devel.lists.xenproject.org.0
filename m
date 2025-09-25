Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7CB9D7E5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 07:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129876.1469585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1erD-0003s3-OK; Thu, 25 Sep 2025 05:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129876.1469585; Thu, 25 Sep 2025 05:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1erD-0003pP-Lg; Thu, 25 Sep 2025 05:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1129876;
 Thu, 25 Sep 2025 05:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1erC-0003pJ-AL
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 05:49:30 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66cdf8eb-99d3-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 07:49:29 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so102867266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 22:49:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f86f974sm93334266b.40.2025.09.24.22.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 22:49:28 -0700 (PDT)
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
X-Inumbo-ID: 66cdf8eb-99d3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758779369; x=1759384169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+PIBE5q8wFs8PC7X+SaNo9tntrkpVIkUvLafSlsmqgY=;
        b=cBcbcgBzPCAEp/r7YR1Zfjx4mDzfesYQwHfyOf3V//WUNiZ6wWit6zvwcv1EVrhKpI
         So96pE64DolYpKpTpnx2CjlDo3+FDiHh/9Mjaoob9DHCOCLbTP6wDiBoHRyOR1npmqpa
         jeWGiWXZ+pEx2GKiGIlFoY2tcYQUUIl4Lxtw9zYqFrfdF2vlo4fXKpJIBcuEP3NZKGwT
         Sr7xgSgbHOG4gAzRDx9y2QTYpCi+H4/71QYVBgLUXDwJ36rn4knQndYDycN8xlM9vh5U
         xeF4Mt29Z8L/gx5TRPJhQRC0XIOB5gzp3l24utWVsvcXUSjKEmbTL3lq/NFm3r6++XRE
         xP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779369; x=1759384169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PIBE5q8wFs8PC7X+SaNo9tntrkpVIkUvLafSlsmqgY=;
        b=XuPzUFZx6dPuHSGvcq7rpbH8gDg6/ahxM/o+ck64q3/7CkgT7C5K9l5jzjcxhMqPZ6
         8SNkMcrZaMt3W94A3OhPXjYHEfX4IEW2yjEQAlHgBIh7SvgLsiF3pMWydgn56PhEOzRH
         IyonFv9a4t+Tx+ubZewig23DYw5CL1kte3R3lmnzBgFnwfLQmohz4dBGHLRF2wrcxzWv
         Hy9ddrQ09t3g2iv5/k5HgGPwuDH9PrKk19FqS7b090Y6BvZhAkzipS4pgqVGMzAjBeiA
         qchPjTYlSBZBOfiEdZrdSnwHTNBNFjfyKHlENsNRrtyDB41s/Klar//c/+YdJbFnFf5h
         Jx0g==
X-Forwarded-Encrypted: i=1; AJvYcCWklinL/zlrd1KLh7UA80B6RX9w23MGgUjrwDcBxLBBwTmsJAkwfPU2nD9/rodO6Mw6h9J/N3Ok794=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywaj/NgIFYtNuUhppRjHpVGN+3fBGQHz8jAIsQwXnDadSdAGkkj
	maLFSNTX2lXFeYOoY9HSQ2ePUZe7o7u9uwJgGzNK6oGcWVg3HwOpIAFiop+p0DotNw==
X-Gm-Gg: ASbGncvmkp/7FJwCOphcjNDtbIQt2eVa9betFH/VaXt+qHYWDHcxOoeCZlOKAMG5whT
	iBUIQlWEvLerqvWm/ffswGN7HImZeuwSc5kObHpBokQyAHp5wag5RMMaBUUGaZxrOF2iceuJsN2
	Bjq1zF3xmP5K0QEc3UmxxT68Hi5331QPDog5OgI5RHO0FM4ZySv/nUC/TNz7cWNwGIc3jyyZE+G
	ugGAQhhcUAG3ev8TGfELdVAhEvxXOcouTpd51P+N2PGHNrtx8LYEsbncb78dnCaF5KajIgadnVW
	nTdzIL443KR5KVFEUqqtQzlvq6EaDBBvtXqZW9qOVDS3LAUOwWJdIXHTqjpUAx2BdBV5IV8MPEm
	VcbLYgdXWSWqtz9/WHbsctkXJ2kJZ0K/zIoHzncfrcp3SytDp30yunB6PSShzOG2mVzGvpsqofY
	WSRij42rM=
X-Google-Smtp-Source: AGHT+IH2xcKyhUr+DJoZnuELcwsAOepRxs5FaqsHcYOF6VK9OEQZyqsq83u8jwP1ZHfdGHWHs4vNsA==
X-Received: by 2002:a17:907:2d26:b0:b07:b50d:df70 with SMTP id a640c23a62f3a-b34bd44061amr240888066b.34.1758779368623;
        Wed, 24 Sep 2025 22:49:28 -0700 (PDT)
Message-ID: <f4d71940-a23f-471b-9b72-f7978ead2b3d@suse.com>
Date: Thu, 25 Sep 2025 07:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250919163139.2821531-1-grygorii_strashko@epam.com>
 <5c495ffc-40c9-4c55-bfba-3e1c0d9955c6@suse.com>
 <74460196-3bf2-4927-ae38-dcb52755ff04@epam.com>
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
In-Reply-To: <74460196-3bf2-4927-ae38-dcb52755ff04@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 12:13, Grygorii Strashko wrote:
> On 19.09.25 23:49, Jan Beulich wrote:
>> On 19.09.2025 18:31, Grygorii Strashko wrote:
>>> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>>>       struct viridian_domain *vd = d->arch.hvm.viridian;
>>>       struct hvm_viridian_domain_context ctxt;
>>>   
>>> +    if ( !is_viridian_domain(d) )
>>> +        return 0;
>>> +
>>>       if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>>>           return -EINVAL;
>>>   
>>> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>>       struct vcpu *v;
>>>       struct hvm_viridian_vcpu_context ctxt;
>>>   
>>> +    if ( !is_viridian_domain(d) )
>>> +        return 0;
>>
>> I don't think we should let these go through, but rather flag an error.
>> And perhaps an intentionally exotic one (e.g. EILSEQ or something yet
>> more "odd").
> 
> Most of existing load_x() returns -ENODEV (for example pit_load() for !has_vpit()).
> Some -EOPNOTSUPP.
> 
> I'd be very much appreciated if you could explicitly specify err code to be used.
> -EILSEQ? or -ENODEV? or ..

Well, I did already suggest EILSEQ, didn't I? I merely wanted to leave open for
you to pick "something yet more odd".

Jan

