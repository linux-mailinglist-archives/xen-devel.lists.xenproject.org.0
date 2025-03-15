Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542EA62276
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 01:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915557.1321051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttEzV-0002AQ-0x; Sat, 15 Mar 2025 00:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915557.1321051; Sat, 15 Mar 2025 00:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttEzU-00028c-SL; Sat, 15 Mar 2025 00:03:00 +0000
Received: by outflank-mailman (input) for mailman id 915557;
 Sat, 15 Mar 2025 00:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsaQ=WC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ttEzT-00028T-Ba
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 00:02:59 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7c49149-0130-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 01:02:54 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso498688866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 17:02:54 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146b31b3sm293592766b.18.2025.03.14.17.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 17:02:52 -0700 (PDT)
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
X-Inumbo-ID: d7c49149-0130-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741996973; x=1742601773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qnltyO7dcv/SUllCMtAufTAmj6I++mK8uAgsnzdy1NE=;
        b=EpdAms0TcJLPOiQY07lP7uHTzPeQcENEmema5LSP/MnSJnD7pwIPIgwAsnnBIrNHxu
         g355QijoEY80Idng/TVivPaHUofzKlgXaG6VRnJSqa0Hci3cpR4IR36zBwyJFnaloYHK
         Mw5I8YhRKopvwhRldwd2hjWNsVfxGiZ8Zqr0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741996973; x=1742601773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnltyO7dcv/SUllCMtAufTAmj6I++mK8uAgsnzdy1NE=;
        b=jHZqOnPTI66roUI2+cZlVC/5o7gAQLd8naEFomlstHJ+P2YOVCDZh01QbrzKyct6Xj
         OeT2nnRGmUP3AyKCB5/Uhxq8XdFP7/jf7OyzIcAUsjGlfXLnD8pKw10KArB+Fq51zDxN
         R5DAWKMxsslwLnPMveiS3052NPHHQFJ+D4gAqCh1UnQ8b7NWw3iM0DLch7CAc5jAh76q
         Tf3UCK3ec+ViviOT/6g4zef5fWctRAsjaFwGf49pTHmH+whlc+RLdUsyFwWBW8wYMA10
         IMlADJN81v5F1fI6mPwtzsd34dd8pX78DP8W0Hzwpy8QIzQfZH7PxiVaHsy939Bg426M
         87UA==
X-Gm-Message-State: AOJu0YxYCFZgW9t4ZVecg/OgjIQKfuZvOCvNpY2zr3tqkapgid/Dbcqp
	JIVp1dSpY8YdurNlNPYiJqmkBnJJ7ILDvLPCqlwTdmfTxyEDCSLy9MK9czYnz+k=
X-Gm-Gg: ASbGncvNpMC4q25aQNDXzO44p8t0Qf2rYHS2qnWP7+aF33mk9nLu73YjbEGTr4uqS21
	ZdhBKuejMCmPlhAT1wXF/4wwfdSqvJrdHoK8VsA0o7nFwr16JNwrmlpIbKYQObOhwEQqh1j+Xkt
	o9GV1e3YfzSHLIED0sLQXpixN7H6OrDnQaCMShxXu+Xk9piamfBbWRvBkZ5fyokroiFkTxkb2cO
	vciQThj7T04stxIjI/a1DT0QUYWGsPTOj4FWJGNm56mdQOt+pr3FF8A48rrldx5wE2ToCpcgBR0
	L5p0Py1DX1yMDPGROdBmb8QSig9oW5hzKAzjOH7jepVGqJkqBfR2s0VsqnLSy2RzZc4zk5liG14
	ECq73Cw3r
X-Google-Smtp-Source: AGHT+IH65OtAtzEcVl/JF5qKvw9Ls7ntoOZGw1w/e9kJwowypRX+tfCJhP8Ogw6xgMMD4hnQkVryXg==
X-Received: by 2002:a17:906:f2cd:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ac34139a5f6mr226217666b.9.1741996973317;
        Fri, 14 Mar 2025 17:02:53 -0700 (PDT)
Message-ID: <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
Date: Sat, 15 Mar 2025 00:02:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: S3 regression on AMD in 4.20
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Mykola Kvach <xakep.amatop@gmail.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl> <Z9TBaEeUcVrjaACL@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9TBaEeUcVrjaACL@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
>> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
>>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
>>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
>>>>
>>>> This one has working S3, so add a test for it here.
>>>>
>>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> ---
>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> The suspend test added here currently fails on staging[1], but passes on
>>>> staging-4.19[2]. So the regression wants fixing before committing this
>>>> patch.
>>>>
>>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
>>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
>>> We could commit the patch now without the s3 test.
>>>
>>> I don't know what the x86 maintainers think about fixing the suspend
>>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
>> I'm on it already, but it's annoying. Lets convert this thread to
>> discussion about the issue:
>>
>> So, I bisected it between staging-4.19 and master. The breakage is
>> somewhere between (inclusive):
>> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
>> and
>> 47990ecef286 x86/boot: Improve MBI2 structure check
>>
>> But, the first one breaks booting on this system and it remains broken
>> until the second commit (or its parent) - at which point S3 is already
>> broken. So, there is a range of 71 commits that may be responsible...
>>
>> But then, based on a matrix chat and Jan's observation I've tried
>> reverting f75780d26b2f "xen: move per-cpu area management into common
>> code" just on top of 47990ecef286, and that fixed suspend.
>> Applying "xen/percpu: don't initialize percpu on resume" on top of
>> 47990ecef286 fixes suspend too.
>> But applying it on top of master
>> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
>> but the failure mode is different than without the patch - system resets
>> on S3 resume, with no crash message on the serial console (even with
>> sync_console), instead of hanging.
>> And one more data point: reverting f75780d26b2f on top of master is the
>> same as applying "xen/percpu: don't initialize percpu on resume" on
>> master - system reset on S3 resume.
>> So, it looks like there are more issues...
> Another bisection round and I have the second culprit:
>
>     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
>
> With master+"xen/percpu: don't initialize percpu on resume"+revert of
> 8e60d47cf011 suspend works again on this AMD system.

That's not surprising in the slightest.

Caching hardware values in Xen isn't safe across S3, which QubesOS has
found time and time again, and for which we still have outstanding bugs.

S3 turns most of the system off.  RAM gets preserved, but devices and
plenty of internal registers don't.

~Andrew

