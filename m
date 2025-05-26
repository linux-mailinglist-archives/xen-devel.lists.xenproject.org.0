Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A69AC4257
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 17:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997585.1378409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZtu-00043Z-Uq; Mon, 26 May 2025 15:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997585.1378409; Mon, 26 May 2025 15:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZtu-00041K-RK; Mon, 26 May 2025 15:38:06 +0000
Received: by outflank-mailman (input) for mailman id 997585;
 Mon, 26 May 2025 15:38:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJZtt-00041E-Pk
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 15:38:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJZtt-003Pq1-1N;
 Mon, 26 May 2025 15:38:05 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJZtt-00DIzM-1Z;
 Mon, 26 May 2025 15:38:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=h2dW67t6mSTTssdF81HMWWxn3bRr8RAmt/V+DPxNSCs=; b=nGr95KXbQiaqVQ4dH6sTV8dE+i
	DYyrMSleAZizju+gHjH+7rnDoCE63yJaZf6k0sHMDRUiNpq6dFhJl5uV1w0xYmH3/lvMNvb13GUrn
	pwk5KclT6EnpmMcQe/xZxUa2BBSn/xuPMZb620Jag8Eh/f9pvXlIiV951jcs+PR30sH8=;
Date: Mon, 26 May 2025 17:38:03 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
Message-ID: <aDSK2x-EI1ZAvE9u@l14>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>

On Tue, May 20, 2025 at 10:02:05PM +0100, Andrew Cooper wrote:
> On 16/05/2024 12:07 pm, Alejandro Vallejo wrote:
> > Bring test_x86_emulator in line with other tests by adding
> > install/uninstall rules.
> >
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  tools/tests/x86_emulator/Makefile | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
> > index 834b2112e7fe..30edf7e0185d 100644
> > --- a/tools/tests/x86_emulator/Makefile
> > +++ b/tools/tests/x86_emulator/Makefile
> > @@ -269,8 +269,15 @@ clean:
> >  .PHONY: distclean
> >  distclean: clean
> >  
> > -.PHONY: install uninstall
> > -install uninstall:
> > +.PHONY: install
> > +install: all
> > +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> > +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
> > +
> > +.PHONY: uninstall
> > +uninstall:
> > +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
> > +
> >  
> >  .PHONY: run32 clean32
> >  ifeq ($(XEN_COMPILE_ARCH),x86_64)
> 
> [starting a clean thread]
> 
> x86_emulator is not special enough to behave differently to the rest of
> tools/.
> 
> Theoretical concerns over cross compiling test_x86_emulator for non-x86
> can be fixed by whomever first wants to do this.

I think we are fine with regards to cross compiling. It's probably
broken.

Sometime, XEN_COMPILE_ARCH is used as XEN_TARGET_ARCH.

Also the makefile is executed only if the target is x86 (in the makefile
in the parent directory). So if the target is not x86, nothing is
install or built. But if the target is x86 and the host is !x86 then the
build is probably going to fail.

> The very real problem is that this doesn't run in x86 CI, because and
> only because it doesn't have an install target.

So, the patch seems fine to me:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

