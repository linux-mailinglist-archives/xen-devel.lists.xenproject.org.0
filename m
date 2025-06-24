Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762AAE5EE6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023319.1399277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyqH-0004YU-41; Tue, 24 Jun 2025 08:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023319.1399277; Tue, 24 Jun 2025 08:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyqH-0004W1-0S; Tue, 24 Jun 2025 08:17:21 +0000
Received: by outflank-mailman (input) for mailman id 1023319;
 Tue, 24 Jun 2025 08:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyqF-0004Vv-VC
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:17:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4066c6f-50d3-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:17:17 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso4019755f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:17:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ecb2sm8352085a12.11.2025.06.24.01.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:17:15 -0700 (PDT)
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
X-Inumbo-ID: a4066c6f-50d3-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750753036; x=1751357836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YUpQR/bJOCZY0Vm4bTJ8ikZCpvMZ1XskOwbLdpJ+kQo=;
        b=F2hB2mH+U5sEBD3jBv6o00fc6sfWc6Cwul9Z/APYabRx6Z19vRSpgffPi1uhm8kFbR
         0tZ0nOpWklSJlNBR+DzNdL+Sq7vlENSeLwkehBFz8YySOIlS+LQE/spJpEwNb0fLzzhy
         dQ1VbRP98cNtufxuJKYKqHH+VFebZyE2UYzVYYYtETt6C6B1lMIjcfx1ZDMC7PlH4aZf
         DxT6bbfZh9UDaIW1PBOxlxxu4WCxJZS7AIrd1dN90XeVcRZM4Ag7DwescLhQ+qedR53/
         5vuh0yWTSGJK10j/SyZJuqnW3bOijfJmK56IuhmFhbYwGtCEc5ALIZTS49FM2TgIUW5o
         Y0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753036; x=1751357836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUpQR/bJOCZY0Vm4bTJ8ikZCpvMZ1XskOwbLdpJ+kQo=;
        b=RAvWdRgag5bbVZtAEERGwfGDl0f2r2LCOYPJRZ/mgeb5w51CWwHPURKWEPQM/uM8Ri
         q0H1Gb946Vvh+xoyUjMcXm7CpRer+/76kdmMO2puyQqoFjfq1NxILurlTKRiawP+R2so
         EdcP4x787Rp176d656ML+8ZJJ15nHcsMf+upkNNag2PyYPX3Qsup1nZi791KK1DdPz3D
         J/29dGC3tNzRMpXznL8m+keS3ZiSQEe6eBOeu4sA2st2vTLkDsUjg9jj2aPrrMoMpgj8
         V5H5ZxPw/FMvq74bFGDigPRp8MEAA8XWC5kC/bCVGC/3Zpw/FVCkCak77EkVazQN7BId
         6Jkw==
X-Forwarded-Encrypted: i=1; AJvYcCXfptIVU/RDXsAfkxQws6QwnpdwizTmEbpza2VobEigDHIApGsQJjrKPpl+NNpMDi1wKYxzfPwdnNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPg6qkKmjgdgw6J88E8Ww60DjmBCuBejuv+y02sz2SYwqpix9E
	qISeA+he/nIccjAPgJ5bu5BHZt/sftNd1Yqo+BsVuxkalr1+fp1+2/iol1UCCHKKQQ==
X-Gm-Gg: ASbGncvplXrt0tWCB0kwVjCFKoqmVLvbzKHF+FGTK9wiIGwltFDzH0/TGb3jGKyyPXz
	82RLaIgh4yteKJQDcoX0bejvM2aNMwf1i7wtXeOrNsH29ncZqHS7z+kBVzzT09Bf6zIAoTkRV6f
	4HYBzlaL8RHf8H921y38djNvVuYESVabPhgMhJLuFQyzUaVcgmg35juxA8/8TR7Iw08NxBBvKRq
	YDb7QG0oov22+kwpNHi/mzq/rXzFxZwPr1Si/csyQ5zmyl8eOy7bD9kZjnIhvKyd7P+tg8K8psu
	cDBcnk0IGAh0qTSHeMZ2PGxVjTZ9ogHj6egDvMq7zseOhtdBMmtK/pseZ1i7ylr8tgSkf51wN2u
	twodCjb5YrTRfwlSKTJhLEvq35+7iDP9OJ96c4TyJty2szvQ=
X-Google-Smtp-Source: AGHT+IFJ9yILQos1QLPUn6F6CddKlkR/cizG51ooi580OJ2CjYbYk9+09rD3G4k15g0d2fBAh7Jnog==
X-Received: by 2002:a05:6000:2908:b0:3a4:dd16:b287 with SMTP id ffacd0b85a97d-3a6d12e903fmr12734398f8f.19.1750753036388;
        Tue, 24 Jun 2025 01:17:16 -0700 (PDT)
Message-ID: <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
Date: Tue, 24 Jun 2025 10:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 10:12, Chen, Jiqian wrote:
> On 2025/6/20 14:34, Jan Beulich wrote:
>> On 19.06.2025 08:14, Chen, Jiqian wrote:
>>> On 2025/6/18 22:33, Jan Beulich wrote:
>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>> --- a/xen/include/xen/vpci.h
>>>>> +++ b/xen/include/xen/vpci.h
>>>>> @@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
>>>>>  typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
>>>>>                            uint32_t val, void *data);
>>>>>  
>>>>> -typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>> -
>>>>> -#define VPCI_PRIORITY_HIGH      "1"
>>>>> -#define VPCI_PRIORITY_MIDDLE    "5"
>>>>> -#define VPCI_PRIORITY_LOW       "9"
>>>>> +typedef struct {
>>>>> +    unsigned int id;
>>>>> +    bool is_ext;
>>>>> +    int (*init)(struct pci_dev *pdev);
>>>>> +    int (*cleanup)(struct pci_dev *pdev);
>>>>
>>>> Is const really not possible to add to at least one of these two?
>>> Will change to be :
>>>
>>> typedef struct {
>>>     unsigned int id;
>>>     bool is_ext;
>>>     int (* const init)(struct pci_dev *pdev);
>>>     int (* const cleanup)(struct pci_dev *pdev);
>>> } vpci_capability_t;
>>
>> Ehm, no. The question was for the two function (pointer) parameters. "const"
>> on struct fields themselves can be useful, too, but for an entirely different
>> purpose.
> OK, will add const both for the struct field and the function parameters.

If you add (or rather keep) const for the struct field, the next question is
going to be why the other fields don't have const. Imo it's only the function
parameters which want it.

>>>>> +} vpci_capability_t;
>>>>
>>>> As you have it here, ...
>>>>
>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>   */
>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>  
>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>
>>>> ... _t suffixes generally designate types. I don't think we should abuse
>>>> that suffix for an identifier of a variable.
>>> What do you think I should change to?
>>
>> Well, if you take my other advice, this question won't need answering, as
>> then you only need the ..._entry one.
>>
>> Btw, noticing only now - why is it finit that's used to derive the identifier?
>> With that, it could as well be fclean (leaving aside the fact that that's
>> optional). Imo the name would better be derived from cap, and it would better
>> also reflect the purpose of the variable.
> I considered this.
> I think it is easier to use finit, and finit contains the cap type, and the main purpose of this struct is to initialize the cap.

Yet identifier names should make sense for the object they name.

Jan

