Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08824AF33D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269181.463197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnKb-0002fL-Bv; Wed, 09 Feb 2022 13:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269181.463197; Wed, 09 Feb 2022 13:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnKb-0002c9-8Y; Wed, 09 Feb 2022 13:48:25 +0000
Received: by outflank-mailman (input) for mailman id 269181;
 Wed, 09 Feb 2022 13:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzQm=SY=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHnKZ-0002U6-Eg
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:48:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f11bcfa2-89ae-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 14:48:22 +0100 (CET)
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
X-Inumbo-ID: f11bcfa2-89ae-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644414501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VXe4FgHjvT2H2NZbLzYU2jjX6cUZ6npniyOwTN0LRSM=;
  b=OwBLQlCHnv6YzijFZI+Hxk3IyuUFMwuBijZeOjgepFbas6CSINfh2Wri
   GaxrWt7ysGP+A7VQxVfzqfldGYGe0Tml7vTfAoDp3Dpa6I9JSGUd5Zxh+
   gLJrgQwxUbBdDBEFyVGxGPXb5WbV/64rm5ruGOa1oAl+BA54ks6tDD40a
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0A+Yp/EI8uBoiohQfBm7wDMOKI+3DuCQfl/w1uj32dptmN+gWWMrpVNKkF5hElkLxNVyDhnFgp
 kxSosmP8JFiNL0h0Tg/5kpqJPpUdHeIaxppGICqHacHad1kFqIyMc5QWuW7ovwYQJ1BUpPzQRT
 MTbeTtvXAAsYYnwsjS8jWu9PJoymFymerXOiMhF25TWRbvCooA9sn8Pn47mNh6JUUBQGPIiHiU
 VigF4YJusWwr5BtMfRYSAs1FpObOYNtUkF4dfdxO1WD2g61K8+qsHhTKymKUTTnfgZH8f0eS7R
 vyeQZYovY5Y9vxdKcum7NOey
X-SBRS: 5.1
X-MesageID: 63828537
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+pTSpq02e1nPlpvxHvbD5bh3kn2cJEfYwER7XKvMYLTBsI5bp2ZTy
 TMfCjvTM/7famb2Koglbdm2oEIGsZWEnNI1TlQ4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w79h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhrtZIz
 dVpuYSMGTwlHYrrssBGTiF2HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3ZAUTauFO
 KL1bxJ/XjvOW0VsCG0uDcsFvteP3SX2UxpX/Qf9Sa0fvDGIkV0ZPKLWGOTSftuGVMBEhHGyr
 2jN/3n6KhwCPdnZwj2Amlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUcWEGnu/C/hgi7UshGN
 k0P0iM0qO4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLW/gDfAGEHRzxAbdUOtckqSDhs3
 ViM9/v2ARR/vbvTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdpt/6Azbr2
 BiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzgfdU3+h7wh5TJW4fIHu4l/ehcusN67AEAPH5
 iJd3ZHDsqZeVvlhiRBhXs08Gois59KJKAGMulJMOL4L02+ww1CsKNU4DC5FGG9lNcMNeDnMa
 UDVuB9M6JI7AEZGfZObcKrqVZ10kPGI+cDNE6mNM4EQOsQZmBqvoXk2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ50n+uVZ9TCTMIVvgDLdoRrpkhE9jiF+Km
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RD16V6KNkOpxItENc0FpegHgp
 CzVtqhwkgWXuJE6AV/SNiALhE3HAf6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg/N0KXEn63mqmYnv6CBBhJMQIb1KSpbfZkv7HqXBm4tyf7pBl/
 dVNF2rzHPI+euiVJJyON6v0kgjh5CN1dSAbdxKgH+S/sX7EqOBCQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:bir5UKHMTh6RukS3pLqE7seALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZMgpHjJYVcqKRQdcL+7VZVoLUmxyXcx2/h2AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IOceEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,355,1635220800"; 
   d="scan'208";a="63828537"
Date: Wed, 9 Feb 2022 13:48:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YgPGHyVdSWrPwcWD@perard.uk.xensource.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgKLpCnhjP18c7oo@Air-de-Roger>
 <2567d4cd-b27b-df0b-d449-c486ab13c672@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2567d4cd-b27b-df0b-d449-c486ab13c672@citrix.com>

On Wed, Feb 09, 2022 at 12:26:05PM +0000, Jane Malalane wrote:
> On 08/02/2022 15:26, Roger Pau Monné wrote:
> > On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
> >> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> >> index b1e84d5258..5f384b767c 100644
> >> --- a/tools/golang/xenlight/types.gen.go
> >> +++ b/tools/golang/xenlight/types.gen.go
> >> @@ -389,6 +389,10 @@ RunHotplugScripts Defbool
> >>   DriverDomain Defbool
> >>   Passthrough Passthrough
> >>   XendSuspendEvtchnCompat Defbool
> >> +ArchX86 struct {
> >> +AssistedXapic Defbool
> >> +AssistedX2Apic Defbool
> > 
> > Don't you need some indentation here?
> I hadn't realized it appeared like this here (and the same happens for 
> other parts of my code as I'm seeing now) because the git output is 
> correct. I will fix it.
> > 
> > Also name would better be Assistedx{2}APIC IMO if possible. Having a
> > capital 'X' and lowercase 'apic' looks really strange.
> Okay.


This is a generated file, you can't change indentation or fields names.
It would be rebuilt automatically if you had golang installed and where
rebuilding all the tools.

There's two ways to generate it, you could install golang and build all
the tools. Or without golang: just
`cd tools/golang/xenlight; make types.gen.go`. Both should regenerate
both "helpers.gen.go" "types.gen.go" files.

There's an even easier way, tell the committer to regen the files when
committing :-).

Cheers,

-- 
Anthony PERARD

