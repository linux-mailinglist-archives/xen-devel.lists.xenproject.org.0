Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D581320B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654589.1021654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDm3U-0002uW-BW; Thu, 14 Dec 2023 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654589.1021654; Thu, 14 Dec 2023 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDm3U-0002sr-8h; Thu, 14 Dec 2023 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 654589;
 Thu, 14 Dec 2023 13:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDm3T-0002sl-Mc
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:47:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4704fc2a-9a87-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 14:47:09 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33646500f1aso705868f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:47:09 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b003363823d8aesm4675724wrt.59.2023.12.14.05.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 05:47:08 -0800 (PST)
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
X-Inumbo-ID: 4704fc2a-9a87-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702561629; x=1703166429; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z5kjM6mHdQQw1Cata9v1sHQkmFezXUu333JNaLdocc=;
        b=emvb8sX9vJS0FdDiH+nJyL9RsW3ynmzwOH3dhjFKjeCMSlX4UUOXBkIrLYZHeTkhha
         bjMLa3vuZEr0Fllhotpg50PmShkQSOdxYeNtRYyJ3aV+xc3TAJ2+b8QtKo0g2tjtsO9Q
         fZWIxCJndg0WQIUX62M4oyeGSOqiOm7a2MGAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561629; x=1703166429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z5kjM6mHdQQw1Cata9v1sHQkmFezXUu333JNaLdocc=;
        b=NK8P6TCCdrUs6d3ZDOxBDUI0Q4/Kb+II31vpOk20mEk/SG+q5s6IKBMma/i6+A5iZq
         Y9FcG/+IJBL1quWxW9gJaKGJ7ZkOLljjCIkIwQnkroMM95+yZ68l7XwiPvCCm0YYknhS
         gAdYpLjgLwH2Indgh5AbWkqwrVfA3wy7S0HK4XQLMrwl0JE+WVPQbQwyVKeMsOncheFA
         0AQiE9HKfK7zpZuP+B4db3EDflYIvwhJLkChn+9XIEAGENJGpezFpVq10F5qo3fsdYGD
         qulYExu+mbio1L0IpKqWY5MSOta0op9xZ/MNcKhUC/LG0639fyFhEqmEA1iF4MU4g0oC
         foOA==
X-Gm-Message-State: AOJu0Yya8Xo/2/w0aKUkoEdye3uqGzesdUPry9Myql/csVl99A6qcS/G
	G8keXEnJ/xkG++ccLwqHyL5zQg==
X-Google-Smtp-Source: AGHT+IG15CORhiR17/RvUX09J3p6TRh1Rkaf1BnYEUJYsYN7hULGJDa3lhdjRT5z3ei1HRPhjSEpPw==
X-Received: by 2002:a5d:6311:0:b0:336:3919:54fe with SMTP id i17-20020a5d6311000000b00336391954femr957381wru.162.1702561629251;
        Thu, 14 Dec 2023 05:47:09 -0800 (PST)
Date: Thu, 14 Dec 2023 14:47:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/4] xen/x86: introduce self modifying code test
Message-ID: <ZXsHWzcCSBKRS83S@macbook>
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-3-roger.pau@citrix.com>
 <6226aa5e-c87f-48bf-b793-96aa04498c5e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6226aa5e-c87f-48bf-b793-96aa04498c5e@suse.com>

On Thu, Dec 14, 2023 at 12:55:22PM +0100, Jan Beulich wrote:
> On 14.12.2023 11:17, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -58,6 +58,7 @@
> >  #include <asm/microcode.h>
> >  #include <asm/prot-key.h>
> >  #include <asm/pv/domain.h>
> > +#include <asm/test-smoc.h>
> >  
> >  /* opt_nosmp: If true, secondary processors are ignored. */
> >  static bool __initdata opt_nosmp;
> > @@ -1951,6 +1952,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >  
> >      alternative_branches();
> >  
> > +    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL, NULL);
> 
> I realize I'm at risk of causing scope creep, but I'd still like to at
> least ask: As further self-tests are added, we likely don't want to
> alter __start_xen() every time. Should there perhaps better be a wrapper
> (going forward: multiple ones, depending on the time tests want invoking),
> together with a Kconfig control to allow suppressing all of these tests in
> at least release builds?

Right now I only had in mind that livepatch related tests won't be
executed as part of the call in __start_xen(), but all the other ones
would, and hence wasn't expecting the code to change from the form in
the next patch.

> > --- /dev/null
> > +++ b/xen/arch/x86/test/smoc.c
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <xen/errno.h>
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cpufeature.h>
> > +#include <asm/test-smoc.h>
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
> > +    unsigned int i;
> > +
> > +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
> > +        return -EINVAL;
> > +
> > +    if ( results )
> > +        *results = 0;
> > +
> > +    printk(XENLOG_INFO "Checking Self Modify Code\n");
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
> > +            continue;
> > +        }
> > +
> > +        add_taint(TAINT_ERROR_SMOC);
> > +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> 
> Do we really want both of these even when coming here from the sysctl?

So only print the messages if system_state < SYS_STATE_active?

That would be OK by me.

> > --- a/xen/common/kernel.c
> > +++ b/xen/common/kernel.c
> > @@ -386,13 +386,14 @@ char *print_tainted(char *str)
> >  {
> >      if ( tainted )
> >      {
> > -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
> > +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
> >                   tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
> >                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
> >                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
> >                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
> >                   tainted & TAINT_HVM_FEP ? 'H' : ' ',
> > -                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
> > +                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
> > +                 tainted & TAINT_ERROR_SMOC ? 'A' : ' ');
> 
> How well is this going to scale as other selftests are added? IOW should
> this taint really be self-modifying-code-specific?

I'm afraid I'm not sure I'm following.  Would you instead like to make
the taint per-test selectable?

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -1180,6 +1180,7 @@ struct xen_sysctl_cpu_policy {
> >  };
> >  typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
> > +
> >  #endif
> >  
> >  #if defined(__arm__) || defined (__aarch64__)
> 
> Stray change (perhaps leftover from moving code around)?

Indeed, sorry.

Thanks, Roger.

