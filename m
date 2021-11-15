Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01A451715
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 23:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226030.390478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmk1q-0000EH-AD; Mon, 15 Nov 2021 22:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226030.390478; Mon, 15 Nov 2021 22:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmk1q-0000C6-72; Mon, 15 Nov 2021 22:00:42 +0000
Received: by outflank-mailman (input) for mailman id 226030;
 Mon, 15 Nov 2021 22:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmk1o-0000C0-UQ
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 22:00:40 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77462078-465f-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 23:00:39 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15C1761101;
 Mon, 15 Nov 2021 22:00:37 +0000 (UTC)
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
X-Inumbo-ID: 77462078-465f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637013637;
	bh=QcEVaIeufcWxIgJ7fhLT6F+X+VspDTBYdfr58Qef0qY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pu6QjHCOWruMsiF76T+VtLW51Fkc4STTTGpyRwJzfmxO6DoYf68JWgt5/+ysWxIN5
	 Wo0sLabGzv63v4Sb6dee3E14m6oD33zDdMzRqniZ6YTFu3pgVfaZJn6BDC+U3r6tc/
	 fT2Pd3epW9B+bBQt1j1IVlACyA4ysFjpzQ1GjNlD2GbtgvHSCZ50HAXnaXdLiCPcVp
	 ECXhrn9esaz0eUMXaRsqPzOU+JGtwzkhaH4e3vVEjrVmD38hW47ca91q+svrbaIBYD
	 WKFeY8MjIwytVoX85O/D02xCsTgC3KXtRoKZhaGGNPGevpv0IVeaFDSu+OCxsgDo3O
	 xWfZRr/Bvs3iA==
Date: Mon, 15 Nov 2021 14:00:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>, iwj@xenproject.org
cc: Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
References: <20211104141206.25153-1-luca.fancellu@arm.com> <81685961-501e-7a41-6f6f-bc4491645264@suse.com> <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop> <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop> <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com> <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop> <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop> <9bd58aa4-602b-4c64-e759-581513909457@suse.com> <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop> <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop> <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com> <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org> <725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
 <a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1769970815-1637013637=:1412361"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1769970815-1637013637=:1412361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+Ian

On Mon, 15 Nov 2021, Julien Grall wrote:
> Hi Luca,
> 
> On 10/11/2021 14:02, Luca Fancellu wrote:
> > 
> > 
> > > On 10 Nov 2021, at 13:36, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi Luca,
> > > 
> > > On 10/11/2021 13:05, Luca Fancellu wrote:
> > > > I thought having the EFI_FILE_HANDLE global in efi-boot.h was a “no go”,
> > > > but if it’s not then instead of
> > > > calling get_parent_handle in efi_check_dt_boot (that is the main issue
> > > > with EDK2+Grub2), we can do
> > > > something like this:
> > > 
> > > fs_dir_handle is only used by callees of efi_check_boot_dt_boot(). So the
> > > global variable is not an option for me because the risk is not worth it
> > > (it is easy to misuse a global variable).
> > > 
> > > Instead, I think fs_dir_handle should be an argument of
> > > allocate_module_file() and propagated up to the first call in
> > > efi_check_dt_boot().
> > > 
> > 
> > Yes you are right, changing the interface of handle_dom0less_domain_node,
> > handle_module_node, allocate_module_file to host also an argument
> > EFI_FILE_HANDLE *dir_handle
> > avoids the use of the global, then the handle is requested in
> > allocate_module_file only once and closed in efi_check_dt_boot only if it’s
> > not null.
> 
> That would indeed be better. I'd like this patch to be merged in 4.16. Would
> you be able to send a new version in the next couple of days?

I'd love that too; adding Ian so that he is aware.
--8323329-1769970815-1637013637=:1412361--

