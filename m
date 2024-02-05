Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C330F849E78
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676254.1052371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX114-0001u0-HK; Mon, 05 Feb 2024 15:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676254.1052371; Mon, 05 Feb 2024 15:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX114-0001rY-EZ; Mon, 05 Feb 2024 15:36:14 +0000
Received: by outflank-mailman (input) for mailman id 676254;
 Mon, 05 Feb 2024 15:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GD/d=JO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rX112-0001lB-SS
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:36:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b6f029-c43c-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:36:11 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B3FCF4EE0737;
 Mon,  5 Feb 2024 16:36:10 +0100 (CET)
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
X-Inumbo-ID: 49b6f029-c43c-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Mon, 05 Feb 2024 16:36:10 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Maria Celeste
 Cesario <maria.celeste.cesario@bugseng.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012 Rule
 14.4
In-Reply-To: <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
 <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
Message-ID: <891a1ab0b772910999f49878ae679634@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-13 17:10, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean 
> type".
> 
> Add comparisons to avoid using enum constants as controlling 
> expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  
> <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> ---
> Changes in v2
> - rename prefix from AMD/IOMMU to x86/IOMMU
> - move changes on msi.c and hpet.c in this patch.
> ---
>  xen/arch/x86/hpet.c                      | 6 +++---
>  xen/arch/x86/msi.c                       | 4 ++--
>  xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
>  xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
>  xen/drivers/passthrough/vtd/quirks.c     | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 

+Stefano

Hi all,

this patch seems not to have been committed into staging, unlike the 
other patch from this series. Since these are the only remaining 
violations for Rule 14.4, then I think these changes could be reviewed.

This should apply cleanly on staging, but I can send a rebased version 
if there are problems.

Additionally, despite having patches addressing R14.4 already in 
staging, the rule itself is not in docs/misra/rules.rst due to concerns 
on the patch that aimed to add it [1], so it's probably best to send a 
new version of that as well, if Stefano agrees.

[1] 
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308301840520.6458@ubuntu-linux-20-04-desktop/


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

