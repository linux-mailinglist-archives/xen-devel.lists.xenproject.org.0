Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707B666E21
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475908.737805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtsA-0006Va-BS; Thu, 12 Jan 2023 09:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475908.737805; Thu, 12 Jan 2023 09:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFtsA-0006TE-8V; Thu, 12 Jan 2023 09:27:46 +0000
Received: by outflank-mailman (input) for mailman id 475908;
 Thu, 12 Jan 2023 09:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0AC=5J=citrix.com=prvs=3691819c0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pFts8-0006T8-Pv
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:27:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bac784e-925b-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 10:27:41 +0100 (CET)
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
X-Inumbo-ID: 5bac784e-925b-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673515661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U6/b6flkA/56yqLn16cctaKGuKYvZiCEN8j0e9zxTs0=;
  b=WBOGQibCVaMX2mvYt2+s6AmVEw/VOnKsGXT2rrQFHvTC3zcmoK5atbb0
   fFieBSUfa67v/4LDqZRTsF01DMnCcW4LmHMj3Lt9ORq0iFwsgtj9iJEzN
   PlV2Pleh5sWcqxjV6RE0xJo7s7tTdAyAin3KlxGMN+jzam45VpsXKv8bO
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92692561
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ED6DNaAPnDhObRVW/xTjw5YqxClBgxIJ4kV8jS/XYbTApGl00WQDn
 zQYXmGDOPjYYDfyKdwgaYXi/EkFvsCHn4RrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpB5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/+hlIUJo0
 9UhMTUPQS6S2u2H5r+eVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKEIILbH5gLxy50o
 ErP9DrnEi8QNOa99gKU6WCqp8GIoRnCDdd6+LqQqacx3Qz7KnYoIAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS8xqRw6DZ5wKYAGksTTNbbtEi8sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8hTGvPSkYK0cSaClCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgA7iaczrugt/pyi+FLovSPxqanvQysqs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZ9CIUvIT46NuhXogj1mPPBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbhGiuB2mHBjmj2DLXwe8/hA+ePADEN5tJ9faAfeBgzHxP7sTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBiba0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWceVXaMCA7M+K/NXu9xFpiVRER0Z+T8yBLSe6SAG03LvPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:8CNqCKjwWbA2GHwT0/PUpT4t8XBQXuAji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690dC7MBXhHPxOgbX5TI3CYOCOggLBRuxfBODZsl7d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQouVvJprY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.96,319,1665460800"; 
   d="scan'208";a="92692561"
Date: Thu, 12 Jan 2023 09:27:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Message-ID: <Y7/Shv1qyi0jgrai@perard.uk.xensource.com>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
 <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>

On Thu, Jan 12, 2023 at 08:46:23AM +0100, Jan Beulich wrote:
> On 11.01.2023 23:29, Andrew Cooper wrote:
> > In file included from arch/x86/hvm/hvm.c:82:
> > ./include/compat/hvm/hvm_op.h:6:10: fatal error: ../trace.h: No such
> > file or directory
> >     6 | #include "../trace.h"
> >       |          ^~~~~~~~~~~~
> > compilation terminated.
> > make[4]: *** [Rules.mk:246: arch/x86/hvm/hvm.o] Error 1
> > make[3]: *** [Rules.mk:320: arch/x86/hvm] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > 
> > 
> > All public headers use "../" relative includes for traversing the
> > public/ hierarchy.  This cannot feasibly change given our "copy this
> > into your project" stance, but it means the compat headers have the same
> > structure under compat/.
> > 
> > This include is supposed to be including compat/trace.h but it was
> > actually picking up x86's asm/trace.h, hence the build failure now that
> > I've deleted the file.
> > 
> > This demonstrates that trying to be clever with -iquote is a mistake. 
> > Nothing good can possibly come of having the <> and "" include paths
> > being different.  Therefore we must revert all uses of -iquote.
> 
> I'm afraid I can't see the connection between use of -iquote and the bug
> here.

Me neither, -iquote isn't used on that object's command line.

> > But, that isn't the only bug.
> > 
> > The real hvm_op.h legitimately includes the real trace.h, therefore the
> > compat hvm_op.h legitimately includes the compat trace.h too.  But
> > generation of compat trace.h was made asymmetric because of 2c8fabb223.
> > 
> > In hindsight, that's a public ABI breakage.  The current configuration
> > of this build of the hypervisor has no legitimate bearing on the headers
> > needing to be installed to /usr/include/xen.
> > 
> > Or put another way, it is a breakage to require Xen to have
> > CONFIG_COMPAT+CONFIG_TRACEBUFFER enabled in the build simply to get the
> > public API headers generated properly.
> 
> There are no public API headers which are generated. The compat headers
> are generate solely for Xen's internal purposes (and hence there's also
> no public ABI breakage). Since generation is slow, avoiding to generate
> ones not needed during the build is helpful.

If only we could do the generation faster:
    https://lore.kernel.org/xen-devel/20220614162248.40278-5-anthony.perard@citrix.com/
    patch which takes care of the slower part of the generation (slower
    at least for some compat headers).

Cheers,

-- 
Anthony PERARD

