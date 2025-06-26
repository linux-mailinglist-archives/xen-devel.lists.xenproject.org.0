Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4CAEA277
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026689.1401886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoW9-0008IH-LS; Thu, 26 Jun 2025 15:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026689.1401886; Thu, 26 Jun 2025 15:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoW9-0008F7-HN; Thu, 26 Jun 2025 15:28:01 +0000
Received: by outflank-mailman (input) for mailman id 1026689;
 Thu, 26 Jun 2025 15:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ms0f=ZJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUoW7-0008F1-FV
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:27:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22cf04d2-52a2-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:27:57 +0200 (CEST)
Received: from CH0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:610:11a::11)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 26 Jun
 2025 15:27:52 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::ab) by CH0PR03CA0360.outlook.office365.com
 (2603:10b6:610:11a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 15:27:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 15:27:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:27:51 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Jun 2025 10:27:51 -0500
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
X-Inumbo-ID: 22cf04d2-52a2-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXDJr8Gs6A8ezy2jfq7gt9t1X4lgbCiTOLRl9vFK96EHvRNeb5Gd08Oq2Gtm+e0rCtke7Moj31dWoH7nd5A5mWazEIL9xZ3zz83UzIdekgNaqEYRKYpKI5mRPWAxAZymEHusgoJShQeYI0Qm4jSfa0LfZm+SXGHj5ajSTpwZg3gf0KIR/ySGR9/2T00d8WTpCavWKWQIJmwCzAgAFCKh2apygVK/3sOR4SPBNFIG2Hiynwn1QRia2mqOD+8pY+Oo+bXCCbNAej8hoWxcaz9+2zC0HJRBVvNoX7TlH7H0cXzgfT7w/CPW333ouU02fft/YIbFYWk9ahnVNXp5Y84r4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoImiqSU2A79r1jD4fd6kFDddsDiHIsNUisqkPxo6Hg=;
 b=lvs0vyl4QoTf4O1v/KJzOpAWMI9SShVdC1MRnS4IrJBJajFEnsWe9t1CFTtUP3sIALoM35umJdHdpgLs74VZkk0F7sZQ8ig+jHOi4gRQb9NQP+85UElnaTWru96ZdBwCaAadI46minvUCPJnHd587j3VXhCJNp3yZhUPl8ben+QW2/oFUo96jiepZSUI/aXzxvkcQR+5vU4MjFApeo8wuG+75wyyMiEa6bPPjZf+0J/85TF60O3QDibr7HUKVKHaV7IYgRddUZRLDREkPKk2VsHmj0iFF2YHD5UksklcU5OipIXaG9UFO1/hPear5veb7AqZ0GDI6XQmpErdWYmaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoImiqSU2A79r1jD4fd6kFDddsDiHIsNUisqkPxo6Hg=;
 b=woditHVkjBpvbS53TXivJ1f2U9PbdVCHziFlU/uIWzVSpmL4uqdDNgVYgoTLtjNiqOh+ycMpY3YYZ+Jzsm3snTfqJGhuzcfzpPiu8EanmXDeoHh6WLlmzOjWLCYRM7EpRjC3r+6QxgUlMfrSLhvSSruoQd7UQE3h9r2c6pGV2P4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <421c4e26-f09c-4e7a-9329-9c1666d09232@amd.com>
Date: Thu, 26 Jun 2025 11:27:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] stubdom/grub: swap start_info usage with
 start_info_ptr
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250626151344.6971-1-jgross@suse.com>
 <20250626151344.6971-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250626151344.6971-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: ada69fdc-7847-479c-b7e3-08ddb4c6043a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW12U0xSdVZPM1NnWkc5RzhuZzdSemVYUElXSWlvSmV6UTFXMXBqT3N0N2Z3?=
 =?utf-8?B?ZW5pMzgrWkI4UWZaUWI1elRERmlvQ1FPdHZIV1hud0V1UWp1N3pmRTU2ZWQv?=
 =?utf-8?B?YUhuSisrWXVJOFUyK2NuQ0U4eGRVaFRHbXVRdFBMK1NZL0FoQ041NHdKNUxC?=
 =?utf-8?B?S1dldFphNXMyMDBUYjg2Y2w5a284N0Uwb1ZNdzFNTUtFVGhPVi80Y2VxK2Y1?=
 =?utf-8?B?YTBMQ001MU1jdlRxU0hSU2QrMkgwQmx4K2pQaWVzSHZ2TVRBYnZ5N3NlK0lx?=
 =?utf-8?B?V1dROUt5SzA5M01TOFkxM1p3TXFld2RMTk5uZnF6M2dTSGxpL3ZjL01oUll3?=
 =?utf-8?B?T2pJVDNCSHg2TkxDNzVxY2U3WExkQitvbmRNVUFIZFl2ZGM4bzVTQkdTaFpE?=
 =?utf-8?B?RGlxYm9tR3p6UXJQeGsrSW5TOHZhQTNHOXB1Zk1IOUZNdTEyWkNOMFZFRTZI?=
 =?utf-8?B?ZGl1SDdUZ0V3Y1VHcHF2RXBqcU1pZDVSdU51V3ZtdGNWMGxvb2tYdFlHY1Nx?=
 =?utf-8?B?bjI3bXc5aWJRMHRLTXdDc0xsaFNvRG9DL2lUbElLWThoY3F4ejFtZ3RScUZ4?=
 =?utf-8?B?NHlpL0VjYzNoNUkxcm15bzl5bGMxaG9YV1FMemJleTNyTS9ZTXMxc0xCVkp5?=
 =?utf-8?B?R0o5OFJPbUc5OXZKNlhhdHBXTFlkTjcydHNKVVBxNVh3eHhGRXVLQzk1Wjc3?=
 =?utf-8?B?STJMVXpaY0ZsRElJWFJRNSt6VTF6SkFIbTJSM01SeTFBb3hoL3BDSnZqdGVI?=
 =?utf-8?B?RTBCVTlQM1hIMEVBZHkvSlAvaUJXSnhUdUJhQXFuNFF0Q2o4VkwzdURiZ1pD?=
 =?utf-8?B?akszVTh1Tndnb0d5U1lZWG1HUXl0UExWWHZ0dEhja2YzaThmbTVHbnEwcmV6?=
 =?utf-8?B?WStJWllhenEyY1duY1pWdFptbGJHUUsyYW8xTFpFSkZuSFhzd3hIZHJFc3RW?=
 =?utf-8?B?NGc2aVVZN3dVOHlLWVdWdXB4ZWxRbjR2VkVLNFJxSEpaNVRpUElCcExlT0Jz?=
 =?utf-8?B?THA1dGt4T3JTcXFzSXlXNm1DVUtZUUxZVTRyMlZ3cmFZUjQxUlJaOG1lSDRt?=
 =?utf-8?B?bWFQRGs5cWU4ZTlvNlRVRlBxZmhJMGxOWjFreGs5VTN4dzc2WEZxS2ZYdEUv?=
 =?utf-8?B?enFLMnJnT0t3ZXduekV5VnN2WFlNS1B4ZVBUY3pWTStvTWVlTldkemJTQlg1?=
 =?utf-8?B?QVY1bEtYaGplTjRhYW1VdUJqcGxmWWhCMGJ3bGUrcnF3YU91ZlFNdnMvRkJS?=
 =?utf-8?B?RzlKdUo4cGRranVjVHhvWXpJcUdGNlpmY2liTVhZWmFyd0htZUc2dXJzUWhI?=
 =?utf-8?B?ZnUwTjVwL05POFVTOWY1RnQyUHNlT0kwbVVxR1J1ZG5QOXJOdzZDdmVlaThL?=
 =?utf-8?B?dUhoVTRaY2JDeEZTZlZNSUwzdlRCYVh2VFk0VHc5NlRTOTdZUjc1cTJKbnhp?=
 =?utf-8?B?MjdQQU9OUzI5cEJVZnMyeExldml4bWwxbnlNQUppMXRlU1BBNnRjaW9tRG1B?=
 =?utf-8?B?S2pweVNlNWU0dy9qTUQwSjFCMW5iYnhUOE56UUxaYzE4Y0VwVmhNalFBU2pp?=
 =?utf-8?B?YTVjSVd2VXZ4d3lxci9OZTE4ZDVUM2ZLOC9TU2ZMdkJ3aTluamxIVlpBYS9u?=
 =?utf-8?B?ZTYwaGRDOUI2MU41TzRxSlhrc3VIbHo2Y2ZlRm13dDhQdXNQcHVrbjRjdFpz?=
 =?utf-8?B?N1dmNzNBUFJ1bGlBdkdXbm0yMWdsODl4NlZHSnRVb0pIOTdwZkV2c1ExK1c4?=
 =?utf-8?B?cmxlOVN4WmhUNDRxL1lUMWJ4blE4T0J0UTJvNW1tcUdleWozeHZPakJHR0Qr?=
 =?utf-8?B?RkdEYXloNHlWR0JsMjRoUmVMVnVScXZJVEwrNEZKT2JJVFdGVytBN0I3T1M4?=
 =?utf-8?B?VkxpaVhwcnM3NFA1bmFPUnFWajM2cEprenVNckFYd0ZHUjB0SnlCUisxci95?=
 =?utf-8?B?OUI1VlJTeEFVeG5FV042SGFmcmE2bGRpUDZwaWwxVU5MNEtpdTN0SENReU1N?=
 =?utf-8?B?RUxXeXdTeDNVZnZDVXI3ZDFaRkxmcDFkZVFteEI0T0pXM2pZTlZHQ3NNK1cw?=
 =?utf-8?Q?qheP3q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:27:52.3160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada69fdc-7847-479c-b7e3-08ddb4c6043a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097

On 2025-06-26 11:13, Juergen Gross wrote:
> Now that Mini-OS is exporting start_info_ptr, use that instead of the
> tedious start_info macro.
> 
> Note that the Mini-OS macro still needs to be undefined, but now it can
> be done right at the top of kexec.c.
> 
> Undo the previous move of the "other" start_info into a dedicated
> function.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

