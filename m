Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA085EA759
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 15:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411823.654900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoF6-00070i-4S; Mon, 26 Sep 2022 13:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411823.654900; Mon, 26 Sep 2022 13:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocoF6-0006yj-13; Mon, 26 Sep 2022 13:33:52 +0000
Received: by outflank-mailman (input) for mailman id 411823;
 Mon, 26 Sep 2022 13:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/6f=Z5=citrix.com=prvs=2614d53bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ocoF4-0006yd-MH
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 13:33:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d93f48dc-3d9f-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 15:33:48 +0200 (CEST)
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
X-Inumbo-ID: d93f48dc-3d9f-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664199228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+iWJh2teJfYo5bZzC6wUGDe2pUONmfdEHqMUy5eWPPQ=;
  b=MLdfO8UORZTgjlJejL8ZJGKgefSs186eF8tplsXwZ9ayTPIKlQ2BvfsB
   26+tPzGdBLR1rqNvlkw+iVS4rV5/50yYjXmEy1PM+93eJ7mDLZHnfpK6K
   PLg30k5RX3NVIA65+baolk4XxnXoHjQ0Y6G7ShVlpd+jAg84JP97XCmDb
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81008815
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gc/vPK/j4x5rCqb0bqI0DrUDnn6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mseXm2COvneamemett2boqzoxgHvZTTnNY1SVA5pSA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EI14qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGU083GbA8pMpLPkZD1
 uIVGAA3ZSiGvrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQhieC1YIqMJ7RmQ+1prByfl
 lr31li+PQ42GcTclwW57H2j07qncSTTB9tJSezQGuRRqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDRdDnUxq1iHWNpBIbVpxbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 lqIlNPgAXpoqq+YTVqU87vSpjS3URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDobqgNzRJBWu7
 wy1iyUdmbgjvfQA76CCqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5vsU70JiCN/Ufj2eN5yMCk8Dd+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5jwVC1CWPw2l2PqLwv47VPM7nFW+I8ubcqjk0TPPUS2PRZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9iizpNbWO3CPmbP/2HhQchDX87iq9JEMHgNCSyI6cFwc5wj5nOlwKtE0wfQK/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:vGVAaqtRohzbWMjPCpHNk+3w7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81008815"
Date: Mon, 26 Sep 2022 14:33:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/9] automation: Add Arm containers to containerize script
Message-ID: <YzGqMpfK4yV4LVV/@perard.uk.xensource.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-5-michal.orzel@amd.com>
 <Yy27D62mvY3nQENI@perard.uk.xensource.com>
 <52a75038-7aa0-fb2e-6f4a-1cb749e886a6@amd.com>
 <alpine.DEB.2.22.394.2209231522130.922084@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2209231522130.922084@ubuntu-linux-20-04-desktop>

On Fri, Sep 23, 2022 at 03:23:26PM -0700, Stefano Stabellini wrote:
> On Fri, 23 Sep 2022, Michal Orzel wrote:
> > Hi Anthony,
> > 
> > On 23/09/2022 15:56, Anthony PERARD wrote:
> > > 
> > > 
> > > On Thu, Sep 22, 2022 at 03:40:53PM +0200, Michal Orzel wrote:
> > >> Script automation/scripts/containerize makes it easy to build Xen within
> > >> predefined containers from gitlab container registry. However, it is
> > >> currently not possible to use it with Arm containers because they are not
> > >> listed in the script. Populate the necessary entries.
> > > 
> > > FYI, those entry are just helper/shortcut/aliases, you can use any
> > > arbitrary container with the script, it just more annoying.
> > > 
> > > Your patch here allows to write:
> > >     CONTAINER=unstable-arm64v8 automation/scripts/containerize
> > > but you could write the following instead, for the same result:
> > >     CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8 automation/scripts/containerize
> > > 
> > > I wonder if the script could select the right container base on the
> > > architecture of the host, because "alpine" and "alpine-arm64v8" will not
> > > both work on the same machine. It might be nice to just choose "alpine"
> > > and the script would select the x86 or arm container automagically. Just
> > > an idea, no need to do anything about it.
> > I'm not in favor of adding the automatic selection based on the host.
> > The reason is that on x86 you can run both x86 and e.g. Arm containers.
> > You just need to use register qemu-user-static [1] to perform emulation.
> > This is something widely used and I use that to test Arm images/containers on x86 host.
> > So you can run both alpine and alpine-arm64v8 on the same machine.
> 
> Yeah and modern Docker sets up qemu-user-static automatically without
> the user having to do anything. Anthony, you can try it yourself: you
> should be able to just:
> 
>   docker run -it registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8
> 
> on your x86 host if you have a docker new enough

No, it isn't so easy, there is at least one step that might be needed,
actually having qemu-user-static on the machine.

But thanks to both of you, I've learned about qemu-user-static, and that
it isn't necessarily complicated to setup. It is actually very easy to
setup once we know what to look for, I've just had to install a packaged
called "qemu-user-static" and that's all that was needed for the above
command line to work. Installing that package worked on two different
Linux distribution for me (on a derivative of Debian stable and on Arch
Linux) so it's likely to work in many cases, at least on x86.

Cheers,

-- 
Anthony PERARD

