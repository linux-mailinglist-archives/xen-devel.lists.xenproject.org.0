Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B1AB0F94
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980032.1366521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKMi-00024H-Eu; Fri, 09 May 2025 09:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980032.1366521; Fri, 09 May 2025 09:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKMi-00022p-C4; Fri, 09 May 2025 09:50:00 +0000
Received: by outflank-mailman (input) for mailman id 980032;
 Fri, 09 May 2025 09:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDKMg-00022c-I8
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:49:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7a232a2-2cba-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:49:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so17242685e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 02:49:57 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2ffsm2728434f8f.66.2025.05.09.02.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 02:49:56 -0700 (PDT)
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
X-Inumbo-ID: f7a232a2-2cba-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746784197; x=1747388997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzvbxjWCS0bq4DYfefGSPkiapTF0LxCWSipqGE8AtWQ=;
        b=qjnLB6Zn21jBS3qBM/ig6FwUhm5Q0Gmc/UidRGNUqDm5BNbc3ZFFgC0n4aN4Eg5Low
         VkTSgU2ZqgbmIEXIfLaMlgWWeKZ3OcZvF5+UBiLW1xBXZmO+/6VpvqF6OzcYmiOumg4t
         NdZlNeT4qARtJk/fovHik/5RqwMyFioiH8TlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784197; x=1747388997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzvbxjWCS0bq4DYfefGSPkiapTF0LxCWSipqGE8AtWQ=;
        b=oO72qBmyPv0hyO0seN08e4oUrzArHkrffLPXBvW+day5xCOBIWgyrihMNOAAbCt4FN
         1Ge98MvF9DPw+ATYIRcPfDklwM0WGCkw/2/eoyu0HYmru9JGG62gKaWlqkxkl4rHT90M
         kBmVMIH+A8yFRHrTWH2qRYB9kbO07kVPNAzVGs9gHGvbO0uHbKp5MMXjRTepUtllOm8H
         6tmcu7825hswmtGtOiykC7JDy0Fxa2ywIfiS+lcBv0mdRsJ0jS6L0IQWswbjgaC8cML0
         kkdWGTyUXtPcoF/lkCmKBgRvoc+uJCd3QrSdqSs0nPj858uKlYrB4zj4bjASS95iTQOI
         UtZQ==
X-Gm-Message-State: AOJu0YxOoy1Da1Y0IOUENovE3B3Z+ypwAofL3UQ+LcIzcM+WHhrf26wZ
	gWhoIRfIqpsvc1Mz7WQtYK+wtY6r79WSUPDRbsiLS/983t8/xDZypySQ9FFnjpw=
X-Gm-Gg: ASbGncv+cLfeAqlSViGcQt9+fYy90N5UMA46dGSc0MjTgb9yPoOqBUBzH5HcyjqHU7D
	FVpjPC4TfpHks0mDiL40epoUxk8gRJ26wagmnE2/st039gPxa5KOeqQlILK3r57rJ+zxgQfTO5w
	+A5mQV9Gt00SXaq/vYNYdgfSnF8oo6d3iVJ9psT3mER8IrezvGAJp24T765TNV3mKJ0NxhbKrlr
	q9opyJd9tw7tXuUAOTK8GdvyoRobjk245d8a/3Iw19+Oi5MtvqfMajB5p3KElZoiHo7knbbKmTJ
	6KLCBICPDypWB4Nfky2+5NPKhNAFnVeCzK7AjfdbSKxt/FjOvAhmqrqto689VcJ8X5UvMV0xXFZ
	ZT0/+Fw==
X-Google-Smtp-Source: AGHT+IG0sjDYdeR4inxYK4Cfik9it5dKDO8mVFLsoI5VT0f4AoV7jCB79T+xZOuibhh4GiMW/KTprA==
X-Received: by 2002:a5d:64e2:0:b0:3a1:d06c:4e5c with SMTP id ffacd0b85a97d-3a1d06c4ee3mr3330521f8f.26.1746784197253;
        Fri, 09 May 2025 02:49:57 -0700 (PDT)
Message-ID: <91b5d36c-4eac-4167-a778-923dc39c02be@citrix.com>
Date: Fri, 9 May 2025 10:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
 <aB25cjNY2qh_im19@macbook.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aB25cjNY2qh_im19@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 9:14 am, Roger Pau Monné wrote:
> On Thu, May 08, 2025 at 05:03:36PM +0100, Andrew Cooper wrote:
>> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
>> by the time speculative vulnerabilities hit the headlines in 2018.  It is
>> specifically an out-of-line-ing mechansim, and repoline is one of several
>> safety sequences used.
>>
>> Some of this boilerplate has been copied into all other options, and isn't
>> interesting for the target audience given that they're all in a "Speculative
>> Hardning" menu.
>>
>> Reword it to be more concise.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> You are the expert on those things :).
>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
>> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
>> change.
> I don't have a strong opinion either way TBH.  Would you maybe like to
> rename the menu visible text to "Speculative Conditional Branch Hardening"?

Hmm yeah, that's better than nothing.

>
>> ---
>>  xen/common/Kconfig | 51 +++++++++-------------------------------------
>>  1 file changed, 10 insertions(+), 41 deletions(-)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 4bec78c6f267..03ef6d87abc0 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -162,29 +162,21 @@ config STATIC_MEMORY
>>  menu "Speculative hardening"
>>  
>>  config INDIRECT_THUNK
>> -	bool "Speculative Branch Target Injection Protection"
>> +	bool "Out-of-line Indirect Call/Jumps"
>>  	depends on CC_HAS_INDIRECT_THUNK
>>  	default y
>>  	help
>> -	  Contemporary processors may use speculative execution as a
>> -	  performance optimisation, but this can potentially be abused by an
>> -	  attacker to leak data via speculative sidechannels.
> It would be nice if this boilerplate text could be made the "help" of
> the top level menu entry, but that's not possible with Kconfig.

When speculation was entirely new, something needed to introduce it (not
that I think this was great to start with), but nowadays any all
developers/sysadmins/distro-packagers will be aware of it.

Or, if they're not aware, a paragraph like this isn't going to help them.

~Andrew

