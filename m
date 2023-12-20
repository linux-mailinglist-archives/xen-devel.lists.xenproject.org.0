Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A9819B1D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657465.1026305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsZH-0006IA-GJ; Wed, 20 Dec 2023 09:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657465.1026305; Wed, 20 Dec 2023 09:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsZH-0006Fs-D2; Wed, 20 Dec 2023 09:08:43 +0000
Received: by outflank-mailman (input) for mailman id 657465;
 Wed, 20 Dec 2023 09:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFsZF-0006Fm-Vn
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:08:42 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d49ff13-9f17-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:08:39 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33664b6d6d5so2805112f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:08:39 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d42d2000000b0033678e0c99bsm1482496wrr.96.2023.12.20.01.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:08:38 -0800 (PST)
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
X-Inumbo-ID: 5d49ff13-9f17-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703063319; x=1703668119; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7SvkQI6kkO/NNrGzSJNZidwZDKmGcYc0nKLS+XLB6M=;
        b=oscQkP1N1+tFh62yGhB/litprriEzDW0/uUMbYEhvaPU6cLkbTnZ4wlS8JU1D9xcbk
         ifD7RGroabLk7I9slquMuUhh/K/9wc2NZwJKKrHGaruQb1r2m0aIr/z/Q0DEJL+dlxHs
         m21qTZtrcyLU26UyemFCcmzL+o+t3NPvERGGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063319; x=1703668119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7SvkQI6kkO/NNrGzSJNZidwZDKmGcYc0nKLS+XLB6M=;
        b=Ze2hlu92oJAhVkZ9e1C4lRQWufurPiwFFsq2qpDASm6oWpV4Bp38vtM4n7REPQbaqu
         aI+zav8/kiudUVxKUure/wjskzkkuDBxPaqcDpglRLs0xHPGebebaDXN5ON6OxzcMF5N
         9Woxi6RY8RuR+qUce184DEX4mlKB69KeJfDvJUJy3qpm2gkopaig9e6yeR6mqa/vxW6+
         bs7cTBlYXbjPHcYGdxUxZ/SatviFgPajns1cFw1+VHkEcDkf+nB97/A5G/8IRjOWWNzP
         ekgVtder6FKibSqej2V6RezPt1yBMneBC+vKo2vuTFGF59OrG2mm441Fg9HJjFvk2Cfb
         WQ0g==
X-Gm-Message-State: AOJu0YyQdZe9gSSMyRFq/KDboCcGmXbKnEWYfHSq4m96DYpIzwnHcWes
	09/AxhqeDgnaX0kiZornF11LuQ==
X-Google-Smtp-Source: AGHT+IEIYBNKpLR3cMAF9mAj5TkrrRbh64Na3ZoFGC9AXvo0D8/r9tgtQhczQ4tyIQWbIVwHviuKNQ==
X-Received: by 2002:adf:f68c:0:b0:336:64cd:3fc3 with SMTP id v12-20020adff68c000000b0033664cd3fc3mr2982679wrp.59.1703063318819;
        Wed, 20 Dec 2023 01:08:38 -0800 (PST)
Date: Wed, 20 Dec 2023 10:08:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Message-ID: <ZYKvFUICQ4pKwH0S@macbook>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>

On Tue, Dec 19, 2023 at 08:31:29PM +0000, Andrew Cooper wrote:
> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> > Introduce a helper to perform checks related to self modifying code, and start
> > by creating a simple test to check that alternatives have been applied.
> >
> > Such test is hooked into the boot process and called just after alternatives
> > have been applied.  In case of failure a message is printed, and the hypervisor
> > is tainted as not having passed the tests, this does require introducing a new
> > taint bit (printed as 'T').
> 
> We've got stub_selftest() in extable.c which currently does an ah-hoc
> form of this taint via warning_add().
> 
> Nothing else comes to mind, but I would suggest breaking out the new
> taint into an earlier patch, as this one is complicated enough anyway.

I see, so introduce the taint in a previous patch and use it in
stub_selftest() failure,

> > diff --git a/xen/arch/x86/include/asm/test.h b/xen/arch/x86/include/asm/test.h
> > new file mode 100644
> > index 000000000000..e96e709c6a52
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/test.h
> > @@ -0,0 +1,30 @@
> > +#ifndef _ASM_X86_TEST_H_
> > +#define _ASM_X86_TEST_H_
> > +
> > +#include <xen/types.h>
> > +
> > +int test_smoc(uint32_t selection, uint32_t *results);
> > +
> > +static inline void execute_selftests(void)
> 
> IMO run_selftests() would be better, but this is already not all of our
> selftests, and this particular function really doesn't warrant being
> static inline.
> 
> But I'm also not sure what this is liable to contain other than
> test_smoc() so I'm not sure why we want it.

This was requested by Jan, he was concerned that more of such tests
would appear.  It's new in v4 IIRC.

> > diff --git a/xen/arch/x86/test/smoc.c b/xen/arch/x86/test/smoc.c
> > new file mode 100644
> > index 000000000000..09db5cee9ae2
> > --- /dev/null
> > +++ b/xen/arch/x86/test/smoc.c
> > @@ -0,0 +1,66 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <xen/errno.h>
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cpufeature.h>
> > +#include <asm/test.h>
> > +
> > +static bool cf_check test_insn_replacement(void)
> > +{
> > +#define EXPECTED_VALUE 2
> > +    unsigned int r = ~EXPECTED_VALUE;
> > +
> > +    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
> > +                   "+r" (r), "i" (EXPECTED_VALUE));
> > +
> > +    return r == EXPECTED_VALUE;
> > +#undef EXPECTED_VALUE
> > +}
> > +
> > +int test_smoc(uint32_t selection, uint32_t *results)
> > +{
> > +    struct {
> > +        unsigned int mask;
> > +        bool (*test)(void);
> > +        const char *name;
> > +    } static const tests[] = {
> > +        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
> > +          "alternative instruction replacement" },
> > +    };
> 
> Ah.  I realise I said "like XTF", but I meant "checking one thing at a
> time".
> 
> While this pattern for tests[] is very convenient in XTF, it has one
> major downside in Xen, and that's the proliferation of ENDBR's in the
> running binary.

But for the livepatch case for example it's interesting to patch
functions that have the ENDBR prefix.

I do like having all the tests in an array, as then adding new ones is
trivial.

> Also (see below), returning bool isn't ok.  In the case of a failure, we
> need:
> 
> printk(XENLOG_ERR "%s() Failure: Expected $FOO, got $BAR\n");

There's already a message printed below, that's currently limited
to system_state < SYS_STATE_active, but I would be fine with printing
unconditionally that prints which test failed in a human readable
form:

printk(XENLOG_ERR "%s test failed\n", tests[i].name);

So that would print:

"alternative instruction replacement test failed"

on the Xen dmesg.

On one of the first versions test functions did return a value, but I
ended up switching to this boolean version because I didn't see much
value in returning anything that's not success or failure from the
tests.

I can switch back to returning a value, and then the array of tests
will also store the expected returned value.

> because that's what a human needs to know in order to fix the issue, not
> a generic "something failed".
> 
> > +    unsigned int i;
> > +
> > +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
> > +        return -EINVAL;
> 
> I'm not sure this is sensible.  It's a testing hypercall, so why
> shouldn't I be able to pass ~0 to mean "test everything the hypervisor
> knows about" ?

Well, for one livepatch tests will fail if the livepatch hasn't been
applied yet.

> > +
> > +    if ( results )
> > +        *results = 0;
> > +
> > +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> > +    {
> > +        if ( !(selection & tests[i].mask) )
> > +            continue;
> > +
> > +        if ( tests[i].test() )
> > +        {
> > +            if ( results )
> > +                *results |= tests[i].mask;
> 
> How is results supposed to be used?
> 
> XEN_SYSCTL_TEST_SMOC_INSN_REPL covers about 15 things we want to test,
> making this output mask useless.

The output mask just maps the input tests into output results.

For example given the case you want to execute all tests (~0), and the
livepatch replacements haven't been applied yet, the altinstructions
test will succeed, but the livepatch ones will fail (as expected), we
need a way to report this back to the caller.

> 
> The selftests, like the exception fixup ones, are supposed to be
> guarantee pass.  Failure is an exceptional case, and is only expected to
> be found with new compilers and new SMC development.

Livepatch tests (at least the one I have implemented in patch 3) is
expected to fail until a livepatch is applied to make it succeed.  We
do care about checking that it first fails, then we upload the
livepatch and it succeeds, and that reverting the livepatch makes it
fail again.

> I can kind of see how an input mask might be useful, although I wouldn't
> have had one myself.  With correct diagnostics, running the hypercall
> multiple times isn't useful to debugging, and without correct
> diagnostics, the feedback provided by this is useless.
> 
> So honestly, I think this "results" output is overengineered and doesn't
> help the cases where it is actually going to matter.

So for altinstructions it's true that the expectation is for them to
always succeed, that's not the case for livepatch ones, where it's
useful to explicitly test for failure, hence we need a fine grained
way to report failure of specific tests.

> 
> Remember most of all that self-modifying code which are going to cause
> failures here have a high chance of crashing Xen outright.  And we're
> deliberately trying to make this happen in CI and before a breaking
> change gets out into releases.
> 
> > +            continue;
> > +        }
> > +
> > +        if ( system_state < SYS_STATE_active )
> > +            printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> 
> This is a test hypercall, for the purpose of running testing, in
> combination with test livepatches.  Eliding the diagnostics isn't ok.
> 
> Logspam concerns aren't an issue.  If the user runs `while :; do
> xen-test-smc; done` in dom0 then they get to have a full dmesg ring.
> 
> Don't let that get in the way of having a sensible time figuring out
> what went wrong.

This was requested by Jan, and indeed my original intention was to
unconditionally print the messages, as I think they are helpful.

Thanks, Roger.

