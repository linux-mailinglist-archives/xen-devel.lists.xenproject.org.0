Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B00819185
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 21:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657207.1025934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgkY-00079n-Cg; Tue, 19 Dec 2023 20:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657207.1025934; Tue, 19 Dec 2023 20:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgkY-000778-9G; Tue, 19 Dec 2023 20:31:34 +0000
Received: by outflank-mailman (input) for mailman id 657207;
 Tue, 19 Dec 2023 20:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rImv=H6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFgkW-000770-5p
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 20:31:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97da72d3-9ead-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 21:31:31 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c580ba223so62595585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 12:31:31 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3955116wmq.48.2023.12.19.12.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 12:31:30 -0800 (PST)
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
X-Inumbo-ID: 97da72d3-9ead-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703017890; x=1703622690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7H1biO2frl0j4xW5wz01J98LEq7QGR0cPkaPVr0Zeg=;
        b=FQW6eSiAAmxSp8BlvtmnRXAOzxoDYHaj+g/ZecpuHWtpNAh4Yq0G2xowRhmEXL3rpb
         gbju6yoJW2Ipa8V5P8JqxXELfYVF3KaFvBVIoB+/UZRvVkvmKj7OQMnn9N7JEJC9fhJy
         uSCIRiMbPaa6KqcnPo1C948Yvf4D+nZWo+GBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703017890; x=1703622690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7H1biO2frl0j4xW5wz01J98LEq7QGR0cPkaPVr0Zeg=;
        b=gK6o7t/JNZkT85Me7yNv5OqHUnN2q5ubhwzBKBdt7q2Hm8LVwFDCKKsMZWr+Otta/e
         FIhfh27ermzJ1kQ47JNnYoAP0bKncoQ7Ot7m4iGjQlaoPu01a0dk0Ap9pXRrDyEHQkhP
         bQYpsDRGgMvNnV5k9XkACEVfGUyTcBUwlLwYzikJYyFPKhp/S95IERe0Tgbt1KdohVrG
         2MWv9Uy+pe4ATHaccmGWEbuBVVjEbYeADjLTXPSfPPq3/3NFORcsxliRekU9DxBIjgZK
         sWmV87pM4HxjAeXxinS0kGNZ+tbetvyRWXtpz/bcTsZ1LOpbJm+gOsY63xkv4cyWtQZp
         UsDg==
X-Gm-Message-State: AOJu0YzCwr7CdL4yKDjHePiHUUx5bpxOut09uUxRLTI58yPcf2QEK9fA
	f79rbigZfVAGMCbqDVYXEx484w==
X-Google-Smtp-Source: AGHT+IHCa/GuS4fsgPV3f1p2shLupt4oPuP8hQDzfm5l6p4CRjfEu4A7QDzh2/lvHH2W8oYAEBkpvA==
X-Received: by 2002:a05:600c:4981:b0:40c:3d91:152 with SMTP id h1-20020a05600c498100b0040c3d910152mr10162723wmp.79.1703017890394;
        Tue, 19 Dec 2023 12:31:30 -0800 (PST)
Message-ID: <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
Date: Tue, 19 Dec 2023 20:31:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231215111842.8009-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> Introduce a helper to perform checks related to self modifying code, and start
> by creating a simple test to check that alternatives have been applied.
>
> Such test is hooked into the boot process and called just after alternatives
> have been applied.  In case of failure a message is printed, and the hypervisor
> is tainted as not having passed the tests, this does require introducing a new
> taint bit (printed as 'T').

We've got stub_selftest() in extable.c which currently does an ah-hoc
form of this taint via warning_add().

Nothing else comes to mind, but I would suggest breaking out the new
taint into an earlier patch, as this one is complicated enough anyway.

> diff --git a/xen/arch/x86/include/asm/test.h b/xen/arch/x86/include/asm/test.h
> new file mode 100644
> index 000000000000..e96e709c6a52
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/test.h
> @@ -0,0 +1,30 @@
> +#ifndef _ASM_X86_TEST_H_
> +#define _ASM_X86_TEST_H_
> +
> +#include <xen/types.h>
> +
> +int test_smoc(uint32_t selection, uint32_t *results);
> +
> +static inline void execute_selftests(void)

IMO run_selftests() would be better, but this is already not all of our
selftests, and this particular function really doesn't warrant being
static inline.

But I'm also not sure what this is liable to contain other than
test_smoc() so I'm not sure why we want it.

> diff --git a/xen/arch/x86/test/smoc.c b/xen/arch/x86/test/smoc.c
> new file mode 100644
> index 000000000000..09db5cee9ae2
> --- /dev/null
> +++ b/xen/arch/x86/test/smoc.c
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/errno.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cpufeature.h>
> +#include <asm/test.h>
> +
> +static bool cf_check test_insn_replacement(void)
> +{
> +#define EXPECTED_VALUE 2
> +    unsigned int r = ~EXPECTED_VALUE;
> +
> +    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
> +                   "+r" (r), "i" (EXPECTED_VALUE));
> +
> +    return r == EXPECTED_VALUE;
> +#undef EXPECTED_VALUE
> +}
> +
> +int test_smoc(uint32_t selection, uint32_t *results)
> +{
> +    struct {
> +        unsigned int mask;
> +        bool (*test)(void);
> +        const char *name;
> +    } static const tests[] = {
> +        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
> +          "alternative instruction replacement" },
> +    };

Ah.  I realise I said "like XTF", but I meant "checking one thing at a
time".

While this pattern for tests[] is very convenient in XTF, it has one
major downside in Xen, and that's the proliferation of ENDBR's in the
running binary.

Also (see below), returning bool isn't ok.  In the case of a failure, we
need:

printk(XENLOG_ERR "%s() Failure: Expected $FOO, got $BAR\n");

because that's what a human needs to know in order to fix the issue, not
a generic "something failed".

> +    unsigned int i;
> +
> +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
> +        return -EINVAL;

I'm not sure this is sensible.  It's a testing hypercall, so why
shouldn't I be able to pass ~0 to mean "test everything the hypervisor
knows about" ?

> +
> +    if ( results )
> +        *results = 0;
> +
> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> +    {
> +        if ( !(selection & tests[i].mask) )
> +            continue;
> +
> +        if ( tests[i].test() )
> +        {
> +            if ( results )
> +                *results |= tests[i].mask;

How is results supposed to be used?

XEN_SYSCTL_TEST_SMOC_INSN_REPL covers about 15 things we want to test,
making this output mask useless.


The selftests, like the exception fixup ones, are supposed to be
guarantee pass.  Failure is an exceptional case, and is only expected to
be found with new compilers and new SMC development.

I can kind of see how an input mask might be useful, although I wouldn't
have had one myself.  With correct diagnostics, running the hypercall
multiple times isn't useful to debugging, and without correct
diagnostics, the feedback provided by this is useless.

So honestly, I think this "results" output is overengineered and doesn't
help the cases where it is actually going to matter.


Remember most of all that self-modifying code which are going to cause
failures here have a high chance of crashing Xen outright.  And we're
deliberately trying to make this happen in CI and before a breaking
change gets out into releases.

> +            continue;
> +        }
> +
> +        if ( system_state < SYS_STATE_active )
> +            printk(XENLOG_ERR "%s test failed\n", tests[i].name);

This is a test hypercall, for the purpose of running testing, in
combination with test livepatches.  Eliding the diagnostics isn't ok.

Logspam concerns aren't an issue.  If the user runs `while :; do
xen-test-smc; done` in dom0 then they get to have a full dmesg ring.

Don't let that get in the way of having a sensible time figuring out
what went wrong.

~Andrew

