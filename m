Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECD97EC02
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 15:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802049.1212159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssilm-0007kK-Ci; Mon, 23 Sep 2024 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802049.1212159; Mon, 23 Sep 2024 13:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssilm-0007hP-A1; Mon, 23 Sep 2024 13:06:26 +0000
Received: by outflank-mailman (input) for mailman id 802049;
 Mon, 23 Sep 2024 13:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=darJ=QV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ssill-0007hJ-P3
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 13:06:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2f0533a-79ac-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 15:06:24 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so699437866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 06:06:24 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43c7sm1220386566b.62.2024.09.23.06.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:06:23 -0700 (PDT)
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
X-Inumbo-ID: a2f0533a-79ac-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727096784; x=1727701584; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlErvXybXZq+H/29F1no/9mZcPPfRfR48smA3BNPYjI=;
        b=EF1Ruk7RiNtAJPATk2reYzG50LRSZ7RqSHd+nH7Stvhuh4mv7rQZJvZU7Z5hGNqmmN
         w5VU5T+igcFvNWAyN7yZA9AiCVDGvsiq55XBfezI75TMoshROXvn/rxDqdwVhKFtXsiy
         KToFx87DJZCGtaQJaE951kAc3AuO3LQ7l15n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727096784; x=1727701584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlErvXybXZq+H/29F1no/9mZcPPfRfR48smA3BNPYjI=;
        b=VjdPVFiZOQK7aIkiQ4cTCut/G4d1Td9pY3FHkeXxaV6De23OFc5FU/CJBb+vEkrjRo
         3UXfyKDtkZeyyA8GFifvtSBitzjsuhy3zBS87IgaMADp8k3pGQMvOjNv06BRYQsK2D9N
         ZsyryGTaXTzJbiAggxRg4Yb7n8jM+kLys+iqB/CA3O1GY5Pr7dtNmNABQRdxVDf2ZFre
         PdNeEyrhHxr2e/OgarZFh43Oplw1gu79DDP9qUOEOaHdYphU8dV20Kaqndxb9vjpzUmi
         94H4PtuUk6w0jEFtxR47IOW5urhaAvtPV/xJthpXlbhm7kokXnhfR5G/op7jT+WVVTTE
         g/AA==
X-Gm-Message-State: AOJu0YynEex7ozkdgXamApbIpNEt95CdtXU0UGOiqSJZ2BuW8fCoWyB3
	una+pO7RoSUkB+cJ+TqiXlwtJDDbSxCk5MEsV9lpg8p8VnKoskgR0suibaeIAPA=
X-Google-Smtp-Source: AGHT+IEvvGcOrj7CSO8B3TgI3N94G+tWJ8pxJvr5YBAj3kTNf9hj65tteVdrHBt++URJ4knh0/cmIA==
X-Received: by 2002:a17:907:1b10:b0:a7a:acae:3415 with SMTP id a640c23a62f3a-a90d4fdf007mr1202458166b.10.1727096784119;
        Mon, 23 Sep 2024 06:06:24 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:06:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roge.rpau@citrix.com>
Subject: Re: [PATCH 3/3] x86/alternatives: relax apply BUGs during runtime
Message-ID: <ZvFnzrVpf4sUesVP@macbook.local>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-5-roger.pau@citrix.com>
 <f9ff1d2e-0d4f-4b28-83dc-b7f26f3fe86c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9ff1d2e-0d4f-4b28-83dc-b7f26f3fe86c@citrix.com>

On Mon, Sep 23, 2024 at 12:17:51PM +0100, Andrew Cooper wrote:
> On 20/09/2024 10:36 am, Roger Pau Monne wrote:
> > alternatives is used both at boot time, and when loading livepatch payloads.
> > While for the former it makes sense to panic, it's not useful for the later, as
> > for livepatches it's possible to fail to load the livepatch if alternatives
> > cannot be resolved and continue operating normally.
> >
> > Relax the BUGs in _apply_alternatives() to instead return an error code if
> > alternatives are applied after boot.
> >
> > Add a dummy livepatch test so the new logic can be assessed, with the change
> > applied the loading now fails with:
> >
> > alt table ffff82d040602024 -> ffff82d040602032
> > livepatch: xen_alternatives_fail applying alternatives failed: -22
> >
> > Signed-off-by: Roger Pau Monné <roge.rpau@citrix.com>
> > ---
> >  xen/arch/x86/alternative.c                 | 29 ++++++++++++++++------
> >  xen/arch/x86/include/asm/alternative.h     |  3 ++-
> >  xen/common/livepatch.c                     | 10 +++++++-
> >  xen/test/livepatch/Makefile                |  5 ++++
> >  xen/test/livepatch/xen_alternatives_fail.c | 29 ++++++++++++++++++++++
> >  5 files changed, 66 insertions(+), 10 deletions(-)
> >  create mode 100644 xen/test/livepatch/xen_alternatives_fail.c
> >
> > diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> > index 7824053c9d33..c0912cb12ea5 100644
> > --- a/xen/arch/x86/alternative.c
> > +++ b/xen/arch/x86/alternative.c
> > @@ -174,10 +174,13 @@ extern void *const __initdata_cf_clobber_end[];
> >   * The caller will set the "force" argument to true for the final
> >   * invocation, such that no CALLs/JMPs to NULL pointers will be left
> >   * around. See also the further comment below.
> > + *
> > + * Note the function cannot fail if system_state < SYS_STATE_active, it would
> > + * panic instead.  The return value is only meaningful for runtime usage.
> >   */
> > -static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> > -                                                  struct alt_instr *end,
> > -                                                  bool force)
> > +static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
> > +                                                 struct alt_instr *end,
> > +                                                 bool force)
> >  {
> >      struct alt_instr *a, *base;
> >  
> > @@ -198,9 +201,17 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> >          uint8_t buf[MAX_PATCH_LEN];
> >          unsigned int total_len = a->orig_len + a->pad_len;
> >  
> > -        BUG_ON(a->repl_len > total_len);
> > -        BUG_ON(total_len > sizeof(buf));
> > -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> > +#define BUG_ON_BOOT(cond)                                       \
> > +    if ( system_state < SYS_STATE_active )                      \
> > +        BUG_ON(cond);                                           \
> > +    else if ( cond )                                            \
> > +        return -EINVAL;
> > +
> > +        BUG_ON_BOOT(a->repl_len > total_len);
> > +        BUG_ON_BOOT(total_len > sizeof(buf));
> > +        BUG_ON_BOOT(a->cpuid >= NCAPINTS * 32);
> > +
> > +#undef BUG_ON_BOOT
> 
> The "error handling" before was horrible and this isn't really any better.
> 
> This function should always return int, printing more helpful info than
> that (a printk() says a thousand things better than a BUG()), and
> nmi_apply_alternatives can panic() rather than leaving these BUG()s here.

OK, will rework the logic here so it's the caller that panics (or not)
as necessary, and _apply_alternatives() always prints some error
message.

> As a tangent, the __must_check doesn't seem to have been applied to
> nmi_apply_alternatives(), but I'd suggest dropping the attribute; I
> don't think it adds much.

I didn't see the value in adding the attribute to
nmi_apply_alternatives(), as in that context _apply_alternatives()
would unconditionally panic instead of returning an error code.

> > diff --git a/xen/test/livepatch/xen_alternatives_fail.c b/xen/test/livepatch/xen_alternatives_fail.c
> > new file mode 100644
> > index 000000000000..01d289095a31
> > --- /dev/null
> > +++ b/xen/test/livepatch/xen_alternatives_fail.c
> > @@ -0,0 +1,29 @@
> > +/*
> > + * Copyright (c) 2024 Cloud Software Group.
> > + *
> > + */
> > +
> > +#include "config.h"
> > +#include <xen/lib.h>
> > +#include <xen/livepatch_payload.h>
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cpuid.h>
> > +
> > +void test_alternatives(void)
> > +{
> > +    alternative("", "", NCAPINTS * 32);
> > +}
> > +
> > +/* Set a hook so the loading logic in Xen don't consider the payload empty. */
> > +LIVEPATCH_LOAD_HOOK(test_alternatives);
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> 
> The second half of the patch (new testcase) is all fine and good, but
> should pass with patch 2 in place?  I'd suggest splitting it out.

No, not really.  The Xen buildid for this patch will be correctly set
to match the running one, but the alternatives feature CPUID is
explicitly set to an out of range value (NCAPINTS * 32) to trigger the
BUG_ON condition.

Further thinking about it, I think we should add a build time assert
that the feature parameters in the alternative calls are smaller than
NCAPINTS * 32.

Thanks, Roger.

