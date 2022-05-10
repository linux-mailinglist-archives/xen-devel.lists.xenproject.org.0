Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9952101B
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 10:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325316.547834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLec-0003jj-PR; Tue, 10 May 2022 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325316.547834; Tue, 10 May 2022 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noLec-0003h6-MD; Tue, 10 May 2022 08:55:38 +0000
Received: by outflank-mailman (input) for mailman id 325316;
 Tue, 10 May 2022 08:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Srr2=VS=kernel.org=cmarinas@srs-se1.protection.inumbo.net>)
 id 1noLea-0003h0-S8
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 08:55:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f403aeaf-d03e-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 10:55:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CFAB614A1;
 Tue, 10 May 2022 08:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF230C385A6;
 Tue, 10 May 2022 08:55:31 +0000 (UTC)
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
X-Inumbo-ID: f403aeaf-d03e-11ec-8fc4-03012f2f19d4
Date: Tue, 10 May 2022 09:55:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
Message-ID: <YnoogHgRMzex3pA3@arm.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
 <YnO/bIw/bG8hMNx+@arm.com>
 <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
 <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org>

On Tue, May 10, 2022 at 09:27:29AM +0100, Julien Grall wrote:
> Hi,
> 
> On 10/05/2022 07:49, Michal Orzel wrote:
> > On 05.05.2022 14:13, Catalin Marinas wrote:
> > > On Thu, May 05, 2022 at 01:59:06PM +0200, Michal Orzel wrote:
> > > > Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
> > > > and can lead to overflow. Currently there is no issue as it is used
> > > > in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
> > > > To avoid possible problems, fix the macro.
> > > > 
> > > > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> > > > Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
> > > > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
> > > > ---
> > > > Changes since v1:
> > > > - add Origin tag as the patch was merged in upstream arm64 linux tree
> > > 
> > > Note that there's always a risk that the commit Id will be changed
> > > before it hits mainline (Linus' tree).
> > > 
> > 
> > This commit is now in linux-next:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48e6f22e25a44e43952db5fbb767dea0c9319cb2
> > so we can be sure that the SHA will stay unmodified there (and will be the same in Linus' tree).
> 
> AFAIK, linux-next branch is just a merge of all the maintainers branch and
> often rewritten. So there are no guarantee a commit id is valid until it
> reached Linus' tree.

Indeed. While I try not to rebase it, it may happen occasionally.

> > Question to maintainers:
> > Do you want me to update Origin to point to linux-next?
> 
> So we have a link to the patch and a name. This should be sufficient to find
> the commit.
> 
> Therefore, I would simply on top of Origin:

Yeah, just keep the link to the mailing list. I guess you can drop my
Singed-off-by as well if it appears to be picked from the list rather
than the kernel repo. If you want an ack:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

-- 
Catalin

