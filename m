Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAA8C575C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721537.1125014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sY6-000839-WB; Tue, 14 May 2024 13:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721537.1125014; Tue, 14 May 2024 13:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sY4-0007zp-Fn; Tue, 14 May 2024 13:50:32 +0000
Received: by outflank-mailman (input) for mailman id 721537;
 Tue, 14 May 2024 13:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6sXv-0007tI-Aa
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:50:23 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e888dc05-11f8-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:50:22 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e2c70f0c97so68385441fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:50:22 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8e2fsm195316105e9.3.2024.05.14.06.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:50:18 -0700 (PDT)
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
X-Inumbo-ID: e888dc05-11f8-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715694622; x=1716299422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2AOQGq9+skWEV6tKei9ANLmo3y1qxkBttfUvGHeRp28=;
        b=REKGe50FeLuClHZ/mo9PofLkJp4wpdhTIbr6tfAhksHSL7/aDVZ0lk0hwNgr15c8i0
         qHy3+CJgyiQqct6taEwx5PgOauFAE+eMDFpu26SFQV8CgX10W7u5XcHM/26V2rAOWoR5
         qTSf1Rk6b67Ilh4EB/yz6KNA3+sdlAmKuJ25Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715694622; x=1716299422;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AOQGq9+skWEV6tKei9ANLmo3y1qxkBttfUvGHeRp28=;
        b=Mii6L4ZBb4RXDgXNHAozUYQYRj82wqPCnRlmXXl+COnnTe4dmB9/yYqTIgRHFkqfe0
         lVtTPS4YM4zSSqVgaQST2GsvGoZZSh4LhjGnYDA6umCE61wvsegWfxg2CDZgCf4DkvB6
         Q0wMPw3ADDLaLRL2497lkIlddbLwd5ysPveJrJ9XwEUNOM6elBS7/Q6nrRjVfHPqsvnu
         8a/J3ymcqOoAkZ4bjyJmCfSaCcNXT8+lDM2z6JImAjapO1TkyeGgx/N0+a/GGPbV2bc/
         HW3I0uj8rEbiWRytgRqyVF+qeD6pb4rBQOUZOhBMcGX4kfM/ggA4ZIrTBwO3HVJUrP0b
         e62w==
X-Forwarded-Encrypted: i=1; AJvYcCW5+gCxzVoLRTIOB8aHDK9DurwuX3dAHIX3r/wTVp2sPpzq4eF7Be1J2/9ibYQYZUnJ/A0w23t+pIT3VxfJXydnYhvY+R0HOKOnMtdXGbQ=
X-Gm-Message-State: AOJu0YzOlbVY/e1AUlRg2l7gM6J0aZhrZqltjHtjbn6/T4nHUD5SUGck
	SNULZhhmrRTbgiH6MNWgL8LLI/l6V7BkdTbjq/5RQCBvZ1KlG0uCLmVXizYTk30=
X-Google-Smtp-Source: AGHT+IH4bZZoyFcDhZTeTRVN4PISwUKN2hEV1GssB4HTQ1//pKd8njil8PbWTSrXzWU/hYUAoki64w==
X-Received: by 2002:a2e:96ca:0:b0:2e3:603e:469b with SMTP id 38308e7fff4ca-2e5204ccf5cmr80919331fa.40.1715694619788;
        Tue, 14 May 2024 06:50:19 -0700 (PDT)
Message-ID: <dd689012-0554-43ae-b22b-035415ce3392@citrix.com>
Date: Tue, 14 May 2024 14:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 12:09 pm, Andrew Cooper wrote:
> On 13/05/2024 9:59 am, Roger Pau Monne wrote:
>> There's no point in forcing a system wide update of the MTRRs on all processors
>> when there are no changes to be propagated.  On AP startup it's only the AP
>> that needs to write the system wide MTRR values in order to match the rest of
>> the already online CPUs.
>>
>> We have occasionally seen the watchdog trigger during `xen-hptool cpu-online`
>> in one Intel Cascade Lake box with 448 CPUs due to the re-setting of the MTRRs
>> on all the CPUs in the system.
>>
>> While there adjust the comment to clarify why the system-wide resetting of the
>> MTRR registers is not needed for the purposes of mtrr_ap_init().
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> For consideration for 4.19: it's a bugfix of a rare instance of the watchdog
>> triggering, but it's also a good performance improvement when performing
>> cpu-online.
>>
>> Hopefully runtime changes to MTRR will affect a single MSR at a time, lowering
>> the chance of the watchdog triggering due to the system-wide resetting of the
>> range.
> "Runtime" changes will only be during dom0 boot, if at all, but yes - it
> is restricted to a single MTRR at a time.
>
> It's XENPF_{add,del,read}_memtype, but it's only used by Classic Linux. 
> PVOps only issues read_memtype.
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Actually no - this isn't safe in all cases.

There are BIOSes which get MTRRs wrong, and with the APs having UC
covering a wider region than the BSP.

In this case, creating consistency will alter the MTRRs on all CPUs
currently up, and we do need to perform the rendezvous in that case.

There are 3 cases:

1) Nothing to do.  This is the overwhemlingly common case.
2) Local changes only.  No broadcast, but we do need to enter CD mode.
3) Remote changes needed.  Needs full broadcast.

~Andrew

