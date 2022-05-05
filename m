Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701651BEF7
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 14:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322076.543276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaMW-0003md-TY; Thu, 05 May 2022 12:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322076.543276; Thu, 05 May 2022 12:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaMW-0003km-Qh; Thu, 05 May 2022 12:13:40 +0000
Received: by outflank-mailman (input) for mailman id 322076;
 Thu, 05 May 2022 12:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQei=VN=kernel.org=cmarinas@srs-se1.protection.inumbo.net>)
 id 1nmaMV-0003kg-K8
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 12:13:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9198a5a-cc6c-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 14:13:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5243B82C54;
 Thu,  5 May 2022 12:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E373C385A4;
 Thu,  5 May 2022 12:13:36 +0000 (UTC)
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
X-Inumbo-ID: c9198a5a-cc6c-11ec-8fc4-03012f2f19d4
Date: Thu, 5 May 2022 13:13:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
Message-ID: <YnO/bIw/bG8hMNx+@arm.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505115906.380416-1-michal.orzel@arm.com>

On Thu, May 05, 2022 at 01:59:06PM +0200, Michal Orzel wrote:
> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
> and can lead to overflow. Currently there is no issue as it is used
> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
> To avoid possible problems, fix the macro.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
> ---
> Changes since v1:
> - add Origin tag as the patch was merged in upstream arm64 linux tree

Note that there's always a risk that the commit Id will be changed
before it hits mainline (Linus' tree).

-- 
Catalin

