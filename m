Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B469393BECA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 11:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764874.1175445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWuXL-0001CM-2y; Thu, 25 Jul 2024 09:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764874.1175445; Thu, 25 Jul 2024 09:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWuXL-0001AS-0B; Thu, 25 Jul 2024 09:13:23 +0000
Received: by outflank-mailman (input) for mailman id 764874;
 Thu, 25 Jul 2024 09:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWuXK-0001AM-EV
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 09:13:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234a318e-4a66-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 11:13:21 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a88be88a3aso850029a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 02:13:21 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb98a2sm49682166b.217.2024.07.25.02.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 02:13:20 -0700 (PDT)
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
X-Inumbo-ID: 234a318e-4a66-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721898801; x=1722503601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbOh1YnLRGUof5jIdg/YaLDXWdX8IKsWKWEs5XtNUCY=;
        b=MQdkdCTWw307vgLLjc56GPiwxrwBTT8ofe1vSijyvSOFk6qIHMPU6OSadKfvoMtUJS
         0HViZGag2e2XzB/MgQUpQW1kWD591PY53FBqZuDzPG6sUJxPIyIBFxv1eaHC0jrTvyY8
         30Z9NZCIxGmVWAJ2l+jSeeo8dSqx/9682iIcIb/wArVPaXA86aj+DDg8B0Jvsk5MuqK2
         0S6APIJTRi5y3f2ptovjNWmMN8rXD/2zlop4k0rBB/KMS2gooohtK+oqgsxV/0aWyWyI
         CI2slu/Vsxlgsj3+xNSO05nS8La3+91KgvZ6047ZXXL/2kjwOho7l7r8V3N0naf+pRX5
         p8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721898801; x=1722503601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbOh1YnLRGUof5jIdg/YaLDXWdX8IKsWKWEs5XtNUCY=;
        b=mHH9hL6sgYtHsQ6XR9m3v9dzyO8aZ2xif96nnpd/LIpD/zd8v8csclWaIP+eDhiYUN
         eTcQMYjWbmAAo7wa2zeqy+ap9CvHNdoC3eYWLNgiazEt4TStsZSBUUiZLRmIl+U7TuWn
         A2omJ64XeVwXd818Y4+LiwdYT7TWAWWTv+64T8PiL67ULCOm4hBWT05lJvDcK7cwl5uz
         dISrw4coHlToTD6ueGvsDExcvx2LOwEnoTxkGtRG98iDW+uDizcnLxX+0JC3ECue+RnP
         f8FnrxpsHUAZZmjBQechkSHrvvm2p22PAyq8UAeHzm3Hn4AW4AnncHwaGlYrQWqcjssC
         XlaQ==
X-Gm-Message-State: AOJu0YyExXRtSytqyuwaWh89tlHOUXysLf77wkAkS1lLytI2paoExxai
	5ylg1cawsdGxcscwzBXPoEx5OtCYCFp+5MJEND6KxngeYwmwU01f8mO7aZlfAM8=
X-Google-Smtp-Source: AGHT+IHxmwgcPOVP7EAaplSEN4sDlAIuvKhcJZrN3BNDqOUMOcNM4PXGUk94TQFdyWJlKa2+KaDWzQ==
X-Received: by 2002:a17:906:c145:b0:a7a:a138:dbc5 with SMTP id a640c23a62f3a-a7acb97172bmr106298066b.65.1721898800661;
        Thu, 25 Jul 2024 02:13:20 -0700 (PDT)
Message-ID: <036855d4-b1d4-444b-92d6-84376ecdffb8@suse.com>
Date: Thu, 25 Jul 2024 11:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/xen: fix memblock_reserve() usage on PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20240725073116.14626-1-roger.pau@citrix.com>
 <20240725073116.14626-3-roger.pau@citrix.com>
 <a249e651-a2a1-4ea9-b262-0d04a8abaf0e@suse.com> <ZqIIgc9xj6wmDJtE@macbook>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZqIIgc9xj6wmDJtE@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.07.24 10:10, Roger Pau Monné wrote:
> On Thu, Jul 25, 2024 at 10:01:17AM +0200, Jürgen Groß wrote:
>> On 25.07.24 09:31, Roger Pau Monne wrote:
>>> The current usage of memblock_reserve() in init_pvh_bootparams() is done before
>>> the .bss is zeroed, and that used to be fine when
>>> memblock_reserved_init_regions implicitly ended up in the .meminit.data
>>> section.  However after commit 73db3abdca58c memblock_reserved_init_regions
>>> ends up in the .bss section, thus breaking it's usage before the .bss is
>>> cleared.
>>>
>>> Move and rename the call to xen_reserve_extra_memory() so it's done in the
>>> x86_init.oem.arch_setup hook, which gets executed after the .bss has been
>>> zeroed, but before calling e820__memory_setup().
>>>
>>> Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> While the commit that introduced the user-noticeable regression is
>>> 73db3abdca58c, I think 38620fc4e893 should have been more careful to not
>>> initialize the memblock ranges ahead of the .bss zeroing.
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>> I'd prefer using 73db3abdca58c for the fixes tag. Otherwise you'd need to
>> add this patch to the stable branches, too, which is technically not really
>> needed.
>>
>> Additionally I'd like to drop the Fixes: tag from the prereq patch, as this
>> one doesn't really fix anything.
>>
>> I can do both while committing.
> 
> I was unsure myself (as noted in the post-commit notes) about which
> "Fixes:" tag to use.
> 
> Is there anyway that it can be noted that this commit depends on the
> previous change also being present?  For backport reasons, if anyone
> ends up backporting 73db3abdca58c it would also need to pick the two
> patches here.

This is normal business of backporting. This patch added to a stable kernel
would at least result in a build failure. The person doing the backport could
it either fixup locally in the backported patch, or look which patch did setup
the source to make this patch work.


Juergen


