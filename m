Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D183B88E05E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 13:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698507.1090230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSTM-0002wy-AH; Wed, 27 Mar 2024 12:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698507.1090230; Wed, 27 Mar 2024 12:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSTM-0002uy-7h; Wed, 27 Mar 2024 12:33:40 +0000
Received: by outflank-mailman (input) for mailman id 698507;
 Wed, 27 Mar 2024 12:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df3K=LB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpSTK-0002us-Hw
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 12:33:38 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b13288c-ec36-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 13:33:36 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-690cf6ecd3cso38435146d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 05:33:36 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 13-20020a05621420cd00b00690c5ec348bsm6268848qve.119.2024.03.27.05.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 05:33:34 -0700 (PDT)
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
X-Inumbo-ID: 3b13288c-ec36-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711542815; x=1712147615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JxczMfJ30z2VHDAbpCr4xN7ytkIAvD8zwwS4d1Qj5GE=;
        b=a95VkbSpeiskwmJDQ0QSVWti8hua+lMMKXWjmjMeWOE30xEWEvk2iPmibCNufYXJlY
         JAIe/sDzbbIToEGqvhm8pB3l80NTbKLEDAzd4nNlRqrKH8yKCIfL1r4OBIuqG41RHltk
         QnM+QvWZ5avBC9CyTAQxwQYQF1OZ9fW0kcE74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711542815; x=1712147615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxczMfJ30z2VHDAbpCr4xN7ytkIAvD8zwwS4d1Qj5GE=;
        b=DnseV+oI1YUSTOhM1Ah+FhY4wzRKYDAI41K9fPtvAmwI6P8Bv4XDVMhL2aBKoWizpl
         6wv094V1J0srSnmDYTB67653c0/bwymU2xWTMEbJI0zRdEmZcyVnWskQ7GFoaGJbSsUO
         +sV/KCiGQOCf2JUA5arvA1lMj23GAlWrMNJ8g8chKONkhoyyKpl8wDa/ffnlQVV/dD72
         780xi/HGJytik/ulJ8IzjIVI1iNLSiM7QnH/zHY7iAgqZsjNphZ5oS/b9DiIF5UB87Px
         IVX2505dGs5CkLQUbsPj6vX4XxIyR44ijmo1CwFeRMxaePYGGZI7pBZgeNC8z+m9c/DP
         cmbA==
X-Forwarded-Encrypted: i=1; AJvYcCXkttQdfQxZHuLG2GkLy0KiArpMehieKDtlAEiEpHfL+ONdByCqWbdrHTDA1rgD4X70/ZW6I0P+OeRJ+ba0+kR3jm8b1a9nhPSbC9VBleE=
X-Gm-Message-State: AOJu0YxwHMOTlqYocdUHo39pDuD5pHqZOWh9yN0YzoE7fLw0ErlvDsZw
	WXDfPkKzTYARUOENxwUGHcsHn0BsZ3/aCEJu5Ngs9zlKMgeJTiT80KLojqG1YEo=
X-Google-Smtp-Source: AGHT+IGFGB+nqrpXGfsZ0Lmeg62QLftDsGTFgXKRDHD6E/K1N0AO5OC3ZhbAJ8u5oetKQtzsFwHqgw==
X-Received: by 2002:a05:6214:186b:b0:696:ae51:3644 with SMTP id eh11-20020a056214186b00b00696ae513644mr1200512qvb.11.1711542815286;
        Wed, 27 Mar 2024 05:33:35 -0700 (PDT)
Message-ID: <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
Date: Wed, 27 Mar 2024 12:33:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2024 12:23 pm, Jan Beulich wrote:
> All,
>
> the release is due in two to three weeks. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant.
>
> Note that this is going to be the last Xen Project coordinated ordinary stable
> release from this branch; the branch will move into security-only support mode
> afterwards.

1) livepatching of .rodata:

989556c6f8ca - xen/virtual-region: Rename the start/end fields
ef969144a425 - xen/virtual-region: Include rodata pointers
b083b1c393dc - x86/livepatch: Relax permissions on rodata too

And technically "x86/mm: fix detection of last L1 entry in
modify_xen_mappings_lite()" too but you've already backported this one.

Patching .rodata worked before Xen 4.17, and was broken (left as a TODO)
when I adjusted Xen to stop using CR0.WP=0 for patching.


2) Policy fixes:

e2d8a6522516 - x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
policies

This is a real bugfix for a real regression we found updating from Xen
4.13 -> 4.17.  It has a dependency on

5420aa165dfa - x86/cpu-policy: Hide x2APIC from PV guests

which I know you had more concern with.  FWIW, I'm certain its a good
fix, and should be backported.


3) Test fixes:

0263dc9069dd - tests/resource: Fix HVM guest in !SHADOW builds

It's minor, but does make a difference for those of us who run these
tests regularly.


4) Watchdog fixes:

9e18f339830c - x86/boot: Improve the boot watchdog determination of
stuck cpus
131892e0dcc1 - x86/boot: Support the watchdog on newer AMD systems

You took "x86/boot: Fix setup_apic_nmi_watchdog() to fail more cleanly"
and the first of the two patches is in the same category IMO.  The
second I also feel ok to take for the in-support releases, particularly
as all it is doing is dropping a family list.


5) Ucode scan stability  (For 4.18 only)

Xen 4.18 had "x86/ucode: Refresh raw CPU policy after microcode load" in
it's .0 release, so should also gain:

cf7fe8b72dea - x86/ucode: Fix stability of the raw CPU Policy rescan

I've only noticed because I've got them both backported to 4.17 in
XenServer, but I don't think upstream wants to take that route.

~Andrew

