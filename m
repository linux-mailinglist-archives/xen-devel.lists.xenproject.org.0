Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12089A04557
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866608.1277926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVC0J-0007xn-8i; Tue, 07 Jan 2025 16:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866608.1277926; Tue, 07 Jan 2025 16:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVC0J-0007vy-5Q; Tue, 07 Jan 2025 16:00:27 +0000
Received: by outflank-mailman (input) for mailman id 866608;
 Tue, 07 Jan 2025 16:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJXC=T7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVC0I-0006Jb-6c
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:00:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c0e416-cd10-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:00:25 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso13235370f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:00:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847dabsm50113190f8f.59.2025.01.07.08.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:00:24 -0800 (PST)
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
X-Inumbo-ID: 81c0e416-cd10-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736265625; x=1736870425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gEgQIJ7TVFn9cHGSs2Q+5ac3V5udTqHVni+jQdaG1Io=;
        b=VHqP/3mV5Od4uzprFUfo1LDyq4ilVp8yFNrDbZw4sWUcyIl6mC+aeoj0sCTGaN2TBk
         3dOtXk9GRXW3XZH7yLvDsyXqZAnJ0Bm7QH93ePtUJIVoych3dUOR3PtaRdpEoPxiY/r4
         XDnep6EL54Q/xFy2flvX/SWhXh88U7mpLksqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265625; x=1736870425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEgQIJ7TVFn9cHGSs2Q+5ac3V5udTqHVni+jQdaG1Io=;
        b=BsRw6nLXpPKOrXNrNOH5Z6zZ1hGm0KFSivPyxlxqhVqYSH0QUtuFoU/Arf0d4WfkLb
         U0QL1pgHHtzVaYkDZlFdX02KSR2CPJTapYhM5pFVY4qZAmlpL+eNTWAwEbYU1SDa1R2u
         8tZkHduiCEt+DLv/UTEGn94xuM+TBQ9B3VkhCbg28M0sabDFXtRu1Kyjjts3B9N3QS8E
         QqchUw0DexwFRCPyjZBMQwqDVEvd73wLMLeb7iKMb0cSkkUiDeKo/d3sIPuMBNDYFusN
         Gy3nmg/HQIHIl92Zg9gK9ByWeaEZ5kvtU5Me/N88JcGI5vydORZaKWn6yne2dS1U2Gsn
         sDsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY0NuabVfgevY4KPMF1hZfdOvYi0hjAO49qKl/j7inxep7Zm/fJHMaSAvfTm3Ir1TKrRxuxTRzgTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB7Fjf3HEVZcRIQ9ggKVcLbBJ9EnRf2Zals+bMIg63lgM/59J4
	T1TnX+IDIKZkiYnxJoLC5oukatWJCSzGK0XE/algUM4li4fOwzyNEhIczCfN83XyOQn/7scdVOx
	VVcX8KQ==
X-Gm-Gg: ASbGnctw/NGTiF094OT6tqgVFA85nmxe6GGHsTqEMtwHu8YdIEUK6xbr7C4EIlmf21D
	CFg/9Zis3PhslODPzAmRP6BPdGtI/A9SwHkdUxewvigxXSvAizvzOn957qzFIRO+p3FFylGO+/d
	8Zr/axqi3bRPy+s9HUpp7Yvmz+AD4KC0Z52EVDnTm8FR7XHo5GDq3NY034u5fDeXbHoxAevCyHk
	7KprL1mXZpNfKed57/5tAd2Emlg4/Em0hxsQKh62IcrSX9mfh+fIqw0iXgE1sXXjM73CKcu++A4
	CrkFJS6+gZJph24eZ5hz
X-Google-Smtp-Source: AGHT+IGq7CuXdeGSayZvelDeWu27PXSD8YGvIVVrzRovIGhl3Dpnv7h22S5fdbWWISDlwYRUACxhSw==
X-Received: by 2002:a5d:6daf:0:b0:385:fa33:29ed with SMTP id ffacd0b85a97d-38a223ffb65mr49414075f8f.47.1736265624579;
        Tue, 07 Jan 2025 08:00:24 -0800 (PST)
Message-ID: <21e306c0-2edc-44b0-88c0-0d4ee85e9b14@citrix.com>
Date: Tue, 7 Jan 2025 16:00:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: correct put_fpu()'s segment selector handling
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81428267-e963-4403-989d-d96fb0b59ffc@suse.com>
 <8db5b675-385f-4ea7-a2e9-7a8a54d96f72@citrix.com>
 <526672ec-4140-4c51-b67a-3b4b803314c2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <526672ec-4140-4c51-b67a-3b4b803314c2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2025 3:41 pm, Jan Beulich wrote:
> On 07.01.2025 16:37, Andrew Cooper wrote:
>> On 07/01/2025 2:33 pm, Jan Beulich wrote:
>>> All selector fields under ctxt->regs are (normally) poisoned in the HVM
>>> case, and the four ones besides CS and SS are potentially stale for PV.
>>> Avoid using them in the hypervisor incarnation of the emulator, when
>>> trying to cover for a missing ->read_segment() hook.
>>>
>>> To make sure there's always a valid ->read_segment() handler for all HVM
>>> cases, add a respective function to shadow code, even if it is not
>>> expected for FPU insns to be used to update page tables.
>>>
>>> Fixes: 0711b59b858a ("x86emul: correct FPU code/data pointers and opcode handling")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> The code comment may want adjusting in the course of FRED work.
>> It compiles when displacing my temporary patch in the FRED branch.  I've
>> not got the ABI compatibility in userspace working yet, but
>> regs->{ds,es,fs,gs} will be staying, so the #else case should be fine
>> (assuming they're populated properly).
>>
>> So, tentatively, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>> That said, I think it would be nicer to see about excluding the FPU in
>> these cases.  Both cases lacking read_segment() hooks are pagetable
>> emulation, and I'd say it's more likely to be code corruption than there
>> actually being x87 instructions in the middle of a dual 32bit PAE update.
> I considered this case, but decided against going this route. We shouldn't
> be stricter than necessary towards what we permit guests to do, however odd
> it might look to us.

I suppose so, but then I wonder if we ought to be setting up more
infrastructure by default for emulations.

We've got an awful lot of the emulator which has fallback paths upon
fallback paths, and probably is not as well tested as it ought to be.

~Andrew

