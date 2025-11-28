Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB5C924F8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 15:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174895.1499835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOzNw-0004ui-Pw; Fri, 28 Nov 2025 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174895.1499835; Fri, 28 Nov 2025 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOzNw-0004rx-NC; Fri, 28 Nov 2025 14:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1174895;
 Fri, 28 Nov 2025 14:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHoX=6E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOzNv-0004ro-5V
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 14:23:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d41c7504-cc65-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 15:23:37 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so2945083a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 06:23:37 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750ac0276sm4217392a12.15.2025.11.28.06.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 06:23:36 -0800 (PST)
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
X-Inumbo-ID: d41c7504-cc65-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764339817; x=1764944617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPGnm30p0nozbPNeN4QDMgquWE3hA2aJ+BeYLlm8EDQ=;
        b=edneWRfMYXku0hh6icb3BZeurzNfYzCvou0YqdeECVtKqvZWEXRIuxGkekSyxhK/zP
         mIGcGTNq4JXXTGc39Kpqa4MBs1s06ws2YqJNWvoF/FE8nSasWDw+M0Ngb8bkyolhI77p
         kKO73Je3DZpiicm0m/IrQQGhr0iM4sxmI4D/iVcbSU7aR18MuopE4sPRxN89/E/sldjB
         t0yWNkWgVJd6mUrKxBFV+XkjzoZkTylxqw5kVqLvuInWXVaSTD8uK0wO73g/CAz8KAQw
         iO8U7V1+CZBtpM+315K1hvpSJdL1XFQsWu6mGY388yjrxzPTXWl174tof/1JWiHHw2uO
         gEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339817; x=1764944617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPGnm30p0nozbPNeN4QDMgquWE3hA2aJ+BeYLlm8EDQ=;
        b=e7nWAZMZPyYPKmIjn5+w9/9lPyqRnwpJjkcE5IOh8z4F1KljTh7Opu4+8+mEP75H96
         6vVP2rtHXJLJi+dUo/QCYAOlnm8M2UI6S1UINT/1fPF+Wjq7LFTJKdB/GE5CqhuVlRz8
         diHE1+vj2tPQlHihBug3e08U9z8PIUtFvWJAJUUbaUaug9Do/HoIdFDjooFpHlNR2iFY
         fPzJJfMp0cmtN6iphgaLttfY0LNTM4ZzgWdbiowvU4LQ2TO4B5/L7jfR/NoecLgTRuh0
         k5bMjz8kPZIY0K2OMECnTw5A09guzZ9x7Govp2e9JNlUJY2XjEXp2+mTm3R4Eh7ejSXR
         E14A==
X-Forwarded-Encrypted: i=1; AJvYcCUMF3+NRQO9lv9kWNSnhj6giKUHsc4mkqnWnM3hYsKdnkXW6OG+pzSAYKYOK5RZebKqFx1E/+2/wro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnCjhyhkdDNy0RPpPQAjwINf78/8JG5sJ5uHknT6LMhDO1GPhh
	3CVHA0Nfca3dbEcIU0rV+GONPusKlRRbdYbIYNcM6oGkKyNF6n3jN31w
X-Gm-Gg: ASbGnctxO6vr9oQEz3vimwRoVC3Qua3f3uDOYmms11xP4aMtzgSf1xG2VqTupsN3w98
	BoqzY64qv3DJnco/KtUnbnjP3n+fIMmQDCuiKqdeMMGWAlcA/AGnY8JBRjH57UISwVR//q1xkQg
	3xtJungZw1fQi3bsw9etZWAwpbFSNC2z8NONnWBz46Cfg63MR8zdSKSu5yxste43IalnLKd+E1Z
	KJ2xHY9VLZXMKMJp+X+TO0CFVerGc59uCKB2UMc02Vn5OyoQZ7juuy/1ou3llX4uU1IM6uvdJcD
	UQbZzTKPd1P0ZM70G7Qj+TsLSavq285O5FKV0/Fef0IN3QxAg3be5JPKPIV2CJKkzwBwrMsW1rS
	XV+/2E+HxOzXbZY7PAQRmMxRGQbrusDAoPT0pv0iacLflIjVEIxLldpsHft79AUw71U7LvLC4l3
	UkZ/m933LCYcHHGQZIPOoGxzqPlUYcYjrq211SbUJ6irTTZTNAy3H3UR+JuMHetifI
X-Google-Smtp-Source: AGHT+IFV26JmrFFnwqbmwhiAli2NYC4giY+geZ03VLH7do2KUL2795ZeuPLfns0CmnnYHVDN+YAp2g==
X-Received: by 2002:a05:6402:350f:b0:647:53a0:18e4 with SMTP id 4fb4d7f45d1cf-64753a01d5emr4764575a12.27.1764339816301;
        Fri, 28 Nov 2025 06:23:36 -0800 (PST)
Message-ID: <32c8f061-1307-43e0-ac80-c2412655ea18@gmail.com>
Date: Fri, 28 Nov 2025 15:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move vcpu_kick() declaration to common header
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>, Paul Durrant
 <paul@xen.org>, xen-devel@lists.xenproject.org
References: <f291e02042a24de86cab5f62cb2301ad8c72fecf.1764328801.git.oleksii.kurochko@gmail.com>
 <18a52859-1b73-44b9-a54d-2f37c7ec9933@suse.com>
 <883304e4-0a1a-464d-b9e0-93d9d8a4ae82@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <883304e4-0a1a-464d-b9e0-93d9d8a4ae82@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/28/25 2:21 PM, Andrew Cooper wrote:
> On 28/11/2025 11:58 am, Jan Beulich wrote:
>> On 28.11.2025 12:38, Oleksii Kurochko wrote:
>>> The vcpu_kick() declaration is duplicated across multiple
>>> architecture-specific event.h headers (ARM, x86, PPC).
>>>
>>> Remove the redundant declarations and move vcpu_kick() into
>>> the common xen/include/xen/event.h header.
>>>
>>> Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
>>> as it is already provided in ppc/stubs.c.
>>>
>>> Include <xen/event.h> instead of <asm/event.h> in places where
>>> vcpu_kick() is used, since its declaration now resides in
>>> <xen/event.h>.
>> Centralizing is of course good. Question is whether xen/event.h is a good
>> home for the decl. Generally related decls live in xen/sched.h. There was,
>> however, a vague plan to try to split that up some. Others, REST
>> maintainers in particular: Thoughts?
> +1 to centralising.  I'd suggest xen/sched.h too.

I will move to xen/sched.h. It will be even better as the patch will be cleaner
as <xen/sched.h> is mostly already included in the changed files in this patch.

Thanks.

~ Oleksii


