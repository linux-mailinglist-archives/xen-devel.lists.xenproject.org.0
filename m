Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47AABE779
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 00:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991219.1375108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVlM-0006PV-VT; Tue, 20 May 2025 22:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991219.1375108; Tue, 20 May 2025 22:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHVlM-0006NL-SC; Tue, 20 May 2025 22:48:44 +0000
Received: by outflank-mailman (input) for mailman id 991219;
 Tue, 20 May 2025 22:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHVlL-0006NF-Lw
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 22:48:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9384d86c-35cc-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 00:48:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 768D95C5AF6;
 Tue, 20 May 2025 22:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59415C4CEE9;
 Tue, 20 May 2025 22:48:39 +0000 (UTC)
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
X-Inumbo-ID: 9384d86c-35cc-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747781320;
	bh=yscp7GbN0WQytJ0e6ihAtkd6m542+j8XvrHo/s6CQhA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2aEjT304gIuDYtVtnvIPBrOblMSUcQ5p3KTjU1gbX/B45r2PyZdxRIiFuIbGoinr
	 9BX7niaSw5VQ6Zt/XZfNRjZT+sOIEZzcTYYdujr/4dpqBznZmnuZfW+QUhuO7DvZ8+
	 cgzlKVP8d14j0g5HMBScfNKLDHfVnrBlvjk8SyZl0uUWLFFqagpm2uD6nPs+axejzn
	 hxaDC51IWUepoUmD/Sk3PAilGyhahG6752o2+ay/T4rg4falgg/0cAwkr9vjZl2Cpb
	 mVEC1SpNrWdoG77/T49Ru2fZmCyIpuAGiGadcHl7ry6x+USj1EVmdFlLGcON5bUJM7
	 /OXmh0LEjp/2Q==
Date: Tue, 20 May 2025 15:48:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
In-Reply-To: <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505201546460.2019926@ubuntu-linux-20-04-desktop>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com> <724b77b5-3b78-436e-bd20-726c34bef03b@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, Andrew Cooper wrote:
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
> 
> The very real problem is that this doesn't run in x86 CI, because and
> only because it doesn't have an install target.

This patch has been on the list of a while. I do think that having the
x86 emulator better tested as part of the CI-loop is a priority so I am
in favor of taking the patch as is -- anything to make progress in terms
of running test_x86_emulator as part of the CI-loop.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Cheers,

Stefano

