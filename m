Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E298971F6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700558.1093897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1Ha-0003VV-Qh; Wed, 03 Apr 2024 14:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700558.1093897; Wed, 03 Apr 2024 14:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1Ha-0003TO-Nu; Wed, 03 Apr 2024 14:08:06 +0000
Received: by outflank-mailman (input) for mailman id 700558;
 Wed, 03 Apr 2024 14:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pg83=LI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rs1HZ-0003TI-73
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 14:08:05 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95eab264-f1c3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 16:08:03 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d700beb60bso107274181fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 07:08:03 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bi2-20020a170907368200b00a4e86dd231dsm2154694ejc.42.2024.04.03.07.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 07:08:02 -0700 (PDT)
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
X-Inumbo-ID: 95eab264-f1c3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712153283; x=1712758083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZHSSjzkoooPdOF46z3ZebLhP62bZRpoSNsCXg0WE5s=;
        b=n10eiq/wVFPZkFwLjrp2Thmf3rNabhhGiVVkWo7gsV23SAg1BqTR9Be4bn2jr/WJG0
         bGccbuoLEg6T7hUzI3a2bsPvESJJshl8iWA9lkx+Aa5Yg5mlnlFqJWvYS1yHM9haTBOp
         KXyooQWaZG8D71dGn30QKzsTTL29MxFwqfSNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153283; x=1712758083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZHSSjzkoooPdOF46z3ZebLhP62bZRpoSNsCXg0WE5s=;
        b=XyvQBreX2abdppQTGtz5T0OxX1+8PrJojWsMpByIH2fHczmT7Vwe9isetjhhxw+N0J
         uXzr5v9vlU5vnBQkQQezYvbcXInPC5cYC+BOqGCngHultw59G4ybQ9lm97d9V6UgHwnT
         Gi+WUlqoVNthsCrqNeRdK5twrpIGXeqkG28cWmJ/sF8Uv9Yi06egHY7gb/9OW2yVQSSk
         HMwgZv3jAkdC+CJ0Bzk/s+64NH2Y3S1A/RFMS9dpd/nbfUiURbMd0x92coP518amGnTk
         rF36OzWxlB0VTvoPIYkeZXlDa/9DSvoH7iB4k8NABkvEGoo68mJHIuO0Tcto+y2gvc0d
         JNfw==
X-Forwarded-Encrypted: i=1; AJvYcCUNUnb1dhnNg3HyFGusMHzviBK1C+LFQRL/vScF/NzmskNuHSRK8nVlmnP3QpF9BMIbuSbog9LQu7rJZ1F8K3NBD1Y0LLAqOLi3AnMrFPk=
X-Gm-Message-State: AOJu0YwUgSvkJhv2Ea8yoRwU8RiZdgQigARh5G8u7nCGfC6KkGAjm/DA
	cj9RbPrgPPl8htPiCblEBC2brFhKrbG7CN7mIlOMjQXafpSmZ5J6LVPfGeZ0gG0=
X-Google-Smtp-Source: AGHT+IHUtlStKODWpcEjeDtszNsdsvuuyCQWBfbTvlzrc3C0d/xTzmhr7WsmuoBgbUZ7T4eoySHhCA==
X-Received: by 2002:a2e:b1d1:0:b0:2d8:1276:33bb with SMTP id e17-20020a2eb1d1000000b002d8127633bbmr3824003lja.18.1712153282610;
        Wed, 03 Apr 2024 07:08:02 -0700 (PDT)
Message-ID: <c28a3b6d-cfef-4b4e-9ddf-641142f2ea9c@citrix.com>
Date: Wed, 3 Apr 2024 15:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
 <f3ef0c54-e3e0-416c-953d-00c4df0c5d82@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f3ef0c54-e3e0-416c-953d-00c4df0c5d82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2024 3:26 pm, Jan Beulich wrote:
> On 27.03.2024 13:33, Andrew Cooper wrote:
>> 1) livepatching of .rodata:
>>
>> 989556c6f8ca - xen/virtual-region: Rename the start/end fields
>> ef969144a425 - xen/virtual-region: Include rodata pointers
>> b083b1c393dc - x86/livepatch: Relax permissions on rodata too
>>
>> And technically "x86/mm: fix detection of last L1 entry in
>> modify_xen_mappings_lite()" too but you've already backported this one.
>>
>> Patching .rodata worked before Xen 4.17, and was broken (left as a TODO)
>> when I adjusted Xen to stop using CR0.WP=0 for patching.
>>
>>
>> 2) Policy fixes:
>>
>> e2d8a6522516 - x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
>> policies
>>
>> This is a real bugfix for a real regression we found updating from Xen
>> 4.13 -> 4.17.  It has a dependency on
>>
>> 5420aa165dfa - x86/cpu-policy: Hide x2APIC from PV guests
>>
>> which I know you had more concern with.  FWIW, I'm certain its a good
>> fix, and should be backported.
>>
>>
>> 3) Test fixes:
>>
>> 0263dc9069dd - tests/resource: Fix HVM guest in !SHADOW builds
>>
>> It's minor, but does make a difference for those of us who run these
>> tests regularly.
>>
>>
>> 4) Watchdog fixes:
>>
>> 9e18f339830c - x86/boot: Improve the boot watchdog determination of
>> stuck cpus
>> 131892e0dcc1 - x86/boot: Support the watchdog on newer AMD systems
>>
>> You took "x86/boot: Fix setup_apic_nmi_watchdog() to fail more cleanly"
>> and the first of the two patches is in the same category IMO.  The
>> second I also feel ok to take for the in-support releases, particularly
>> as all it is doing is dropping a family list.
> I've pushed all of the above.

Thanks.

>
>> 5) Ucode scan stability  (For 4.18 only)
>>
>> Xen 4.18 had "x86/ucode: Refresh raw CPU policy after microcode load" in
>> it's .0 release, so should also gain:
>>
>> cf7fe8b72dea - x86/ucode: Fix stability of the raw CPU Policy rescan
> This already is in 4.18.1, ...
>
>> I've only noticed because I've got them both backported to 4.17 in
>> XenServer, but I don't think upstream wants to take that route.
> ... while, as you suggest, not (and not intended to be) in 4.17.

Oh, so it is.  Although comparing my backport to what you put into 4.18,
you also want

930605f155cc - x86/ucode: Remove accidentally introduced tabs

which I apparently folded into my 4.17 backport.  I have a feeling I
noticed at the point of doing the backport.

~Andrew

