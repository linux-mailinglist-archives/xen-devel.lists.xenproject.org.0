Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA18595F7C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 17:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388364.624999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNyj2-0004jO-Ot; Tue, 16 Aug 2022 15:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388364.624999; Tue, 16 Aug 2022 15:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNyj2-0004gI-Ld; Tue, 16 Aug 2022 15:43:28 +0000
Received: by outflank-mailman (input) for mailman id 388364;
 Tue, 16 Aug 2022 15:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=REbT=YU=citrix.com=prvs=22068c4b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oNyj1-0004gC-Aq
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 15:43:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28e7e86a-1d7a-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 17:43:24 +0200 (CEST)
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
X-Inumbo-ID: 28e7e86a-1d7a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660664604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBtueJqYtZQFzrIc8uEwmlLVPAPnKkm9dfT1aLZ3RwA=;
  b=XLCXv+z4ABBPi57IpbgFopaSF/OP6EAda00G0nVZ5hz1SWmGAq6Go0CO
   aaTLRtu+2+fcY+VVvehkLxAOrrV0YVLWxQ8RsERRK6dmUVHKw0xPGYl/d
   A/tEbGqLDmeLyCWOnAneuCJfp2M2+5djVl7U8l6dL7CljGeTuSPIgfpll
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80765602
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gKmnhK8jXaAyIPLnnEo9DrUDS36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mcXUD2Oa/aLM2X1fIpwOdvlphwOvJLWytcxHFNurX88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM24qyo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGU0sPZI4D18BNH2RQ5
 c5JcHNVbxmlrrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQhiOezbYSNILRmQ+1TuxaJn
 WDbpl2pAx0IF9u+8xfb6Emz07qncSTTB9tJSezQGuRRqFee3HAJARsaE16yu+Cki1WWUshab
 UcT/0IGk68280C6S8jnaDexqnWEox00VsJZFqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S2+Z97qShSO/P24SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIaqg9yzEjH9x
 RiDti14jLIW5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhj6Vf6b8OdbuswKCq68dcsDJFTFto
 UToheDB5tlXDoqgshaTRfsdLuDxpK6EORv11AsH84Yay9i9x5KyVdkOvmkgfx01Y5tslSzBO
 xGK514IjHNHFD7zNPIsPdrsYyg/5fK4fekJQMw4eTanjnJZUAactB9jakeLt4wGuBh9yPpvU
 Xt3nCvFMJr7NUiE5GDvLwvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3a+FiFo
 4gHaZDRm32ztdEShQGGmbP/0HhQdSRrbXwIg5Y/mhG/zvpORzh6Vq65LUIJcI15haVF/tr1E
 oWGchYBkDLX2CyYQThmn1g5N9sDq74j8i9gVcHtVH70s0UejXGHtf1PKcNmLeh/nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41MfERcKQKmMyXuD+z
IronPort-HdrOrdr: A9a23:uMFhsa3U3COiHU2KxySUJwqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.93,241,1654574400"; 
   d="scan'208";a="80765602"
Date: Tue, 16 Aug 2022 16:43:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Message-ID: <Yvu7Dpl5Pq/E8MxA@perard.uk.xensource.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>

On Tue, Aug 16, 2022 at 03:02:10PM +0200, Jan Beulich wrote:
> On 16.08.2022 12:30, Anthony PERARD wrote:
> > We can't have a source file with the same name that exist in both the
> > common code and in the arch specific code for efi/. This can lead to
> > comfusion in make and it can pick up the wrong source file. This issue
> > lead to a failure to build a pv-shim for x86 out-of-tree, as this is
> > one example of an x86 build using the efi/stub.c.
> > 
> > The issue is that in out-of-tree, make might find x86/efi/stub.c via
> > VPATH, but as the target needs to be rebuilt due to FORCE, make
> > actually avoid changing the source tree and rebuilt the target with
> > VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
> > exist yet so a link is made to "common/stub.c".
> > 
> > Rework the new common/stub.c file to have a different name than the
> > already existing one. And build both *stub.c as two different objects.
> > This mean we have to move some efi_compat_* aliases which are probably
> > useless for Arm.
> 
> These useless aliases want avoiding there imo. Already when the original
> series was discussed, I requested to avoid introduction of a file named
> common-stub.c or alike.

Yeah, I've notice that. This is why the build is broken under
specific condition.

> If names need to be different, can't we follow
> boot.c's model and introduce a per-arch efi/stub.h which stub.c would
> include at a suitable position (and which right now would be empty for
> Arm)?

That seems to be possible. But how is it better than having two
different source file? The only thing is to avoid exporting the
efi_compat_* symbol aliases. The downside is we would have another weird
looking not really header which is actually just part of a source file.
At least, "stub.c" and "stub.h" would be two different names, we just
change the extension rather than the basename.

Cheers,

-- 
Anthony PERARD

