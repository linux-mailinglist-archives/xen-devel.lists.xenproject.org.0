Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A6B46716
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112606.1460816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufiD-00083x-SI; Fri, 05 Sep 2025 23:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112606.1460816; Fri, 05 Sep 2025 23:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufiD-000827-Os; Fri, 05 Sep 2025 23:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1112606;
 Fri, 05 Sep 2025 23:19:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufiC-000821-M8
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:19:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufiA-008A27-27;
 Fri, 05 Sep 2025 23:19:18 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufiA-0004py-1j;
 Fri, 05 Sep 2025 23:19:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=HarwgU/ebD3NnpAVWy3W47LnLP6H4RNJf1DstkD4+2o=; b=
	UKZKlXYnmU4s1ZF1UxwPQsYgcvYlwmLLrX3qrQDj2as7x93lVrh+gSAwJ8P8t/vRWzb8FwFUx4eTH
	YghAaEUJDeXxv0biUbrekKiQHtEIukvgBO5LLVdxRcZW/M+jQojs83CkXCPwOc6LGtWsGGZGM+HVN
	trffvMsG/cpEiW+ww=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 16:19:17 -0700
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v17 3/4] tools/tests: introduce unit tests for domain ID
 allocator
Message-ID: <aLtv9bFxf3BEu56v@kraken>
References: <20250829232132.3460081-1-dmukhin@ford.com>
 <20250829232132.3460081-4-dmukhin@ford.com>
 <aLmZLm2_G48yfPWR@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLmZLm2_G48yfPWR@l14>

On Thu, Sep 04, 2025 at 03:50:38PM +0200, Anthony PERARD wrote:
> On Fri, Aug 29, 2025 at 04:21:31PM -0700, dmukhin@xen.org wrote:
> > diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> > new file mode 100644
> > index 000000000000..22f1f15d11db
> > --- /dev/null
> > +++ b/tools/tests/domid/Makefile
> > +# NB: $1 cannot be a list
> 
> Why not? It would be the same as writing the rule multiple time for
> different targets.
> 
> Is about my comment on "prerequisite" on v16? In this rule, "harness.h"
> is a prerequisite.

Sorry for late response.

I see the series is already comitted (thanks!)
I will send a fixup patch for that, since this fragment can be re-used in new
tests.

> 
> > +define emit-harness-nested-rule
> > +$(1): $(CURDIR)/harness.h
> > +	mkdir -p $$(@D);
> > +	ln -sf $$< $$@;
> > +
> > +endef
> > diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> > new file mode 100644
> > index 000000000000..5915c4699a5c
> > --- /dev/null
> > +++ b/tools/tests/domid/test-domid.c
> > +
> > +#include <sysexits.h>
> > +
> > +#include "harness.h"
> > +
> > +#define verify(exp, fmt, args...) \
> > +while (!(exp)) { \
> > +    printf(fmt, ## args); \
> > +    exit(EX_SOFTWARE); \
> 
> We never used any of "EX_*" macro, or even <sysexits.h>. I'm not sure
> it's a good idea to introduce such use where exit(1) would have been
> more than enough but sysexits.h seems to be available on BSD so it's
> probably fine. It would be nice to change that to exit(1) and remove
> sysexits.h.

re: sysexits.h: muscle memory.
I can fix this up too in a follow on patch, please let me know.

> 
> Anyway, patch looks good enough so:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks!

