Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1562992880
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 11:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811811.1224472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkLJ-0001TT-0R; Mon, 07 Oct 2024 09:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811811.1224472; Mon, 07 Oct 2024 09:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkLI-0001RV-Sr; Mon, 07 Oct 2024 09:47:52 +0000
Received: by outflank-mailman (input) for mailman id 811811;
 Mon, 07 Oct 2024 09:47:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arWC=RD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sxkLG-0001RP-Tc
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 09:47:51 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36bd90b5-8491-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 11:47:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so730120566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 02:47:49 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7e2645sm355438966b.204.2024.10.07.02.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 02:47:48 -0700 (PDT)
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
X-Inumbo-ID: 36bd90b5-8491-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728294469; x=1728899269; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V7y1Xs4/9Dpz4mMF+uwep1zlmZ/e4BzbFivFTzR1Rbw=;
        b=Sj4IbnjNTKs037DyG10He+V98D42Ow9uONMstu7MknqFGURENp+R9DqAh0v0ZnimWO
         Y2iV02WdZPtg/rjks5hqNVVFMWoLJFoskUq1zaUFKSHlwzHtru9nEVtvAszc453xhTNi
         NnjpjFB8Vmz179xtxv/QEUO+liGTyfjXZxs/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728294469; x=1728899269;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7y1Xs4/9Dpz4mMF+uwep1zlmZ/e4BzbFivFTzR1Rbw=;
        b=IMolyVLcbSOlfgZt7iSl70iBfwd1PfMd+N1gV9qJAMPIiayGT7xd6Y9+GgFMZEMBjS
         JHuhiLIOL0WPizo+Y1lZHE1B9uIqlIqjzPccaFEB5hCMPTLDKnPkC+OC0SzVTWq9yl+h
         A+mQXJHmwRyceD2K1RUqLuoA+1rZyJLgUFtlzPs2OoKnmu29UcRp29aq5vdXUSI86jiG
         hhFLNE8/UxAfLESiC96Mn9n5boRNimIp7HenF0QgC1pCpQ8wpQIRsKJd2CbtAkQqfAV7
         DLKBxjKGT1EjmMwWFsFuM0z1vB2bocVTrfm3wwAebVLySeN58jXuY2/zFD+11xWy6ugA
         XhSw==
X-Forwarded-Encrypted: i=1; AJvYcCURhASA12J6o3+7pzDAVmsNP3enZXMQzuE5eNldPWFZE2qDpXi6Cuy2sg2241Iw+cLwwOdivwJQ1Hw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOquCNnGftQYQukufp+Mc46N0xxLU7qZwtxjeNYNYdLZV7LFXz
	s2yXUQFfysnbaPcqXX6WZnsP4fEJIHpZIlVediywE0ZISyg/R9kl+CECbsYlaBM=
X-Google-Smtp-Source: AGHT+IHkEs1Y9AGKbXoPvaUED/QTZxU7VzPtHOIyGRiH9RIyQ7mD9WaFbrRbEVy2FnYkYDod0gMP+Q==
X-Received: by 2002:a17:907:948e:b0:a99:5671:aae4 with SMTP id a640c23a62f3a-a995671abe5mr307244866b.22.1728294469011;
        Mon, 07 Oct 2024 02:47:49 -0700 (PDT)
Message-ID: <c3599934-8ea6-44d3-95da-9a307f952f2d@citrix.com>
Date: Mon, 7 Oct 2024 10:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com>
 <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
 <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com>
 <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
 <CACHz=ZjCAEE2kiWdce0ApQqtA-3urSMFJYRdKv8Qa_-BrZZ8bw@mail.gmail.com>
 <0439f313-1360-47b0-ae7e-a2a74ee4d51e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0439f313-1360-47b0-ae7e-a2a74ee4d51e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2024 10:04 am, Jan Beulich wrote:
> On 07.10.2024 10:15, Frediano Ziglio wrote:
>> On Mon, Oct 7, 2024 at 9:07 AM Frediano Ziglio
>> <frediano.ziglio@cloud.com> wrote:
>>> On Mon, Oct 7, 2024 at 8:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.10.2024 15:21, Andrew Cooper wrote:
>>>>> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
>>>>>> --- a/xen/arch/x86/boot/Makefile
>>>>>> +++ b/xen/arch/x86/boot/Makefile
>>>>>> @@ -1,6 +1,6 @@
>>>>>> -obj-bin-y += head.o cbundle.o
>>>>>> +obj-bin-y += head.o cbundle.o reloc-trampoline.x64.o
>>>>> Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch wants
>>>>> introducing here.
>>>>>
>>>>> That said, x64 is the one name for 64bit that we reliably don't use.
>>>>> Also...
>>>>>
>>>>>> -head-bin-objs := cmdline.o reloc.o
>>>>>> +head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
>>>>> ... head-bin-objs isn't really correct now seeing as they're not
>>>>> binaries in head.S.  Also ...
>>>>>
>>>>>>  nocov-y   += $(head-bin-objs)
>>>>>>  noubsan-y += $(head-bin-objs)
>>>>> The no$(foo)'s needs extending to the 64bit objects too.  They're also
>>>>> used early enough to explode.
>>>>>
>>>>> In Xen, 64bit objects are the norm, and it's 32bit ones which are the
>>>>> exception, so how about we special case *.i386.o instead.  Then
>>>>>
>>>>> obj32 := cmdline.i386.o
>>>>> obj32 += reloc.i386.o
>>>>> obj32 += reloc-trampoline.i386.o
>>>> I'd like to advocate for ix86 or i686. i386 gives a wrong impression imo.
>>> Why not simply x86 ? We already use it.
>>>
>> Looking at current files, we also use (to distinguish more clearly 32
>> and 64 bit) x86_32.
> Either would be fine with me; as to x86 I took it that Andrew wanted to
> express the 32-bit-ness, which x86 alone doesn't unambiguously do.

On further thought, why not just foo.32.o ?

That should be clear enough.

~Andrew

