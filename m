Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C818195CE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 01:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657295.1026079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkfa-0008LU-EU; Wed, 20 Dec 2023 00:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657295.1026079; Wed, 20 Dec 2023 00:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkfa-0008J1-Bs; Wed, 20 Dec 2023 00:42:42 +0000
Received: by outflank-mailman (input) for mailman id 657295;
 Wed, 20 Dec 2023 00:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFkfY-0008Iv-P3
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 00:42:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc593fc-9ed0-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 01:42:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E1899B81A38;
 Wed, 20 Dec 2023 00:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC840C433C8;
 Wed, 20 Dec 2023 00:42:34 +0000 (UTC)
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
X-Inumbo-ID: acc593fc-9ed0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703032956;
	bh=3khB5p/C8TaTy0SXYCHaF4/KzV+W+IFObzykCL1ptyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WQLgHRnAPo+F4/gjMuLa8Dxkoe1V3uVqLjDuElLMnNQacrWUtvg2PFmycxHcfa8Nz
	 XQp3tDZNvsA+jaqRR61wZPfkgPUyvYzRZmn/AIxPOiR/kTsoW6+HpkCsAx2bRLg5q8
	 K51CF9jKsK7lv5NlXn+rTEUwi4zF+fuZGrGOLEjz8Q+qp/QdVMmu488r+XkNxqZMl4
	 6t0l30QaMlSQfhfDXYFuZFfjoYllJKWogVjoFlX6Fdt5NsMrTdP1w75vv4MTKpwv/y
	 E+0EMkvXlJVm6nRc6m1jUtKAd6Es/VUyxxbzQYWzCRk+Os7dCae2AYJliErW0FAQ7o
	 bk1R5vOUnzRkA==
Date: Tue, 19 Dec 2023 16:42:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
In-Reply-To: <13b218b5-2d37-48de-9baa-cf2b99211bde@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312191641140.3175268@ubuntu-linux-20-04-desktop>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com> <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com> <13b218b5-2d37-48de-9baa-cf2b99211bde@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Julien Grall wrote:
> Hi,
> 
> On 19/12/2023 14:18, Mykyta Poturai wrote:
> > Following up with relevant QEMU patch link.
> > 
> > https://patchwork.kernel.org/project/qemu-devel/patch/c7a180a5874f036c246fc39f921eefafecbc8c76.1702994649.git.mykyta_poturai@epam.com/
> 
> I don't seem to have the patch in my inbox. I guess you didn't CC xen-devel?
> 
> Anyway, I will reply here. I think this is a mistake for QEMU to assume that
> Xen will expose a GICv3 ITS to the guest (we may decide to implement another
> MSI controller).
> 
> But QEMU should really not need to implement a full ITS. What it needs is a
> way to forward the MSI to Xen. That's it.

I fully agree with Julien


> Stefano, do you have any suggestion how to do this in QEMU?

Yes, we just need something like hw/i386/xen/xen_apic.c but for ARM

