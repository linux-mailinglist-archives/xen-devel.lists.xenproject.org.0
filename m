Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C393B028CD
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 03:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041589.1412297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaOo8-0004aM-Fg; Sat, 12 Jul 2025 01:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041589.1412297; Sat, 12 Jul 2025 01:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaOo8-0004Xb-8d; Sat, 12 Jul 2025 01:13:40 +0000
Received: by outflank-mailman (input) for mailman id 1041589;
 Sat, 12 Jul 2025 01:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDTn=ZZ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uaOo6-0004XU-0Z
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 01:13:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:2409::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cf73b12-5ebd-11f0-b894-0df219b8e170;
 Sat, 12 Jul 2025 03:13:32 +0200 (CEST)
Received: from CH2PR05CA0045.namprd05.prod.outlook.com (2603:10b6:610:38::22)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 12 Jul
 2025 01:13:26 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::df) by CH2PR05CA0045.outlook.office365.com
 (2603:10b6:610:38::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Sat,
 12 Jul 2025 01:13:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Sat, 12 Jul 2025 01:13:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 20:13:22 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Jul 2025 20:13:21 -0500
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
X-Inumbo-ID: 6cf73b12-5ebd-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqQHOmeG0XuX1wMadwhTavOUjtRfZO0VpMihsUXI1PVplOgTFy5T59NrpA80G2L+qhIfSfbotvbcbayiKFiJVoNeS9S+wvWE/ItsVTkcrWuMt/1ER1OusN3PoentWXCskAQXPO3m8oVL4Tc9dissRgH2t5hWFJpZ/GOsuQ0uBoYqND9r7QnyTpaWaz4NfsVgE6CUHK9+CN8mhJotxgVEwP4KahLj4u+srrp+GzphTNDFKb+ZZrbqoZeAeIdkq6Huzg7eFaORIkcf63keT9qwg98/urPePlJtKnLmiJHT2VNq2rY+xSbSCCtSZAuUZ1XpFzgs6O1rJCWOuYpp8WaqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OQAfK7PT1Qy7JUVi2q2qcZCEaZT1+sdau0aAc/Xtw8=;
 b=jS7xmw+2RPrHIajS7ypI8TR74w2/0Rg6dSw+inJ/PB0bdTcAOMixjBZ4sr+1hClu8CBo3451TACKMjyaUwo6jl/bEaEfPuowTGqB0JvUsxckisYk0yG8no9OeVskMkuB6WVUZs1f38IUC4AaNhmu4dDp+tr9ecnyAuEacz4Iy3YQNqfA4DbooMQiq3V/RZMiHy22lZERkcF9pDUe+39+ZsjGKPR8L4GiqLWSd8HCFIFuiDFzZ5dQvlYXdK8LIwGMU7jpVszb/i535BgFmo9jrq+sRg3tualjlAs6VacDcST3I/QFG7vtQjYHsytESj8ep1UWEsM1eDcKOQ2pCrc4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OQAfK7PT1Qy7JUVi2q2qcZCEaZT1+sdau0aAc/Xtw8=;
 b=fhEXj82RDsvPGBEjNM1YBuW2RDQMAkuir75p6eE/opK+oL0L8GiBCqi4HFM7bjvNcdtI8pBXAn7g3InOyDCYdQz+kN/niEOJxdEy21yqXttWY0HtYKoe5xhT+WuOHLKkradj5R78n68kzF5hugu8nxfblp3G4YjGiXc39MWaDXE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 11 Jul 2025 18:13:16 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
In-Reply-To: <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com> <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com> <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef31893-aaf0-43fb-8a72-08ddc0e14d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ni6XShpZnjMccMlOzFKtphNgvOA+4Gw/7A9lASiuUgkzvsM88UC1LbxJZ71W?=
 =?us-ascii?Q?QI0gXlVWc5apaBDAcB8hl9+DY6WSXdXA/v2SnCid5Ab+uHsLrfcBd6pQ9FnR?=
 =?us-ascii?Q?KB4PyMWN7xFsVj9hw3qHcfaGUHFg/Pbxp93pnvnFpCvVHwduJN3OkB37mBpC?=
 =?us-ascii?Q?lfgEXOUn3U+Hf//bWrOArMaNrstbGCJeusXs+E2OG5pjyPE4ss74tmS4ph5m?=
 =?us-ascii?Q?2CfjtXXkbbMmiA3frin8cEGpZYYM2whgR/LX5lpZZ/Dte/tBEllyzmxDTTPu?=
 =?us-ascii?Q?SWAGmX/Yat47yOXA2P/zsI/tczfuLXKHXS5efzrIdkPHmg2hnSBJFkUQIaHv?=
 =?us-ascii?Q?QLkqUcFIP0Nw3CL/Yu7nZH2La6qI0SqjKD807gFi/EcJF84Wy24AnfDFlkiE?=
 =?us-ascii?Q?4K1Lb4Ry3ALzNPa7mwOLAc/0tdiFQInF/tHnHRBlZXuHqqhV0gLrkmCxjEUZ?=
 =?us-ascii?Q?I638eMxLDqY7S4qBoCzQN8KHYg3yC1gqDLrg2U40dTnVe/Z/3mGiQ8bcEN6a?=
 =?us-ascii?Q?J23wHXrR3idLUqGhMVWS2pLnVs/i20zCrvNGMet5mYeB/y2ylAg1CTZpCU4/?=
 =?us-ascii?Q?itYnHXaKJUb+38jb9w3rf8HMS4Ddxu23xhIG59w780EsWc5q4Rqhbcy3YPIp?=
 =?us-ascii?Q?eqIRBiqgIrvQUUJJwPWbDf7rtD8MxouejZ8gqN7Zfy57vEYkGWbOErtowUhz?=
 =?us-ascii?Q?EgCa2vdK6JDKlQgy8P6r2/ayt7zlwmoY2AjvO8eZovQy38SXT6BWrTMc3nv0?=
 =?us-ascii?Q?ef5/bWdhH7rdpiyFelwQNJi4CqWKvygYEuBj/Y6G9v8YEKZEaQx8j//liM+U?=
 =?us-ascii?Q?SJS3ugDuPewoBRrdczlMVWYd5NmomQZgQCmO9awOoJbP3TMNQZMxlD7enwM+?=
 =?us-ascii?Q?EE9qHWoRe+WrhztyHv5aKE8dyOrXKqeIVdaUdnracy1x8jTKS2DpF/gu/QCl?=
 =?us-ascii?Q?0KwuZ13uunW36wFrupXi8ZFNHojxNzGnyxu2U1ToqN/cFw7jP+TlGC880Qzx?=
 =?us-ascii?Q?zvJxhJTiFxwiiOKVczJ4QxKWBx0rh7Rv58PN5DJ20n9bt/6H65zZWaZO7AAs?=
 =?us-ascii?Q?qIpVhg0Ra5ChNlBPRJFbP9KPr58kU+rebJSYWt1a4PzvmdXytkZ5hq2AVZAu?=
 =?us-ascii?Q?4UBkcq1bdxzgY7AJnxp+LqB/Ep2Qy0t8nIBEV7h5KQkG9dg4tkEAWLgfvBuk?=
 =?us-ascii?Q?Cqv7CohZzv9u1nwLkKXQc5CsGNrTOpLI+PGUjfxu+DdSAOU9DbI8suRg15st?=
 =?us-ascii?Q?A/ZmqnQHBdIS7F8ufMudQ5ynL09hDJ9qqpKHXi2oYCJkSzChdQ7iA/NAgUDQ?=
 =?us-ascii?Q?lGM6wmIu1bqTFbm/P8FX9PkN4pacjWtKfI41YwVg8/kAGrkm+lXJaXc24Z6i?=
 =?us-ascii?Q?50a0gZqeDIQtRKRRGJyYzoyPWwIxaakheiIInx0dUQ38xt5jV4kPNZpafSlj?=
 =?us-ascii?Q?0fy9JKjNdKM/Z+CeqngdfWyqYexI+IczhGUi5JEOTZSolFHVpKIHAiADY9/P?=
 =?us-ascii?Q?zpFCPT5wIQEPTObhWdfJs6q1YhdYkW8h9MNH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 01:13:25.0935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef31893-aaf0-43fb-8a72-08ddc0e14d2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416

On Fri, 11 Jul 2025, Nicola Vetrini wrote:
> On 2025-07-09 23:38, Dmytro Prokopchuk1 wrote:
> > MISRA C Rule 5.5 states that: "Identifiers shall
> > be distinct from macro names".
> > 
> > Update ECLAIR configuration to deviate:
> > - clashes in 'xen/include/xen/bitops.h';
> > - clashes in 'xen/include/xen/irq.h';
> > - clashes in 'xen/common/grant_table.c'.
> > 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
> >  docs/misra/deviations.rst                        | 8 ++++++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index e8f513fbc5..a5d7b00094 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -117,6 +117,14 @@ it defines would (in the common case) be already
> > defined. Peer reviewed by the c
> >  -config=MC3A2.R5.5,reports+={deliberate,
> > "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
> >  -doc_end
> > 
> > +-doc_begin="Clashes between function names and macros are deliberate for
> > bitops functions, pirq_cleanup_check, update_gnttab_par and
> > parse_gnttab_limit functions
> > +and needed to have a function-like macro that acts as a wrapper for the
> > function to be called. Before calling the function,
> > +the macro adds additional checks or adjusts the number of parameters
> > depending on the configuration."
> > +-config=MC3A2.R5.5,reports+={deliberate,
> > "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
> 
> Bitops violations are not inside "xen/include/xen/bitops.h", but rather
> "xen/arch/x86/include/asm/bitops.h"
> 
> > +-config=MC3A2.R5.5,reports+={deliberate,
> > "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
> 
> I would rather do (untested)
> 
> -config=MC3A2.R5.5,reports+={deliberate,
> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
> 
> > +-config=MC3A2.R5.5,reports+={deliberate,
> > "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
> > +-doc_end
> > +
> 
> same as above
> 

Thanks Nicola! The following deviations are enough and sufficient to
zero violations on both ARM and x86:

-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/bitops\\.h$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat\\.c$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^.*/compat/.*$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/arch/x86/include/asm/genapic\\.h$)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(virt_to_maddr))||macro(name(virt_to_maddr)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_px_pminfo))||macro(name(set_px_pminfo)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(set_cx_pminfo))||macro(name(set_cx_pminfo)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_to_guest_ll))||macro(name(copy_to_guest_ll)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(copy_from_guest_ll))||macro(name(copy_from_guest_ll)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(edd_put_string))||macro(name(edd_put_string)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(cpu_has_amd_erratum))||macro(name(cpu_has_amd_erratum)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(page_list_entry))||macro(name(page_list_entry)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_physdev_op))||macro(name(do_physdev_op)))"}
-config=MC3A2.R5.5,reports+={deliberate, "all_area(decl(name(do_platform_op))||macro(name(do_platform_op)))"}

Jan, are you OK with it?

