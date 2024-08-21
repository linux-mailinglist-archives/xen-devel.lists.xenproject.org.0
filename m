Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C295A2C0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781400.1190959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo7z-0005O9-4Y; Wed, 21 Aug 2024 16:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781400.1190959; Wed, 21 Aug 2024 16:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo7z-0005Lk-1B; Wed, 21 Aug 2024 16:24:07 +0000
Received: by outflank-mailman (input) for mailman id 781400;
 Wed, 21 Aug 2024 16:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8p22=PU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sgo7x-0004dV-CJ
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:24:05 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c800c8bf-5fd9-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:24:04 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-454b3d8999aso27503211cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:24:04 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454f70f34d1sm3672651cf.63.2024.08.21.09.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 09:24:02 -0700 (PDT)
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
X-Inumbo-ID: c800c8bf-5fd9-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724257443; x=1724862243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bcU5ns9QzOmlHQHyrwwjZZlosgTIKs2EQmD/T1SCrSI=;
        b=jr0fmaojN2zf/+h3p82jF/ffBt+mGd5ZkQBTLtT6U+75TkZK67M+G5x3xrviFG4Bax
         /zRlyGFdmvmOALkO1ENsflc2lfJ3dUUQjd+FaqDE3JIqxOR3U/VZiM8ebHKMyagkwV5M
         7bYVppb6PqPIUHnZogmdOPfcX0off4+xhBJWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724257443; x=1724862243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcU5ns9QzOmlHQHyrwwjZZlosgTIKs2EQmD/T1SCrSI=;
        b=U2tVmtcoQHwA7S4lWrFR8tFpcijnoQXY7+qWgNl7H+51q1opUHS4TbQHymbhh5MQPz
         AYxe6lAViRA4Ukf8rdVeg9XVH7IPMRN+3hkAGrxqz8XsXQQlsPrTyDbPXoXmmSfUXkr3
         nK5iaxsfjWHTYxN36bqn1EGQhAn4sPGdsUcpKHWB4tPDsBsOxe/Xkx13fFLrDRUtwJno
         AK9apzQOYlt3K2fTfJVa1bpFLPnCJErQ1zCpZ0E4SG1jH/s0DE5p993Q1MBjfu0GpaO5
         5cZtZRGYyUQX/i00Aan4rS8BQwsiBEZVMZWRw1OyZR1ZgqXJazy9bIy1iUkpQIgAiLnc
         JpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn9J/q0pAQ66/vPsoTlt2DoxzWh3QioDEPkxF6OdILFUsh4I4lYv1//xFaVHxSNNTNz54ucauDjI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydbm4wrLZc9qea+30DM7Jvi/H1JvgJjubGwMqmx+vudydLegKM
	ZWenX8i+nR5+Djq5u5TaepLBGkZTmKvyIkMGYw0IrKGOauFzg2CzxnGUVmPRYJn/gMwTxoLHpWf
	x
X-Google-Smtp-Source: AGHT+IHp4mCnfMqT/MOowhbK3BoCzXtlfHvpgqepGsuzTCzVBMMJ5sf/qqFNi2mS80miaUQBl6sKSw==
X-Received: by 2002:a05:622a:4a87:b0:446:5fe5:5e6e with SMTP id d75a77b69052e-454f21e4a28mr32086461cf.17.1724257443202;
        Wed, 21 Aug 2024 09:24:03 -0700 (PDT)
Message-ID: <3c9ed143-8f8f-447f-9312-7d6db88a1008@citrix.com>
Date: Wed, 21 Aug 2024 17:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: convert op_bytes/opc checks in SIMD emulation
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
 <e96daf14-f1ea-4590-baab-62be50f8d54b@citrix.com>
 <02bf330d-83bc-4fcd-9a1e-a3f1228d2873@suse.com>
 <672e8b2b-2bd6-4099-bbf6-67c39f23cca5@citrix.com>
 <bece14e4-61b9-4f6a-891d-4761821dfde7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bece14e4-61b9-4f6a-891d-4761821dfde7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/08/2024 4:56 pm, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>>> @@ -8114,13 +8114,13 @@ x86_emulate(
>>>>>      }
>>>>>      else if ( state->simd_size != simd_none )
>>>>>      {
>>>>> -        generate_exception_if(!op_bytes, X86_EXC_UD);
>>>>>          generate_exception_if((vex.opcx && (d & TwoOp) &&
>>>>>                                 (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
>>>>>                                X86_EXC_UD);
>>>>>  
>>>>> -        if ( !opc )
>>>>> -            BUG();
>>>>> +        EXPECT(op_bytes);
>>>>> +        EXPECT(opc);
>>>> This is the only BUG() in x86_emulate.c, and it's right to get rid of it
>>>> IMO.
>>>>
>>>> Therefore, we should have a hunk removing it from
>>>> tools/tests/x86_emulator/x86-emulate.h too, which will prevent
>>>> reintroduction.
>>>>
>>>> Maybe even undef BUG somewhere in x86_emulate/private.h?
>>> Both of these actions can only be taken if the other BUG() in decode.c
>>> also goes away. But yes, what you suggest is probably the best course of
>>> action. I guess I'll do that in yet another patch, though.
>> Is that BUG() local to your tree?  I cant see it in staging.
> I first thought it would be when you mentioned you found only one, but it's
> been there for a long time[1], in VEX/EVEX prefix decoding. With a comment
> added by you[2].

Oh, I'm clearly blind.

But yes, that one wants to become EXPECT() too, I'd say.

~Andrew

