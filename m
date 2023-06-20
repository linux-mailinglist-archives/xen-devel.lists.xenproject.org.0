Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25033737650
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552329.862350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiPU-0008Ny-2t; Tue, 20 Jun 2023 20:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552329.862350; Tue, 20 Jun 2023 20:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiPT-0008L3-W4; Tue, 20 Jun 2023 20:57:07 +0000
Received: by outflank-mailman (input) for mailman id 552329;
 Tue, 20 Jun 2023 20:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiPS-0008Kx-A7
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:57:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029532af-0fad-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 22:57:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8C19611C5;
 Tue, 20 Jun 2023 20:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D90C433C0;
 Tue, 20 Jun 2023 20:57:01 +0000 (UTC)
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
X-Inumbo-ID: 029532af-0fad-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687294623;
	bh=n0nok6yhIDeyXx7RVeJ2kDBAAEjH/jQoKNQerE55KPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D+HgA5Odr6oP1L1O9MM6+Jt/b4g/55xGBX2xpHZi5gvgWEX58jDdHmcf2hwVFT3AA
	 GUbQBuTPVRSD86kMCRo26+SCxEvIMDOG37Glk3EU/lXcEEuL6f0KlqlJRKv1dSVfq7
	 H2YWVjxryKMMVtJP1cIKfxuuTD8AccV13AK59AWSrxOmHJ3bfoqsFN+SnYRhJSm5EJ
	 /tp3V2pkRoYWIFpCM8TGmaOQg49Eo8MB4n8QL98NinqKzve9vODeUXbYXKYoOZGPhD
	 do2BLjwYOxQP23TJOnZ6sj9Nw3PsOCK9U47zRsixKXIXV/6nuqeAoWC6nIBrzSVkB2
	 MzNIK4Rp+Jkfg==
Date: Tue, 20 Jun 2023 13:56:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 06/13] xen/efi: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <6d6708de-7afb-963c-65ae-3656fc755ad6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306201354010.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com> <6d6708de-7afb-963c-65ae-3656fc755ad6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Jan Beulich wrote:
> On 20.06.2023 12:34, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> > "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> > 
> > I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> > For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > ---
> >  xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++-----
> 
> This file as well as ...
> 
> >  xen/common/efi/boot.c                     |  8 ++++----
> >  xen/common/efi/runtime.c                  |  2 +-
> >  xen/include/efi/efiapi.h                  | 10 +++++-----
> >  xen/include/efi/efidef.h                  |  2 +-
> >  xen/include/efi/efiprot.h                 | 22 +++++++++++-----------
> 
> ... the last three here are imported from the gnu-efi package. I'm wary
> of touching them, and thus getting them more out of sync with their
> original than strictly necessary. To allow the other changes to go in
> no matter what, I'd like to suggest splitting the patch.

Should we add either those files individually or the directory
xen/include/efi (plus xen/arch/x86/include/asm/x86_64/efibind.h) to
docs/misra/exclude-list.json ?

