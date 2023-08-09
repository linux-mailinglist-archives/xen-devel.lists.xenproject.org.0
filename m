Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E254776998
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581315.909953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpX6-0002zH-1C; Wed, 09 Aug 2023 20:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581315.909953; Wed, 09 Aug 2023 20:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpX5-0002x8-Ur; Wed, 09 Aug 2023 20:11:51 +0000
Received: by outflank-mailman (input) for mailman id 581315;
 Wed, 09 Aug 2023 20:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpX4-0002x2-HN
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:11:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80fb126-36f0-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:11:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 497D464823;
 Wed,  9 Aug 2023 20:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478B5C433C9;
 Wed,  9 Aug 2023 20:11:45 +0000 (UTC)
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
X-Inumbo-ID: f80fb126-36f0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611906;
	bh=AprQhLEFd+wp1TpuyZZ6oKaapiMpY5kk9+185VXeksk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pkafl/rRgn8UgvSziOw/RoD0cezIoL5TsuhXlKIPgzmHmd0mgZwG2bNz9e0q0zHKw
	 fQey6nBwSO9KgYYqJuiVDuIjXj7Vu7fE6SpT4b+qe4OALvlWLniLVgRfYpHj+GYqR0
	 458tVnh0EF91h1R+xo2bYyHAGm68HFde5P1r0ASz0QJLx/1rIeU2Or06ZAzOHOaDoo
	 QA1qVUXBjFgFr/4tuP9GeE/12k0mWD4e8KfgO+1yBAivsUsUQgLa5YHg7bydsrwQSt
	 BvKX7t0HjDiY0AhGy4HJoypEbK12O18rEvy2lzOhbyQAASMDIBVolzLNw4kjB5Xv4Z
	 u1sLs30CvMnfw==
Date: Wed, 9 Aug 2023 13:11:43 -0700 (PDT)
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
Subject: Re: [XEN PATCH 6/8] xen/arm: mm: address MISRA C:2012 Rule 8.4
In-Reply-To: <0C30A959-AF46-484D-B44B-058A86799FE6@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308091311310.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <67163dc4bc2e44d3f70f9c49295b993663d2fd5a.1691575243.git.nicola.vetrini@bugseng.com> <0C30A959-AF46-484D-B44B-058A86799FE6@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Luca Fancellu wrote:
> > On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > Add a declaration for the variable 'init_ttbr' to resolve
> > the violation of Rule 8.4 present in the associated source file 'mm.c'.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> With:
> 
> Fixes: 4557c2292854 ("xen: arm: rewrite start of day page table and cpu bring up")
> 
> If maintainers are ok

Yes

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

