Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FD42CF23
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 01:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208926.365214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1manZ3-0005ly-0m; Wed, 13 Oct 2021 23:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208926.365214; Wed, 13 Oct 2021 23:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1manZ2-0005iz-TP; Wed, 13 Oct 2021 23:21:36 +0000
Received: by outflank-mailman (input) for mailman id 208926;
 Wed, 13 Oct 2021 23:21:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1manZ1-0005ir-L1
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 23:21:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aff0e915-ab70-4087-9319-710dcd45e10d;
 Wed, 13 Oct 2021 23:21:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64C7610CE;
 Wed, 13 Oct 2021 23:21:32 +0000 (UTC)
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
X-Inumbo-ID: aff0e915-ab70-4087-9319-710dcd45e10d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634167294;
	bh=Giumvu8A0ghOTFjjW7M5l+fqk+HGcfj12+AMFZXd0B0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VM+P1wTBlQX7dSUvEcyRuoZios0xsb5YXzU+ysLzquvBgfgIacBHSvC1lJa46NXmL
	 qIz/O8zkPuwXTB51n3Z3XTHFtvXLr4za1Fx5u99dMpSSBZbXZHJRmGBbmRQcAQ0ag3
	 TTdOV8+NWF78XjLMZwb84NEI609/W/fE8EvHovB+etrbi9URxEqSKq4rfAySk7KgNN
	 IkMO6TM8HL6KKs18XZUunqgdSSXG0glkxpKZXp/JFSG4m07CuMeEU2CUScCnFmz8RK
	 7Z3wNwXRpUFZiR6SP1wnnqydIbDnsFIOhenWKb6VFUoV8w/phjXlSFkEgNqWpzgT5j
	 8Fxmev0DVpazw==
Date: Wed, 13 Oct 2021 16:21:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci
 flag
In-Reply-To: <alpine.DEB.2.21.2110131205410.9408@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2110131510120.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com> <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local> <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com> <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com> <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local> <alpine.DEB.2.21.2110131205410.9408@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-800336767-1634163118=:9408"
Content-ID: <alpine.DEB.2.21.2110131621100.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-800336767-1634163118=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110131621101.9408@sstabellini-ThinkPad-T480s>

On Wed, 13 Oct 2021, Stefano Stabellini wrote:
> On Wed, 13 Oct 2021, Roger Pau Monné wrote:
> > > I think the second solution is the right one but it cannot be done so near from the
> > > feature freeze.
> > > 
> > > The CDF flag as introduced right now is not creating any issue and will be used once
> > > the emulation flag will be introduce. We will be able at this stage to set this properly
> > > also on x86 (for dom0 pvh).
> > > Moreover keeping it will allow to continue to merge the remaining part of the PCI
> > > passthrough which are otherwise not possible to be done as they are dependent on this flag.
> > > 
> > > Can we agree on keep the DOMCTL_CDF_vpci flag and introduce the emulation
> > > flag on Arm after 4.16 release ?
> > 
> > If vPCI for Arm on 4.16 is not going to be functional, why so much
> > pressure in pushing those patches so fast? I understand the need to
> > remove stuff from the queue, but I don't think it's worth the cost of
> > introducing a broken interface deliberately on a release.
> > 
> > I think we need to at least settle on whether we want to keep
> > CDF_vpci or use an arch specific signal mechanism in order to decide
> > what to do regarding the release.
> 
> I wrote a longer separate email to provide more context about the
> "pushing fast" comment.
> 
> I agree that we don't want to introduce a bad interface.
> 
> In regards to a way forward for 4.16, my suggestion is the following:
> 
> - revert this patch: do not change the interface in this series
>     - do not change anything related to CDF_vpci for x86
>     - for ARM, leave has_vpci(d) to { false } and do not set
>       XEN_DOMCTL_CDF_vpci
>     - we can discuss it in depth later on, no rush
> 
> - in patch #10, in libxl_arm.c:libxl__arch_domain_prepare_config
>     - do not set XEN_DOMCTL_CDF_vpci
>     - do not set b_info.arch_arm.vpci
>     - do not define LIBXL_HAVE_BUILDINFO_ARM_VPCI in libxl.h
>     - keep make_vpci_node and arch_arm.vpci
> 
> 
> The other patches (#1, #8, #10), which don't change any interfaces, can
> still make it for 4.16 if the review feedback is addressed on time, with
> one open TODO item [1].
> 
> This way, we get all the essential infrastructure we are trying to
> introduce without making any compromises on the external interfaces.
> Still it is good to have patches #1 #8 #10 so that with a trival
> oneliner patch on top of 4.16 we can enable PCI for ARM and do testing
> in the community, in gitlab-ci, and OSSTest too. (We have been
> discussing special OSSTest flights to valide PCI passthrough as we
> complete development.)

One more thing: I would really like to get at least patch #8 committed
because it would help with making progress with part 2 and part 3 of the
PCI enablement series. My preference would also be to get #1 and #10
in as well but I feel less strongly about it.
--8323329-800336767-1634163118=:9408--

