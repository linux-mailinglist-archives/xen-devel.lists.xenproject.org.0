Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A831B5A1C6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 22:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124829.1467023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybtj-0008Fq-4C; Tue, 16 Sep 2025 20:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124829.1467023; Tue, 16 Sep 2025 20:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uybtj-0008D4-0q; Tue, 16 Sep 2025 20:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1124829;
 Tue, 16 Sep 2025 20:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uybth-0008CW-Is
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 20:03:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33a3040d-9338-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 22:03:24 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso52588505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 13:03:24 -0700 (PDT)
Received: from [10.10.152.155] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b1840esm16601532b3a.48.2025.09.16.13.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 13:03:22 -0700 (PDT)
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
X-Inumbo-ID: 33a3040d-9338-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758053003; x=1758657803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQStpmZrDOJE/kXT6itgcJh0LkbKDe3gIMs56zKvQY8=;
        b=LDCpzn2b1HzLtgte1e0K9YNYfMJfkeQtQ+NHVT5+fHIwiI8FwPG7xFTtd6GV9Yf0ia
         /yAdtoyQrxdu3UbWt9UfRXIg2OsbjDKLL1KsH5RTQaK8YpFNzNaSPCz9NwicfsrKwmuL
         LUL66kCcX96kAvahIID/NJQjEhFe84bj1z3y6IB7nDtRdAjoUbJCGIyp/52Cg4lZeHCs
         xUpPWAjxRS8SEZdEJ/RF5kKkLNic4LDba0J7uLm2rM5D5HEPiNF/2fmCCvyDmDtNQcv8
         YA16fa1WmJSSiFqDRAJENH9UnmqNpYJUG7kLe98A57ghe0Q42IkWc7ggl3hBQuGxQYJy
         b5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758053004; x=1758657804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQStpmZrDOJE/kXT6itgcJh0LkbKDe3gIMs56zKvQY8=;
        b=XfwqRdDVQsTTZXoaIOrX0f7t0QqfQ0F/yISciFbpIYcyjmCqctl7RJsTh1aaNg6AKN
         gz5dR9jwKKmsYa389phm97R5S1GqadVJ2NZkUzWTxSzNClNmY2xkwEZkIxJTEPgwAMRt
         FAQHqYer7qQjhRRzZ/5lFUE9F99dwm8AwxDSiHAWu/sX29VcXubzrokRqMT9CR2dABw2
         9Vl7bX0wR22uRkn2E7HIdFuaYSvNIpR8iPZHOE3BrrOS+vieguQCdVFm4pH6mp+zv7jX
         POW21igRlzTvl/cH2H04izRpDwnjx5/clw7cFN9+CntcB9LMa0ZymBxMZmdn3MxIiPOn
         YmGw==
X-Forwarded-Encrypted: i=1; AJvYcCUrBqwVhsVBnTLOd2o/b0KL4u1giX6mUwzUQ/uGB9ZJR+zgL8O95T0qCZ4Us93iQMDVzz19GJA8UCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCBcrd7W+APxHboUNAhG2+jB7kk1ww69CRyn8SAt4TtVwUeGEf
	1xAkyhub4zsBIrCJrtR2sp55D40HZGvxyW8oDuqx5JjTAeiWcXu4HAK3cZjxR3FLoA==
X-Gm-Gg: ASbGncusSAR/5ssYpr7oRktgaz+QEQowNvMXl8xMEA4uEMW7gdcLKFur8Y95cmLC2/d
	riiJStnvMbjtnVwf0EBhgk29DxctuN+5HSj6j2nKNmxjlttlC25kfXyj7zCjXgmqbzz2m1yS29y
	8wV4uI09j5VrsfBjFLKCG6MCG30IrBKx6VIRBcBFwyWijT0mWBrDbNwD0eytVhwyg/plmooqIS5
	cMhqAQrRQzLceo5By4WMIbSmV7hdFMvEGExa7RCNqYXhiu9Lnh/OZFORJGOAEQLwVr/zfUBWUUi
	OI/JVE5/XGPuJ4BPJEpSK1XMlugZJDKdMk+R6ZXIwb1VKwSRwrFsxLOglUWnCA5Vk/bMNPgAmDV
	a21fjmrMJZ+naerxFsCtABthSCga7KGif3XNedMROqp6a
X-Google-Smtp-Source: AGHT+IEcZkUHKeiEOiTn0gsJ47va8ogau+sAU6ka7K2UBEv21Ho5RYPI61YnRnUjPfVoy7Z3nM/j3g==
X-Received: by 2002:a05:6000:1789:b0:3ec:db0a:464c with SMTP id ffacd0b85a97d-3ecdb0a46cdmr3248046f8f.44.1758053003568;
        Tue, 16 Sep 2025 13:03:23 -0700 (PDT)
Message-ID: <e6199dc4-be32-4d02-86a3-1548b8aacc73@suse.com>
Date: Tue, 16 Sep 2025 22:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
 <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
 <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 21:35, Dmytro Prokopchuk1 wrote:
> 
> 
> On 9/16/25 17:27, Jan Beulich wrote:
>> On 16.09.2025 14:45, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -98,6 +98,23 @@ Deviations related to MISRA C:2012 Rules:
>>>          even when debug-only assertions like `ASSERT_UNREACHABLE()` are removed.
>>>        - ECLAIR has been configured to ignore those statements.
>>>   
>>> +   * - R2.1
>>> +     - In the specific build configuration (when the config CONFIG_ACPI is not
>>> +       defined) the 'BUG()' macro is intentionally used in the 'prepare_acpi()'
>>> +       function in the header file 'xen/arch/arm/include/asm/domain_build.h'
>>> +       defined as 'static inline' to trigger a runtime error if ACPI-related
>>> +       features are used incorrectly.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>
>> I response to me outlining a deviation-less alternative you tried it out
>> and said it works. Then why is the deviation still being put in place?
> 
> Yes, that's true.
> I started with that prepare_acpi() function and I tried to move it into 
> xen/include/xen/acpi.h header file under appropriate #ifdef:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/commit/d15cf91de92f1f8ec67911c51a13e7f095c1bcdd

But an important part of my proposal was to have no #ifdef around
the declaration, iirc. With that, no violation should result.
Whether (or why) moving would be required I don't know.

Jan

