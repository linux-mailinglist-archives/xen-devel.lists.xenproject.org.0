Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8CB3913B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 03:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097350.1451740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRl9-0007VH-KW; Thu, 28 Aug 2025 01:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097350.1451740; Thu, 28 Aug 2025 01:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urRl9-0007Tc-Gu; Thu, 28 Aug 2025 01:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1097350;
 Thu, 28 Aug 2025 01:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urRl7-0007TW-IL
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 01:49:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2810ec60-83b1-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 03:48:56 +0200 (CEST)
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 28 Aug
 2025 01:48:52 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::b2) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Thu,
 28 Aug 2025 01:48:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 01:48:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 20:48:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 18:48:50 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 20:48:50 -0500
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
X-Inumbo-ID: 2810ec60-83b1-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoY2XSol/80zaKY2Q3PFNXFs6IODWfQSBG2SsCuIPRiwVKR9AywbttT1F71bghaqKvFHdQ5xbD6iwyDywK/alBSY8n0IeSNT1IKIQoS9dOnC526amK7Mr0NBACHA7wWXN3575yWT1uqNDholmjtj8NNRf3bYBYMgiHROdNZ9cdIZSdKMSBC3S3VFvLbNFr+1ARh8wXvnFrTulx3YebM+o56x6IB8STx5ThgTq2xYPf+V9ZPvJ/+ncH710xr3UAozdVG9DHndpA1W+q1nnhyj4I/98lenK88F+mplAyeuhx8z8E3/pjrvCDJXN71vcQxPhEB6CcUfwEtjIIMER01HXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgWOqHOLeM4Q3C0RrcY09K7HP8O9D6dmQ6CKyFy6wz0=;
 b=g/sAeBRuSufEaS2wsm1M73ysQth//taxmFp+4/hYEb+p8MD8OTjKiTSueseNhifbOjDwBZ3Ub7fX8oI5T64AHW8aSz1Ly7Cjck8dNX/ZmjWPMmFTRRniLWSSrF5a/M8n4ZxhQSwpgGZvwYFTJ9cMBfjjir2cVnQ4j8MsIZ0eGbwadn5MLF9rvBSnPm7UerdQqB4WSLxr0+DhPlJCZ6TYuZHr36lHH5WoJgCjifTzqV/ADJPiVd0hr6eBelibMGLuvho/L5b4GkDByBJUuTa+RlOkp5KREG2PgmG6I/i7WN1EOYNCETz/eFKGaWwCC72o++viaY0oQUhErUW5a7/4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgWOqHOLeM4Q3C0RrcY09K7HP8O9D6dmQ6CKyFy6wz0=;
 b=a2+Uw2DPmBgmaQTV7b5hNcFZsuMdUH4HWyX7lmZJ52lGHDDQVsxn9fQUVV3RWazAH7N4hJ/48QmxhumsQIsh/wQPHZvK/KD48CvAwUgwBB2NP4Wq/2PwBKO/TtyjM19aaKXdaSulaZMc8CbABBns8p0V3UH0y7d5a0JDlVvAvEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <318f8ef3-aa52-421b-b9cb-6cd6139e1dd1@amd.com>
Date: Wed, 27 Aug 2025 21:22:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: MCA hypercall with PVH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc3e394-02fc-4b40-a249-08dde5d509e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akp0T1FlWnFSbGJMa0NPZDhGT0ltN2ZRaWZTV3ZaNzNEd2pCdVBwbnFNV1h2?=
 =?utf-8?B?VjlSUWN3MHRZcjJBcjhnUHBRY3ZoRGZPN2puQU1EaTFxQTZzVjRoM1AxS0ls?=
 =?utf-8?B?MklLVEExaWFleUplN29QalkrWG1waGx3bDZBSkhEODd6V0NQcjY5bXU4Z2FV?=
 =?utf-8?B?Rmttdi9Yb1liWXFwQ3RZSEVwb0tLNXpOL3R0YXR0YUxMOXRlQkFKZ1hTRmI2?=
 =?utf-8?B?UWYvdWtDeUNMbGFlRE5rRm8ybWlRVDRabVZ6T1pKdXNSOHVaUzMyU2plM1ZD?=
 =?utf-8?B?Ym85ck1uWXp2ZTQ2UGZReU12dm00ZE16dU11NzJoSm93b1g0eE90MzVuVFE2?=
 =?utf-8?B?NFpyUFNicEo4Mlc1Q2dXY3VVb2hMZHVnbVRTUWFtdHgwa3hRbG5McEFSbE9w?=
 =?utf-8?B?bTE3TWQvR0wxZStRbWNFTjZOMjYraTh4dDNicm9hdm14U09XV1l0VU5GYkR1?=
 =?utf-8?B?UGdzMUVSL092TzloNGJkWEl4YVlzZm5pNWdtRGkxTTREeFJQWVVFVExmUTFO?=
 =?utf-8?B?VWQxcGwxVDAxaXE0NUxoYnNQYVZnOG5TamdYWndZZnN6akZLWEE4Tm84Vlkz?=
 =?utf-8?B?T2JpZzNlay9uVkhsM1M2UTZPTGEzU0ZnWEJJRjNPT1VaM1ppbUs2UDVKcWRl?=
 =?utf-8?B?UWJsVnJWSS9PQVVNcmhybVVPbjBYa2ZVQXBSYkluaGZuQWc4WjZSclNkWVlQ?=
 =?utf-8?B?Ny9BUGVxWW90V3ZRcGNYemdCU01MRHpwb1JsYnIwZW80WFBXckNtSnBUMEdX?=
 =?utf-8?B?TWZlQVF4Sk5pbmREZHltUlhQeEdOYTNWM1RLT2RvZXl1MXBjd296aWZ5QVcx?=
 =?utf-8?B?ZzFwU3lyd2VhT3c0ME4vMjM0SUlJclhlbHQ4aFBKU1JVZnJxelRyd2xwejZJ?=
 =?utf-8?B?blFDOEw2bklWUVppcVNmSDZKdXBkbVBKNjRzbHpCb3A5WDg0MjUwaGNOWVM4?=
 =?utf-8?B?WlVmSytmVlFzMHBpNUVPa1luYnB5UGx0VnhhM2NpbDBnUExxaXVrKzlSNGVn?=
 =?utf-8?B?NjRnMElBR3VFbnhVcXV3czZJSFJEbDV2WFVtY09ZTkxoQTFZWXhQRGExTUFC?=
 =?utf-8?B?aUZxU2pwZytldS8wL0plMWg2eTdFZGVFYjV6NldaU0Yzdld3b29xb3NDY0E2?=
 =?utf-8?B?dmJmQStSbC9ENFQ1aUtsdkNnZWxZcXQwbk5nTVB2dnQzZFBseVM5b3VWN3ly?=
 =?utf-8?B?b3p1QzB3Sk0wK0JNRHV0THJodWlEeXZCYjVyYlJtTVdBcld1UmJKSlVBdXJB?=
 =?utf-8?B?NEwvTTdJMURuZVBFYU5BN29kWFdxVWhmTjhvWDZHb2lsQ3c2SmNTY2hydzd6?=
 =?utf-8?B?aHBQcHpXR1N5dDBiUStBNzI3Z21oNWxjaU91Z0grLzZSNk5PblNjR3BwVUZF?=
 =?utf-8?B?V0U4Vis5ZS9GZ1E5bjFXdVl1ZUhSbzZjWlo3OHZKL1dvQmx3YUE4b0VtUFgz?=
 =?utf-8?B?OHRUSzdpUjArSWxpZHVpYmhZR0tvbVp0TzFwYmR4czdZMGNCZEhMMzJaNmtZ?=
 =?utf-8?B?eW9LTW5TbmI1ZUI3S0JXdUV3dHk2cVNUNVRQK0xrYy9TbHBzTlRQS3I0SHpQ?=
 =?utf-8?B?b1VDakRwQ3NVZE9vSmU5Y2JNdEZZNG5tdnhJNnExVlg0eU1VbEdlVW0yZVJv?=
 =?utf-8?B?V3BEQnJBdVJFbytOeHd4dkIxUnlidWVTaWZZRDhyUVlUNUdVTGRqUDF3djRJ?=
 =?utf-8?B?eW54bjhMcFFvSWZ3RCt1dUVvZW9sdTl0Q1NCaWVqdEFja2JPVElDZzNzaHdq?=
 =?utf-8?B?bXFsQ1B3TEY1eElDR0VTSmNuVUhMK0JBdVRYZ1BJL1oyTHhxeitOY0RwV2FK?=
 =?utf-8?B?VW9ZbnZXdzJJWDBLRXowVm13R2RUL1FkcnJ1NUdzRlZpSEFvU3ZYb1p4N0tN?=
 =?utf-8?B?VWtLSU93a3gveG11NHNUQngvRFM1aVdpWDRBcFhzQkh2WmtBWHFkdWxmRGZr?=
 =?utf-8?B?RUlyR0xtOTNXN2w1NE5NNEJ3R0hvakE1QWtZd1cvTGVTcTgvQlZNV3BzazBC?=
 =?utf-8?B?NE1uRXZpWkZ6bUZpbHUxZ3RaY3RzWDREaGdrRTlwa2JVb1lmNmNpeTJnbDB1?=
 =?utf-8?Q?iBzw3o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:48:51.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc3e394-02fc-4b40-a249-08dde5d509e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Hi,

The MCA hypercall, do_mca(), is only available for PV.  That is, it's 
only added to the hypercall table for PV.  Is there a particular reason 
it was omitted from PVH, or did PVH dom0 just not exist?

Thanks,
Jason

