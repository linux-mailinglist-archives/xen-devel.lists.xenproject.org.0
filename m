Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DF42CC25
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208860.365116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malFq-0005FW-Iz; Wed, 13 Oct 2021 20:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208860.365116; Wed, 13 Oct 2021 20:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malFq-0005DH-Fd; Wed, 13 Oct 2021 20:53:38 +0000
Received: by outflank-mailman (input) for mailman id 208860;
 Wed, 13 Oct 2021 20:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1malFp-0005DB-9D
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:53:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14ffbdc5-08b4-496a-b4ff-6f7f40720dbb;
 Wed, 13 Oct 2021 20:53:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 618D061152;
 Wed, 13 Oct 2021 20:53:34 +0000 (UTC)
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
X-Inumbo-ID: 14ffbdc5-08b4-496a-b4ff-6f7f40720dbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634158415;
	bh=4j/pbEyjS/pwpNumw3o26zquVKCWrgEEszXmjNxHzM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VXiO48iiK+2PzFes5eC/WgZFsu9oTT/SuODLuxwXWAwM7EJcJXkz6FF7Gx4XBaSQQ
	 c0xuWMDQrKio28HCEwtJVuw6yoFzkCtqkKFzR/3vPIUL2+x36kluJRGmbqrpnpZKDw
	 uRejHTtNTABI/4nhU8/9WD2Efqf3rEPSSfrh2GnOPQyfEcKbFeqezIPHllA6AW6L43
	 rrFTjQuxBVLOZz3KzAr5W8ccdKrbAbUQf39iSt0q04WwqAxzz77OBbaUMeeA4smgEa
	 MUPFIUdaUVH7VWgO/aozou3KMLQwQG+NwVZhxmju4IKs2YmCICWQdanl9uo4P8Czb7
	 E3lwK9TIStgyw==
Date: Wed, 13 Oct 2021 13:53:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci
 flag
In-Reply-To: <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
Message-ID: <alpine.DEB.2.21.2110131205410.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com> <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local> <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com> <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com> <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1296413107-1634152015=:9408"
Content-ID: <alpine.DEB.2.21.2110131207020.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1296413107-1634152015=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110131207021.9408@sstabellini-ThinkPad-T480s>

On Wed, 13 Oct 2021, Roger Pau Monné wrote:
> > I think the second solution is the right one but it cannot be done so near from the
> > feature freeze.
> > 
> > The CDF flag as introduced right now is not creating any issue and will be used once
> > the emulation flag will be introduce. We will be able at this stage to set this properly
> > also on x86 (for dom0 pvh).
> > Moreover keeping it will allow to continue to merge the remaining part of the PCI
> > passthrough which are otherwise not possible to be done as they are dependent on this flag.
> > 
> > Can we agree on keep the DOMCTL_CDF_vpci flag and introduce the emulation
> > flag on Arm after 4.16 release ?
> 
> If vPCI for Arm on 4.16 is not going to be functional, why so much
> pressure in pushing those patches so fast? I understand the need to
> remove stuff from the queue, but I don't think it's worth the cost of
> introducing a broken interface deliberately on a release.
> 
> I think we need to at least settle on whether we want to keep
> CDF_vpci or use an arch specific signal mechanism in order to decide
> what to do regarding the release.

I wrote a longer separate email to provide more context about the
"pushing fast" comment.

I agree that we don't want to introduce a bad interface.

In regards to a way forward for 4.16, my suggestion is the following:

- revert this patch: do not change the interface in this series
    - do not change anything related to CDF_vpci for x86
    - for ARM, leave has_vpci(d) to { false } and do not set
      XEN_DOMCTL_CDF_vpci
    - we can discuss it in depth later on, no rush

- in patch #10, in libxl_arm.c:libxl__arch_domain_prepare_config
    - do not set XEN_DOMCTL_CDF_vpci
    - do not set b_info.arch_arm.vpci
    - do not define LIBXL_HAVE_BUILDINFO_ARM_VPCI in libxl.h
    - keep make_vpci_node and arch_arm.vpci


The other patches (#1, #8, #10), which don't change any interfaces, can
still make it for 4.16 if the review feedback is addressed on time, with
one open TODO item [1].

This way, we get all the essential infrastructure we are trying to
introduce without making any compromises on the external interfaces.
Still it is good to have patches #1 #8 #10 so that with a trival
oneliner patch on top of 4.16 we can enable PCI for ARM and do testing
in the community, in gitlab-ci, and OSSTest too. (We have been
discussing special OSSTest flights to valide PCI passthrough as we
complete development.)


If we think we need a snap decision on this topic, I am available for a
quick sync-up call or IRC meeting between 8AM and 10AM tomorrow (Oct
14).

[1] https://marc.info/?l=xen-devel&m=163412120531248
--8323329-1296413107-1634152015=:9408--

