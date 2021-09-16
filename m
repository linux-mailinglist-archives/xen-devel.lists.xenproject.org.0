Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC49540EBAD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 22:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188698.337955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQxyC-0001dX-RJ; Thu, 16 Sep 2021 20:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188698.337955; Thu, 16 Sep 2021 20:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQxyC-0001az-O1; Thu, 16 Sep 2021 20:26:56 +0000
Received: by outflank-mailman (input) for mailman id 188698;
 Thu, 16 Sep 2021 20:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQxyB-0001at-6t
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 20:26:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e6c1e26-172c-11ec-b644-12813bfff9fa;
 Thu, 16 Sep 2021 20:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ED8C60F26;
 Thu, 16 Sep 2021 20:26:53 +0000 (UTC)
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
X-Inumbo-ID: 6e6c1e26-172c-11ec-b644-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631824013;
	bh=5NdsIIYXCWwDK+C4KP7XV0yFDXJzb/4hB75/tZKrnDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nhb2md3DtLetR4FeTZFEV8aQX3zkDtoaNcgJIqOszLc5LroXdYvoGThPG5O/idXJ9
	 04EGj9kPCbiwwy3GH+Q/s2JG4iC7SfR1OepzoYulZegtuYbBnv3du8xuCjRHuqgppv
	 CpeQWN9xN7c+Hgpo+MU0v9/Uy8Bo/feXWJVBUvULz/Lia0LIRO9a+Xxh/CqNgdzPnK
	 ozPgoEp2HBAzIwNIQUDDGO7L3MGUC2tqC68HWn1b9MrZSmCjzsauxp6GHNx8zh7rD4
	 KwAw6W8ZCTzc82BZYSkPTv4TVHD7G6ivbSIRwUK82hVHnDzJn6UpSQFXXCI4uzFk4x
	 5yjKrZRFT0msQ==
Date: Thu, 16 Sep 2021 13:26:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <A90145B0-DD30-4300-8248-73104C782172@arm.com>
Message-ID: <alpine.DEB.2.21.2109161324200.21985@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109091720490.10523@sstabellini-ThinkPad-T480s> <A90145B0-DD30-4300-8248-73104C782172@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1341339614-1631824013=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1341339614-1631824013=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Sep 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 10 Sep 2021, at 1:26 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 19 Aug 2021, Rahul Singh wrote:
> >> The existing VPCI support available for X86 is adapted for Arm.
> >> When the device is added to XEN via the hyper call
> >> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> >> access is added to the Xen to emulate the PCI devices config space.
> > 
> > This is done just for device discovery, right?
> > 
> > Although it is currently not implemented (and I am not asking to
> > implement it now, I am only trying to understand the architecture), it
> > would be possible to discover all PCI devices just by walking down the
> > PCI hierarchy by ourselves in Xen (no Dom0 interactions) given that we
> > have an ECAM driver.
> > 
> > I take that would be the way to implement PCI support for Dom0less?
> 
> It is not possible to discover PCI devices in XEN if enumeration is not done before XEN boot.
> If boot firmware did the enumeration,  XEN will discover the PCI device.

OK, but if the boot firmware does the enumeration, how will Xen discover
the PCI device exactly? Will Xen discover it because the PCI device will
be present in device tree explicitly (will have its own device tree
node)? Or will Xen discover it by walking the PCI bus?
--8323329-1341339614-1631824013=:21985--

