Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB17D19A1
	for <lists+xen-devel@lfdr.de>; Sat, 21 Oct 2023 01:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620460.965905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtytO-0002nm-ET; Fri, 20 Oct 2023 23:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620460.965905; Fri, 20 Oct 2023 23:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtytO-0002lt-BS; Fri, 20 Oct 2023 23:26:58 +0000
Received: by outflank-mailman (input) for mailman id 620460;
 Fri, 20 Oct 2023 23:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBDO=GC=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1qtytM-0002ln-Je
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 23:26:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24ece8aa-6fa0-11ee-9b0e-b553b5be7939;
 Sat, 21 Oct 2023 01:26:52 +0200 (CEST)
Received: from MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 23:26:45 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::dc) by MN2PR05CA0062.outlook.office365.com
 (2603:10b6:208:236::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8 via Frontend
 Transport; Fri, 20 Oct 2023 23:26:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 23:26:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 18:26:44 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 20 Oct 2023 18:26:43 -0500
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
X-Inumbo-ID: 24ece8aa-6fa0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js2uwAcFSCi1tff/NxKwaOCgepZ005to09TrFK3Fle+8hbmbajqmiykxK3qhWB8k8+rANqX1jcc1/OMfqGT/wUx9OIqsh+0kVpWX7T64XILV4cHJ/SuiuwVn16aWu9wnDmRFxtM7KVtkGTVRlLul+qOKBBtGNZ+YagSPS/NeH6QBKG0DGsWVPrePA6oePmRZUCO9LPMk0jRcClM7SpX+W/qrc3WFyGRHaY4qLPYviO06ZM1b52Tol/c0puxvx2gECI1zx0knI1N+7ilx7JUPa4FFcfQC8mvD2secQNnbhEyl6lkG9vjzP+bjsVcn1qLeOloQRiwT86roFmYciI5vVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbYw1rRZu5NOumriHBmYnlyi9F0lH4t1pYzdW7E9kis=;
 b=ZzkyNu28jJBC0b5Ce2Zjwjj6hpgkAq0s6PCFjPqwJID8/H54fiLw7whdb94c6N7jJjYMAU4LR+GfTzHSRsC/e/zTBu1MmQKwfduhgaxnP+PfgJA5iMna7LpdoSyTUrIrKHu7x2mFtBNXtbl+MaxXzkCO3xHGpj0w46JVvr3vtq7ckPLd1lbPbLrYwrjywxPR8/54bJEFjrcTXgTciMMmYvLpbmbH1wX4WlDWl4ABqPmQbicsor+E7PcA7Hmz05kB6lKWs64U27N4N+Z7waz4vKdmrYBSWkcZ5HvRKVohvMS1yUOtR84vzh12CNKakLgTE2gZR5tnI1fRTxf8MBSXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbYw1rRZu5NOumriHBmYnlyi9F0lH4t1pYzdW7E9kis=;
 b=kcf0dERF6uTtNpoecFz2yJ/IE+XJ7oNNVJ9pWX1B3eDQu4vBlAVy0xDG+JbbFEUP2JvgVoIEOI1fu+iTFJTSfX9AGHcaRiK6TaxPjxRPQZMUKpIt8f5OfbtE3P2Oo7Nlci3JfdP/Ou1k0WcmkFy07YqbriXKKXNgSSnHR8v3Rg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 20 Oct 2023 16:26:38 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Simone Ballarin
	<simone.ballarin@bugseng.com>, <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
In-Reply-To: <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com> <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com> <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com> <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com> <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop> <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com> <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com> <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop> <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com> <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 34818369-132e-44f9-3c75-08dbd1c40642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wxFETpwjzC27au2KbrFa3lkyGaXcviPgDlBmqyj4iFP6QOOa98MCNslkdLjWSzQWILjRxFjQVFtrSqBLzEFQCcRpNjIo3Eo9PJtvJYs0EaJFIw5VksJMBY0d8uu6gLNU7TjHgGUZPnvLI0zoXOy6QQooNPX1CAm+dqkx4RA44YfVL9ETGlPB3d8pvIdKFgHVbmDHS8BOyA036tcBXtzz3XN9b7wJs6tbGo0LmONCW9L58U6LS19g1Bh+99pLBqQqiE7fzFUl0TD5OO7CxkUZGZrS+fcZaH17+Oe35kdLnjjCkVFvKisiFzKhlM1fFoARBrCk/EfhYVKCWWiYdCwA8sOk+PcZHbkV72BoM/zrIEy/IbPDvIuy6pfjhC4J/M4PVUhu0NuLIMLy0ya/hexM8E2COi/NTtRFYCyXdTu2SbK26xiAlwOUDfZBD9fqzktqq4LKHx9ElahtYcdoOin/i0s56ygsLucK+EdkIun+ayVZbR15dwG9HD4VJOZrzuF8Ah0e7LxmjQFkqgQcsGihcE5voCP/7OrLxa4lqLv09v1rPmRiZfFdPoHYMT8iX+zSuBiJv+UBYc9/FdtJva2nm5S2Qc8rjdbGftKt3TNUIDOs2pa1KMYD2R+I8eBi5ZELAq91kTwhpgSUc1m7zvgvLCaGJg+ncx9fEIK8buMZbHsYBt2Rz/e9reZnjwhEJ4XJvNyTPIwaczjKDFMQbeg1lau13jIQrSrIdVd9y0znNfkCPCSauCWy/hYKWUHy/5MT6rVOAte2LMF20f119/JLBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(6916009)(478600001)(40460700003)(2906002)(53546011)(9686003)(82740400003)(70206006)(70586007)(54906003)(316002)(426003)(86362001)(33716001)(26005)(36860700001)(47076005)(336012)(356005)(81166007)(83380400001)(7416002)(40480700001)(41300700001)(8936002)(44832011)(4326008)(5660300002)(8676002)(66899024)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 23:26:45.0450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34818369-132e-44f9-3c75-08dbd1c40642
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495

On Fri, 20 Oct 2023, Jan Beulich wrote:
> On 19.10.2023 18:19, Stefano Stabellini wrote:
> > On Thu, 19 Oct 2023, Jan Beulich wrote:
> >> On 19.10.2023 02:44, Stefano Stabellini wrote:
> >>> On Wed, 18 Oct 2023, Jan Beulich wrote:
> >>>> On 18.10.2023 02:48, Stefano Stabellini wrote:
> >>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
> >>>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
> >>>>>>> If it is not a MISRA requirement, then I think we should go for the path
> >>>>>>> of least resistance and try to make the smallest amount of changes
> >>>>>>> overall, which seems to be:
> >>>>>>
> >>>>>> ... "least resistance" won't gain us much, as hardly any guards don't
> >>>>>> start with an underscore.
> >>>>>>
> >>>>>>> - for xen/include/blah.h, __BLAH_H__
> >>>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
> >>>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
> >>>>>>
> >>>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
> >>>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
> >>>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
> >>>>>>
> >>>>>> The primary question though is (imo) how to deal with private headers,
> >>>>>> such that the risk of name collisions is as small as possible.
> >>>>>
> >>>>> Looking at concrete examples under xen/include/xen:
> >>>>> xen/include/xen/mm.h __XEN_MM_H__
> >>>>> xen/include/xen/dm.h __XEN_DM_H__
> >>>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
> >>>>>
> >>>>> So I think we should do for consistency:
> >>>>> xen/include/xen/blah.h __XEN_BLAH_H__
> >>>>>
> >>>>> Even if we know the leading underscore are undesirable, in this case I
> >>>>> would prefer consistency.
> >>>>
> >>>> I'm kind of okay with that. FTAOD - here and below you mean to make this
> >>>> one explicit first exception from the "no new leading underscores" goal,
> >>>> for newly added headers?
> >>>
> >>> Yes. The reason is for consistency with the existing header files.
> >>>
> >>>
> >>>>> On the other hand looking at ARM examples:
> >>>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
> >>>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
> >>>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
> >>>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
> >>>>>
> >>>>> And also looking at x86 examples:
> >>>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
> >>>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
> >>>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
> >>>>>
> >>>>> Thet are very inconsistent.
> >>>>>
> >>>>>
> >>>>> So for ARM and X86 headers I think we are free to pick anything we want,
> >>>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
> >>>>> me.
> >>>>
> >>>> To be honest, I'd prefer a global underlying pattern, i.e. if common
> >>>> headers are "fine" to use leading underscores for guards, arch header
> >>>> should, too.
> >>>
> >>> I am OK with that too. We could go with:
> >>> __ASM_ARM_BLAH_H__
> >>> __ASM_X86_BLAH_H__
> >>>
> >>> I used "ASM" to make it easier to differentiate with the private headers
> >>> below. Also the version without "ASM" would work but it would only
> >>> differ with the private headers in terms of leading underscores. I
> >>> thought that also having "ASM" would help readability and help avoid
> >>> confusion.
> >>>
> >>>
> >>>>> For private headers such as:
> >>>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
> >>>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
> >>>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
> >>>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
> >>>>>
> >>>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
> >>>>> ARCH_X86_BLAH_H for new headers.
> >>>>
> >>>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
> >>>> guard names. If we continue to use double-underscore prefixed names
> >>>> in common and arch headers, why don't we demand no leading underscores
> >>>> and no path-derived prefixes in private headers? That'll avoid any
> >>>> collisions between the two groups.
> >>>
> >>> OK, so for private headers:
> >>>
> >>> ARM_BLAH_H
> >>> X86_BLAH_H
> >>>
> >>> What that work for you?
> >>
> >> What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
> >> differently, how would you see e.g. common/decompress.h's guard named?
> > 
> > I meant that:
> > 
> > xen/arch/arm/blah.h would use ARM_BLAH_H
> > xen/arch/x86/blah.h would use X86_BLAH_H
> > 
> > You have a good question on something like xen/common/decompress.h and
> > xen/common/event_channel.h.  What do you think about:
> > 
> > COMMON_BLAH_H, so specifically COMMON_DECOMPRESS_H
> > 
> > otherwise:
> > 
> > XEN_BLAH_H, so specifically XEN_DECOMPRESS_H
> > 
> > I prefer COMMON_BLAH_H but I think both versions are OK.
> 
> IOW you disagree with my earlier "... and no path-derived prefixes",
> and you prefer e.g. DRIVERS_PASSTHROUGH_VTD_DMAR_H as a consequence?
> FTAOD my earlier suggestion was simply based on the observation that
> the deeper the location of a header in the tree, the more unwieldy
> its guard name would end up being if path prefixes were to be used.

I don't have a strong opinion on "path-derived prefixes". I prefer
consistency and easy-to-figure-out guidelines over shortness.

The advantage of a path-derived prefix is that it is trivial to figure
out at first glance. If we can come up with another system that is also
easy then fine. Do you have a suggestion? If so, sorry I missed it.

