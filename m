Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C554C7CB4E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 22:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617937.961068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsUUx-0007v1-NW; Mon, 16 Oct 2023 20:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617937.961068; Mon, 16 Oct 2023 20:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsUUx-0007s1-KC; Mon, 16 Oct 2023 20:47:35 +0000
Received: by outflank-mailman (input) for mailman id 617937;
 Mon, 16 Oct 2023 20:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uuB=F6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsUUw-0007rv-HO
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 20:47:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aebfbbe-6c65-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 22:47:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CEF9FB81A26;
 Mon, 16 Oct 2023 20:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCA3C433C7;
 Mon, 16 Oct 2023 20:47:30 +0000 (UTC)
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
X-Inumbo-ID: 3aebfbbe-6c65-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697489251;
	bh=AtvmNXLpZkq947hg5ZDiQBdrLP7YpyYBPUXA9+Pywmw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=icvgZFh3WU27PXsxZALamPFs1cwHg3jliIG0IHvlRT4D5aYnf0j44P1Ya+yoA3/kE
	 5tQV3sXxlnj90Hc5bzGGCjRCFJ/hc+7X2t0ciSK1DTGlzHfsao5XbDO8t0IIXfxLYL
	 ctzNR7kR/hXnW1XXz09UBX873nbkdSIc4vSLf+bpgmybKC4nu0Ar0KR1xd/ESh1xSs
	 FOS26IbGxoOiFIDGyPRjPs9NVTbx7Ahh5GuMlUP1EtFEAXxZG6qhIMw3dyzN4lQIPj
	 kYEjzaCkelm8cK9aYez8hnbbv0TBAxDI8/pK8mgqp+TYdz+mtjQx59ycqrKokr/KYe
	 nuCTdqhu2sGnw==
Date: Mon, 16 Oct 2023 13:47:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <92C52E39-729F-40AE-A02F-556C8EE471CB@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310161338540.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com> <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org> <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
 <c9a7f059-4cf5-4a75-b231-573c4fe29b37@xen.org> <92C52E39-729F-40AE-A02F-556C8EE471CB@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Bertrand Marquis wrote:
> > On 16 Oct 2023, at 15:38, Julien Grall <julien@xen.org> wrote:
> > 
> > 
> > 
> > On 16/10/2023 14:31, Bertrand Marquis wrote:
> >> Hi Julien,
> > 
> > Hi Bertrand,
> > 
> >>> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> Hi,
> >>> 
> >>> On 13/10/2023 16:24, Federico Serafini wrote:
> >>>> Add missing parameter names, no functional change.
> >>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>> ---
> >>>>  xen/drivers/passthrough/arm/smmu.c | 6 +++---
> >>> 
> >>> This file is using the Linux coding style because it is imported from Linux. I was under the impression we would exclude such file for now.
> >>> 
> >>> Looking at exclude-list.json, it doesn't seem to be present. I think this patch should be replaced with adding a line in execlude-list.json.
> >> I think that during one of the discussions we said that this file already deviated quite a lot from the status in Linux and we wanted to turn it to Xen coding style in the future hence it is not listed in the exclude file.
> > AFAIK the SMMUv{1, 2} code didn't deviate very much from Linux. I can't tell about the SMMUv3.
> 
> True that i had the v3 code in mind, we might not want to do that for v1/2 you are right.
> 
> > 
> >> At the end having a working smmu might be critical in a safety context so it will make sense to also check this part of xen.
> > I don't buy this argument right now. We have files in exclude-lists.json that I would consider critical for Xen to run (e.g. common/bitmap.c, common/libfdt). So if you want to use this argument then we need to move critical components of Xen out of the exclusion list.
> 
> I am sure we will at some point for runtime code but we cannot do everything on the first shot.
> I was not meaning to do that now but that it is something to consider.

Things that are in exclude-lists.json are source files that come from
other projects and also change very rarely. The argument that we don't
do MISRA C on the files in exclude-lists.json, it is not because those
files are unimportant, but because they change only once every many
years.

Of course the least we rely on exclude-lists.json the better.

For smmu.c, looking at the git history I think it is more actively
worked on than other files such as lib/rbtree.c or common/bitmap.c.
Given that backports from Linux to smmu.c are not straightforward anyway
(please correct me if I am wrong) then I think we should not add smmu.c
to exclude-lists.json and do MISRA for smmu.c.

On the other hand, if we think that doing MISRA for smmu.c is going to
make backports a lot harder, and we think that we want to do backports
"often" (every year or every couple of years) then maybe we shouldn't do
MISRA for smmu.c after all.

