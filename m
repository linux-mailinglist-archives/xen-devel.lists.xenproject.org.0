Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01C42A7AE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207335.363130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJAO-0007QE-2w; Tue, 12 Oct 2021 14:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207335.363130; Tue, 12 Oct 2021 14:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJAN-0007Mw-Vy; Tue, 12 Oct 2021 14:54:07 +0000
Received: by outflank-mailman (input) for mailman id 207335;
 Tue, 12 Oct 2021 14:54:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJAM-0007Mo-HE
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:54:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJAM-0003Bt-GM
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:54:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJAM-0001Lw-FY
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:54:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJAE-0004bW-83; Tue, 12 Oct 2021 15:53:58 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=dH8iJq3o9Yhes/6IkPftbdJ8pqK8LeeD6+3zVFruVYI=; b=TArYzDXflXlGGgUOUbXZC262nF
	busPQrUrukmAi3Qib1rLChmzUa1hVh1Jr1MB34AEUYlRJ7bEc6vPAInHqic2pHjJe90LMJ7mdO4wB
	kYQkeVTmdWnL2JHDBaw3imyguiVLLq8CBB16cbQ+Ye2Y+GXdsRY9lUhwpfn64UrD79Q8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.41349.893363.203683@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 15:53:57 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    Rahul Singh <Rahul.Singh@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
	<YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
	<77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
	<YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
	<53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
	<YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
	<FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
	<ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
	<ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
	<0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
	<c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
	<c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
	<c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
	<09656882-b297-7144-c291-1ee997edb119@suse.com>
	<69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> So there is no comment remaining on this patch ?

I have been following this thread.  I think I have a notion of why
this is needed but I'm not 100% clear on it.  The commit message says
this:

> ARM architecture does not implement I/O ports. Ignore this call on ARM
> to avoid the overhead of making a hypercall just for Xen to return
> -ENOSYS.

which implies it's a performance improvement.  But the change also
suppresses an error return, so this commit message is false.  I think
that the thread has concluded something different, but it should be
explained in the commit message.  The purpose of a commit message is
precisely to capture the kind of considerations and discussion that
occurred in this thread.

If the overall outcome implied by this patch is correct (as I *think*
the thread has concluded) then I don't think the #ifdefery is
appropriate.  This should be done with a new arch-specific function in
libxl_x86.c and libxl_arm.c.  I'm not sure precisely what that
function should be called, but maybe something like
  libxl_ioports_supported
?

I see that the fact that we avoid #ifdefs wasn't documented in
CODING_STYLE, so I have sent a patch to add that.  Sorry about that.

Thanks,
Ian.

