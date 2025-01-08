Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6AA0579C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867053.1278456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSyK-0002UI-T4; Wed, 08 Jan 2025 10:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867053.1278456; Wed, 08 Jan 2025 10:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSyK-0002SE-QH; Wed, 08 Jan 2025 10:07:32 +0000
Received: by outflank-mailman (input) for mailman id 867053;
 Wed, 08 Jan 2025 10:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrZA=UA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVSyJ-0002S8-5c
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:07:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7fdd70-cda8-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 11:07:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso110559455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:07:29 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828a8dsm52895732f8f.2.2025.01.08.02.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:07:28 -0800 (PST)
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
X-Inumbo-ID: 5e7fdd70-cda8-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736330849; x=1736935649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gHYfKvzO1b6IQBL792DS4HTlxjx0BDDUAhi22w3xB5M=;
        b=vYovN5dpqQ6ym0D98s0J/xO6Q21l9eW7FSdnPmYQkQ7cfNJI1G/09ERbZj8ugyiaBl
         xRyPY4Eoiz3c6HvRzXM9Bk27RO5LwK86StPZLxynC/W6xrhevjVDdX/mB51XKG4li4IM
         Vq+0Rtt2XAAt41Md+53PqMLsMbzXWaWFqPhZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736330849; x=1736935649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHYfKvzO1b6IQBL792DS4HTlxjx0BDDUAhi22w3xB5M=;
        b=wpDoSsh622aEY1SOyuHqwHaS5nS88qA1ncnkBwN3sdBzg1EXgV7uG+wsjH0mZ6WyUc
         dBIrYH0Qgtep8RVfJzFnHplQNfvHNK/5hgYk17tHWJ10JMkvi37Boj05B3WBdDZlaAI/
         zSx/j0un5aPj3eKXnBXsew7HbjA0pLLPIHnbMgBtc/EBkcSvXd2cd3VreG2divqkVKG7
         c3RYd1ZZ53uEMTBASTOyvMuIKerLgonZvT7TCZZBk5w8tsr7J9CKeCpCrr+njyS4+smB
         BwzfKZaalW7cUm8HQcQyI5qliZ3LCZN07xYoQp9BNlehVq025AxYDb53PLMLK4sneq4h
         bJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNxJ+jKIpjAfsa/1eW+6y4mPtPBNI27Qk1zy6AsdpDC9uewXrw08ZP8CiBp0KoStKZmIK3KwgWyfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmpHZjQ3EOpPtoSK92c1nexOIbdNRXh7qkaM4gG/4JaRe1cSfD
	V7MhilSapji1eegY+x8OaSzNMt11k4MzHvN4lQl/mc5JkBBZOZUNN/eVzTjzgS8=
X-Gm-Gg: ASbGncvx13f7r+7zieHxKzZhTI7qMj2XxKLaGf6KuLODYOzfSPYyzslaBSsm8/QEWDs
	AUAAnNzVmR57e4ym5Hq8G7P9VCr/kv/faoWVfCoT2gCdCPjIwFI22NN/0BCcbq8eYdHB5hSgCHW
	eQwiMCH4jfGZy2jTQ2cRIegfP80p2nqajSupit1yAd0z1kmD/it6yXBctAMrp+apndDRWAKUKaO
	ZONbxGK3yqb2PZWfyG9BArw8YrYrVlhWQKoM5K2V3mzbBDzJ0X8DQgtYzpI16yTcRS55ZO5PA0Z
	7BQ2pK2ODgOF7qn8dEPa
X-Google-Smtp-Source: AGHT+IGffmGX3Jm2bE4Yq7/r9cJiZzwg+Me2b/KUaMurZpRreOmtSqd5WVJIexZbPtB5aD6fnhp6yQ==
X-Received: by 2002:a05:600c:314b:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-436e26ff287mr15082405e9.29.1736330849049;
        Wed, 08 Jan 2025 02:07:29 -0800 (PST)
Message-ID: <a1a3c0b7-63ee-4764-b33a-48f84ac70a8e@citrix.com>
Date: Wed, 8 Jan 2025 10:07:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and support
 Zen5/Diamond Rapids
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
 <7482da8f-8bf1-4f0c-b15b-7a31b27b48f3@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7482da8f-8bf1-4f0c-b15b-7a31b27b48f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/01/2025 9:15 am, Oleksii Kurochko wrote:
>
>
> On 12/31/24 8:20 PM, Andrew Cooper wrote:
>> AMD have always used the architectural MSRs for LER.  As the first processor
>> to support LER was the K7 (which was 32bit), we can assume it's presence
>> unconditionally in 64bit mode.
>>
>> Intel are about to run out of space in Family 6 and start using 19.  It is
>> only the Pentium 4 which uses non-architectural LER MSRs.
>>
>> percpu_traps_init(), which runs on every CPU, contains a lot of code which
>> should be init-only, and is the only reason why opt_ler can't be in initdata.
>>
>> Write a brand new init_ler() which expects all future Intel and AMD CPUs to
>> continue using the architectural MSRs, and does all setup together.  Call it
>> from trap_init(), and remove the setup logic percpu_traps_init() except for
>> the single path configuring MSR_IA32_DEBUGCTLMSR.
>>
>> Leave behind a warning if the user asked for LER and Xen couldn't enable it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.20.  This is needed for Zen5 CPUs (already available) as well as Intel
>> CPUs coming shortly.  It also moves some non-init logic to being init-only.
> As a user can enable/disable LER and support for Zen5/Diamond Rapids is added, and this patch
> is already in staging, I think we could mention that in CHANGELOG. If it makes sense I can do
> that during finalization of CHANGELOG before release. Does it make sense?

LER is for advanced debugging.  I don't think it's user-interesting
enough to justify calling out in Changelog.

I am intending to do a Changelog entry for Zen5 support generally,
although I'm holding out hope that AMD will publish an updated APM so I
can cross check a few extra details before we get too deep into the Xen
4.20 release.

~Andrew

