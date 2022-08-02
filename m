Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E45880D0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 19:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379431.612882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIvP1-0001rG-JM; Tue, 02 Aug 2022 17:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379431.612882; Tue, 02 Aug 2022 17:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIvP1-0001pP-Gb; Tue, 02 Aug 2022 17:09:55 +0000
Received: by outflank-mailman (input) for mailman id 379431;
 Tue, 02 Aug 2022 17:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIvOz-0001pJ-K4
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 17:09:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b34650-1285-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 19:09:50 +0200 (CEST)
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
X-Inumbo-ID: e9b34650-1285-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659460191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OcMHynZWuBZCNWlcQtCalAmfZOlQ5iTuY2VPgnnjbJ0=;
  b=Haf8sy828JreY0TEkjZsvHpd4NB3HZ3KWrQYCDT4pCU30/wqyyQhLjNp
   tD4NvIBFzDISaemifQS7I2Begn9SBXhKyUeDx3d/DPUF6YDasRfMFALPG
   1xCpaxFncw103AE924vpJPuWxSW0Km7bPVThDVNSrfY4znphv2RDNgXhL
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77636045
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vjCRj6iMFHoBB5re4VcTRXzEX161cBAKZh0ujC45NGQN5FlHY01je
 htvWWCAOf/ZZTemeox1PN61oBlT7J+GnNcxQFc5rSs2RSkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSq4mtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eM6Qy/L4vJG5yz
 98SAzc8KQishumW3+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyb4SOJITWGK25mG6Ct
 2zk4HzJCSgwbuyj+RGu0n+Og+HAyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf13rWJqTK/PwAFIGlEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiEhQI43+02gvIx9K+Q+mGAmx2trbjWG1tdChrsYo610u9oTNf7Ot30sQWCsKwowJWxFQfY4
 iVd8ySKxKVXVMzWynTQKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOwFCHzBUOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6wwRNzwPlmY
 sbKKK5A6Er27ow+lVKLqxo1i+d3lkjSO0uJLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5nekhy
 P4GbpPi40gOD4XDjtz/q9F7waYicSdmXvgbaqV/Koa+H+aRMDt+W6eAkO98K90NcmY8vr6gw
 0xRk3RwkDLX7UAr4y3RMhiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:Q0UzC6PaFSv8BsBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.93,211,1654574400"; 
   d="scan'208";a="77636045"
Date: Tue, 2 Aug 2022 18:09:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Message-ID: <YulaTPhEf8Mp+p0q@perard.uk.xensource.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-7-anthony.perard@citrix.com>
 <d917d9a6-5ab7-f826-21e0-2c95b4614f9c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d917d9a6-5ab7-f826-21e0-2c95b4614f9c@suse.com>

On Mon, Jul 11, 2022 at 04:08:55PM +0200, Jan Beulich wrote:
> On 24.06.2022 18:04, Anthony PERARD wrote:
> > --- a/tools/fuzz/x86_instruction_emulator/Makefile
> > +++ b/tools/fuzz/x86_instruction_emulator/Makefile
> > @@ -8,33 +8,27 @@ else
> >  x86-insn-fuzz-all:
> >  endif
> >  
> > -# Add libx86 to the build
> > -vpath %.c $(XEN_ROOT)/xen/lib/x86
> > +cpuid.c: %: $(XEN_ROOT)/xen/lib/x86/% FORCE
> > +	ln -nsf $< $@
> 
> I guess the idea with the original construct was to allow using further
> source files from libx86 with as little code churn as possible. Your
> change now requires two more lines to be touched. As long as we avoid
> name collisions in the various directories (wrapper.c and a few more
> files come from yet somewhere else), couldn't this rule simply be
> 
> %.c: $(XEN_ROOT)/xen/lib/x86/%.c FORCE
> 	ln -nsf $< $@
> 
> ?

Sounds good.

> > -x86_emulate:
> > -	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
> > +x86_emulate: FORCE
> > +	ln -nsf $(XEN_ROOT)/xen/arch/x86/$@
> >  
> >  x86_emulate/%: x86_emulate ;
> >  
> > -x86-emulate.c x86-emulate.h wrappers.c: %:
> > -	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*
> > +x86-emulate.c x86-emulate.h wrappers.c: %: $(XEN_ROOT)/tools/tests/x86_emulator/% FORCE
> > +	ln -nsf $< $@
> 
> And similarly
> 
> %.c: $(XEN_ROOT)/tools/tests/x86_emulator/%.c FORCE
> 	ln -nsf $< $@
> 
> %.h: $(XEN_ROOT)/tools/tests/x86_emulator/%.h FORCE
> 	ln -nsf $< $@
> 
> here? (I'm hesitant to suggest plain %, i.e. without the filename
> suffixes, as that would likely be at least confusing for Makefile.)

Will do.

> > @@ -67,3 +61,5 @@ afl: afl-harness
> >  
> >  .PHONY: afl-cov
> >  afl-cov: afl-harness-cov
> > +
> > +-include $(DEPS_INCLUDE)
> 
> I would expect doing so was avoided for some reason. Albeit it may
> well be that too much cloning of tests/x86_emulator was done here,

There's quite a few places in tools/ where "-include $(DEPS_INCLUDE)" is
missing, so I kind of expect it to be forgotten rather than avoided on
purpose.

> and it's all fine this way. Can you confirm things to work when
> building locally in just this subdir, e.g. via
> 
> make -sC .../tools/fuzz/x86_instruction_emulator CC=/build/afl/2.52b-base/afl-gcc
> 
> ?

Yes, that still works. But I'm not sure why you would ask since the
tools/ build system works this way, execution of make in a subdir
doesn't depends on the execution from the parent dir (it doesn't
depends on anything in the envvar).

Thanks,

-- 
Anthony PERARD

