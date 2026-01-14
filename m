Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948ED1D6EB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202727.1518172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwy1-0007Kx-PE; Wed, 14 Jan 2026 09:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202727.1518172; Wed, 14 Jan 2026 09:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwy1-0007J1-Mh; Wed, 14 Jan 2026 09:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1202727;
 Wed, 14 Jan 2026 09:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfwy0-0007Hh-8Q
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:15:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8253e589-f129-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 10:15:03 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so4270661f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:15:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff0b2sm48837377f8f.42.2026.01.14.01.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:15:02 -0800 (PST)
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
X-Inumbo-ID: 8253e589-f129-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768382103; x=1768986903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJCW3cD4Xjf4eA6qkgzI7CBKKgWBwQbe4IxF6FsR/d4=;
        b=MjJ+HrtWdZrBGgderOq3QOUQx+pzlzNz226IsEWLyRwXYpAs8oZ6YR2AdazKMTuF7T
         8uwya0GNal08fLPHrCodZYeTI1XhFbGqmfrG7vrvBOwTMSyicF6QUbXsCQW0aC8xQ/6p
         7NKGVW8lZPnbPJxJdeiI1Cxax5N2bD0EhUVk1asbRMlGVDbrWVyC9OEGB3CTmF1sBAgj
         XUvDpTz061m+B8r/ORKvMHb2B8ZZids1rxR1zXNlGnzmxfp80z8n2XxZAlpn5JuKnImj
         iRFNk/yO+n5iki8maiBKXK2k06GfxOilGx3bDYGWZujXqvi7znCfYInY5Wun8bHCpS0Q
         QIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382103; x=1768986903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJCW3cD4Xjf4eA6qkgzI7CBKKgWBwQbe4IxF6FsR/d4=;
        b=BCDpc9hXQUPfRQxxYCNrBkGJSymG8SA1t8EV/WSMLlxlEK3ecsuUjY+eWAWZ3vTJ0K
         7rsBouBz5LIfKs2y4T7Mv49XcwE8KSKa7LFCgbZXFFsf43sLuPpVgxe1MZwvBHIUT2ee
         zVzPsGxNh5V2hgDlC0MIAdRzV6tvl0BzDTzq+MPbWjNF6ew7SustXrNpmzHv7yBOEmfN
         Ua4OuwavOk53NfpDn5hoMfdLq9vjup6yOCBTetSFaqjhgTyU6ihlICGgyKYhXyqL2zOy
         JvjQl4+kzRXsxEhbgbd5cubtOm+BlBSXRDmRwY06CqlF60yi5dk8JXXhv61mulBaye9B
         IZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCWDbasm49Q7s8GpjKRXXj3B0JMVXk71F738rqQGENFMlcpxEAT7p+6UTPkPe3273K67KNTeVLVjHkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfEz0WhfK4yBkF/cD/E0fdHA1rejnP4z7LvyWzYJru9WHtTwQP
	nr7oAQCWKVVGR7oem5yi+30f+uaRJKOueSq3tnGahNGdkldvd3xz3bYrzoKELFToSA==
X-Gm-Gg: AY/fxX5TmgSiObJvAprcbM+YKrKC2EJf3NHN7nzl5Eww/wlESD2Ig8iAjOmOGlHgJQK
	tzRYdxvKrXUR/vNjMTT7phRe0uzUIust837STPh6ovqZBYYh5j5v2qsaqY4EmKKQRr7iZmNIe3f
	RpVSRl99c/mODC1NYeedckymdPIQs3aGSQ0CjaApI/flQIhvOSTiWBgcH1S6f13MgUZMgB/MuGJ
	3nD4toz3knlq0XfZUxv9PP/tWJQWd1CrZeP5/mj0bQVKSJECnBv+43d527siL5mUEx+nRFE/5S7
	989RPQk6D0kLXLBwMimGaSvdhb3OeF9EsmPjAexC9+YJflaYeOmpucG3WayUQatfF+Xns2WO5Ij
	Pc2qjnJ0gzwBNV8fJA50SCkUcKj5hecEk1hdOjJRLBVpM9cPw6X31zvCbndFewKTh0xVcF4Gz5Y
	DWeMHIUWMVfYeEO9TJWfxkTlrz2uwH9w6Cn8k+qDetfvdCgwOh+RLZfs6rbTnm7Iz1AJ1qGGn2W
	61umiiXuTNd9w==
X-Received: by 2002:a05:6000:604:b0:430:f1ae:c7a9 with SMTP id ffacd0b85a97d-4342c4fee33mr1795475f8f.22.1768382102658;
        Wed, 14 Jan 2026 01:15:02 -0800 (PST)
Message-ID: <81b78b76-39e8-4a12-b392-ee62d426fcc5@suse.com>
Date: Wed, 14 Jan 2026 10:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/15] xen/riscv: init tasklet subsystem
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <7fd154cda45466ca4bd425bc05d191caccc7d96d.1766595589.git.oleksii.kurochko@gmail.com>
 <aa1aecd5-afdc-421d-8b4a-314aa82a1157@suse.com>
 <7511b588-8699-49a9-99d0-0cb94f0fac76@gmail.com>
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
In-Reply-To: <7511b588-8699-49a9-99d0-0cb94f0fac76@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 18:03, Oleksii Kurochko wrote:
> 
> On 1/12/26 5:20 PM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> As the tasklet subsystem is now initialized, it is necessary to implement
>>> sync_local_execstate(), since it is invoked when something calls
>>> tasklet_softirq_action(), which is registered in tasklet_subsys_init().
>>>
>>> After introducing sync_local_execstate(), the following linker issue occurs:
>>>    riscv64-linux-gnu-ld: prelink.o: in function `bitmap_and':
>>>      /build/xen/./include/xen/bitmap.h:147: undefined reference to
>>>                                             `sync_vcpu_execstate'
>>>    riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
>>>                          `sync_vcpu_execstate' isn't defined
>>>    riscv64-linux-gnu-ld: final link failed: bad value
>> How that when ...
>>
>>> --- a/xen/arch/riscv/stubs.c
>>> +++ b/xen/arch/riscv/stubs.c
>>> @@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
>>>       BUG_ON("unimplemented");
>>>   }
>>>   
>>> -void sync_local_execstate(void)
>>> -{
>>> -    BUG_ON("unimplemented");
>>> -}
>>> -
>>> -void sync_vcpu_execstate(struct vcpu *v)
>>> -{
>>> -    BUG_ON("unimplemented");
>>> -}
>> ... there was a (stub) implementation? (The code changes look okay, it's just
>> that I can't make sense of that part of the description.)
> 
> I haven’t investigated this further. I wanted to look into it now, but I can’t
> reproduce the issue anymore. I reverted|sync_vcpu_execstate()| to a stub and no
> longer see the problem.
> 
> I will move the introduction of|sync_vcpu_execstate()|. It doesn’t seem to be
> really needed at the moment, but since it is already introduced and there are no
> specific comments against it, I think it can be added as a separate patch in this
> series.

Just to mention: Moving it right here looks to make sense to me. It's just that
the description of the change was irritating.

Jan

