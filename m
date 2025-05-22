Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97DAC0E73
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994108.1377154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI75V-0005l2-Gg; Thu, 22 May 2025 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994108.1377154; Thu, 22 May 2025 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI75V-0005i4-De; Thu, 22 May 2025 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 994108;
 Thu, 22 May 2025 14:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI75U-0005hS-31
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:40:00 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a30ed5df-371a-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:39:59 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-601dbd75b74so7532764a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:39:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca358sm1089705766b.159.2025.05.22.07.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:39:58 -0700 (PDT)
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
X-Inumbo-ID: a30ed5df-371a-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747924799; x=1748529599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ztd2eHgaCnm9ZXAs6NqoZr1LzxEFZN7X/GWXBUY5RE=;
        b=SFZ7CH858Ot+/wUYHsBTgzirae2d/XU/UMNlcuCR0kHvw/ska+7sIXGoKGLSgbNr8Y
         6sNm8DykmKGMYRVoaDLD/D23+zRzSSfH4YA+JN3sEyFdKc1lcfHoXOkVV0vSpFC+N8go
         jDupr28PbM7cUFvja9Anu6+9suuAdGE9Isqc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924799; x=1748529599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ztd2eHgaCnm9ZXAs6NqoZr1LzxEFZN7X/GWXBUY5RE=;
        b=NIWnnBBZ8jun7CkxHuWctn9evFRDPRm8LkNZLEpAyQeuCNNz6ClECxPgAydpNbgjhL
         DkoquuaNgFjTjzw62ezh3zkMSlRMpcnbDRx3T7xfru7B2OsFfNXFYB7r5NoYcrJSLJP5
         dHeO+LnUcsFb2YqMJr7Iz1eIdGfiULNnIjvq8eJ+HGKhy1kXwM/iIkpWnTZc3AfgJHxX
         Z52SNRYJeH7bCH1yHAMyg/VbTvkQAjM/W3Nt7aAs7wQpB692sqjFPFWT+LyVcb+ZAGXL
         G1HD26wworU0lxM260tRjwoh1dlwSEm8xnLX59ScE9UED0JPmvcaLsPXtUKt/zFT84Ob
         hOhQ==
X-Gm-Message-State: AOJu0YyJbkP6PnN6l0o2wgIX0SjClRVlZtGflIy+Wr4xmives2tHzZHB
	5f6BwxI2AXkVHc2t78mFWrsTuORL5FHrQhsRmIiPHPg//OeiR6DWZeVqI19NTBWf+S0=
X-Gm-Gg: ASbGncvjkaaSIMwYPCjKMZp/zIbS65txWer7WOEv5UYBm5aCq5s6Raw8nESwESjsUbL
	/gPBlSbQePSb7bmUEB35oouylrR9XPRTSksWGGG3SuxElpwYqVCYt07ZQMF8kvrZj2lF0IVvi7v
	YMuvcsg+i2ZJlQirfBX3qYRuxgysv9R6hjkNLXOmAEjHWfJe7qRjE0kSzwHY/x+1sFDmvnZX/dA
	UIwgkkVSTgxYowpf3cHpXgmflIgoDZWVaeBENR1kMp0y/RpmtyPg6/CafsKZ3xmxOuf8LBTBj1v
	8/LwJlOllhsn6ay6Ic7Pb6GQz6cgAs5Qv0O+gqTidxNLZ1pV6te1W3iAoT8+bQB/M0+TeUDhJhI
	jNV9n1r7M3wvicA8U7LuGhoW7PJg=
X-Google-Smtp-Source: AGHT+IHTNdWMcY7VZtf912e15tflPTPWuc2fb6pzsg1CCqNP1rWgYFbN0FtsWjm7LCoJ4rDQBk4z9Q==
X-Received: by 2002:a17:907:930b:b0:ad2:2e99:8d9b with SMTP id a640c23a62f3a-ad5370339c4mr2601115366b.58.1747924798762;
        Thu, 22 May 2025 07:39:58 -0700 (PDT)
Message-ID: <8c1156a8-a626-4b62-9cc1-7790184b2b9b@citrix.com>
Date: Thu, 22 May 2025 15:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up
 failure
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-2-roger.pau@citrix.com>
 <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 10:10 am, Jan Beulich wrote:
> On 22.05.2025 09:54, Roger Pau Monne wrote:
>> Print the CPU and APIC ID that fails to respond to the init sequence, or
>> that didn't manage to reach the "callin" state.  Expand a bit the printed
>> error messages.  Otherwise the "Not responding." message is not easy to
>> understand by users.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>>  - Also print APIC ID.
>> ---
>>  xen/arch/x86/smpboot.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index 0189d6c332a4..dbc2f2f1d411 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
>>              smp_mb();
>>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
>>                  /* trampoline started but...? */
>> -                printk("Stuck ??\n");
>> +                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
>> +                       cpu, apicid);
>>              else
>>                  /* trampoline code not run */
>> -                printk("Not responding.\n");
>> +                printk("CPU%u/APICID%u: Not responding to startup\n",
>> +                       cpu, apicid);
>>          }
>>      }
>>  
> Elsewhere I think we print AIC IDs in hex; may be better to do so here, too.
> That may then want some text re-arrangement though, e.g.
>
> "CPU%u: APICID %#x not responding to startup\n"
>
> Thoughts?

Definitely hex.  Elsewhere APIC_ID always has an underscore.

I'd suggest:

"APIC_ID %#x (CPU%u) didn't respond to SIPI\n"

The APIC_ID is the critical detail, and the CPU number is fairly incidental.

Also as we're changing things, lets not retain the STARTUP name seeing
as it only exists on pre-Pentium APICs.  SIPI is what we use these days.

~Andrew

