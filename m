Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F107A0E2F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602672.939377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrvm-0002Nu-Hs; Thu, 14 Sep 2023 19:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602672.939377; Thu, 14 Sep 2023 19:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrvm-0002MI-F3; Thu, 14 Sep 2023 19:23:14 +0000
Received: by outflank-mailman (input) for mailman id 602672;
 Thu, 14 Sep 2023 19:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgrvk-0002MA-GJ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:23:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24aaa1ff-5334-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 21:23:11 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31aeef88a55so1145351f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 12:23:11 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d4ace000000b003176eab8868sm2542445wrs.82.2023.09.14.12.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 12:23:10 -0700 (PDT)
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
X-Inumbo-ID: 24aaa1ff-5334-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694719391; x=1695324191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qrWE2AHuxv5Yaqe7gnDbJGwX4muVOrWYvJSdz6hQA3Y=;
        b=XCByoK2Aaka1VQFrGc0RGFnLvfGpxnLFViESk5e3MYtc7YjbHPehFPkWZAavCgVgXw
         3VFHPXDgEfvkguwkb6jdvTdOXQ0NuqSgt+cVOUJ9RVhQyLTtjAp4pHCQw2rwoQr20EYV
         /Bu36T9I8wXTehteDtjt+DYmZpo5qLQ5k6vpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694719391; x=1695324191;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrWE2AHuxv5Yaqe7gnDbJGwX4muVOrWYvJSdz6hQA3Y=;
        b=OviqES2RUEPP0TS38mjHFCrLF+1xDwUyqkbanumboo14nHSHA5p5uRNeBvBwM4rKhP
         43eDtry9B+nUZGmnGf8m7cq+7vrBY0yANOT3eIoQjMoNyAAlZp+hNhmUSvHGVzy5WUN6
         jD0MGI9bUIvXM54kW+aTsRiWHN/LcDHn5vQvD7TS10bRcRdEwV6iwZXzLnRQBc1MDzyM
         5Lp31Oqjv1kzf8TyLce5gu/I5ENdaEh72XaR+3qluYsPH6tFSrRJG4Q+Kpg1rYql6RCc
         HfuA59C092YEkvjZc9qo3rx1metK8pFoUEcRODZIk1E2u8FhrV7ExHutC6/NOhhBVf0Y
         zJ4w==
X-Gm-Message-State: AOJu0Yy05VbfOlRFMPVfjGKDJI1VD4b6BFAnilLbxYV3D4b53YWCbJeI
	9EVMN6nS+SDLalZQn1DstobL1g==
X-Google-Smtp-Source: AGHT+IFFxd+WItPq4GUuGULYVRX/Ys5ZHWMN67MReWrTea3Rm4M5QmcjKb/ncnJ9ZyCVwSAntgnQjg==
X-Received: by 2002:adf:f710:0:b0:314:2e95:1ec9 with SMTP id r16-20020adff710000000b003142e951ec9mr5574733wrp.10.1694719390872;
        Thu, 14 Sep 2023 12:23:10 -0700 (PDT)
Message-ID: <35177e10-3306-69fc-4ece-bba453cbdb0c@citrix.com>
Date: Thu, 14 Sep 2023 20:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/8] x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-5-andrew.cooper3@citrix.com>
 <e12f46d9-25eb-d564-4cb7-0e476e741725@suse.com>
In-Reply-To: <e12f46d9-25eb-d564-4cb7-0e476e741725@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 8:58 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> @@ -218,7 +218,10 @@
>>      wrmsr
>>  .endm
>>  
>> -/* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
>> +/*
>> + * Used after a synchronous entry from PV context.  SYSCALL, SYSENTER, INT,
>> + * etc.  Will always interrupt a guest speculation context.
>> + */
>>  .macro SPEC_CTRL_ENTRY_FROM_PV
>>  /*
>>   * Requires %rsp=regs/cpuinfo, %rdx=0
> For the entry point comments - not being a native speaker -, the use of
> "{will,may} interrupt" reads odd. You're describing the macros here,
> not the the events that led to their invocation. Therefore it would seem
> to me that "{will,may} have interrupted" would be more appropriate.

The salient information is what the speculation state looks like when
we're running the asm in these macros.

Sync and Async perhaps aren't the best terms.  For PV context at least,
it boils down to:

1) CPL>0 => you were in fully-good guest speculation context
2) CPL=0 => you were in fully-good Xen speculation context
3) IST && CPL=0 => Here be dragons.

HVM is more of a challenge.  VT-x behaves like an IST path, while SVM
does allow us to atomically switch to good Xen state.

Really, this needs to be a separate doc, with diagrams...

>> @@ -319,7 +334,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>      UNLIKELY_END(\@_serialise)
>>  .endm
>>  
>> -/* Use when exiting to Xen in IST context. */
>> +/*
>> + * Use when exiting from any entry context, back to Xen context.  This
>> + * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with
>> + * unsanitised state.
>> + *
>> + * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
>> + * must treat this as if it were an EXIT_TO_$GUEST case too.
>> + */
>>  .macro SPEC_CTRL_EXIT_TO_XEN
>>  /*
>>   * Requires %rbx=stack_end
> Is it really "must"? At least in theory there are ways to recognize that
> exit is back to Xen context outside of interrupted entry/exit regions
> (simply by evaluating how far below stack top %rsp is).

Yes, it is must - it's about how Xen behaves right now, not about some
theoretical future with different tracking mechanism.

Checking the stack is very fragile and we've had bugs doing this in the
past.  It would break completely if we were to take things such as the
recursive-NMI fix (not that we're liable to at this point with FRED on
the horizon.)

A perhaps less fragile option would be to have .text.entry.spec_suspect
section and check %rip being in that.

But neither of these are good options.  It's adding complexity (latency)
to a fastpath to avoid a small hit in a rare case, so is a concrete
anti-optimisation.

>> @@ -344,6 +366,9 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>      wrmsr
>>  
>>  .L\@_skip_sc_msr:
>> +
>> +    /* TODO VERW */
>> +
>>  .endm
> I don't think this comment is strictly necessary to add here, when the
> omission is addressed in a later patch. But I also don't mind its
> addition.

It doesn't especially matter if the series gets committed in one go, but
it does matter if it ends up being split.  This is the patch which
observes that VERW is missing.

~Andrew

