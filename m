Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF915FA8C1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 01:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419399.664165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi2f0-0005Cl-7j; Mon, 10 Oct 2022 23:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419399.664165; Mon, 10 Oct 2022 23:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi2f0-00059e-4l; Mon, 10 Oct 2022 23:58:14 +0000
Received: by outflank-mailman (input) for mailman id 419399;
 Mon, 10 Oct 2022 23:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPM=2L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oi2ey-00059Y-QW
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 23:58:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64b908fe-48f7-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 01:58:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 31CAECE0E73;
 Mon, 10 Oct 2022 23:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D1AC433C1;
 Mon, 10 Oct 2022 23:58:05 +0000 (UTC)
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
X-Inumbo-ID: 64b908fe-48f7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665446287;
	bh=CHWkXRVtBi6XSq8aIpc4PaWg12g+VGGkTIIgiPmrE3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T3d2KUiJ1vXkGGemvkl3dLBoI2Nu9pNcEQtrYSoePFjTH2cDp2Hys2/eLmuSZiqKR
	 GAFCzV+8Zlm3JtDpOWRzPnkl5YpC9cGp3n7xy3TDr338jxD0UbqV54Bq6YWppaht/m
	 d3I1jW3eC4quCrjagwk12bBBwBQHNp98YCk23g6wQ20Hyc8rW4wQpjcMrxswWOqit1
	 8Axl/+moTo/ZxjLmWsmfvBDKZhj+ZBJ+Ph4LeWqBKyG4WFpBkZygwB/AslR+GaVhHV
	 rvhi+dcdxPcnCQIhszecY/5GGu7bDcX8fFyWwAKZAt67CO9CgLKUU4vcKU/KRfmrV7
	 w4H0FaG6er7Ig==
Date: Mon, 10 Oct 2022 16:58:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
In-Reply-To: <319015d6-ec1c-3500-2437-00d40fe4d2c3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2210101657180.3690179@ubuntu-linux-20-04-desktop>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com> <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com> <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com> <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org> <0d33ecc6-898a-9379-f934-fe569cbdc8f9@suse.com>
 <3b3f6e1c-4f41-6b1e-b226-f0dd515d14ca@xen.org> <7d152954-4f5a-2833-f974-442c15f4e8b9@suse.com> <82963a1c-3301-72ff-e995-77c30ec5a64b@suse.com> <a957dfbe-c4c4-c8cc-93c5-616a44fe1797@xen.org> <319015d6-ec1c-3500-2437-00d40fe4d2c3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-834925715-1665446287=:3690179"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-834925715-1665446287=:3690179
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 10 Oct 2022, Jan Beulich wrote:
> On 08.10.2022 21:08, Julien Grall wrote:
> > On 06/10/2022 15:11, Jan Beulich wrote:
> >>> ... the space cannot become ordinary RAM, then such a precaution
> >>> wouldn't be necessary. After all hiding EfiACPIReclaimMemory from
> >>> Dom0 just because it can't be mapped WB wouldn't be very nice
> >>> either. I guess I'll submit v2 with this part of the change left
> >>> as it was.
> >>
> >> And while already in the process of committing the patch I came to
> >> realize that if the WB conditional isn't supposed to move, isn't
> >> the change done for Arm then wrong as well? Shouldn't it then be
> >>
> >>          if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
> >>               (desc_ptr->Attribute & EFI_MEMORY_WB) &&
> >>               (desc_ptr->Type == EfiConventionalMemory ||
> >>               ...
> >>
> >> leaving the EfiACPIReclaimMemory case entirely unaffected by the
> >> change?
> > 
> > IIUC, the concern is the region EfiACPIReclaimMemory could have the attribute EFI_MEMORY_RUNTIME. Is that correct?
> 
> Yes, ...
> 
> > Given that the memory is reclaimable, I am not sure why it can also have this atribute set (to me it means the opposite).
> 
> ... at least on x86 all sorts of strange/bogus type/attribute combinations
> have been observed.

Yeah... it is a good idea to be able to cope with strange and bogus
firmware tables as it is known to happen
--8323329-834925715-1665446287=:3690179--

