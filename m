Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42580557D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647849.1011502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVAK-0002Jb-6Z; Tue, 05 Dec 2023 13:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647849.1011502; Tue, 05 Dec 2023 13:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVAK-0002HQ-3z; Tue, 05 Dec 2023 13:08:44 +0000
Received: by outflank-mailman (input) for mailman id 647849;
 Tue, 05 Dec 2023 13:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAVAI-0002HK-Gj
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:08:42 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68fe8809-936f-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 14:08:41 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3332fc9b9b2so3744604f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:08:41 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b003333a216682sm9217761wrb.97.2023.12.05.05.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 05:08:40 -0800 (PST)
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
X-Inumbo-ID: 68fe8809-936f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701781720; x=1702386520; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUqnKUy3IFc15kUZSPH6q5WAl16kF4M3HttC7VoHIOo=;
        b=YjvCOxA5Jx6PQEeT2T+SDrxXuzMcml40l6j/YqudiYZRFE2DCmiKUtZ6NUNJKt8+u1
         rQeZbGs35Xd+A+QfZWwtJrk/demYOPGmQjb+hnCCbJrzp2jGIBq9+1meP3YzUsJFT6qV
         99zdNHuBDX17ZBQXssGLp6cmhjaOgzUzAwsRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701781720; x=1702386520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUqnKUy3IFc15kUZSPH6q5WAl16kF4M3HttC7VoHIOo=;
        b=HZ7EDcIZXRGDVnPCfSaDY1OvyssZzqowi4KOMjToiO/2dhpD3HrHfa7m77RcesTq6M
         hW1btWg+ExdTRBbE2tvCXbK7JJ6M+VwZP40iPAnL4cRjcRe38AUanh0l38k4YuKU2Bx1
         LHDylB5oHAsMZccjSEO1Nlr8ji+dELO6OsajorW8HxnY8QpmIEjI6bw3aH2BU3cxXkem
         Wf4RLQZV0fAIn8g13Yem6dgEfiA4eb+hPGbVr2M55ZR0dr8BSh2J1X5DhlSY814AW+tC
         gJR8kIklra064pwr/GFrWch+SL8Veo3sO/wk2h31G6KGdzLG4sIUHSqrtRIhyRMqB5OS
         OpuQ==
X-Gm-Message-State: AOJu0YzhIxeGCCA8aB45i1d6MuRIgCLxL7ek+oSmtl5w3LNDITv3G8rq
	cxSO0rbYf+nGDszHebg3kMCxsA==
X-Google-Smtp-Source: AGHT+IFB9Zzgx0rDzUTEvxHb6mwVwM6996HD3eO0VBQmJX5e80bYxGBkaCRNcqM+NWxEQl3uop9lVw==
X-Received: by 2002:a5d:54cd:0:b0:333:529b:e75 with SMTP id x13-20020a5d54cd000000b00333529b0e75mr666535wrv.61.1701781720351;
        Tue, 05 Dec 2023 05:08:40 -0800 (PST)
Date: Tue, 5 Dec 2023 14:08:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/5] x86/livepatch: introduce a basic live patch test
 to gitlab CI
Message-ID: <ZW8g144id8e1Aoy3@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-5-roger.pau@citrix.com>
 <00de64fd-5669-424d-9b32-2342b5936f1a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00de64fd-5669-424d-9b32-2342b5936f1a@suse.com>

On Tue, Dec 05, 2023 at 12:49:38PM +0100, Jan Beulich wrote:
> On 28.11.2023 11:03, Roger Pau Monne wrote:
> > Introduce a basic livepatch test using the interface to run self modifying
> > tests.  The introduced test relies on changing a function from returning false
> > to returning true.
> > 
> > To simplify the burden of keeping a patch that can be provided to
> > livepatch-build-tools, introduce two new files: one containing the unpatched
> > test functions, and another one that contains the patched forms of such
> > functions.  Note that only the former is linked into the Xen image, the latter
> > is built but the object file is not consumed afterwards.  Do this to assert
> > that the file containing the patched functions continues to build.
> > 
> > Since livepatch testing will ensure that the functions are not patched previous
> > the applying the livepatch, allow the livepatch related tests to fail without
> > tainting the hypervisor.
> > 
> > Note the livepatch tests are not run as part of the self modifying checks
> > executed during boot, as they would obviously fail.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - New interface & test.
> > ---
> >  tools/misc/xen-livepatch.c          | 29 +++++++++++++++++++++++++++++
> >  xen/arch/x86/Makefile               |  2 ++
> >  xen/arch/x86/include/asm/test-smc.h |  2 ++
> >  xen/arch/x86/setup.c                |  2 +-
> >  xen/arch/x86/test-smc-lp-alt.c      | 23 +++++++++++++++++++++++
> >  xen/arch/x86/test-smc-lp.c          | 23 +++++++++++++++++++++++
> >  xen/arch/x86/test-smc.c             | 11 ++++++++++-
> >  xen/include/public/sysctl.h         |  6 +++++-
> >  8 files changed, 95 insertions(+), 3 deletions(-)
> >  create mode 100644 xen/arch/x86/test-smc-lp-alt.c
> >  create mode 100644 xen/arch/x86/test-smc-lp.c
> 
> Can these (and perhaps also the one file introduced earlier in the series)
> perhaps become xen/arch/x86/test/smc*.c?

Yes, sure, I don't see why not.

> > --- /dev/null
> > +++ b/xen/arch/x86/test-smc-lp-alt.c
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <asm/test-smc.h>
> > +
> > +/*
> > + * Interesting case because `return false` can be encoded as an xor
> > + * instruction, which is shorter than `return true` which is a mov instruction,
> > + * and also shorter than a jmp instruction.
> > + */
> 
> I'm a little wary of this comment: "mov $1, %al" is two bytes only, just like

Don't we need to zero the high part of the register also?  Or since
the return type is a bool the compiler could assume it's truncated by
the caller?

> "xor %eax, %eax" is.

GCC 13.2 (from godbolt) generates at -O2:

mov    $0x1,%eax
ret

Which is 5 bytes long mov insn.

The return false case is:

xor    %eax,%eax
ret

I can adjust to mention this specific behavior.

> > +bool cf_check test_lp_insn_replacement(void)
> 
> What's the purpose of the cf_check here?

Because it's added to the array of test functions to call in
test_smc().  Doesn't it need cf_check in that case?

Thanks, Roger.

