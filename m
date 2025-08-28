Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53FB3981A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097922.1452095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYpd-0007Pf-Pu; Thu, 28 Aug 2025 09:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097922.1452095; Thu, 28 Aug 2025 09:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYpd-0007Nh-M7; Thu, 28 Aug 2025 09:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1097922;
 Thu, 28 Aug 2025 09:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urYpd-0007NL-36
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:22:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 774e442c-83f0-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:22:07 +0200 (CEST)
Received: from MN2PR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:23a::7)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 09:21:59 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::ea) by MN2PR03CA0002.outlook.office365.com
 (2603:10b6:208:23a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 09:21:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 09:21:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 02:54:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 02:54:54 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 02:54:53 -0500
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
X-Inumbo-ID: 774e442c-83f0-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjazLjFpBeQIf3tBy0726Wb+oVR5UBSTyMY7OvJ+QYEf1Pi/knr9mLDFiHoJKzzHn2K9y30mfxFEh588UnYmU68TjAT74BG6K2QnWDGA2XaOQJ29iJAJFGW/DY2t7UKnPDvqm6fJUKOY4p6gi6REUewyCsVNUN6rTLT+FR6hA8VBaj02pH0RqpeZbpgiPmnRBSt/CWbpsvYaMuOvxO3dsAvwmIgWiv2IuVLTHb2ahPfLtZCITc1e5Nq9KLF+rboZSKYqBOfQQd4moXBo0xtm5zmP4/HBfFGe+lx4a3CIBmvyJpdLQy0Cp7CC9smSsca2aRKruV3Iy5wxT+rSraEm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDw4qFH2GiTyqRXwV3/79RMiCK2Tf45dqdB61FAL9nk=;
 b=Fz3CiBkDieGfXh1k91ragX6JTbPCEBHCw57hY9vrMpunaLuItbHUIH/6h9ZIUshKGXg4Pob9AcX+vn0Ot3571K8+H1My73RZ9E1D+HO1pDXTyWFdtX7W0GF0O+yQpO3uQIHUs1Af5407AW/EeYjFcu17ElkBG38th3xL5vRs0dvFR//ZT+dwFMl+MJc7E/X62tpSS2uVkrlUnT1TfI5URxcxNXRTtCbfuCehRzWwWEZMMs8crDDTE4kimwgLCyxhnh2R5oERPqvWHMdNlE2TBQa0yPO2qo1iR/w8rFbF1EDxWOIpNxFvAeQB6FWE9Y4xmH5HNRBuwYX99Z3UusCpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDw4qFH2GiTyqRXwV3/79RMiCK2Tf45dqdB61FAL9nk=;
 b=zFJ6f2WAJ1xzVAtc8Gk1rwPIN89tf2HTEDIDK0LLZa9IBwr4iIMkEN13SMM1jrehdCNGtxF1Y2J3a61KSkmLdRucoBvTwU38aKqtNovkA3iHG/HZ+xCIp/qrj/ZiD1r+/aOwYWLwRUkM2ZgPG8Fv4yotzJc9LmFQPk5XUg326ho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6d433de5-168c-467e-af6d-2de69114dbd7@amd.com>
Date: Thu, 28 Aug 2025 09:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm/mpu: Implement setup_mm for MPU systems
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
 <a000dbac8fb8e90eb61882760a2dd84cacfe2eef.1756312498.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a000dbac8fb8e90eb61882760a2dd84cacfe2eef.1756312498.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: b198bcc9-41c4-46c9-faf3-08dde61456ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDd1eHVTdDR3SldxUHZFRlJUZUxPMkowWVM4WUdPZVZ5TE13SEJJNGEzSkdu?=
 =?utf-8?B?TXRhMWdBTElaVGFsVGZMcjVPRVY4Rys3NjJvbzdaeXBicTdTamlIbDJ4dVhV?=
 =?utf-8?B?QjJMK1hBV1FLNzJaS3BhMzRJYXdvRmhGOFUvVklkay9salhDeWJFMGhXY0NZ?=
 =?utf-8?B?S2xrNTFrSDNDL1pnTDBGTFJoMnlkeE5nN2Fncm9saXZ3MFh3aVpFdjlwK01w?=
 =?utf-8?B?RWxuQ2Erb1plRzM5b0J5eC95TTJITkZXeXpwRmJweE94TTdCYXRuWlFFZ2ps?=
 =?utf-8?B?c0x5eU4rMnVLdk1jamhBSEgxS054VEpsRXBoNlI3cnZISzBlbml6TkNVODlV?=
 =?utf-8?B?ZjlHcUFsR2U2NTcvaExYajc5TGFwWTdsR3Bmbmg4eitFdkNzYU5MaThiQ3gw?=
 =?utf-8?B?U2txWEFMQTNZU05rWFVzRUE0cUtMK0tZV0pBUmZ3WWxhQTNUUlVVNmtuRE5q?=
 =?utf-8?B?c1MwemtZQzRIa0FmQllKYk1XUXRKVUFYQlRXUGs4aDFFS2tCdDNSeGcyaVNJ?=
 =?utf-8?B?RGJRRjVDRW1mR2RBVHJ5dENMQ0VOeUVMNnRONzBFMDBFQ2dNcnFJNVh5Q0VR?=
 =?utf-8?B?VldrbmMrQlphK0prb3NleDI4RVlHQ1oxdXJJbUxJMU9XTUV6SGVzWHNnUzBF?=
 =?utf-8?B?WHNBWmpRMFpBVldlTzF6ZEI2T0R4TnkvaVV1OTJ2Um1SMEs4VHBmRUliOHRx?=
 =?utf-8?B?OUw2eFJpd0c4M0R5Zjc2OUJUM3BrOEN1MGdmYmViZ3RJYUxGWDZCWXgweGg1?=
 =?utf-8?B?eThRQ2ZXYjVVVnA1WTF4NXMvdDRnVlNVR05vd0Z1dnFGYVhoeDJnVHMzUlI1?=
 =?utf-8?B?ajdPYzI5MEptdEFpZC9aTEU2djBNcTlaZWc3dXpKanhJSThaeXlxOVlTc2RT?=
 =?utf-8?B?S2tSaUFvejlBdEszb1lyMjdrakdaUFRyem5wYUIzTnk4MU1lS29rTngzaHQ3?=
 =?utf-8?B?dDVWN2djOVd3QTBIRTU0VWVZVjVIemRLVy9uUjFOVnA5UDFyVkFSZ2w5NjJk?=
 =?utf-8?B?ZXdoOVVWRmJ6SVVQQ0NFWHpTN0pLeHJ3ajF4eG5aMHorTHRaNDgyWWIxUWFv?=
 =?utf-8?B?N0pqZkZMcXBYdHExeDE1Zi9EajAybWFNdE5WUnppYlllYXF3eGZlT0c0MkhW?=
 =?utf-8?B?cGptMDlYWVczKytDRWtLVTRBeXVmZ054NEdNSmUvU1BjNlN2bkkyOWhVMkpM?=
 =?utf-8?B?YkZQTzQrSHFpcVZCUmFqQVl1MldEZDdVYlBTZ3BmelA3U2ZDbFhURnkwZFlV?=
 =?utf-8?B?V2lER2ZCcTR3SG14MlFPYXdFWDdGTnk3eXRVcnhUVlVhYnM1NnFnc3djeTd2?=
 =?utf-8?B?SUdzOTlxSEd2d0k4N1drWjJ5cHNOVWwydm9maWJPbjFnZVI3bnNzMHFaM25j?=
 =?utf-8?B?Nk5BUGVWeng4b2krY3VxMzI0L3d4Ry9Qb0NOQnNRUjZyR1RGUFZSM2dhU3NG?=
 =?utf-8?B?aUdTMDdONUFQcjdQVE8xVTdkR1V2Q3BlK0lUb3dMWGgxNkdzajNiTkg1eDNM?=
 =?utf-8?B?WDZUNU9ERjRnT3VvVU5sQWE2V1E4NGJaWC9PZDgrTEs4RUxtNmFIb0x1L250?=
 =?utf-8?B?TUFUaDR4R1owK2pYeWRXcC9vT3VQM1l4b21DQkJITW1COE85QmRTYTEycVNz?=
 =?utf-8?B?SzlaQW1paVp0VjVPY05YblJ3eEZQRGFIZkpNY1ZvSVNnY1JTNDlvb1YzcTJv?=
 =?utf-8?B?Y1A1dHJTbmpNZXJQNnJ4QVBZL2E3WGpiMHhsaHJobCtPd2FobXhSd2VGTUpE?=
 =?utf-8?B?NkZjbTNqeU95SGhyMk42ek1VTmJLWDh3VnpoTC9uQ2dlaEtMc0dJYmFDS1dZ?=
 =?utf-8?B?WnlVbVFjRHFaeVl1YnBEaEx6TkZONTU2dWMvbDZ3b2ViQmpGeDErYTVtdWti?=
 =?utf-8?B?anBKVGtxU1dCN3BkVHlEMm1sS3ZBdVcwSFd6VXpQdWtRNWU4YU5YWmdPT0Ru?=
 =?utf-8?B?SzhUVXhkeGVicHBzQTVqV012YmZLdENhZTZMd1ZyVDQyYzJmby91V296eDlM?=
 =?utf-8?B?YTJHQUpGL3ZMcEpzRXdsOWYrMDcyNmhVZzRIM3BHNzVyd1pXWE5Md09weSsy?=
 =?utf-8?Q?65tudu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:21:58.8112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b198bcc9-41c4-46c9-faf3-08dde61456ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323



On 27/08/2025 18:35, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement `setup_mm` for MPU systems. This variant doesn't need to set
> up the direct map.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


