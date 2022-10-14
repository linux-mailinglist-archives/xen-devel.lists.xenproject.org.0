Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9A5FEC63
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422667.668850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHhv-0000RQ-2V; Fri, 14 Oct 2022 10:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422667.668850; Fri, 14 Oct 2022 10:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHhu-0000Oe-W0; Fri, 14 Oct 2022 10:14:22 +0000
Received: by outflank-mailman (input) for mailman id 422667;
 Fri, 14 Oct 2022 10:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux67=2P=citrix.com=prvs=2791c07bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ojHht-0000OU-ME
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:14:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a5c36c-4ba8-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 12:14:20 +0200 (CEST)
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
X-Inumbo-ID: f6a5c36c-4ba8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665742460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0kT25RmYnvKUKZpKsUBruywIQT4oL5Aw//QHvfay6ik=;
  b=huRUsvo/b5EOBbmED943oKnpeuIqbliERZJWh4TXLdVX4qcCjIfC9Ayy
   QrBgEMA8YHCssadSDl2xf5cyhjvOrpBqUowOM/35uQb6rTdDib0ksQ6PN
   q8Orap6pZ9z/VDbf5XYSdQQThwsWHKx1dSwLeFXdmVsgWChtXdID3SnNe
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82364989
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2pPxBKNJNTVo09zvrR2il8FynXyQoLVcMsEvi/4bfWQNrUog0DxUm
 jZNDWGCO6yMNmWhKtxxPNix80NQuZDRn9FjGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr5GtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eIdwipsRVIk9y8
 sdDByofUUGcovOn+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZC9aoGLJo3aFK25mG6Zq
 nn98HjrPSo1PcPD8xuH92uDn8bAyHaTtIU6S+Tjq68CbEeo7nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVfxC+um/CgRcaVPJZCeh84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2Nlgfv1VAYzkp+2Z06azey7tyGNaDcwPH47MHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclRuzBCxWtame0bbtT834Jrm3FxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzvVpp6k/S5Tom4Dpg4i+aihbAoLme6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+idK2PSfFIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHWLqdNNdQBbcRDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:RPOPLqDivZTT0SblHemq55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG+85rsiMc6QxhPU3I9ursBEDtex/hHNtOkO8s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkGNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82364989"
Date: Fri, 14 Oct 2022 11:14:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Message-ID: <Y0k2cQu8a3sHKSkf@perard.uk.xensource.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
 <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>

On Fri, Oct 14, 2022 at 06:26:09AM +0000, Henry Wang wrote:
> > -----Original Message-----
> > From: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
> > improvement, toward non-recursive makefiles
> > 
> > On 13/10/2022 14:04, Anthony PERARD wrote:
> > > Patch series available in this git branch:
> > > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git
> > br.toolstack-build-system-v5
> > 
> > I've done a full rebuild of this (with the 2 noted fixes) with Xapi, and
> > it does resolve the Ocaml library linking issues.  Thanks.
> > 
> > So T-by.  If an allowance for 4.17 appears, I can see about getting some
> > of the more obviously-trivial areas reviewed and committed.
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks.

> Since this series is quite large and just out of curiosity, do we have a
> pipeline or CI jobs to test all the modules that affected by the makefile
> touched by this series? Would be good to have some test results to
> boost our confidence of committing the series.

I did push my branch to Gitlab, and that the pipeline:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/665987083
    (private to xen-project members)
Only failures are I think the same one as on staging, test failure on
arm, but no build issues.

I'm not sure that everything is tested, but most of it is.

Cheers,

-- 
Anthony PERARD

