Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB4993652
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812336.1225063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsbW-0003Uk-Eu; Mon, 07 Oct 2024 18:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812336.1225063; Mon, 07 Oct 2024 18:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxsbW-0003S1-C5; Mon, 07 Oct 2024 18:37:10 +0000
Received: by outflank-mailman (input) for mailman id 812336;
 Mon, 07 Oct 2024 18:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxsbV-0003Rv-9G
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:37:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26ebe63c-84db-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 20:37:07 +0200 (CEST)
Received: from MN0PR04CA0002.namprd04.prod.outlook.com (2603:10b6:208:52d::13)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 18:37:02 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::5e) by MN0PR04CA0002.outlook.office365.com
 (2603:10b6:208:52d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 18:37:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 18:37:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:37:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 13:37:00 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 13:36:59 -0500
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
X-Inumbo-ID: 26ebe63c-84db-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7N/5Ui8Lvy5qsi8iOvYjaPOXOtSu2CSMGMQ6/Yg1ZdGNIyK+m6/A08HfcS1223el5aT5ydqn0EMhFGRA42obs+8PqE63CclMm8MUPi8FBBYpSStQDnLhmGqO991t56Cg8+F5EgNRtYJ9QZMl0Xc1FymJOpjsHARFXiS5jEN2e0wIo70uOCesEdMeHjFSBTOywsiYw/icF3Oxk3/q8eCDQfoxazpqFEKMs4l2EhxVwJQDl4+NSKlveHeph30oE9y2K7Dl0F2xILx+kZOB/w7V3UPL/PWVVvr6irQp7T8StbHm1TQ8OurA8Bzd0Qc4ZnLjbftkx79kTKnSYP+CMsuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwc2pQqtFhWyGWFjKNvV1HbZoNj8Jl6VTxoBD/7+roc=;
 b=P9/QCtMNCJPfWJ9wVmyVZ71YpeukzmHWfYWqXQl+Z/Pl0K4MhU38CfQ4rWtIEEUM8Ua/6d5cX9lFtSV/5pp5lLigpUcbTft/FnvReB989hHvs6Z+fXEUIW1LYfEUAzPVhNmcyl+eujcVIMllsGdeJlbjw7sSqU7l0PwN4DFk1nNzY1WWQDRJQKuA+A3qOBGF6ShWsd9VLmIPPwhom1YLAKtFfQi09kg59NKhCP+OLzmLkzarZ5DTnDTnlADBHJ2FgWLIaeg3Zv8whDfq7TCUD9GbVm7zBRB8FSHHAmKalFDqCdqwjb41VpFtTysXezKTr7KqqqWVFxUrtg6tQPkFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwc2pQqtFhWyGWFjKNvV1HbZoNj8Jl6VTxoBD/7+roc=;
 b=XBrK3fJxr5Ykbct+h3s4joZ2x/PXeL/BDBOiEc613QY3Jxblc158P2HbJvG+jf5Oln8oQrPTuPh2aUIZ5EX34mJUwyxdY9faJbiD/OqWP5aw7In7pdIzAWdMytTbypn8VxS6sUcoL1e8/ZZQ1tgKkCchLD2uwJOqmoD2dORnkOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dafa43ad-2355-459c-b4a7-231bb6f43dbf@amd.com>
Date: Mon, 7 Oct 2024 14:36:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/44] x86/boot: convert consider_modules to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-7-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 9441bbba-13b5-49fc-f110-08dce6ff08ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmtHRmU1TFdWZWdITjFrMmJFV3o1cHhPdzNxZ3JQOHFlcDlXTHR4N2lNWTR1?=
 =?utf-8?B?QUJIek9FcWVnL2R5ak8wZHB3aEZDRHY0T1NmSEM4Ni85NllhVGhPYWRCM1Bl?=
 =?utf-8?B?T1B1SHlLdExkQXJyZkEzTEFxVWZ6QWV2bGp1Z1AwMThXVDBKUzdOd2ZwZEs4?=
 =?utf-8?B?Wmc1UThoS2E5bjMvMTVQdXZ1VldPQ3R3Z3hhVWVlWmgvTFZtTHFWTXdRS0RD?=
 =?utf-8?B?YnhYQUtVNmpqUkpCOXdsRE45ZUlTdWJVb2JHYk1PRUV3MGdieDhwVm5EbklS?=
 =?utf-8?B?bDVJWUxOMkc4eGEvL3VzRHQ5VU8vNVFCQVFabVlxUVg4NTR3anlVWkxvUTZZ?=
 =?utf-8?B?TUQxQlZhN3NtZXR2WG1acTkzbzZtTFptQWpkY2Ztem1RMmRZY3MvVklMSHZV?=
 =?utf-8?B?b3JPTTFBVmI3OTlEbU9NU204QloxMmU5QkhIZkxWZFRZWnYyalBTUU5jTkIw?=
 =?utf-8?B?dG5zTmJ4U1ZUVjB5Sk5yVXBGOWlnQ0xRZGZDaG1lNklkM0pjR1RPK21jU29C?=
 =?utf-8?B?NkxUdkFKS1daeWRLZlhqMVpHUGEvRnEyUUNiZ3A2MjdVQjgvUUovVE9ralQv?=
 =?utf-8?B?djdxTWV3bm05dlk3WUxCTEh3dXNPeEllNG0zMVVOZFlaajcyUHRjYjcvMFQ2?=
 =?utf-8?B?ZGhCQ0tUbmVPNWFjRmxDdFFvY1p5bFh3WUg1ZU5wL3cyWU4yU3B1UWhWRklq?=
 =?utf-8?B?WHowTHJuaklKNWFuQWJ5WFc2TXJGb201aC9wcy9RQ21zdVR5WGxBbjlJQSsy?=
 =?utf-8?B?Tk5KYzFka2hkbWh1YzRpWlVSeEZJN2IrZFE5V2NkZjFsWG1QSHpBZEZtKzRY?=
 =?utf-8?B?aDY0TjFSY0hxWVdOb3FLaWI0bGV0T3ZoZVE5ZWQ1T2VlcUtkVWFnNmVnSVAr?=
 =?utf-8?B?cW96TXhNdDFEZisvZ2VNU2tNQlpGOFljMWI4NEJ0Z1ZFOCtqUjN3bFZHNmZi?=
 =?utf-8?B?R1B5WDRSTEN3RkxMSXR0cHdUUDBqMkVQZTFPUHd6eVRuODlIWDhUT0RyRkZC?=
 =?utf-8?B?blNwQi9sZE5Ld1h2Y3A5RG5PUHczSXI1cjFLSG5uOVpiZ1VtT1czTUJQdVhK?=
 =?utf-8?B?cUdzMFJEY0JmcGV5L0NMS1BxRjRobzNnNHBObVRiNE81eEV0S2hqS2F5L3VD?=
 =?utf-8?B?TDlrMVQ2WDcySjVXbTNtSk9oalEzd1A0a1VGVWZnWTJXamk4dFpQQTEzTlpI?=
 =?utf-8?B?RFFhcDdSd0lNME15SlBIR0VKeFlrUHNXUmw3TzNTZDNJcFpjSm9DcDhWbzFl?=
 =?utf-8?B?MVBOYXNiMjVRV2lrVkVpRG1oSkRmZk9sY1hENXN1YmMvbVlBSHNGSThWamM1?=
 =?utf-8?B?Uk1IZXNJRDBkem82NFBkZjVRNkFBOXNiVmgrYmlqMkc5N3lzU2tMTWJoTTFv?=
 =?utf-8?B?bUJBcUVNazZVV3JuTzU1L3ZzS2ZuS2orZmlMYXI4QU15NWJYdUVOd1NhU3Y1?=
 =?utf-8?B?OTUwQ1dYYWY5KzliYk9zUXhwWmdpYThpYnZYa0JRS2VVUW85ZlNwbDhjL1pn?=
 =?utf-8?B?RTZWN1VFeFFZT2ZuT3psc2NQaVRwUFp0Ym94b2dCd2wwNkZLZVh6L3g0TTNQ?=
 =?utf-8?B?OUYxaTh1aUF6d2EvRlVFcndZQ2VMTlYyWnRoYWxnajdpRWxNQllpcVp2OURL?=
 =?utf-8?B?Vm5aVmE2VGd2VDdHNGtMNmo1UkhEVm0vS2doREpSditJVlBjN2xFRmZPdHMr?=
 =?utf-8?B?SlpkWkMzeWovanR0cGVPMzFNNHUzNzIyZXlweGJmWXFwWExBa2RVYkxNMGdm?=
 =?utf-8?B?bnhvUkxuRmFVRk1sajN5Qk1yNzNtT1haSmdyMTc5OUphSkhaOHVvOTBaRlJi?=
 =?utf-8?B?dkhoejBVNmtIZUo1MEhQNXhXN3J4SkVLVnZzUGdEWGVqL2lzRng1QzJQb24y?=
 =?utf-8?Q?/K7JFUA6NYcnT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:37:01.9912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9441bbba-13b5-49fc-f110-08dce6ff08ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213

On 2024-10-06 17:49, Daniel P. Smith wrote:
> To start transitioning consider_modules() over to struct boot_module, begin
> with taking the array of struct boot_modules but use the temporary struct
> element mod.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@gmail.com>

