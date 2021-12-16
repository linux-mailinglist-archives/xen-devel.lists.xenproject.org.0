Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1F476F88
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247870.427453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxod3-0003mb-MQ; Thu, 16 Dec 2021 11:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247870.427453; Thu, 16 Dec 2021 11:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxod3-0003kX-JL; Thu, 16 Dec 2021 11:08:53 +0000
Received: by outflank-mailman (input) for mailman id 247870;
 Thu, 16 Dec 2021 11:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2y9W=RB=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxod2-0003kR-7w
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:08:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b76311a-5e60-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:08:50 +0100 (CET)
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
X-Inumbo-ID: 8b76311a-5e60-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639652930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iZdtPj5vZ9x0d0wIZ0ocqoZnXi4nksY56Q8y+mWS9Q=;
  b=bY0DxF706XGO6AiT+z9fBLZMbPA6kzUCqYrrGU7xO/Cs2zdc9oghPE16
   GNz+QfgZ/2l/W0yURdtufGTovbUTr6zsXk/AqH7W00xqLU3dmGgoEU/oM
   e1HmovkkzQbyFOmgQNMW51kY9SdJ3jgAAq1OZWY7pXmsNyRhaMr6LApHa
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6sp4iTeQjyyOiR/ZRIuPxr0bZ3QLUELytv75XTqWgDu1L2AkptO5r6yqNsD7eKT2FI6kk0IQRh
 FX8PIZDS2vj0m8VkjOqeBq+2GkxuZ/mZh66uhWq13zJ8/Hg+fkqNGsYCdKsmdw1xpO3Jwgqq4k
 hk2V7cVBMnbFArzurNc4mO7GI1SzUIp0DhHmmNbxpEZfKSkYxq5CSzFaIVxv4RnP76qlF2Qz+K
 j7RlxEpr/sYDkMO/p6qg37LDbDF2OXvyKBlIcbTiMxj+7nh79fQ5p31ze7fyxgGIw2TZE0BPV6
 uzTu4JyiBKKvbE6AoLKAcD/A
X-SBRS: 5.1
X-MesageID: 60178587
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YsAfQamf81pnD1qs0HXUvnzo5gxVIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWG2GO66PYWuhfdp0O4vloB4Eu8LdnIc2Hlc6qSo0RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PtRka66UgokBfPRovsvUBdWDR5FE5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ66HO
 JpEOWUHgBLoMx1KKwxUNcICpty1onugVjtko3K7uv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOToOa7ol6zXcpFL
 E4Z8TZoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjJZc9knqM8eTCQnz
 EOUhMjuASFzsbqTUjSW8bL8hTm1MyIEIHQCYSIBRA0t7NzqoYV1hRXKJv5gF6ivh9GzBjD0w
 BiNtiE1g7hVhskOv4238lzKjCiljoTYRQ4yoAPMVySq6R0RTIyvapGs6FPbxe1dN4vfRV6E1
 FAPnM6Y6+ICBI+MjwSCRewMGPei4PPtGAPbhVljDpww7QOH8nSofZ1TyDxmLUIvOcEBERfjb
 VXPowpX6NlWNWGzcK5sS4urDoIhyq2IPd3hV+vIZ9tUJJZrfQmM/TpGekKbmWvqlSARfboXY
 MnBN5z2VDBDVPohnGHeq/ohPaED6Dwa92nISJ3AkQmdzoidanCLdowrCQ7bBgwm15+srALQ+
 tdZEsKFzRRDTeHzChXqHZ4vwUMidiZiW82vwyBDXqvae1c9Rjl9YxPE6ep5I9QNokhDqgvfE
 phRsGd8wUG3u3DIIB7ihptLOOK2BsYXQZ7W0EUR0beUN5oLPdbHAEQ3LcJfkVwbGApLl6Qco
 x4tIZroPxi3Ym6bkwnxlLGkxGCYSDylhBiVIw2uayUlcphrSmTho4G/L1a+r3ZeU3Dv7qPSR
 oFMMCuBG/LvoCw4U67rhA+HlQvt7RDxZsosN6c3HjWjUBq1q9U7Q8AApvQ2P9sNOX3+Ksiyj
 G6r7eMjjbCV+ecdqYCR7Yjd9tvBO7YuTyJyQjiAhZ7rZHayw4ZW6dIZOAp+VWuGDz2cFWTLT
 bg98swQx9VbxgsX6NQlTO4wpU/8jvO2z4JnIs1fNC2jRzyW5nlIexFqBOFD6f9AwKF3owyzV
 h7d89VWI+zRasjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 btzssAh9AHi2AEhNcyLj34I+j3UfGAASaguqroTHJTv1lgw0lhHbJGFUn327ZiDZs9iKE4vJ
 jPI1qPOi64FnhjJcmYpFGiL1u1Y3MxctBdPxV4EBlKIhtua2aNngEwPqWw6F10HwA9G3uR/P
 nlQG3d0fajerS11gMVjXny3H10TDhOu5UGsmUACk3fUThf0WzWVfnE9I+uE4GsQ73lYImpA5
 LidxWvoDWTqccX20ndgUEJpsaW+H9l49wmEk8G7BcWVWZI9ZGO90KOpYGMJrTrhAN8w2xKb9
 bU7or4oZP2pLzMUro06F5KehOYZRx2zLWBfRe1sofESFmbGdTDugTWDJihdoC+WyyAmJaNgN
 /FTGw==
IronPort-HdrOrdr: A9a23:W9Ke4Km360EPkFyGRSbgYjYvBk/pDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60178587"
Date: Thu, 16 Dec 2021 11:08:42 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
Message-ID: <YbseOtj7prFqViyV@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
 <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0b2eb0e2-a07f-6ba2-8f59-b7c207ed30da@suse.com>

On Tue, Dec 07, 2021 at 12:10:34PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > A subdirectory is now built by setting "$(obj)" instead of changing
> > directory. "$(obj)" should always be set when using "Rules.mk" and
> > thus a shortcut "$(build)" is introduced and should be used.
> > 
> > A new variable "$(need-builtin)" is introduce. It is to be used
> > whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> > isn't the main target anymore, and thus only needs to depends on the
> > objects that should be part of "built_in.o".
> > 
> > Introduce $(srctree) and $(objtree) to replace $(BASEDIR) in cases a
> > relative path is better, and $(abs_srctree) and $(abs_objtree) which
> > have an absolute path.
> > 
> > DEPS is updated as the existing macro to deal with it doesn't know
> > about $(obj).
> > 
> > There's some changes in "Rules.mk" which in addition to deal with
> > "$(obj)" also make it's looks more like "Makefile.build" from Linux
> > v5.12.
> > 
> > test/Makefile doesn't need special handling in order to build
> > everything under test/, Rules.mk will visit test/livepatch via
> > $(subdir-y), thus "tests" "all" and "build" target are removed.
> > "subtree-force-update" target isn't useful so it is removed as well.
> > 
> > test/livepatch/Makefile doesn't need default target anymore, Rules.mk
> > will build everything in $(extra-y) and thus all *.livepatch.
> > 
> > Adjust cloc recipe: dependency files generated by CC will now have the
> > full path to the source file, so we don't need to prepend the
> > subdirectory. This fix some issue with source not been parsed by cloc
> > before. Also source from tools/kconfig would be listed with changes in
> > this patch so adjust the find command to stop listing the "tools"
> > directory and thus kconfig. With a default build of Xen on X86, they
> > are a few new files parsed by cloc:
> >     arch/x86/x86_64/compat/mm.c
> >     arch/x86/x86_64/mm.c
> >     common/compat/domain.c
> >     common/compat/memory.c
> >     common/compat/xlat.c
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit and a remark:
> 
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -22,6 +22,15 @@ export CHECKPOLICY	?= checkpolicy
> >  export BASEDIR := $(CURDIR)
> >  export XEN_ROOT := $(BASEDIR)/..
> >  
> > +abs_objtree := $(CURDIR)
> > +abs_srctree := $(CURDIR)
> 
> Nit: In line with e.g. obj-y I think these would better be abs-srctree and
> abs-objtree.

I guess that would be fine, we don't need to keep the same spelling that
Kbuild does.

> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -80,6 +80,9 @@ endif
> >  extra-y += asm-macros.i
> >  extra-y += xen.lds
> >  
> > +# Allows usercopy.c to include itself
> > +$(obj)/usercopy.o: CFLAGS-y += -iquote .
> > +
> >  ifneq ($(CONFIG_HVM),y)
> >  $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
> >  endif
> > @@ -129,13 +132,13 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
> >  	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> >  		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
> >  		>$(@D)/.$(@F).0.S
> > -	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
> > +	$(MAKE) $(build)=$(@D) efi-y= $(@D)/.$(@F).0.o
> 
> Hmm, hasn't the efi-y= become unnecessary already by patch 6?

I think since patch 4 "build: set XEN_BUILD_EFI earlier". I'll remove
these there then.

Thanks,

-- 
Anthony PERARD

