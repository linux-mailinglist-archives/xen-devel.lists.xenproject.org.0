Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B4B280D6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 15:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083467.1443059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umuo8-0007WY-SP; Fri, 15 Aug 2025 13:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083467.1443059; Fri, 15 Aug 2025 13:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umuo8-0007V7-Po; Fri, 15 Aug 2025 13:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1083467;
 Fri, 15 Aug 2025 13:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umuo7-0007V1-RF
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 13:49:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60d4b10-79de-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 15:49:22 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9170db547so1290916f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 06:49:22 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb64664133sm2017634f8f.12.2025.08.15.06.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 06:49:21 -0700 (PDT)
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
X-Inumbo-ID: a60d4b10-79de-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755265762; x=1755870562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vTspprVRQ5VrEg5X9otlKvtAlh9KpfewSF/fCoT1Klk=;
        b=o8e570TKLzgOmm8kEDQxVlqK1eY/rALYpHSQk2FkJX3lxXEX+Gv/wwIb51JLwI6UcN
         JLQKYlMPBpG+7cQZvRXixELJ+dCUtjv3vqgGksewuae+kHrFksTd8EsnZq+8eOi4C1M0
         VPHuGZ9zDlUV7+T79E233dVApBhvrP31ZvYW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755265762; x=1755870562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTspprVRQ5VrEg5X9otlKvtAlh9KpfewSF/fCoT1Klk=;
        b=q9ahwhZfpcRvVmgL8N/5ZejCIBCrc0+FfrKtzEgj0c1teFzx+Iw6gjkRM8jccCiojN
         bgDHBPArAGqBsy/ZMP3ln8edZQTd2The8NR5pirggIUxVQYnzYH/ORPafD87lpxQqCqT
         K1CqzdTfLdT2WynzklJGg7JLh7QgoWhIgP4f+fvUVPrfhhV14tYCaHNQyVUPMwIEc78A
         kSjkTYeVkOgKu6i46GLfF9YXWymjZBdWtuTmVZiCkeQqmzVJojeMUQdBGBvu13S+6LYy
         UkBi6XPh0Y0igQhuYoh0QTM+kalu6IJxYmhCgCIdPiS9evnoF/yzzTlkEYSWBWpG88hN
         7ADw==
X-Forwarded-Encrypted: i=1; AJvYcCXpN+Zm13HwBpOcgt1d672jFff3fFZ2P02FIPKt8Xs/L75haeXqUF5bqxj5Z4tbk7kcxaN5QaWkHOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQTL3kvQ7cRcUljbzVOsTDqTrjBi2tfUo6Y1sg+N+taJI2RazV
	ScwopK66iX7srT0xnmP0KP9on1hDTRAQ/qimZSxqPkOyF7KYTeJYDdPMvpVJiGBNDgE=
X-Gm-Gg: ASbGncs4IkEwYaa3QX6HWND+Ip6hTCsCUG8K6TXjfO5vWemO1sbp7oCAuss2jm8G13d
	YX36IV5X7+EO7gQ6ybCeOqLFFp8n8frooDPYHYhSBAwDKgVBzhIvx5Cym65TdfTSlbLSkT38n+p
	0hJN0Jvzmfz6IOw+9P8xomFh8L0RpgAev16i4QRT4Tury4c2wOH65809wTUJo9ItFcDGIwUwUpR
	pdymovA068XVioXmG1aMU0pmFk6DWSss9U0z+yiKC2QQiSA/0X78s+MdD1dBunc7lOfNZ9v4TCE
	Qtuwysvsn6bK6UkVnYweeyvJhci5MPKSD0Y4jOFBDvL2Ysm98PBt9DK0cVPtl2FOsXLVd4MDcr8
	ezqX8n4Jta8oZXEUTQijRslTDZyUptciSbVWti5lfY2rY5wz7IY2+mTU7K+Thh1rVy/QyEo37TG
	8AwKI=
X-Google-Smtp-Source: AGHT+IHK5rqGAN3riPdU0/brxhGoTvnd8bAogkXxGN+v07d1ahABEpVMzCIBfLMfge+s3vRCcdN1+Q==
X-Received: by 2002:a05:6000:2f84:b0:3b8:d337:cc2d with SMTP id ffacd0b85a97d-3ba508eb0b2mr5409431f8f.18.1755265761954;
        Fri, 15 Aug 2025 06:49:21 -0700 (PDT)
Message-ID: <fb9daf06-f18d-4301-960b-c0b2ba4d489f@citrix.com>
Date: Fri, 15 Aug 2025 14:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] x86/traps: Set MSR_PL0_SSP in load_system_tables()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-19-andrew.cooper3@citrix.com>
 <74a76087-e45e-4d7a-8df3-2711f77eea2a@suse.com>
 <abfd11c9-db7b-4922-aeb5-381b5284fb22@citrix.com>
 <2377fe95-2c04-4b71-8bdd-ea61996c82a4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2377fe95-2c04-4b71-8bdd-ea61996c82a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 9:52 am, Jan Beulich wrote:
> On 14.08.2025 21:37, Andrew Cooper wrote:
>> On 14/08/2025 4:00 pm, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/boot/x86_64.S
>>>> +++ b/xen/arch/x86/boot/x86_64.S
>>>> @@ -65,17 +65,11 @@ ENTRY(__high_start)
>>>>          or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
>>>>  
>>>>          /*
>>>> -         * Write a new supervisor token.  Doesn't matter on boot, but for S3
>>>> -         * resume this clears the busy bit.
>>>> +         * Write a new Supervisor Token.  It doesn't matter the first time a
>>>> +         * CPU boots, but for S3 resume or CPU hot re-add, this clears the
>>>> +         * busy bit.
>>>>           */
>>>>          wrssq   %rdx, (%rdx)
>>>> -
>>>> -        /* Point MSR_PL0_SSP at the token. */
>>>> -        mov     $MSR_PL0_SSP, %ecx
>>>> -        mov     %edx, %eax
>>>> -        shr     $32, %rdx
>>>> -        wrmsr
>>>> -
>>>>          setssbsy
>>> This is ending up a little odd: The comment says the write is to clear the
>>> busy bit, when that's re-set immediately afterwards.
>> That comment is about the wrssq.  I suppose what isn't said is that
>> setssbsy will fault if not.  How about ", so SETSSBSY can set it again" ?
> That would improve things, but then it's still unclear to me why we need to
> go through this. If the busy bit is already set, why clear it just to set
> it again.

Because the behaviour of SETSSBSY is along the lines of:

    if ( test_and_set(busy) )
        SSP = token;
    else
        #GP

It really is quite an ugly instruction, and I'm not sorry to see it go.

> Or perhaps asked differently: Wouldn't we be better off if we
> cleared the busy bit when a CPU went offline?

That's actually quite hard.  The shadow stack is in use until the CPU
takes an INIT, so ought to have it's busy bit set.

In practice, clearing the primary shstk busy bit is probably safe to do
when we're certain we'll never return to PV context again.

But this is still a larger change (needs wrss() in every play dead) and
more fragile than just clearing it before we're about to use the stack
fresh.

~Andrew

