Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F742C310
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208551.364720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafBp-0007Ju-1b; Wed, 13 Oct 2021 14:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208551.364720; Wed, 13 Oct 2021 14:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafBo-0007I2-Ue; Wed, 13 Oct 2021 14:25:04 +0000
Received: by outflank-mailman (input) for mailman id 208551;
 Wed, 13 Oct 2021 14:25:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVjq=PB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mafBo-0007Hw-4F
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:25:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a3a0cc8-2c31-11ec-8179-12813bfff9fa;
 Wed, 13 Oct 2021 14:25:02 +0000 (UTC)
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
X-Inumbo-ID: 5a3a0cc8-2c31-11ec-8179-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634135102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5VMgU++AcV1NSou5mqA5ZYMDczNw6Z6uZespVrkwy4I=;
  b=ZnMXQHGKWFNUfq4+pEbpuhE1Cn9RMkfzIPDEdLLleM+IQ4UFyPB1O6jF
   eUJ0P82HLZ/nGlrubBpbaNNJFs1FrC/WBR3GxeM1HpqvLuXFRYu3IoTUq
   T7IDpxTTXOgBriZpq8yP4ZjhXJtPkMm8DxhvqJE+PbGfecJb0Nv1HSwWG
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8MSeASiiazzLHz1KZn5ph61EQpSSrFniqXEDOd1Wh87snfxyfXxXvdvfIRhfOxybEOtMpVygKV
 yILu8luaGBeVaG9WEGHRPuMewrGMIR6nii7yMHomN32IiUzfMSR/ZmyEBNfi4cPebw4+BSviZV
 Gyi9np3qG0zaaUwb+eYnyXOcQRVlXMkTrAQrK2yloKDiEJKWCOwFPnHep8ef6obvjhJcredkyK
 6WBnxvmlqe2IWtUO4sCYJEN6+1Bw0DCGYHxYiIudW5UqrErgkKI5PETJ/rOhhJJYK6bI0BJBol
 67t2sBlp+5K1S9VJR0M6oc//
X-SBRS: 5.1
X-MesageID: 54665630
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Tw/P7qPZ+uSDGj/vrR2bkcFynXyQoLVcMsEvi/4bfWQNrUoigWRUn
 TYeWmCAPv7bN2GnLd52Oom3oxsCvZGEztZkGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us4w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozWCvv9a4
 Y1Uj4KxdwAxG6bo2+4kWAYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWtu2J0QRq62i
 8wxTjtSUhnAQUB1JXQRDYknm7/2iienSmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywyeDGIVQyVBbNEjvckeSjkj1
 1vPlNTsbRRRt7mSRWOY562jhzq4MigILkcPfSYBCwAC5rHLo4Y1lBvDCMliFK2dicf8EjX9h
 TuNqUAWi7ofgMER3o2n7FvHhHSqvZGPQQkrji3VVG+46gJyZKa+epelr1Pc6J5oIJ6CS1idv
 FANg8WE8P0VFpaJiTCMR+MWWrqu4p6tOTndmkJmHoNn+S6k/XWiZqhP7Do4L0BsWu4PfjnvZ
 03fsB1Q/7dcOXKrael8ZIfZNigx5fG+T5K/DKmSN4cQJMgqHOOawM1wTU6b/k/GuRA1q78+B
 5CDVM2ITnwjArsymVJaWNwh+bMswyk/w0baSpb60wmr3NKiWZKFdVsWGADRNr5hvctotC2Qq
 owFb5LblH2zRcWnOnGPmbP/O2zmOpTS6XrekMdQavKYajRvHGUsGpc9KptwJtQ7wcy5egrOl
 0xRu3O0KnKj2xUryi3QMxiPjY8Du74k8hrX2gR2bD6VN4ALO9rH0UvmX8JfkUMb3OJi1+Voa
 PIOZt+NBP9CIhyepW9BNceh9tQ4KE/37e5rA8ZDSGNgF3KHb1aYkuIIgyO1rHVeZsZJnZpWT
 0KcOvPzHsNYGlUK4Df+Y/Oz1VKh1UXxa8opN3Yk1uJ7IR22mKAzcnSZpqZuf6kkdEWSrhPHh
 l3+KUpJ+oHwT3odrYChaVas9NzyTYOT3yNyQgHm0FpBHXCCpDT8mtUcDL/gkPK0fDqcxZhOr
 N59l5nUWMDrVn4T22alO7o0n684+fX1oLpWklZtEHnRNgz5AbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWsaY/LnLl6XIl57GAS0hTYUWB0XQPMLtvPYo56
 u49o8pKuRengx8nP4/e3CBZ/miBNFIaVKAjus1ICYPnkFNzmFpDfYbdGmn955TWM4dANUwjI
 zm1gqvehusDmhqeIiRrTXWUhLhTn5UDvhxO3WQuHVXRl4qXnOIz0T1Q7S8zElZfwCJY3r8hI
 WNsLUB0e/mDpm86mMhZUmmwMAhdHxnFqFfpwl4EmWCFHUmlUmvBcD80NeqXpR1L9mtden5Q/
 a2CyXajWjHvJZmj0iw3UE9jivriUd0uqVGSxJH5R5yIT8sgfD7ooq6yfm5Z+RLoDPQ4iFDDu
 eQ3rv17brf2NHJIrqA2Y2VAOW/8lPxQyLR+fMxc
IronPort-HdrOrdr: A9a23:dTcFn6ipxPhaHQ4t/K1pNh7cHHBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="54665630"
Date: Wed, 13 Oct 2021 15:24:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 26/51] build: build everything from the root dir,
 use obj=$subdir
Message-ID: <YWbsGlcDZSSXsJlx@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-27-anthony.perard@citrix.com>
 <eca3f533-9841-e4a8-dfde-840451ed8aef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eca3f533-9841-e4a8-dfde-840451ed8aef@suse.com>

On Mon, Oct 11, 2021 at 04:02:22PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > A subdirectory is now built by setting "$(obj)" instead of changing
> > directory. "$(obj)" should always be set when using "Rules.mk" and
> > thus a shortcut "$(build)" is introduced and should be used.
> > 
> > A new variable "$(need-builtin)" is introduce. It is to be used
> > whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> > isn't the main target anymore, and thus only needs to depends on the
> > objects that should be part of "built_in.o".
> 
> How "good" are our chances that we hit a need-builtin variable from
> the environment? Its uses are simply using "ifdef".

I think it would be low as Linux is using the same one. If it were
define, I think that would mean building a few more object than
expected which would not be used.

> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -3,19 +3,29 @@
> >  # Makefile and are consumed by Rules.mk
> >  #
> >  
> > -obj := .
> >  src := $(obj)
> >  
> > +PHONY := __build
> > +__build:
> > +
> >  -include $(BASEDIR)/include/config/auto.conf
> >  
> >  include $(XEN_ROOT)/Config.mk
> >  include $(BASEDIR)/scripts/Kbuild.include
> >  
> > +ifndef obj
> > +$(warning kbuild: Rules.mk is included improperly)
> > +endif
> 
> Is there a particular reason for this to come only here, rather than
> before the include-s (e.g. right at where the assignment to the
> variable lived)?

Probably not, Linux's Kbuild does check it quite late but I don't know the
reason. I can move the check earlier.

> > @@ -51,27 +61,54 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
> >  quiet_cmd_binfile = BINFILE $@
> >  cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
> >  
> > -define gendep
> > -    ifneq ($(1),$(subst /,:,$(1)))
> > -        DEPS += $(dir $(1)).$(notdir $(1)).d
> > -    endif
> > -endef
> > -$(foreach o,$(filter-out %/,$(obj-y) $(obj-bin-y) $(extra-y)),$(eval $(call gendep,$(o))))
> > +# Figure out what we need to build from the various variables
> > +# ===========================================================================
> > +
> > +# Libraries are always collected in one lib file.
> > +# Filter out objects already built-in
> > +lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
> > +
> > +# Subdirectories we need to descend into
> > +subdir-y := $(subdir-y) $(patsubst %/,%,$(filter %/, $(obj-y)))
> 
> Deliberately or accidentally not += ?

Seems to be accidentally. Kbuild does a $(sort ) here, I should probably
do the same, just to get rid of duplicates if they are any.

> > @@ -156,21 +192,13 @@ endif
> >  PHONY += FORCE
> >  FORCE:
> >  
> > -%/built_in.o %/lib.a: FORCE
> > -	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
> > -
> > -%/built_in_bin.o: FORCE
> > -	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in_bin.o
> > -
> > -SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
> > -
> >  quiet_cmd_cc_o_c = CC      $@
> >  ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
> >      cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
> >      ifeq ($(CONFIG_CC_IS_CLANG),y)
> > -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
> > +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
> 
> Are you sure about the $< => $(<F) transformation here? Previoiusly it
> was present only ...

I have to check again. Maybe $< didn't work and it's more obvious with
this patch. Or maybe that depends on the version of clang.

> >      else
> > -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
> > +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
> 
> ... here.
> 
> > @@ -251,6 +292,9 @@ existing-targets := $(wildcard $(sort $(targets)))
> >  
> >  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> >  
> > +DEPS:= $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).d)
> 
> Nit: Preferably blanks on both sides of := or none at all, please.

Will fix.

> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -81,6 +81,9 @@ endif
> >  extra-y += asm-macros.i
> >  extra-y += xen.lds
> >  
> > +# Allows usercopy.c to includes itself
> 
> Nit: include

Indeed.

> > +$(obj)/usercopy.o: CFLAGS-y += -I.
> 
> This is ugly, but presumably unavoidable. Preferably I would see us
> the more specific -iquote though, assuming clang also supports it.

clang does have -iquote, so I guess it could be used. That would be the
first use of -iquote so I hope nothing would break with it.

> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,8 +1,8 @@
> >  obj-bin-y += head.o
> >  
> > -DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> > +DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> >  
> > -CMDLINE_DEPS = $(DEFS_H_DEPS) $(src)/video.h
> > +CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h
> 
> Hmm, new uses of $(BASEDIR) (a few more further down). Why not
> $(srctree)?

I think I haven't introduce $(abs_srctree) yet, and this needs to be an
absolute path (the path is also used by a make which run from a
different current directory).

Thanks,

-- 
Anthony PERARD

