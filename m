Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5589FAD46
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 11:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862824.1274359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPfts-0000tA-1p; Mon, 23 Dec 2024 10:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862824.1274359; Mon, 23 Dec 2024 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPftr-0000rV-V6; Mon, 23 Dec 2024 10:42:59 +0000
Received: by outflank-mailman (input) for mailman id 862824;
 Mon, 23 Dec 2024 10:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7Xy=TQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tPftp-0000rL-Ij
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 10:42:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6398778-c11a-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 11:42:48 +0100 (CET)
Received: from PH0PR07CA0074.namprd07.prod.outlook.com (2603:10b6:510:f::19)
 by CH3PR12MB9432.namprd12.prod.outlook.com (2603:10b6:610:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 10:42:40 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::56) by PH0PR07CA0074.outlook.office365.com
 (2603:10b6:510:f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 10:42:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 10:42:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 04:42:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 04:42:38 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Dec 2024 04:42:37 -0600
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
X-Inumbo-ID: a6398778-c11a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW9a9yk8V3GWkD7OQHYH9QUol9Ea5R3zHaYPMXvbqQ0rP/5z4MSkQztGsGm+rdjw+n9Ez95FX2CMPvXibdo8B2hwRg6Awn3jegbgXIQ4ycZ56j4phYjGhRCm0SCubxFbjQq+2TZPYnk+lXuP9Vc5UAn43v97K4LXO9orwKU3KSPbVQVcsQTL8Or8ixCy8pD6SFkugv9dX+EyhlJhPYVpSi2g0T5eBpqYDkHjcHuiPanG4QTxmUGkXps3Oe9THokomCerpsLZQOAnuRa5cyzLbw84PXIvExYMvAhGaOhsjbGAeJudItS58NMd3hyWebvSpF8JWwYjsqQyNKIgl0b8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWkkmoCtOLjgPmIhIObeh7B6vcx3nKSdD+4LedPLgPo=;
 b=h7EgBnuxzxTaLQeC9lKUp08VaAXQ0qcbIIb+CYb05ghRXoFPhms/2VfjXotru6A0IUN4kyiaI8R/DlJv8XlnWmvzg1qQXI1VO+Qrup+e/LPhXHN+qpay4+fGLr8GuzpHhxMAnKYYwbhAGUQdXafY/UFE7U3Z7vlNgXxlRb8fli7aGW4qzMy8X2UZfnoWwt//q2PrVXJco0P/f7Q1kgl237czmnub1Wt1xQB4dH86/xid5m3EzSXVZonAtsPsKolqTs6Tyb8GDNjDQRyfNRMaASsKHnohAI2FWCCkiJ7Dwwt25NMegndFxm+oKHdsA4J5tRaQbiJ4pYODuSVWsbsw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWkkmoCtOLjgPmIhIObeh7B6vcx3nKSdD+4LedPLgPo=;
 b=ogRv98rF7aarWcZHCd6QD/5S11fniR/v/0dFRz8SHbbckcv55hRD41D/yL3ubqUzVNC/qDOGFV61RrRWTt7IOyxSe04JkGMn4RJIobiPl+mTHrvebXNRtiLiINOWRVFIHh9A25YB78rtmLVfmXP+4jBYkZN8lp2a19bvwa8HAQA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
Date: Mon, 23 Dec 2024 11:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
 <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH3PR12MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 65225624-1a47-45c5-1ac5-08dd233e859b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2plZ2MxcmwrLzY4WU16MlZtYXdWdzMvOUIvdzB1aVJ2SDJyYzJxRUUwNGlL?=
 =?utf-8?B?Tk1zOXpLQjhTRU90KzVTdElmdy83ckRiSnhyLzhGcjRmNnRRNXZxYVNvUG40?=
 =?utf-8?B?blNOZzVIU3hKb3BndEJhSlZ2YzU0WG0wTnZhSXVZSGQ3UlJxZklFSWJnemR6?=
 =?utf-8?B?Q0lEaVJvYktRcGpBL2Q3dzhJTlJicTZrSUtwRzJRS2RyTGd5M0cvSWRndTRK?=
 =?utf-8?B?M0FWczhRRE9YQmdDRDVNT091S01pdGcveXN4aThJeDEyV0V1NHZGenZRNk1q?=
 =?utf-8?B?ZzZqZGkybCtZWTd1Wjd6b2FNcGhqWWsxQkU0UXlORVBubEx2TUphK0drcFpj?=
 =?utf-8?B?aTVLSG0ySDNwdDdsSHlzTHZOZkw4YTlYb1dPL256SzVjdXUwMzYySXRwb2Vh?=
 =?utf-8?B?Qk1GTHZkMi9MWHBtM1ZiYTdyM3Y3NTB4Q0ZLb0o3amRCNW5TUXRXVWJxUTR1?=
 =?utf-8?B?N0VIMFpCelBDOWx3UmMxOHBLd0RCT3k0ejE5Y0twK2s2a2YyM0ZzYmp6VWlU?=
 =?utf-8?B?bGpTd0Y2UmdxMmZpQnlmSDZhellPNFhmTmxxSTRRTlRPMUVWVWplOE5KZHFm?=
 =?utf-8?B?THVBSTNMQTRqanpleFNyODNlS0oxck52YUdUNElZSkZXMGdXbGsvZzF4R09N?=
 =?utf-8?B?ck83cmVLMkdIdHVLYXhVVWNKZE5BRmZ0ZjExcHFoNU9zdVV0UGIweCtYbzEv?=
 =?utf-8?B?alR2NTdRTE9vSzhKUW9LSHJuQVdGVWkvOU5VZmNNWENnL1k5S1R0YzhmS3l0?=
 =?utf-8?B?eVRibXFCekg2cDZ4M2tzbC9YOFdJc0R6dnU4NHlJMnl1M1M0ZXlMbHZNSEcw?=
 =?utf-8?B?YTd6ckJTKzJLOXdOR0RqM1hzdDlwaDVYazNkU0MxUFZQYzFDMmVxOTJmeFhs?=
 =?utf-8?B?ZmpDb0lhSktwOVlVRFplQm13dzdwVTQrdW5qSWJPVHlvTzVoeThOSTlYd3Bp?=
 =?utf-8?B?MW5KVFB2ejdXYjBhdFk4VGgrZS9qM2ZkMDd0SmVKY2Y4Y1M3dDMzUHRsc3Yx?=
 =?utf-8?B?bDVKSjhqUklrczFCNHJveXNoRGtsb0xQRGhRTHl1Ry9aOEJEdnorWHV3Uk93?=
 =?utf-8?B?ZjZoUmFRZzhhV3BsSUh2V3EwbUIxWTdQOFlyZElES3h0ZG1FeDlGTGg4RDg0?=
 =?utf-8?B?RjlCOE1uaWtJUWt6NkNVNVZBVzdycHVGN1NITjRWMUVWdFpQUC85TStITVd2?=
 =?utf-8?B?N1FDRFJEdjlTMTU5Smo2QUlGaFlJUkRKWDcxQXYvUzBxbmJwckVHZU5Dd2ZK?=
 =?utf-8?B?WFE3TmtCL3UyTnlId2tmY29ZanVaUTY2cW5uZFhnZGNkWThQSCtRYjlnTXVw?=
 =?utf-8?B?OHF6QWhYU3ZWbjJ3WDYrL2JHVFB6UHh4bklBSmI2Mm1NUEtwUzZtTk50Szda?=
 =?utf-8?B?MjY3VTBWTjUwRG9mVERkOTVJZEJpWGFBcEsvRkdmS0MybnRBZzBIbWFmWjFz?=
 =?utf-8?B?RmlQRXU2ZkhlV0dPUVNPNlNZdGdWbTdSZVNIMkFMRDNMVlpWLzlwenNVeGRa?=
 =?utf-8?B?Tk1wdG9WSVUySEdzd25nSnljYUEzVTRweU5SMk1nRUNGd3NIWDNHKzltZ1Fh?=
 =?utf-8?B?UmNPN3AvRTdrRDU1STcxV1kwZitoNW9OOE1pcS9Jd3owamhMRjBHK0RqRFg3?=
 =?utf-8?B?aWVVR0laY0xDcDNSN2VyZjduRkRyS1k0Wkl4Q3J2d2IwVkJOYzVnS1Z5Qmlr?=
 =?utf-8?B?Y3ZrWStKdjl5VSs0QTFxNHpYZnVpOG5lUzMvSzAyck0rNEZTYy9GS0NRdEZy?=
 =?utf-8?B?bko2aC9vL25OMEtXa1UyLzZldDh2aVJmQmdXZ3M3aDVrOHl4UnpVbzQ4WnpH?=
 =?utf-8?B?WVBTTGZZbG1WbmxCdjFiWVR0aEpIc1hzbDVtUWNjWVFyZXcwT3FCcWZpZms4?=
 =?utf-8?B?bkk2SUp4MDJhWmpMMGgxS0VualRCbHNHeGQwRGFpK05sdGJXQlpVVUNOQlk5?=
 =?utf-8?B?cWIyWURyQVphOFptMEh6SkZOTjFXMEJhRGJsa0ZTeWVMVFRNSENvWXBOM1VB?=
 =?utf-8?Q?b4RplMX7Yx5VdRCkngFbtkCwv6shuc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 10:42:39.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65225624-1a47-45c5-1ac5-08dd233e859b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9432



On 23/12/2024 11:06, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 23/12/2024 07:58, Michal Orzel wrote:
>>
>>
>> On 20/12/2024 16:19, Luca Fancellu wrote:
>>>
>>>
>>> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
>>> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
>>> but forgot to update the 'struct kernel_info' initialiser, while
>>> it doesn't lead to failures because the field is not currently
>>> used while managing kernel_info structures, it's good to have it
>>> for completeness.
>> The last part "good to have it" does not sound like we need a Fixes tag.
> 
> Reading the discussion, it sounds like ".type" is not always set and
> this is not properly documented. This means that in the future we may
> write a patch that requires to use ".type" and needs backported.
> 
> But this would depend on this patch which was not tagged appropriately.
> Therefore, I would argue it needs a fixes tag (even though this is a
> latent bug) or at least a backport request.
Ok, sounds good. But first, let's settle on what we actually want to do here, if at all.
I would be ok with just documenting that .type field is for now only used with bootinfo
related structures (after all, today it's used only in one bootfdt function). Setting
explicitly a type for structures not requiring it, does not seem beneficial for me.

~Michal


