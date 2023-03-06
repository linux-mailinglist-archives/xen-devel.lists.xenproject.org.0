Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9436AC41D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 15:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506990.780227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZCG3-0007rq-3k; Mon, 06 Mar 2023 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506990.780227; Mon, 06 Mar 2023 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZCG3-0007q8-0z; Mon, 06 Mar 2023 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 506990;
 Mon, 06 Mar 2023 14:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XRxq=66=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pZCG2-0007q2-4t
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 14:56:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0707cacf-bc2f-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 15:56:08 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id c18so5839928wmr.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 06:56:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfd4d1000000b002c6d0462163sm10121537wrk.100.2023.03.06.06.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:56:07 -0800 (PST)
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
X-Inumbo-ID: 0707cacf-bc2f-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSNlvtsNsid6WJj6EyGrAe6WXlCiD/g/Bz4qeivUmY0=;
        b=Oqt2bb8ePN1P2UfEps2tUjKOfsG9rH27VORr8popXmXXRgGHVPyBtt8DnmmiwrLf45
         eQk9WIsrg/C/vofTE5oPgmUVBiGwxQXMW8EvZK1UZP2JhJBQIXx9UAlGAIudq+v4IL7D
         W53M1f7Ers2pi/HtcHdWfZObZH5SxaB2t6UcgXPWpuWxJMStEsqQxkXt34BXYQZXXfsl
         DjuA+SFDKMeeWYEZVJroEL+cMlPNwC20OYsrzF9qBr2oH6C9TW7Av0O92i8kqB6eVbeH
         HIpU/31mqlE476m7BH9B68Tvf3cDyjCQdBWDNXZinEUXKPWeRBqFoYoc/cn2He3TeKHY
         p5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSNlvtsNsid6WJj6EyGrAe6WXlCiD/g/Bz4qeivUmY0=;
        b=wJRCVgWMsIbeeFJ2VdbJPaGywBUQr9sWrlwcBTr3ZJoNfskIwb8+erov9jMhnQCz87
         ZVI4BGlWwTTk3PHTd4HMY5mLpf5IXdRiOjZRhcTVE433vVlXow2zt8q1Lru29nwpoIJl
         HZMEve5nbLgKO2vvCcGQ5WFKYuT0MxyZ5byZ5jF8FMvGbYT9zgUzMy6hnVkXFtOFtk3f
         6ztae55JoQ9lZTJjKueirv98q1+Ys8lY8gnBmiN1Gw9X8pksNc9t09QonwERCSk0zcYK
         FnreEcBhIntORxy+iM4JNPOXIGI3T5CYKSVHPxdomjvRrg9QTuTPT6wC2tJeCzFVVV5h
         JRvg==
X-Gm-Message-State: AO0yUKVqLkZ7cW0kOevzM9BF+V94A31DJkbKB2IfGMy5YUpKvY+gL8RM
	QLKOPZx3H3Q/o3iXLd6urO5Qbw==
X-Google-Smtp-Source: AK7set/s8L1UGgm9AiWwMENrcTLfGMTYfkneJNyQl1C+0XtXj8LbERh8o6P6UbeKmtlIgI33BKq6+w==
X-Received: by 2002:a05:600c:4e90:b0:3da:fc30:bfc5 with SMTP id f16-20020a05600c4e9000b003dafc30bfc5mr9417698wmq.13.1678114568128;
        Mon, 06 Mar 2023 06:56:08 -0800 (PST)
Message-ID: <5470384c-d720-26fc-3b3f-78e32e804b4d@linaro.org>
Date: Mon, 6 Mar 2023 15:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZAXzUIs6wODe7/hf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/23 15:06, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
>> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>>>> [...] If a 32-bit CPU guest
>>>> +environment should be enforced, you can switch off the "long mode" CPU
>>>> +flag, e.g. with ``-cpu max,lm=off``.
>>>
>>> I had the idea to check this today and this is not quite sufficient,
>> [...]
>>> A further difference is that qemy-system-i686 does not appear to enable
>>> the 'syscall' flag, but I've not figured out where that difference is
>>> coming from in the code.
>>
>> I think I just spotted this by accident in target/i386/cpu.c
>> around line 637:
>>
>> #ifdef TARGET_X86_64
>> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
>> #else
>> #define TCG_EXT2_X86_64_FEATURES 0
>> #endif
> 
> Hmm, so right now the difference between qemu-system-i386 and
> qemu-system-x86_64 is based on compile time conditionals. So we
> have the burden of building everything twice and also a burden
> of testing everything twice.
> 
> If we eliminate qemu-system-i386 we get rid of our own burden,
> but users/mgmt apps need to adapt to force qemu-system-x86_64
> to present a 32-bit system.
> 
> What about if we had qemu-system-i386 be a hardlink to
> qemu-system-x86_64, and then changed behaviour based off the
> executed binary name ?
> 
> ie if running qemu-system-i386, we could present a 32-bit CPU by
> default. We eliminate all of our double compilation burden still.
> We still have extra testing burden, but it is in a fairly narrow
> area, so does not imply x2 the testing burden just $small-percentage
> extra testing ?  That would means apps/users would not need to change
> at all, but we still get most of the win we're after on the
> QEMU side
> 
> Essentially #ifdef TARGET_X86_64  would be change  'if (is_64bit) {...}'
> in a handful of places, with 'bool is_64bit' initialized in main() from
> argv[0] ?

That is what Alex suggested me to do with ARM binaries as a prototype
of unifying 32/64-bit binaries, avoiding to break users scripts.

