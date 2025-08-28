Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9986B39806
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097906.1452074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYo7-0006Hm-2L; Thu, 28 Aug 2025 09:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097906.1452074; Thu, 28 Aug 2025 09:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYo6-0006Fb-Vv; Thu, 28 Aug 2025 09:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1097906;
 Thu, 28 Aug 2025 09:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9g1=3I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urYo5-0006FV-Ts
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:20:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6809ea-83f0-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:20:32 +0200 (CEST)
Received: from BL6PEPF00013E06.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:7) by LV3PR12MB9215.namprd12.prod.outlook.com
 (2603:10b6:408:1a0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Thu, 28 Aug
 2025 09:20:28 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2a01:111:f403:f901::5) by BL6PEPF00013E06.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 09:20:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 09:20:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 01:50:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 23:51:04 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 01:50:32 -0500
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
X-Inumbo-ID: 3e6809ea-83f0-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlbTQzRXDT0BUPb+xjjcER/mY21iHfKiLju00zXIi7CLqZxF4UrDmLca8VHc/0p6+GXeeLbgD1vNwb+oXsdOA4UU1MgfzJw2gViRfu56IZVdG4mXK4S+K5MBVb0qEvxbMVGJupUz3JP8tVV45SI0nGyAXsGPPLbou/cCZsrxRIVBBZG3+XrkqnWhfmC+gWzD75HC+QtskjyjC6F6bb7e54PdFj1/+wPA7srzceNpcGwq4GOnU2o8GF0Euxup/rwU1hBoo84MZrBdyNu8JYuzbTdQEV+PiIf1vG1PXe/nXWSCGVbn/pNoMVoX5qC+de0dxtsv5TfhMLzUXurjPNLkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv1nu7YeMLlbUCh3IBtACtKcGVI4E7GP1bFWkOMxR/k=;
 b=jJFl7jXyBmH1QCkFfRv+k/XweAZ5rAVzWyDanRya5IhVhi121gyCApJS7JqrFWzIpgTDSK/UgrIxtHFw4CoKhPKw6KmWqVvdsGHkix7ZMPchf1wUbgGfU4HUSNFsHomQxI1qx0quzCV1PWUNnM01+JRv55EFoz2pOI0ktDS0di64DaKWJtDqdd9Qc+ny7SzmHG+cSBKxBe8pNcHvv+VkTHEBkXfiWrgMdmzQoYBclEWl72fPwzCpPcv2CUD6EWBaEXuRDAp0e0ZndjAoN+xGGd2J0IIOYJAS28wVSe3bXWxhRA3rN7oOjxVe0Q00vGt979HnYZrAxRa0f7n2h3sxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv1nu7YeMLlbUCh3IBtACtKcGVI4E7GP1bFWkOMxR/k=;
 b=DZuppGZuX8jrkIQ4PzVQQO6qfWDensm1bp7WFozCbzbYzag5fR+4icQ0TrpwYuIxwM++/QKQ6NGFjQ6B/ccJNW/Eqgopica9H8XcufGzUb2mUW7myK0RrTPUzEYbvEgtrY5wmLFwuzgh+1NzE+UM8X5DMR+jNQn381+0mP98QZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <71a52a02-f5bd-4325-8990-440bf557389c@amd.com>
Date: Thu, 28 Aug 2025 08:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
To: Hari Limaye <Hari.Limaye@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
 <68a74142-667b-4b8e-8340-fd41ec15046c@amd.com>
 <3D9F906F-83FE-47A8-A1FC-A871C1DE069F@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3D9F906F-83FE-47A8-A1FC-A871C1DE069F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 84cbd22a-e992-4a08-23d1-08dde61420b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWYrdWxiMHZKNy9QU0VCNU1yaDUxbFNQRUdINHpJMUFWN3NXMU1zQ0t5Q2lD?=
 =?utf-8?B?cU45cmo1Q05NNE4zOWUzeC9aQUwxaFVlR2NIWmdiajJ3cUFEbHZiTmpTeHF0?=
 =?utf-8?B?YXh5d0FIN0oyMW84VXZaRnhUUlpjeUFLZnFISlE5bWNlTitxUEcvSnBEVWpo?=
 =?utf-8?B?VXZyZFRGTDdqOW9WdTlobjFZdnBsdU5HMWd1QVgrZitrSEZqUHNmODJRd1Qw?=
 =?utf-8?B?L2hHcFZJS0wzbStrc2FjZEVPbUR2Y3cyT2FrL3h4aTFjYkg4NlJQc1hJSUM0?=
 =?utf-8?B?Vm12R2kwanpNd2IvV1NjVFdZUXc3T3cyRFJGNDFIQmxtUTdQUDhQS0pCUVlt?=
 =?utf-8?B?aXNFZ0R2KzRmTlNrTHE5TXZIOWFuVzV6TExVS1pEYzREOWF4NlBEcnhORDkr?=
 =?utf-8?B?L1EwSExWVEdaUURzM2lEQU5MaHJxbVNCK0NRSllMK0NEWW1ZQ1lLSTZYb0Fr?=
 =?utf-8?B?VmJqRFczYitNRk5PUittanNpTHQvaExvazQ2ZE4xVVNMd09CS3dzVkJWOWdn?=
 =?utf-8?B?aEJHa1V6Y08ySzQ1aU1xSWd4UXd5c2FlMVErSSt4WjhVWHB0LzFtNFhreE55?=
 =?utf-8?B?VzhFU3pua2pxbXBwUDRuRFhqVkN1bHF6Y3hZNmZhNVl6MFJUZXRTK3Fpc0Zq?=
 =?utf-8?B?b0RWYS9rUDFnaEY5bXNpYmR0UG93MUZTandDZnZUNEZXRVArV3ZQY3VWMVhY?=
 =?utf-8?B?OHM1SGZ1Y3o5bHF6N2h1c3RqT0o2MWZZUXE1a2JlUHBpdHdyWEhOU3hEWnE5?=
 =?utf-8?B?SFRlcyt1Yjk4S3RGWVcxazFaVm9XQkQwSElYeVg0Y0czdGtNaXhHckdXbk8w?=
 =?utf-8?B?VE1ka3dEdUxDNG1MNWZBKzdjV1BhdUlabzBpaGhyTEs4b255R05EOEw1ZlBo?=
 =?utf-8?B?bVF6THV5aWFyUEZOc013MW0vWEZEcTFHS0RZZUh3YUdsNU1teWZEMjh0NlFu?=
 =?utf-8?B?bTBNK2Y3dW1LNndROURpMEdWY3ErUVVrZXVtb0E0Qmg3d2x6SlNuaVdlak9R?=
 =?utf-8?B?d0Y3NGhHUmhCNXBxMUxiaVR6MXd5UGJqUVJDYWJtS3ZhRzBGbzFQaEQrL0I4?=
 =?utf-8?B?TkVVVXZUa3F5Nk80OXEwcmdzL09SanhGR1F3MlRXb3JpenFVWGR6djBxNTZL?=
 =?utf-8?B?aW1qTVFNUTBzdFVMS1AzSEFVWFBjMnhsWCtQWGxNdXBva1RDLzAxMytqbUts?=
 =?utf-8?B?NUZFdVJkcU5VZTg0eC9wVlBCeXJMREltSFJJaFFmbHdIU1hLRDNCS3dWS2N5?=
 =?utf-8?B?VXlGZmI5bGdtWFhuSUZEOFRnRlF5RTJNb2Z1cGwxaWg5Qk5HSGZuYzNnV0Nr?=
 =?utf-8?B?N240YVd5MUU3TXFDMHRPSVJoVExKL0tZalVUTi9hY3YzMkREZTBRSlZTTGpj?=
 =?utf-8?B?SVZnenA3czNtV2pOMUZ1UHQ4bFh0dmx2NXNsMzk1cGVoeDc3dDRXa3Q3ZXIw?=
 =?utf-8?B?UUdBOUpZaURCWDZOQ0NtOTVxdmtwSjB3L0t3QWM3bExSSVRxdEN4Z3BvcHNK?=
 =?utf-8?B?REt3T0pZZUdTc3V5dU5VS0toZTd1SC9LanR4bWxyQ1FmVFcra2R0VkhMaDA3?=
 =?utf-8?B?eUFjZXdkYXlJNzRaVzJaWTZuZ29LdURJckUzYUkrTWx1Wk9SNllibS93c1VP?=
 =?utf-8?B?cXpPQW1NN1oxK2xLakZNRkJ5c0RBejFRQXZJTGd5bld3RzBqaGxIa2kranhI?=
 =?utf-8?B?UGQ5ZDRDSjNzMzBJTjBrcUVxQ09xVDN1M3lkNk50OUpjZ0xOaHJmZHVNNE9R?=
 =?utf-8?B?Z0dCOXNKeVNsYkY0VmZjQ3pnT1NvRTBuOVdiaExLZ2RjOGhZeWdnUWZ4dHEx?=
 =?utf-8?B?aEhBTGVXcWxHRkEybmlWejBteU5qNCtwVEdPbmlsaW9tL25pMWVYdHBYdzhP?=
 =?utf-8?B?VzVLWjRrME9XQU1BTW8ybGJyTDQwUUZnQTExOS82ckFDZEVHa0p5U2hJMEx4?=
 =?utf-8?B?YzlYWVA0UzZ1ZWxKVEpIV0QzbUY2R3VLTkQxeGQweTN0STdmb0xuV055VDRa?=
 =?utf-8?B?b2o0R3JtT3lCRmRNUkdrY2MxdU1yTStMMUczVVNNc1FmcTVQMVE5ZzBXQzc5?=
 =?utf-8?Q?46QC8B?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:20:27.8458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cbd22a-e992-4a08-23d1-08dde61420b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215



On 27/08/2025 19:04, Hari Limaye wrote:
> Hi Michal,
> 
>> And actually, this could be calculated
>> in init_pdx() next to max_page to avoid requiring each arch (arm32, arm64, mpu)
>> to set it exactly the same.
> 
> I have not implemented this in this series, as it seems like an unrelated change that should go separately. However if you prefer I can re-spin with this change also?
No need, it can be done in the future.

~Michal


