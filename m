Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CFA6764D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 15:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919181.1323687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXtd-0006je-KJ; Tue, 18 Mar 2025 14:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919181.1323687; Tue, 18 Mar 2025 14:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXtd-0006hU-Gy; Tue, 18 Mar 2025 14:26:21 +0000
Received: by outflank-mailman (input) for mailman id 919181;
 Tue, 18 Mar 2025 14:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuXtc-0006hO-L8
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 14:26:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3354d57-0404-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 15:26:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so5293587f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 07:26:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60b91sm136328595e9.31.2025.03.18.07.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 07:26:14 -0700 (PDT)
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
X-Inumbo-ID: f3354d57-0404-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742307975; x=1742912775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JvVLlQ8jKgso9DehsDKbaOXp/8bvds8G8PjQbUxqq3w=;
        b=STNqUbI4W4Y+kNX8GSPeJycIksMeo7r/yORmNbiFWs8bkQf8xk3Na9v+AgjxxQ6w4i
         v0tUrqWCUKPePSGVib1qCPaQL/CAl+mH0+TJkyTJbHVasqEV2lVtOTFq2YETwqqUa8NU
         wWMxzvjc88IAArRVPM9oJSqh8jXQpb4O2w9rXtsX2QyfYyiMWDwr/8W7/cy+ZdtrZgRx
         TiFHig2YzMcMNlB1j2zncVRD27yytvVvdNPAvkRW+1alTiwkUhQ7FeEEBkUBEjb9VrhR
         iwxM3BjV/oIDSDLf/TvDqnfR9YdpNhtncnTqQKVG411rFPu7+iD5zYzCOsyI1ondm7A/
         QnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742307975; x=1742912775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvVLlQ8jKgso9DehsDKbaOXp/8bvds8G8PjQbUxqq3w=;
        b=YIObS5Ggf85Ma6OZYvNOJLCjOj/GiWjfPQVaja+WC9dqMnX+wvizDiluYrSs9v84Po
         FVWAYB0d6ZVdqaSSCI7xpOmlxUkaLQ8wNyE1eNEPORUaumT4J4yv+csfQc83HVMu/oT5
         tpJJK8FzxHYhC/7RFlSl4vMqb/QsDFYI1bTMRGcybqdGqhb4fnr2qSv1W/SHf4Jfi5++
         UsxwvE4rJei1xUXfaIzgp6zc2w/0WYEdr5/r1sYaqgcTl4PYwqSAGSPY0/aLkQmuMa8u
         jrf0e/Vm4NU7z3t9DutrF94EQBpdq59H1dAuVTfO8xhmc+AdKhhYy6ILYviESYRKV50a
         kxHw==
X-Forwarded-Encrypted: i=1; AJvYcCV+w2FkSTxgFAefK3Qsj1GNJC/ahnQusPXgiET+rxqTKM7v4f4snX22X4icD7iF1I57uFsEc0QvRgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIYZay6ahZNuqSXho518JgcjQ7WyWGjwF442JhuL+h9kTB54Wj
	dN9PLiVlSi9ee0rCZOFZN9h8inEvzPof054tg2B69mVE5wi5aZum5BO0IQuRug==
X-Gm-Gg: ASbGncuLV4BJyrD4u0ENBEtrr3IQh0g+EsfQ0Sma5S1nxouIzufqE3L1Wa4X7Y/u5Jp
	feUilyT8treBc/wOLKcUYuoe+9sww8ilBT68l0tIhM0D9apecrP3L6f7RHezVCY/FWFw/prhDG5
	lFsn9jCu9+q+LpDVmpF2nWvJiIawh4BeDUyQXOF2LUhjRtrrmWMOwbkw3KVagEDDb/0OsGvevic
	tQU7YOa0hJA9Fawbnc26GxFDFXTfnBCPLgGgOFwdKEeXTr36UfA1qtZTd5QMX68fCPnwJavSUCC
	qFS6+9jPb/zjU9/vhfOGhB7SLTg74alQHZbimLK5MOi8nQmj5CEU5bU1pvIjuT1zOLAOUqOjfjY
	2EwzDTUwrXEHjwIHFZcyB4cZj2DgHpMDK9TBH2JMe
X-Google-Smtp-Source: AGHT+IEcNxDEAZexKdCgwF6AEcAzGX3RHf7MJT8swHhfoUEN5DrZ3m+y8t+LGGJKIRl7hk6ACsitUA==
X-Received: by 2002:a05:6000:156b:b0:397:3900:ef83 with SMTP id ffacd0b85a97d-3973900f0a4mr17219604f8f.32.1742307975052;
        Tue, 18 Mar 2025 07:26:15 -0700 (PDT)
Message-ID: <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
Date: Tue, 18 Mar 2025 15:26:13 +0100
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
In-Reply-To: <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 14:31, Mykyta Poturai wrote:
> On 18.03.25 12:11, Jan Beulich wrote:
>> On 18.03.2025 10:10, Mykyta Poturai wrote:
>>> On 15.01.24 11:35, Jan Beulich wrote:
>>>> On 14.01.2024 11:01, Mykyta Poturai wrote:
>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>>>>>    };
>>>>>    typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>>>>>
>>>>> +#define XEN_DMOP_inject_msi2 21
>>>>> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>>>> +
>>>>> +struct xen_dm_op_inject_msi2 {
>>>>> +    uint64_aligned_t addr;
>>>>> +    uint32_t data;
>>>>> +    uint32_t source_id; /* PCI SBDF */
>>>>
>>>> Since the comment says SBDF (not BDF), how are multiple segments handled
>>>> here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
>>>> and are local to the respective segment. It would feel wrong to use a
>>>> 32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
>>>> (segment and source_id).
>>>
>>> I'm planning on resuming this series in the near future and want to
>>> clarify the DM op interface.
>>>
>>> Wouldn't it be better to keep things consistent and use
>>> XEN_DMOP_PCI_SBDF as it's done in xen_dm_op_ioreq_server_range? Also
>>> with this, the value can be easily casted to pci_sbdf_t later and split
>>> to segment and BDF if needed.
>>
>> The essence of my earlier comment is: Naming, contents, and comments need
>> to be in sync.
>>
>> I question though that "casting to pci_sbdf_t" is technically possible.
>> Nor am I convinced that it would be desirable to do so if it was possible
>> (or if "casting" was intended to mean something else than what this is in
>> C). See my recent comments on some of Andrii's patches [1][2].
>>
>> Jan
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01294.html
>> [2] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01301.html
> 
> Would something like this be okay then?
> 
> struct xen_dm_op_inject_msi2 {
>      /* IN - MSI data (lower 32 bits) */
>      uint32_t data;
>      /* IN - ITS devid of the device triggering the interrupt */
>      uint32_t source_id;
>      uint32_t flags;
>      uint32_t pad;
>      /* IN - MSI address */
>      uint64_aligned_t addr;
> };
> 
> Added padding and explained source_id purpose better.

I fear the comment is far from making clear what layout source_id is to
have, hence also leaving open whether a segment number is included there.
Of course the issue here may be that I have no clue what "ITS devid"
means or implies. What is clear is that "ITS devid" is meaningless on
x86, for example.

I'm further puzzled by "(lower 32 bits)" - isn't the data written to
trigger an MSI always a 32-bit quantity?

Jan

