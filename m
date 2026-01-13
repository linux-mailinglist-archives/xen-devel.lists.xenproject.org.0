Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F85D1A810
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 18:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202228.1517841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhoC-0006Uh-4n; Tue, 13 Jan 2026 17:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202228.1517841; Tue, 13 Jan 2026 17:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhoC-0006S4-25; Tue, 13 Jan 2026 17:03:56 +0000
Received: by outflank-mailman (input) for mailman id 1202228;
 Tue, 13 Jan 2026 17:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfhoB-0006Ry-EF
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 17:03:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6bddc12-f0a1-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 18:03:53 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so39438a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 09:03:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4cfe76sm2244644666b.40.2026.01.13.09.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 09:03:52 -0800 (PST)
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
X-Inumbo-ID: d6bddc12-f0a1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323833; x=1768928633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KebyABBjQbUhJvo+2ln2Z51K2TrX4MToP3GOAoNDiqg=;
        b=DACkUcR0EFAgLlH0oXKTG4MwD57ej6e/4tSxW8/sDw4wcZSIu2sg8EQvvAbsfwo8lj
         HlKGv48BOmsMgcf/SteMyar3Ym8eEEUAWrv5hZsMxwbYlWozt0kKUfj4l40gohSOT0nR
         l0bq/viOQUBNzIyBA6BW4OBiiC19a5eQ+Q6ZTT5TYjhDQYVCpJXx4XoQA+SdKm5HdTzO
         NOQ1HFC8vcLqHpBL74xYEKGswWl+tE1tcEb5zy87vwci/wkj/y4zCjSBpjHBTE1cwmvX
         GmG7rFd+edmXry01fG4FKcbbYddh7OwMecf8MfAo7vYRSz0pWdwjj9lc17dsEpbvTphk
         Ibkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323833; x=1768928633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KebyABBjQbUhJvo+2ln2Z51K2TrX4MToP3GOAoNDiqg=;
        b=kLFPdI3PvebTWxKbSE/xw2fU3dhf9NPTZIcbkKLDIoAcAvPoWHeW86jwx4rdcfkLyt
         Xl83Nkhwj5zbLpFKs0cf8vkHLOfZHyNAJX+7b/AKG/qjKr2IsIyvDfXfQAwOcdD4BHRQ
         PlBi4KZOw8gCe/IcNYtKCZD3lAm1Y+rZOMoR8rSuWpLORnrQ1WGc50CVixrDN3XQKmtD
         XzzvPV1+ecrP2IBCXRVqhu7rkpGeHQ+G3Na3CH0WCCXA2nsEcNvs4fyEtezxmMdp7raB
         LK6NCtwHHNcz8ZbvB+NVBDM+r4URPAs/ZHaXg/FFXquffnf5BK8PD+VAUt0tVlfWobih
         4lPA==
X-Forwarded-Encrypted: i=1; AJvYcCVzLfFp1lfZXPmmVIX8Npbu7z/7ZVweyA0cZtz42qh7+KLGAaXfqMyXIUSkgGJfGn1mV5OsfyI9etY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqtMgZ/vZgaN+VuNqdzHghwLXe/cQ97Fr3HXXqeCGVnKWkfpql
	BIT0GFGryOLgXs8XjFTfKrLW8kOgquZWw2AIV0uGJ9paRcS8bwgdf0qM
X-Gm-Gg: AY/fxX5RDJFuqc/G0rM0YXce9wGk1ZbWRKiQQdJPH4dFYI6F2bdfcjM/9LG5jKS+YJX
	8eBLfUBnnnoBP6xBb0SQKSJIn/5Vz05CasQ3lUE/0UdSU7BLZ583wkkPLGvPA/IUfpaVczW7g2E
	lXSqxT+tL5Of5emARPuNgyElvwAYN88Bm1JCdX0QMqBFjbWc36qCc1styH6qnRo0OypUsQiiZPG
	0rlAKy6hTjuDrygB/549UdbYtXtxBSGSqVtmLlOIhVJG83IzDExc4Oh3HDxBsKDYb6sCLW3S0t8
	BogKnza7CJPKG/hlalTkuZlI6p38gMmnXiHH/OPJvjR912gm0CuvNGL9ElKSRiLA2xAndZGkiVR
	VtnpRMAm/tcSxysGIBBJvH0wemA9L0hMBthNe/duz9B3W42Ys6iUOfRMAALpr4G9OzkVBz2Drp8
	p9bvxMMHDm+PIWTRPj0sRomNXVrBvo+KhdMY/KLHbHhwEm7oeAyMxoLbwNqK8rPLg=
X-Received: by 2002:a17:907:3f20:b0:b7f:fa5d:53d with SMTP id a640c23a62f3a-b8735ad63aamr306076666b.30.1768323832426;
        Tue, 13 Jan 2026 09:03:52 -0800 (PST)
Message-ID: <7511b588-8699-49a9-99d0-0cb94f0fac76@gmail.com>
Date: Tue, 13 Jan 2026 18:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/15] xen/riscv: init tasklet subsystem
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aa1aecd5-afdc-421d-8b4a-314aa82a1157@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/12/26 5:20 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> As the tasklet subsystem is now initialized, it is necessary to implement
>> sync_local_execstate(), since it is invoked when something calls
>> tasklet_softirq_action(), which is registered in tasklet_subsys_init().
>>
>> After introducing sync_local_execstate(), the following linker issue occurs:
>>    riscv64-linux-gnu-ld: prelink.o: in function `bitmap_and':
>>      /build/xen/./include/xen/bitmap.h:147: undefined reference to
>>                                             `sync_vcpu_execstate'
>>    riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
>>                          `sync_vcpu_execstate' isn't defined
>>    riscv64-linux-gnu-ld: final link failed: bad value
> How that when ...
>
>> --- a/xen/arch/riscv/stubs.c
>> +++ b/xen/arch/riscv/stubs.c
>> @@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
>>       BUG_ON("unimplemented");
>>   }
>>   
>> -void sync_local_execstate(void)
>> -{
>> -    BUG_ON("unimplemented");
>> -}
>> -
>> -void sync_vcpu_execstate(struct vcpu *v)
>> -{
>> -    BUG_ON("unimplemented");
>> -}
> ... there was a (stub) implementation? (The code changes look okay, it's just
> that I can't make sense of that part of the description.)

I haven’t investigated this further. I wanted to look into it now, but I can’t
reproduce the issue anymore. I reverted|sync_vcpu_execstate()| to a stub and no
longer see the problem.

I will move the introduction of|sync_vcpu_execstate()|. It doesn’t seem to be
really needed at the moment, but since it is already introduced and there are no
specific comments against it, I think it can be added as a separate patch in this
series.

Thanks.

~ Olesii


