Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D3D1FF69
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203379.1518592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3BZ-0002NF-3F; Wed, 14 Jan 2026 15:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203379.1518592; Wed, 14 Jan 2026 15:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3BZ-0002LM-0g; Wed, 14 Jan 2026 15:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1203379;
 Wed, 14 Jan 2026 15:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vg3BX-0002Ky-Pv
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:53:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29a2e914-f161-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 16:53:26 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b87124c6295so552126366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 07:53:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5641casm2669242666b.64.2026.01.14.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:53:25 -0800 (PST)
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
X-Inumbo-ID: 29a2e914-f161-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768406006; x=1769010806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/elI78rHTIFfPYXOwGaxs777CQdiDc2ax5tIcwgj7aA=;
        b=nVQWXQhNfO1zm/duhmFm2gIwJHMf1QKjvIaRFw7Re1ScFqsdp/zmQ51z1NWO1NAJvl
         yzQTFFyzXNUxPVZZAFW/PizikPiHfU8vep7GEPb64tYldwJMMMtXa783oHZNHN5/pyY0
         NVVZvXrGAyNYH3d43tnRVY3+y5tJRl2Y8nWOR2z4z+h/QJwvVsOLoKWM3oCrWfAFZ09v
         HlrS1tdwH7PSOm1lLV2FcudmAlcdWvKKp/S9ipCCYI6xgPfc6+za7ikZeelYG3XtbUpc
         Ad7NwHYGx99SCi+4RWUHys36KZmPKxCl7NqQ87Uqw2LqACqFx3pV+s66MY8cfKd1yR4d
         JoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406006; x=1769010806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/elI78rHTIFfPYXOwGaxs777CQdiDc2ax5tIcwgj7aA=;
        b=Rxe2o9ILJ2ZU6QCcAwawRiSDgFXWDWqJiSexu/XVnBAgbhT1xgNNNIR7YBopDjF7l6
         F5/qhHe8NdKpUhDeRkqHHmMebEsxJ56WyD77Rpwo9nJR5pnA4DRgOrCF17M5U3EFhEUk
         5O2Mq14ieM0RJZ7mt7Jj9U8qnzC4Fav1rgK+c1UKmHT4x8bpjI+k8LV9cpiMRpYtWVhc
         tFB/HorSNTW+4pd1oxMnqO/EzBVwsgvDpyBHOXvmGEyFc39g53LUNN3xL2pw75vRpp6C
         dCELLgJCA1cTNx73AdaaAaAM5PfUoeqi2Lfg5osJLag56uLGTkGw7aKCPE/baOaJ7ERZ
         0Nbg==
X-Forwarded-Encrypted: i=1; AJvYcCUYHx2baTOlpwoFcXH4Fe/d9HB+y6m//LIW3hCdzTeulozTKdOuU1BTeEoXqYdwiDE+nrq9sjCM2V4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKogO+Guo590z6UOYBLVtMcoEVUkC/zxTYsNpGN8GURYaUOS5S
	/td2KbygFMLrTUvnc9zd0LL6T5R7rmCNtIPZZFsgp8jB7pVb8Gt08A6e
X-Gm-Gg: AY/fxX6DZhQKAO4CePNcYgJFT9o6yw99Eg+qBKFPWomEAcBWfBV/dlQ7Rvpg61SRdgk
	Ihw5A5+leMl7d5N9MUp79GaawJif4iZpOY7T2724SLzgWzETTCzZWtAu24mH3Qu4LloLeW5i4D8
	eEcJ2lBw46bzQ8Q0XA9PgM9ANlKjeQnyKQHqp8DUzv8KFu6bFIFdFZz+turLcaPBRuvaeKdSVOs
	SGn1Frwfc14xV9Z73Djx0qoH9pbpD6iWnDnYH1f1pD2mOGuLPxyEFX+f/UExxBsLMv8mOWDQ/BG
	rsI1Q1y0Z3fbZGF79cI0ejGLFwXFBd1aB+79rgm1Icu4g2IeEGRt3/P/7rPqh9dTi8OUuuozM+8
	H2MeCFH5xwi2+KvkXy73B3NJ2GKDVWfhg5qmVAhUHaYMwoenBbrz6Nw9DJDmG8YCvbG+yWgtJM3
	noWuQUiI7UXqKkxXfjUgW/EXhGHexvaGsBLArD659xQc3JxMBHPQFlq9B44rzr2i7zehlO8vBLF
	5YypQ==
X-Received: by 2002:a17:907:97c6:b0:b80:3447:e0c0 with SMTP id a640c23a62f3a-b876141f2b0mr286287666b.62.1768406005456;
        Wed, 14 Jan 2026 07:53:25 -0800 (PST)
Message-ID: <948f83bd-60aa-4ed2-b9e7-fd0e410fa1b9@gmail.com>
Date: Wed, 14 Jan 2026 16:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
 <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
 <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
 <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
 <c29d03ec-e83f-4594-9ef6-fcc7b99a318b@suse.com>
 <f4ffcd85-6091-47e0-8c02-e3e5a8ca1354@gmail.com>
 <922c5809-8070-4ff4-9caf-d953c4ac0c2b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <922c5809-8070-4ff4-9caf-d953c4ac0c2b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/26 4:04 PM, Jan Beulich wrote:
> On 14.01.2026 13:41, Oleksii Kurochko wrote:
>> On 1/14/26 12:17 PM, Jan Beulich wrote:
>>> On 14.01.2026 11:33, Oleksii Kurochko wrote:
>>>> On the other hand, if some
>>>> other negative error code is returned, it might be better to return 0 and simply
>>>> allow the timer programming to be retried later.
>>>> However, if we look at the comments for other architectures, the meaning of a
>>>> return value of 0 from this function is:
>>>>     Returns 1 on success; 0 if the timeout is too soon or is in the past.
>>>> In that case, it becomes difficult to distinguish whether 0 was returned due to
>>>> an error or because the timeout was too soon or already in the past.
>>> Well, your problem is that neither Arm nor x86 can actually fail. Hence
>>> calling code isn't presently prepared for that. With panic() (and hence
>>> also BUG()) and domain_crash() ruled out, maybe generic infrastructure
>>> needs touching first (in a different way than making the function's return
>>> type "bool")?
>> I think making the function's return still is fine and it is only question to
>> arch-specific reprogram_timer() what to do when an error happens.
>>
>> Still doesn't clear to me what should be a reaction on failure of
>> reprogram_timer().
>> Considering that SBI spec doesn't specify a list of possible errors and now
>> the only possible error is -ENOSUPP it seems to me it is fine
>> to have panic() as we don't have any other mechanism to set a timer
>> except SBI call
> panic() (or BUG_ON()) is pretty drastic a measure when possibly the system
> could be kept alive. If is pretty certain that future SBI timer calls also
> aren't going to work, then I'd agree that panic()ing might be appropriate.
> If otoh a subsequent call might work, a less heavyweight action would seem
> preferable. (Welcome to the funs of relying on lower-level software.)

I don’t know how OpenSBI will be updated in the future, but looking at the current
situation, since SBI timer calls have existed from very early OpenSBI versions up
to the latest ones, repeatedly issuing the SBI timer call will always return the
same negative error code indicating that the timer call is not supported.

I can add a comment above panic(), or include an explanation in the commit message.

>
>> (except the case SSTC is supported then we can use just
>> supervisor timer register directly without SBI call).
> So maybe a good first step would be to use that extension if available?
> Might even think about requiring it for the time being ...

I initially started working on SSTC support, but then stopped because an almost
production-ready board to which I do have indirect access does not support this
extension. As a result, I decided to proceed with SBI approach as it covers both
cases when SSTC is available and when no.

~ Oleksii


