Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174109FFC0C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 17:42:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864321.1275518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOGV-0007UY-68; Thu, 02 Jan 2025 16:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864321.1275518; Thu, 02 Jan 2025 16:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOGV-0007T3-1E; Thu, 02 Jan 2025 16:41:43 +0000
Received: by outflank-mailman (input) for mailman id 864321;
 Thu, 02 Jan 2025 16:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTOGT-0007RV-7Y
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 16:41:41 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa4ecf5-c928-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 17:41:38 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso83899345e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 08:41:38 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b271sm489515685e9.34.2025.01.02.08.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 08:41:37 -0800 (PST)
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
X-Inumbo-ID: 6fa4ecf5-c928-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735836097; x=1736440897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5HmnMZn0M/FKUnDLXHc9luI7h2dmGrU5jF9kHBTZesw=;
        b=PBnSEeTjkRdUCR0S4NjXFsjmKl255CXk2GVzw/mQ30gYNPw5/6AevcRL61sd9/9JGk
         JVC/7b4N/eB/G84p6EDS5QvWABSlDX+Rws8Xje+Bdk61XJ/ES7UftWCl7P87M6srqSi3
         /J7ETMaCEqzHkOuTjq5Brh6Egkq3S94zP6P7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735836097; x=1736440897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HmnMZn0M/FKUnDLXHc9luI7h2dmGrU5jF9kHBTZesw=;
        b=anvw0ntWtaneB/eDF2/iq3y21r6cSm6+4hI5NdxJqCXaHJVDBHK706O78SynqaXAFl
         YtoYHwC4aC6xX0AQRZKKHOKFDoNHzflvky6bP5htTnWF9dFzL68K33A+p4IFuMBc52zw
         YkxJdFhvSfnXzc3CGWR88BR/2ywXGFaK7/QSCrRDll3vjW45b251sc+UzmvpfaE8ND/e
         vi6uaMGGNlP9ri06cgr8G1oyw1ZRqPvf1SF0mkW3DQE0d4DQuF5zo+EHx6hAePnpeyfr
         hlU60kfw1KFW0ugfa/ClxC5PS0EHlZeFNlC2RGArBlsLx79DWMjX99waTpAUYM708nPD
         klgA==
X-Gm-Message-State: AOJu0YxJix7iUNw0WWmVHxyNorsrJHWtR6lRuJkZZ94qHOkR3rCGtnMt
	UC5MfZ3XJsM1UM1elVteBuETYKpQK+w/4tYjD5WQ6Mj6kriFLUPFy9lZPdpxsIs=
X-Gm-Gg: ASbGncuCtJ0z840UZ/NXERUJvybSdlpidW0pGUnIv1Di9MFQwJPJZyPGdpA9ElqLDa1
	AGbhSxWN/MwpSPcU+B0OUQPnAjD+qd7aeAbOcsAtlMm2ThRQF7AzHSXn+6rRpP7ykruGrBbryOO
	yf7YqZK/qkUJnIrDw6rtnxa2t72DyGLIXNWhmA8o6KRaIcjZSsp6GzQ9Meno7YF9yT7GRr2s1Sz
	mo1MBLSBBng54Wa7ZZQ8q8YIrivnUiv3F4ftx0ZS3MnnLEXFSk7to9cUWaakJ32i8s=
X-Google-Smtp-Source: AGHT+IGi7bcb7hkyb+/EEwVJzkCJYKAKvkBrH7iqz17+HOgYEOp7acm7PCC5Py7fwXbO1hkZeP0b2A==
X-Received: by 2002:a05:600c:4588:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-43668643348mr414630515e9.12.1735836097581;
        Thu, 02 Jan 2025 08:41:37 -0800 (PST)
Message-ID: <d0a4ac1b-3afd-400e-8ad7-3b0e2c6f19f2@citrix.com>
Date: Thu, 2 Jan 2025 16:41:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen.efi "must be loaded below 4Gb"
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <0b4d4fa4-7d8e-444e-a4a0-f2dc677178a5@citrix.com>
 <Z3a_Civ7ZZHO0uxH@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z3a_Civ7ZZHO0uxH@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/01/2025 4:30 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 02, 2025 at 04:26:28PM +0000, Andrew Cooper wrote:
>> Hello,
>>
>> Forwarding a bug report from IRC from before Christmas:
>>
>> ---
>> bit of a random question, but: has anyone had any luck booting efi
>> builds of Xen? over the last year or so I've tried 4.18 and 4.19, Alpine
>> and Fedora builds, and on a Dell PowerEdge R430 and an Optiplex 7010
>> Plus, and in every case received an error that "Xen must be loaded below
>> 4Gb"
>> ---
>>
>> The Xen.efi path does expect to be loaded below 4G, and does give up
>> rather than relocating itself.
>>
>> Right now, I'm aware of at least one blocker to xen.efi being able to
>> relocate itself, and that is because it populates the MB1 metadata with
>> physical pointers into the ebmalloc[] region, which is in .bss.  
> What about not touching anything MB1-related in the EFI boot path? MB1
> can't possibly work on EFI, right?

All paths in Xen currently convert bootloader data in MB1 format to
__start_xen().

Then (as of the start of the Hyperlaunch series), __start_xen()
transforms it into struct boot_info.

While it might not sound like it, this was the right course of action
(IMO) for the Hyperlaunch series; there was simply too many things
needing untangling in the boot path to do it all in one go.

>> Fallout
>> related to this was the subject of c/s 0fe607b2a1 "x86/boot: Fix PVH
>> boot during boot_info transition period" and a protective ASSERT() included.
>>
>> The ProperFix(tm) is to remove ebmalloc(), and the scratch space in the
>> trampoline, and instead have a range in initdata to stash the bootloader
>> metadata, and use virtual pointers rather than physical.  This also
>> avoids us double/triple handling the bootloader metadata, simplifying
>> all aspects of the startup logic.
> This obviously would be better
>

The end goal IMO is to have each boot path fill in struct boot_info
directly, but they need somewhere to stash the metadata, and preferably
not in the trampoline.

A 64k region in initdata ought to be sufficient, and anyone needing to
be more fancy can see about stea^W borrowing the BRK infrastructure from
Linux.

~Andrew

