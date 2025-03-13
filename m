Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5EA5F9E7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912491.1318735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskWB-00065n-Va; Thu, 13 Mar 2025 15:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912491.1318735; Thu, 13 Mar 2025 15:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskWB-000632-Sg; Thu, 13 Mar 2025 15:30:43 +0000
Received: by outflank-mailman (input) for mailman id 912491;
 Thu, 13 Mar 2025 15:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VEl=WA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tskWB-00062w-1L
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:30:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f0608b0-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:30:41 +0100 (CET)
Received: from MN2PR01CA0045.prod.exchangelabs.com (2603:10b6:208:23f::14) by
 CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Thu, 13 Mar 2025 15:30:31 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::6c) by MN2PR01CA0045.outlook.office365.com
 (2603:10b6:208:23f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Thu,
 13 Mar 2025 15:30:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 15:30:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 10:30:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 10:30:30 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Mar 2025 10:30:29 -0500
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
X-Inumbo-ID: 1f0608b0-0020-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNiQo8CZqrC9wTJ3W2T43kbm28oqHbZV/suLoKfv5ZUoYYRb0hx7Qb/3Ahufv1xSDeyFONsCWphNfaV3r7WMGTHG8UO9TssknMaVR23droqCh+C2Gac0NMmoiH+tVvGhPrYQ1nfmdmdwwAddlw/e7SiuvfrnnLvhMVzRui1pZXUNrTNRgi5IuR8mD+Gtnuuzg2XgRRFxZeYwxbvOHe/clyQe46gAlKevToc9NLkl0HnktxEejSDo75RPBzelf+kwQaYYVmluuYvnTJFopnKe96WLpfZvLGHxtFx+Dxdh9q0yj5n9xQAuObqNxXgJJ6c20A6C6gx7+EEVtaGVjUnV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ParMocr6+498F722CTkMfikeu39QUp8mT/Hj60qfjoQ=;
 b=DWByrKFBBARzoQPQnejklE4mQQSYDQKpsaFuoClQe1RT1U+xXgbDTHyB35CA5GZCZAkSEWUqHA+LjmrZeJN6xQck/WHC8CjIUv8XTFVPL6mDPiqxNG5iN3YunFVM6l2MKAKesCo55C0gXtxxf8S+qcjjGdC5Nnkq/WpsVsxLPLY4jv8fB3DnI37wSVzI1NEDgzAqfKXK2GQBe47oxdMJad0uoetZ9s8yxvDujdfmfFJTGpwnDakR2/H8qY6sB76LCQIKopgiuwfrL3fGahAQU88Lado40WpXCopyh0h3sVNrnzjFqI4+g1jJWzC+iLJ+fesn33XrEuKUfSUqDHz3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ParMocr6+498F722CTkMfikeu39QUp8mT/Hj60qfjoQ=;
 b=niP1q6YzmtGMYxSBwatJBkXov866eMpKT4nZ7ateZ7jIZnbljXlxUB/eO0lMoyX2DfRuK4eyXZMRasCRXDKQBee57ZGGHejVveKcpzaPlzzEgr/20Jkn0u6lCGhbo11b5DmaEJIxIKCzuzsOGlNWXcZithGewQtYS2TQKtmfh0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
Date: Thu, 13 Mar 2025 11:30:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Z8A9LYjgr92IignP@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f32691-bd9a-4df1-fb21-08dd6243fd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUgrSy9rLzZJMEhZa0NvL0FEcjRTbVkvL1JzTkpuaU1jc0cxQmlNZmVUaXF1?=
 =?utf-8?B?ZktOY0F3VWMreGhIWlFDbzRRT0lnR1hOUGdld2M5SWFFNFg4K3AwbnhWU1Nq?=
 =?utf-8?B?MHR4ZFhjU1V0ZzB4WkxvMU5iQTdqWGRaMkpjcnZjZGh5T2E4Wk9QMExQbDhF?=
 =?utf-8?B?bzlPSmoxRTh2VGdvU0t4bnQvNGo4cXp6M01NMFhoczBhQ2pqOXFjQkkwVDh5?=
 =?utf-8?B?YkE5ZWNiZlRPZGhpaTI2RmtWMmhWcERVYmRQLzM0eEwrQkk1Szg0U25WOHl2?=
 =?utf-8?B?am12WFVZZVg2VjB1TTBGaFg4TFBLT0Z2VDloMC9rRkoyYmx4MXA4VDBTWUNM?=
 =?utf-8?B?L2JJOXJEZExyY0RCY3pQQ1RlOHpIVTJuSmJQNW42ZzZkZlgvc3JKeTdoajFW?=
 =?utf-8?B?WGpGMW9tbGtHVFFIa3BDVmtrd3BpREVlemd3WTRGTzJYWFVDanhNeDVqRzk1?=
 =?utf-8?B?aVZTbGFsbGFKM1hpME9ZMmJtcmQ0cFRhVVBWN3hXSEhLVGE2UnloTExQVVFs?=
 =?utf-8?B?R2dlKzEvYU9ENUsxTFE3QXpLQTdtdHpIV1FsZGdvemhkc0xqZFova1E5djNJ?=
 =?utf-8?B?SWVwR205Wk9vNGZiWGlMRHcyTHlXMHN4d2Y1TzZPeVN0M25lU0poZ0tTYk9L?=
 =?utf-8?B?TkQyMk1VTHhqd3RuRDJvZXV5dk81UXlNdXgzTE9DU1A0SUFqQlFUTVNtL2F0?=
 =?utf-8?B?ZXZuNks2ZEZRV2djalJmWXNyQVkvWDJvenphQUNLOUFkSStHa2xBOFNHMWU3?=
 =?utf-8?B?WnFRV1o3RUZKVjNUdVBaS0JLSjd6Z0NVeEllN2hJRzlacFJYL0ZJQTkwMVl2?=
 =?utf-8?B?VFp6Y2NpRTk1YzFIZ1pyWFljcHlWMFU4QzIwL2tTY3pxQ2d0SUplZzNkaHY2?=
 =?utf-8?B?NG94VVRHQm1ObkFodjVsRmNYSGs4elpDVGxnanBJODJ0N2dESll6ZjZlOUp5?=
 =?utf-8?B?ODZ4UHdmVnhmU3piQklyV2liaXBVUS9wWG1rVjR0RTdTTWQ2YW9TbUJsa3Nk?=
 =?utf-8?B?TE1wUjNqc2FGV1RIVTB5NFdXa2tZTjFNMGJOTzBpNVZEUG1STmRLUnU5Wngw?=
 =?utf-8?B?RUR5YmtRWG5ydnBRU0Vsa3pvOTJBemluQTJDbXd5ZEhPQXlPNDhlYXZERGxM?=
 =?utf-8?B?SFVkemVwOXRIVmd2OW9uU0F2ejIrS2Q1UU8yRSs3QzVJNHhHdklPLys5bStl?=
 =?utf-8?B?UDF3TVJYci9UbUk3bUw1YUJ3SmNQaEMrZm5aUFZERmFSam5Qa0Vuc1NJQzcv?=
 =?utf-8?B?b2tUR0VVUFZ6OTZIcXRoZHpPVzRtZ0VvcURnWVJYVFFocElvcHoydm9YNGdV?=
 =?utf-8?B?TTVrZXhiL3E3WWZBUmtDaEpuNnk3eiszRzBXYUg4eTY2RFZBZ1FpR3RnbVo4?=
 =?utf-8?B?S2hjdmh2S2xVLzZwR0RJWS9YemwyNkVVUkN1dzFnS0NlMHhmRmpYTDVGR3ZT?=
 =?utf-8?B?aWtYL09QRnd6YXZXRG54Wjk4WThUdmRXR2F4ZVJtUjBjcWIxQmRoTjl5WWpP?=
 =?utf-8?B?Ukp6RGJOd2h3a1NpaERyaU9RcSsyTTFNS0RSbkpPd3k2NXVyZDVNZEhjTDhs?=
 =?utf-8?B?MnZFZHZ2cE9xL3dwdW02amJ6ZUlmMnBmMlpldzE5a0Mxa1lpUDNkOXpqWHVL?=
 =?utf-8?B?S2VjRThpYjJNUGxyd3BIWTcxNGpGR2JOL3laSmsvenFlSGU2amplNHRGYTRT?=
 =?utf-8?B?V3ZCc2NLa1BMdENxSmluMkpNT1pUMFhDNHFMRStuTjJsK3QxNmpwSGNjSURQ?=
 =?utf-8?B?enNjdGM0dVFzSjVnK0QyelhUWEtjYXhMa29qVW1nbTYrOWhCTEdSRG1VTUJV?=
 =?utf-8?B?UmdDQk1NSmprcnVDek9aM2hBeWJhbGh3Y2NYaElGb252OWJPOXFHNWdkWG03?=
 =?utf-8?B?a2lZUHByT29qbGl1MDFpYkIzc1lJRDlHbFRlWkNaWGh4cEJ6cE5JMDM1aTBw?=
 =?utf-8?B?Z210SURGNHVuR3IrdTU2NlViTitSZnU2UG1BWFlMcEROMmQzMkRyd2N0d2F3?=
 =?utf-8?B?YURqU29NYWVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 15:30:31.2765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f32691-bd9a-4df1-fb21-08dd6243fd92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489

On 2025-02-27 05:23, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>
>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>> all that has been tested.
> 
> DYK why it fails to enable 32?

In Linux msi_capability_init()

         /* Reject multi-MSI early on irq domain enabled architectures */
         if (nvec > 1 && !pci_msi_domain_supports(dev, 
MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
                 return 1;

MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt 
remapping, and Xen PVH and HVM don't have either of those.  They are 
using "VECTOR", so this check fails.

Regards,
Jason

