Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F993A3C1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 17:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763332.1173603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHQn-0002BH-SC; Tue, 23 Jul 2024 15:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763332.1173603; Tue, 23 Jul 2024 15:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHQn-00029h-PG; Tue, 23 Jul 2024 15:28:01 +0000
Received: by outflank-mailman (input) for mailman id 763332;
 Tue, 23 Jul 2024 15:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWHQm-00029b-4t
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 15:28:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d9e595-4908-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 17:27:57 +0200 (CEST)
Received: from CH2PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:59::37)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Tue, 23 Jul
 2024 15:27:53 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::b0) by CH2PR03CA0027.outlook.office365.com
 (2603:10b6:610:59::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 23 Jul 2024 15:27:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 15:27:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 10:27:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 10:27:51 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 10:27:51 -0500
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
X-Inumbo-ID: 22d9e595-4908-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrY/OL2PomZowaW/VUnvc7ULU7yTZ4EDh5XcTVBziTw08yVnZ66GZlPMzLkbW1aCiu3jRTcJyjW9zMEEIV0W3iw3wa9LOsLk6RfLpTQ6wrG8gTCHEmfwzHmNgX65GuxOu+OEE1xfi3DW67tjsnfbT4eCk1TD/Z47OR2LFv4rMeoWALA4a2eOsT5BBRHjmeJfhKp/YDAAUOL9PPPek9jgl2ipu3CL637xhkFjdD6hmT3IvdVYTR+m+NSafesbFWL8l1vO3IdRcun1Tr4f3c2QETyGJNJMB2VqeMKEBJY4E2s3NSB/8/fs+bBAHZrw8IUAEa+e2qyp/oYsRLKn8FPKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Qy4Un0zlD49c88NTjvDkppgHkGuxNhRKGSB9Yg66RM=;
 b=QrLNLZseSus7BCV7cuZ0HGachz8sitLVVUVMImeqIslcLN6H6DHvPKKY1fdskqXhcIvLMshU6e+Ax7XKEhOJnSZrFckdNO+qzAxedLaFDxost9yqcKoNYSNyJ2j3mFQJLP4W4A4zzEi7dKSGFprRjyT7x0I3pGDAnJnvWFV3c1uBiT+suKwjDMa1rDlzOxPFqncpXd8/eq/S+YI6TyLSFuQKEm8G8B2Ft/kQeppdizqTPpo5JABN1XjZeEMUgh+GDPe3pEKEmBl/wFjklI4Hx3TmLO/aCYq5Tf0SU2Ym4UxnKopE+VhxNDJv8oQxKnLdsJpwhxd1EyCrX7qvH2AqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Qy4Un0zlD49c88NTjvDkppgHkGuxNhRKGSB9Yg66RM=;
 b=UUEmV0ZezzWQufOp4HRT6iTRNr0BGinaTPoaxNv/exNBrz1VR2Ecqes6osGooFzQd5FqgILM3OnoEtnI21YW0hFUP/srxrUvG3PYLIvOcEnX+urkosTS8OrdNZAEs1ZqZuQzc84LbOT0AqHXKBfS9zpjPmX9LDTQie3gCtGworQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
Date: Tue, 23 Jul 2024 11:04:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
To: Anthony PERARD <anthony.perard@vates.tech>, Jason Andryuk
	<jandryuk@gmail.com>, <oleksii.kurochko@gmail.com>
CC: <xen-devel@lists.xenproject.org>
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Zp/GcCUVPX/d/7qx@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb7eec4-4952-436f-c7bd-08dcab2c052e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2pUR2pOcjkwQmlGek5KV2d5QUw1dVNlWU1oRUUyTEUySTFkMTNZVGJlZDQx?=
 =?utf-8?B?amFmTTZKYXhuRFVaMEFkUGtkWGV4TnpUcTJucVh0UitKOUxyL0gyWHlpaXhX?=
 =?utf-8?B?YjRVTEkrUGZhaXJNNEQxYW5QTXhhWkg3L2hwSzR1ODM3M00zZk9HRHI1aWNh?=
 =?utf-8?B?S0swQm1rVjgwblFPQkFocHFiQ0FqT2FPdTh5YkJOSFoxOVIvTWU3L3dRd2N5?=
 =?utf-8?B?SG5vemc2U0hTYlV3ODAwN2lFT0cra0tLZjM3UHdkUmIyTkE2QXdmcTY0ZDZD?=
 =?utf-8?B?SFV3LytPbHV1S1pFODFMYmt2cExoWUtZOGV5N1RaUWdWR0JHZEprNVRCNGpF?=
 =?utf-8?B?QTU5ZUpSOWhSaXdabmViUzVJZlgvQXdaMTZQMnFRWEZQUC8zeHFtMzBpOXEr?=
 =?utf-8?B?Nmk5MEV2MStHUWdyT2tCUXpMZXF2ZzFrajRXMnIyTWdyZHhNQmp6MkRoMkJX?=
 =?utf-8?B?Y0tNT1JBZ2E4MmxCNHlYQ1VnYi9rL0Zud0t2MlVkdmx1WmFPNC8zWE5VOGdu?=
 =?utf-8?B?Ukp3Q3BycFdLYXVvQzhkcmdpcVZLckIwa3ZZVlFycFhUVVplVllMVkk2aWNp?=
 =?utf-8?B?c1NueGpsSHlCbVUrSEZ5SlhIOWIzTnY1WjhzdG1LV3B4U2FGNUhOZnhvajB1?=
 =?utf-8?B?dndlUTBpK3pCOHQ1eDlOd0tERSszZ0dSS0pkSzJiOEd1Z3VTcy9kRDN0WUYr?=
 =?utf-8?B?OWJEMDAwalpsY0EvcnZwUW5MNXFqUWJIZDVGa09oYVRVSHRVU2ViZ3I1Z1Vk?=
 =?utf-8?B?WEkxdEgzSFA3TzJ0NmRWTmdHOXRGUjJTbHhiaERLeXl5L2RTQ05FUjBhSG9W?=
 =?utf-8?B?MXhTRllMVlNDUTJoVmsxRVgzN3FodzZ2alErc2xEcXJiK2swZ0FKTXUxYVVX?=
 =?utf-8?B?VUovMDVFQTREVmJyWWhWU1Y1Z1IrRXJ3MHJCUnRub1Fvb0lDRGtHeFJmTWwy?=
 =?utf-8?B?TVBNSnVyVXRiWkhrM1lyY3E3TUhWaElOMHV5QnJDSGpMMEtJb0ZHL0l5WjAw?=
 =?utf-8?B?Y01QK0pqdThJMkkwMU05NjczODZ5ZFJCYnFJSS9yYnVvOHpiVCtxelN4SkJF?=
 =?utf-8?B?Y1AybHJYWExPTTNNWEZUT3V4ejlFU2paQzJ5QllCemphSktjTi8yeHQ4QkRs?=
 =?utf-8?B?dDFjS0ttUHJwM21KdzdBT0huRkMwalNDVGZIeGRVdElkNW82NzhuOVhiek01?=
 =?utf-8?B?M0FYbExaKyttSFJoemJKK29SNW9jSU9pQ3RTRjJlYW9qNjluZVQ3WURYTHRy?=
 =?utf-8?B?UkxKeXo5STdzTzY2L3hkWHozU1ZxNXZydnRBbzZHcHBRaks1aWo0alg3eGUw?=
 =?utf-8?B?ZGU3WU1ybEhEQ1BRUWJ3dTExNUI0d21xcEZ2Q0Z2TTZ0cTFzNW9xdEJSR2RG?=
 =?utf-8?B?dFoweUlIa0FwWnk1Q1ZxbncwYTE0YThDdFM1R2Nhak4xaXFCVVVnRkhnWEdZ?=
 =?utf-8?B?NHRIYnZEN0RNQ0F1N0ZqQTlEQWpyQ3owUzVkbGh4cjhtZDBxU0hra1pCdmJv?=
 =?utf-8?B?clllV1JFQ3BWNmppTk50TUVsQ1JMMk9Vck5zT2tYVHdVRWp5N1U0UDMxSWhM?=
 =?utf-8?B?blZwNUUzekp6dkdGNk5iSHp4SnhhWE1ISGNLTFdWQi9WRzNtb0RFNDlxSTJG?=
 =?utf-8?B?R2JYZFRNRXlOUFRQVlF6RkpibkdxTnVpNFZOMzM4RWNsMnFlSG11REdhbitP?=
 =?utf-8?B?QnM2QlZVOEtOSFVRdVBEeGN5WS96RTRuSlBOaW11b284dTZ1WEd2b0dDN3Nn?=
 =?utf-8?B?ZVhsT0N3bUJJQjU2MElvWTRXQ0Nwb3h2T0pqZXN3MW4yekhHVE1mbW1GUnBt?=
 =?utf-8?B?R3c2UXZUMU8vWG9GR005aUpFcDBYQ3Zkc0dYanAzaktmdVNuelVycU5aaXJj?=
 =?utf-8?B?eEl4UUxrY2hObks2MWIyVVo4dUpOdXM0Z1ZmeW8zVWJXclA0d0UrTHZCUWZU?=
 =?utf-8?Q?jgun+LkGZjg6iQYDEq7QMcE0D48ZwuDN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 15:27:53.2536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb7eec4-4952-436f-c7bd-08dcab2c052e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

On 2024-07-23 11:04, Anthony PERARD wrote:
> On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
>> "$dev" needs to be set correctly for backendtype=phy as well as
>> backendtype=tap.  Move the setting into the conditional, so it can be
>> handled properly for each.
>>
>> (dev could be captured during tap-ctl allocate for blktap module, but it
>> would not be set properly for the find_device case.  The backendtype=tap
>> case would need to be handled regardless.)
>>
>> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy compatibility")
> 
> Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy compatibility") ?

Yes!  Thanks for checking that - I must have grabbed the hash from a 
local branch.

>> Fixes: 76a484193d ("hotplug: Update block-tap")
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> With the fixes tag fix:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks again.

Oleksii, this is a fix (for an incomplete fix) for 4.19.  76a484193d 
broke compatibility for block-tap with the blktap2 kernel model (when 
adding support for tapback).  This finishes restoring blktap2 support.

I realize it's late in the release if you don't want to take it.

Regards,
Jason

