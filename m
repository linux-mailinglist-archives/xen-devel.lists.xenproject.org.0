Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19865A68D0B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920597.1324719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusg5-0004Sy-On; Wed, 19 Mar 2025 12:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920597.1324719; Wed, 19 Mar 2025 12:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusg5-0004R3-Lb; Wed, 19 Mar 2025 12:37:45 +0000
Received: by outflank-mailman (input) for mailman id 920597;
 Wed, 19 Mar 2025 12:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tusg3-0004Qw-J6
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:37:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f310e88a-04be-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:37:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so26607095e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:37:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed4b8sm17528015e9.35.2025.03.19.05.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:37:40 -0700 (PDT)
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
X-Inumbo-ID: f310e88a-04be-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742387861; x=1742992661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zW8AAiLvPavScJHF7PGuNOQ3Ob33s0PgoQWxY98nWgA=;
        b=Qnr4/jlwO04tarrmgr8QGUJup2g0IoFYi/4xmm0sw9R/Rq55k+CckfLaGeqoSPhGgC
         nlblSilIHqpwjiMFT4bYVQyyljQAG02pKOAxxzN/LU8WXXdxJRG8orX3XhCSMOMBgqpj
         bkvcOPICbsYwkplPRZcyqZZf7/zBc77by3LEGqlZFwTx+1JTIWv2Vzszx5Lbitg7CIEO
         Y27e67YOzauxhh02GmlPRxWguvbod73azQcZXzlBnDTGEVx9mwv9vSWGAvAOzPTEUqp1
         LlqOpChhHgvYVv09eWYe/oup5CuR6leXGW/8bnEDTguXDEBwX/14mLHCak/b+itm7xkb
         sg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742387861; x=1742992661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zW8AAiLvPavScJHF7PGuNOQ3Ob33s0PgoQWxY98nWgA=;
        b=MPva9HRsxAOGQEqWcss+0hPH78V2MEiu07Bn1R8nJT00CvEGLuz/LP2URZyKutFhZX
         UvPo8FlzgU6fMj/2Ma4Kbloljj2hqk/fnf4uPbgSxPfUaUUP7SV/beVT0iZ/gNDhihTm
         vHepik+L2oX0UdkmRaT8mL5ZrUGm67+TtwxgZTIaR9Jcc7PFDOPyFZX98SuO0jFDMO/w
         aV1NuyjVmmjqD9XbZbPHRIbmMkfjGyru5GWrPLEnPe/AgoXWi3k6RFKcH0C3gG3/OvHa
         j2opZ+Ls6yOm2E+OeMsS9TfoOivj5Q+AWm6sH98N51+H7fuC1UO+mLzePwjerdz/1BoL
         ww6A==
X-Forwarded-Encrypted: i=1; AJvYcCVxeN4f3WD3e0PGk+HPcxCy8N64Q/4WPFlUU5Y9sR/hXCPJbKZlnkerjKT19qdMIcRsaKlue5cRG4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbQhh6ixOjYY8zO8OgX/PXheh0cngGdIdclwx8bGs/mFvJndsc
	Znd0f4io+YRNWRzy6sIKINmhdhETtE69bXZDIR2InUhWJLvkENyCURE2k8uyPw==
X-Gm-Gg: ASbGncvOaIkc7z1RVlBjQm+2fUm+3P2PaHYWwjr8OXlP8w+cNZKReQgpls+1vZiVGUq
	9V0xZmge9Amlq+uxZNRTEQPJgE9pD8quA/1m3ibp4pCgDBBauXyXmvaC4CWOT08knFyoGXrdQps
	+KOyqdjP5GuyWQk6E+6zgy0ZbqVRDpUQYPqgRaWhd3Hl3SObAln+wjEIfTwOz56SxiStlrDqI++
	WXaIbSBPEjz6MSv/l2wJd09aFO2Q0iiyTByqng5peRN1ncf3iSb+TjL4IY38lc5LGga5RdocT2L
	8Uys4R/hwvrJCvdOamSCuxsX6eipXZou1GlIzMEeaU48/YrsYNE0nNhQPZH5efCF56rkusKbt8f
	ZltaRmvDdsefS7LSGLOj1J40cOZoGNg==
X-Google-Smtp-Source: AGHT+IEzCRgBlX4h1SZamsrR0Zm72O6X+0kg96UfPGMP1vbOiA0hzNCYGE6+5caIdw5DZe6uLjfcPA==
X-Received: by 2002:a05:600c:1da1:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43d437c3379mr25580095e9.18.1742387861128;
        Wed, 19 Mar 2025 05:37:41 -0700 (PDT)
Message-ID: <7f523597-cf70-4673-b4a2-fac602253a9e@suse.com>
Date: Wed, 19 Mar 2025 13:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
 <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
 <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
 <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
 <19d8224a-04e0-45bb-9471-abeb684e9cad@epam.com>
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
In-Reply-To: <19d8224a-04e0-45bb-9471-abeb684e9cad@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 13:05, Mykyta Poturai wrote:
> On 18.03.25 16:26, Jan Beulich wrote:
>> On 18.03.2025 14:31, Mykyta Poturai wrote:
>>> On 18.03.25 12:11, Jan Beulich wrote:
>>>> On 18.03.2025 10:10, Mykyta Poturai wrote:
>>>>> On 15.01.24 11:35, Jan Beulich wrote:
>>>>>> On 14.01.2024 11:01, Mykyta Poturai wrote:
>>>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>>>> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>>>>>>>     };
>>>>>>>     typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>>>>>>>
>>>>>>> +#define XEN_DMOP_inject_msi2 21
>>>>>>> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>>>>>> +
>>>>>>> +struct xen_dm_op_inject_msi2 {
>>>>>>> +    uint64_aligned_t addr;
>>>>>>> +    uint32_t data;
>>>>>>> +    uint32_t source_id; /* PCI SBDF */
>>>>>>
>>>>>> Since the comment says SBDF (not BDF), how are multiple segments handled
>>>>>> here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
>>>>>> and are local to the respective segment. It would feel wrong to use a
>>>>>> 32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
>>>>>> (segment and source_id).
>>>>>
>>>>> I'm planning on resuming this series in the near future and want to
>>>>> clarify the DM op interface.
>>>>>
>>>>> Wouldn't it be better to keep things consistent and use
>>>>> XEN_DMOP_PCI_SBDF as it's done in xen_dm_op_ioreq_server_range? Also
>>>>> with this, the value can be easily casted to pci_sbdf_t later and split
>>>>> to segment and BDF if needed.
>>>>
>>>> The essence of my earlier comment is: Naming, contents, and comments need
>>>> to be in sync.
>>>>
>>>> I question though that "casting to pci_sbdf_t" is technically possible.
>>>> Nor am I convinced that it would be desirable to do so if it was possible
>>>> (or if "casting" was intended to mean something else than what this is in
>>>> C). See my recent comments on some of Andrii's patches [1][2].
>>>>
>>>> Jan
>>>>
>>>> [1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01294.html
>>>> [2] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01301.html
>>>
>>> Would something like this be okay then?
>>>
>>> struct xen_dm_op_inject_msi2 {
>>>       /* IN - MSI data (lower 32 bits) */
>>>       uint32_t data;
>>>       /* IN - ITS devid of the device triggering the interrupt */
>>>       uint32_t source_id;
>>>       uint32_t flags;
>>>       uint32_t pad;
>>>       /* IN - MSI address */
>>>       uint64_aligned_t addr;
>>> };
>>>
>>> Added padding and explained source_id purpose better.
>>
>> I fear the comment is far from making clear what layout source_id is to
>> have, hence also leaving open whether a segment number is included there.
>> Of course the issue here may be that I have no clue what "ITS devid"
>> means or implies. What is clear is that "ITS devid" is meaningless on
>> x86, for example.
> 
> ITS devid is implementation defined. Its size is also implementation
> defined but up to 32 bits.
> 
> Quotes from Arm Base System Architecture[1]:
>  > The system designer assigns a requester a unique StreamID to device
> traffic input to the SMMU.
>  > If a requester is a bridge from a different interconnect with an
> originator ID, like a PCIe RequesterID, and devices on that interconnect
> might need to send MSIs, the originator ID is used to generate a
> DeviceID. The function to generate the DeviceID should be an identity or
> a simple offset.
> 
> On the Xen's side it is used as an offset into the ITS translation
> tables and is sourced from msi-map nodes in the device tree.
> 
> Practically for PCI the requester ID is usually the SBDF. Where the
> segment is used to find the host bridge node that contains the msi-map
> node with defined offsets but it is also included as part of an id.
> That's why it was originally called SBDF in the comment. I don't know if
> there is a better way to describe what it is concisely in the comments.

If this is to be usable for other architectures too, it may need to be
a union to put there. With appropriate comments for each member.

Jan

