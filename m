Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0688423EC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 12:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673305.1047655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUmZJ-0007nN-Rw; Tue, 30 Jan 2024 11:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673305.1047655; Tue, 30 Jan 2024 11:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUmZJ-0007k8-Oh; Tue, 30 Jan 2024 11:46:21 +0000
Received: by outflank-mailman (input) for mailman id 673305;
 Tue, 30 Jan 2024 11:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUmZI-0007k2-77
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 11:46:20 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e8afabe-bf65-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 12:46:19 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso46116825e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 03:46:19 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b0040efa513540sm4481444wms.22.2024.01.30.03.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 03:46:18 -0800 (PST)
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
X-Inumbo-ID: 2e8afabe-bf65-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706615178; x=1707219978; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqrzr9fh7Bx1/iMuOrLezyiLTHIY9EMlALhar2VsEP4=;
        b=Yy1wO49JFxIsnJyLZ+QcMUOwCRkTBcIIQaelLF+nENMYEqR9KtZy9gDkIoj5LhBURW
         JTOr8HU1est9DUPdKdUyTNUUYUWhk9AFyRFY3AdD5Cd7+vISXWL0KLefxfMFSbkXGQbP
         RVJDDj30Keh2izz8tEO+Vt2aCEXdf63Oo4z9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706615178; x=1707219978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqrzr9fh7Bx1/iMuOrLezyiLTHIY9EMlALhar2VsEP4=;
        b=J3r9VqF93ake6QTbV6CYTO6g5VFBIRoRMyjwEPvtL73f1BLaZ4Qq/EpqDTJXEpb4/4
         alqUcGUUVdi+U8zs1/+A/tbKEyWhQTb9aEcisvFabXFa4kGB5JE+WMuX2xiMAX9Nqn/b
         Z4TMY+NEq8069RvXEUXBRc6yLZNc5DImWO+oG6swkVFIvoMcZb3BTXVpjDii43mASl47
         p/O/LMgZBFgAYTPXZHwFA18uxrXx2qXM4p4kLuFTKilwazelyf8LjkyXQDfN4m4HaID/
         rWoTzaCLiwwLqNQGdxVYCl2WXmpRw4hrtZaimY2H49D/TV86fZjIiUdlACujrta6BKRe
         LDwQ==
X-Gm-Message-State: AOJu0YxTi4hKSQOJsqMtqnhykG2u78bs2/x0ve200Day4XA/i6J776m6
	30EDVSLGosbE8vWvCjNgWhdpWUtY4h+ODZDaCiWGJ+J+t3W5QxfKXP9O6VA9vtU=
X-Google-Smtp-Source: AGHT+IGx6IWWvlblzL+GyFVy2c8u3hoTYx51iSMgYOEohMJerXF+csE4+En1eqoxLx8N8amq++y+DA==
X-Received: by 2002:a05:600c:1e14:b0:40f:afb3:97d5 with SMTP id ay20-20020a05600c1e1400b0040fafb397d5mr381572wmb.38.1706615178468;
        Tue, 30 Jan 2024 03:46:18 -0800 (PST)
Date: Tue, 30 Jan 2024 12:46:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] XTF: tests SPEC_CTRL added bits
Message-ID: <Zbjhica05LIMB9zX@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130102719.51150-1-roger.pau@citrix.com>
 <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com>

On Tue, Jan 30, 2024 at 11:42:43AM +0100, Jan Beulich wrote:
> On 30.01.2024 11:27, Roger Pau Monne wrote:
> > Dummy set/clear tests for additional spec_ctrl bits.
> > ---
> >  docs/all-tests.dox  |   2 +
> >  tests/test/Makefile |   9 ++++
> >  tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 111 insertions(+)
> >  create mode 100644 tests/test/Makefile
> >  create mode 100644 tests/test/main.c
> 
> I'm puzzled: Why "test"? That doesn't describe in any way what this test
> is about.

That's just my place holder for random XTF stuff.  I don't intend this
to be committed.

> > --- /dev/null
> > +++ b/tests/test/Makefile
> > @@ -0,0 +1,9 @@
> > +include $(ROOT)/build/common.mk
> > +
> > +NAME      := test
> > +CATEGORY  := utility
> > +TEST-ENVS := hvm32 pv64
> 
> Any reason for this limitation?

Just wanted a PV and an HVM context.

> > --- /dev/null
> > +++ b/tests/test/main.c
> > @@ -0,0 +1,100 @@
> > +/**
> > + * @file tests/test/main.c
> > + * @ref test-test
> > + *
> > + * @page test-test test
> > + *
> > + * @todo Docs for test-test
> > + *
> > + * @see tests/test/main.c
> > + */
> > +#include <xtf.h>
> > +
> > +#define MSR_SPEC_CTRL                       0x00000048
> > +#define  SPEC_CTRL_IPRED_DIS_U              (_AC(1, ULL) <<  3)
> > +#define  SPEC_CTRL_IPRED_DIS_S              (_AC(1, ULL) <<  4)
> > +#define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
> > +#define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
> > +#define  SPEC_CTRL_DDP_DIS_U                (_AC(1, ULL) <<  8)
> > +#define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
> > +
> > +const char test_title[] = "SPEC_CTRL";
> > +
> > +static void update_spec_ctrl(uint64_t mask, bool set)
> > +{
> > +    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
> > +
> > +    if ( set )
> > +        spec_ctrl |= mask;
> > +    else
> > +        spec_ctrl &= ~mask;
> > +
> > +    wrmsr(MSR_SPEC_CTRL, spec_ctrl);
> > +}
> > +
> > +static void assert_spec_ctrl(uint64_t mask, bool set)
> > +{
> > +    uint64_t spec_ctrl = rdmsr(MSR_SPEC_CTRL);
> > +
> > +    if ( (spec_ctrl & mask) != (set ? mask : 0) )
> > +    {
> > +        xtf_failure("SPEC_CTRL expected: %#" PRIx64 " got: %#" PRIx64 "\n",
> > +                    set ? (spec_ctrl | mask) : (spec_ctrl & ~mask),
> > +                    spec_ctrl);
> > +        xtf_exit();
> > +    }
> > +}
> > +
> > +static void test_loop(uint64_t mask)
> > +{
> > +    update_spec_ctrl(mask, true);
> > +    assert_spec_ctrl(mask, true);
> > +    /* Ensure context switch to Xen. */
> > +    hypercall_yield();
> 
> I'm afraid yielding doesn't guarantee context switching in Xen,

It will ensure a vmexit/trap, which is what I was after here.  Maybe the
comment should be "Trap into Xen." or some such.  It wasn't about
ensuring VM context switching.

Thanks, Roger.

