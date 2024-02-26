Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37AC867CC5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685680.1066802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeEc-0007zw-1Q; Mon, 26 Feb 2024 16:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685680.1066802; Mon, 26 Feb 2024 16:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeEb-0007y1-Ur; Mon, 26 Feb 2024 16:53:45 +0000
Received: by outflank-mailman (input) for mailman id 685680;
 Mon, 26 Feb 2024 16:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reeEa-0007Oz-Nk
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:53:44 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d7b438-d4c7-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:53:44 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513031ce058so69840e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:53:44 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 eb20-20020ad44e54000000b0068f5781760bsm3134601qvb.51.2024.02.26.08.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:53:43 -0800 (PST)
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
X-Inumbo-ID: 99d7b438-d4c7-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708966423; x=1709571223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wg16Veg6CXyVGxxnjZbrEmDMVb7yNyPwrgdL/6tppWU=;
        b=Wn3areR2V8GFPboAugCbdF+ACiZ3Ja6poydwLIYgeEwrBcpoGmQmGPvUlmLJE3WhOq
         dBPrCOgLTInOlM7St/eSTXO1AQ6Y7suom1RTJyOjEnut/5WDOEwu3gCAvheQt+yRtJcf
         ruapDL/RQAJSKlmYulNLLuognpWH1iWtFSAlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966423; x=1709571223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg16Veg6CXyVGxxnjZbrEmDMVb7yNyPwrgdL/6tppWU=;
        b=PzzJvoNN1D4ZJh+UKny3JzAORcd1Hh3W6AyUhhnxyc7PcXFOHjjmk+BY2IV88K4AUk
         zI737b463BYaQZpbjQXFnoIXcYLjm3RZSFurlYLsX+6wQ81H+WVgSTeHO47GfwtznZfW
         8Qoajt6blBUdQbs5Erkio2WSfD1ImKh02p6GZz+aVSSZZwzJB1MFOwdQLSf9IHtM+gpS
         n0YYNuZZQMb6s0Sys2YNSFglMdmoGHGA0hTSd7gid0PXNsd4Oobb1o8Ehgh8ZGTH/K3E
         MW48EYN0lMouK1VLC1tNX2I1e99BZIXYmz/O/NXAfapIVVmOHyTKHdzuk+18GX/aXpJN
         gl4g==
X-Forwarded-Encrypted: i=1; AJvYcCUIG7HAO42K32QlqhUtAzwiQjIqVxU9iHuN/YEH7KvCtoVUEnvJcJb9os3orCEPmzQWc0PjdsxDzm/1G6IC750xp9AgoFxVarmABdPC2tA=
X-Gm-Message-State: AOJu0YyoW3r4WcmpjjzbESwymVnuRlh7YZ93xne+oQfLUqPl9UFBISEv
	6/QDy8yVPkJF51rpoRtadueqaUrrMoz85EXeLL0DksnxbXcpWGUn/8UHZ2NfwDE=
X-Google-Smtp-Source: AGHT+IEazuURzTOTntMTOvDTv1OdHch4KV+G3BWyg56BbzmPMeCXJIwimJWQUNWi5agHiRL6KERADQ==
X-Received: by 2002:a05:6512:3f04:b0:512:d5c7:60d9 with SMTP id y4-20020a0565123f0400b00512d5c760d9mr6305207lfa.3.1708966423547;
        Mon, 26 Feb 2024 08:53:43 -0800 (PST)
Message-ID: <05b0f7a2-14b1-4cf9-bc70-fa106723e632@citrix.com>
Date: Mon, 26 Feb 2024 16:53:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sphinx: Start an FAQ, and add Kconfig/CET details
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226162527.1247421-1-andrew.cooper3@citrix.com>
 <d026feda-1997-43fc-94e6-cb9da1ef807c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d026feda-1997-43fc-94e6-cb9da1ef807c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2024 4:52 pm, Jan Beulich wrote:
> On 26.02.2024 17:25, Andrew Cooper wrote:
>> This is long overdue, and we need to start somewhere.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> perhaps (nit) with ...
>
>> --- /dev/null
>> +++ b/docs/faq.rst
>> @@ -0,0 +1,71 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Frequently Asked Questions
>> +==========================
>> +
>> +How do I...
>> +-----------
>> +
>> +... check whether a Kconfig option is active?
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +  Kconfig is a build time configuration system, combining inherent knowledge,
>> +  the capabilities of the toolchain, and explicit user choice to form a
>> +  configuration of a build of Xen.
>> +
>> +  A file, by default ``.config``, is produced by the build identifying the
>> +  configuration used.  Kconfig symbols all start with ``CONFIG_``, and come in
>> +  a variety of types including strings, integers and booleans.  Booleans are
>> +  the most common, and when active are expressed with ``...=y``.  e.g.::
>> +
>> +    xen.git/xen$ grep CONFIG_FOO .config
>> +    CONFIG_FOO_BOOLEAN=y
>> +    CONFIG_FOO_STRING="lorem ipsum"
>> +    CONFIG_FOO_INTEGER=42
>> +
>> +  Symbols which are either absent, or expressed as ``... is not set`` are
>> +  disabled.  e.g.::
>> +
>> +    xen.git/xen$ grep CONFIG_BAR .config
>> +    # CONFIG_BAR is not set
>> +
>> +  Builds of Xen configured with ``CONFIG_HYPFS_CONFIG=y`` embed their own
>> +  ``.config`` at build time, and can provide it to the :term:`control domain`
>> +  upon requested.  e.g.::
>> +
>> +    [root@host ~]# xenhypfs cat /buildinfo/config | grep -e FOO -e BAR
>> +    CONFIG_FOO=y
>> +    # CONFIG_BAR is not set
>> +
>> +
>> +... tell if CET is active?
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +  Control-flow Enforcement Technology support was added to Xen 4.14.  It is
>> +  build time conditional, dependent on both having a new-enough toolchain and
>> +  an explicit Kconfig option, and also requires capable hardware.  See
>> +  :term:`CET`.
>> +
>> +  For CET-SS, Shadow Stacks, the minimum toolchain requirements are ``binutils
>> +  >= 2.29`` or ``LLVM >= 6``.  No specific compiler support is required.
>> +  Check for ``CONFIG_XEN_SHSTK`` being active.
>> +
>> +  For CET-IBT, Indirect Branch Tracking, the minimum toolchain requirements
>> +  are ``GCC >= 9`` and ``binutils >= 2.29``.  Xen relies on a compiler feature
>> +  which is specific to GCC at the time of writing.  Check for
>> +  ``CONFIG_XEN_IBT`` being active.
>> +
>> +  If a capable Xen with booted on capable hardware, and CET is not disabled by
> ... s/with/is/ (or "was").

Oops yes.  Will fix.

~Andrew

