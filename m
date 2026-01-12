Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E0D12987
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200193.1516183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHKt-0001EW-9C; Mon, 12 Jan 2026 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200193.1516183; Mon, 12 Jan 2026 12:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHKt-0001CL-6P; Mon, 12 Jan 2026 12:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1200193;
 Mon, 12 Jan 2026 12:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vfHKr-0001CF-L9
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:47:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vfHKr-000480-14;
 Mon, 12 Jan 2026 12:47:52 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vfHKq-000Cn4-20;
 Mon, 12 Jan 2026 12:47:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=B1ZjuILSJSpX8cg9BDkGUVHLqYxlznCrFFIKjmQsCyo=; b=5DEElnsTDUOBFFmlK1M8+5vEyx
	xhXETqrZkeL4BZQao6A2TaEcwTBr1TKA0q9X1I2FXC+dWhUol1ExTDPpKiq0wMRngerR9NZydxccW
	Il58ViFdrMf6Ppr8MoDJPJI7dgCAH1WpeL3/YAu7noB+8Q5RukWOcDHYsm0NtyAUpEX0=;
Date: Mon, 12 Jan 2026 13:47:50 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
Message-ID: <aWTtdqs13dnRTpcO@l14>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
 <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
 <aV_s6ySoXU-G7Gno@Mac.lan>
 <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech>
 <aWDC_UDsHkXoKu44@Mac.lan>
 <ca59701c-6c3e-4e9a-84b5-1a31037fa611@vates.tech>
 <aWDoeuHWLQ04qdI0@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWDoeuHWLQ04qdI0@Mac.lan>

On Fri, Jan 09, 2026 at 12:37:30PM +0100, Roger Pau Monné wrote:
> On Fri, Jan 09, 2026 at 10:31:57AM +0000, Teddy Astie wrote:
> > It would be easier to not use hvmloader, especially since only UEFI 
> > supports SEV and guests would still need to support (Xen-specific) SEV 
> > bits to begin with.
> 
> I would be very happy to relegate hvmloader to be used with SeaBIOS
> only, and to load OVMF directly for HVM guests.  But I don't know
> what's missing for OVMF to be capable of that.  I would think not
> much, since it's already almost working for PVH guests AFAIK.

OvmfXen works in PVH, and you can start guest ;-), the last change was
to remove the use of the hypercall page so the shutdown hypercall could
be called from UEFI Runtime Service.

> Maybe PCI enumeration, but OVMF must have a way of doing that already
> for other platforms I expect.

Yes, that would probably be the main thing, I believe. It might just be
a setting to enable enumeration when OvmfXen is started via the PVH
entry point, I haven't really try to boot OVMF in HVM without hvmloader
yet, and we would need to change the tool stack to boot an HVM guest via
the PVH entry point.

But, I already have a prototype of OvmfXen that could boot (modified)
Linux in an SEV guest, it's based on SEV work from sometime ago so might
not work anymore (and I don't remember if linux could start userspace):

https://xenbits.xenproject.org/gitweb/?p=people/aperard/ovmf.git;a=log;h=refs/heads/wip.sev

Cheers,

-- 
Anthony PERARD

