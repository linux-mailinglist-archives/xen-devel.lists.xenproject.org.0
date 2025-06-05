Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460BEACF4E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007224.1386538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDxj-0002AH-2t; Thu, 05 Jun 2025 17:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007224.1386538; Thu, 05 Jun 2025 17:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDxj-00028O-0C; Thu, 05 Jun 2025 17:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1007224;
 Thu, 05 Jun 2025 17:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uNDxh-00028G-Lt
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:01:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9dd74f-422e-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 19:01:04 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45024721cbdso10331695e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 10:01:04 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a528fd6810sm2335786f8f.27.2025.06.05.10.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 10:01:03 -0700 (PDT)
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
X-Inumbo-ID: aa9dd74f-422e-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749142864; x=1749747664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YfivrmoX0ONYTeqvomWWAChfQ+T9BIWZ3/FlVOJC+Bc=;
        b=tC1y8k7s+ozjjZv/6LMr6BGdsJQb1q1WtRif9uzs+m1VbyEtyYKkjOEXETbgX5EINN
         8LzTXAIIsdqN4FE6GxBSCq4BDgi9e3ZGsrpfoIcPLs4z/w7oXX2wKX/RzR1cNrM3dtrb
         uZV/zghvdyul9vrwyUwgOQVFCNEc4/8JqEO8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142864; x=1749747664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfivrmoX0ONYTeqvomWWAChfQ+T9BIWZ3/FlVOJC+Bc=;
        b=lcMJ5BSeD0mV24V50o2fKdnHZnGqZsp4x/ZGKGIrzDqfyBff/yzhZVlkjGFF9I14ht
         GfSWV+/x87/761a19BWLpaAFESPjKw88U+y7F/GUjU4FBOhFGisp01ETpZR8HzrE9Ynz
         QNerhaJ9YKKl8IeUk8vstVudOEVly3SMLX6YwNJ/5xQS2uIZ5TAku8N0D5Opokhjb6Mp
         IALmo4jMr7iS7tNyxrjX/tGdajG+K0Ymsh4OJ+cDJGbZ1Kg8R5xcQX8Kxb98TstvQPxe
         0LHQ4HNL0feJKLQDPqtN90xQmhVabnj/5HjgQXaNmwH1UQwogVkxBIImemhPF7jRC5IG
         Me6g==
X-Forwarded-Encrypted: i=1; AJvYcCVS6VS8h/m2GHAG4WbMHE+FnnC+l7QMmg/ecNsqqfwYS7fQ7epx415hwamqTrDQO7XUggh4dQ7ot5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBddkLCzhumD4HQkhNPpma2qtX6svSIpVMAV4g5kl3YSfk70Fh
	wiyQ+G5IzxRkYSitHq0Il9xpVpMBHqzEnKpUbLObHMOZocHobnhTx5W9R/P0+q5PaLg=
X-Gm-Gg: ASbGncsujkzOcNwn0K6ujl4zX9XCYrdSyQR6XCnMf+VuQ2LtmdlO5jpTAygqJ9MvfoQ
	cys+Lv+c7LdmXXGySyvKKtgYMAxCvPo4WdKjucRb4jsjgBp8NcLZM1iGL3ARgUd8xCQpo/g+Zs8
	U5q0Z7MWPYPO4J/8SsfN+0w8pkRDv5WebpCHP9wkjiEEUE1NgbWCYXbNknZujQX9fnoRQ1xdkqc
	x4T0nbwDGdJrNHoG97+xJ/hfV+G8dXezfmp1WlAwm5zR8docwMtBa7UfifrABOppN1zSx/+ZBsU
	F+KsdwsT9RJpI6CSxybUmSU12NtU360e60zVbMD667bt8W4x5HauxZS7Hdlvw/rFIJm+baXVzJ/
	Ko8K/Zw+hKJXNMaRJ
X-Google-Smtp-Source: AGHT+IFHPcrElHFm4KZc6ptBsMWQHeWeUPAcwIRRjh8Nr1ykv4GXNv/IxliRBHVugqeuDb1XACqtJw==
X-Received: by 2002:a05:600c:8b43:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45201427c5amr201105e9.32.1749142864028;
        Thu, 05 Jun 2025 10:01:04 -0700 (PDT)
Message-ID: <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
Date: Thu, 5 Jun 2025 18:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/06/2025 2:24 pm, Jan Beulich wrote:
> On 05.06.2025 14:14, Andrew Cooper wrote:
>> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>>> The format of the buildid is a property of the binary, not a property of how
>>>> it was loaded.  This fixes buildid recognition when starting xen.efi from it's
>>>> MB2 entrypoint.
>>>>
>>>> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> I'll pick this up without a Fixes: tag, but I think it ought to have one. (I
>>> didn't check whether MB2 or build-id support came later, hence introducing the
>>> issue.)
>> MB2+EFI came long before any buildid support.  If you want a fixes tag,
>> it's eee5909e9d1
> That commit talks of an earlier hack, though. And no, MB2 work came later,
> albeit still in the 4.9 dev window (commit 9180f53655245).

The "previous hack" was embedding note.o (from the livepatch test
infrastructure) back in the main xen binary.

That's still present.  For xen.gz you get an elf note.  For xen.efi, it
may be an elf note or a CodeView region, depending on the toolchain.

>
>>>> --- a/xen/common/version.c
>>>> +++ b/xen/common/version.c
>>>> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
>>>>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>>>>  
>>>>  #ifdef CONFIG_X86
>>>> -    /* Alternatively we may have a CodeView record from an EFI build. */
>>>> -    if ( rc && efi_enabled(EFI_LOADER) )
>>>> +    /*
>>>> +     * xen.efi built with a new enough toolchain will have a CodeView record,
>>>> +     * not an ELF note.
>>>> +     */
>>>> +    if ( rc )
>>> Instead of dropping the efi_enabled(), I think you want to replace EFI_LOADER
>>> by EFI_BOOT.
>> No - that's differently buggy.  I suppose the commit message wasn't
>> clear enough?
>>
>> We'd still have a CodeView record if we booted xen.efi using it's MB2
>> entrypoint without the EFI extensions.
> Hmm, if that's a possible mode of operation (as said in reply to Marek, I
> wasn't aware of that) - yes.

It's how I found the bug.

There's an awful lot of hackery in the patch-queue holding it together,
but in this case it's not really about MB2 or anything else; it's
xen_build_init() being incorrect in how it determines whether there's a
CodeView region or not.

>
>> This really is a property of being a PE32+ binary, and nothing to do
>> with EFI.
> Which still can be checked for without having this code path being taken
> for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
> image property (yet I expect you're going to sigh about yet another hack).

It's all hacks, but no.

I'm amazed MISRA hasn't spotted that we've got a global `struct efi
efi;` and a label named efi, creating an alias for the object with it
out of bounds in the compiled image.  But even then, it's based on
XEN_BUILD_EFI not XEN_BUILD_PE and does not distinguish the property
that matters.

But the argument I'm going to make this this:  Why do you want a check,
even if you can find a correct one (and as said before, I cannot)?

This function is run exactly once.  We've excluded "nothing given by the
toolchain", and excluded "what the toolchain gave us was not the
expected ELF note".  The only thing left (modulo toolchain bugs) is the
CodeView region, and if it's not a valid CodeView region then we've
wasted a handful of cycles.

~Andrew

