Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97DA445DB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 17:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895896.1304578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxfN-0005dR-F8; Tue, 25 Feb 2025 16:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895896.1304578; Tue, 25 Feb 2025 16:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxfN-0005af-Bs; Tue, 25 Feb 2025 16:20:17 +0000
Received: by outflank-mailman (input) for mailman id 895896;
 Tue, 25 Feb 2025 16:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmxfM-0005aX-6F
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 16:20:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62cf3edc-f394-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 17:20:11 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so40242805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 08:20:11 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fc005sm2773844f8f.89.2025.02.25.08.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 08:20:10 -0800 (PST)
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
X-Inumbo-ID: 62cf3edc-f394-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740500410; x=1741105210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3m/HmoBDWz8oRBJ1wzXEj2YTYvFMIkMKm2yBMdz3/T4=;
        b=JAJfwT6Pf2JZm237npEbnYD7sQDgCKWEyrOL58R2HpjFL2Wf/ZY2pzWJfgCtdlQMMb
         QkezvVB6zr+A2K3cIEnyCdZKlRdh5pFk1fG3g+dpEuxgR/gIu2y92so/Zxlgy0T/XZz6
         +MCz5bEIoUuDdWQLTZkUCLr6I3W8um74WNyXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500410; x=1741105210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m/HmoBDWz8oRBJ1wzXEj2YTYvFMIkMKm2yBMdz3/T4=;
        b=fr9yEirV0tQ7srU7i+yJXJ/aJeExQKUho2IFRoTdDOU15t9qBrEKNPfZZRa4jKluq3
         jw2mlp8PEoKXUniqFGqp42MbzM+T0cv6i4c+JtcfrzP5BimtvXM+I4zdZpYjmwbrTK8V
         38qVG+bXd71C52uU11y+QnFyRtwEfJOMjGsS7zXYR5VBgsEj/XVdl/9EttF+/H767k9e
         YKCAP1uiVz11kSaqSG2dwdaQr7SFzxiZVK8r4XPjnE749xlfBo2zmC03PTc9OnKiNv1o
         AdCTxhNQ9+bChMYzm64CYjiHytgTAZpNS0OHSfamFLQJiix6a1mHyx//kuOdFrA7ouao
         B3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXRqJXwDeCw2PcI71rW4KK4joLVv7muncPN5j3K5fPmjF2j3LgW+ejVm2pFMd7m9xdCT2MgCyvYbrQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8OL66BvfNlSMx8Ekqoa8kGubjA4LelZC34A+z9fvHHTf0H4Wx
	kBjaPmYXb9/PfeqEahOMA2RilM3dJ3UNqEpk6LYTyhvg27JHT6GzxObuCZQlypY=
X-Gm-Gg: ASbGncsMh0e6MV2HwoHr1HBs/vJMTZGKObJbl54Ixv7VYYcu+TZNN96HWVIBAp1c9+U
	PPtrqHDJE9axBxj0n8He2wMVLT34bR2VnFr4ci+SRZ1/DrZDi3DO1vQmznZMMDv+bbQNYSerHeY
	U2LNnLbOb4h6sPxH0hkZdpd05r9pDGcClsOvmkEKfmjxNQs/9tzZNtcF1gzKeGlxPcPBDos67yg
	JxHArojE+mK/ciXpF47iz1bRhnUQA/djS1lh5PDDlfkBOMHSPh2qQomcJbmojrimh+GrZnYf9Et
	MdVwTT/eZYbdXy7vGkIM5XqP5tdyVsE3E3wwFqBds2+AdIDDitBgW5PaWNKo22JzVw==
X-Google-Smtp-Source: AGHT+IF9wHcA4tuGoseGRnRCRSY4gkkO5TXlSVIRFry83GvwRkjDhEdoK364UhuogO5Ap7q+I5w1Hg==
X-Received: by 2002:a05:6000:4027:b0:38d:cc9c:630c with SMTP id ffacd0b85a97d-38f6f3cd1b7mr13461210f8f.10.1740500410583;
        Tue, 25 Feb 2025 08:20:10 -0800 (PST)
Message-ID: <b2220e73-6e3c-46a7-8007-20567d12c749@citrix.com>
Date: Tue, 25 Feb 2025 16:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-5-andrew.cooper3@citrix.com>
 <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
 <0ced63b8-e674-4a88-a979-ff807afe3576@citrix.com>
 <924de1d3-94e8-4d0b-8f5d-ebc9a92e81c4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <924de1d3-94e8-4d0b-8f5d-ebc9a92e81c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 2:33 pm, Jan Beulich wrote:
> On 25.02.2025 13:54, Andrew Cooper wrote:
>> On 25/02/2025 9:00 am, Jan Beulich wrote:
>>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>>> Having variables named idt_table[] and idt_tables[] is not ideal.
>>>>
>>>> Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
>>>> idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
>>>> rather than opencoding the calculation.
>>>>
>>>> Move the variable into a new traps-init.c, to make a start at splitting
>>>> traps.c in half.
>>> Hmm, I'd expect a file of that name to contain only __init code/data, and
>>> hence for it to be possible to ...
>>>
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
>>>>  obj-y += srat.o
>>>>  obj-y += string.o
>>>>  obj-y += time.o
>>>> +obj-y += traps-init.o
>>> ... use
>>>
>>> obj-bin-y += traps-init.init.o
>>>
>>> here.
>> AP bringup and S3 resume will have a rather hard time working if that
>> were the case.
>>
>> Plenty of it does end up being __init, but not all.
> Hmm, yes. Yet then, taking into consideration what you put in that file
> right in this series (which there's nothing init-ish about, as the tables
> are needed until we reboot / shut down / crash), what's the designated
> pattern for what is to go where?

Configuring event handling turns out to be pretty disjoint from actual
event handling, and traps.c is already too complicated.

If you can suggest a better name than traps-init.c then I'm all ears,
but I couldn't think of one.

Other commits I've got in the next batch of cleanup are:

x86/traps: Move subarch_percpu_traps_init() into traps-init.c
x86/traps: Move load_system_tables() into traps-init.c
x86/traps: Simplify early exception setup
x86/traps: Fold init_idt_traps() and trap_init() into their single callers
x86/traps: Introduce new init APIs
x86/traps: Move percpu_traps_init() into traps-init.c
x86/traps: Move cpu_init() out of trap_init()

which gives some idea of what's changing, although this isn't complete
yet.  Even things like LER setup end up moving in here.

Setting up FRED requires the cmdline, feature scan, and a determination
of pv_shim, all of which precludes it from being used for early
exception handling.  Therefore, what I've ended up trying to arrange is:

1) early_exception_init() (start of day)
2) traps_init() (replaces the current trap_init())
3) percpu_traps_init()

where early_exception_init() is even more simple than what we have
today, and traps_init() tailcalls percpu_traps_init() to remove some
duplication we've got.

~Andrew

