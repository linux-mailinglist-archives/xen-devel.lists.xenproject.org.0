Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B207577696B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581296.909915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpPW-0008Cq-Hj; Wed, 09 Aug 2023 20:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581296.909915; Wed, 09 Aug 2023 20:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpPW-0008Au-DE; Wed, 09 Aug 2023 20:04:02 +0000
Received: by outflank-mailman (input) for mailman id 581296;
 Wed, 09 Aug 2023 20:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpPV-0008Ao-2y
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:04:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfe62066-36ef-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:03:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1C63647D2;
 Wed,  9 Aug 2023 20:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1061C433C7;
 Wed,  9 Aug 2023 20:03:54 +0000 (UTC)
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
X-Inumbo-ID: dfe62066-36ef-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611436;
	bh=yaf3QiM3FCmuwE0+FvxSEerQ+2mm8mVn1PCR4QVEfYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fG7aFgxXUbiNctTP3eoqOuNI24q8lF1i9MNlEjqAPFKyAit+ApDllrhr0RpeLxmp8
	 rjZQu7BwCLMMF/Hkun2S4IUEJ+0MMBl4+TiiQynkk8tNiyQxe85s7OkyZwvm1NCvnn
	 bMI5FDRB+eaSYLhV0XDqLL+0sSuxHFH2ITzsAU8T1Qnk8t8Y9hpbwg2agRz/BsH++j
	 guG45CHu5VM6KLEuf+OAXS4NkPJTNaROxsjtxiBJlmMarBJpRKNJd4EeRspts6IFuH
	 yz7ztUvwFr5tI7E/yTCzpARl9+RS/LiOxJ2CQawHiW3kNOxwmxug4n/aDP2R2cKVto
	 pcDVeuuLXFodA==
Date: Wed, 9 Aug 2023 13:03:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 1/8] arm/efi: address MISRA C:2012 Rule 8.4
In-Reply-To: <D4DD2E2D-85FC-4614-BB4E-D72FF3B0F58D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308091303450.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <4d087a54edb3f92e9271e3d01c1abebf00d3e298.1691575243.git.nicola.vetrini@bugseng.com> <D4DD2E2D-85FC-4614-BB4E-D72FF3B0F58D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1712112080-1691611436=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1712112080-1691611436=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Aug 2023, Luca Fancellu wrote:
> > On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > the function 'fdt_add_uefi_nodes' can be defined static, as its
> > only callers are within the same file. This in turn avoids
> > violating Rule 8.4 because no declaration is present.
> > 
> > No functional change.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> With
> 
> Fixes: 6d70ea10d49f ("Add ARM EFI boot support”)

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1712112080-1691611436=:2127516--

