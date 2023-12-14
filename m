Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DD8134C6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654633.1021784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDndt-0005Lc-M9; Thu, 14 Dec 2023 15:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654633.1021784; Thu, 14 Dec 2023 15:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDndt-0005Jr-Iv; Thu, 14 Dec 2023 15:28:53 +0000
Received: by outflank-mailman (input) for mailman id 654633;
 Thu, 14 Dec 2023 15:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDnds-0004ta-Bb
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:28:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bf4e3b5-9a95-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 16:28:51 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336445a2749so951763f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:28:51 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h11-20020adffd4b000000b003333298eb4bsm16488863wrs.61.2023.12.14.07.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:28:50 -0800 (PST)
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
X-Inumbo-ID: 7bf4e3b5-9a95-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702567731; x=1703172531; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PEC11bvLrwqaV5FBlAzJli958YZFskgIWyli4SMwyaI=;
        b=JJy35vx+e87YkaohC5Sph1HqvE1FR03I6jKIBfcsnWgeM00K/h0INPOGhNHBkyRKAh
         o8GMOBvZ3dTSJTDlzN559dQTvOBFT7r16O3I93sEnLe3bd4PPx4am3x746SkuXHHVZGz
         ZRDDWkoWOTt8Qcx1EkH3+mrMdJnKJ7oqyWBlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567731; x=1703172531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEC11bvLrwqaV5FBlAzJli958YZFskgIWyli4SMwyaI=;
        b=WhndFdPgkPknZjZPom3RKjC+6GNXDPSSvwffdI5B9muGo4oRz7yt4/MoTUlTDnWKsK
         vLqF0IlhFYr4kC9zF2lr4Uv/SQWSkqpaIKDS1FADPOr9plX3JNCbcx6dLfsk6Lympf7T
         vf4xLgE0PGZyukKr/lSt8ReIz/wMwaCq7c0K/BZc5xIGlokjRPh8zIHTPfwuVSDa4gv5
         A4n5ybF80eXfk/gnbpMzGcDsiWgOf91YkBJ3qItOl0C+VyrCaCfOwdW1wg6AA6TbGGMh
         k4WKA0RfuBdn5ePDNGfOXfx61friD1GgXreiarNDzluqBqeHoEBnM7slASJVjO8uoQJU
         CXXA==
X-Gm-Message-State: AOJu0YzRybmJzJYeqweVuH1OgpTwxBGB78ch4mEWJ22C9NhVRzMi/Tjd
	B2jHz2vKhIXmrGkn6EwDC9bRCw==
X-Google-Smtp-Source: AGHT+IF92EA5/1DPhRvrFtCQGWkXEIlA9UPJM4A60DEbq0uOZnDsICtWPCnvdQ2deEsRj22QUEuHzg==
X-Received: by 2002:a5d:630c:0:b0:333:2fd2:68dd with SMTP id i12-20020a5d630c000000b003332fd268ddmr5288179wru.112.1702567731172;
        Thu, 14 Dec 2023 07:28:51 -0800 (PST)
Date: Thu, 14 Dec 2023 16:28:50 +0100
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
Message-ID: <ZXsfMthj8wTdZOeT@macbook>
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-3-roger.pau@citrix.com>
 <6226aa5e-c87f-48bf-b793-96aa04498c5e@suse.com>
 <ZXsHWzcCSBKRS83S@macbook>
 <31cb367f-1a20-4ced-8f6f-aeab69f7c4fb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31cb367f-1a20-4ced-8f6f-aeab69f7c4fb@suse.com>

On Thu, Dec 14, 2023 at 02:57:11PM +0100, Jan Beulich wrote:
> On 14.12.2023 14:47, Roger Pau Monné wrote:
> > On Thu, Dec 14, 2023 at 12:55:22PM +0100, Jan Beulich wrote:
> >> On 14.12.2023 11:17, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -58,6 +58,7 @@
> >>>  #include <asm/microcode.h>
> >>>  #include <asm/prot-key.h>
> >>>  #include <asm/pv/domain.h>
> >>> +#include <asm/test-smoc.h>
> >>>  
> >>>  /* opt_nosmp: If true, secondary processors are ignored. */
> >>>  static bool __initdata opt_nosmp;
> >>> @@ -1951,6 +1952,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >>>  
> >>>      alternative_branches();
> >>>  
> >>> +    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL, NULL);
> >>
> >> I realize I'm at risk of causing scope creep, but I'd still like to at
> >> least ask: As further self-tests are added, we likely don't want to
> >> alter __start_xen() every time. Should there perhaps better be a wrapper
> >> (going forward: multiple ones, depending on the time tests want invoking),
> >> together with a Kconfig control to allow suppressing all of these tests in
> >> at least release builds?
> > 
> > Right now I only had in mind that livepatch related tests won't be
> > executed as part of the call in __start_xen(), but all the other ones
> > would, and hence wasn't expecting the code to change from the form in
> > the next patch.
> 
> Well, I was thinking of there more stuff appearing in test/, not self-
> modifying-code related, and hence needing further test_*() alongside.
> test_smoc().

Oh, I see.  I think it might be best to introduce such wrapper when we
have at least 2 different self tests?  Otherwise it would be weird IMO
to have another function (ie: execute_self_tests()?) that's just a
wrapper around test_smoc().

> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/test/smoc.c
> >>> @@ -0,0 +1,68 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +
> >>> +#include <xen/errno.h>
> >>> +
> >>> +#include <asm/alternative.h>
> >>> +#include <asm/cpufeature.h>
> >>> +#include <asm/test-smoc.h>
> >>> +
> >>> +static bool cf_check test_insn_replacement(void)
> >>> +{
> >>> +#define EXPECTED_VALUE 2
> >>> +    unsigned int r = ~EXPECTED_VALUE;
> >>> +
> >>> +    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
> >>> +                   "+r" (r), "i" (EXPECTED_VALUE));
> >>> +
> >>> +    return r == EXPECTED_VALUE;
> >>> +#undef EXPECTED_VALUE
> >>> +}
> >>> +
> >>> +int test_smoc(uint32_t selection, uint32_t *results)
> >>> +{
> >>> +    struct {
> >>> +        unsigned int mask;
> >>> +        bool (*test)(void);
> >>> +        const char *name;
> >>> +    } static const tests[] = {
> >>> +        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
> >>> +          "alternative instruction replacement" },
> >>> +    };
> >>> +    unsigned int i;
> >>> +
> >>> +    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
> >>> +        return -EINVAL;
> >>> +
> >>> +    if ( results )
> >>> +        *results = 0;
> >>> +
> >>> +    printk(XENLOG_INFO "Checking Self Modify Code\n");
> >>> +
> >>> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> >>> +    {
> >>> +        if ( !(selection & tests[i].mask) )
> >>> +            continue;
> >>> +
> >>> +        if ( tests[i].test() )
> >>> +        {
> >>> +            if ( results )
> >>> +                *results |= tests[i].mask;
> >>> +            continue;
> >>> +        }
> >>> +
> >>> +        add_taint(TAINT_ERROR_SMOC);
> >>> +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> >>
> >> Do we really want both of these even when coming here from the sysctl?
> > 
> > So only print the messages if system_state < SYS_STATE_active?
> 
> Yes. Nor tainting the system.

OK.

> >>> --- a/xen/common/kernel.c
> >>> +++ b/xen/common/kernel.c
> >>> @@ -386,13 +386,14 @@ char *print_tainted(char *str)
> >>>  {
> >>>      if ( tainted )
> >>>      {
> >>> -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
> >>> +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
> >>>                   tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
> >>>                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
> >>>                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
> >>>                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
> >>>                   tainted & TAINT_HVM_FEP ? 'H' : ' ',
> >>> -                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
> >>> +                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
> >>> +                 tainted & TAINT_ERROR_SMOC ? 'A' : ' ');
> >>
> >> How well is this going to scale as other selftests are added? IOW should
> >> this taint really be self-modifying-code-specific?
> > 
> > I'm afraid I'm not sure I'm following.  Would you instead like to make
> > the taint per-test selectable?
> 
> The other way around actually: Taint generally for failed selftests,
> not just for the self-modifying-code one (which ends up being the only
> one right now).

So the suggestion would be to use TAINT_ERROR_SELFTEST instead of
TAINT_ERROR_SMOC?  I can do that, but it might also be more
appropriate when there are more self tests.

Thanks, Roger.

