Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9049A21E38
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 14:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879176.1289399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Wj-0001YJ-R4; Wed, 29 Jan 2025 13:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879176.1289399; Wed, 29 Jan 2025 13:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Wj-0001Wq-OC; Wed, 29 Jan 2025 13:54:45 +0000
Received: by outflank-mailman (input) for mailman id 879176;
 Wed, 29 Jan 2025 13:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td8Wi-0001Wi-36
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 13:54:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97357279-de48-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 14:54:43 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aab925654d9so1327152766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 05:54:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbb2esm985639866b.140.2025.01.29.05.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 05:54:42 -0800 (PST)
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
X-Inumbo-ID: 97357279-de48-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738158882; x=1738763682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OAzk2HvSci2RB9DJCTTtog02Zihvy8J06+hb0uPWlXE=;
        b=CVbVVw8ArfsSUBiWg1+DUyM4KQdasExtnUs3gpyyTMgWcLoo2XgcCFoRd70ozeUU6O
         Wm6UthNLpFvrZVUNxlYpI0h9X7gkmeHJraLZ6BlMebhOIRiL6I/0xGkVZowW23Uy4Yfo
         jNSYjtf5HF1K8kLzpu8P6MlB4/IrNFKR08SewOHJNJGoZxWRFyHternt8ri43iajWp6n
         yH5Gwpa8JniqOGFuIcWtFTH+wnUW+N+40T0WDmziaESc0cWcinjIHzmwycRqRvjVW49T
         ArAYfv90DLyYSbB9opcBrD8fCeKzCWcAf60CsUpb3NVFZrEofQ9u0dqww2A9C5vzPpzK
         RyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158882; x=1738763682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAzk2HvSci2RB9DJCTTtog02Zihvy8J06+hb0uPWlXE=;
        b=il0Se66qE4Te2Amqc1hBKM38oZoOUaSoGXf9ocAx1YBpDberbP3ziCoKf6mgSPfFnr
         ZfWmi5Lm09miO3HHT6UpRurxmyjXEGo2JQXJ63QXJ67InnBRCctjCb+luZ7eDRbIVnKv
         HudlUV0GcpY9858aI9TgUWwa5QZCeC4J6IoqJqQGXvL95uGj2WaOWKOuhDOsdK4WjVxv
         mgOxbilrsi5kRfALC3UOX266TXjntWmXsDDQaNyDGDiXtWjSdi/Q7GQgFoQ4rZanKIWO
         ZG2R9utAI+bHOBoeaqPq7I34NQtDModjVyREVxMNiQK7tylWPWGiDgPbskO6Ps5ifuuS
         mauw==
X-Forwarded-Encrypted: i=1; AJvYcCVQlY7c4Onjty81Goa1jjxxowfaZIAICsoq2ZdWq9UlXkuLXNYuIdjVZfdlUUADb0o5x8o8xefv0/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7T6YXtNkhMobHOYjVOQw7gOcaID1ujESL3C7NN+R7FMD/+QE2
	6+D37UBAC4K1qhhDBA5BemqTIVyVpyyOBpCwSfaov89ist3wfdPkoUg2JcxDOQ==
X-Gm-Gg: ASbGnct3pCOaybED/q+rtty4Gnp/UvJ3hvkgf0qoMuVv3gH4yOTBSfDMbwMI2nnBw+9
	JUl3FDAK7fbWYayXldhAFmHAyRBJO+/HrVfqnEO9ynICC+jnAoUyYXIw4pUAES9JzZbE6gvnCf6
	Dcp3YxQyVtnfYzfrQ1r35gz3StWClKCHWfD9+otfv1IN2EmAX9wfEIGnDVUYLcH9VWQPkvCiY9Y
	8t9EEiciHLV16CjTVxJQh9fI40Ob6EtlcUATiuHsQq/xFHUZNQxhZstl/09rWvTR7aak3cdgn7S
	RNsTqRe1f+EpU5GLky9TICE9uVIgetYt4YD/r2rT37LXeX0xEJCafOyuUr8y+ocPlxqo1SvYR7Z
	OX3c3LTWrnPA=
X-Google-Smtp-Source: AGHT+IFyfwTg1PMxVWwmOGjd5ZetF6IndRyOwzliuiWStKYzttmQsbLKfxXAr/xuK9TPm1p1YNzOiA==
X-Received: by 2002:a17:907:7b85:b0:aa6:81dc:6638 with SMTP id a640c23a62f3a-ab6cfcbb881mr280647966b.16.1738158882265;
        Wed, 29 Jan 2025 05:54:42 -0800 (PST)
Message-ID: <8acfd9b2-caae-4fe7-8d37-19e2d9be23a8@suse.com>
Date: Wed, 29 Jan 2025 14:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org
References: <20250129132843.GA451331@bhelgaas>
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
In-Reply-To: <20250129132843.GA451331@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 14:28, Bjorn Helgaas wrote:
> On Wed, Jan 29, 2025 at 10:17:20AM +0100, Jan Beulich wrote:
>> On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
>>> On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
>>>> The report claims the problem only happens with Xen.  I'm not a Xen
>>>> person, and I don't know how to find the relevant config accessors.
>>>> The snippets of kernel messages I see at [1] all mention pciback, so
>>>> that's my only clue of where to look.  Bottom line, I have no idea
>>>> what the config accessor path is, and maybe we could learn something
>>>> by looking at whatever it is.
>>>
>>> AFAIK there are no separate config accessors under Xen dom0, the default
>>> ones are used. xen-pcifront takes over PCI config space access (and few
>>> more) only in a domU (and only for PV), when PCI passthrough is used.
>>> Here, it didn't went that far...
>>>
>>> But then, Xen may intercept such access [2]. If I read it right, it
>>> should allow all access (is_hardware_domain(dom0)==true, and also the
>>> device is not on ro_map - otherwise reset wouldn't work at all).
>>
>> The other day you mentioned (on Matrix I think) that you observe mmcfg
>> not being used on that system. Am I misremembering? (Since the capability
>> where the control bit lives is an extended one, that capability would
>> neither be read nor modified when mmcfg is unavailable.)
> 
> If you're referring to the Configuration RRS Software Visibility
> Enable bit, that's in the PCIe Capability Root Control register, which
> is in the PCI-compatible config space (the first 256 bytes), not the
> extended config space.

Oh, I clearly didn't read Marek's earlier mail correctly. I'm sorry for that.

Jan

