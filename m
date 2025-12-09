Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C5CB1495
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 23:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182243.1505157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT69g-0001vU-Pj; Tue, 09 Dec 2025 22:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182243.1505157; Tue, 09 Dec 2025 22:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT69g-0001uK-Kk; Tue, 09 Dec 2025 22:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1182243;
 Tue, 09 Dec 2025 22:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT69f-0001tn-7A
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 22:25:59 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06bd7633-d54e-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 23:25:55 +0100 (CET)
Received: from BN0PR03CA0054.namprd03.prod.outlook.com (2603:10b6:408:e7::29)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 22:25:51 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::9) by BN0PR03CA0054.outlook.office365.com
 (2603:10b6:408:e7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 22:25:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 22:25:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:25:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:25:49 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 14:25:49 -0800
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
X-Inumbo-ID: 06bd7633-d54e-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm8wKZoeQUNK4YhWnb1piHdDKrdzPviixUfuczdfrA2hMEQk/VA6Oxj2RwRaYFYWWjuYQNYxTDkURuE2PNCaijMRRg4RxZs9cMRijzxTkqCzqaUD9Ny4rQOtkP981xk8v+dW2Sj8/r7G38Fki3/6zjQsD1mjdhdHcHCEDz54LWlPlRqyZMTbasvBgJv7YVBybKX2KTFzG3cgZg2vrL7sHAgcAibvjyMWINh6o2gUKaaFHYZpkfuvGe7Z+bXQ4JeUekz2Kuy32zyy+aRMzcWdHFWj/zwM9mLmVHjBa2HTuSErAJZK2oFi84TDsOdzCAXe706zbLcd57ER2apcG+V8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CncUYlPo2/LGqC3hDoToPjiSctTRNP8xoa/Y5Mj2DFY=;
 b=sIbfEwls51egG64rGsHU2Qiu02laBkV22lqPTAmT98drFVhf7W6LgCI+64dRY3r7Hbts/rW12wWpYet0/G1TW3LXsueUzwFjACjjyOngH468XacKiVYswh6DJOynCZbZ7RpueOEJgjMp+B5nfwqd/19AYUixoqX1yUbJy7xDQc4xdF8QSQ7lXdW1mB+J4FguLR27Xlgchef1L+XjIRH02a3laRBDhM2o7SZjUNAb9CyQ4yhDsmlnvsEaCdfHdnm42I75k/p2CKtSewjpXJyJrUzI2J3zIxOHkDCgLJQmLnJtVU/3MhSGb0Of5sx3DPnMAqA7LYePbjIZssaFtsXEhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CncUYlPo2/LGqC3hDoToPjiSctTRNP8xoa/Y5Mj2DFY=;
 b=XHYFHhltUVO2xgzX+Lq4Ecl7WHi2NVr5Xp6a+6EaIoAq3FLPsgIIqqfjA3RnrnMXx5DtyFysts/OChiBuhkccM7GP+NLENvzxExvSkOmBNRw0hkOC58rd2PaxFiJgx8vln7tU5tjQ6MaYbjRlEaqA6No2hmBdJecI9cS7DsRg8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <eb98d9b5-5ce5-488b-b68a-e06820686968@amd.com>
Date: Tue, 9 Dec 2025 17:25:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/6] x86: replace APERFMPERF synthetic feature bit
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <80a6e497-bde6-4c5b-ade8-850abf0046ad@suse.com>
Content-Language: en-US
In-Reply-To: <80a6e497-bde6-4c5b-ade8-850abf0046ad@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edcd2e7-abf1-4464-6d4c-08de3771e848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGoybmRaV2Y2bU1lMnpESTh4cWx3c3JZUEE0TFVIcHFrcEhSRW5pOWhUbGpP?=
 =?utf-8?B?Q0hwR0NqWE9MQi9VYlhoUnVoVFVpaWcrL3dCNWVlMFkxMk52Nlg4eWdiUzY4?=
 =?utf-8?B?aG1CVTJOMHB1LzV5c1pwWWxXL1AvNDJXYWd1QjVOVUJIbmJKZUg0cEtET2gw?=
 =?utf-8?B?TmRvWmh2NUd6YmViaUp0T1ZRbDJVbXFabTRJRkY1dEJ2MjJ1NldtdDRwdGZX?=
 =?utf-8?B?TllPUTVNWnNJakIwVjNKVm56RUNPOFprMmRXUWlPWTFQOUNadnBoTlQ2eE12?=
 =?utf-8?B?WWVQMGdlQWhTSzc1TlRHMVNWS01GZHVOdW54a2c2Z2VzalNyeXUwSnQ5VmhK?=
 =?utf-8?B?czErSU9HQ2Jrb0h0Uk11NnpxV3NqMU5kcVRZc0lnZDZISmFsNXQ1VHNHVmRv?=
 =?utf-8?B?c2swcFlZM2RhbHJEWjI2a0xWZFdCVUt4b1Z0MVQrOW90a1d0VDBzUWl4QXp0?=
 =?utf-8?B?OFJjd1BhbTRXMTNwS1laYzZjYnhQaElrL3A2MUl4RDF3TUdxZ2VjNk5LSCt2?=
 =?utf-8?B?UDQzRTJSSTgvRWJkZi91YWRDR0NGRlZ5YU5tVUMrdGFvdDhUaHgwV1lNRFlz?=
 =?utf-8?B?UnNjY0lvS0FGMCtUM3NpSmloUHoxcTMwaldzVy85bVIvQ2pjVENGUVo5RnJZ?=
 =?utf-8?B?TEl1bkp3djliajkvNkVDSE1heGNtaVFzcUhGd2MzSERXSktsUTRDdGR2OHNB?=
 =?utf-8?B?ckJqTDlKa2VhY2dBRmUzMmxlc3FVQm1lV3hOajB5bDVBMlE3MkMvRjJGZ3VU?=
 =?utf-8?B?bzN5RlJ4NGxoLzNxK0Vpc2ZWWjJkcXZhblB5WHhBWWlpdTVVcjc4QmRxTFZs?=
 =?utf-8?B?VVo1M2xNcWNrK3NXZ2JldUNTemN4Ulh1Q1NzQ2dvZCtBSHVYYlFzUHdPbUIz?=
 =?utf-8?B?SkZYQ2M4OExwdzFuYlkrSEVFNnQxbXIrZjZPZjFPcDc2ZjE2bU9Xd0habzBD?=
 =?utf-8?B?L1U2TlNFZlZIL3MzVWVVOFUrNDBGRFIyeU02eEorRmtIVmtzWE1zZktTZzlm?=
 =?utf-8?B?NktEUEJPUUVVSS81RWdSTi9qYW1qZlNFR0VhdGFLUk1kUnJvalZNekZLSzlL?=
 =?utf-8?B?cUdoZW9oemJBak00VnErTHR0QldRSHBuU2xHd1hNMEMvVTErSEw0VFZtL0J2?=
 =?utf-8?B?eG1yMGU5cmRkTDV0WmkxRzhWNkRROEpLMVBuMmYwY1dZUXNObUxLZFl1VVl5?=
 =?utf-8?B?ZkhLd3hXM1FpQjc2N0Z0KzVPdzcvbTRPUU1qMlczTFhmNGNRRTRPVjgrbUk4?=
 =?utf-8?B?Y1lWOTl0c05kVlpjdXMxQVZkZEtQbTlGOWhuaXFpK1BpZVFwenRMMVo2THN0?=
 =?utf-8?B?Ymo4emJud1o0bDl3b2toaDhQNGxCa0N0UjBFMGlWVEVrTVlUN2ZpWVVqdnRu?=
 =?utf-8?B?Y1J6dWZlbnFUSWxQSkZmMG1FdCtNSDVLcDJPWVlicmZMcXQrOEhTZzFBbzI4?=
 =?utf-8?B?NlF6TS8vTXRoWHRVNTFYY0lPYnQ2NVRxVjJ5RFBCRVVHQSsyRUl6N1JmeU9i?=
 =?utf-8?B?NDBaY3RFNmRvc2k3K3gvM1c0cGJBTlFJaGVvMEljTnVqeThockx0OEdKeW1q?=
 =?utf-8?B?bGhSejE4YTNCMWU4UkZFRXlnbzl0V1pXZFpVZzFObmNRQ2VxNDF2aWtaUDhD?=
 =?utf-8?B?NXlKVXgwT09VYVhJVlQvbTBUWnFEU3FweGk5Z1NLblZDSzJucyt5QzJhL2Fy?=
 =?utf-8?B?Q3hiTjJpNXNCdldaNy94ZnhNdCsyNGsvaStQVi9YeGY5bExNOW85Tnk3YzlG?=
 =?utf-8?B?YjRnZGZNMXk2cSt3TkYzUzR6Slp4WXVIb0tkYWFId3dBMmJIdHR5VjN5NHZy?=
 =?utf-8?B?cHpKU3JKR0xhNFA4V0xFeDRhaThIdG83YlVQZ3B0WVRQUnVRc2tSWjJWYldP?=
 =?utf-8?B?MzYvYjZhbENkWEF2WXhTenlLbzc3OUtBUkQzNERFQXp3MTJjN3AwcGhkR2dE?=
 =?utf-8?B?SWlJclNlcE9IU2ZSVVRmQkorRUJjVlozb0dqekE0NWc3YVpiYWk2anFpZEYw?=
 =?utf-8?B?cldkbGdLS3pwK2tlSjF0dS9kMjdoZXN1Z0YwT1lyMk5XUThFTTNGREwvKzhU?=
 =?utf-8?B?WHZzOCs4RFExbE1jQk9GakdGakhVM2s0ck53cno2ZVdVVlhCbitFejFvTnBw?=
 =?utf-8?Q?oThQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:25:50.0646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edcd2e7-abf1-4464-6d4c-08de3771e848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070

On 2025-11-24 07:23, Jan Beulich wrote:
> Use the respective host CPU policy bit instead. This has the (tolerable,
> as we generally assume symmetry anyway) effect of using the BSP's
> (unleveled) setting, rather than the result of leveling (as is done by
> identify_cpu() on boot_cpu_data, rendering the variable name somewhat
> misleading).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

