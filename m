Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2483B5CC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 01:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671298.1044558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSnBf-0006h4-HM; Thu, 25 Jan 2024 00:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671298.1044558; Thu, 25 Jan 2024 00:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSnBf-0006fN-EW; Thu, 25 Jan 2024 00:01:43 +0000
Received: by outflank-mailman (input) for mailman id 671298;
 Thu, 25 Jan 2024 00:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uncx=JD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSnBd-0006fH-ML
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 00:01:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9924b40-bb14-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 01:01:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5DDE4CE31A1;
 Thu, 25 Jan 2024 00:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8349FC433F1;
 Thu, 25 Jan 2024 00:01:32 +0000 (UTC)
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
X-Inumbo-ID: e9924b40-bb14-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706140894;
	bh=LbSrEN6S1ZKkePLoCe5auKR7lirj9RHXYgCFk2r0BhY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AmnjFpyFcBvZe8EN0QOulE6ecMXqyufKC2j05avcY/jmSn3VsjnOlHj0WIlsHZ1ss
	 F/cLyAUH4gPQINoy/Cb41mCuA5SRNKmnU1rpxGkCsq8L0kXkUeigHMglA6HmVvdPdC
	 7fmkR82Phtttx1sU/8GlON2bz2VpbbPNGJm0oScUTs6MN06KeKH/2gAY8rrOL3ERmy
	 CzZZ2MO5BndQaW1Kt7oaXPddwNKbxN8G7YqWhtMOH6MpKpswn+YYsjIoFNCyJMsOz2
	 B14XtIgMWbIW97VBgWNFLxb2I31c3owhobnQAsqXts8RSxElXmr/yWScuDXwSEbCXK
	 JrBQzxqozsp+w==
Date: Wed, 24 Jan 2024 16:01:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
In-Reply-To: <dcf0fbe3-a95d-483f-a424-949c16805786@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2401241601130.7734@ubuntu-linux-20-04-desktop>
References: <cover.1705066642.git.mykyta_poturai@epam.com> <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com> <alpine.DEB.2.22.394.2401231704270.2287888@ubuntu-linux-20-04-desktop>
 <dcf0fbe3-a95d-483f-a424-949c16805786@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-401759874-1706140894=:7734"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-401759874-1706140894=:7734
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Jan 2024, Andrew Cooper wrote:
> On 24/01/2024 1:07 am, Stefano Stabellini wrote:
> >> I agree with Jan that we could reuse
> >> xendevicemodel_inject_msi by assuing that PCI BDF zero is invalid.
> 
> I've already explained why that will break future x86.  (See the other
> thread off this patch for specifics).
> 
> When we add vIOMMUs to guests, we *must* have correct source ids.  0 is
> ambiguous, so not safe to reuse.
> 
> 
> Allocating a new subop now is the only way to not shoot in the foot later.

OK, what you wrote makes sense to me.
--8323329-401759874-1706140894=:7734--

