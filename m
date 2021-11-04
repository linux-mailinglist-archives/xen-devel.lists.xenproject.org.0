Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894B44574C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221747.383610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifhW-0006NF-F8; Thu, 04 Nov 2021 16:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221747.383610; Thu, 04 Nov 2021 16:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifhW-0006Kp-C7; Thu, 04 Nov 2021 16:34:54 +0000
Received: by outflank-mailman (input) for mailman id 221747;
 Thu, 04 Nov 2021 16:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vs6a=PX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mifhU-0006Kh-St
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:34:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212f1e32-3d8d-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 17:34:51 +0100 (CET)
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
X-Inumbo-ID: 212f1e32-3d8d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636043691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sIiHA2DT0X+lF9plIQCW1ff7vReUXq9RTxSmnPMpEYk=;
  b=ZZVfSdrqtlXwRqaGn63KTpAJFvNcB1CS3y4xUVbo45K0KI67n08RJtz7
   ALKPR5NJfPhi66mYxqZQKbyH/Qv8QmvDlxOml+11Haf3jmlyGSiQW1nz1
   YuO2Fq51UNy+uW4ANSlYYsEWkY7xA8Su6diFo2xHQ/KtxGLmooldHc/nT
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Q+XJI9wdNLIj148Q7AjLHyTgOVp1XL789t9Y5BN1Bk6u6cgeHcikVqdHT4fOfTWCTy70ZsnMBO
 ALPuVPqQLrjgqYoWcR3JQqUeKcQT94FOlMw7Jb/duX0ujqdGn+8E1vEq8rGKdvC9XnpMkbGf11
 RNfU33UwLFPkPLC/GTefjkj9I+N2CmFNIsXopK1KT84pllCKB2IobDRyxGBWIeozvtn0iwxWFU
 wLJfzLOspDyb0GywIkIpIOB+0N02m1ao/IX5O9soM7+EqFdTcKp+hydC0PYk2o7r8evra1WcsR
 rqth1ApE5lfLYlB5oA61tG5b
X-SBRS: 5.1
X-MesageID: 56630957
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:1u8FxayjkUUJsUURfG/GKrPwFL1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPHjP+VAssRAb6LS90ca7LU80maQb3WBVB8baYOCEghrMEGgB1/qA/9SIIUSXnYQx6U
 4jSdkdNDSZNykDsS+Q2mmF+rgbruW6zA==
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="56630957"
Date: Thu, 4 Nov 2021 16:34:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Kevin Tian
	<kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Connor Davis <connojdavis@gmail.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, "Tim
 Deegan" <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich
	<jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Julien
 Grall" <julien@xen.org>, Alexandru Isaila <aisaila@bitdefender.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Lukasz Hawrylko
	<lukasz.hawrylko@linux.intel.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
Message-ID: <YYQLoR2ussToQjFV@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <871r3vkiok.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871r3vkiok.fsf@linaro.org>

On Thu, Nov 04, 2021 at 03:49:36PM +0000, Alex Bennée wrote:
> 
> Anthony PERARD <anthony.perard@citrix.com> writes:
> 
> > Patch series available in this git branch:
> > https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fxenbits.xen.org%2Fgit-http%2Fpeople%2Faperard%2Fxen-unstable.git&amp;data=04%7C01%7Canthony.perard%40citrix.com%7C85bb0d32a72542aa9f6108d99fad9607%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637716390172120458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WWS4yPu9%2BJxBkBiM5SBrH7kDtHkUzMGuKSSdPcgEYII%3D&amp;reserved=0 br.build-system-xen-v7
> >
> > v7:
> >     Out-of-tree build!
> >
> >     This mean many more patches. Everything after patch 27 is new.
> >
> >     There's a few new patch before that, but otherwise are rework of
> >     v6.
> 
> This is something I've been looking forward to but obviously my QEMU
> focused mind meant I did it wrong. Generally I create a builds subdir in
> my tree with subdirs for each build flavour. So with:
> 
>   /home/alex/lsrc/xen/xen.git/builds/native
> 
> And executing:
> 
>   ➜  ../../configure

Thanks for testing, but the patch series only focus on a subset of the
repository, that is the hypervisor "xen.git/xen/". The rest of xen.git
isn't ready for out-of-tree build unfortunately. A lot more work is
needed.

> In "build: adding out-of-tree support to the xen build" you describe the
> Linux kernel style which works well where the config can be done after
> the fact but I wonder if the configure approach is better suited to
> something that needs a bunch of checks running. Is the configure script
> pure autoconf? This should work out of the box IIRC.

"xen.git/xen/" does use a build system similar to Linux's, we use
Linux's Kconfig for example.

For the rest of the repository, it is indeed autoconf for the
configuration phase. So yes running ./configure would be mostly ok, but
it doesn't take care of Makefiles at the moment and I found one bug in
our autoconf macros. Beyond that, our Makefiles aren't ready.

xen.git isn't a single build system, they are several (at least one
foreach of xen/ stubdom/ tools/)

Cheers,

-- 
Anthony PERARD

