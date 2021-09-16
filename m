Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6644040EB84
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 22:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188682.337933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQxo2-0007mi-J7; Thu, 16 Sep 2021 20:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188682.337933; Thu, 16 Sep 2021 20:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQxo2-0007kv-Fz; Thu, 16 Sep 2021 20:16:26 +0000
Received: by outflank-mailman (input) for mailman id 188682;
 Thu, 16 Sep 2021 20:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQxo1-0007ko-Q7
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 20:16:25 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f134838-720e-4091-adf4-13c5a1d206b2;
 Thu, 16 Sep 2021 20:16:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99CF9611EE;
 Thu, 16 Sep 2021 20:16:23 +0000 (UTC)
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
X-Inumbo-ID: 8f134838-720e-4091-adf4-13c5a1d206b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631823384;
	bh=ZW2rGbgXDtL5/e9pwiE2HXgUIAYjFeyzNO2p0Uc8wkE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JYBPuoCcOqDSVUbz3gyZ+wNoBaMxEmZ7X58C86Z2azh3bVU6X3TBggweCDw+KZydU
	 aSqBb6VPfw7yKavujo/B/iSYVstYU8uAt1T3fhk5hkWsaCrY3sXv4xPulvoywpDn3R
	 xINQGi4+dZANRoIlCq8iawOSEBhR7lMIL4zPE/XLfclE9EnHOz8LjACYBaAEEj4lpA
	 TiD9qBI8hH8KaArjea4usePyawNxiUX7Ahzw8/AsRTbrmfet9g5NHu4Sgag4lGr8Qq
	 WWhlkaF8WgDOOJR3xMBIX15V+mw01mJ8+s4PuaGEKVzD8ZUWjayN2nMRwz1KjcN1U0
	 0v424SB+0nyfQ==
Date: Thu, 16 Sep 2021 13:16:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
In-Reply-To: <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
Message-ID: <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
References: <20210915142602.42862-1-luca.fancellu@arm.com> <20210915142602.42862-3-luca.fancellu@arm.com> <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com> <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com> <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com> <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-810505497-1631822111=:21985"
Content-ID: <alpine.DEB.2.21.2109161255180.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-810505497-1631822111=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109161255181.21985@sstabellini-ThinkPad-T480s>

On Thu, 16 Sep 2021, Jan Beulich wrote:
> On 16.09.2021 17:07, Luca Fancellu wrote:
> > I explain here my understanding on dom0less, this feature is used to start domUs at
> > Xen boot in parallel, the name is misleading but it doesn’t require dom0 to be absent.
> > 
> > So if you have a dom0 kernel embed in the image, it's completely fine to start it and it 
> > doesn’t have to be skipped.
> > 
> > Here the possible user cases:
> > 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
> > 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embedded in Xen image, domUs on DT]
> > 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen image) and domUs on DT]
> 
> If that's the intention - fine. Stefano?

What do you mean by dom0 modules embedded in the Xen image? I am not
familiar with it, but I imagine it doesn't involve any multiboot,module
nodes in device tree, right?

Putting aside "dom0 modules embedded in Xen image" that I didn't fully
understand, there are three ways to load Dom0:

- dom0 kernel (and ramdisk, optional) on xen.cfg
- dom0 kernel (and ramdisk, optional) on device tree using the "reg" property
- dom0 kernel (and ramdisk, optional) on device tree using the "uefi,binary" property

Then, the other use cases are:

- true dom0less, domUs on device tree using the "reg" property
- true dom0less, domUs on device tree using the "uefi,binary" property

And of course all the possible combinations between Dom0 and DomU
loading.


Currently, patch #1 checks for the presence of a Dom0 kernel node and, if
present, it decides not to proceed with xen.cfg. So if the Dom0 kernel
node is *not* present, efi_arch_use_config_file returns true.

However, this could be a true dom0less configuration without any Dom0
kernel. If so, you might not want to load xen.cfg at all because it is
not needed. In a true dom0less configuration, we probably want
efi_arch_use_config_file to return false.


In general, loading xen.cfg or not loading xen.cfg doesn't seem like it
should be dependent on whether there is or there is not a dom0 kernel
node in device tree. I think there are too many possible combinations to
guess correctly based on the presence of the dom0 kernel node. Instead,
I think it would be better to have an explicit flag.

Today, if a "multiboot,module" node is present, efi_arch_use_config_file
returns false. So I suggested to extend it so that if a
"multiboot,module" node is present we look into a specific
xen.cfg-loading property and if present return true otherwise false.
This way, we are backward compatible. 
--8323329-810505497-1631822111=:21985--

