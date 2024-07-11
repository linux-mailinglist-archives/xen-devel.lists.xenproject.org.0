Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83E92E35E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757213.1165985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq00-0007Q5-Rb; Thu, 11 Jul 2024 09:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757213.1165985; Thu, 11 Jul 2024 09:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq00-0007OT-Ot; Thu, 11 Jul 2024 09:22:00 +0000
Received: by outflank-mailman (input) for mailman id 757213;
 Thu, 11 Jul 2024 09:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRpzz-0007Ny-B9
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:21:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05aeabac-3f67-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 11:21:58 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so902050a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:21:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d621c6300sm4086468a12.51.2024.07.11.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 02:21:57 -0700 (PDT)
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
X-Inumbo-ID: 05aeabac-3f67-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720689718; x=1721294518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/dUfiMbDjZy3PrH3x4GeRrQ4b2iAnCiTMoZ+/S19jLk=;
        b=XiQ7JZmOPnnm4nhTa+16BVfz3WK7AqWy7IMilsNmUbiHKQdP3ewfzyGzq53e8UWPzv
         ImGk8pFZq4gE/8eLRra8o2BnW+as9SWamMZek5FkiA4sYjQafC2vdm56h83ruEIdxrSv
         ZAPZ+czjkNfB1j5RDvHg1hQJAKq9OSLyMnCn1j45HSq36NU1CAG6JRPgDb5pCYaLWzmy
         Wr/CTBHsbXvKRNb1+tySegEjNQKRz9gDMDXXYot1y/1ZzLjwuK06BgtgW/2WrPMdXaTp
         u5OYZBCUyRGjYG843iihxRkohTQfK2Gx3wWkNit2BtDnsScSJ8/RUghM2ixLc72eKYvl
         rQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720689718; x=1721294518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dUfiMbDjZy3PrH3x4GeRrQ4b2iAnCiTMoZ+/S19jLk=;
        b=mg1z6tRVwh0pldpcURDZcFYlD1eBrYs+CqN2NDR5+uEeCvGbZ//zAute/ib102wn51
         o8XjmUcdTbkNbPpTZZfdL8UCs9b2DNSAOn+J3X0FUv0w05aMkj1e3mmKC7HTn4EUEiP9
         7knKS9njW/sHwTH7ezi/aNhfJrzsMahWumhp9wBijAcsZaHTd1OvkbFya8WhYJGP+Hxh
         6eihEWnSyOKNE8Ml6dGakt+39M/4pqA9Kbgb2AnmZpJek6ZgYYmVz3b6eZTHOL5YHcD+
         HWT6+TF0edyZFUFRzQyiZQaqXqq73z5KkO9KnpzuxZu0HfPxQXXZlViVzcXsDmffel+d
         v9OA==
X-Forwarded-Encrypted: i=1; AJvYcCV71Lw9aUnyOslCZpn3dbXvTGEn72TACjeS0z5eKSGVYzMsqPcouXFQZPPgfWEq2BufFtKB2v8tfaNsBFYH7HJSOzkGIxkrM3CqHO/9R58=
X-Gm-Message-State: AOJu0YyGqeS3IL0YpA5thDxMXui6p92cRCLUtn/2pWWOE13MTpjLZNgO
	OWm/R+5GMYXFJO9OaD91O6mGCcyCown3vjf53b/ZqZo9ibJeR2wlbnSrExA7kA==
X-Google-Smtp-Source: AGHT+IHXZyTEgFCd0oJcdscYbj/DHK0u5UFMOwXXDhR9hg4rV3BWZ+qLA9cZ/2QSWVXnWSVMl5deiA==
X-Received: by 2002:a17:906:1cd6:b0:a77:c364:c4f0 with SMTP id a640c23a62f3a-a780b70548amr447132866b.36.1720689717818;
        Thu, 11 Jul 2024 02:21:57 -0700 (PDT)
Message-ID: <600ad88a-8880-485b-be1e-43942a1b8615@suse.com>
Date: Thu, 11 Jul 2024 11:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <c656f0d08d4c4b515c99848b84db4171ab132f19.1720002425.git.oleksii.kurochko@gmail.com>
 <b3c5b6d3-561d-46d0-bc1b-1b2e3cbeeba2@suse.com>
 <d3b9070442e0ebca82ce0dd5257fe91eef4755cf.camel@gmail.com>
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
In-Reply-To: <d3b9070442e0ebca82ce0dd5257fe91eef4755cf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 11:00, Oleksii wrote:
> On Wed, 2024-07-10 at 12:23 +0200, Jan Beulich wrote:
>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>> From: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>
>>> Arm's setup.c contains a collection of functions for parsing memory
>>> map
>>> and other boot information from a device tree. Since these routines
>>> are
>>> generally useful on any architecture that supports device tree
>>> booting,
>>> move them into xen/common/device-tree.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V5:
>>>  - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>>>  - drop message "Early device tree parsing and".
>>>  - After rebase on top of the current staging the following changes
>>> were done:
>>>    - init bootinfo variable in <common/device-tree/bootinfo.c> with
>>> BOOTINFO_INIT;
>>>    - update the code of dt_unreserved_regions():
>>>        CONFIG_STATIC_SHM related changes and getting of
>>> reserved_mem
>>>        bootinfo_get_shmem() ??
>>>    - update the code of meminfo_overlap_check():
>>>        add check ( INVALID_PADDR == bank_start ) to if case.
>>>    - update the code of check_reserved_regions_overlap():
>>>        CONFIG_STATIC_SHM related changes.
>>>    - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>>>    - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>>>    - struct struct membanks was update with __struct group so
>>> <xen/kernel> is
>>>      neeeded to be included in bootfdt.h
>>>    - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to
>>> generic bootfdt.h
>>>    - bootinfo_get_reserved_mem(), bootinfo_get_mem(),
>>> bootinfo_get_acpi(),
>>>      bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved
>>> to xen/bootfdt.h
>>>  - s/arm32/CONFIG_SEPARATE_XENHEAP/
>>>  - add inclusion of <xen/macros.h> because there are function in
>>> <xen/bootfdt.h> which
>>>    are using container_of().
>>
>> Just to mention it: This is confusing. The series is tagged "v1". I
>> understand
>> you took Shawn's work, which had already undergone revisions. But
>> then imo you
>> want to at least clarify how your v1 relates to his v4 or v5, i.e.
>> then making
>> clear to the reader whether all of the changes above were actually
>> done by you
>> on top of an earlier v4, or whether you took the earlier v5 verbatim.
> That is why I wrote "Changes in v5" to show that these changes were
> done on top of v4 version of Shawn's series, so what is mentioned in v5
> here it is what was done by me.

Except that what you sent is v1, not v5.

> I'll reword that and probably I shouldn't drop "Changes in v4,3,2,1"
> from Shawn's patch.

I don't think you should drop anything. You want to clarify relationship
of the version of your series with that of Shawn's earlier one. Or you'd
want to continue numbering from what the previous series had, yet that
may then also end up confusing if Shawn resumed work there.

Jan

