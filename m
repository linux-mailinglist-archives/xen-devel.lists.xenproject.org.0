Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF8D1816C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201388.1517041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbmr-0000O1-HN; Tue, 13 Jan 2026 10:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201388.1517041; Tue, 13 Jan 2026 10:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbmr-0000Ku-EL; Tue, 13 Jan 2026 10:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1201388;
 Tue, 13 Jan 2026 10:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfbmq-0000Ke-2a
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:38:08 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeed2199-f06b-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 11:38:02 +0100 (CET)
Received: from MN2PR19CA0035.namprd19.prod.outlook.com (2603:10b6:208:178::48)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:37:57 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::ba) by MN2PR19CA0035.outlook.office365.com
 (2603:10b6:208:178::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 10:37:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:37:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:37:56 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 04:37:55 -0600
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
X-Inumbo-ID: eeed2199-f06b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBSmF008nTaczfMj0Y+uOC0IS1XgQhJtqoB6d4QbBfbTp23vuK028x59seUu4hC8TcqVRkA3QyujP6r1JErO0H+5TMQcQK3a+kjdIQgB1rTnLJdmalLgNurwkdGh1HYPq6OxCvj2aLTqyxb4WMlu3/qgfCr3P2FzbP0FO6CNJGVBlEIjQQS1BR521vETyPiKmqr8ivt1oofE8fr0sVdqYWRd4GVkIlWpfS/YqBuMEIZIYcbqKIus8RUkeWu8pUci3LNlMAZZerT9k9LhTmKl25hG4bnvd2hdlpOwZZIhkCIHnFMCOLh6FhcsLpaUgDG+f80/mCJBta+Xpo56yOWhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hoq7dWv6A5rvTbw3ZzfJyhr0J5AUmN39uhaH7ZdrGvo=;
 b=T0jLL+FeEwunOfar7GEXmXvqkz6PhCoF9/oNUJKeVFGFBM0PCx83CJFsLkXuIljVTU2Orep8j6j8oW88iATNN29X9aHLZvobLr/bp6XVkBUrsps7V3UaYKYrexTSfCUu3g4/ndGJ8CLCLkaNZnAejNkO+H9+83EjhlFc+3CKhiqEjw4bBU8xB2R16uA0ShcGB1jWAtVDFrIeKPgKvBUDhlYb2j24GVfcpCLkbyAUyfQGzwICSB9aFnWDeeKICh7yTk5gjF5rfapjMmU0sOv6OkiSr0ECLtEBC32eJS8cu7NXIDSoPRZiE4T/j1+5Jy+FoLWWFvS3/DX560s76xNw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hoq7dWv6A5rvTbw3ZzfJyhr0J5AUmN39uhaH7ZdrGvo=;
 b=DOPG6W1aQdqw7hQoAtUBYJUI52BP9kl2KzS1M8KAPfBMJcvkCMHx83w6Ynu/4FafufNkIGSdvVffIDnRf19OIfVvAg9OMCaqHVqbMLoK5QIAJh1AmKmOpnWcahCCPfge91X9iOjktkwvM1UQhBfuXh3Is8Z/KL6eEv6rhf4KwEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <43213cae-5c1d-46bb-8c28-869b92a20a32@amd.com>
Date: Tue, 13 Jan 2026 11:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm: Use secure hypervisor timer in MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-6-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-6-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: db71e0a0-3841-47d2-7e98-08de528fd0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2IzbktGbjdrRVJEc29QVWVTV1l6VTNaTU1nbmtxeFl3QitLei9oa0F5dXc3?=
 =?utf-8?B?SnVoVGdMaVJTR1JqQjBJZlVhanVEa0JxMWdqeTVCLzgyWGxvYzk5ZFdZNXM3?=
 =?utf-8?B?NFBkVG1QWlRoQmpqc3hNTE5ta28wREFMSmdkNkdkKzhLOHQyTzhsdjVzOUZQ?=
 =?utf-8?B?RWtVU1RacjFpMFJIKzJUU0FqMmgvS3ZaUjNvYmJxQWtJYjh3NEczV2VXcjll?=
 =?utf-8?B?eXdqck1GMjEyYWJDMU96Rzk5VWhkWEJ2R0ZTczdKVVlwVHpUbTNObU9PQWEw?=
 =?utf-8?B?K3NPRW1PdnBHV3d5Y08zalNqcTRPdVljTUh3enVHQlR5VWRMckpsUExtdVow?=
 =?utf-8?B?LzB6d1VDRnBtUlVnUU56RDNnQ2Vub3I1R0x1MTdzZHJrc3VtYm92L2VOQ2Rm?=
 =?utf-8?B?UGoyWDROYU5kS25PS1NidkNVc3FsK0lNR1BnelV5QTZxSWovaDZscTdNbVUz?=
 =?utf-8?B?RmtHZXhjWVJzOXFzaXAySHVwWDZCUUh4NEFDblZzb0JsRVhRbHVjdjI4RkY5?=
 =?utf-8?B?K0thL3VEMXlES2VXbnZMYzVKWndOR2hxbGkybXNUd09oK2hQdVBDSU1jQ3A1?=
 =?utf-8?B?L09pNktoZ21UeDl1UFliZjVzU3FTaXRxL0ZIdmNPZ1NHRWxiczNjVEx6bkxB?=
 =?utf-8?B?NHlMVEI3MmFlclpyQ0ttRFVTZkt1QkZLNDVKQUhlak04SkF0ZFhkbWJsUm5X?=
 =?utf-8?B?NmE4SlRRclBmTzNjaU53dFBPT2llc1A0WStIRTdaQVZ1dGpTRUEzdFF2OUY2?=
 =?utf-8?B?b0lBMVJibmRlNDllVVhQQmsvSWF1bUgxYldwTVJHSnFmbldQQTFPM2wzeHc2?=
 =?utf-8?B?dXM4SU10RTNTekd5V3RiSHBLQ3dNZHZhQit6VGxSSy9zdlBEZG04MUoxU2Zk?=
 =?utf-8?B?RzRBQkx5Y2xhcDhCUGRvUWhsZkpEVDcvSW9uTVRnTFJXSFJxNnJjL1V0ZUJ6?=
 =?utf-8?B?RzhhUjJwRVl5dlgxSHlteDQ3VXVqZFYrQ1NnQ2t5blR6Z0VLQ2FRVUNjN2xs?=
 =?utf-8?B?eUNhbkxjR1RqVXE5b0haR3IxMU11RW14RXhHdVh0QjViWE01Tjd0UFR2R0JS?=
 =?utf-8?B?ZFphR2JsTXE2eW94b3NrMnZ5SkNRdWZFeW02SzVXUUxWbjdCQ1hreHhWY0VC?=
 =?utf-8?B?RTJwcjZZOHVndnZDVWcrWGJNcVJaV0gxNUlHQWYxK09zRDJZdnJlazNVWlND?=
 =?utf-8?B?UXZsaFNHU0ovWnh0RExvNy9hQy9sajZheVdyRi94aStLclNMQkVYbW1KcDc4?=
 =?utf-8?B?MXNIUVNZdDh0K1BYdVdtSVhtVEZlK1o5OFZ0RW02azY0SHlMY2tKUEpHYXNM?=
 =?utf-8?B?d2NuNG55b1FyS0ZjTVNPNHBacTZtNU9hcU9RU0pCZmVXQ05KeHgvZXI0b0hi?=
 =?utf-8?B?RkdJWlcyVVB2S2RmWVJVNlZVMUo0VGhQc3VCeURvb1NwNHJkSzEzbng0OWRl?=
 =?utf-8?B?MDlUZUQ4a1g1Q09sZGNxRmRxdDhDcUE2ZFFvSFIvbEhjQzRxZ2p1eE9sbnBH?=
 =?utf-8?B?eGpmVGlPUWRxZWJEeVNRbTQ0NEJmMjB4N3RaYjB2eHZkVjZmeHBkWWI5Ni9I?=
 =?utf-8?B?Mld6ZTJhMUpYcTlycjlXR2JteSs1b0tWM28wdXAyWnlhdUxEYzB6TTllcGlL?=
 =?utf-8?B?eC9WOFc0M0swNE1MVUJHMXVKUmUvR1dUUmx6cnRSenAwZVA4bUlGeWI2V2g0?=
 =?utf-8?B?ZitnYTlwZnJzWU9MYkpjQXF5TGtPRDBTc2V1N3FvMEVjMVQrY0RybWZpVFkx?=
 =?utf-8?B?Z2FYbi9rOEhENmpkZXI1UjFpbjl6TFk2WEJNcGtNU3hhVU5heWxJZU1Vbm1E?=
 =?utf-8?B?Q1pNWU42a0dVNW40OUJaZTNkZ09yMHpQSG1LeERyVklwcUswby9lMEFlanFp?=
 =?utf-8?B?NHNaV1dxbFg1MTdSQWxDOVZIeWxSQ0VyQlBrNmtsc2xrczltUHFmUVowOFlz?=
 =?utf-8?B?UEhPM3hTNkhMeWRLMWhnSnYybTBhQUpBeUhDSkhxUlB5RjZpVnd6YmxFczZX?=
 =?utf-8?B?MGI0N29YT3ZlQ2FiNk42bmlVa3RjalkydDZDeGo0QkY1T0hId2dFdGxSQ2Jp?=
 =?utf-8?B?Mk9YdzdKaTl0VjNsTzI0MG1BSktJdGNrb09aSVhDMTdLZGdiZUdyUXdTczRn?=
 =?utf-8?Q?VgbI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:37:56.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db71e0a0-3841-47d2-7e98-08de528fd0b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941



On 05/01/2026 12:35, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> As MPU systems only have one secure state, we have to use secure EL2
> hypervisor timer for Xen in secure EL2.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


