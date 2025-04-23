Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACBBA9812C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 09:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964041.1354909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UfB-00073o-91; Wed, 23 Apr 2025 07:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964041.1354909; Wed, 23 Apr 2025 07:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UfB-00071D-6J; Wed, 23 Apr 2025 07:36:57 +0000
Received: by outflank-mailman (input) for mailman id 964041;
 Wed, 23 Apr 2025 07:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7UfA-000717-NC
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 07:36:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb3d6eee-2015-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 09:36:55 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4207495e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 00:36:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d38118sm15274055e9.31.2025.04.23.00.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 00:36:54 -0700 (PDT)
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
X-Inumbo-ID: bb3d6eee-2015-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745393815; x=1745998615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8rHK8KnFBR82+PT/i3XQgLJauzpZq8SJMBnvWoUsEKQ=;
        b=fLZ6qDnBNc2kXeZarze5+aYr+C9wpCVPosAdIZgkeB2gVnGC2LJk1J4fPzsATrLYsp
         WvDMbNKP2dEApPM/DIQ+E8vMKMy44KnfZS4uT+JqPw6R6RQINDJOfgGXojSn7GU5bbM/
         X57c8drwjpRnycTCNCm4cj2i9fiEJeJlMuBpmscOsGuTjL0fFjpxMJPYmtuJSz153ZnO
         5p35IwcJUUknhcWpzNnMIIPP2eerTVj8MQu/DPuB/0tuG4Y66chSlBRKExpj7LP65vAv
         wYp1wUpQM1LjrcHJ5pYCHDaQ7CKVTd11f90120BJqvw04Rb6rGjsxQa03CVJEefwfz+S
         tZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393815; x=1745998615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rHK8KnFBR82+PT/i3XQgLJauzpZq8SJMBnvWoUsEKQ=;
        b=NzuofBpeD/XOVPULF1KcfzsSVOCqa+rgnWYNN3B7hcjXExKs8I/pe/GPe7e1zQ1oK8
         CxO/3CBRjBmxxPulnf4zQrQ5NH1qTLtL6ndzcyGgQMTghacXtTlBOhq4vxODpGVc3U8O
         2q1jw3F/V7c7T7hgUxzifh5DvzyMOaCRjwKW9DldLEonNAtC5ju7vsCBv1X2et6VHdRb
         UiBFAMY2/1DqlTMsFvWVVP5fNJO67N1g029P6bTKCHS9uPwmUBAOqt4lqouRGeNuhC/8
         5fskL1C/3hDJK0iRFYIlYsHu67Vu9DJPUTeQXUt3EJM0gJDn/d8/LQhMv+8x1TNGOxwM
         /iJw==
X-Forwarded-Encrypted: i=1; AJvYcCUpkWxUQh6XYNFVeiUusvIjpuTQPoFpU1113MxQRlG+vvx2+yeg0Qcm67RpiBcfqcA0hduMHL4EeHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8NK6BYGYpYPIQm7Pjrxp82haKsgAQLwxzNLBE1qZOKQOBzyET
	fI4zxBQbnNX2Ty0zOTTGRVwMd+BfEV/Y+fUm/xyYF3m37Oj4NchAhDZctp1NTQ==
X-Gm-Gg: ASbGnctV4wWhuNwIzcS/6Z4+04XkrFghDkMWsm1Rrs/drExPpo9GGQnJy5RGueX6Asd
	T8b9bIbfmQM+Tud9Q0EJcZbt1rZpfH5WvfJg1fjMeFsZApMeooPyFAGgP9Y1mTbF5bdGNYIarMs
	bDm+N/i72PoNa+2BT7o5I0RhqDRXGvdlLp3xpCr39iVqVLfieNx5La9dfF+jTcEin4mv2KiBgrY
	FFlB0HhTBrQ6HF/5WKAO/0+vU+zMIfaBxbKy2pA9DJKUJfL33W2bijPslevxHlm9DGe0fU/XpRx
	ge7M9tl1nc/yg1Qjd2etcws2W/ewpKWb0EoQ9xTDmcb9MYociCq0UZw/zy5AwJbt+CJhx4RW7jB
	FeaNj467Scik9GCjxZAbXfRk3LA==
X-Google-Smtp-Source: AGHT+IEm7Mu0vbbOJcnfO8HoM1qnyx6TMAwSBdqOMnvnXlIb83llvTDDJIzWqYe4Q/wtsP04pYv3dw==
X-Received: by 2002:a05:600c:4e0a:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-44091f1facdmr13679955e9.12.1745393815153;
        Wed, 23 Apr 2025 00:36:55 -0700 (PDT)
Message-ID: <04289258-7316-4c07-96a3-b74a0089e861@suse.com>
Date: Wed, 23 Apr 2025 09:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
 <545079b5-7159-4f47-8100-df387fffe57a@suse.com>
 <PH7PR12MB585404EEEC765754A3DE458FE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB585404EEEC765754A3DE458FE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 05:49, Chen, Jiqian wrote:
> On 2025/4/23 00:03, Jan Beulich wrote:
>> On 21.04.2025 08:18, Jiqian Chen wrote:
>>> Refactor REGISTER_VPCI_INIT to contain more capability specific
>>> information, this is benifit for follow-on changes to hide capability
>>> which initialization fails.
>>>
>>> What's more, change the definition of init_header() since it is
>>> not a capability and it is needed for all devices' PCI config space.
>>>
>>> Note:
>>> Call vpci_make_msix_hole() in the end of init_msix() since the
>>> change of sequence of init_header() and init_msix().
>>> The fini hook will be implemented in follow-on changes.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>
>> From the description I can't derive the need for ...
>>
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -187,7 +187,7 @@
>>>  #define VPCI_ARRAY               \
>>>         . = ALIGN(POINTER_ALIGN); \
>>>         __start_vpci_array = .;   \
>>> -       *(SORT(.data.vpci.*))     \
>>> +       *(.data.vpci.*)     \
>>>         __end_vpci_array = .;
>>>  #else
>>>  #define VPCI_ARRAY
>>
>> ... this change.
> As I understand this, this is used for initializing all capabilities according to priority before.
> That is msix > header > other capabilities.
> My patch removes the priority and initializing all capabilities doesn't depend on priority anymore.
> So I think this is not needed anymore.

Perhaps, but the word "priority" doesn't even appear in the description. So
yes, ...

> Do you mean I should add some explanation in the commit message?

... there's something to add there. But there's also the question of why the
change doesn't go further: With the SORT() dropped, what's the trailing .*
in the section name for? That's apparently connected to the puzzling

+  static vpci_capability_t *const x##_entry  \
+               __used_section(".data.vpci.") = &(x##_t)

What's the trailing dot for here?

(As a nit - I also don't see why x##_t would need parenthesizing when
x##_entry doesn't. Is there another Misra gem which makes this necessary?)

Jan

