Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EA2C2F0A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36743.68761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcN7-00023N-3D; Tue, 24 Nov 2020 17:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36743.68761; Tue, 24 Nov 2020 17:44:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khcN6-00022y-W8; Tue, 24 Nov 2020 17:44:56 +0000
Received: by outflank-mailman (input) for mailman id 36743;
 Tue, 24 Nov 2020 17:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khcN5-00022t-8e
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:44:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 190566a1-69a0-42fb-8912-0e1af1d56d81;
 Tue, 24 Nov 2020 17:44:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A123206C0;
 Tue, 24 Nov 2020 17:44:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khcN5-00022t-8e
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:44:55 +0000
X-Inumbo-ID: 190566a1-69a0-42fb-8912-0e1af1d56d81
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 190566a1-69a0-42fb-8912-0e1af1d56d81;
	Tue, 24 Nov 2020 17:44:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5A123206C0;
	Tue, 24 Nov 2020 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606239892;
	bh=1zh8h9tR1JDURCC6GdkhF4d3iDUmvRcYXH/D2Xf0Cao=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bmYnzzV6DeYm7XBOGQpQhSv5FSdX2pbBUrmZEKPyzUZgNE51kdiixFGcVrb33luPd
	 2Wd0iIsRgCKHELjWZRx3UOlxr3fJU6STF5zcYYejNVY5OS5cs8n0TXVZVQbzT7bOHz
	 vqJFT/L1TYYPAa5uOmigJlg0J54RLrG+159h0JDs=
Date: Tue, 24 Nov 2020 09:44:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum
 #1530923
In-Reply-To: <E5A460E5-7D10-4314-98B4-0D90CD173940@arm.com>
Message-ID: <alpine.DEB.2.21.2011240944400.7979@sstabellini-ThinkPad-T480s>
References: <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com> <E5A460E5-7D10-4314-98B4-0D90CD173940@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Nov 2020, Rahul Singh wrote:
> > On 24 Nov 2020, at 11:12 am, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> > 
> > On the Cortex A55, TLB entries can be allocated by a speculative AT
> > instruction. If this is happening during a guest context switch with an
> > inconsistent page table state in the guest, TLBs with wrong values might
> > be allocated.
> > The ARM64_WORKAROUND_AT_SPECULATE workaround is used as for erratum
> > 1165522 on Cortex A76 or Neoverse N1.
> > 
> > This change is also introducing the MIDR identifier for the Cortex-A55.
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > docs/misc/arm/silicon-errata.txt | 1 +
> > xen/arch/arm/cpuerrata.c         | 6 ++++++
> > xen/include/asm-arm/processor.h  | 2 ++
> > 3 files changed, 9 insertions(+)
> > 
> > diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> > index d183ba543f..27bf957ebf 100644
> > --- a/docs/misc/arm/silicon-errata.txt
> > +++ b/docs/misc/arm/silicon-errata.txt
> > @@ -45,6 +45,7 @@ stable hypervisors.
> > | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
> > | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
> > | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
> > +| ARM            | Cortex-A55      | #1530923        | N/A                     |
> > | ARM            | Cortex-A57      | #852523         | N/A                     |
> > | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
> > | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_834220    |
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index cb4795beec..b398d480f1 100644
> > --- a/xen/arch/arm/cpuerrata.c
> > +++ b/xen/arch/arm/cpuerrata.c
> > @@ -514,6 +514,12 @@ static const struct arm_cpu_capabilities arm_errata[] = {
> >         .capability = ARM64_WORKAROUND_AT_SPECULATE,
> >         MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> >     },
> > +    {
> > +        /* Cortex-A55 (All versions as erratum is open in SDEN v14) */
> > +        .desc = "ARM erratum 1530923",
> > +        .capability = ARM64_WORKAROUND_AT_SPECULATE,
> > +        MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
> > +    },
> >     {},
> > };
> > 
> > diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
> > index d3d12a9d19..87c8136022 100644
> > --- a/xen/include/asm-arm/processor.h
> > +++ b/xen/include/asm-arm/processor.h
> > @@ -53,6 +53,7 @@
> > #define ARM_CPU_PART_CORTEX_A17     0xC0E
> > #define ARM_CPU_PART_CORTEX_A15     0xC0F
> > #define ARM_CPU_PART_CORTEX_A53     0xD03
> > +#define ARM_CPU_PART_CORTEX_A55     0xD05
> > #define ARM_CPU_PART_CORTEX_A57     0xD07
> > #define ARM_CPU_PART_CORTEX_A72     0xD08
> > #define ARM_CPU_PART_CORTEX_A73     0xD09
> > @@ -64,6 +65,7 @@
> > #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
> > #define MIDR_CORTEX_A15 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A15)
> > #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
> > +#define MIDR_CORTEX_A55 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A55)
> > #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
> > #define MIDR_CORTEX_A72 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A72)
> > #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
> > -- 
> > 2.17.1
> > 
> > 
> 

