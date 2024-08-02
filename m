Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79F94591E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770250.1181199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmx8-0007Kq-FM; Fri, 02 Aug 2024 07:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770250.1181199; Fri, 02 Aug 2024 07:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmx8-0007Hl-CS; Fri, 02 Aug 2024 07:43:54 +0000
Received: by outflank-mailman (input) for mailman id 770250;
 Fri, 02 Aug 2024 07:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZmx6-0007Ha-Pp
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:43:52 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f595a8af-50a2-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 09:43:50 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so11426880a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 00:43:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bcadbesm66721066b.21.2024.08.02.00.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 00:43:39 -0700 (PDT)
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
X-Inumbo-ID: f595a8af-50a2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722584630; x=1723189430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Vog9qZ6jd1ViTJ3mezsf00ZNC8hEM4KIDFT8Bn5TJc=;
        b=DmCq+ULx/XPfSbItq7bxkDtxaKFXB7f0jmC6YtZ39awZXwhr+FP5dUtV+uFfFlu/Wr
         B/KaMe06SbHWfznDdQ2DXd7HCo+FAsvsvvnyKjHUnleaEUicZUhSSU22BdOU3rJGWtrF
         fN590bCMJa+3F1Qt36uAxncAqfjBO0lYswB7IFQojc+aS9+SA+Da5Iqt8wkQT1r9BmmI
         SB/XdZquHrsAlUsYRX9LhJ175Wqi8oO3hxfZ8lSGH++chfNyCDzxiw+0x+c0kS0Q1W2W
         yroiXrnCf+zIEV7nlkIRRvbaMWJCnPP4l3DUM59B5iLpB8BAWG1jIq+O+dO68TpZgYoC
         OuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722584630; x=1723189430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Vog9qZ6jd1ViTJ3mezsf00ZNC8hEM4KIDFT8Bn5TJc=;
        b=UOV3U8agIX2tKWP6tXo2p3DqqpojAgOCOtPuK+/NGXHWX19qna9T7W3/pwqgpEKdF9
         wH3xjnmqT8zRDvn5CQ5Zbt/0mebWcld1Dg6sBmJy8q1ftg0yoQTag8ltGOCzb5scpMHc
         PMg1QiMx3+TTWeBP+HGb2Hitn/C/pAv8d7NouvRVJodEgMTVcBaeYc8Rym9jPIMwJLEo
         KxdVWPAOFVl7E8Fq7Z8H4VxUgNp4WuXazUs+oga1PwVw9Vcu35dAmj2FL2SX7sIg2KUr
         xXokT0sibjEN8cyQxlEmCe/6D9umuZ92dADSzUknhaSbWLwpsTIS/y2ArcYgqvJRwfST
         l+/w==
X-Gm-Message-State: AOJu0YwF5qeawzEInV3cb8oLqcB6NNCpLJgO0Bq0xiNTqUdMISDE2pMh
	4NHwDU9ZfxyK1UF+k3pzk/rMXIaVJDdxiz5/t/S00MlY5CMAFCUFZMnGAHowpw==
X-Google-Smtp-Source: AGHT+IGJ0S+aXBmpnhEylOEuPtPZezRqqCZFw5CMXk+zAQKRDMXdEF20xXuyz+Pop+PXwKkRUf5lxQ==
X-Received: by 2002:a17:907:94c4:b0:a7a:a3db:c7b3 with SMTP id a640c23a62f3a-a7dc4e47551mr176354466b.19.1722584619904;
        Fri, 02 Aug 2024 00:43:39 -0700 (PDT)
Message-ID: <7911fd44-d4a0-4a2e-8b1c-feaa163790df@suse.com>
Date: Fri, 2 Aug 2024 09:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
 <BL1PR12MB5849CFC87F0DB92864B54BE4E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>
 <BL1PR12MB5849038C59C54C9FC8FD8048E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849038C59C54C9FC8FD8048E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 09:41, Chen, Jiqian wrote:
> On 2024/8/2 14:25, Jan Beulich wrote:
>> On 02.08.2024 04:55, Chen, Jiqian wrote:
>>> On 2024/7/31 23:55, Roger Pau Monné wrote:
>>>> On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
>>>>> @@ -305,6 +312,15 @@ struct physdev_pci_device {
>>>>>  typedef struct physdev_pci_device physdev_pci_device_t;
>>>>>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
>>>>>  
>>>>> +struct pci_device_state_reset {
>>>>> +    physdev_pci_device_t dev;
>>>>> +#define PCI_DEVICE_STATE_RESET_COLD 0
>>>>> +#define PCI_DEVICE_STATE_RESET_WARM 1
>>>>> +#define PCI_DEVICE_STATE_RESET_HOT  2
>>>>> +#define PCI_DEVICE_STATE_RESET_FLR  3
>>>>> +    uint32_t reset_type;
>>>>
>>>> This might want to be a flags field, with the low 2 bits (or maybe 3
>>>> bits to cope if more rest modes are added in the future) being used to
>>>> signal the reset type.  We can always do that later if flags need to
>>>> be added.
>>> Do you mean this?
>>> +struct pci_device_state_reset {
>>> +    physdev_pci_device_t dev;
>>> +#define _PCI_DEVICE_STATE_RESET_COLD 0
>>> +#define PCI_DEVICE_STATE_RESET_COLD  (1U<<_PCI_DEVICE_STATE_RESET_COLD)
>>> +#define _PCI_DEVICE_STATE_RESET_WARM 1
>>> +#define PCI_DEVICE_STATE_RESET_WARM  (1U<<_PCI_DEVICE_STATE_RESET_WARM)
>>> +#define _PCI_DEVICE_STATE_RESET_HOT  2
>>> +#define PCI_DEVICE_STATE_RESET_HOT   (1U<<_PCI_DEVICE_STATE_RESET_HOT)
>>> +#define _PCI_DEVICE_STATE_RESET_FLR  3
>>> +#define PCI_DEVICE_STATE_RESET_FLR   (1U<<_PCI_DEVICE_STATE_RESET_FLR)
>>> +    uint32_t reset_type;
>>> +};
>>
>> That's four bits, not two. I'm pretty sure Roger meant to keep the enum-
>> like #define-s, but additionally define a 2-bit mask constant (0x3). I
>> don't think it needs to be three bits right away - we can decide what to
>> do there when any of the higher bits are to be assigned a meaning.
> Like this?
> struct pci_device_state_reset {
>     physdev_pci_device_t dev;
> #define PCI_DEVICE_STATE_RESET_COLD 0x0
> #define PCI_DEVICE_STATE_RESET_WARM 0x1
> #define PCI_DEVICE_STATE_RESET_HOT  0x2
> #define PCI_DEVICE_STATE_RESET_FLR  0x3
> #define PCI_DEVICE_STATE_RESET_MASK  0x3
>     uint32_t flags;
> };

Yes, with the last #define adjusted such that columns align.

Jan

