Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0188C84E6
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724018.1129196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7usZ-0007r3-H8; Fri, 17 May 2024 10:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724018.1129196; Fri, 17 May 2024 10:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7usZ-0007oi-EN; Fri, 17 May 2024 10:31:59 +0000
Received: by outflank-mailman (input) for mailman id 724018;
 Fri, 17 May 2024 10:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7usY-0007oc-7u
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:31:58 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af0c6883-1438-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 12:31:56 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-572b37afd73so5338118a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 03:31:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c323d3asm11728262a12.90.2024.05.17.03.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 03:31:55 -0700 (PDT)
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
X-Inumbo-ID: af0c6883-1438-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715941915; x=1716546715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBkYLZVPnkDZ3y9RmABTZ4P2h5x58O6bKi/zZ0eegZI=;
        b=g9fOiX5lIrj8Wd8PPyI9in8P/BU4Z8PqHKEz12Qwi7fU0Qdz/spfDzFrJjggYICR+D
         HuXAxvDWjFjUGxZunSSm0kjYLdJjAF2ytL7UKJ6pUUvDSHVXVfGjEffUxEKPUHZV+uFP
         q0lXb5+hsEGdF9pRcFdvOpH74QTiT9i1bF1CI11ppboJxt6Hfo8jMN3qMnydpg/UXzjZ
         ezNQY4kNensBg/FEzPmQ01WOzUYwF3hpGAKp81z8Q3sHwT2TTaH5qoRoOG3NW3aJz6Li
         gDorWfo1KH9QLtXhFyp3Vz0fRk30yE2TeKmJqG8IxD04RUC12Jsxa+MWxsoWiXRoIMxY
         S82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715941915; x=1716546715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBkYLZVPnkDZ3y9RmABTZ4P2h5x58O6bKi/zZ0eegZI=;
        b=hQPH8i5L7WF1C9wVJzBbJygISgWUlpmKGlG/KtzOAte+OhYCAxSlOB2+EiPqepXlu0
         jUKmk98h6Z3V9lTp5TkxdDYDxGMrohGLBc5YK4Y3mB6hp7+dq6nCqvGzXY3s+XnJ2Pfp
         yweUokEXHYB2rzt3w1aweTdaV0eXq6mNhM8ExXLsSBH6Hcpk5bfosCby7PDn4hIx2Eew
         P5XUHyZGWHpnI5rLG6cbGZlCdlBKTcP8hJINGyuX+Rz1jOR9OG8VqiGmBgSNwGs820Jq
         L2xIlvVHEnpTNWyEHFFOkTmyiNQg2TXrbYnRWAN6cOh/CiJFGT7mh6watR0lRSE54D5j
         GwQw==
X-Forwarded-Encrypted: i=1; AJvYcCVNPtihAVR0X95c5Y8sVFjJtuIGwD/OaVs8vNWYGGMqmU2yc9Ww5hAQg/WD1jLEIfX0TNFIj+8nB+ygdgR+mdOOA6uEsHQQcNDo8S+Xf3Y=
X-Gm-Message-State: AOJu0Ywpi0LCW3JVn4uYgb9VLBZofegnlEIG+PrGB+LNvDulJAuDdDW8
	f2ReSvX7Uf8c8A2kzSJBs1RxnvaU/cqUCUd9GbIQ18lRGM+PCt2RquMLYt8jag==
X-Google-Smtp-Source: AGHT+IEMFH1AZ4RL7xyfe4Ew+k13sKOkJOBsWMUJD1XBPT5Az8Atl5BxuZf97o+ADFQHl5G/zz14Bw==
X-Received: by 2002:a50:8e4d:0:b0:572:4faf:ed67 with SMTP id 4fb4d7f45d1cf-5734d5cecb4mr13048243a12.24.1715941915555;
        Fri, 17 May 2024 03:31:55 -0700 (PDT)
Message-ID: <8d96e75d-5ca1-4276-9ddc-b46b11949fc6@suse.com>
Date: Fri, 17 May 2024 12:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
 <BL1PR12MB5849CCF9A890A7DA969F6474E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849CCF9A890A7DA969F6474E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 12:00, Chen, Jiqian wrote:
> On 2024/5/17 17:50, Jan Beulich wrote:
>> On 17.05.2024 11:28, Chen, Jiqian wrote:
>>> On 2024/5/17 16:20, Jan Beulich wrote:
>>>> On 17.05.2024 10:08, Chen, Jiqian wrote:
>>>>> On 2024/5/16 21:08, Jan Beulich wrote:
>>>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>>>  struct physdev_pci_device {
>>>>>>>      /* IN */
>>>>>>>      uint16_t seg;
>>>>>>
>>>>>> Is re-using this struct for this new sub-op sufficient? IOW are all
>>>>>> possible resets equal, and hence it doesn't need specifying what kind of
>>>>>> reset was done? For example, other than FLR most reset variants reset all
>>>>>> functions in one go aiui. Imo that would better require only a single
>>>>>> hypercall, just to avoid possible confusion. It also reads as if FLR would
>>>>>> not reset as many registers as other reset variants would.
>>>>> If I understood correctly that you mean in this hypercall it needs to support resetting both one function and all functions of a slot(dev)?
>>>>> But it can be done for caller to use a cycle to call this reset hypercall for each slot function.
>>>>
>>>> It could, yes, but since (aiui) there needs to be an indication of the
>>>> kind of reset anyway, we can as well avoid relying on the caller doing
>>>> so (and at the same time simplify what the caller needs to do).
>>> Since the corresponding kernel patch has been merged into linux_next branch
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240515&id=b272722511d5e8ae580f01830687b8a6b2717f01,
>>> if it's not very mandatory and necessary, just let the caller handle it temporarily.
>>
>> As also mentioned for the other patch having a corresponding kernel one:
>> The kernel patch would imo better not be merged until the new sub-op is
>> actually finalized.
> OK, what should I do next step?
> Upstream a patch to revert the merged patch on kernel side?
> 
>>
>>> Or it can add a new hypercall to reset all functions in one go in future potential requirement, like PHYSDEVOP_pci_device_state_reset_all_func.
>>
>> I disagree. We shouldn't introduce incomplete sub-ops. At the very least,
>> if you want to stick to the present form, I'd expect you to supply reasons
>> why distinguishing different reset forms is not necessary (now or later).
> OK, if want to distinguish different reset, is it acceptable to add a parameter, like "u8 flag", and reset every function if corresponding bit is 1?

I'm afraid a boolean won't do, at least not long term. I think it wants to
be an enumeration (i.e. a set of enumeration-like #define-s). And just to
stress it again: The extra argument is _not_ primarily for the looping over
all functions. It is to convey the kind of reset that was done. The single
vs all function(s) aspect is just a useful side effect this will have.

Jan

