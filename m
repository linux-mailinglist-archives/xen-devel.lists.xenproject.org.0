Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA377A4972
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604001.941182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDEA-0001xb-5I; Mon, 18 Sep 2023 12:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604001.941182; Mon, 18 Sep 2023 12:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDEA-0001vv-1q; Mon, 18 Sep 2023 12:19:46 +0000
Received: by outflank-mailman (input) for mailman id 604001;
 Mon, 18 Sep 2023 12:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiDE8-0001vn-9X
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:19:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5c5b59f-561d-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 14:19:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31ff2ce9d4cso2970078f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 05:19:43 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b0030fd03e3d25sm12511601wrt.75.2023.09.18.05.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 05:19:42 -0700 (PDT)
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
X-Inumbo-ID: a5c5b59f-561d-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695039582; x=1695644382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WwsRn7RVyi/2zzdBvVmGjZ/Y4zX/BilIFSLU4Qag90A=;
        b=DYNRJp4/iRhUxpD4sDD/YcFVXvPZKIp78Qd9q0c+uQwaXwFVHKZjv7FVKdjMPsQNTj
         TYzUCH1HspsZK9PaxnI0Jbg3Wr/4Gyr06nmm2Ptx29g1NT2EbgLU9giiQMyUFH7twicb
         O+MCsY8tI+liPZMuuy0hglnQqVkOTjoGvH0dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695039582; x=1695644382;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwsRn7RVyi/2zzdBvVmGjZ/Y4zX/BilIFSLU4Qag90A=;
        b=knqY9jN1NAv9fhN6ZC/dLMVJtHAM0m7hlEeQIvCCn1n3iWexEgBL5h8i1jzxtiE4HK
         h/AAF5eOgsU6F+78FyPRjuknsHupU2f33xd9ErH8IlMow4zvLaL6zOXgoB792ursaAS/
         Wvk1eFaFADouCXrt6P4T9agDu5XuYqozPPmShMmyNihC6t0uk9KPdMhdDhOOGbvb6mVa
         3sfqfHD64hh/luOMTLavPiY5/dUfqLc4WScsmHd3FDaQPi3dGed0912WGJ7AIlfQ5wQI
         xH7tgdI4Kseq0CrVJajWZhL5fGlWOCuGIhZBJ73oFb8xmQP8+9ruEr7pSFJDZFsF8JzC
         znZg==
X-Gm-Message-State: AOJu0Yxf68dtaxska8wHPgxD8qc9eCxRAYvjzmH2zcX/byqCCWWSScZL
	E1uvb+wB5k0wvGCmn7HZqCjqQw==
X-Google-Smtp-Source: AGHT+IGRoQwyV779fwn0k8/O1fpi0zXXj+kFYK4J0lPu01PhiHAcbf9fX+AL7fjsv6t8hAMbwds6mA==
X-Received: by 2002:a5d:5149:0:b0:319:62e0:f2fe with SMTP id u9-20020a5d5149000000b0031962e0f2femr7497845wrt.36.1695039582533;
        Mon, 18 Sep 2023 05:19:42 -0700 (PDT)
Message-ID: <c119c09f-5f87-fb4d-9e73-968dbb4c0ac3@citrix.com>
Date: Mon, 18 Sep 2023 13:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-3-andrew.cooper3@citrix.com>
 <334fb537-ef7c-97e1-3274-736c4a2549b6@citrix.com>
 <311e2920-5e91-b9dc-77a7-263272a79a90@suse.com>
In-Reply-To: <311e2920-5e91-b9dc-77a7-263272a79a90@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2023 12:30 pm, Jan Beulich wrote:
> On 18.09.2023 11:24, Andrew Cooper wrote:
>> On 15/09/2023 9:36 pm, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -8379,13 +8379,6 @@ x86_emulate(
>>>      if ( !mode_64bit() )
>>>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>>>  
>>> -    /* Should a singlestep #DB be raised? */
>>> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>>> -    {
>>> -        ctxt->retire.singlestep = true;
>>> -        ctxt->retire.sti = false;
>>> -    }
>>> -
>>>      if ( rc != X86EMUL_DONE )
>>>          *ctxt->regs = _regs;
>>>      else
>>> @@ -8394,6 +8387,19 @@ x86_emulate(
>>>          rc = X86EMUL_OKAY;
>>>      }
>>>  
>>> +    /* Should a singlestep #DB be raised? */
>>> +    if ( rc == X86EMUL_OKAY && singlestep )
>>> +    {
>>> +        ctxt->retire.pending_dbg |= X86_DR6_BS;
>>> +
>>> +        /* BROKEN - TODO, merge into pending_dbg. */
>>> +        if ( !ctxt->retire.mov_ss )
>>> +        {
>>> +            ctxt->retire.singlestep = true;
>>> +            ctxt->retire.sti = false;
>>> +        }
>> I occurs to me that setting X86_DR6_BS outside of the !mov_ss case will
>> break HVM (when HVM swaps from singlestep to pending_dbg) until one of
>> the further TODOs is addressed.
>>
>> This will need bringing back within the conditional to avoid regressions
>> in the short term.
> I'm afraid I don't understand this: Isn't the purpose to latch state no
> matter whether it'll be consumed right away, or only on the next insn?

Yes, that is the intention in the longterm.

But in the short term, where I'm doing just enough to fix the %dr6 bits,
putting this unconditionally in PENDING_DBG will break the emulation of
mov-to-ss until the bigger todo of "wire INTERRUPTIBILITY/ACTIVITY state
into the emulation context" is complete.

The latter is definitely too big to fit into 4.18, and I can't
intentionally regress mov-to-ss in a series we intend to backport.

~Andrew

