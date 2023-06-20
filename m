Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714E737636
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552295.862289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiAi-0003wb-Hp; Tue, 20 Jun 2023 20:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552295.862289; Tue, 20 Jun 2023 20:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiAi-0003uU-Et; Tue, 20 Jun 2023 20:41:52 +0000
Received: by outflank-mailman (input) for mailman id 552295;
 Tue, 20 Jun 2023 20:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiAg-0003uO-QC
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:41:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e04dc4ca-0faa-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 22:41:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B491611B2;
 Tue, 20 Jun 2023 20:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDC8C433C8;
 Tue, 20 Jun 2023 20:41:44 +0000 (UTC)
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
X-Inumbo-ID: e04dc4ca-0faa-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687293706;
	bh=UB48tZ0X3YIWnUjWk2tYaXWF0eBZmOKX9snefcNeLcw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VZoCHMWUNmRlMA9vstF75q+oq0xPgd7DbTPSN5WXwnW8ziEhBFsM0wd3y4FKJYpde
	 Lz14vHvtnR8hVNAQtNHH/9RFXH5F/V2+bX6cVb2vQ/xPb1gXJB4+f6lGcWaPK0hnU+
	 qbqsbR+EkFEPCqelVgR9j0bZRPfH4ogr67/Unh2zjAzP5/c54UmWlt1h3B/w0gsO8+
	 SMJ3rr/EBfvqxuhEp0X27y2gaD997zjpH2DXdjH+pF4571uyrVkeVSFGwdtk0rDlu6
	 aeJJQpA5hXQ19YP+oRsVi8xKLcGqWKpv6k/xTyJYSf5tZCIzR3wJexCRXj8OycsT47
	 qtGwMDYCD6dyQ==
Date: Tue, 20 Jun 2023 13:41:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <37C5BC47-E735-4731-A6C6-F30189FA6B9D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306201341070.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com> <7cdd53c7-4d57-39f2-10fa-2fa2ddc98389@suse.com> <37C5BC47-E735-4731-A6C6-F30189FA6B9D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2003924817-1687293706=:897208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2003924817-1687293706=:897208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Jun 2023, Luca Fancellu wrote:
> > On 20 Jun 2023, at 13:39, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 20.06.2023 12:34, Simone Ballarin wrote:
> >> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> >> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> >> @@ -38,49 +38,49 @@
> >>         ((uint64_t)(offset) << (12 + (PTE_PER_TABLE_SHIFT * ((level) - 1))))
> >> 
> >> /* IOMMU Capability */
> >> -#define PCI_CAP_ID_MASK 0x000000FF
> >> +#define PCI_CAP_ID_MASK 0x000000FFU
> > 
> > Seeing this and similar uses further down, I think there's a purely
> > stylistic question to be resolved first (and hence I'm widening the To:
> > list here): Do we want to allow either case of U to be used
> > interchangeably, leaving the choice up to the patch author?
> 
> Because you ask to the list, my personal opinion is that we might want to
> have only capital U, so that it’s consistent across the codebase and we don’t
> need to create too many rules for the developer, it stands out anyway as it can’t
> be an hex digit

I agree with Luca
--8323329-2003924817-1687293706=:897208--

