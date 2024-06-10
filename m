Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10F901D25
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737052.1143170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaaj-0001BC-1Y; Mon, 10 Jun 2024 08:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737052.1143170; Mon, 10 Jun 2024 08:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaai-00019a-Ud; Mon, 10 Jun 2024 08:41:24 +0000
Received: by outflank-mailman (input) for mailman id 737052;
 Mon, 10 Jun 2024 08:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGaah-00019S-9h
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:41:23 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3626cfa5-2705-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 10:41:21 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso46008741fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 01:41:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c55d8aca8sm5351801a12.97.2024.06.10.01.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 01:41:20 -0700 (PDT)
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
X-Inumbo-ID: 3626cfa5-2705-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718008880; x=1718613680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T1rWKJ/YYX2AvVliR35EdJCq8qppYe73Dcruj3rCPW0=;
        b=Qz2cQSsgJzSFV8ww37j0mRdhVQbvbqbzjs+Iq5XWNjig3Sr1v0UlQSArT0cOGHfOXA
         zvALPUPbZHAWRbt2L0AzF17UE16yqc7niQwi3XxHqqndbytfdgepa2wMqGYbdr3B0Wfh
         CFRk5k5wFdHWxyWZDJJaW4VBA2pHVr4UQvF4zta+WkL97LKjJFmLSjiaPp7FlCaalXoH
         n0JAh4v8Q++8xDtDBp9C3arDfWeHSpPQjuMazHQ9Cmjy3+v1NHHIO/TMYsoHkIPxgBdk
         mTiMuC95O9rN6GiFDZKzXpftpUktdfJmS1N8dEdLpZUQQ8/eRr6MzrSBPlks0Xh565fG
         qTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008880; x=1718613680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1rWKJ/YYX2AvVliR35EdJCq8qppYe73Dcruj3rCPW0=;
        b=uMl7wXMehVHr17Cso/vsFTFVKbjlagHY1Bt5mNm2CK54YOE1TFfT9MxGYPtO51L+qc
         wxxxJiN0L+afjJaJYlCKnmDDGOgkYrZWtWHbPS4HXxy6K8LxCzZUxbYnzZtDIA64NYy5
         jNkRB5q2QQhlp6vJvBpYhsbgyvncUWw9cJLOx99j6m+zY2QuAodoogVcbbHNXa6xXozg
         hBXP+TgrIui125dyEpAnRaVzvGu6lUXVnL7GrvxphQYRb3P81mEGwk0MD05rnJ/nxVRN
         99BRGEfazlpoueeSBAxstP9C92HfgnNyq80rApHcDST2SVTJaKbhEzIyuG6UjdeUXDjv
         dSXw==
X-Forwarded-Encrypted: i=1; AJvYcCWr6wgGPO5OYQX0cqDuZ5Qeo0HNNJo9XU1nTOoFFDslpkWrtVi1Ium/0tIqMUoG8hZgtNxHsqCBgDu6sjosOIjF9JQrx0tDgkQxTPijAP0=
X-Gm-Message-State: AOJu0Ywm7QdU06o7a5JkN8TSwTjhQhXNN3tURGWjXvs45CA4OrYJs0sR
	9p9rnSHsKVNPpmnASJCP8Yl+fE9FuCA8utXJK0TM4cZziwbmB5cBXjtUtlIdkg==
X-Google-Smtp-Source: AGHT+IG5TWnqe+1Cq7n1ktY0e7d/mkRjAbM6/l8C6EwP0FeislCOTK2Zg2BcrPzOTKYQSkZ2WWB8pA==
X-Received: by 2002:a2e:925a:0:b0:2eb:ddca:e175 with SMTP id 38308e7fff4ca-2ebddcae2e8mr20331441fa.42.1718008880597;
        Mon, 10 Jun 2024 01:41:20 -0700 (PDT)
Message-ID: <a8225a94-54ed-4b24-8867-b9da65cb0a14@suse.com>
Date: Mon, 10 Jun 2024 10:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Segment truncation in multi-segment PCI handling?
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel
 <xen-devel@lists.xenproject.org>, javi.merino@cloud.com
References: <ZmNjoeFAwWz8xhfM@mail-itl>
 <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
 <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com> <Zma5Rj_cswrIYcD2@macbook>
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
In-Reply-To: <Zma5Rj_cswrIYcD2@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 10:28, Roger Pau Monné wrote:
> On Mon, Jun 10, 2024 at 09:58:11AM +0200, Jan Beulich wrote:
>> On 07.06.2024 21:52, Andrew Cooper wrote:
>>> On 07/06/2024 8:46 pm, Marek Marczykowski-Górecki wrote:
>>>> Hi,
>>>>
>>>> I've got a new system, and it has two PCI segments:
>>>>
>>>>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
>>>>     0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08)
>>>>     ...
>>>>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
>>>>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
>>>>     10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
>>>>
>>>> But looks like Xen doesn't handle it correctly:
> 
> In the meantime you can probably disable VMD from the firmware and the
> NVMe devices should appear on the regular PCI bus.
> 
>>>>     (XEN) 0000:e0:06.0: unknown type 0
>>>>     (XEN) 0000:e0:06.2: unknown type 0
>>>>     (XEN) 0000:e1:00.0: unknown type 0
>>>>     ...
>>>>     (XEN) ==== PCI devices ====
>>>>     (XEN) ==== segment 0000 ====
>>>>     (XEN) 0000:e1:00.0 - NULL - node -1 
>>>>     (XEN) 0000:e0:06.2 - NULL - node -1 
>>>>     (XEN) 0000:e0:06.0 - NULL - node -1 
>>>>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
>>>>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
>>>>     ...
>>>>
>>>> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
>>>> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
>>>> Segment Groups, each with 256 bus segments.
>>>>
>>>> Fortunately, I don't need this to work, if I disable VMD in the
>>>> firmware, I get a single segment and everything works fine.
>>>>
>>>
>>> This is a known issue.  Works is being done, albeit slowly.
>>
>> Is work being done? After the design session in Prague I put it on my
>> todo list, but at low priority. I'd be happy to take it off there if I
>> knew someone else is looking into this.
> 
> We had a design session about VMD?  If so I'm afraid I've missed it.

In Prague last year, not just now in Lisbon.

>>> 0x10000 is indeed not a spec-compliant PCI segment.  It's something
>>> model specific the Linux VMD driver is doing.
>>
>> I wouldn't call this "model specific" - this numbering is purely a
>> software one (and would need coordinating between Dom0 and Xen).
> 
> Hm, TBH I'm not sure whether Xen needs to be aware of VMD devices.
> The resources used by the VMD devices are all assigned to the VMD
> root.  My current hypothesis is that it might be possible to manage
> such devices without Xen being aware of their existence.

Well, it may be possible to have things work in Dom0 without Xen
knowing much. Then Dom0 would need to suppress any physdevop calls
with such software-only segment numbers (in order to at least not
confuse Xen). I'd be curious though how e.g. MSI setup would work in
such a scenario. Plus clearly any passing through of a device behind
the VMD bridge will quite likely need Xen involvement (unless of
course the only way of doing such pass-through was to pass on the
entire hierarchy).

Jan

