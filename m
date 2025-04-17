Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D4A923E8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 19:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958327.1351213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Syg-0007sB-3A; Thu, 17 Apr 2025 17:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958327.1351213; Thu, 17 Apr 2025 17:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Syg-0007pK-0O; Thu, 17 Apr 2025 17:24:42 +0000
Received: by outflank-mailman (input) for mailman id 958327;
 Thu, 17 Apr 2025 17:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5Syd-0007pC-QF
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 17:24:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ee437b-1bb0-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 19:24:38 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so6321365e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 10:24:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44034fca7a3sm48138535e9.0.2025.04.17.10.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 10:24:36 -0700 (PDT)
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
X-Inumbo-ID: d6ee437b-1bb0-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744910678; x=1745515478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OskF0NLuu5E/fFaAhB3O2yvxN3Rgu9Rzf7aDlZvuk2Q=;
        b=F7v/iTATAYvDNafxH3VoGAIcVU1Oy1J3+3mv6+v815i16Fxqam4BIe5V+NohV51neI
         GQ8ajoPsyulqUbQRutmR4S+hklGym0u6ghkN7HitVuNfdWL5upwNS1/bX8KtkUUKHh4r
         sCxSOKpJspd26cJXKA0+P8efY3MiDtDMtUWKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910678; x=1745515478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OskF0NLuu5E/fFaAhB3O2yvxN3Rgu9Rzf7aDlZvuk2Q=;
        b=cgzUaOhPDjr8H7Ki9WfSLfPKHJVabRQv816AA5MILqWbMp3JVC2psltCByL0Lfzcrf
         KEjApVbJRcVZK1BLj7ZIjbF7uBN+MMMPlry6YafYteuBCNcWRmYkmtFw6D3UKlPhpI1o
         JXJr5Y1CF4LaZN1yUCXsYPVbBzdjnn/RHBo+1u9u7EiNjcxIb8qOv8TZ7B4QhBMeXrc1
         wWULdxoXJ+O5sqggsEkmqg1sVZc9NgwSLira3iR0sFMwQo0bx1FESyUfL93/cpzf6oKR
         z44uu6moRIpQj6lZIsbjk1mI+kloNHcRSqxDcM+UHZDf9RO+NdhkYcAXzG0rxjVAjvgB
         Rfrg==
X-Forwarded-Encrypted: i=1; AJvYcCX1R9uia7ql02M+uidbbXvw7k6qOtmKLTyRjhfEmpeoA4HS5gGLQlStH26Ng7nFIt44lSgLtjERkqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+JckXQl473C4tKiNvXPXM1V82crvaR0f8JITosuIL5EPUQg2u
	HRpWY814ccjnGSYkfOf4gzFEVjLLWRtdfcthd8iG1FleaOIjQmXQwRiKz7780wjCDIdwdqOh2hN
	IN+Y=
X-Gm-Gg: ASbGnctbTTNbygk8YhRn+mPLmBYgA2lKBSof1/EvHM5Obv/7zM65Abu6jTUzXhVNe1y
	t8BkmKPOme3wTfYqKRKg2WJ+/9LnJZoYOwDRgY7iD4nNinZAyBw4KAnvfRRyWgLlWOtBFaU/fK8
	6EHaGI7dr25adsqpQJ7UMGkwyT7E1xupFkfbUNkW585Itq1ZNgduDJCL0qADEBxXUAbqISBBDPn
	ctX5ZJg/wGjTnk7V4UTJGuPj8o3+X1wUADHbjyTpBN9jybmb7hb08CHkKawyURc4PNc4othDn+0
	en8yqL0xFAvxhYyWboOyJflB67hGFWAaFg7qAlfgIF4K1qaXoklQpYigC09kYWv4FbZa78H04yF
	q3xAT6w==
X-Google-Smtp-Source: AGHT+IHYW9p//UDkjRPzwl4OG0WLfz6rd86A02u74/VKnVmV9Y+hLQrJCJ0RiadC4tZILH7ztiMrSQ==
X-Received: by 2002:a05:6000:402b:b0:39c:12ce:1054 with SMTP id ffacd0b85a97d-39ee5b11245mr5634686f8f.8.1744910677896;
        Thu, 17 Apr 2025 10:24:37 -0700 (PDT)
Message-ID: <06c64f49-a70e-48c3-8480-f2ed9ac4a001@citrix.com>
Date: Thu, 17 Apr 2025 18:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/AMD: Convert rdmsr_amd_safe() to use asm goto()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250407153510.1863243-1-andrew.cooper3@citrix.com>
 <1df6b4c9-7309-49cd-8046-019d94139c57@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1df6b4c9-7309-49cd-8046-019d94139c57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 4:48 pm, Jan Beulich wrote:
> On 07.04.2025 17:35, Andrew Cooper wrote:
>> Unlike the WRMSR side, we can't use asm goto() unconditionally, because our
>> toolchain baseline doesn't support asm goto with outputs.
> Is there actually a benefit we gain from now needing to maintain two different
> pieces of logic fulfilling the same purpose?

IMO, yes.  Besides getting rid of .fixup/unlikely, the code generation
is better-enough to warrant it, including getting the common path
correct (the referenced labels are all considered cold).

e.g. for this change, we go from:

    xor    %esi,%esi
    rdmsr
    test   %esi,%esi
    jne    <init_amd+0x540>
    and    $0xfffffffe,%edx
    wrmsr

(note the forward branch) to simply:

    rdmsr
    and    $0xfffffffe,%edx
    wrmsr

because the exception table redirect is directly into init_amd.cold, and
we don't have to hold `int err` in a register across the asm() block.

This is an intentionally simple example to get the infrastructure in,
but vmread() will definitely benefit.

>
>> Also, there's a different errata workaround we'll need if we want to use asm
>> goto() with "+" constraints:
>>
>> config CC_HAS_ASM_GOTO_TIED_OUTPUT
>> 	depends on CC_HAS_ASM_GOTO_OUTPUT
>> 	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
>> 	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
>>
>> I'm tempted to put it in straight away, lest we forget about it.
> Perhaps best if we really want to go this route. Yet then - why "TIED"? Isn't
> "tied" the term they use when referring to an earlier operand by using a
> digit (or the operand's name in square brackets)?

This is straight from Linux.  I've not looked at the issue in detail.

>
>> --- a/xen/Kconfig
>> +++ b/xen/Kconfig
>> @@ -41,6 +41,20 @@ config CC_SPLIT_SECTIONS
>>  config CC_HAS_UBSAN
>>  	def_bool $(cc-option,-fsanitize=undefined)
>>  
>> +# Fixed in GCC 14, 13.3, 12.4 and 11.5
>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
>> +config GCC_ASM_GOTO_OUTPUT_BROKEN
>> +	bool
>> +	depends on CC_IS_GCC
>> +	default y if GCC_VERSION < 110500
>> +	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
>> +	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
> Unlike for pre-release versions (x.0.y) I view this as problematic. Distros
> are likely to have backported the fix before the minor releases took place.
> Or they may have backported without ever meaning to follow later minor
> releases. We'd needlessly exclude them here. Imo ...
>
>> +config CC_HAS_ASM_GOTO_OUTPUT
>> +	def_bool y
>> +	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
>> +	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
> ... the only option is to actually probe for support as well as the (non-)
> buggy-ness.

There is no sensible way to probe.  It compiles fine, but (AIUI) fails
to spill registers correctly on some paths, which also makes it very
sensitive to other optimisations.

~Andrew

