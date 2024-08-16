Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C54954284
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 09:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778405.1188445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1serBU-0003e5-Tl; Fri, 16 Aug 2024 07:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778405.1188445; Fri, 16 Aug 2024 07:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1serBU-0003bP-Qu; Fri, 16 Aug 2024 07:15:40 +0000
Received: by outflank-mailman (input) for mailman id 778405;
 Fri, 16 Aug 2024 07:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JmuG=PP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1serBT-0003bJ-Ki
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 07:15:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56087842-5b9f-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 09:15:38 +0200 (CEST)
Received: from BL1PR13CA0223.namprd13.prod.outlook.com (2603:10b6:208:2bf::18)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 07:15:33 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::df) by BL1PR13CA0223.outlook.office365.com
 (2603:10b6:208:2bf::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10 via Frontend
 Transport; Fri, 16 Aug 2024 07:15:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 07:15:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Aug
 2024 02:15:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 Aug 2024 02:15:31 -0500
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
X-Inumbo-ID: 56087842-5b9f-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnxE28zwlMCFeQxuRrqGMWJ63ikBd0YKLCDiYxwGhVivdXUdNYUyQO3YqkN1IhlhY7xjZqbU/vn6H+yWYCukGbpm9KVUUGuzZugGVdrNJWf4jWJMMKYw94anEyWe4rPEdU8InjH0ZLgpCIBYp5bkVFnSE7EkLKMid5cEPiVIVflZ2q2d/1eXFk8mFvO/3tcXp+/FrMrsFGhQiSEi8wWZqiqnghiKbX2QcQPdkzONFPNHPOcPzY8T7nHOZtfLfe1oUvogJstZ8GD2FfE3QDj30NKaQkhn/LI6pFq1a/uaszwW+cFJTj+lk0oqaPuMz7hXXqII5nHEZNRyyeGEuPNPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8/B28iADeTcy5vexkMVL7Ck4XrfaH1ucAq2Vs70CK0=;
 b=GHA6ls7cEQTE6rB8SXLQbzyT2089dat+OIGZET2YvAqyMQIxJ9ZqE637HHfYy5KL2LGxlJ0C5pBWIu9lLmTDU5qEMPKpTv3wIm8Mbx72RQT2gjVSBtEyeAnzQo/430VJVyV+xRrYV/h9ec70JK+p6i4BahINO05Y9s8UgIZASCGVYD+RrV8AgdiICVO0CxyagXDASAxEcQw7fQvYRX51/F64udkZbiMXpv3jl/G/ohr+EZt1pb6qP1amh55hTKEOzV/xmZPMkuJFuvzIedZxbENIie6sN+oZPIkBHkhAfoKqdIYsuA3U3ZS1GNXrQoAby+sKo1oz9Hh8DdXkNpVzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8/B28iADeTcy5vexkMVL7Ck4XrfaH1ucAq2Vs70CK0=;
 b=rEbKWGYkGd2s/aphE955RVyORo8zMoostWm0WDKzd94odohwJwRH0QcIj49312np5iZz5ZH7SF4IS/QRR8GiPZXvItLU/eHsDgjm9slg1iY53pJsDb0hhhz8/cqoReGaaTxrXeSV11Vy3/sxDdDw/mVkGkbi8sNr0c3k97mKzGw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b306e03e-17d4-4d09-aa8c-78e44dacacca@amd.com>
Date: Fri, 16 Aug 2024 09:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Hide FEAT_SME
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814210054.67520-1-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240814210054.67520-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: db8762b4-623d-4260-a566-08dcbdc337e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVBkbFFIbnUzSFc0NWxLaFZnYllhSFlHRFdMWm10TGRHYmw5RzBYQUp5WVdy?=
 =?utf-8?B?UTdocFJkRUJ5eUZJL0RTVHFtNG5TS29iMVlzR0l1Z2haQzk1KzV4bWNmZHB0?=
 =?utf-8?B?bE9FcWg1cTFuS2RaLzNONjdvckJYak11Sk5tc0ZycGpxOHptWFZ5V050Smtl?=
 =?utf-8?B?TlN0TG1DdUxmd1ZIcWJ1MUUzVUR2TU00NTZJcWRTRHRTZWVDTzlRYy9jdWZl?=
 =?utf-8?B?WUxDUytVcUJrNiszQ3BrZHBaR2p1dnVhOHdlVHRHY0VFN2dEQjRJaTFLenV5?=
 =?utf-8?B?NExnNGRadkZncFRPWWEvZmNJSnJENWYwaVFUclkrQkdzSmRTMVRTQlpyMTBm?=
 =?utf-8?B?WThDRGNBMFJqL2hTZFhGTlpBZ3k4V1c2RTdYTGRrbDVYZ3hINEN4QTIzWG9h?=
 =?utf-8?B?R1JXOG9Td0hjcEJyMWEzZE5HdWlWRSsvZWF3M01oNXBOUXd3WDJ1dGJoZVNh?=
 =?utf-8?B?aW8xalJGK2NJMkhuNXNvanVYdnhIcHpFVWJOai9SVGVJelpvVTl6eVBlT2Nx?=
 =?utf-8?B?WEVxVTlHV2VJeENqWGl4bW5rb2hxelRHZSszeEM5V0RtMFlCVlVNYUxoOEZr?=
 =?utf-8?B?dXNsS2FXZ3NPVmFoVlN3U3lJeUdRZVQ1TXVROEtSTlFkbnU0T05WaHJnU0tB?=
 =?utf-8?B?bkxEUVdqNis1YzVyVUUvelpKb1BWUFlhYnExaVBaZDhLaVhSZ0N1Z3d2R1Z0?=
 =?utf-8?B?V05ydjY2WFF0bURITHdnTHJRakdXcXIwSXQ0WFFOQzI3TkFvZlJFZlVHcHh6?=
 =?utf-8?B?aU96NFFqREpTREd4STZ2dUdNa21PdkEveVB3NTVCR05tNWMzOFhDK1dueTRF?=
 =?utf-8?B?bjBKNCtOR2RjeVRQa3lHeGJuSnQrOFgwUHVwQmFIYzRMZmFQaTRvS0MzWFQr?=
 =?utf-8?B?SjdNNWxaU3hhdHVCV1phSzF3eCtWWVdLUytkTFlmcFFQcmhjSkRyWlkxUklI?=
 =?utf-8?B?b0FNNGJwKzl4Ym9mOUR6SUR5SlU0cTZobWJKa05td0E3bmdIRzRJUjZBdlJj?=
 =?utf-8?B?RElweXdFRWI2d0Y2WDl0eWgyUVRGUjcydFZDN2ROcm9aMWl4aUI2ZlFhai9F?=
 =?utf-8?B?dmlucWFNWUlDQ3lmWG1pZHp5bEtCNjlFZFBpTzdUNWI4MnpBOUVZZEUvazFp?=
 =?utf-8?B?dlBWeWZpdWVqUXVxeFQ0SitYSU1hUDNDV2xvc0NUWDFjMDJhQjU5Nlk0Yjg4?=
 =?utf-8?B?YUt0K3JobXkyU09JcmV0WlBWTlJ4MW5SMVhnNENnd2M1d00vQUlDd0dscTMz?=
 =?utf-8?B?TjQzeXFLNGVaZTR3NEtGNXNXRER5V0M5cWZQc0U3UkpTZzh0cXVLM1ZhV1ZX?=
 =?utf-8?B?S3ZyUk5xSmszTG1FbXZYTFJETFJXd0JwbVJpcXRDZWo4N21HMlhFSzI3WFFI?=
 =?utf-8?B?YWNzeWgzUktibndUbEVtZ25YbU5mZUJrWUpyaC9qWU5RTHB1RVpFTE5uOThI?=
 =?utf-8?B?ckorWTk4U3RTUGtzR3I2R0tIdW1RMURrK0RiK3hoc2wxT0dIb0lmbFgwTUpj?=
 =?utf-8?B?L1I2SHVjQkN3VlFOZEsvSDFKRmUzT0crMGI0UUN2WFBEZGFRblVjYVRYS0p1?=
 =?utf-8?B?SkxMb0w5dHJqY1dqekZsMXJjSXBXc2VwRGg1aHVjUXNQU0ZjN05kUlJKS0tG?=
 =?utf-8?B?QWZDVi80d1RJMi90NmtKYVFDa1UrejVyb25IbG16R1FBTHRpdVA1N1lvWVpi?=
 =?utf-8?B?U0liQTh1dVhnSFhJZ2JYS1A0ZmhVUVUvdVA0Snd4azJFUTRiWG1mSzVaUEs3?=
 =?utf-8?B?V1ZZUVlaNk91cjFTbFZZNENNSW1XYkkwdjBVdTJ2RkFCLzVCdi9DNmFJdHF6?=
 =?utf-8?B?YzdHQUpyNTFEM0RpbUNDMXlydEROeEdVU0tyRjZhbm9GeUtzZHZDNjNPUGQr?=
 =?utf-8?B?TUxVN0JZWTQ4L1dETEhIZDBUYjZMR3gyc0lxSG83bWExSUZFTGNOdkZVcDhl?=
 =?utf-8?Q?04jlAizSi0YWK67Nd9XtaS001n1bzFKe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 07:15:33.2884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8762b4-623d-4260-a566-08dcbdc337e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944

Hi Julien,

On 14/08/2024 23:00, Julien Grall wrote:
> 
> 
> Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
> it will still expose the feature to the VM. If the OS is trying to use
> SME, then it will crash.
> 
> Solve by hiding FEAT_SME.
> 
> Signed-off-by: Julien Grall <julien@xen.org>
Acked-by: Michal Orzel <michal.orzel@amd.com>

> 
> ---
> 
> The current approach used to create the domain cpuinfo is to hide
> (i.e. a denylist) what we know Xen is not supporting. The drawback
> with this approach is for newly introduced feature, Xen will expose it
> by default.
> 
> If a kernel is trying to use it then it will crash. I can't really
> make my mind whether it would be better to expose only what we support
> (i.e. use an allowlist).
> 
> AFAICT, there is no security concerns with the current approach because
> ID_* registers are not a way to tell the kernel which features are
> supported. A guest kernel could still try to access the new registers.
I agree with the security aspect but the part of the sentence in the middle is a bit misleading.
ID_ registers *are* a way of informing the kernel about implemented PE features. It's just that
the kernel could still access the features. That said, it should be considered an incorrect behavior
and definitely not something we should worry about.

~Michal

