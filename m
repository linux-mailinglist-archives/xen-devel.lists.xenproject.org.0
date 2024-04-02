Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D481894903
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 03:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699973.1092410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrTIN-0007Wh-9r; Tue, 02 Apr 2024 01:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699973.1092410; Tue, 02 Apr 2024 01:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrTIN-0007UN-6L; Tue, 02 Apr 2024 01:50:39 +0000
Received: by outflank-mailman (input) for mailman id 699973;
 Tue, 02 Apr 2024 01:50:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe4w=LH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rrTIL-0007UH-Hu
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 01:50:37 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64d68149-f093-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 03:50:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDDF5CE16D8;
 Tue,  2 Apr 2024 01:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED513C433C7;
 Tue,  2 Apr 2024 01:50:30 +0000 (UTC)
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
X-Inumbo-ID: 64d68149-f093-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712022632;
	bh=BY4sc7J8SdkoUrlaF2s3gSAZDgnVGRRsogcFghic8OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PFJ9oThvH5EdawpgK/0edWi3jHU8qiSa8SUkjP4aZEnWcVN1NqaeovvlghULRUQrj
	 Auy80WGntWYNDUviBjiRO/s0dcssnGyhs6H52kLi458ZhxEC5ziomRLRWAq1fwgSH6
	 0d/5zs5Q8RDLvToNHKblLtg55RenTXvvZUvSe7KqOuMhLIWJMd8fmDZ3wJJvu9d0Jo
	 kyhWdRsoOTXTxE75elb4wHdHJBKSaWoAd+zmo8ki7z62fbqKITAC8J2qVQUikiIdSz
	 ucooEdhEoz3AI/G4yBnHpjZj9rIk40RKWFp9G9x1P6aA3agSiUB8ew/AHtcoOznj90
	 sIBVamZcrtkiQ==
Date: Mon, 1 Apr 2024 18:50:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, michal.orzel@amd.com, 
    roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <a5c01d46-eb46-49d1-8ffd-98b6d1680daa@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404011833450.2245130@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com> <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop> <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop> <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com> <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop> <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
 <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop> <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com> <alpine.DEB.2.22.394.2403211140540.1569010@ubuntu-linux-20-04-desktop> <a5c01d46-eb46-49d1-8ffd-98b6d1680daa@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Mar 2024, Julien Grall wrote:
> Hi Stefano,
> 
> I haven't fully read the thread. But I wanted to clarify something.
> 
> On 21/03/2024 19:03, Stefano Stabellini wrote:
> > > > Or possibly unsigned long depending on the parameter.
> > > 
> > > You're contradicting yourself: You mean to advocate for fixed-width types,
> > > yet then you suggest "unsigned long".
> > 
> > No. I explained it in another thread a couple of days ago. There are
> > cases where we have fixed-width types but the type changes by
> > architecture: 32-bit for 32-bit archs and 64-bit for 64-bit archs.
> > Rather than having #ifdefs, which is also an option, that is the one
> > case where using "unsigned long" could be a decent compromise. In this
> > context "unsigned long" means register size (on ARM we even have
> > register_t). Once you pick an architecture, the size is actually meant
> > to be fixed. In fact, it is specified in this document. Which is one of
> > the reasons why we have to use == in this document and not >=. In
> > general, fixed-width types like uint32_t are better because they are
> > clearer and unambiguous. When possible I think they should be our first
> > choice in ABIs.
> 
> "unsigned long" is not fixed in a given architecture. It will change base on
> the data model used by the OS. For instance, for Arm 64-bit, we have 3 models:
> ILP32, LP64, LLP64. Only on LP64, 'unsigned long' is 32-bit.
> 
> So effectively unsigned long can't be used in the ABI.

If someone sees "unsigned long" in the public headers to define a public
Xen ABI, they would need to refer to this document to understand what
"unsigned long" really means, which specifies size and alignment of
"unsigned long" based on the architecture. In other words, this document
mandates LP64 (at least for safety configuration, given that nothing
else is tested).

This is the reason why ideally we wouldn't have any "unsigned long" in
the Xen ABI at all. They are not as clear as explicitly-sized integers
(e.g. uint32_t). In an ideal world, we would use explicitly-sized
integers for everything in public ABIs.

