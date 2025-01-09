Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C4A07CCA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868943.1280453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuzw-0003Dz-Sn; Thu, 09 Jan 2025 16:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868943.1280453; Thu, 09 Jan 2025 16:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuzw-0003C5-QA; Thu, 09 Jan 2025 16:03:04 +0000
Received: by outflank-mailman (input) for mailman id 868943;
 Thu, 09 Jan 2025 16:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVuzw-0003Ab-1K
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:03:04 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34041786-cea3-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 17:03:02 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so1561417a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 08:03:02 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c3328sm741593a12.50.2025.01.09.08.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 08:02:59 -0800 (PST)
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
X-Inumbo-ID: 34041786-cea3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736438581; x=1737043381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HkPOKDwJTT71PqxipilfqxoNZ07pAan+OOcRHn9yvM=;
        b=pYvnO9SXtb91Cl3F/kw1l4ANQSwQKdT+PPjGG6F3R/CDiTOZ24BnwhEQ70LTq+Z1PN
         XJMW0IlQfyETlg65ULz/sqqt7rYAC3PD8xIAVAQ0vl9KkBDD5lua803HxwWz7Ikdgrm9
         LKlHgNoux9N2QbHGqPr4yvrVdzuAbeLvv7rBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438581; x=1737043381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HkPOKDwJTT71PqxipilfqxoNZ07pAan+OOcRHn9yvM=;
        b=Bg9M6jPF1hP9ilCVATmTxfzv85MfwThwNllbZC3QbWp3FXt2Apvuy67qA377v1SWgp
         RupRxASlGo+3sqz6EhtJO8ejihNllDYIOxqKQntA2xVl8dI26ZLIrj/dhH6z17Qdqoov
         Buwv/poDg8dzup1e2SSI3isJK6AiavgvKvu1A/NyBRsvCElBhwey1BrCpfin1VTWhiav
         K61TDgEhCHyZGzpI8fY/5AIBtSuIY4v/1rDHwOOLCvAQe5BqA3xhDn1BojaP4yMu8rlj
         dqN31ByN/YONdD4ZQ8zkvejDgiknCgifgIvXshkFlcqEM66A0Lk2XmXz1grAjOsglf0w
         wp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+1Q5N8I/4gMCqzN7PmgufkkhMLFrtJhZp+tGZcKmBwtLo4b4OUDe323JGxnXyoGvQrD1K9qWalkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIqNtse+feBN/VZ/wB6RySmyvVgyNu2MJdw7I0PD6AhYP2ozzj
	UFcKOPINUW0ob5nJyWqPxho5z7kAZOCyHHdp6cc+Uto4x7VVNGNKy3KEHe/OYp/vMED0d8k6CDA
	NMvRebw==
X-Gm-Gg: ASbGncvIMRNCzkLMEGUcPQQ3AuztEg+PUABA2ZK9DZejHqiAv5guy2/FS+MsY+3GcoF
	CKXlLmofv+hHtP+vy574Wn5DnwUx6HKq6LRvNLo3FyXYvDhKcsSwgkeWJdhJ2nswpX2z9QK9B7o
	JM5xJ0lDcFwooQvHzxeZsbGkg2pyggQIwLnXL1E42NMZIF2CQ9N4ncBdLcz5y2H6fyRzs34Fr3B
	mfmnNs8+jXEGvwy9g8axLlzpZYh/8UhLNvcnQwqI9AlMkPEHVF4cHka/EhfUa4rX/A=
X-Google-Smtp-Source: AGHT+IHuWeIfgs+xUG5AzvntOZBQt8ve/4Fc4X6KAGzzlrcLLB/Pl3k14n33OOD1Ml5EiepJoCpV5g==
X-Received: by 2002:a05:6402:5254:b0:5d3:fc60:a504 with SMTP id 4fb4d7f45d1cf-5d972e17891mr6287880a12.20.1736438580073;
        Thu, 09 Jan 2025 08:03:00 -0800 (PST)
Message-ID: <689e4152-b48b-4808-a407-6c33e6e071e0@citrix.com>
Date: Thu, 9 Jan 2025 16:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
 <d7421558-c2d6-485b-96bf-927992c5c066@suse.com>
 <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
 <CACHz=ZjR6dSy_NsrXkhf_VfZpGYE4et6VkQvU_cO9DdAnXBzxQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZjR6dSy_NsrXkhf_VfZpGYE4et6VkQvU_cO9DdAnXBzxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2025 3:30 pm, Frediano Ziglio wrote:
> On Thu, Jan 9, 2025 at 1:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 09/01/2025 1:23 pm, Jan Beulich wrote:
>>> On 09.01.2025 14:15, Marek Marczykowski-Górecki wrote:
>>>> Xen compiled with -mtune=generic has .text alignment set to 64-bytes.
>>>> Having text_diff non-64-bytes-aligned breaks stuff:
>>>>
>>>>     Traceback (most recent call last):
>>>>       File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xen/./tools/combine_two_binaries.py", line 96, in <module>
>>>>         raise Exception('File sizes do not match')
>>>>     Exception: File sizes do not match: 70160 != 4080 + 66048
>>>>
>>>> Adjust the numbers as suggested by Frediano to work with 64-bytes and
>>>> even 128-bytes alignment.
>>> And then breaking at 256? As indicated on Matrix, imo we should be able to
>>> cope with anything up to at least PAGE_SIZE. Or we should reduce .text
>>> alignment before linking.
>> Do you have a concrete proposal on how to do this?
>>
>> Because if not, we've had 2 downstreams hit by this build failure, and
>> we probably ought to take this patch as a stopgap fix, and see about
>> doing the better fix for 4.20.
>>
> I agree with this, merge this and then leave the improvements for follow up(s).
>
> Yesterday I checked the output object file (built-in-32.o) to find
> that the output alignment is 1 byte, which is obviously wrong!

No so.  It's perfectly easy to end up with 1 byte alignment on .text,
commonly with -Os.

e.g. In my build, reloc-trampoline.32.o has:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .group        00000008  00000000  00000000  00000034  2**2
                  CONTENTS, READONLY, GROUP, LINK_ONCE_DISCARD
  1 .text         00000076  00000000  00000000  0000003c  2**0
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  2 .data         00000000  00000000  00000000  000000b2  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  3 .bss          00000000  00000000  00000000  000000b2  2**0
                  ALLOC
  4 .text.__x86.get_pc_thunk.bx 00000004  00000000  00000000  000000b2  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  5 .comment      00000020  00000000  00000000  000000b6  2**0
                  CONTENTS, READONLY
  6 .note.GNU-stack 00000000  00000000  00000000  000000d6  2**0
                  CONTENTS, READONLY

and this is entirely reasonable IMO.

That said, the fact that built-in-32.S does not have at least one .align
directive probably is an issue.

x86 will cope, and there's nothing interesting in this code that's going
to choke on being misaligned.

~Andrew

