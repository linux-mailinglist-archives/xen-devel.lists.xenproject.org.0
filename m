Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237D42F975
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210976.368032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQXz-0000xd-UB; Fri, 15 Oct 2021 16:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210976.368032; Fri, 15 Oct 2021 16:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQXz-0000vs-Qc; Fri, 15 Oct 2021 16:59:07 +0000
Received: by outflank-mailman (input) for mailman id 210976;
 Fri, 15 Oct 2021 16:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbQXy-0000vm-Lv
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:59:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd9ae0da-9023-48d0-94f0-081d59450ab9;
 Fri, 15 Oct 2021 16:59:04 +0000 (UTC)
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
X-Inumbo-ID: bd9ae0da-9023-48d0-94f0-081d59450ab9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634317144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jBZndRRIyTWDv3s8jOCkMrX0hwxt3EJUrDq+/4qMEQs=;
  b=SaL/+EJG1LF+eM2aCSAuSQah7zDLm+ZXe15MuXBsYB7wOBXC88rhMgz6
   7n8qR2Ezt9E1KJW3tVZUN2o0CElx+hzqNY5ohjhiFLHcMk/8zkZmlMkco
   Mr7QILat1c4+Kgp9KcWamM/h9rO7F87uHf4JhzsbzCwNrasvl5Gs7lx4Y
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aOT8yUw6daduCZ7a82yy0Gf/AQsvQAhTmVdaBXu1VOxI+Mo2DCshT7qMJb/6K7sFiLnlr4YXQN
 IUwNTZKaO/2aHcKMdsFNG0lWTaTR7j9M/uelx2szjpGlTcIVBvmfSvmQwnPMBGgydKz12NB9UF
 3E5ixRI9nllDOBE+1YQgqCTP8DSUJPqLNj7l5b4nsll/2MHojqsHs7LTtL1PEFRDFwG2A0DScJ
 VZHcJvgETpEkRTQ/aflLSXIPq5t8hO4FZfu6RHBTUK3nuUhcG9qcgNaZTzV3hOXxqNBuTvrxZK
 X5OVIDxm3Vkn2jCNODbfHYq6
X-SBRS: 5.1
X-MesageID: 55337302
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TmheZ6w4jlZ5/eei0mJ6t+dDwCrEfRIJ4+MujC+fZmUNrF6WrkVRm
 mJKDGiAPP+KZTf1fIwjaN+wpk8OvJKEm99kHVRl+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+tzx
 Phvsp+McAA0P7PIgMREazNnIz4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250VRqmFP
 5BxhTxHbgbZaD5GeXYuMYMkkeSjo1DRfiNYpwfAzUYwyzeKl1EguFT3C/LWfdqQTMkTgUecp
 UrB5W3yBhxcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+WVS3rPajg2aiStlfL
 AoS4SNooq8snGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjJZc9knqM8eTCQnz
 EOUhMjuASFzsbqTUjSW8bL8hTKtOwAFIGkafygGQAAZpd75r+kbjBjCU9JiG66dlcDuFHf7x
 DXihCojg7Qei+Yb2qP9+krI6xqzorDZQwhz4R/YNkq+9R9wboOhY42u6HDY4OxGIYLfSUOO1
 EXogODHsrpIV8vU0nXQHqNdR9lF+sppLhXng1JCPZ4iyw2q5n+9eZhwuQlUG3d2Z5NslSDSX
 GffvgZY5Zl2NXSsbLNqb4/ZN/nG3ZQMBvy+CaiKNosmjoxZMVbdpnk3NBH4M3XFyRB0yckC1
 YGnndFA5JrwIZ9syyaqXK8j2LsvyzFWKYj7FM2jkUrPPVZzYheopVY53LmmMr9RAECs+ly9H
 zNj2y2ikEg3vArWOHi/zGLrBQpWRUXX/LivwyCtSsaNIxB9BEYqAOLLzLUqduRNxvoOyr2Tp
 CrgAx8CljITYEErzy3RNxiPj5u0Bf5CQY8TZ3RwbT5EJVByCWpQ0EvvX8RuJuR2nACS5fV1U
 +MEa6297gdnEVz6F8AmRcCl9uRKLU3z7SrXZnbNSGVvLvZIGl2Skve5L1SHycX7Jnfu3SfIi
 +b7jV2zrFtqb1kKMfs6n9r0kQ7v5yFGxr8rN6YKS/EKEHjRHEFRA3SZppcKzwskc30vHxOWi
 FSbBwk2v+7Ir9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7IA4Vm2V
 0uD98N0I7KMPM+5QlcdKBB8NraI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsom
 L5zttQX5gqzjgsRHuyH1i0EpX6RKnEgUrk8ss1ICoHclQd2mEpJZobRC3Gq7cjXOclMKEQjP
 hSdmLHG2+ZH3kPHfnc+SSrN0O5aichcsRxG1gZfdVGAm96Djf4rxhxBtz8wS10NnBlA1utyP
 EltNlF0evrSr2s52pAbUjD+ARxFCT2Y5lf1mgkAm2DuRkW1UnDAcT8mMuGX8UFFq29Rc1C3J
 l1DJLoJhdoyQPzM4w==
IronPort-HdrOrdr: A9a23:8mhadaOLGLTQXsBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="55337302"
Date: Fri, 15 Oct 2021 17:58:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the
 xen build
Message-ID: <YWmzSkLdH5wtQ77V@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com>

On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > This implement out-of-tree support, there's two ways to create an
> > out-of-tree build tree (after that, `make` in that new directory
> > works):
> >     make O=build
> >     mkdir build; cd build; make -f ../Makefile
> > also works with an absolute path for both.
> > 
> > This implementation only works if the source tree is clean, as we use
> > VPATH.
> > 
> > This patch copies most new code with handling out-of-tree build from
> > Linux v5.12.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  xen/Makefile                | 173 +++++++++++++++++++++++++++++-------
> >  xen/Rules.mk                |  11 ++-
> >  xen/arch/arm/efi/Makefile   |   3 +
> >  xen/arch/x86/arch.mk        |   3 +
> >  xen/arch/x86/boot/Makefile  |   5 +-
> >  xen/arch/x86/efi/Makefile   |   3 +
> >  xen/include/Makefile        |   9 +-
> >  xen/scripts/mkmakefile      |  17 ++++
> >  xen/test/livepatch/Makefile |   2 +
> >  xen/xsm/flask/Makefile      |   3 +
> >  xen/xsm/flask/ss/Makefile   |   3 +
> >  11 files changed, 194 insertions(+), 38 deletions(-)
> >  create mode 100755 xen/scripts/mkmakefile
> 
> Linux have done away with this script just recently; I don't think we
> should introduce it.

Will change.

> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -1,3 +1,7 @@
> > +# $(lastword,) for GNU Make older than 0.81
> 
> DYM 3.81?

Yes.

> > +lastword = $(word $(words $(1)),$(1))
> > +this-makefile := $(call lastword,$(MAKEFILE_LIST))
> 
> Oh - is it documented somewhere that this would always be last?

Yes, it is even in Make's documentation about the variable:
    "if the first thing a makefile does is examine the last word in this
    variable, it will be the name of the current makefile."
    (taken from Make 3.80 documentation)

> > @@ -17,33 +21,18 @@ export XEN_BUILD_HOST	?= $(shell hostname)
> >  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
> >  export PYTHON		?= $(PYTHON_INTERPRETER)
> >  
> > -export XEN_ROOT := $(CURDIR)/..
> > +$(if $(filter __%, $(MAKECMDGOALS)), \
> > +	$(error targets prefixed with '__' are only for internal use))
> >  
> > -srctree := .
> > -objtree := .
> > -export srctree objtree
> > +# That's our default target when none is given on the command line
> > +PHONY := __all
> > +__all:
> >  
> >  # Do not use make's built-in rules and variables
> >  MAKEFLAGS += -rR
> >  
> >  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
> >  
> > -ARCH=$(XEN_TARGET_ARCH)
> > -SRCARCH=$(shell echo $(ARCH) | \
> > -          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> > -              -e s'/riscv.*/riscv/g')
> > -export ARCH SRCARCH
> > -
> > -# Don't break if the build process wasn't called from the top level
> > -# we need XEN_TARGET_ARCH to generate the proper config
> > -include $(XEN_ROOT)/Config.mk
> > -
> > -# Set ARCH/SUBARCH appropriately.
> > -export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
> > -export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> > -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> > -                                -e s'/riscv.*/riscv/g')
> > -
> >  # Allow someone to change their config file
> >  export KCONFIG_CONFIG ?= .config
> 
> Would it be possible to split off some of the pure movement of pieces,
> to make it easier to see what (if anything) is actually changed at the
> same time as getting moved?

I'll give it a try.

> > @@ -51,14 +40,9 @@ export CC CXX LD
> >  
> >  export TARGET := xen
> >  
> > -.PHONY: default
> > -default: build
> > -
> >  .PHONY: dist
> >  dist: install
> >  
> > -include scripts/Kbuild.include
> > -
> >  ifneq ($(root-make-done),y)
> >  # section to run before calling Rules.mk, but only once.
> >  
> > @@ -130,14 +114,93 @@ endif
> >  
> >  ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> >      quiet := silent_
> > +    KBUILD_VERBOSE = 0
> >  endif
> 
> In how far is this related here? Doesn't this belong in an earlier patch?

That probably belong to a patch that have been committed some time ago,
and I've notice it was missing when comparing our makefile to Linux's
one. (Or maybe it wasn't set as well in Linux originally). I'll look if
that can be added to another patch, or just have a patch for this single
line.

> > --- a/xen/Rules.mk
> > +++ b/xen/Rules.mk
> > @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
> >                           $(foreach r,rel rel.ro,data.$(r).local)
> >  
> >  # The filename build.mk has precedence over Makefile
> > -mk-dir := $(src)
> > +mk-dir := $(srctree)/$(src)
> >  include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
> 
> Perhaps already when it was changed to $(src) the name has become
> slightly misleading, at least imo: I would rather expect a variable
> with this name to refer to the build dir/tree. Maybe "srcdir" or
> even shorted "sd" right from the start? (Reaching here I can finally
> see why having a shorthand is helpful.)

I have to think about that. I've made some further progress in order to
be able to build the Xen pvhshim without a link farm and notice that
nearly every source file needs to use "$(srctree)/$(src)" and I'm not
sure "$(src)" could be use alone. So having a single variable which have
both would be useful.

"srcdir" might be to close to "srctree" and one might mistake it for the
other, so "sd" might be better.

> > --- a/xen/arch/x86/efi/Makefile
> > +++ b/xen/arch/x86/efi/Makefile
> > @@ -1,5 +1,8 @@
> >  CFLAGS-y += -fshort-wchar
> >  CFLAGS-y += -I$(srctree)/common/efi
> > +ifdef building_out_of_srctree
> > +CFLAGS-y += -I$(srctree)/$(src)
> > +endif
> 
> At the example of this (where perhaps -iquote could be used again) - is
> it strictly necessary to have the ifdef-s around such? I.e. would things
> fail to work for an in-tree build without them?

ifdef isn't really necessary, gcc always check that directory first
anyway (for quote-included headers), so it is just a duplicate of gcc's
path list, but it would work fine. So I'll remove the ifdef.

> > --- a/xen/xsm/flask/ss/Makefile
> > +++ b/xen/xsm/flask/ss/Makefile
> > @@ -9,3 +9,6 @@ obj-y += conditional.o
> >  obj-y += mls.o
> >  
> >  CFLAGS-y += -I$(srctree)/xsm/flask/include
> > +ifdef building_out_of_srctree
> > +    CFLAGS-y += -I$(objtree)/xsm/flask/include
> 
> There's no header in $(srctree)/xsm/flask/include in this case, so if you
> use "ifdef" here, shouldn't that other part move into an "else"?

Actually, there are headers in the source, like "security.h", and `git
ls-files xen/xsm/flask/include` shows plenty other headers.

Thanks,

-- 
Anthony PERARD

