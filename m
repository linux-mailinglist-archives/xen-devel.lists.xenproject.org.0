Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3979E4F38
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 09:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848994.1263733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ6qi-0003RM-Hi; Thu, 05 Dec 2024 08:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848994.1263733; Thu, 05 Dec 2024 08:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ6qi-0003OD-Eu; Thu, 05 Dec 2024 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 848994;
 Thu, 05 Dec 2024 08:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtMJ=S6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tJ6qg-0003Nm-KC
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 08:04:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f51b5f0-b2df-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 09:04:32 +0100 (CET)
Received: from DM6PR06CA0050.namprd06.prod.outlook.com (2603:10b6:5:54::27) by
 IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Thu, 5 Dec 2024 08:04:26 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::e4) by DM6PR06CA0050.outlook.office365.com
 (2603:10b6:5:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Thu,
 5 Dec 2024 08:04:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 08:04:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 02:04:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 02:04:25 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Dec 2024 02:04:23 -0600
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
X-Inumbo-ID: 8f51b5f0-b2df-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+DuXWGwAyDLLzb3K4J9ilEqWqWHFLT3LsNQV7QgxTX9ZCNkR533YTN5Z21JZNQc9CHKiKpjvdD2FGeuADqr7QgaTCGfBtmtZkmPo44Qkle8eEIjirHKDrWA+5/PSHmD9YPMikdc9hOTuiW9BvV0lNLTdBtWQkb04eTcnThoCTnLIPZtT3bAIvH/eOMnQjefFRHSiwBRJDHiJ9+F49RyH9NwKuQ423c+rLIpkyjTd78HQ/Yp7nqTSrB1cygVGa9GG1OZyTCzEUC8kLNNuAWMvobdM02m49E/SDyIf4e6darQ4WGzsxFJeRJrENbtSofWIRviz8ci2uomjhOYgF+7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94FhIpQYUlFz6e+5J4tHOh3JLjJ47tKls1jUrXSf6bM=;
 b=TUhjGSxaFtW+6RpNWpGS7Q6ewGmQ7xHZ53wV1IU8jSmfe+looWKe/2Gt4poaSkWT88q6ID3t+gP4ub9afEJpNanV6Ttq1UI4THWjeLhk5w1+gf1pQ+5wsoviK5CHInDu/zsZXXA8dc8RvKwQnF8NEd3LJcfnzCSU+SoigxNDfk3W56NhfWD+xhOvYLLQmhZbgNVQFzJYNqHsdFCVa4Mmusr4SqlUJVjBM+TQqJLUrFb1M3+p5bS5fnrAvPHtCI2QUjX8zfuya4fEbIAdExhAw6e5IhfYX9A1QJLJul0Q1WqsNxuV5DtjiPisUgbhSJB/3wymDZUlaigIkI+c2Pu6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94FhIpQYUlFz6e+5J4tHOh3JLjJ47tKls1jUrXSf6bM=;
 b=PgAH/oOLH9T+qIFC1w70qO8qW2jDtLh7ns2iBGWih8EuY/5CN1YOyQWXBZe7y/rakjR1D5aWa0EAE6FiZ7XMLXOvGJCxXUFqkAN5UAtnO33w0ykiQvnnQJN1ZMGJnGAk0kFgnJymHHfn6b1ysWlrCOyIhznHpAVyRHJICh0rTvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b67e2074-0658-46e4-af76-c43e2cf0d747@amd.com>
Date: Thu, 5 Dec 2024 09:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/12] xen/arm: add initial support for LLC coloring
 on arm64
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-3-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241202165921.249585-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c22335-f511-4534-b70b-08dd15036fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHhtQnNMS3VHUGNBUGdvZExidE1zcnlkeUtxTEg1U2JYbi9TcWNCZFJGRVVG?=
 =?utf-8?B?MkVPekV0ZWJaeFZWSGFRdml1blRVR2JHRENxbzRLR0Zpdnpyc0RodEdqMmNZ?=
 =?utf-8?B?UEt0WHVPQUVxYUgzOThBN05CU3k3dC9DcjRDeHhnTjE3cXdXMk1rS2tSaDVr?=
 =?utf-8?B?ZEVCME9zd29Cdlo2M2Jsa2ozZGcwcmZaOW5hbGZYU1A2M3phaDFkNTJuTEhD?=
 =?utf-8?B?bUo1NEJINExTMUN4dmlTS242U1NMR1U0b0FkWnJwZTRva3F6MVhGOWV4QWxy?=
 =?utf-8?B?eGFZYlMxclhiRVN6OUg1NHdadCtlaW5kVTk4YWRwSWJHamdXK0R2bHRKUzZt?=
 =?utf-8?B?ZmNkaXVGQ3YydURZTHowZ0RKcU1FM3kyUjEvUWVxTHBuOTd4em1DWmpvSS8v?=
 =?utf-8?B?VGd2Ym5oV09URXcwOEVEY2lyME1kWFlQbVFTNzRvYXUwLy9FL3pxbFdBL1pQ?=
 =?utf-8?B?WGFWUEE4RVM5Unh2TTBtZk5zNEtxU2tYMjlkUlpUU3BQeVdKUFU4cTIxa21q?=
 =?utf-8?B?TlhxaUMyZmJaUTdHV3poRDVBSmVCMldYeGdHNEpRQmNNSXhlVlIvcDl3QjFK?=
 =?utf-8?B?R0FoWjk1RWJYSDFBaGM5SUNGT1Z3NE50SjZ2MHpDL2FqUnJYNjFlUHZtSGpL?=
 =?utf-8?B?ZWxUMS96UnhIVFFEd1g0TU5WMnlIVXRXS2ZqWENCamJZS0c0eWRHUmNYQWdK?=
 =?utf-8?B?eHc5bjVnUjJzRTZqSkVzLzBhNCtLV3pJRHNORXZ6ZFE2dWozKzRXc2Y0TUkw?=
 =?utf-8?B?d2ovaVFtWUQyUHpBRGJpWE5WKzJlOEdqRlMwdzZOYkNrQWRvdTQxemxuS2Ni?=
 =?utf-8?B?Mk5Mam1IanFxalI2Wlo3ay9ZOGg0KzFyYUxHdjltcGFuOUFkdjdLamFyckI5?=
 =?utf-8?B?Ym01UUNMTEFWblVtTk9NMlh3alZOY1p2RVdFMjdRa1VFcWdrQ0Q5M09jTy92?=
 =?utf-8?B?ZHF3Vzd3SGM0bSs4OXdmVkZDWkYwY2U0aE5Vb0xtYklOWTF1M1o3R1BnOVgv?=
 =?utf-8?B?cjhUQi8rbUQvanBzcTF5Y2lyclU1eG1LOUk2YjFPYkpvVmZMNWY4L1pVWnp1?=
 =?utf-8?B?cjB1NnRwVGczYU5VcVVmdWRBOXlFeFRVQlFDSThGWTJKUmNSZWFIWFdSV0VO?=
 =?utf-8?B?bTFRcVU4eWR1Y2QxRXZZZnVRWExEcGZScXBTL0pVNFk3Z2FPWTR4eFE5Y3Z4?=
 =?utf-8?B?THY3VXRweU5NcnR5a3dSUWhQV0tmM0NOM0lqa2N5UGtkV2p5NmlZblRNUCtD?=
 =?utf-8?B?a2Y1elFvcXJVZ3NrYlFsTUFVbDlCWmFDZWQrNmtLSGNETCs1bEJrK1ZRUHZv?=
 =?utf-8?B?c1NTV08rWndxLzFuMURGQ0ZqMlRWeS9ZYW5Oc3pyUkl5Qys1SXJXRmZSU3BQ?=
 =?utf-8?B?ZzM2WDVpOEEza0M0dnBvU0d2WWl6YVBWbWwwWjh4VllEQnhhWnVySERZSUxp?=
 =?utf-8?B?ZXRNL0NlV2pOODdaYlVvSWFPS041QTdCQzNtMjBmWHJXRjErTjhnLzdXaUQv?=
 =?utf-8?B?UGRBN1laU3pCV0lNd3JPTCsvZEM5dEdEWFlvTktLTnJWUU54ZHp3dkhoNlh2?=
 =?utf-8?B?UTNmMFdrTGIySHJSbjd0MEdzY1VTa3NaMjZqUVB1WjlySlV0QjdpN1VqYUZX?=
 =?utf-8?B?eXhkc1dqN3FUVzN6NXI4ZjRYc0R4Q1FpM2RQU1F6Ry9CRHFPL1VnVEUrNWYv?=
 =?utf-8?B?SUdGTlhETHdLOHlpNXpBZ04zT1Y1V3VNd0VsNDcxVUVBMy96Z3Uwbk5zcEpv?=
 =?utf-8?B?cy82NlZVWjVkYW1US05JbW1hTk91SStIOEhXWmZBWllHMTdqVS8zbWtIbFZI?=
 =?utf-8?B?d3hDVTU2MWozaWpITys2Wk1ZbUsxUFVOa1RONTVxcHRBVGxvajd3bG9iWVRJ?=
 =?utf-8?B?Y3pxREkxMFgwdkhNRzBvUEpWUmVUeWJMT3FyazVqT1F1ZFhlZEIxZGY5eUt4?=
 =?utf-8?Q?kAjOdhJCUPJsp3A2qbfKOrNTrYVhBuSf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 08:04:26.2450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c22335-f511-4534-b70b-08dd15036fef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722



On 02/12/2024 17:59, Carlo Nonato wrote:
> 
> 
> LLC coloring needs to know the last level cache layout in order to make the
> best use of it. This can be probed by inspecting the CLIDR_EL1 register,
> so the Last Level is defined as the last level visible by this register.
> Note that this excludes system caches in some platforms.
> 
> Static memory allocation and cache coloring are incompatible because static
> memory can't be guaranteed to use only colors assigned to the domain.
> Panic during DomUs creation when both are enabled.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
[...]

> +    isb();
Attempt to build this patch with LLC_COLORING=y results in:
error: implicit declaration of function 'isb'

You need to include <asm/system.h>

Please, always try to make sure that each patch can be built successfully.

~Michal


