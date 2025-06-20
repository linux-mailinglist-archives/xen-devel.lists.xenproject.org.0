Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23378AE13EA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020630.1396764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVL8-0004ei-Mt; Fri, 20 Jun 2025 06:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020630.1396764; Fri, 20 Jun 2025 06:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVL8-0004cw-JR; Fri, 20 Jun 2025 06:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1020630;
 Fri, 20 Jun 2025 06:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSVL7-0004cq-F3
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:35:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2fd7cd4-4da0-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 08:35:04 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so11363305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:35:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a31c6aesm3426677a91.41.2025.06.19.23.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:35:03 -0700 (PDT)
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
X-Inumbo-ID: b2fd7cd4-4da0-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750401304; x=1751006104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQCjG2G3mI5bncwzhBpJO9RhJHacW2+zmZ/+vnKm3rY=;
        b=dGUZjSNOr1P1QYNGpgFmEYGFGQUlMds/4/AUQGVl2bSshWLoa5yRDGlHUSQxuG+st3
         D/sIqd+rRd9AFgboeNHDim9PjECGpCrgTvHCVLtgRWyP9QhqyYphVRhLKLhlwUdeFBvh
         niMU9riF/dtqZndXtF/EAMvJEu+do805Mp7y8sBjV5QDbW3ialWO3tne9iU2m/QO5FlK
         xNrRqOxME4GI6CQN/cJl2ZrHz3HdVT4Ro0ofHOOqxY5gE4vyRbeH2t8ABuNGbDtQB5Gw
         QvNd+j1QLo2UnJL/epj2aq0+elFlIb1nhYrAiSb71mnRLXCb4RsMBaf+W4ZAZyhVqxFb
         e3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750401304; x=1751006104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQCjG2G3mI5bncwzhBpJO9RhJHacW2+zmZ/+vnKm3rY=;
        b=hOHitwFUTm89f90nXqGIaLf8Z+EG4BKuA/Fz+c4wS3A3hSvcaowVbY2Wb2tR6C70T/
         naXEGBaz0D1mlOUcxLWME6StxXTl7O+Crv5t9dTe1eF+0cCj1db5WTNJd2XX1YljNtDU
         xnTaeiqh692oqzph0ycTTfTMI/f/oxrYWsjet645qQLj8FYhc6Rkn1RyTGQPNteU+Obv
         38S8TJiVHJDJ97BHR8qMbb3eRl9VMotAx1adjp+55lV5238CmK5LNb8rsqKWO8I809q3
         vlwZRR9lz8RZH/Sw598I3SGM2p7/AvnciQ0hcb72VphMI8HreVtxPcdTs2ckG9Co7uoR
         JpNg==
X-Forwarded-Encrypted: i=1; AJvYcCXrJ0rCHQ5R9kEvVMawGUpIiyPAYNxew1JNemmlJ0qDIGlhv0ub68cADXeyVy4ltTnNJFe/TQbKvYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywq7Z3i986c7o73seoINnlTQWN4kviAdkQnVMLtWp2cpyD5j4Ru
	fqf6Y47sDzTLMBv50SeVnPkw9Hx39xV9eDRvdFZH46trc4N9r4ApDY/1KVSJPxYJLg==
X-Gm-Gg: ASbGncthHG5mwnIDL9q6G+KLwUXcY1Kun1qghBYN/h+LIYmcVu24PwZkACz9MayJfLC
	NkYpGoAmkoIXFLLDXpX2Zg3pRsg7HFm2ZrMbqiejvLVkEPBxLdSShENxd3qcm0h8gSEAjcGwjRG
	ayO1CJTsbTEbv5Ah3hLrdJUEryqpsf55pHPBAuUVG51of3W/pGsNy1f+xa9IVy1TQck0od4jONV
	Yq3EjW1/cZzJy59CeyB5wdmbBgLv29EJue6BHUk0ukNw/ptgJSYZkfnq8/6FRsTE03biUbkVIMC
	8c7Mw022W94BVXQ5n/xlzbrh+okeQ6bh03rOUstc0tV0WB3u6u/Xvy+2A1RMRW8/Ku9LY4XQYkz
	uIpTKCtKFIfcxXv6fxO2xpy26Sib1fbCWRddV1ZnnioQQD1E=
X-Google-Smtp-Source: AGHT+IF6p6vbQS9bwn7AUlIPDyKRazrAhEt9S9NC0XeU5J2L5hYNh5VQNs+6t4f7B/PsZDkjXlCbVQ==
X-Received: by 2002:a5d:5f52:0:b0:3a5:39d7:5d5d with SMTP id ffacd0b85a97d-3a6d12d52bamr1088561f8f.36.1750401303615;
        Thu, 19 Jun 2025 23:35:03 -0700 (PDT)
Message-ID: <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
Date: Fri, 20 Jun 2025 08:34:53 +0200
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
In-Reply-To: <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 08:14, Chen, Jiqian wrote:
> On 2025/6/18 22:33, Jan Beulich wrote:
>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
>>>  typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
>>>                            uint32_t val, void *data);
>>>  
>>> -typedef int vpci_register_init_t(struct pci_dev *dev);
>>> -
>>> -#define VPCI_PRIORITY_HIGH      "1"
>>> -#define VPCI_PRIORITY_MIDDLE    "5"
>>> -#define VPCI_PRIORITY_LOW       "9"
>>> +typedef struct {
>>> +    unsigned int id;
>>> +    bool is_ext;
>>> +    int (*init)(struct pci_dev *pdev);
>>> +    int (*cleanup)(struct pci_dev *pdev);
>>
>> Is const really not possible to add to at least one of these two?
> Will change to be :
> 
> typedef struct {
>     unsigned int id;
>     bool is_ext;
>     int (* const init)(struct pci_dev *pdev);
>     int (* const cleanup)(struct pci_dev *pdev);
> } vpci_capability_t;

Ehm, no. The question was for the two function (pointer) parameters. "const"
on struct fields themselves can be useful, too, but for an entirely different
purpose.

>>> +} vpci_capability_t;
>>
>> As you have it here, ...
>>
>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>   */
>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>  
>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>> -  static vpci_register_init_t *const x##_entry  \
>>> -               __used_section(".data.vpci." p) = (x)
>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>> +    static const vpci_capability_t finit##_t = { \
>>
>> ... _t suffixes generally designate types. I don't think we should abuse
>> that suffix for an identifier of a variable.
> What do you think I should change to?

Well, if you take my other advice, this question won't need answering, as
then you only need the ..._entry one.

Btw, noticing only now - why is it finit that's used to derive the identifier?
With that, it could as well be fclean (leaving aside the fact that that's
optional). Imo the name would better be derived from cap, and it would better
also reflect the purpose of the variable.

Jan

