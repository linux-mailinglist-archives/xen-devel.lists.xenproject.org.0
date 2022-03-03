Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1C4CC1B4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283479.482500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnaB-0007EB-Lp; Thu, 03 Mar 2022 15:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283479.482500; Thu, 03 Mar 2022 15:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnaB-0007Be-I7; Thu, 03 Mar 2022 15:41:35 +0000
Received: by outflank-mailman (input) for mailman id 283479;
 Thu, 03 Mar 2022 15:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylIu=TO=citrix.com=prvs=0548df38f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nPnaA-0007BY-11
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:41:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 654a6d86-9b08-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:41:32 +0100 (CET)
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
X-Inumbo-ID: 654a6d86-9b08-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646322092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xY/KKbt1ZFQSLEuxynuvlI+oXBQAH4lPJZi4p7ek0TQ=;
  b=eo3u8dNxUv3c0TmmV6/4q5kZxcpcZajg4yWDK0P/N4qnOtdlPPLVJbdR
   VZRMC998HGf1TXvqZPNlrQWen/RsqLFmaQcQFZUluVnWlAxxhbNeKrF/U
   sqKyCBfg2L1nFAgiAYfe1m/l8fZLQJ6SnJmhlcCWLlwf4H89XiVzJToY6
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65406755
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:czCoa6jfUEqlTUeiEKHpHbd2X161gRAKZh0ujC45NGQN5FlHY01je
 htvUTyCa66CNmH3c4hzbYng80gCuZfXztFrTQBqriwyF3kb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvW4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR8GE6vvlsteagFFCid9fp9+wq35LVHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2czNEqfPkAn1lE/KY4ht+6Qt3LDazhJrEvKmukR4mrJ9VkkuFTqGIWMIYHbLSlPpW6mo
 WbB83X8EwstHtWVwjqY8VqhnubK2yj8Xeo6HrCi6uRjhlHVw2UJEQAXTnOyu/z/gUm7M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwB6J4rrZ5UCeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRtrbmURHS15rqS6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vmx2BoLvHYU0M/hjOWGHm3DtDdrCpTtn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2Vd0IuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPITOvCdlyfdpUmCgHJ8OUi3yiDAdollZ
 P+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLLE+tbbArVMb1ghE9hnOkz2
 4wFXydt408CONASnwGNqdJDRbz0BSJT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLMeq/Nb4i/SNTFXF9Zj6Ahil8CbtDGY9CLvPbi5F8r7c9pRO1J
 tFYE/i97gNnEWyWq2xANsCm9OSPtn2D3GqzAsZsWxBnF7YIeuAD0oaMktfHnMXWMheKiA==
IronPort-HdrOrdr: A9a23:IMJNXq3fluYrFFRgFvQECAqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65406755"
Date: Thu, 3 Mar 2022 15:41:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 24/30] build: grab common EFI source files in arch
 specific dir
Message-ID: <YiDhpSZC1z/duG4q@perard.uk.xensource.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-25-anthony.perard@citrix.com>
 <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3bde2fea-f3fd-3926-b98d-aa0afb549bf8@suse.com>

On Thu, Mar 03, 2022 at 11:37:08AM +0100, Jan Beulich wrote:
> On 25.01.2022 12:00, Anthony PERARD wrote:
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -77,8 +77,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> >  obj-y += sysctl.o
> >  endif
> >  
> > -# Allows "clean" to descend into boot/
> > +# Allows "clean" to descend
> >  subdir- += boot
> > +subdir- += efi
> 
> No similar addition is needed for Arm?

No, because Arm already have "obj-$(CONFIG_ARM_64) += efi/", which has
the same effect on clean.

Make clean doesn't use ${ALL_OBJS} to find out which directory to clean, so
adding "subdir-" is needed at the moment.

> > --- /dev/null
> > +++ b/xen/common/efi/efi-common.mk
> > @@ -0,0 +1,15 @@
> > +EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
> > +EFIOBJ-$(CONFIG_COMPAT) += compat.o
> > +
> > +CFLAGS-y += -fshort-wchar
> > +CFLAGS-y += -iquote $(srctree)/common/efi
> > +
> > +# Part of the command line transforms $(obj) in to a relative reverted path.
> > +# e.g.: It transforms "dir/foo/bar" into successively
> > +#       "dir foo bar", ".. .. ..", "../../.."
> > +$(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> > +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
> 
> What is the "reverted" about in the comment? Also (nit) I think you want
> s/in to/into/.

I've tried to described in the single word that the result is a relative
path that goes in the opposite direction to the original relative path.
Instead of going down, it goes up the hierarchy of directories.
Maybe "reversed" would be better? Do you have other suggestion?

Thanks,

-- 
Anthony PERARD

