Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2669959ED4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 15:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781157.1190718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglWt-0005oP-Qe; Wed, 21 Aug 2024 13:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781157.1190718; Wed, 21 Aug 2024 13:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglWt-0005lY-NS; Wed, 21 Aug 2024 13:37:39 +0000
Received: by outflank-mailman (input) for mailman id 781157;
 Wed, 21 Aug 2024 13:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8p22=PU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sglWs-0005lS-4b
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 13:37:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8740f834-5fc2-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 15:37:37 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bede548f7cso5014040a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 06:37:37 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc082f4dsm8027521a12.96.2024.08.21.06.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 06:37:35 -0700 (PDT)
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
X-Inumbo-ID: 8740f834-5fc2-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724247456; x=1724852256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xESqlmMQF0xXVhUIs+bUmuxM5tVQ1mjDpSdiLeJCXqI=;
        b=Cvcdz41rh+E/aCafT7WbSj9/vbnJ+NjlXXIa8c2oQ81lwxEipxnD7khEkuYtBuVg86
         O50OgNm/nDJvo9I3iA+Yfn4A29Yakjfhgv58o9sUOw+/17mmyHV2/4+ItvPIyRUJw5gR
         ADIaZCGIOOW9sTe2f4lhlqMeKeuRoCGj4QddQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724247456; x=1724852256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xESqlmMQF0xXVhUIs+bUmuxM5tVQ1mjDpSdiLeJCXqI=;
        b=lsqN2Q5K2NqbykaEWw2Ha+6v3mSRf+kqSlXtu5GwvSBviqDUH8o48SPkz+pJoSorFG
         G7vYr6slh50+cMYrhqZPLy2wq0e1BwCNNcs9gM8HkP6yME9sISWovhOoE5M6UccQdjfB
         ffLkYz/NYdaSsD2xI/gNJ8+zvPRgRyPZSjrU61J28aQBqcLvjVjPx/EAbEJOJWn80dDJ
         iRUjxvRBFOhX5SoSC7LVyQckJvshRjhFUrHYP1j6mILOBBzFXu7noYSOCVGySQXmKHXu
         bFijmAFKFwv8Md01vtxANcD23xvj2DAAJ8Fzf/PE9S0S86h+2X+c6E+vwXCjbjhurqbE
         lKVw==
X-Forwarded-Encrypted: i=1; AJvYcCU8TRtbkUFXxyoVHNjTZ9E7xZieo+ODnHO6xLHMUSM/4vpGRcq4EVUJROMG8S9jR82nuW0PI2Q1wfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeRqjDRq9C412omjC/yZDRTV1kq+yrEvPs6ZzQhdWIdwjJy30Q
	PWHa/8InEUu6oQ96V989lLmkMxlsPSHziBXErKdorSE7CIUi4hLkk8ANdt1WAxhDrtXnyQxwN91
	b
X-Google-Smtp-Source: AGHT+IGLsb39DSqGUdswreBXVsaVmk6mdvPNZkqzNW1ne8hgoSpL0JzQkYKtkG8rQHVzl9yajMIrWQ==
X-Received: by 2002:a05:6402:4310:b0:5be:dd80:2038 with SMTP id 4fb4d7f45d1cf-5bf1f15fb48mr1641865a12.22.1724247455903;
        Wed, 21 Aug 2024 06:37:35 -0700 (PDT)
Message-ID: <e96daf14-f1ea-4590-baab-62be50f8d54b@citrix.com>
Date: Wed, 21 Aug 2024 14:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: convert op_bytes/opc checks in SIMD emulation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2024 2:30 pm, Jan Beulich wrote:
> Delivering #UD for an internal shortcoming of the emulator isn't quite
> right. Similarly BUG() is bigger a hammer than needed.
>
> Switch to using EXPECT() instead.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

To confirm, this is ASSERT_UNREACHABLE() (which fuzzing will now notice
as an error), and unhandleable in release builds (which ultimately ends
up in #UD)?

I think it would be helpful to at least note the fuzzing aspect in the
commit message.

>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8114,13 +8114,13 @@ x86_emulate(
>      }
>      else if ( state->simd_size != simd_none )
>      {
> -        generate_exception_if(!op_bytes, X86_EXC_UD);
>          generate_exception_if((vex.opcx && (d & TwoOp) &&
>                                 (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
>                                X86_EXC_UD);
>  
> -        if ( !opc )
> -            BUG();
> +        EXPECT(op_bytes);
> +        EXPECT(opc);

This is the only BUG() in x86_emulate.c, and it's right to get rid of it
IMO.

Therefore, we should have a hunk removing it from
tools/tests/x86_emulator/x86-emulate.h too, which will prevent
reintroduction.

Maybe even undef BUG somewhere in x86_emulate/private.h?

~Andrew

