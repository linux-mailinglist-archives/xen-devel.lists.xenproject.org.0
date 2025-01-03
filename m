Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE7A0028E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 03:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864534.1275770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTWzK-00062M-Ja; Fri, 03 Jan 2025 02:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864534.1275770; Fri, 03 Jan 2025 02:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTWzK-0005zG-Ey; Fri, 03 Jan 2025 02:00:34 +0000
Received: by outflank-mailman (input) for mailman id 864534;
 Fri, 03 Jan 2025 02:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/LDK=T3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTWzI-0005zA-Oe
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 02:00:32 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8236f17e-c976-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 03:00:30 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so122899705e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 18:00:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acb17sm38987351f8f.97.2025.01.02.18.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 18:00:29 -0800 (PST)
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
X-Inumbo-ID: 8236f17e-c976-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735869629; x=1736474429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7zuOjVXgnkPwQMP7MR7TKO6LRc7j4GDa+39am5cyxng=;
        b=vb7GEz2ZQ33EzDjoWm5DJOt0IGihSiLQ1PdsLPfv2gzy915QaYbuB7gTG6YQk363lt
         7p5AUODXgthJLuNC5vN5TuJPLV7qFtGhDI3YWD2zgR7knmcAyQIA5urOF0E6Wx2BcCP7
         La2n/OwYMfl/vU3fIX4vGZWbaa8uD3SZMsg90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735869629; x=1736474429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zuOjVXgnkPwQMP7MR7TKO6LRc7j4GDa+39am5cyxng=;
        b=CLHpcBjR5EU6GDmSCehZ5wUOUHhGN+zeunPWACH4KOZmATj0lFgoejveH9NL7DrkwX
         Ei4bG+ivcWscovGhI0MxjPhKV6nddCvLHZBWenr/SkctlrFIkG71MiOlMLmuwD5RW6jA
         f23j+6d2iDFu8Oieph3HDtyftk4tGb0cK69IHPIvlIzS8RgogwpXXF7mzfYiPvIWOzqu
         mQok7CFMSR0PSrhs49nVRdW125foOs3kOIJ2cA9do6PJmrrCNGpVxS4smYQ8SpPyWERN
         wXoydcgPO/iamEAilGazChrBm+FPTRPSFeDOCk9eN5GHcaq1nRnAVDTu+dXYMbIQebN2
         qx+Q==
X-Gm-Message-State: AOJu0YwfUqmTj6w0wxluBliM1SZ/8V5tgyIH7Tz6XjBhktWCB66XPFhf
	AAFmofgiheNMF5t3quNNFlw9u5vWmr3tecw4wClyX4QkKJtjuKPtd6SquWY4gv0=
X-Gm-Gg: ASbGnctmmwLuUrZSLFvcMZrFSN5L0P+7HL3hccey9VQlA0CIIO1CCTVGjHrwxL5CKeI
	risDICFwq9ZD9Ce0oqVPkfAuW+wI9N7WXUJMfx5Cu1i/r/Pas2h5TneYFufEy2gQcy1GIluBmHh
	46ASwmq6K1qV6vUGEmHrXRa1DmDNI7rvY4JQnSoT1fQgE61x8khg6+64JeAkdod4CyUnEekKlg2
	de82JfnMeRVWZy07AHMtP+sx2A7ayvH+w8IlJhmfVAycWjI/qH3D/nXzi7DD2DBVnC+LaMk97TG
	nT/Afy36qMTh3geAWhFA
X-Google-Smtp-Source: AGHT+IEgfwFHdWLdolAtzV3QVe5gYBtDXjFdMTGRAetAtySdB6+2/1XtCqj3FLZT9QaksDRM0zE+5w==
X-Received: by 2002:a05:600c:3146:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-43668b5f887mr441204145e9.31.1735869629493;
        Thu, 02 Jan 2025 18:00:29 -0800 (PST)
Message-ID: <b4b2229f-a139-4cfe-9cb1-e218b7123c08@citrix.com>
Date: Fri, 3 Jan 2025 02:00:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com> <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl> <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
 <Z3brZQmYhx-QTnga@mail-itl> <Z3cs1-wG5WJ9FrAR@mail-itl>
 <Z3cyhdKu6M1vdBe_@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z3cyhdKu6M1vdBe_@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/01/2025 12:42 am, Marek Marczykowski-Górecki wrote:
> On Fri, Jan 03, 2025 at 01:18:31AM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Jan 02, 2025 at 08:39:16PM +0100, Marek Marczykowski-Górecki wrote:
>>> On Thu, Jan 02, 2025 at 08:17:00PM +0100, Jürgen Groß wrote:
>>>> On 02.01.25 19:54, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>> On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
>>>>>>> On 02.01.25 11:20, Jürgen Groß wrote:
>>>>>>>> On 19.12.24 17:14, Marek Marczykowski-Górecki wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> It crashes on boot like below, most of the times. But sometimes (rarely)
>>>>>>>>> it manages to stay alive. Below I'm pasting few of the crashes that look
>>>>>>>>> distinctly different, if you follow the links, you can find more of
>>>>>>>>> them. IMHO it looks like some memory corruption bug somewhere. I tested
>>>>>>>>> also Linux 6.13-rc2 before, and it had very similar issue.
>>>>>>>> ...
>>>>>>>>
>>>>>>>>> Full log:
>>>>>>>>> https://openqa.qubes-os.org/tests/122879/logfile?filename=serial0.txt
>>>>>>>> I can reproduce a crash with 6.13-rc5 PV dom0.
>>>>>>>>
>>>>>>>> What is really interesting in the logs: most crashes seem to happen right
>>>>>>>> after a module being loaded (in my reproducer it was right after loading
>>>>>>>> the first module).
>>>>>>>>
>>>>>>>> I need to go through the 6.13 commits, but I think I remember having seen
>>>>>>>> a patch optimizing module loading by using large pages for addressing the
>>>>>>>> loaded modules. Maybe the case of no large pages being available isn't
>>>>>>>> handled properly.
>>>>>>> Seems I was right.
>>>>>>>
>>>>>>> For me the following diff fixes the issue. Marek, can you please confirm
>>>>>>> it fixes your crashes, too?
>>>>>> Thanks for looking into it!
>>>>>> Will do, I've pushed it to
>>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will build it
>>>>>> and then I'll post it to openQA.
>>>>> It is much better!
>>>>>
>>>>> Tests are still running, but I already see that many are green.
>>>> So are you fine with me adding your "Tested-by:"?
>>> Yes.
>>>
>>>>> There is
>>>>> one issue (likely unrelated to this change) - sys-usb (HVM domU with USB
>>>>> controllers passed through) crashes on a system with Raptor Lake CPU
>>>>> (only, others, including ADL and MTL look fine):
>> Correction, it does happen on some others too, just got the crash on the ADL
>> system, although looks a bit different ("Corrupted page table at ..."):
> I've collected some more of them at https://github.com/QubesOS/qubes-issues/issues/9681
>
> Should I start new thread for this? On one hand, it's a different domain
> type (HVM), but on the other hand, many of the crashes are around
> loading modules too.

https://lore.kernel.org/lkml/20241227072825.1288491-1-rppt@kernel.org/T/#t
looks relevant.  Probably worth following up.

~Andrew

