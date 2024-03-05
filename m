Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A6871270
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 02:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688555.1072829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJq3-0007Hy-CZ; Tue, 05 Mar 2024 01:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688555.1072829; Tue, 05 Mar 2024 01:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJq3-0007GD-9Y; Tue, 05 Mar 2024 01:43:27 +0000
Received: by outflank-mailman (input) for mailman id 688555;
 Tue, 05 Mar 2024 01:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49dx=KL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rhJq1-0007G7-6p
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 01:43:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02fdf88-da91-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 02:43:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 168B06123D;
 Tue,  5 Mar 2024 01:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48522C433F1;
 Tue,  5 Mar 2024 01:43:20 +0000 (UTC)
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
X-Inumbo-ID: c02fdf88-da91-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709603001;
	bh=UQ8xvgE4PyUtyvAlJerlsFFevZfWBtILYW06mJRvGhY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NsCnTsFaSUEIPedIWHWRpymkgPNVf49rpZyd4z47zz4k3kheE7AWtqL/RjKq7zwQr
	 1DP6AK+bOE8pMHSBpbojJlPRh7c0JxoGwv5/5OSfm228q4t3OPaR9ATP99/eE+0KHs
	 1JFuoxIsxSan/dSFKMjSEFoFOm7Xp0WgkyP+/OTZ7YHAReLc58prlpUiH0aTygxpOO
	 Fxjv+5Wh9bIHRru5ahcYK1yITGctec5xUWQJChTVRhIIRC9NXbeSJH0ya3hf+FNmNw
	 7K81zavluFstjx+m69Ly+nB0k2bSVKMy1l3CGkr1zFXHS5JxBsYET4QrGfTKkluSPr
	 w/4HCwZMSA3VQ==
Date: Mon, 4 Mar 2024 17:43:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, 
    ayan.kumar.halder@amd.com, consulting@bugseng.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 02/10] xen/arm: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <0aae1c64587cfbc67e81a20b36dd5056@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403041742540.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com> <905119be-8731-4669-ac7f-c21aed6845dc@suse.com> <7c54b08875406e5b3a61325af124ae7f@bugseng.com>
 <0aae1c64587cfbc67e81a20b36dd5056@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Mar 2024, Nicola Vetrini wrote:
> Hi,
> 
> as the maintainers of this subsystem, would you prefer Jan's version or the
> one in the patch?
> Both are fine w.r.t MISRA Rule 20.7 because the macro arguments themselves are
> parenthesized.

I prefer Jan's version. Thanks for asking Nicola.


> > > > --- a/xen/arch/arm/include/asm/vgic-emul.h
> > > > +++ b/xen/arch/arm/include/asm/vgic-emul.h
> > > > @@ -6,11 +6,11 @@
> > > >   * a range of registers
> > > >   */
> > > > 
> > > > -#define VREG32(reg) reg ... reg + 3
> > > > -#define VREG64(reg) reg ... reg + 7
> > > > +#define VREG32(reg) (reg) ... (reg) + 3
> > > > +#define VREG64(reg) (reg) ... (reg) + 7
> > > 
> > > #define VREG32(reg) (reg) ... ((reg) + 3)
> > > #define VREG64(reg) (reg) ... ((reg) + 7)
> > > 
> > > ?
> > > 
> > 
> > The outer parentheses are not required, but I can add them if the
> > maintainers share your view.


