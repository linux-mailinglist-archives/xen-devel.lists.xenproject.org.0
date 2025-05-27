Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B747CAC5AD4
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 21:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998692.1379415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK04Q-0003u6-0U; Tue, 27 May 2025 19:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998692.1379415; Tue, 27 May 2025 19:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK04P-0003rj-TM; Tue, 27 May 2025 19:34:41 +0000
Received: by outflank-mailman (input) for mailman id 998692;
 Tue, 27 May 2025 19:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfAC=YL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uK04O-0003ra-0N
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 19:34:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2416::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cab4688-3b31-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 21:34:33 +0200 (CEST)
Received: from BN9PR03CA0518.namprd03.prod.outlook.com (2603:10b6:408:131::13)
 by BN7PPF7B4E3DFF8.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 27 May
 2025 19:34:28 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::1d) by BN9PR03CA0518.outlook.office365.com
 (2603:10b6:408:131::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 19:34:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8813.0 via Frontend Transport; Tue, 27 May 2025 19:34:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 14:34:25 -0500
Received: from [172.31.32.79] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 May 2025 14:34:25 -0500
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
X-Inumbo-ID: 9cab4688-3b31-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOmBKyC1JWbSd47fSMGyL2OUwmsYNWtBeuMMmZzKaaAdAXN+lrR84alK8DECvRKJ62HblfSeiBbjBGr4XyaRH5Rgrry1HzIaOllpU/4znQyJnCnaFBtScFds1IKA9VcmA0uwcfIQePOrJeRkHSDPieX+TTXQd/sbRsoCUwK5XkRL0TbEAlGazitNvTKmZZMJzlh72k/PIovdBY8nvG8yzzyoSiLc/xSWHMCJ6fhSML7nnVouxqVj2XmJQ2GxLl2Ehw6DCoD7NzpCOmPF4S+c9f9pfc3T44u59z2R7fqZ/LJDjZDMC9LxVWq/X0KMhg8LqLYvW/uZH9cltVHzWflLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElUKYOw/rBcVOW+adollVjkLiSajyL2NiEoQ4A9UA2k=;
 b=TsihWP3SCLV22kOvDrMFjSjAk5AsM70LzPp3ScZDaEdsBZQkFY2ExOwVYXYQsh54lg/V3swm+pdnNWGGfc9l3jE/HWj9fVOTDoituQsR86Q5EedE/WZRjbFl/X+5+CyMXkvgzW+H4wj7uKnbofxPRc70l4VSWqnETVoRmH34AmiKJvYcmDTnNn5Kk7DSjDwGaYk6J/8J5q1T3X2F8kxznitiWxCr16zeBWRMHv6vWkOKlJ+Zhdj/K3RZSQleh3EdRvJir2V9QY+WrgdiChxYlkhCOgA6xhG0kNWNz+0DI9Ouiuo8wym5FmE60eF7LR7n6qDcvGBpffzuOv4WEZ3llw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElUKYOw/rBcVOW+adollVjkLiSajyL2NiEoQ4A9UA2k=;
 b=o6enH5QLgB2gz82Hhq3YeuyMsasinp+DR2r24PYF4lvWjtgJ2IkVFPYW7wS38uOGHLJ9ifYHaf51qsRJOc7Mrv1FleRP0u8rXvESzlz4zal4n9ifEeyztE6PrKHZ5sf5pTW/MvCS0EK4lmsE5wMXaU29IXlv1RQn1TayyuR+8u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d1fd6e72-f0e4-4960-a511-50497b974313@amd.com>
Date: Tue, 27 May 2025 15:34:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Drop unused vpic.h includes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250527150330.47108-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250527150330.47108-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|BN7PPF7B4E3DFF8:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5b1fa3-c61a-4052-32ae-08dd9d557ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTVFWVJzWlJoWXFaVkJiNlN4V2Y2Vy84ZW5ZK1grWHFkZkUvc1paUG03M09v?=
 =?utf-8?B?VVdMT2V4b1loTytRR0gwNGRMVDhYVHVJWDNXM1YrcjIxWHM1L1k0bVovSnZX?=
 =?utf-8?B?NDhqejNaOVAwQjlBbmExTitFdFR3dnJRN2RsWVI0VUNNbnMrYVpVejJqMmZZ?=
 =?utf-8?B?eDV1cTF4dmJNMmtZVmppWGZqZUxhM1dqMEhuZnV5bmtRMG5GeGEzL2hYb2Yx?=
 =?utf-8?B?ZTd2dVc2bkZOWjQ2N1hhRzdlQWREVzNIV3lFUy9lZ3c5SlpYS0pEM0ZMS2Zv?=
 =?utf-8?B?RlA0ZmpzMTZsWjM5ekI0Zm0rQ2tlUFdFeldQd0lmQ2hqU1QwT0pvSzl1eS9S?=
 =?utf-8?B?QUtpNjc1eUhhNURPV0NZTDY4SC8rMTVncnlzdi9ENjV0L3cvcFBNTm45QzFp?=
 =?utf-8?B?a0RMd0h0K2hQaTJTNm1WaE5EVFJnMThoQ3BqZUVkRGpoL0NQWWE5WFVkRk00?=
 =?utf-8?B?aktOMldCQzRpaXh1VEJGNzhsb1llZHMwSjRhSGlDWW1GVzhYZmp3Y1ZpbXRY?=
 =?utf-8?B?M0RIV3JVelRmZGEzK0lBRTBFVTlpUUdjOXd1dHpWTXNuaUxqSG1nYzkxRTZ3?=
 =?utf-8?B?Si9nVGFZRll1V0ZHNktoeVF5R3pneXVkU0ZUNTlKUU9GbWNYOThWUGRNeGRN?=
 =?utf-8?B?RDJ6SG5XNVlvUnB4TUVKNlZzV0VDQ2hBQTFUQ3RpT1VwR0xFSlFhdllOZGFT?=
 =?utf-8?B?WVN5WGFqS0JlUHlrUlRPZi91MVFXajBMaTR2NWw5dUVxb3VxTE5qTDNEOUFp?=
 =?utf-8?B?ZzgyU0kvdUJvV09tWlFvYitpeVZ1eDdnNUNJQ0lxRC9hcTF5a0gvRnBidkda?=
 =?utf-8?B?S3hNMDFUc0VhdFZJdkp3OXpYK2JvOXE2TmJtR0U5R2NMZUlobkovWTVObzlQ?=
 =?utf-8?B?Si9QNEV4Z1FqWHRyOXRWQUovc1pmc09kWERtL3dNcnByQ0lUSy9rTzJrRkZE?=
 =?utf-8?B?aWlJeStyVDZQeVR3c2lYYXg0VnVkdGplaW5lclpBeU1YZnQzcUhCcDRGK0k4?=
 =?utf-8?B?bjdkMmtTYmVZcjFmbW5zaWNxVlFlMlBzdVgxdkRCQXBqWlVlbzB4UWZJR0dz?=
 =?utf-8?B?d1FRWEMwT0hreFlmcHB2V2ZkTjJUL04zWTkrQ0pMNUNYdUM0L3FYKzh2S1ZP?=
 =?utf-8?B?OGRMKzJ2UDVTZi9nT04zaW5ya3RtS2hCUGZaazhycnZHaVl5M2xqcDM1SFZr?=
 =?utf-8?B?ZnVraGNaU3lTZ0ZMVVdSbTRPSTBTQU5jY0tMQzBSOEoxUlRkYVRUd3RldlZk?=
 =?utf-8?B?QTVJTVl0d3RGTkR6bGxUSWJHSnA5M0pldDdodXNFSXlzMWRaeER1akYrM09m?=
 =?utf-8?B?enBsYzN1SFhiRXpRRXgyY2RrUUVaRGFzNnV3Z2dyRXhVYVJRTW5XSHlHNC9p?=
 =?utf-8?B?aVRFbzBOT0tzdTBIb1dTZEtGemEwZGs0Si9QdWpDYW5LNzZnNkVPRy8wZjBu?=
 =?utf-8?B?cW1UYmhVYytLaG1PUno0TG05QlNXZjFTd3M3aWE4THAzWHVHUzU3U3F1dk9h?=
 =?utf-8?B?a3oxakhHUzYxSjdWV1ZPWU5KVkZTMVVsUVdhK1VidHhZVDZPbTNzZC9xZTB1?=
 =?utf-8?B?UHJoSWRld09mOUptcnhiVWc1SWkrY2ZsN2JsMnU0TVZ5RGVGMDBXVDd2Szdu?=
 =?utf-8?B?cjNyQjBqMnlscGVvVW1pVmVEZUlWTHlCNmY5MWROcjdWT1pYaFVoSGZxWGE2?=
 =?utf-8?B?TkNVdThUUHVmRmN3SS9hanc0eS85YkxGOEtKTXB6UjIvQk5kMVRCakZFdURS?=
 =?utf-8?B?VzdJR2ZzV2wzekFrcGtKR3VEZW1RMnlGSGxkdVNhbUpGeWVCb05zdW56ZTBM?=
 =?utf-8?B?a0ZHVGplcFVndlMxMGJ2M3htd1ZOdU1uNEZPNW9VdE5XdEZ2T1YzaXBLU0Z2?=
 =?utf-8?B?VFRaUXNFVFg5WVVHa01Rck9EZTZCSTVYaHNLeHBuUFdKWktxdGhHRDVMVDM2?=
 =?utf-8?B?bGNyQmt0Tjl4NndKVG5mdHZQUm9oM0FlMlNrYU1TM1gzaFB5QTZMYXU3Tm11?=
 =?utf-8?B?ak9NaWtxTFRiZzRlaURNR0RRT1BBbDFhOEdVQU1yOW1ESHpQWUlVNko2TmFB?=
 =?utf-8?Q?RdPCOZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:34:28.1670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5b1fa3-c61a-4052-32ae-08dd9d557ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7B4E3DFF8

On 2025-05-27 11:03, Andrew Cooper wrote:
> It's only hvm.c, irq.c and vcpi.c which need this header, and they all

s/vcpi/vpic/

> get it via asm/hvm/irq.h.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

