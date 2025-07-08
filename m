Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F5AFD9F2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037322.1409977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFtp-0006lI-6Q; Tue, 08 Jul 2025 21:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037322.1409977; Tue, 08 Jul 2025 21:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFtp-0006iD-33; Tue, 08 Jul 2025 21:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1037322;
 Tue, 08 Jul 2025 21:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFto-0006hl-E2
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:30:48 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2409::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce88b806-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:30:46 +0200 (CEST)
Received: from CH2PR05CA0057.namprd05.prod.outlook.com (2603:10b6:610:38::34)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Tue, 8 Jul 2025 21:30:40 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::10) by CH2PR05CA0057.outlook.office365.com
 (2603:10b6:610:38::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 21:30:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:30:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:30:40 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:30:39 -0500
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
X-Inumbo-ID: ce88b806-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1iIzUp8GA3RDDGBuphGnws082HWGZvL34xDrRxPh08mj74HWaJj00uWrGtm4xI9ptykG+yB3UKSaCAr9WIRe5S3iT02WjM84EuDoyzAMHXedxS+Q2x0+F+XfKJQgaonRi6yO3B/06+EdB5lWNqCRbDCFTDLQpRs69SOxahyAIdnSQDpuLnxfyDrnbpR8R5SKrLJiEMPP62jik9xRBqlvAQ9Cfw3Cm2fnnuycBO7ZjiVy7hOlHY6yorDD/tIh+R8eZol1yAOIPwl2Djt4WeP0INi50/f6Ij6OdZDXINwTOzfe/yFMqBYHwX2cnL+3J6dGhrljhoqJxW2uWf4jHvpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNDiOJi8mF1Yhz0y3wYTNAu0CNutPqlWLF45cqUnlKc=;
 b=OvNbaphoMTjQAB6yzr8+p5PuYpoGAPeqcFa0WjLcxHJ7lubb+g4EsGn0PPvS8FfSTlKTy4yQnOa3Qwwvi4Tef684nkXpKAvmA1BVz8XABUNR1gbLwt5ee8vK8qGc9JunGFn2AaUkdkOXGt4xw30Kc2xUkmNDC/OFL+92Z22o6xTLzuy6iWsVISp8bGWhlLtyZbhLfo1YAoGATbBwqLpSJ26Ly1i0NCz8+FSRrptjJpz+JSrJMQU6S85dCUtHUqQG8mI3XrafUWtSSFmYLeq2p5ydc8KOe0KvuVvh7OM/XKuaK0G7D6TwGP0uPp5wMM10mMFiEbBRwOqI1ED5bmAuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNDiOJi8mF1Yhz0y3wYTNAu0CNutPqlWLF45cqUnlKc=;
 b=xqX6CJ+vNO7EFCvsMg7Hxu6hSiaE6x5OX5Wvz83ctTiBlcXJsyP03LKzY8QJFJxUY9DOfrgrwL07aWmFl3OLEjKVH6vy6oXrxH6jipi8t+ogn8MmJkCAjdmYBpI6hIh0I4jzgoQN8QFbJvMpZSpeAGm22ra+G+dbo1DlSC/1JFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a758ab54-3d4f-4185-a49d-2cac8a21381a@amd.com>
Date: Tue, 8 Jul 2025 17:13:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 04/19] time: unbind VIRQ_TIMER across kexec
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf81768-a41c-467c-32e8-08ddbe66b032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmdBUHJXN0ZiM2pONXZUQzV1cnR1UlBlRlBpakFjeTMrL2gyRUlQTnNTdE1F?=
 =?utf-8?B?eiszR0RzdFhESmVkK3VFQ0ZteENmY1J3dUU3aWxyNFVOcjBSNWZKV0htMUVM?=
 =?utf-8?B?SmpXb2R1SVFqM2JJOFRacW5yOC9FY0RFSVZtYm8yaklHZ290Q3hyYUZZQWhi?=
 =?utf-8?B?dE1SYWpQRGtsMHFxanYzWjU1aWFkL1pBMHUzT1RwNUoxc0NDa3ZOcFdpOTFO?=
 =?utf-8?B?QUJyNW93aUtaVU9QdVYvVGVHLysveUNkQmxXYXVBd1Y5OTJhaTU0V2JTSllk?=
 =?utf-8?B?a29pTHNFTjZORHcvSW9landuZ1pESTIxc0l2NElES0x1V2JqUUFEMXd5Szlv?=
 =?utf-8?B?akMwd1dCOWpEQ0RqTWg1eW4xalVxOTNSZDExdlNuZWlFQjVHSW1sOXBGWFA2?=
 =?utf-8?B?ZUpFUlkvemgxUjhKOEpPMEVMU3dEZWNxT2pGYytjMGVuZEFBMFB1SnNBNjgr?=
 =?utf-8?B?VUZPTDhpSXFZRVNkS0dWWEJ4TEpCTko0ZXQ4Qld3ZEdUdDNWVEd4dUJFOWRl?=
 =?utf-8?B?TnZod0N2a0poRXV2dFZGczZIOUVxSHZVMDJDMGVsVjRaMXYwMHJhMmZCdFF0?=
 =?utf-8?B?Zjg2YjFBU055QzhiMTNKc0dyWE9yUEZ0TmJYZW5PcHR3V1E3WXBXbUJ0RzJM?=
 =?utf-8?B?Tm85QXQwQW1uNlRudzhlT2dGRGJMcU1PTjl1TGFQcittSWR3VGw2ajZhTnRP?=
 =?utf-8?B?UGFtL2h0WE1WczQzaVpsWjdRLy9tOTBZMDRiN0xFZ2MySVRPZkZ1M2tIVUtS?=
 =?utf-8?B?dmZhZ0o3SDRWWElPZTZzeHZnbXJGUDQ2eUsweEVQVkorR1QwRTI2empzZytn?=
 =?utf-8?B?NjZ0YWM3NGZlbitJM1NYS1Byc1dGY1hjNUhwbEIraEtWTGw0NWhNRlVOc3l6?=
 =?utf-8?B?TlM0eGVhR051bThYMnZmb2VDUHh4THc1Qy9LYktNOW13amZ4RUdFNDlXU2Y4?=
 =?utf-8?B?S3FaWUpxQXJIVkNoemZhNWRKV3N2bHlFWWJVdUVzbmhtU2Vsa3FhNEpid1hn?=
 =?utf-8?B?bFNVamlkYUx3Tm0xSXd6d3YveGdCTHZFdFNVbkhhN2hxeUdzSnJDb0U2RnlV?=
 =?utf-8?B?ZWNyN3ZPY0NGMkdMZEZnQ1BId0N5enpPNWMwTlZoUVFmRVpnbGNqUnhGU2pU?=
 =?utf-8?B?ZUYyV1VSLy96NG9zeUFralVpWnQ3aWpvaStmRXhJajQ1aUtUK0RpVG5leFNi?=
 =?utf-8?B?Q0xLRHhGRTlmc3BUZkFBR1JHMU9BaVpKNlRMK01ibzBEVG85cUpVSVpLV2kv?=
 =?utf-8?B?a2dqWkp3NUJWYTVpemFVVERPaGdpNUgxNkwxMzZveVdyQUhNVklUZXNRZmdj?=
 =?utf-8?B?ZnY0czdRUkFmRzlpeEM1ajBDY2hqT2U2cm9kcnc2RW5lVDUyY1hQNXdOdkk4?=
 =?utf-8?B?amF1RmVuUnN5UjhuYjMvK2oyUTR1emdkSEd6SCs0S29LbDJWSEw4Y1k4QXpp?=
 =?utf-8?B?NUFRalRDMzNmM2RVcWNBMlZtMFJzOS95MlBzMGp1YlRSa1F6djVUWEcxd0Fx?=
 =?utf-8?B?N1Y4QmZIcytaUDYwaGhHTk4rV1ZCeFV3dThkc3JhS0dTNDh0UWluNGZvMDMy?=
 =?utf-8?B?czhUdzZtcHNwaVQ1bkFwZjNVZXZKOXJ6ZXRmb1RkRVBLSTJJOGovU3lDbUJa?=
 =?utf-8?B?M2I5a1VYMEY4emJJaTNBUFM4REpDaEZ6QUsyeXJxemVYaVdsYTY5WTFnQXUy?=
 =?utf-8?B?UnpnenNpY1Y3VVdyMm96THVnOWg2N0hLc0g2ZytwSVdEZWRnNkRveWZGSUdk?=
 =?utf-8?B?L3dlSGF4TUt6a0FQUHlkUGdqYXJDUVgxQkhWVFl2ckpOdVhWWFp3VFZlQXRG?=
 =?utf-8?B?RmFRVG12M3RwSGxGRldYTmxwUDllOE1mZnY4WDBHYzFvS0ZDK01xRjBVdzds?=
 =?utf-8?B?ckNOblRuRWpkck1RTlNvMDVmNjNHYlFjVTVMeDBrazdLY0JMWHNBanZUOUJq?=
 =?utf-8?B?WEVaNXVHYzQzL2Q3cWQ1TFgrWHp1MFhQYU5TVjMvQXJhU2QrdGV4Q25VbkFx?=
 =?utf-8?B?dW5WSTlDRjJSeHBIU0gvY3NnRSt5M091d0MzaWhkdTRZY0U5Kyt2aWpadzN0?=
 =?utf-8?Q?gRjnAh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:30:40.7955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf81768-a41c-467c-32e8-08ddbe66b032
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724

On 2025-07-02 04:12, Juergen Gross wrote:
> Deactivate the VIRQ_TIMER event when doing kexec() in order to be
> able to set it up again in the new kernel.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

