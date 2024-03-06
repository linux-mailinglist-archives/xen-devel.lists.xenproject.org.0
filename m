Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08516873572
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689060.1073982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpET-0002Wf-K8; Wed, 06 Mar 2024 11:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689060.1073982; Wed, 06 Mar 2024 11:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpET-0002UG-H9; Wed, 06 Mar 2024 11:14:45 +0000
Received: by outflank-mailman (input) for mailman id 689060;
 Wed, 06 Mar 2024 11:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0MG=KM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhpER-0002Sd-On
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:14:43 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba5d6bcf-dbaa-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 12:14:42 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6e4f7c0e723so659229a34.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:14:42 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dq10-20020a05622a520a00b0042e703a8d74sm1675627qtb.56.2024.03.06.03.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 03:14:39 -0800 (PST)
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
X-Inumbo-ID: ba5d6bcf-dbaa-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709723681; x=1710328481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9W04+U8PkRMf1aC54KQWNwc9UNC7v8bm+5+mkKCBao=;
        b=FxSXxjOgDFSamPGs/wtQXkWwAZQaDog3vsh9w8xGlTDxRWp9oWy9jv6s/8UPe36GsV
         5RDVwYwtewLhncmr+LEi6mAE8uk8kdfuezqX9BS4dSeA9Ljh3hZ2FLIEgncE9PdQ9aOj
         7CvyTzfDWnxFp3xihiQP2wx+RAzSQRX8Bji+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709723681; x=1710328481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9W04+U8PkRMf1aC54KQWNwc9UNC7v8bm+5+mkKCBao=;
        b=T68ojDqXVzadDYHEQQTITiDpDBEEKSwmsNHNfiEJbZehFtnW6lxb+3vZ87utgUmZFG
         dUB1MpJkiDbr4jgyr1vS0ig/70O/dVO76pC/QHIeDce5baaqTimfIwoJ7FR9u1Y174HI
         zIoU8OUNcYoxhCtzMqRZbXapeTZlVeJdA6peuPjHHz8m3Cidqn/h/CC7lC6C2OToQN4c
         Gn3qPTjUYUCb9uEzxjD/b7OSN867sAnu8MTCrk0CaFnfXgWjbXgKfMdHsfp72C37snsR
         7LvS12rJLln87IWnzFDtlinUbckjX1qUsR7JfV33YP+wC0GIQGat5zV6Ysm8pqJ9wwWW
         Ny5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8APQjsl+zU3VPjkudAuT4eP3K1pVko8o6TvAELbIf4eDxRfkec4NlCODfw75vMwNf4MnTfPDuvbyhginpKdJmm0k/YdQjNJB5j6Q0itI=
X-Gm-Message-State: AOJu0Yw8iG1Kys7LYYpJS9H7jSenGfu9C8qWxSNdQV/UyAzaRuyc/jAj
	OTQnv2B0rFhGwKxpsdoTO7XNqThEPtO9+3uk0gVft9zS0mlfUg5hR4QcgGbTzd4=
X-Google-Smtp-Source: AGHT+IFg0MfFlmhReZjCYngZwRR7PhLTmUvMXdWgH6gBK8a6+RTIIDWnGEYWY4zBzmRUQ+QNlWMNcw==
X-Received: by 2002:a05:6870:31c2:b0:221:3ef1:6885 with SMTP id x2-20020a05687031c200b002213ef16885mr3850466oac.5.1709723680679;
        Wed, 06 Mar 2024 03:14:40 -0800 (PST)
Message-ID: <e0ad8bfe-af36-4cbf-8948-8b23993198da@citrix.com>
Date: Wed, 6 Mar 2024 11:14:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: shrink insn size for some of our EFLAGS
 manipulation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba4903d-638d-408e-bcd4-7c13cb56e078@suse.com>
 <76cdb4b4-a9f5-46e6-bb30-515ffb37c45a@citrix.com>
 <54bc9b3f-27af-41ea-9ab4-f35d38fe995d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <54bc9b3f-27af-41ea-9ab4-f35d38fe995d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2024 10:49 am, Jan Beulich wrote:
> On 06.03.2024 11:33, Andrew Cooper wrote:
>> On 05/03/2024 2:04 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -52,7 +52,7 @@ UNLIKELY_END(syscall_no_callback)
>>>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>>>          movb  %cl,TRAPBOUNCE_flags(%rdx)
>>>          call  create_bounce_frame
>>> -        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
>>> +        andb  $~(X86_EFLAGS_DF >> 8), UREGS_eflags + 1(%rsp)
>> The other adjustments are fine, but what on earth are we doing with DF here?
>>
>> This looks straight up buggy.  We've got no legitimate reason to be
>> playing with the guest's view of DF.
> This is the PV equivalent of the SYSCALL_MASK MSR, isn't it?

Well, is it?

It definitely never existed in 32bit builds of Xen, when the int80
direct trap existed.

I don't see any evidence of it applying anywhere for compat PV guests
either, even those with syscall enabled.

> With it not
> really being an (emulated) MSR, but an agreement that guests will only ever
> care about having DF cleared (besides the requested way of dealing with the
> event mask). One of the many things not written down anywhere ...

If it's not written down, it doesn't exist...

And even if this is supposed to be a PV-FMASK-ish thing, it's buggy
because it apples also when #UD is raised for no registered callback. 
(And yes, I realise there is a chronology issues here (the #UD check is
the newer element), but it really will corrupt state as presented in a
SIGSEGV frame.

The question we need to answer is whether there is any remotely-credible
way that a PV guest kernel author could be expecting this behaviour and
relying on it.

I honestly don't think there is.

It fails the principle of least surprise compared to native behaviour,
32bit PV behaviour, and to every non-SYSCALL based 64bit event also.

It either needs writing down somewhere (and the #UD case fixing), or it
needs deleing, because continuing to leave it in this state isn't ok.

~Andrew

