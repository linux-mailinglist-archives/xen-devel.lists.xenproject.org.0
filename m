Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA0AB968A
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986379.1371940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpRr-00047C-7J; Fri, 16 May 2025 07:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986379.1371940; Fri, 16 May 2025 07:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpRr-00045A-4b; Fri, 16 May 2025 07:25:39 +0000
Received: by outflank-mailman (input) for mailman id 986379;
 Fri, 16 May 2025 07:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFpRp-000453-LV
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:25:37 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5dc8b88-3226-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:25:36 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so3591481a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:25:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e6366sm961876a12.44.2025.05.16.00.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:25:35 -0700 (PDT)
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
X-Inumbo-ID: f5dc8b88-3226-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747380336; x=1747985136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fKB6X3ffOlNz/9yfTbBf2Mvx10O/bznxOXd1Iqxid8I=;
        b=bHocymCYEzS02oDvKwSoCzZVPuAV7W7+Iip46sDkFMDhUeGCuG2QKS8CSCdlUwq1pB
         eMGRArZ/GSKvWlR4wJGrZlYWHmoTkxJ9Jn6BLFgB7zFCOOcosap+oBmfpNmsTVgAsbvf
         ySlv7vcdDXcED25SVPQ4C5Dcvf4iZSTi8Rc77qCZwO/GJczCE5RufmgvvDNp2SWCx25p
         SCn66xXIPsfzAhAwJFZrKl9NajPtGw/t/pGm33yo4mbcH3LyWPbQFUv6lF41J/g2XDDn
         x9cL1Vu54Vl6+geJAYsKEC0qx1Ei7F91owYzDNJGEZHae7RIYIkoLozIZjIg2CH4E3ub
         A7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747380336; x=1747985136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKB6X3ffOlNz/9yfTbBf2Mvx10O/bznxOXd1Iqxid8I=;
        b=iZf2j5Ls4/Lo8s6PJsh4R4afeP0j7uAgdP3P90bHSTBpi4IA8EIqZyeKBGSBU/Mr7r
         63ghUhRsMsv172Sc90ceHsoAjL0gqFDGBZ/Cxa5lJqrKOhhxII7C+tFEtewRHjSLRUrA
         gDusiKAq4fQZr+rq8pcF/+V/ejaAC98B575xnLBsBmajdGe5NkcwahfaguGHZAnbxOdq
         OF+w31T1gNxNBCSEXpdMpLulkcMe3uaTXYp4QjR2RINoobHyIR30EMw0xYGuGpylACmR
         xENNPko7OSwPh05rGAbLCF1K+lZsSLI8/VngUsJCcIvUJcSShq8ooPJI0VMz7fLHNFyP
         kaWA==
X-Gm-Message-State: AOJu0Yz4S5Ju55g+HbCMAPssJz7brCE0kOssEBMYztcSCMy/ZmlnxHX4
	USO1SgvdqbQaVKGHh7kwEA8HGdjJKziZojBSBFJtC8kZJJ/uBny4rogHj5g03O4YDg==
X-Gm-Gg: ASbGnct/8dm5h9u9UUIKfG90sRG2+ZupTMYo4189jLcvSLtZZli0TuIffdI3GxKfp90
	iD/QIiSCSF15xKvyCrr3g+HAcegaVSOjcKgP5AZHf2Otjwt+gFcZrs5WZt4n4+W9ka4iEO5+l0v
	xI1AfEmBgse0WSauNyNYtKj/YZkZkeCpgWWab6VdmZQ0xj0p/ayrXY1HetqphILj+bQEI1UUZsm
	q4niEyvvYkLhrJXxJ4gMyvsRoTE6Vn5PchzWC0cCD+38U5xwRYsSNwpF/SBk0A68FUdN4GP0REn
	msB7PqCbwYKkP58dDF/iBOcLFBOVru1rSsKPnUNiK+QMXcWQS3qYe3l75z4P8ukdOi+9S7xJ3U9
	LS/bZUEYhWCWBgUflne9tnK07RR67XEQek+RF
X-Google-Smtp-Source: AGHT+IFkSe1aDHqFjg0/M0fAna3fjoWHfOJMLIY3DM8xmJxPiPJWTQM0nn0fnvQCP/mmI0+viJExhA==
X-Received: by 2002:a05:6402:268b:b0:5ff:8cba:cffb with SMTP id 4fb4d7f45d1cf-6009010f421mr1985328a12.25.1747380335915;
        Fri, 16 May 2025 00:25:35 -0700 (PDT)
Message-ID: <b1e6cf8b-c42f-447d-9d62-9153d30e9547@suse.com>
Date: Fri, 16 May 2025 09:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
 <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>
 <aBoGyekf9KZeZCrK@macbook.lan>
 <d9a960ba-9690-4d0c-8b1a-1fa9275bcf22@suse.com>
 <aCXHhAdc-Woyzf65@macbook.lan>
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
In-Reply-To: <aCXHhAdc-Woyzf65@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:52, Roger Pau Monné wrote:
> On Mon, May 12, 2025 at 05:38:07PM +0200, Jan Beulich wrote:
>> On 06.05.2025 14:55, Roger Pau Monné wrote:
>>> On Tue, May 06, 2025 at 12:16:00PM +0100, Andrew Cooper wrote:
>>>> On 06/05/2025 9:31 am, Roger Pau Monne wrote:
>>>>> When a guest is allowed access to cache control operations such tracking
>>>>> prevents having to issue a system-wide cache flush, and rather just flush
>>>>> the pCPUs where the vCPU has been scheduled since the last flush.
>>>>>
>>>>> Note that domain-wide flushes accumulate the dirty caches from all the
>>>>> vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
>>>>> seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
>>>>> will result in redundant flushes in further calls.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> I'm afraid this doesn't work.
>>>>
>>>> Unlike TLBs, dirty cacheline can move sideways, e.g. by foreign or grant
>>>> mapping, but also naturally because of how cache coherency works.
>>>
>>> Does such sideway moving also imply that local WB{NO,}INVD on native
>>> could be equally bogus?
>>>
>>> According to the SDM, cache lines can indeed move between processor
>>> caches, but the memory controller must always snoop such moves and
>>> flush the data to memory:
>>>
>>> "Here, the processor with the valid data may pass the data to the
>>> other processors without actually writing it to system memory;
>>> however, it is the responsibility of the memory controller to snoop
>>> this operation and update memory."
>>>
>>> So a cache line moving sideways will always be propagated to memory as
>>> part of the move, and hence the data in the previous pCPU cache will
>>> always hit memory.
>>
>> But that's only one of the two aspects of a flush. The other is to ensure
>> respective data isn't in any (covered) cache anymore. IOW dirty-ness (as
>> the title has it) isn't a criteria, unless of course you mean "dirty" in
>> a sense different from what it means in the cache coherency model.
> 
> Given the direct map, and the fact that the CPU can speculatively load
> entries in the cache, I'm not sure there's much Xen can effectively do
> ATM to ensure a certain cache line it's not in any cache anymore.
> 
> It would possibly get better if/when the direct map is removed, but
> even then Xen (or dom0) might map guest memory for emulation or IO
> purposes.  Then Xen/dom0 would need to issue a wbinvd after unmapping
> the memory, to ensure the cache is clean in case a vCPU from a domain
> is scheduled there.
> 
> IMO being realistic it is very unlikely for Xen to be able to ensure
> that after a guest wbinvd there are no guest owned cache lines in any
> CPU cache, even if such wbinvd is propagated to all host CPUs.

Well, see Andrew's reply on one of the two "restrict guest-induced WBINVD"
of mine. What you say is effectively supporting the statement I make in
the descriptions there ("We allow its use for writeback purposes only
anyway, ..."). Which Andrew says is wrong for at least future use cases,
possibly even today's. IOW I think we first need to find some common
grounds on the underlying goals / principles.

Jan

