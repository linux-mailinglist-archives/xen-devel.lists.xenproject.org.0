Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489E819104
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657142.1025884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg2i-0000Qj-3Y; Tue, 19 Dec 2023 19:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657142.1025884; Tue, 19 Dec 2023 19:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg2i-0000OK-0F; Tue, 19 Dec 2023 19:46:16 +0000
Received: by outflank-mailman (input) for mailman id 657142;
 Tue, 19 Dec 2023 19:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rImv=H6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFg2g-0000Nc-Fb
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:46:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d69984-9ea7-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 20:46:13 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so51306085e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 11:46:13 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q15-20020a05600c46cf00b0040b349c91acsm4271606wmo.16.2023.12.19.11.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 11:46:12 -0800 (PST)
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
X-Inumbo-ID: 43d69984-9ea7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703015172; x=1703619972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jcd2XJQM+ZtYKETBRoesO0wZeFNPdSWt2MRxloxb6pQ=;
        b=kOEixsj5dJNOHJEBJn5krnxYFEpRWXmq8qWIZX3/sxmk9qv/aO9ZkcVf3iLp1F0rNe
         vHg2NnUXVOuH2MpDVKb1XuLHB5KPAESLFlQ5o0hzJFZgfehY8ttUrN5wmjaawl1bdlaV
         G3rnHQ2BtUrRDyfbVALZnIDPFIBWkU3+sh6aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703015172; x=1703619972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcd2XJQM+ZtYKETBRoesO0wZeFNPdSWt2MRxloxb6pQ=;
        b=mIg5/fHrxDPWfUdyJTtOfhEkcw6D3qd3zMpfEc18cJyTh7LHSkSlzsKKkt6TkxgLov
         usYQqvuN6VVlMDaNSoeSvYvqFQbQVs3Ay5KlnUcn9HAFtnWFlku7L+ngzyBynWEWYHJ2
         aYxujYIaJg8FoDKd+jak5QM4EELIdKK4b4z10femY4bYOkcTkQzx9XpQ8ekDHK6suCki
         nTsaQuPfoM4sQLSK+jbuUHiYpKIt7+C9J5jM/eMNR3qzs16+YyZ4dbHO3/F9hQV4bNED
         y7HUlsK7NsKgJcdWtJT5+lmNukK+cPGsekezJAvH95UDWMXUgilhPnmjkYec/Bm7wXto
         1Nyw==
X-Gm-Message-State: AOJu0YwrwbYJys9VGXFH+f1ZNT6H2KLAchpoDpdMAGhJs1Xt8YEFHlLT
	3lgVcxflpUoYocBwLQizTqRoUw==
X-Google-Smtp-Source: AGHT+IGfOdL4znXMeH/n5fAvWHzRyW79vW1tpBHrkleTn8GvIiioaGPmDWEpQc1n7zWAzEUicN7JGw==
X-Received: by 2002:a05:600c:2207:b0:40c:35cb:f9b6 with SMTP id z7-20020a05600c220700b0040c35cbf9b6mr4917470wml.131.1703015172603;
        Tue, 19 Dec 2023 11:46:12 -0800 (PST)
Message-ID: <bc08ed7e-766d-4f0e-a7ef-994d09d1dbe2@citrix.com>
Date: Tue, 19 Dec 2023 19:46:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231215111842.8009-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> The minimal function size requirements for livepatch are either 5 bytes (for

"for an x86 livepatch", seeing as we're touching multiple architectures
worth of files.

I know it's at the end of the sentence, but it wants to be earlier to be
clearer.

> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
> that distance between functions entry points is always at least of the minimal
> required size for livepatch instruction replacement to be successful.
>
> Add an additional align directive to the linker script, in order to ensure that
> the next section placed after the .text.* (per-function sections) is also
> aligned to the required boundary, so that the distance of the last function
> entry point with the next symbol is also of minimal size.
>
> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value, so this change just make sure that
> the minimum required for livepatch to work is present.  Different compilers
> handle the option differently, as clang will ignore -falign-functions value
> if it's smaller than the one that would be set by the optimization level, while
> gcc seems to always honor the function alignment passed in -falign-functions.
> In order to cope with this behavior and avoid that setting -falign-functions
> results in an alignment inferior to what the optimization level would have
> selected force x86 release builds to use a function alignment of 16 bytes.

Yuck :(

The same will be true for all other architectures too?

What happens on ARM, which also picks up an explicit choice in livepatch
builds?

>
> The compiler option -falign-functions is not available on at least clang 3.8,
> so introduce a Kconfig check for it and make the livepatch option depend on the
> compiler supporting the option.
>
> The naming of the option(s) CONFIG_FUNCTION_ALIGNMENT is explicitly not
> mentioning CC in preparation for the option also being used by assembly code.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v3:
>  - Test for compiler option with -falign-functions.
>  - Make FUNCTION_ALIGNMENT depend on CC_HAS_FUNCTION_ALIGNMENT.
>  - Set 16byte function alignment for x86 release builds.
>
> Changes since v2:
>  - Add Arm side.
>  - Align end of section in the linker script to ensure enough padding for the
>    last function.
>  - Expand commit message and subject.
>  - Rework Kconfig options.
>  - Check that the compiler supports the option.
>
> Changes since v1:
>  - New in this version.
> ---
>  xen/Kconfig              | 19 +++++++++++++++++++
>  xen/Makefile             |  3 +++
>  xen/arch/arm/livepatch.c |  2 ++
>  xen/arch/arm/xen.lds.S   |  4 ++++
>  xen/arch/x86/Kconfig     |  1 +
>  xen/arch/x86/livepatch.c |  4 ++++
>  xen/arch/x86/xen.lds.S   |  4 ++++
>  xen/common/Kconfig       |  5 ++++-
>  8 files changed, 41 insertions(+), 1 deletion(-)

xen$ git ls-files | grep xen.lds.S
arch/arm/xen.lds.S
arch/ppc/xen.lds.S
arch/riscv/xen.lds.S
arch/x86/xen.lds.S

RISC-V and PPC have the same pattern that you're patching for x86 and ARM.


> diff --git a/xen/Kconfig b/xen/Kconfig
> index 134e6e68ad84..c2cc3fe165eb 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -37,6 +37,25 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
>  config CC_SPLIT_SECTIONS
>  	bool
>  
> +# Set function alignment.
> +#
> +# Allow setting on a boolean basis, and then convert such selection to an
> +# integer for the build system and code to consume more easily.

# Clang >= 6.0

> +config CC_HAS_FUNCTION_ALIGNMENT
> +	def_bool $(cc-option,-falign-functions)
> +config FUNCTION_ALIGNMENT_4B
> +	bool
> +config FUNCTION_ALIGNMENT_8B
> +	bool
> +config FUNCTION_ALIGNMENT_16B
> +	bool
> +config FUNCTION_ALIGNMENT
> +	int
> +	depends on CC_HAS_FUNCTION_ALIGNMENT
> +	default 16 if FUNCTION_ALIGNMENT_16B
> +	default  8 if  FUNCTION_ALIGNMENT_8B
> +	default  4 if  FUNCTION_ALIGNMENT_4B

What value do we get here for RISCV/PPC?  Do we need another override
for them?

~Andrew

