Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A375D3BA54
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 23:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208335.1520522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhxL9-0000V0-Qm; Mon, 19 Jan 2026 22:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208335.1520522; Mon, 19 Jan 2026 22:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhxL9-0000SY-NA; Mon, 19 Jan 2026 22:03:15 +0000
Received: by outflank-mailman (input) for mailman id 1208335;
 Mon, 19 Jan 2026 22:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQub=7Y=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vhxL8-0000SS-A2
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 22:03:14 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a422390a-f582-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 23:03:10 +0100 (CET)
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 22:03:05 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f9) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 22:02:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 22:03:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 16:03:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 16:03:04 -0600
Received: from [172.29.134.248] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 19 Jan 2026 14:03:02 -0800
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
X-Inumbo-ID: a422390a-f582-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y67QIV6tFf/FymduX6Z5CeTCFS7fV5k26NfqV9DFegQyFbNb3x0rchAa5ahAod49QDZMj03hrn0uIX3JShAuLjoE/bPpC15beLo/+wcY3h6sVVKfJ5cctDlI99wRR2gven0AcdkCyfaL9dw5WI/MYJjv0RMiVQnQ4km8WIV62Q0dei2/28EWMEySXgU8DsSxlAOlSa1W79KVvO4Ae2inFAp2bCVxiPUqDXyVt//rd69UbNaO5HbnDbWcN1W0ZGP/f3CzZLPDUsac3yZ+JhLSqUHHN8ZI/5vigTqlx3+oR4uFwDQC4xkHud1G++5XtysD/Py6zqWEFjz+F0aj+nV21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TfQEhyGuQ3DbXSnJe7w1JkgRDIIZ3s+IHEZQm2/ERI=;
 b=PCRAaW/JuND1ZGIpDpQzymVCMfxSk/odkFvpnXLySXqSwF2XJWEmJiNP1dpSVe39zmcx7fHqkHdcK7znL62ZdWk7WvfjogE6yvVPNf4KqisrspIKvnTrUk7pZtQx0wKiobgjufRg0svvk9aVsGwg4u8yIaSnXXl7uFRBbuHkwqRIfDeVJsFiY/ioLIE8vIC7t7wOmbCHaYxhnL3s/1rQ/Y03jt1ySTG2SJCkI0Z1eFt2ZDQJD3cUZU5JHt4jJzuVX/UOBa0+aHz6meHyB9k2yGG1JtVDM73jcUIJbrSwn5Zfmi0e2lL1abpBwVG0piSXkkhvilM+5bJU9qLXDEXMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TfQEhyGuQ3DbXSnJe7w1JkgRDIIZ3s+IHEZQm2/ERI=;
 b=EpNlyW2iX2kPSxnAwalfaDNitzgcyEfkOGdo0vHrjjhvzetdXwCRtD7fiwJQev8IjEoZlSPI/Os5VLp6XklbMPj3pJD2Vn0qUC2Pif5YPtDinbrShkw7A/fhFaKglculLc2zKmrTqTqWbxl8n+0D52C+vfrY69ddgyAuMOAxc0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d4ed01a1-edc2-4bb4-bf99-302351267f77@amd.com>
Date: Mon, 19 Jan 2026 17:02:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] PCI: handle PCI->PCIe bridges as well in
 alloc_pdev()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <f2dbd694-5e20-4560-9933-12cd98b23e20@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f2dbd694-5e20-4560-9933-12cd98b23e20@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fbe1db-fccc-4c2f-cb22-08de57a68583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2Y2am9vQkhPVGhqcTYxZlRyd0lDMDdQSEdEanp0N2kyVTF3ZTNiRlhudG4r?=
 =?utf-8?B?Q3VzMnlvZzVYcVVYTmFialhSSnFZSVF1b0RLazRMUCtzcU55aDRzdmIrS3BP?=
 =?utf-8?B?cmZvaGdhQ3k4dFo4RHlqZmYvenY4bW9WTy9FMTFmN3VGOE5rRGNoakFQNFBN?=
 =?utf-8?B?VzNqYTZCUzFpbVF5ZnlYa2lsVDV5NFdxbUN1QmRnclhWZSs3LzFST1FmbExX?=
 =?utf-8?B?U3B6QllHNEN6elliTHJCUVgrOHFTbnJkZERXalovak1iSFhyYVB4TXh5eDJV?=
 =?utf-8?B?Q0RXa1FLY3M1UlZWZWl2dmEvNTVqUU1PV2xWb1RObXh3UTY1RmRHSEVQSzEr?=
 =?utf-8?B?VnFzL09hNkNmTElOMS90eXlvZ3NXN2J2SVVrQWo5clBVcWNpYWl2NTRrMTJ6?=
 =?utf-8?B?L1dIMHBDbmh2OGZkdWRqZ29pZGc3WWZZWDhzM2RGREo2RE01aDJMQmtrd3NV?=
 =?utf-8?B?djkvY0ExZkNab0Z1dmtGOStqQUVwNXloZFlINkd3QUdLTWxGT05VTTdBcVRZ?=
 =?utf-8?B?TjRONjhQZUZJRC9wMXI0SElzT0Y4aEtqRVF1aFNKb0pEd1g2WFVZT1YvOFRk?=
 =?utf-8?B?LzYwek5oMkdnVFRVdUVUZ3AzVU9jUDh2akZ4RjNUazh2VU9KU2taaWlDd1d2?=
 =?utf-8?B?UWFKM0dQVzBsT055cHp5MngxdWxSU2JjZDk4cGpucHg1cWlvOHBqb2dKZlFC?=
 =?utf-8?B?T0NKdXl6ZXVhZjR2dHI2N0YwenU1cUcwV1hMTzlHMzEzQXFmbktZd1JLZnI0?=
 =?utf-8?B?bnJsTHF1MjV0RzFQaTRyUXNXeGpNWWw1dG1sQW9WeUREY21SNmRKSHBmS1Rl?=
 =?utf-8?B?U09idUYwdktQSXNoMGFWdTErWnk1VnRpYjhNcmtCdGJ5dnNVRHFjSG5nVUt5?=
 =?utf-8?B?VEhHemFmemJaem82NDNLTXdSZVFuSnFrN0R4VFlQWmhhQzdOTG9pVERmNXFm?=
 =?utf-8?B?Rzh3YU9VSHg5V2N1cC93QXYxNUFLZkVOOVpqN1NEQ3pBUWdXY0RoQ0pkOHBl?=
 =?utf-8?B?MGYzVjdvNm0wdXBJWlplRUZYOG15RWlUMWxxSXh4MHRHN0NZNWJnVkVXT0M5?=
 =?utf-8?B?dkJNa2l6VHkyY2xzaCtNMGJod2xXRnlSVTkzWXIzcmZ4UHVEemo5ZitmcVlM?=
 =?utf-8?B?MThLbEl2OWRzZXFyUjI4T0ZmOUJkQ1ZCTTNZeG1hS24wTUNrKzlxVEtrWUIw?=
 =?utf-8?B?aE5HVWhWd3ZmNktmZzhjeldHdFRIaCtoZmhMUStLVWd3WHFyUmJhQVprUSta?=
 =?utf-8?B?R1AxMnBJaTFkZHJYTVc3aEZzRkgrSjI4cXBXTmZsVkgvanVuR1RBOWlKYUlO?=
 =?utf-8?B?NTBFczNVQkoyaDZRS05xb0xrQXNsclBhMno1dUR1Vnpxa21EN21HSTk2V1Zq?=
 =?utf-8?B?cXNpMXNEUENLTnpJSWd3YXpsc1d3ekord29QSDk2KzdyWTVpL3FJVzlkbzlS?=
 =?utf-8?B?R1VrN0hYeHhqWURocGV0eFc1ZWpLOGI3T2pXRlY5QzJzSDhEL3MzVW5nNVVZ?=
 =?utf-8?B?M052QXVLL0NiR2Q4eGs4UGhxWnlyUnVSREQzdk5GS25PTzVKR05hdmlYSlVL?=
 =?utf-8?B?NkQ1aUZtNFZIZ0RDaG5qVitVWHc3Tnd0UXF4UzFHaDlObHJER0pCQVUxdUNB?=
 =?utf-8?B?bGFZLzFUZnJJQmJwVS9wM2RBVVlWelQ0cFBITTQ5WldGSklXL0lvcDZTR3hW?=
 =?utf-8?B?Wk9vQXFmYjVhZUhHU0FXTjFuSnl4RlNVK2cvSmhpODZNS3ZqWEdnWG9DNzNa?=
 =?utf-8?B?dEEwdHBURGs4MEx3c2xNMUg3V3NiY3lmdkF4b3AySkc1bEN4TVhxeEE3eU8w?=
 =?utf-8?B?RXg1TmZJMVFDSHNjM1htZnFxQkRmTzZIUTRlVmF6Nkp1STl4a0ZCemZVQXdD?=
 =?utf-8?B?V0c3ODlzbTJxU0MzYk54dVVRY1ZiL3hPZGprNmQyZTBtemxQMUFiQjEvd0ZE?=
 =?utf-8?B?NE1lUUNZSDVsYXBFT2R6OTRhOTZJL00vbjlkRi9XZEFWdFdiZFdQbTJ5ajA5?=
 =?utf-8?B?QnVPTmJaZlpodloxNFFEQk1VQ3N4UTZrTGdwVVFKNmVFOER0NURxc1M5eXhp?=
 =?utf-8?B?YThRVkxnaHlTVVU2YXhJOC9VS29KSyt2ajBzeDdHVUcxMXV4QkNmRG5GQ3Fi?=
 =?utf-8?B?RTdPTHNndnN2NmFHd0g5V2lzV0huN25RSTJjb2V5cDZTTmFCMjdvUWg3c0hl?=
 =?utf-8?B?R2dOaEhOVGFHdTlld0svQmhDOWJTa2J0K0N3N0NXUUdJUmd1aGRjQjhYT0w4?=
 =?utf-8?B?eExmZmxOUEdPWDdjdDBhMXdLcEhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 22:03:04.8693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fbe1db-fccc-4c2f-cb22-08de57a68583
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

On 1/19/26 09:46, Jan Beulich wrote:
> It's not clear why the enumerator was omitted, as these clearly shouldn't
> take the "default" path (issuing a warning). Handle them the same as
> legacy and PCIe->PCI bridges.
> 
> Fixes: e7e08d86ad2f ("IOMMU/PCI: consolidate pdev_type() and cache its result for a given device")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

