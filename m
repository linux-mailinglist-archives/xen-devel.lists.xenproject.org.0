Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84CF42B11C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 02:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207795.363725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSV-0006s7-U2; Wed, 13 Oct 2021 00:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207795.363725; Wed, 13 Oct 2021 00:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSV-0006p2-Pw; Wed, 13 Oct 2021 00:49:27 +0000
Received: by outflank-mailman (input) for mailman id 207795;
 Wed, 13 Oct 2021 00:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maSSU-0006m9-HM
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 00:49:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 697d1897-2bbf-11ec-815a-12813bfff9fa;
 Wed, 13 Oct 2021 00:49:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8259660EB4;
 Wed, 13 Oct 2021 00:49:24 +0000 (UTC)
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
X-Inumbo-ID: 697d1897-2bbf-11ec-815a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634086164;
	bh=SF+FKCJgQun6bUDgvz8eXpBwT2Ya/VNgYhLerIbtnnE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZcUY+I3aylfYt83AtmkWiEtUOM3/O410J90/m+4n98akmEgygBABNoNGocFYGHqKI
	 pTSIBkyFe9VcMDtGR8rLFSVxGOoWYBqnPbOXYS7PlfeRETX2L+nsLd2qZQCPIRqxtY
	 MsVOd/N7nwpfZ5gS4tixlhba/rk1clXn/2hn5hCbvTw/PHqkcXOLwrMVfwHYcezJph
	 xTFNa5p6VRbimKiIr5yr6J6xwXkQYhgeUX4ZioJfibILKY5smkAGe7eNC+xnmeR6vK
	 bKTRlY5/MYgeV51CeQdHkwLuI7m8PELV4Shy/aJpc4TDe3UnWuuBcRJoUYDeaZqYow
	 dOLgI0S7jRfSg==
Date: Tue, 12 Oct 2021 17:49:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using
 EFI boot
In-Reply-To: <0bae71a5-4637-d2a6-ddcc-3497e22470f1@suse.com>
Message-ID: <alpine.DEB.2.21.2110121312070.9408@sstabellini-ThinkPad-T480s>
References: <20211011181528.17367-1-luca.fancellu@arm.com> <20211011181528.17367-2-luca.fancellu@arm.com> <f29c8062-8430-6e08-7d4b-02096a6b049f@suse.com> <4FFFB177-883F-44DE-BF7E-53137AA7F0CB@arm.com> <0bae71a5-4637-d2a6-ddcc-3497e22470f1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1637701801-1634069552=:9408"
Content-ID: <alpine.DEB.2.21.2110121312340.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1637701801-1634069552=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110121312341.9408@sstabellini-ThinkPad-T480s>

On Tue, 12 Oct 2021, Jan Beulich wrote:
> On 12.10.2021 11:05, Luca Fancellu wrote:
> >> On 12 Oct 2021, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 11.10.2021 20:15, Luca Fancellu wrote:
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
> >>>     StdErr->OutputString(StdErr, (CHAR16 *)s );
> >>> }
> >>>
> >>> +#ifndef CONFIG_HAS_DEVICE_TREE
> >>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >>
> >> Didn't we agree that you would drop "inline" from here?
> > 
> > Yes we did, really sorry I forgot to drop it, I’ll push another serie, given the inline
> > Dropped are you ok with the patch?
> 
> Well, yes - I had given my ack for it already.

I made this change on commit and added your ack.

FYI I gave my reviewed-by to patch #2. Patch #2 needs your ack as Luca
dropped it on v6.
--8323329-1637701801-1634069552=:9408--

