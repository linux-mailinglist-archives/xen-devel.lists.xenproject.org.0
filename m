Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A742BE3E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208230.364286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabxS-0007Hu-Ce; Wed, 13 Oct 2021 10:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208230.364286; Wed, 13 Oct 2021 10:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabxS-0007F8-9E; Wed, 13 Oct 2021 10:58:02 +0000
Received: by outflank-mailman (input) for mailman id 208230;
 Wed, 13 Oct 2021 10:58:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVjq=PB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mabxQ-0007F0-DG
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:58:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cef16f0-2c14-11ec-816a-12813bfff9fa;
 Wed, 13 Oct 2021 10:57:58 +0000 (UTC)
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
X-Inumbo-ID: 6cef16f0-2c14-11ec-816a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634122679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrsB4Jhdti/bqz7YcnGxLIbD/QKw3Vi96aH8IulGzpQ=;
  b=NQUZ8NHTkFK2g9qsYEcObzUuMXuPkxcIr4zmQSA0WIcNr14xVuKs0nTt
   O96p6SHJJBTpCE8ZPbWi1gH59din2J68Dk7kuvs+dLmvyfzZIUi2Ri4W/
   RTSys0YUIWQFLjpi9BEe8PpaldnsoEJqySkf9AcVsifPo9VbyE5RPgMaL
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9aw6QF7gd3EGIj02fAF/tqqup6WIU9pNfpN8wkAqF5WtwgVflP6pHAtk+gE9Dmf6GA3zdz/c7Z
 b/eER/f473kLZ7gUIsvyR9hHZjavIEyEwfTsW33cDS2z+pWkVhBnjeJ17WR7Pdd7qgc2Yjbewi
 Ck/lgLQq9g9nNBYaSgx13McUT9P5yV2oEXezsrGPC/UbCa4DJc7F9ljHgqGJvwM2veTRl+H+KN
 TO1X3nwTFiyg1Y5G4hySFDMZU4ZVp9Fyo4Udxeke621TeEQpZVca7jjRS0rTONvIclsM8RC0EA
 acGjFaTNkGN+jWcW4VqkDA4d
X-SBRS: 5.1
X-MesageID: 55475035
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zxZJPKwuugFiJ2tdgo56t+drwCrEfRIJ4+MujC+fZmUNrF6WrkVRz
 2YcWG2GMq6PNmH2f4wiPIS1o0JS6pfRy4drGQE5qyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7di2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Zxx
 Y5ilpyidSsCMPLGt/wiTRthED4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250SQquGP
 JdxhTxHYVP6ORNsFkgsI6ksmumohSbZVixhkQfAzUYwyzeKl1EguFT3C/LZddCHSt9ctlqJr
 WLBuWLiC1cVM8L34QSC9nWgl+rehxTRUYgZFKC73vNyiVjVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHKcpRsdR9p4GvU38h2Q0bHT5xuFB28CVXhKb9lOnNAybSwn0
 BmOhdyBLT1wspWFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1VLahzOhoLDZQwhz4R/YNl9J9SsgOtTjPdbxrwGGs7AQd+51U2Vto
 lACm8XFw8MOH62hvyLSSsoVI6+r3vWaZWi0bUFUI7Et8DGk+niGdI9W4S1jKEoBDvvoaQMFc
 2eI5lsPvM470G+CKPYtOdroWptCIb3ITIy9Dpjpgsxyjo+dneNt1BplYlKMxCjTmUwonLBX1
 XyzIJv0Uyhy5UiKylOLqwYhPV0Dmn5WKYD7H8mTI/GbPVy2PyH9pVAtagrmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6t95QJKrTbeFY9RAnN7sM9J5t6JOSJeIwPx4/1E
 oyVABcEmDITe1WWQel1VpyTQOy2BssuxZ7KFSctIUypyxAejXWHt88im28MVeB/roRLlKcsJ
 9FcIpnoKqkfG1zvpmVGBbGg/dMKSfherV/XV8ZTSGNkJMAIqs2g0oKMQzYDAwFXVnDp6pBk/
 +H5vu4ZKLJaLzlf4A/tQKrH5zuMUbI1woqehmPEfYteflvC6o9vJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrIDllZkEXzHYk6FELRlJnXaj8BDurcUnu1SuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4eRyo6jV28byLVVRpEyON0CENfqFoNI4Fw
 Ps6vJJE4QKIlRd3YM2NiTpZ9jrQIyVYAbknrJwTHKTilhEvlgNZeZXZByL7vMOPZtFLPhV4K
 zOYnvOf1bFVx06EeHsvD3ndm+FagM1W6hxNyVYDIXWPm8bE2aBrjEEAr2xvQ1QH1AhD3sJyJ
 nNvZh98Kqi59jt1gNROAjK3EAZbCRzFokH8xjPlToECo5VEgoAVEFAABA==
IronPort-HdrOrdr: A9a23:m0qQ/aADBMoBFhnlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55475035"
Date: Wed, 13 Oct 2021 11:57:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 24/51] build: prepare to always invoke $(MAKE)
 from xen/, use $(obj)
Message-ID: <YWa7ms9QIV4szv9x@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-25-anthony.perard@citrix.com>
 <430f6b64-e255-1250-1afb-a596a57ed1a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <430f6b64-e255-1250-1afb-a596a57ed1a9@suse.com>

On Mon, Oct 11, 2021 at 02:39:26PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > In a future patch, when building a subdirectory, we will set
> > "obj=$subdir" rather than change directory.
> > 
> > Before that, we add "$(obj)" and "$(src)" in as many places as
> > possible where we will need to know which subdirectory is been built.
> > "$(obj)" is for files been generated during the build, and "$(src)" is
> > for files present in the source tree.
> > 
> > For now, we set both to "." in Rules.mk and Makefile.clean.
> > 
> > A few places don't tolerate the addition of "./", this is because make
> > remove the leading "./" in targets and dependencies in rules, so these
> > will be change later.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Nevertheless a couple of remarks:
> 
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> >[...]
> > @@ -192,25 +192,25 @@ note_file_option ?= $(note_file)
> >  
> >  ifeq ($(XEN_BUILD_PE),y)
> >  extra-y += efi.lds
> 
> What about this? Does this for some reason also fall into the "cannot
> be converted yet" group?

$(extra-y) is treated the same way as $(obj-y), it is used to list item
to build in the current subdirectory. So there is no need to add $(obj)/

> > @@ -222,14 +222,14 @@ $(TARGET).efi: FORCE
> >  endif
> >  
> >  # These should already have been rebuilt when building the prerequisite of "prelink.o"
> > -efi/buildid.o efi/relocs-dummy.o: ;
> > +$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
> >  
> >  .PHONY: include
> >  include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
> >  
> > -asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
> > +$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
> >  
> > -$(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
> > +$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
> 
> Isn't this $(obj)/include/asm/asm-macros.h ? And in general doesn't
> use of $(BASEDIR) need to go away then, e.g. ...

I've limited this patch to add $(obj)/ and $(src)/ were needed, I think.

And yes, BASEDIR will need to go away.

> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,8 +1,8 @@
> >  obj-bin-y += head.o
> >  
> > -DEFS_H_DEPS = defs.h $(BASEDIR)/include/xen/stdbool.h
> > +DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> 
> ... here needing to become $(src)/../../../include/xen/stdbool.h ?

BASEDIR will be dealt with later.

> > --- a/xen/scripts/Makefile.clean
> > +++ b/xen/scripts/Makefile.clean
> > @@ -3,11 +3,14 @@
> >  # Cleaning up
> >  # ==========================================================================
> >  
> > +obj := .
> > +src := $(obj)
> 
> This repeats what is also getting added to Rules.mk. To prevent
> the two going out of sync, wouldn't they better live in a central
> place (e.g. scripts/defs.mk)?

It looks like they are the same but they are not, it doesn't matter if
they go out of sync, and they actually do in my patch series.

Thanks,

-- 
Anthony PERARD

