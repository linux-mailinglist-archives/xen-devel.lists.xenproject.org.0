Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872B8A735E1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929632.1332349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpPu-0007Pm-1Q; Thu, 27 Mar 2025 15:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929632.1332349; Thu, 27 Mar 2025 15:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpPt-0007NO-Tl; Thu, 27 Mar 2025 15:45:13 +0000
Received: by outflank-mailman (input) for mailman id 929632;
 Thu, 27 Mar 2025 15:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txpPs-0007NH-IZ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:45:12 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d14825-0b22-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 16:45:11 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso648001f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 08:45:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efc9bsm19961562f8f.87.2025.03.27.08.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:45:10 -0700 (PDT)
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
X-Inumbo-ID: 77d14825-0b22-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743090311; x=1743695111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LcwsuFECCiR1bLFBc3GYpdpODOCrSr1XFj7eeQYu3WY=;
        b=lBaETvPICvGFxk1bLQ+qsOABtxeiPtAnf7IgPGaYrHfQgUVkUlkulVXdG7C4gq2EWE
         BpRrDjhTvY0EZCpmQViU0kgJvN3SuEK1RPPiVGgCh0AYJdaSdzMVxkK+/Aze2V8DFBzZ
         hOAdX/BAAp9XpwdH8it7c5yFf8ngcOY1z06UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090311; x=1743695111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcwsuFECCiR1bLFBc3GYpdpODOCrSr1XFj7eeQYu3WY=;
        b=UNpPKEurXMkoWYdqsNEXF8E+0fiP9/yyL4+W4JXg+ksTIfwN/xyWXO8aytuSq93ncl
         RvQCv4SPKqNt5mXOj3971Yy8sunB3QYZz3fI8Q3dmLGi4BMzJ9gv50SxIjq1j43SzHA1
         4EXaS9w9kfhbu8v8x5vv6+nxWo9BWL0m3T6YexyOXQ73Jc23fnex1jwpguYpQBm4xbaI
         hPZBBTj0lr5OoFU4SxsbQLFZLv4R8rrUQoML5hbvbGGju5wt4uk1xzOmkUKmiUl0DPgI
         wxwuMkS0ijgpeqWli/Bgr3QwIzc7YvKoVx/uCLBX+6tdOVnJIzYQurXOG0DP4PE0mpcB
         SDDA==
X-Forwarded-Encrypted: i=1; AJvYcCUSRpvS46/OO90HaXEuWTAH1d9syXPwkMi6qa9VHl2gUU1otJlZ+X5cPO9F7Cn1npA5OFnqojqFH6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrfrfPE43usIrTAwkZO33nbLJx66rTOAGfGG6/vJdAimyhaH3z
	GV5KsUe3nsfcz0Gs9UplLC5I1WIDZ+vR6TAUkpWpZXcUxOHxLnvCHGXvVpn58Uc=
X-Gm-Gg: ASbGncv1IBahHS3YbvPAKjhGmyohLsVhM7BZVmxHqQHGFXTd08gdqbM/ctQF8xTXJGM
	opxt2KNPRFVqvvUPEG+GtDwCwMzBHU8f3ViUK0zY7+Cpi7lKJ+uYyvXcKd1ExKSU0kAykzDyD9H
	WgAUjq/6jHrWg1yLMC4mF65cIufCVJ0/12jALlKKzxyfBP7T1dA67emTmqDeampucpCJZC0pOSb
	kodj4fBJr/OX5ngjq+ExnZK5l4+eTWFhKOjo80Vd18NRDZQePHXcPSfZRqUq9NhrHJiE836Xlur
	0+WcrixHCrg5fZwdnRbu2k7TjN/19N4nBqU/xFwg7PST0MXhq3e3fj03cDYcoSbcjwstRAv+sXp
	B1DMSrzKzpw==
X-Google-Smtp-Source: AGHT+IH+m6uY9Abhn1d6zJeat9mvK+qE5lHl6kZTZpGZ7SdLtCLYarbityZTi0ld+YDzSoItFERESQ==
X-Received: by 2002:a05:6000:2189:b0:39a:ca40:7bfb with SMTP id ffacd0b85a97d-39ad1788370mr2598473f8f.54.1743090310966;
        Thu, 27 Mar 2025 08:45:10 -0700 (PDT)
Message-ID: <956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com>
Date: Thu, 27 Mar 2025 15:45:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
 <20250320155908.43885-4-andrew.cooper3@citrix.com>
 <c901f573-97dc-4ad0-9974-847fc58a0d44@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c901f573-97dc-4ad0-9974-847fc58a0d44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/03/2025 4:24 pm, Oleksii Kurochko wrote:
>
>
> On 3/20/25 4:59 PM, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  CHANGELOG.md | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 9a5919585d43..4e333e608a96 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>  ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>  
>>  ### Changed
>> + - The minimum toolchain requirements have been increased to either:
>> +   - GCC 5.1 and Binutils 2.25, or
>> +   - Clang/LLVM 11
> I think we want here to specify for which architectures it was done as RISC-V, for example, uses
> different versions:
>  - GCC 12.2 or later
>  - GNU Binutils 2.39 or later
> And for clang the version will be 17 as:
>   f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
>   $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
>     llvmorg-17.0.0
>   ...
> I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
> really sure that if we need (or why we need) clang support just from the start.

The same reason why we got an almost-nothing build in CI first, and are
currently looking for a "hello world" message on boot.

Keeping it working as you go is much easier than retrofitting at a later
point, and supporting more than 1 of any $THING (not just compilers) is
good to prevent accidental reliance on an implementation specific property.

The only question is what version of Clang exists in Debian bookworm, as
that affects how easy/hard it is to add to CI.

According to https://packages.debian.org/search?keywords=clang, bookworm
has Clang 14, while trixie has Clang 19.

So, how hard a limit is Clang-17?  Is Clang-14 doable or not?

Alternatively, we could start adding some trixie containers.  We have
passed the toolchain freeze (was 15th March), so the build container
should be stable now, even if it isn't quite released yet.

~Andrew

