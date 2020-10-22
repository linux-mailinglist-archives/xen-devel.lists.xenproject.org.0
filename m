Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5E29666F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 23:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10649.28413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVhxV-0001Yg-V6; Thu, 22 Oct 2020 21:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10649.28413; Thu, 22 Oct 2020 21:17:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVhxV-0001YH-Rg; Thu, 22 Oct 2020 21:17:17 +0000
Received: by outflank-mailman (input) for mailman id 10649;
 Thu, 22 Oct 2020 21:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kVhxU-0001YC-4Y
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 21:17:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 569779f4-b278-434b-8817-4aed74fc5a68;
 Thu, 22 Oct 2020 21:17:15 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10F1A21D43;
 Thu, 22 Oct 2020 21:17:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WvX7=D5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kVhxU-0001YC-4Y
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 21:17:16 +0000
X-Inumbo-ID: 569779f4-b278-434b-8817-4aed74fc5a68
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 569779f4-b278-434b-8817-4aed74fc5a68;
	Thu, 22 Oct 2020 21:17:15 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 10F1A21D43;
	Thu, 22 Oct 2020 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603401434;
	bh=HFynRJdHj89IlpNM0UxHVn/4elj4VJ9eirdXAUSC+g4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pB07Fpdt98P61ESMPoZa9B2F+TQ3XRiBI9XwAQkRs4mzPJ9NDFBknabIJy8BMFnla
	 u0DyLy9c251ImqWwsykbX2RYbiRESzH0jj6ixNp/22AgmWoiUHK4Oj0mKvIhEOYHn+
	 11xdoAxPSHCGfxRvpj/FoQUeR9qfqtQ991bYVvns=
Date: Thu, 22 Oct 2020 14:17:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
In-Reply-To: <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
Message-ID: <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
References: <20201022014310.GA70872@mattapan.m5p.com> <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Oct 2020, Julien Grall wrote:
> On 22/10/2020 02:43, Elliott Mitchell wrote:
> > Linux requires UEFI support to be enabled on ARM64 devices.  While many
> > ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
> > potentially taking over.  Some common devices may need ACPI table
> > support.
> > 
> > Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
> 
> The idea behind EXPERT is to gate any feature that is not considered to be
> stable/complete enough to be used in production.

Yes, and from that point of view I don't think we want to remove EXPERT
from ACPI yet. However, the idea of hiding things behind EXPERT works
very well for new esoteric features, something like memory introspection
or memory overcommit. It does not work well for things that are actually
required to boot on the platform.

Typically ACPI systems don't come with device tree at all (RPi4 being an
exception), so users don't really have much of a choice in the matter.

From that point of view, it would be better to remove EXPERT from ACPI,
maybe even build ACPI by default, *but* to add a warning at boot saying
something like:

"ACPI support is experimental. Boot using Device Tree if you can."


That would better convey the risks of using ACPI, while at the same time
making it a bit easier for users to boot on their ACPI-only platforms.


> I don't consider the ACPI complete because the parsing of the IORT (used to
> discover SMMU and GICv3 ITS) is not there yet.
> 
> I vaguely remember some issues on system using SMMU (e.g. Thunder-X) because
> Dom0 will try to use the IOMMU and this would break PV drivers.

I am not sure why Dom0 using the IOMMU would break PV drivers? Is it
because the pagetable is not properly updated when mapping foreign
pages?


> Therefore I think we at least want to consider to hide SMMUs from dom0 before
> removing EXPERT. Ideally, I would also like the feature to be tested in
> Osstest.
> 
> The good news is Xen Project already has systems (e.g. Thunder-X, Softiron)
> that can supported ACPI. So it should hopefully be a matter to tell them to
> boot with ACPI rather than DT.

I agree that we want to keep ACPI "expert/experimental" given its
current state but maybe we can find a better way to carry that message
than to set EXPERT in Kconfig.

And yes, if we wanted to make ACPI less "expert/experimental" we
definitely need some testing in OSSTest and any critical bugs (e.g. PV
drivers not working) addressed.

