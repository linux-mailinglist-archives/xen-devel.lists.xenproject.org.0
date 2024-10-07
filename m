Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B149938B0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812460.1225223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxupf-0002an-MP; Mon, 07 Oct 2024 20:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812460.1225223; Mon, 07 Oct 2024 20:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxupf-0002Xu-IG; Mon, 07 Oct 2024 20:59:55 +0000
Received: by outflank-mailman (input) for mailman id 812460;
 Mon, 07 Oct 2024 20:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxupe-0001wk-9j
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:59:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184c8f59-84ef-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 22:59:52 +0200 (CEST)
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 20:59:47 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fb) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 20:59:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 20:59:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:59:46 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:59:45 -0500
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
X-Inumbo-ID: 184c8f59-84ef-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcamZEPV0n7DmSKlK5I7ubMMpjRyCx/+vuE5z0XZFl917XL7MNt9b5WRIgDQotFedWuSNHh7JCrIEC1LyClaQ30y7bI8y5bMDyoYBfGapl34L+Rpvpjbvx6/9Tt+HOyPe8275ubNvdQ5+cyKwJoICwAdiA1AZ04YM/7g023uFgj7d+sdPQGH/5KZZMBPiMci6YfC1yRg0BiK5+MoOK0anhKvwsJzjZi15KoHL9t0hprXSn+7sZrqhbTVexjlZGirl/SgfH1qX+LtU3JzvwqmcNJlhxqKyWB4yzgzNchK91dKrOnNKOiUO/RjJ90Z0J2EdKt9SZ6pwwxzyQtlvpY7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j45+7VwGAZ/wVzON808c9FkZuHDzv3QDFCwNFwomm0g=;
 b=hfLEgsw6XPZ8rj+w0VLcuJU0qfjNTVTKH7NnmPTtd5rE5KJVBkdRr32fSGILvKGRJo4ummUpui7fgNQEbVmrw7hQ4n5OxbqbO8L/IE3ERwlfYv+yAzrVW6Rn1ZNzN5ryvcCO513BjwQ1DpBZUtGULOOerETsP4d3OV8mUz6XBaIfjz2qmyxx0fw4Mwz/4KSpSnrElO3Uvi0kuDVO3OeuZRi5EYjB8ciTCX77xmSAXKmTug49zzor3DQqgDCbBjPGvUk338FSe/F++90rTULzUvPEpAe3gogydgRvIicVgnL/S8zdIteqOVZ8WImuAdepWNDy0Xf0JVqPdbkVCYyPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j45+7VwGAZ/wVzON808c9FkZuHDzv3QDFCwNFwomm0g=;
 b=bF+okwfXyXm6Y7zTS3CW5+C1BIQAKHOtX1gL8yCkj6PGt6q7s71SSjEGM5wgIAByFBk5AUy7qYuhtK1MhZWS29YUqK7FdpXaeQtBeHRaVl3tZumfTFwa17um2d56fm2pW704/EBG3xwoJdqnYlKpIt7CNTbqMuzJBcTMSlJRh4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b112c378-7536-48e2-937b-d58fd62f9737@amd.com>
Date: Mon, 7 Oct 2024 16:59:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/44] x86/boot: introduce boot module interator
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-16-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 19eda48a-2dcd-45ae-76f2-08dce712fa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHpZTW44bkt0ZFNTVWMzaVpNLy9wcHBwbkFkWkR0N2NhY3NSeHJWUFVkWXAz?=
 =?utf-8?B?TWhOVnVRK3FsbFBrWmJ4ZUMwOTM3ZjdsQ3M5NVluWEZwY1pUamNranBva3hT?=
 =?utf-8?B?aVZ3UUErajlicnkrU3NscnFOTTRWZzFtcG91dmZQZERwdG1xWkY4QlZZSjgv?=
 =?utf-8?B?Vi9Sc0Q1Sm1INERickd5amZEMCt2UXpzUWgrY2ZXU21RN1FMdnU4ZWtPZVZo?=
 =?utf-8?B?NldOeVdvOHdxd1FYaStuRHkyeUtXakRZVkhCU3F5aW5mUDg1T0V5cGpUYk9h?=
 =?utf-8?B?WUNaYktnV3lyVFZhejAyQW5LeTF3VG16SmpQZzdlWkdPc1VVZjRXZ3ZYV2Vr?=
 =?utf-8?B?aUUzNmVrLzBKUG1mS3RJRU85M01tbHJyNWNNa3FxdWVLV3Rwemg4RXFYODhh?=
 =?utf-8?B?cFBQMmZkYkppOUNEckdHZTNlMHpua0V6a2MyY29DQVJybVhSeWowNVZHc0oy?=
 =?utf-8?B?d0JxWWZvZWNIT1YvdHJkZ1V6K25zbnlUMnQyNUJNVW85cXZMRVR1U3NxSExS?=
 =?utf-8?B?anZUU2k1K2VvVlN2K3pZaGg3aUFHMEVvZm1lWSs5S29GSFBCUFdoalRBMTFZ?=
 =?utf-8?B?bCtMZEhZUmxFbGdjNm9sYUh4ci9sUE84M2pNUUJpUWF1VUdqcDlUbjZENHY5?=
 =?utf-8?B?d2Z6czlrSldHK2tmWG1sWnNMU2ZZc1ZJMXpXM09zamdQeFF4MEM0bjg5a1Js?=
 =?utf-8?B?Si9sWnhlVHA5S0lrbGZuQU01Y25acVk0N1ZTOEtZaWFtOGNqVldhblJqZ045?=
 =?utf-8?B?OVBVMm0wMXo4V3pnSG5tMm9jUzhuMDhQT09ua1RhdlZZeUtFVk1PV3A4M0lW?=
 =?utf-8?B?QVhTUlB6eDlQTjNjUVg2UUdVKzVrRVJIeXJHb0lUVzZvYWhzTlc5ZkZqdnVx?=
 =?utf-8?B?ajMwZDBMbmJvV3dVWUttQUFySHBUTGc1cDN0QzAwalRYMldOMm85NUlpSHRZ?=
 =?utf-8?B?YVM3M045bldjbStOdElBTkR2ZEJqV3k1WkhrSE9GbTJSZkJzMXltUWE4aWpF?=
 =?utf-8?B?L1lKME84NWtteG5HRGxBNkZoaGtsUUxBZHZRck1hNnhnV0x2ZDRxemNZQUt3?=
 =?utf-8?B?YWdYQm4xbHZGbENmbkJpeThGVkdNamxqZUhuRUVPUnUrZ0VZQ0hFdVVmb2Rq?=
 =?utf-8?B?N3Y1Z0M0MTBtT2ltUjArV0xlaE5iWVVtMlA5TFJ5L1dERW5NZ2c3WHdkNlA5?=
 =?utf-8?B?ZkZPeUpmK3JBWit5UlVyMWtlc3hhOERrWEhLeUNkMGJoY3JYTUNLRUpmYWNS?=
 =?utf-8?B?SzIzbTl6OFEzSFV4M2xWV1pGVGhSZTJodHNDa0xlSE9PVGJWU0xvVkh6aTc5?=
 =?utf-8?B?dFZZUU9jSmNSZ1dsbGFhT01jNWdOUWJ6aE81ckI4SldTSmxobUNwMDRaZVY1?=
 =?utf-8?B?b3E2Tlk4UFFqczluUVMwdHlhT2JqOGFvUVFKa0RyQ2UybW5EV1d0aGd3aFFQ?=
 =?utf-8?B?aU8xSXEvdDlodUdFWTFZVkpJa2doS2dEZ3lFQTlOOW9GYTQ0enppbEUxWU1B?=
 =?utf-8?B?cUppV09RcUVQMFNMdVQvMnFNZkliMHFtUXB2azIrYnZKdTYzOExZWmg5YU1y?=
 =?utf-8?B?SnBTVW1SbGtEa0gwZVRvU3Y3b3NIQkdBa3YwcWQ3VXJlWlBJeVpTV0U2blly?=
 =?utf-8?B?Mko5WnM1YW54cWY2MVNSZmtDaEZIL0p1TE10U3lUMzVwa1JidytEaHlYcndR?=
 =?utf-8?B?RWVvQVhNbmhNODFtc3ZMaSszWVM1bzlwVnNuRVVyWnQyaFpLRVBEL2EwN29W?=
 =?utf-8?B?RVhhYm5zd0VmWnFjcC9BYUtlY2pZM3NEa2Q2Qm1QKzVmNjdSNHhBbmwrYWNQ?=
 =?utf-8?B?eStWRVV4TUV2OW90UjMvN2JyRnA4dWhxT3lxclU3bGtSUFZnVGJJZHRxOGk3?=
 =?utf-8?Q?GGVmj4lGWZPMu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:59:46.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eda48a-2dcd-45ae-76f2-08dce712fa0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Provide an iterator to go through boot module array searching based on type.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

