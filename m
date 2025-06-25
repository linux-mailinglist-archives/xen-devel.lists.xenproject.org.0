Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D803DAE8389
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 15:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024852.1400624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUPlH-00078d-Hg; Wed, 25 Jun 2025 13:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024852.1400624; Wed, 25 Jun 2025 13:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUPlH-00077B-Eo; Wed, 25 Jun 2025 13:01:59 +0000
Received: by outflank-mailman (input) for mailman id 1024852;
 Wed, 25 Jun 2025 13:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUPlG-000775-EX
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 13:01:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9350a033-51c4-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 15:01:57 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cf214200so57420725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 06:01:57 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b6d50sm19719255e9.30.2025.06.25.06.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 06:01:56 -0700 (PDT)
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
X-Inumbo-ID: 9350a033-51c4-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750856517; x=1751461317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iHaqTGf8LuQR8idyKtMWvqW1F7bXPkIKvJrDRdEEuGc=;
        b=l66njT3Sqv6jJTbbFEF2ExjTnVCxVdkxxjrjodXdX2xXE6app3w4qxPOIanzvPN/Pz
         I8VdxwfxbxOqdNTShbu9tH+bRltUbtewUcs+WL3P2cHJxQ3tWO1f1/Ibh5NOsVXZ/3Up
         zcQxcjzlCXGbnArQagahBQYzIaSX8YX6JY6Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856517; x=1751461317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHaqTGf8LuQR8idyKtMWvqW1F7bXPkIKvJrDRdEEuGc=;
        b=bdnegGmlbmqAVCpSyB8p63lsPvVeg6a3nnHYScSJ/aEClAW44fX/d4hC/9hKcPv5s1
         /ySRxAcBBTs3YjkzzNS8NeLWf7g9PJFC86/oXr1FJWjvYNZ7g5GwYCA+puE4KkIZNLBP
         uBlIwOYEu0hnBvkQOe+N5CWziNrs+wV6vtP/21isYWfpmK1+rYOSDFYSeUK0ntvGZvKh
         dlHQ5IAvZyPg1NF0u0PU3hxn8osK5lynIKRRivbFg26rx/KzDYTtJAvSKRO/8nh2YPlS
         xxwF27cb6hxAyEuqtkjgOScR6nmWSm+2kr+iYfX/OXJnzjYGzrLzcZAZOc0iRvnSgosM
         awlw==
X-Forwarded-Encrypted: i=1; AJvYcCWVP0HZ8P2ZTeMB1MFP8fPekfz4X+ISJy3tF+h3QiKKTk+YemAFXK0veFlgVbSghyir2UeiPJS7u1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVk2ORSFdg3G3tFoYBfD5VRPNba7QdeY0wnvRSmsY+hX7UOfkk
	at+/c313jKvwKBEnmoIaN7WQlZYMHyGBAnqUviYNotzLDSMpALzSH0Jj1lYROe8psp8=
X-Gm-Gg: ASbGnctUSHg6YnBM0HcD5lqY/4xaT8bEGWlPvcyDR291U3m21l2CxdLiw299Z9LPmPw
	0wr5/n/DCGpXa7rf/OxCXEaz4IDPEtby5OAXfZwOOWg55713b79YYdqmNO1Nhlwoe2EKKteffVS
	UPn4cJ0jQtmlTfEQiVPub2K9bc8gBXPAlVPhqokkA1AKn2vVouZar+xROU5tliCjALMF3SP45IL
	TcLPC0onDj44OLXI2rzKKXYmccfW1NICMxFLdB9gjz/K/wqSluOhksc8hztTb1Mm5TwePS8QU5C
	D/0Znj+JJFwenmRSXqa+sw3nqqIIrx7AAs04PgXXhNoM3gWC9/0rivikg3su/HOZJDlhjp3vi7K
	0mQ+qgsS2xe3kAX3oclR3cN4p8hs=
X-Google-Smtp-Source: AGHT+IE39YSbRaXA+8T5eOsd/hstAwz2Rai+6zSwlpSkB4Z99W3q0CTvrIXA9m0BANbqS24MFdHapQ==
X-Received: by 2002:a05:600c:4e47:b0:453:5c30:a2c2 with SMTP id 5b1f17b1804b1-453831fe206mr21899325e9.8.1750856516844;
        Wed, 25 Jun 2025 06:01:56 -0700 (PDT)
Message-ID: <026d2b8c-4b3c-4bc3-955c-732d665e38ba@citrix.com>
Date: Wed, 25 Jun 2025 14:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Revert part of "x86/mwait-idle: disable IBRS during
 long idle"
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-4-andrew.cooper3@citrix.com>
 <86841b35-119a-4265-8ff0-9b8549e8ca52@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <86841b35-119a-4265-8ff0-9b8549e8ca52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 10:58 am, Jan Beulich wrote:
> On 24.06.2025 18:39, Andrew Cooper wrote:
>> Most of the patch (handling of CPUIDLE_FLAG_IBRS) is fine, but the
>> adjustements to mwait_idle() are not.
>>
>> spec_ctrl_{enter,exit}_idle() do more than just alter MSR_SPEC_CTRL.IBRS.  The
>> VERW and RSB stuff are **unsafe** to omit.
>>
>> The only reason this doesn't need an XSA is because no changes were made to
>> the lower level mwait_idle_with_hints(), and thus it remained properly
>> protected.
>>
>> I.e. This change only served to double the expensive operations in the case it
>> was trying to optimise.
>>
>> I have an idea of how to plumb this more nicely, but it requires larger
>> changes to legacy IBRS handling to not make spec_ctrl_enter_idle() vulnerable
>> in other ways.
> What are the concerns here? As it looks skipping the MSR write would look
> to require checking some (per-CPU) conditional. Conditional branches can't
> really be of concern, or the "if (cx->ibrs_disable)" that you're now
> removing again would have been of concern, too.

The conditional branches are what set off alarm bells in the first place.

A conditional branch in enter should be ok; HLT and MWAIT should be
serialising enough.

A conditional branch in exit is not ok without extra safety measures.

I can expand on this in the commit message if you'd like.  I was trying
to not be overly critical...

>  Hence simply a new SCF_
> flag would look to be sufficient, for mwait_idle() to convey the necessary
> info to spec_ctrl_enter_idle()?

I've got a local patch going that route, but it needs more than just an
SCF flag.  This is the "requires larger changes".

>
>>  In the short term, simply take out the perf hit.
>>
>> Fixes: 08acdf9a2615 ("x86/mwait-idle: disable IBRS during long idle")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

Thanks.

~Andrew

