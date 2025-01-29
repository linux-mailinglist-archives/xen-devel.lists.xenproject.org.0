Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43076A219BF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 10:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879003.1289214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td4CK-0003jx-Qy; Wed, 29 Jan 2025 09:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879003.1289214; Wed, 29 Jan 2025 09:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td4CK-0003hv-Nt; Wed, 29 Jan 2025 09:17:24 +0000
Received: by outflank-mailman (input) for mailman id 879003;
 Wed, 29 Jan 2025 09:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td4CJ-0003hp-KJ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 09:17:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8e2ecf1-de21-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 10:17:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1150401766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 01:17:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6924486dbsm692004966b.161.2025.01.29.01.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 01:17:21 -0800 (PST)
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
X-Inumbo-ID: d8e2ecf1-de21-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738142242; x=1738747042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jY3VwszcUmlCwbph4D/VlW+dI7fVI6uIXSglAodg90E=;
        b=dOW9zKvTFdHogDvKgJCXu0LTDXuCYS0sbStx+C1Ou1s3xXPw+lrdc30bBtir/R1CwT
         Uh5oCKTNo0BqThEHH0VXjTODj6Na2mMrWAHVR8ZocbMz++nS7TV//hk+ZO6zHF2tfwJ7
         vZBi1/8cRW3lAsJmiIeDl2tZc+0XeLFa1YLv1/I5xY9Fn47y+fYHmC9RpIYJJGw1JmZG
         UcHkkU1MR0bwwNhzfMtkSyGlVk/yzh5lEGH+YQdj+l66qMO8dKd7sXZ2efduIoRG9yem
         IkV0K81fZzfvaW2DhcgwktC3Ocf/4JeMxTuFFHog2NF5olZhGBI72S7pANLp//RgdeVY
         y2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142242; x=1738747042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY3VwszcUmlCwbph4D/VlW+dI7fVI6uIXSglAodg90E=;
        b=wn8RuQMilIlymKKp0l8GXTEvnhhmiJqsxmKTHDvHQ7IoR9zraTYH6wlqrEICGx4M/o
         yv6sWTtEm2iBonWYTYOh4VnypNym5fHAnn2WQAxDtR0Bljy+xCsVG/spUXIhqmj3rrhB
         8MOhJnhks9kDi29a0GWVFO3UWKh06IncTOyrHnMyGpULRmc0p9mFJ1QPRWNKGGIp1VsP
         g6eNodTK8kg3LwqgDIJqoPQUx+qj7Nh1D6KkV1CViP2V9xGnZtYZBevGTv06P6O1h3UA
         68O19ii/ingMf78PzyJsRVcCSz/uhXTelAe0XVgr1lw9bztdIELHJtY/t6ikVBEDw8A9
         zYBA==
X-Forwarded-Encrypted: i=1; AJvYcCVGXQHCJv0t1JgJsZh4EcDpZozOdywmZwFqlzgc+GovP5aWBA7QSohnaeToNIrUEQPf5PZgmsNydOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+ogiZy4XDW5+bkuBC+YGF7ltygJYIb/Sn0nAV2L4kFKOhCQxP
	cMmu8nVzuEXsH6FfRZ2eDXNLBRTdcOHqDnQxN2gb9HEKl8RpxM/5FgGaoJHcgg==
X-Gm-Gg: ASbGnculiuvNK3D8EXHGRIpz3lCB+iMOIU2aBwlzCBuJbfP5/vB5y7w3dwsy1gHXtsj
	gOTDxXbppD2xD7cazOiSBLjvaKXdRGQt/kp3VcM5RWaIOIyWHBlOQopRbCP/TAxOinKcQJtNAcO
	c/ABu0DEZ313tGl7UWJGooqP3OorQfxZ7hfOFkutaUA9NS9Oqppw3tB+I4ooRgT4fo5rbdY6lu0
	ZirSLHmuo3mM4Hm5UhT5FMOEZS4P9pipBIqMHzFFPn0PsF7Y4NUhaiPz706GAS5a1OvZQFFlNyk
	MEps3fuZH+44PvMbqD0P2bLmUFRXi4KsawavVFNJ0kcSxCqMuW/PstXenDbZzHhJduYajmTDRN9
	T
X-Google-Smtp-Source: AGHT+IEptWmgc2PdXVVMpz3zp4lAqX67/4R5WHHT7DJzrvchdkCI70dr1F0VPJ8pj8HJuAcJBfIasw==
X-Received: by 2002:a17:907:1c16:b0:ab6:330c:7af0 with SMTP id a640c23a62f3a-ab6cfcdf591mr214805266b.20.1738142242113;
        Wed, 29 Jan 2025 01:17:22 -0800 (PST)
Message-ID: <22ad7276-624d-49fb-a2bb-1b7908318a4e@suse.com>
Date: Wed, 29 Jan 2025 10:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
References: <Z5mOKQUrgeF_r6te@mail-itl> <20250129030315.GA392478@bhelgaas>
 <Z5mfA32bvEn6yD-C@mail-itl>
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
In-Reply-To: <Z5mfA32bvEn6yD-C@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
>> The report claims the problem only happens with Xen.  I'm not a Xen
>> person, and I don't know how to find the relevant config accessors.
>> The snippets of kernel messages I see at [1] all mention pciback, so
>> that's my only clue of where to look.  Bottom line, I have no idea
>> what the config accessor path is, and maybe we could learn something
>> by looking at whatever it is.
> 
> AFAIK there are no separate config accessors under Xen dom0, the default
> ones are used. xen-pcifront takes over PCI config space access (and few
> more) only in a domU (and only for PV), when PCI passthrough is used.
> Here, it didn't went that far...
> 
> But then, Xen may intercept such access [2]. If I read it right, it
> should allow all access (is_hardware_domain(dom0)==true, and also the
> device is not on ro_map - otherwise reset wouldn't work at all).

The other day you mentioned (on Matrix I think) that you observe mmcfg
not being used on that system. Am I misremembering? (Since the capability
where the control bit lives is an extended one, that capability would
neither be read nor modified when mmcfg is unavailable.)

Jan


