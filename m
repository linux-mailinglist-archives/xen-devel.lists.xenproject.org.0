Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462A4CC151
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283456.482466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnQQ-0004NI-3Y; Thu, 03 Mar 2022 15:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283456.482466; Thu, 03 Mar 2022 15:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnQQ-0004LH-0I; Thu, 03 Mar 2022 15:31:30 +0000
Received: by outflank-mailman (input) for mailman id 283456;
 Thu, 03 Mar 2022 15:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylIu=TO=citrix.com=prvs=0548df38f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nPnQO-0004L9-Tn
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:31:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcfc295c-9b06-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:31:27 +0100 (CET)
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
X-Inumbo-ID: fcfc295c-9b06-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646321487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UyTSuw+sR3tfyMe/Qualcrjci7L1aY4CZDh2HiALVkM=;
  b=IQ0Mv9SOP9Ft07qirgMLjbmhirhA0tlRjUTujouMdtJzr9pD4MtwEBVi
   QOFo0/9vtwxsibHxMq7BwmyzSfFGI++01/7oP64M68w5y9RxlZJbzKsTp
   H8hAHwd1PAn64gdA44Gdq5L0Q0RFRmQOSS3GLCasllhjgP0aFuwtuTPg7
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64867392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ff0gS6+JxaQuGDBiQtz+DrUDq36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WseCm/UOK6JMGqgKNBybt++pEJS7cOHm9BgQQZs+ys8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDiW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncy0UQVuO5H2orw2DwB5GQxeEJBC1rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZZJN2U0PU6ojxtnYXQsKaIxre2Tv1bcdjoHpFarqvtoyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IAYNSVKxrP29i0i/c9FSM
 UoZ/mwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1prOMr3S3BRIvdURefA4OYCso3t3Nr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNP9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyR/HNFBz3ohZPmLy8Bhkkfi+F1e5eJFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMQvLlPZoHA1OhPJt4wIrKTKuftlU
 Xt8WZzxZUv29Iw9lGbmLwvj+eVDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/qNdDRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwkwKu1SWaclzRMhiOqtrHBP5CkJ7yBgR0VX7A5pTpSd/HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:7tfy3KofGjYK10ZUPQlIbTQaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="64867392"
Date: Thu, 3 Mar 2022 15:31:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 23/30] build,x86: remove the need for build32.mk
Message-ID: <YiDfSm9yDmp1waJK@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-24-anthony.perard@citrix.com>
 <2d0bed19-bf52-e934-0a5a-c424ff6e4db0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2d0bed19-bf52-e934-0a5a-c424ff6e4db0@suse.com>

On Thu, Mar 03, 2022 at 11:29:36AM +0100, Jan Beulich wrote:
> On 25.01.2022 12:00, Anthony PERARD wrote:
> > Rework "arch/x86/boot/Makefile" to allow it to build both file
> > "cmdline.S" and "reloc.S" without "build32.mk".
> > 
> > These will now use the main rules for "%.o: %.c", and thus generate a
> > dependency file. (We will not need to track the dependency manually
> > anymore.)
> > 
> > But for that, we need to override the main CFLAGS to do a 32bit build.
> > We introduce XEN_TREEWIDE_CFLAGS which can be reused in boot/Makefile,
> > and avoid the need to reparse Config.mk with a different value for
> > XEN_TARGET_ARCH. From this new $(XEN_TREEWIDE_CFLAGS), we only need to
> > change -m64 to have the 32bit flags. Then those are applied only to
> > "cmdline.o" and "reloc.o".
> > 
> > Specifically apply the rule "%.S: %.bin" to both cmdline.S and reloc.S
> > to avoid make trying to regenerate other %.S files with it.
> > 
> > There is no change expected to the resulting "cmdline.S" and
> > "reloc.S", only the *.o file changes as their symbol for FILE goes
> > from "cmdline.c" to "arch/x86//cmdline.c". (No idea why "boot" is
> > missing from the string.) (I've only check with GCC, not clang.)
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one question, just to be sure I understand things right:
> 
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,25 +1,42 @@
> >  obj-bin-y += head.o
> > +head-srcs := cmdline.S reloc.S
> >  
> > -DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
> > +nocov-y += $(head-srcs:.S=.o)
> > +noubsan-y += $(head-srcs:.S=.o)
> > +targets += $(head-srcs:.S=.o)
> >  
> > -CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
> > -	       $(BASEDIR)/include/xen/kconfig.h \
> > -	       $(BASEDIR)/include/generated/autoconf.h
> > +head-srcs := $(addprefix $(obj)/, $(head-srcs))
> >  
> > -RELOC_DEPS = $(DEFS_H_DEPS) \
> > -	     $(BASEDIR)/include/generated/autoconf.h \
> > -	     $(BASEDIR)/include/xen/kconfig.h \
> > -	     $(BASEDIR)/include/xen/multiboot.h \
> > -	     $(BASEDIR)/include/xen/multiboot2.h \
> > -	     $(BASEDIR)/include/xen/const.h \
> > -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> > +$(obj)/head.o: $(head-srcs)
> >  
> > -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> > +CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
> > +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> > +CFLAGS_x86_32 += -I$(srctree)/include
> >  
> > -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> > -	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> > +# override for 32bit binaries
> > +$(head-srcs:.S=.o): CFLAGS_stack_boundary :=
> 
> You overriding CFLAGS_stack_boundary but not object_label_flags is
> merely because the latter has no (unwanted) effect on the compilation?

Yes.

Thanks,

-- 
Anthony PERARD

