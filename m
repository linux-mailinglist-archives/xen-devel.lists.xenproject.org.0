Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C790C510
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742853.1149729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUd9-0007qF-50; Tue, 18 Jun 2024 08:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742853.1149729; Tue, 18 Jun 2024 08:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUd9-0007nq-2H; Tue, 18 Jun 2024 08:55:55 +0000
Received: by outflank-mailman (input) for mailman id 742853;
 Tue, 18 Jun 2024 08:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJUd7-0007nk-Ic
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:55:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90cdfadc-2d50-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:55:52 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57cad452f8bso5804702a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:55:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7439070sm7547280a12.85.2024.06.18.01.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 01:55:51 -0700 (PDT)
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
X-Inumbo-ID: 90cdfadc-2d50-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718700952; x=1719305752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EdwxUBMtJqpxDgmXryYAvIazZRX1Hy+h3AFFbKAnUKM=;
        b=fekdAqaNhi1KC00MJGVkcDL7Jg6dlEc4uZaFwRrJUJehdp2AAP59ehBLjjKI1iHuRY
         C/KwBbkTsUIHtKnRqSZix6qxcR+AVcb2NYkl0vYZQXozs5t3QMHcmYmj62m1uV3U5QHD
         bmG1qyQLQTIklN1AdwzqvTL8zJ6XF5s0AsbsVfz0Zn8fjgXNDPtwn316XFa5Fq0Uw2DL
         mc1x1X19BQ6bWsX7KnEqrg8LZWyjrSvjlaH8dDINIxGVR8JqybHdQZGqsPNLNuzOmh+D
         7UxZME6X7tj9+1umWtToX2zWsO+Gm5WG/kd+WrUSIf5SpIh/HjgSQXyONtuha6naa09D
         ubIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718700952; x=1719305752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdwxUBMtJqpxDgmXryYAvIazZRX1Hy+h3AFFbKAnUKM=;
        b=YNbm5wDibO6BqJZK6iIyi7X6ip1Gmnx/LXPXVdpZtG9hYlgVR7Mgb8BfoG0BcOq5zb
         rwYXosCQdMpZyUV51uPnidCOtNwMdsqEJ0hOts2ZBwfJHMERLpUSN8CGqAcbYrELUJml
         j1O9UhDMRadzFG7ao3cfX5BxQwvmSSlz0SbChNpxoaR6aQaqD8tF5sVzxqfcpn0kL9nx
         N18rw+YwhS2f13ases9yiZ3hdTVAAdovGOjLfTGUsiTF9/0PIvu+ymE2OU4LXjFc7AaB
         vwp8FXmaWkATxPkLTiV/xl8jofr0o3IYkqOhpA6CmX0s4jw9uvO7npCYwSy0dByEIY1v
         uADw==
X-Forwarded-Encrypted: i=1; AJvYcCXR4DqmBy4TEUCb8fdO9SqHIdcpdIKyvnDbTFYBBerrOzM9XCcyA3wmkaxxHdDRXY0Cu7wa21sCgwKqAsp0+6eu2ZVhXj6sTxTn1F4P714=
X-Gm-Message-State: AOJu0YwnKbWQTuYSuhKktTmguH3BbVIcZYI76WQJyDLXYlbIj7Uiq9sU
	2U5OzLttG1WNbQDO5ktan4i0KtyGFtief0+P8nBIvWgd3b+3DE9YiFu46QXyZw==
X-Google-Smtp-Source: AGHT+IE9l6dW2GadYgqgSFh0k5pgmlZtlxz6ZwK8aMMxQ0wdOzPGNjCWUSeEbjS70dr8oUqb5LrqWg==
X-Received: by 2002:a50:ed82:0:b0:57c:bf3b:76f5 with SMTP id 4fb4d7f45d1cf-57cbf3b78acmr7326488a12.35.1718700951644;
        Tue, 18 Jun 2024 01:55:51 -0700 (PDT)
Message-ID: <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
Date: Tue, 18 Jun 2024 10:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 08:57, Chen, Jiqian wrote:
> On 2024/6/17 22:52, Jan Beulich wrote:
>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>> The gsi of a passthrough device must be configured for it to be
>>> able to be mapped into a hvm domU.
>>> But When dom0 is PVH, the gsis don't get registered, it causes
>>> the info of apic, pin and irq not be added into irq_2_pin list,
>>> and the handler of irq_desc is not set, then when passthrough a
>>> device, setting ioapic affinity and vector will fail.
>>>
>>> To fix above problem, on Linux kernel side, a new code will
>>> need to call PHYSDEVOP_setup_gsi for passthrough devices to
>>> register gsi when dom0 is PVH.
>>>
>>> So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
>>> purpose.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>> The code link that will call this hypercall on linux kernel side is as follows:
>>> https://lore.kernel.org/xen-devel/20240607075109.126277-3-Jiqian.Chen@amd.com/
>>
>> One of my v9 comments was addressed, thanks. Repeating the other, unaddressed
>> one here:
>> "As to GSIs not being registered: If that's not a problem for Dom0's own
>>  operation, I think it'll also want/need explaining why what is sufficient for
>>  Dom0 alone isn't sufficient when pass-through comes into play."
> I have modified the commit message to describe why GSIs are not registered can cause passthrough not work, according to this v9 comment.
> " it causes the info of apic, pin and irq not be added into irq_2_pin list, and the handler of irq_desc is not set, then when passthrough a device, setting ioapic affinity and vector will fail."
> What description do you want me to add?

What I'd first like to have clarification on (i.e. before putting it in
the description one way or another): How come Dom0 alone gets away fine
without making the call, yet for passthrough-to-DomU it's needed? Is it
perhaps that it just so happened that for Dom0 things have been working
on systems where it was tested, but the call should in principle have been
there in this case, too [1]? That (to me at least) would make quite a
difference for both this patch's description and us accepting it.

Jan

[1] Alternative e.g. being that because of other actions PVH Dom0 takes,
like the IO-APIC RTE programming it does for IRQs it wants to use for
itself, the necessary information is already suitably conveyed to Xen in
that case. In such a case imo it's relevant to mention in the description.
Not the least because iirc the pciback driver sets up a fake IRQ handler
in such cases, which ought to lead to similar IO-APIC RTE programming, at
which point the question would again arise why the hypercall needs
exposing.

