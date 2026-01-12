Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D01D14198
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200751.1516596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKx6-0000tF-6F; Mon, 12 Jan 2026 16:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200751.1516596; Mon, 12 Jan 2026 16:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKx6-0000qE-3W; Mon, 12 Jan 2026 16:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1200751;
 Mon, 12 Jan 2026 16:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfKx4-0000pm-UO
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:39:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4678d6e4-efd5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:39:34 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b87124c6295so191498766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:39:34 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b873051cc88sm85181066b.7.2026.01.12.08.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:39:32 -0800 (PST)
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
X-Inumbo-ID: 4678d6e4-efd5-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235973; x=1768840773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6Ibodr9gIUr10HeyX4IOp2enq6/vYD5VI+IHDt8lqQ=;
        b=YrCar92Ji9Qx4oiZXxbTKN2wPaqMuUYz3k2XINg6Hew62efvIfXssB72Vulxo5FcUH
         KU1GLzwrsBb+Bie++lSQDz9cInTvRQDEG4ombDciqhpT3UUWnZ378eAZ3s4a/hPzck+H
         rM2J8uYrTGP6mqmyDI+/rhHRTMp6u4RzUcv2GcktUVrq+ef+Tdxk9/4nogRqfJeM9dmt
         9ggd28Rg8Ek/3AhcKBe7yC55s/rQqW7EsDZZ66AfuDU8COFDfbo+bWByGutcLcO5itLu
         SYczfnY3rz7QwaPjDXdbgA9R+w9czdXv06kxW3YQCrvp7IOn/9vmDfFi4Q8GA1ReLe7j
         uNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235973; x=1768840773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6Ibodr9gIUr10HeyX4IOp2enq6/vYD5VI+IHDt8lqQ=;
        b=D/4LZHVlDmW4gBZil1q8BlgHYyhzxFczmFwGNAIPW4YdI20q7AvE4gc5sOi2M2m2HP
         WZEIbQuklU9JfHU/SW5uDp80xvfjvH++OQtcanXWyxxDHYn2SGpVvKecD7TITSAnL+d+
         kAOo1e5y/HBo+2zr3c7Z1DOxFZdOP2AbKXay2/iXWdBdshXBbVyTlmBueAIq0fWoudsy
         kCyLe/X/EV45NkvR+N+0dAo/YAABVUo59haFI9fFldvKpqIF+btHjnc0ANK1S/PxkOJ8
         3X1mumYgrBYTKHpHu1/qw09ScGl2eFniWkAGDJIEzpaLDEwKmhU3bzbtIWXO/Iiy16wm
         TQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUu/p2goDYTIhWUOf+06xfwYKE+UB/3B0VXmNumnarO2xUcWxAc+pT8oy04/DJpELLRTWZKVvp24zI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHe/uaxxLI5aBkzHvk5LfLgUvwXNqpjZBPBenreGf8sfEyLGgY
	AsjM/IYZwVRSbtrE+3gY5/38vssSxgTvV9UCGTTz1wUFpB6WbRVLpWnb
X-Gm-Gg: AY/fxX4+zPfyT9h1HAMgNI3fgLaL9M5DjvJxJijLh2Vt6riCnxF+jJowVc+BKORVeBB
	t1L3xdQxTWUSDEi5rxsW9omL8rwXCCzfDfVkWoIQQipJy64TlBz10NW9CereZhAJC4C/dF+GeQ3
	1+f7pWn0v4nD1+XZGx50WAvPEe0J37tmUqyE/ziuaw+g4i+MJNOEv92NfEY3vCMM/7cblRvpCW8
	nXz7ISiiA7EbGDlNTuRnQCUP2b0yIo57WcwWL3u5tNZHaV0A/T54qN5BV5OS76AKn6N7qEQm9Jh
	9jdHb4DnQtBFyffqOCXzHF4PXHgz64gI88DyECEjqmWjmo39NE9x8ztKBfb67gKppHsY9UG9iQD
	9swsdBSCK3EwFDI9i+4hkqltxExHTeEUG0leGzbxDKqqhEnmKOf95P69vyuvaNNn46WRWodD89y
	MpVZ3znPrOBoNUj2n37vU5252T9kb+W+QipI0s5qpAyLY8jVW+jP104XkLlOBQxWM=
X-Google-Smtp-Source: AGHT+IGnBIbf+pwz7VWcODCXvnB8m1R5rLQj1iCmfgvOuKYyLxGUzKJUVkzHnqJlc8YjXfJdxAUQUw==
X-Received: by 2002:a17:907:94cc:b0:b87:124c:5f54 with SMTP id a640c23a62f3a-b87124c62dbmr470287966b.59.1768235973035;
        Mon, 12 Jan 2026 08:39:33 -0800 (PST)
Message-ID: <dc510c7c-58d7-4435-9df9-b51b5c3341f4@gmail.com>
Date: Mon, 12 Jan 2026 17:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
 <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
 <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
 <988ba581-5503-45d4-a621-18cdc3b14cab@gmail.com>
 <30dbd0b0-2a2b-4064-b39c-4dfa438af15b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <30dbd0b0-2a2b-4064-b39c-4dfa438af15b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/12/26 4:54 PM, Jan Beulich wrote:
> On 12.01.2026 16:46, Oleksii Kurochko wrote:
>> On 1/12/26 3:28 PM, Jan Beulich wrote:
>>> On 12.01.2026 13:59, Oleksii Kurochko wrote:
>>>> On 1/7/26 9:46 AM, Jan Beulich wrote:
>>>>> Also, wouldn't you better keep internal state in line with what hardware
>>>>> actually supports? CSRIND may be read-only-zero in the real register, in
>>>>> which case having the bit set in the "cached" copy can be misleading.
>>>> [...]
>>>>
>>>>> (This may similarly apply to at least hedeleg and hideleg, btw.)
>>>> Regarding the previous bits, I can understand that it would be an issue:
>>>> if SSAIA isn’t supported, then it is incorrect to update the corresponding
>>>> bits of|hstateen0|.
>>>>
>>>> However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
>>>> All writable bits there don’t depend on hardware support. Am I missing something?
>>> My reading of the doc was that any of the bits can be r/o 0, with - yes -
>>> no dependencies on particular extensions.
>> Just to be sure that I get your idea correctly.
>>
>> Based on the priv. spec:
>>     Each bit of hedeleg shall be either writable or read-only zero. Many bits of
>>     hedeleg are required specifically to be writable or zero, as enumerated in
>>     Table 29.
>>
>> Now let’s take hedeleg.bit1, which is marked as writable according to Table 29.
>> Your point is that even though hedeleg.bit1 is defined as writable, it could still
>> be read-only zero, right?
>>
>> In general, I agree with that. It is possible that M-mode software decides, for
>> some reason (for example, because the implementation does not support delegation
>> of bit1 to a lower mode), not to delegate medeleg.bit1 to HS-mode. In that case,
>> hedeleg.bit1 would always be read-only zero.
>>
>>>    In which case you'd need to do
>>> the delegation in software. For which it might be helpful to know what
>>> the two registers are actually set to in hardware (i.e. the cached values
>>> wanting to match the real ones).
>> Does it make sense then to have the following
>>     	...
>> 	v->arch.hedeleg = hedeleg;
>>     	vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>> in arch_vcpu_create()?
> The above makes no sense to me, with or without s/vcpu/v/.

Right...

It should be also csr_write() before csr_read():
  csr_write(CSR_HEDELEG, hedeleg);
  v->arch.hedeleg = csr_read(CSR_HEDELEG);

>
>> Or I can just add the comment that it will be sync-ed with the corresponding
>> hardware CSR later as ,actually, there is some h{i,e}deleg synchronization
>> happening during context_switch() (this code is at the moment in downstream),
>> because restore_csr_regs() is executed and re-reads CSR_H{I,E}DELEG:
>>     static void restore_csr_regs(struct vcpu *vcpu)
>>     {
>>         csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>>         csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>>         ...
>> As a result, vcpu->arch.h{I,E}deleg is kept in sync with the corresponding
>> hardware CSR.
> No, the r/o bits will continue to be out-of-sync between the hw register and
> the struct arch_vcpu field.

Yes, it would be out-of-sync until|save_csr_regs()| is called, where
|csr_read(CSR_HEDELEG)| is executed. So the value remains out-of-sync until a
trap to the hypervisor occurs and a vCPU context switch happens, which triggers
|save_csr_regs()|.
So that’s not an option. The best choice is the one mentioned above.

~ Oleksii


