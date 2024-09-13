Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA297809A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 14:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798194.1208327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5rM-0004do-LY; Fri, 13 Sep 2024 12:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798194.1208327; Fri, 13 Sep 2024 12:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5rM-0004aB-ID; Fri, 13 Sep 2024 12:57:12 +0000
Received: by outflank-mailman (input) for mailman id 798194;
 Fri, 13 Sep 2024 12:57:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Mtl=QL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sp5rL-0004a5-Ll
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 12:57:11 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afed1136-71cf-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 14:57:09 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53659867cbdso1442897e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 05:57:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d55709sm870924366b.210.2024.09.13.05.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 05:57:01 -0700 (PDT)
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
X-Inumbo-ID: afed1136-71cf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726232229; x=1726837029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fSPlbdv6zGlnbn6pbZ5encizjTNyFtv3BhC+RgoGtLw=;
        b=HA5Ee9Lwq4VhJL7XNVxJtg2qvgs5WIJDmqc12X0aSSt2JKalVeylYecwWEgQLYW4Ag
         Hf2nettTJ28Rc+7Y1RahwEdUUs3aBcbWsGriXXqxpgddVYO+B7fHWGek2N/hzvZLsEja
         AAkCi1bpQJ9ct3QRbavGyDOwXBgYlHzfL0p1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726232229; x=1726837029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSPlbdv6zGlnbn6pbZ5encizjTNyFtv3BhC+RgoGtLw=;
        b=CqOcd+Vtc3sM57o+Z6Qy+KRuAlV0/nHAvErychVJh574dc+aRMk5ie9vEBsz/JFPrz
         3ek80PDxN9d0VHte92aRFE3PxTznLX6F++Y9augG9sxBGNfTe7vBOQqeGRdsdTwlLMk7
         rakMYo14JjAP8JHLUuW+emXoZW7Z7JjZMZrGtLSEA7UOVU68qXchHaxnrg0iJEus2So/
         TeXud5uQTzmLe6iZol15/XKgWvl0L3+zqGDxb7KleNLZV/Fkzgxy79n5a+Hxzi4YOz5f
         84SmpEkMzEY0fFAvcU2XvKW9UzZ4NCyeaZdaC5wrIUAUgbfFfCV46NWuUuSGTxb9Z5SK
         Ld9A==
X-Forwarded-Encrypted: i=1; AJvYcCXKxpGKJLiiVWLwu2sxZYJAYxYZb2OuQoqyGiJGI9iNkqEbDxG430z9QVQY55FmIcrP8fzkbj+D6eo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4CH4hfBCCe32Gm3aEpVZXBSBguWw9jyKKhx3O00/hGGJg7+yY
	42yfp/Cvqc1Ftb/s0XqNJW6C23cOnUg+ew5vDRICqw35NRgl6QujGUrgZqlkB2s=
X-Google-Smtp-Source: AGHT+IHQNlNStw4gkHlvzX370Uicwsk8HswpEL7PbtTX3MXk2PuoZ0P4Bdavk2+JyMkAgdP0D2pKyg==
X-Received: by 2002:a05:6512:e94:b0:531:8f2f:8ae7 with SMTP id 2adb3069b0e04-5367fee4540mr2496295e87.25.1726232222075;
        Fri, 13 Sep 2024 05:57:02 -0700 (PDT)
Message-ID: <7b9e7d1a-41be-4564-b115-59d482a7a916@citrix.com>
Date: Fri, 13 Sep 2024 13:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ucode: Fix buffer under-run when parsing AMD
 containers
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240913110907.1902340-1-andrew.cooper3@citrix.com>
 <db2d6779-2dbb-4e0b-94f5-c6843aa09b54@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <db2d6779-2dbb-4e0b-94f5-c6843aa09b54@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2024 1:45 pm, Jan Beulich wrote:
> On 13.09.2024 13:09, Andrew Cooper wrote:
>> From: Demi Marie Obenour <demi@invisiblethingslab.com>
>>
>> The AMD container format has no formal spec.  It is, at best, precision
>> guesswork based on AMD's prior contributions to open source projects.  The
>> Equivalence Table has both an explicit length, and an expectation of having a
>> NULL entry at the end.
>>
>> Xen was sanity checking the NULL entry, but without confirming that an entry
>> was present, resulting in a read off the front of the buffer.  With some
>> manual debugging/annotations this manifests as:
>>
>>   (XEN) *** Buf ffff83204c00b19c, eq ffff83204c00b194
>>   (XEN) *** eq: 0c 00 00 00 44 4d 41 00 00 00 00 00 00 00 00 00 aa aa aa aa
>>                             ^-Actual buffer-------------------^
>>   (XEN) *** installed_cpu: 000c
>>   (XEN) microcode: Bad equivalent cpu table
>>   (XEN) Parsing microcode blob error -22
>>
>> When loaded by hypercall, the 4 bytes interpreted as installed_cpu happen to
>> be the containing struct ucode_buf's len field, and luckily will be nonzero.
>>
>> When loaded at boot, it's possible for the access to #PF if the module happens
>> to have been placed on a 2M boundary by the bootloader.  Under Linux, it will
>> commonly be the end of the CPIO header.
>>
>> Drop the probe of the NULL entry; Nothing else cares.  A container without one
>> is well formed, insofar that we can still parse it correctly.  With this
>> dropped, the same container results in:
>>
>>   (XEN) microcode: couldn't find any matching ucode in the provided blob!
>>
>> Fixes: 4de936a38aa9 ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I wonder though about scan_equiv_cpu_table(): Should it perhaps complain
> if it doesn't find a null entry? And when it find ones, but that's not
> last?

I'm erring on the "be liberal on what you accept" side of things.

scan_equiv_cpu_table() is a relic of Fam10h systems (the last time that
two different CPU steppings shared a ucode blob), and recent changes to
Linux suggest that AMD have retired the concept.

The only thing we do in scan_equiv_cpu_table() is see if there's a
mapping for the current system, and we loop over all entries, even if
that happens to be 0.

~Andrew

