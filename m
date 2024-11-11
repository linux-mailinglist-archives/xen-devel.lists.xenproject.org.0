Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8EA9C3D1E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833605.1248793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASX2-0000bu-5k; Mon, 11 Nov 2024 11:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833605.1248793; Mon, 11 Nov 2024 11:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASX2-0000Zr-1a; Mon, 11 Nov 2024 11:24:32 +0000
Received: by outflank-mailman (input) for mailman id 833605;
 Mon, 11 Nov 2024 11:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tASX0-0000YB-Br
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:24:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81dfb765-a01f-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:24:25 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso677441266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:24:25 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a48b09sm593487766b.63.2024.11.11.03.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:24:24 -0800 (PST)
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
X-Inumbo-ID: 81dfb765-a01f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgxZGZiNzY1LWEwMWYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI0MjY1LjY3NDIxNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731324265; x=1731929065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZirE86CmZIF82CLAq1pAf7NstTP1WYRPmWMtWbTwsU=;
        b=MANkKntBfJyZ+ALb31FBLRqUPTWir/Mg/9dSt5TnSekpAHqCyeuWGyDyR770hKumVh
         eYF9qFKrPvh1zZZcijDj/ikcP4+nF0OzzXSm4sD6iIbMLSQSzwtE4OwtY4r5bjXR772w
         iYPQt+SJpluTKWfGtsxffVuDbgmac32LhzRnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324265; x=1731929065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZirE86CmZIF82CLAq1pAf7NstTP1WYRPmWMtWbTwsU=;
        b=Wy8q2vnq9VTAnEaiTWOk5y3nL6ibiqmuEHGCuZiqzUksyt1ug46doIo2nehHOUYMUk
         qGiQt8iZPtNzmuXCPpxd+gb3KqZ8JthNLax2TctD1T72jOjxUOuJt39socg59jZDp58c
         2UTMhyurJGvnV0V9E49TkDYhxGcNblHSTFN5A58oVYkKRqs2yjNTYersc8BANGH2cwsf
         iG1sfxI+kAWwYRdY+igwovjVDKd8e4D+UAOH7PCFzZQL7yk0hzzY2Dan0tF7aIaFkchl
         woc7QLd5fwzGbs2lDoS41D4ORMAFkwt3zj0/csyBCyGwO6tdQ2ZDkshHSWh2XrfNcHVg
         uFTA==
X-Gm-Message-State: AOJu0YzI4BkfTeKgZba6syhJE+OpSpmfsyCDJSom+HMx/U8Kf6z2bDwz
	As639RklbE197K9w9NHNkmG/aITjh7NGlLXhfV7yJgfS4HZXQh+Yto3IbEAh3mw=
X-Google-Smtp-Source: AGHT+IF6HFa4Ne3yXwFvzBBTqv6W01yNFO2ZsUm+n8mHbMNWEKILK1iEABN0J2LfrMayMy83AplXlg==
X-Received: by 2002:a17:907:7fa9:b0:a9a:6284:91ef with SMTP id a640c23a62f3a-a9eefebd0f4mr1218362366b.2.1731324265087;
        Mon, 11 Nov 2024 03:24:25 -0800 (PST)
Message-ID: <e56c7264-4bd5-459b-9da9-7ac1506fca5b@citrix.com>
Date: Mon, 11 Nov 2024 11:24:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/wakeup: Fix code generation for bogus_saved_magic
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241109003654.884288-1-andrew.cooper3@citrix.com>
 <CACHz=ZjBiEkXCGayGSdFUUc0eCFqSvGGSyFDMmRc76Nz_aP9QA@mail.gmail.com>
 <1ace53f6-dd00-4277-9e91-4f3117facd38@citrix.com>
 <CACHz=ZgjpZ5TkwwDrbCZkOG1XnjAV7uGxDqZGYu_StTMAPKD0w@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZgjpZ5TkwwDrbCZkOG1XnjAV7uGxDqZGYu_StTMAPKD0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2024 11:21 am, Frediano Ziglio wrote:
>>>> sanity sake.  Annotate it with ELF metadata while doing so.
>>>>
>>>> Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> This issue dates back to the very introduction of S3 support in Xen, in 2007.
>>>> ---
>>>>  xen/arch/x86/boot/wakeup.S | 9 +++++----
>>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
>>>> index 08447e193496..c929fe921823 100644
>>>> --- a/xen/arch/x86/boot/wakeup.S
>>>> +++ b/xen/arch/x86/boot/wakeup.S
>>>> @@ -153,15 +153,16 @@ wakeup_32:
>>>>          /* Now in compatibility mode. Long-jump to 64-bit mode */
>>>>          ljmp    $BOOT_CS64, $bootsym_rel(wakeup_64,6)
>>>>
>>>> +FUNC_LOCAL(bogus_saved_magic, 0)
>>>> +        movw    $0x0e00 + 'S', 0xb8014
>>>> +        jmp     bogus_saved_magic
>>>> +END(bogus_saved_magic)
>>>> +
>>>>          .code64
>>>>  wakeup_64:
>>>>          /* Jump to high mappings and the higher-level wakeup code. */
>>>>          movabs  $s3_resume, %rbx
>>>>          jmp     *%rbx
>>>>
>>>> -bogus_saved_magic:
>>>> -        movw    $0x0e00 + 'S', 0xb8014
>>>> -        jmp     bogus_saved_magic
>>>> -
>>>>  /* Stack for wakeup: rest of first trampoline page. */
>>>>  ENTRY(wakeup_stack_start)
>>> Hi,
>>>    I agree with the code move, it's supposed to be 32 bit so it should
>>> be in the 32 bit section.
>>> Does the ELF annotation help with debug information? Maybe worth
>>> adding to the comment.
>> As said in the commit message, it's simply ELF metadata (symbol type and
>> size).
>>
>> It doesn't interact with debug symbols, so far as I'm aware.
>>
>> It's mainly for livepatching (the ELF metadata is how changes are
>> identified), but we're applying it uniformly to all assembly as a
>> cleanup activity.
>>
> I don't think livepatching this code would be so easy. That code is
> copied to low memory and discarded (.init section) later, so patching
> the code in the current ELF code would corrupt Xen memory.

Indeed.  This specific code is out of scope for livepatching.

But, we are (slowly) cleaning up all assembly code to use proper ELF
metadata.

~Andrew

