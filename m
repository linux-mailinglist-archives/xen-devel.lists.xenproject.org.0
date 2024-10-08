Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D11995880
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813534.1226522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGsU-0001r3-4i; Tue, 08 Oct 2024 20:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813534.1226522; Tue, 08 Oct 2024 20:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGsU-0001pT-23; Tue, 08 Oct 2024 20:32:18 +0000
Received: by outflank-mailman (input) for mailman id 813534;
 Tue, 08 Oct 2024 20:32:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGsS-0001p4-B4
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:32:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66e8e49f-85b4-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:32:15 +0200 (CEST)
Received: from PH3PEPF000040A1.namprd05.prod.outlook.com (2603:10b6:518:1::52)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 20:32:11 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2a01:111:f403:f90e::4) by PH3PEPF000040A1.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 20:32:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:32:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:32:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:32:10 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:32:09 -0500
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
X-Inumbo-ID: 66e8e49f-85b4-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6/qsll3ylRsCEPCLvdzqO/rbX/DA67kfHU5W+dU5BK5Wrcq3+bD4+PC7JvKugl2UEA/GG2k+vqbxzr4aID+MMJBEUb1GDVHWPlzX0igIJ2zE3cHJ3mIs87oDAmI88qbxub4HnNWXxPwdEtAovqNkbl797PXy1FBwDxgQn5v1FUD+RdvRvQzAykjnkHpriXOzUHrCBW3NMv6bFzdSegOoW4qC7D2I3e05KFmEWipv+pZGtuCAY591lXIc0h0wix+ZhlorTqOP9dNmqRCCfzTux2xDaGosb+Oz83jE7yxVCImV9uWC4y5zAk9qXu3JhCeQ5Hmqik9xQmqGPpmZbp+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDlCF00A96LP+NDay++TYORdKMopPqRMWMKotkuSvDI=;
 b=y2cBboYpCvPS1Q+BQhddpKJ/hnVh9IMr+q52+AqGdQ5b+GfoNOfLetxf13zHI6rfwGc+E9QKKoPN6RIGqwgwyeVXkbgNWiXF/bnw9EdqISOx6jtRGrQePGrfaFL7oefaJOKMXqQAWmcG88MiNfqf9PH+n0wbliEUxA86oIYCfVuPSweQRMfg5eDgzgdsMVkKMxRSpAgEXlRrgas6p7NDnD29JC1HSSsvNgsP7nNSladqRYjlRpghMgD41mn2n8q5iCB3mRf9cGw2ZYAazbzMpA/1n+mf1Hm2y/GLBDPz8V7iu7zHLIj5c9izujPn+gzu1UkhRi52c7d5Hbyf2Jf0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDlCF00A96LP+NDay++TYORdKMopPqRMWMKotkuSvDI=;
 b=gDcQxH9FdUY/aQrXlp76apepz36WwE/gf5KpAHlBYuV0Osu2hBbZLybQrLEYMiVdgtzaTNOe2/kN5yHg5Pa3Z3y0O1sUqPXJD+jVgKhr68cRhZ7TaByTkmzT5j4u58V01XaZI7vRdNpRrCevsfOOeiXxC34J0/k2xpUNElxhwGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a26fdd68-9cc8-470f-ab81-0aa3d1ae187e@amd.com>
Date: Tue, 8 Oct 2024 15:31:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 39/44] x86/boot: introduce domid field to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-40-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-40-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d62f75-f733-420b-01d5-08dce7d84956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WURia1ovVTh6dWJyeTA4VHNkNWtWMFFudW16QTlkOERaSXMxaWFNMkZoNEJX?=
 =?utf-8?B?elA5dHdVNHpkL0lPUDdZK21jeitKcElNeVUxNFoxUWM4b3dTY2NmWjlSRTll?=
 =?utf-8?B?OWZpMnY2N0t3WHZRY0sxblExMjZRazdkSml0MEJyZ0hvM3I0bmNiMmFRTVBj?=
 =?utf-8?B?citaVitxcEEwS0dQdmQ3WE9yS0JKUGxobDZLd1pSY2FQSlBYNnZWVytNdmpr?=
 =?utf-8?B?cUZmNStzTXhScDZ5OEUxblp3L0haVFRDWTBNWmZwQ1J0SEF4cEsyeWR4QUE4?=
 =?utf-8?B?ZlJ1Rm5ZbWlkajdaV3RYd0l4MEtJTGtsMGZyWEdDb1R1U2t1S2g1RGgwVzRw?=
 =?utf-8?B?UGZ4U05kTkVHdEJOVmdsRDhWa0xRRExONVpjaDFoUTBpb2tNeTl0WjZla1BP?=
 =?utf-8?B?cWtHMGpWUWp4eEJNV1NPdjY0NDlSNklsTVFRdHJGbVhNeUdnNyt1NHJpNWRl?=
 =?utf-8?B?dk1HWXk1RWdxNjVTZERxUlFOZjIyK01pOU9QeDdKMlhtWEF1aW5acFNlQlJh?=
 =?utf-8?B?cWtWelNPeUVqUWs4SHNZWU5seEgyNVd0U0JlZ3BZa0FSY2hsL1Q2SFNpa1lB?=
 =?utf-8?B?OTVCcVFFNlRoNE9zVFFTSzBDTkF0ejgzZ2NQdFNBdDlmcWpOQzJSV3pzWi9H?=
 =?utf-8?B?LzlvQTNwQUNzZHN4VTdPTkpYTHNUWThBSE4vbEZDM1FOcVVGTUwrNFEva21m?=
 =?utf-8?B?M3ZVRGFwUnU1VWkyaDhCN3Vidkc4SWtlbVNwTmRyNStxVVlmYms1a0Y1STRS?=
 =?utf-8?B?Lzk1RFp0QXQrd1YrM3FTM1pMNEVyNnE4dWgzdDNmYW04V05rbDZ5U21RVTRW?=
 =?utf-8?B?UnhSVmFXTS9YMlYzYS9NSkE5WWw2NW1iejlseXVUQlA3TWxIYll4Z1FvSXV0?=
 =?utf-8?B?dm1wdyt6K2hFMkNxc3lpdEs2aEJHbmtWVWxZVHpvYStCQmZJc1hrUTVvTlRQ?=
 =?utf-8?B?TnZub3pXL2JwV05JTWNvdStSRnZVLzlJSlVMZ3VCd3I0MmJBVnBrQWNNeFZP?=
 =?utf-8?B?MlEvY0VEV1Yxb3VTKzREMXNadmdZY3NqZFlFb0ROcWk1c2JSb1pWZmFKQkdk?=
 =?utf-8?B?czRrci9TdjZlV0lXcnZZWU41ZzcwQlFpYkIyYTBHNmViUDljMXlqRWt3U2k2?=
 =?utf-8?B?N0RMaStPRWFSaWxuOVFTUFF3OW9QSzluT1lTeWwyaDR1Njdza21kLzdVVGtV?=
 =?utf-8?B?VzBTR1BJcVRsTVhIa1drWHBhT25TN0tjWDhvZVRvZStNWXMvaW9KNzNUREtH?=
 =?utf-8?B?ZmQxOXF4VHhtSWNOQ0Q0L0xZTDJqVldUZnNYRG9aTjNFaktheTY4cFFYTkpj?=
 =?utf-8?B?N2R4MFhzcE04RXk3UDFTYVh1SkNac3dJK3lMVjQ1K25nK1U5WTVra1phMWd4?=
 =?utf-8?B?TnMvYUVGLzJSSFlyT1BUVXBVR2NUR0xYc0NsNHNmTmVtMzJpRHlTU1p0VUZ2?=
 =?utf-8?B?cFdxY05keTV2SWNoOWJrSFhPTWJiTDVEQWtDeG5lS0tITnlGaXRSczBxN3No?=
 =?utf-8?B?THNTTkdjVzVVb3FnbmpKSXd5dmtJcTZCc0trRUEwRGxUVW85SGQ5Z0p5aHh1?=
 =?utf-8?B?bS93c2lZWEhNVnJaZTgyN1l1QkNwOW5TZmFKN3IvTXRNaTJrZW5lZXIwV25h?=
 =?utf-8?B?b3R3bEJBZDlhbVorem5RdTRUc2xvSlNVWlFyVjI0a2ZKY3I0UUFsaDdscmFp?=
 =?utf-8?B?RjBHZ0pvTUFmOUowblM4WmNGQ2dHbG4rMlljd2pZazVrQm1LcWFvK1VrQUht?=
 =?utf-8?B?dkMzcHY0MUY4THVpM0ZiekRVMndGa3loLzJ1QkhyWnlrZ3ZPZTQzZFA2UHBD?=
 =?utf-8?Q?fe5vob2d81wzGbfeRmm/4ajy9hUUm0UaBg390=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:32:10.8312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d62f75-f733-420b-01d5-08dce7d84956
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Add a domid field to struct boot_domain to hold the assigned domain id for the
> domain. During initialization, ensure all instances of struct boot_domain have
> the invalid domid to ensure that the domid must be set either by convention or
> configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

