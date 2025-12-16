Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD8CC1CD4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187787.1509117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRPt-00081u-Sm; Tue, 16 Dec 2025 09:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187787.1509117; Tue, 16 Dec 2025 09:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRPt-0007zn-PK; Tue, 16 Dec 2025 09:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1187787;
 Tue, 16 Dec 2025 09:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qh75=6W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vVRPs-0007zh-Jc
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:32:24 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fae6003-da62-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:32:23 +0100 (CET)
Received: from SJ0PR05CA0202.namprd05.prod.outlook.com (2603:10b6:a03:330::27)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:32:18 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::82) by SJ0PR05CA0202.outlook.office365.com
 (2603:10b6:a03:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 09:32:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 09:32:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 03:32:18 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Dec 2025 03:32:16 -0600
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
X-Inumbo-ID: 1fae6003-da62-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIM/MQjA07To1ao8Ri4hM8YMsmug2BsBskKz4yBiBBCDeNdIBTPlyZHwLIbADFqo18ABlRuKPO72VeZhQe4CtOfxgeuLW7ZLYX+SRIVxZioAsSoFHPvu6/CJwz8QBeL4O98Pe7cw7lUN/AKrbSRVpr5MtMwqreb3GwzE5+2lFS3d3qRYMmmetQHJMEpjjY38CVSb2TinznFlvxWvNO1jKNICJ5jvJU4qJ6c5ZjTOrSvRS9DGOe837IgkGUPIFAA/ecJ9GHv25z7UkEq1BUZg7tn5D18WkmGjSp9YSbFKpbPjNQfVZGbJPRDW1J6uhM5ZMlyBvUiv1mIOVtaJ93bzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+jxIl3GbyN6QxwQhAttbcHLSXFZooGin5+HOWX9JdM=;
 b=fiVJ4NNUc69sNe3kyhk/x9MBYAfvhwcyCpRMZUGX5RHTfKXRqrueXjZIAzVGHcL0pEw8Vl9YgGqO+m7E1/ZWtmzni49pWrQLC+JgidAiglkwPeC58uN7QtxivT3V8gtb9nLE+EHZ278tkcxPi6KIR2mhVcL4lXM8UIRa3h/Cv2PftN2DNSP4LrZku76mxw/IPWtlod9oe8PTEE2LotwAqUYll78Qf4HWA6yNabuNJZKZcSCEnkR8Zh+kTCzBreZ/tcAnhNtQPdgxQq7sWAaxsuHnp+kX6XK8qT7/I5VhzkU9iCOvMNmNqMugg1NM6TmESGJqNaYI9Yrwi4QDaHRzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+jxIl3GbyN6QxwQhAttbcHLSXFZooGin5+HOWX9JdM=;
 b=t4MEKqDtIIQtcLMsBEv/0yIGUMzYWeIDknDPK6Y6kgX38aqR8nUC7W9SFnpZj9SG/Gq5FUFzrtMxZ7QPQAleddsPmMLUyScQRXwGmE55DpUm18UC8KFq4CWBpUkLsvT0eQClze2E5aHTwyF2AkGEgXCYPrt8OV1WMLUE7QqhfEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <53055cb0-c71f-4134-9ca2-359d96f438ca@amd.com>
Date: Tue, 16 Dec 2025 10:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-7-harry.ramsey@arm.com>
 <4c3f8be6-2525-4387-9dc4-b5dfdbf41a77@amd.com>
 <CC6759B6-0341-4E8E-A038-7B50B22FFD89@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CC6759B6-0341-4E8E-A038-7B50B22FFD89@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: 278c9a15-bbe2-4782-e000-08de3c8601c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHZjdk5xcndiOVFsRVE2djdzazVOS2I5c05wdTRxV0FYdzVkTGVuRjI2SS9m?=
 =?utf-8?B?SSt5UExKc3p5aWhEMkRBNTlTc0JmOXo0OXlacHczeTBtczZZWGcyY3hVbmxQ?=
 =?utf-8?B?SEV0M2xQYVR5dVVhamhGSHl3MUpXaTRZWFdSbWMwUHlZblRXRFB5L0xISXcw?=
 =?utf-8?B?cVBVbFVpZGMrbU9scWVSbDVFVExWM3VEVWRnZjZwY3BzNmYvaWJ5MzgvM0x1?=
 =?utf-8?B?dC9NQ0lBYmFSUW1leWtzWWZFYnFxVjFjd2FsZXhSRkRDaGs0RC9zYjNJbkpk?=
 =?utf-8?B?L3VPVGlCQ1hhMzNtRnVvUklWQzNZeWhwNDZndkpGU1dLZGdXWndvQ2t4M3Y0?=
 =?utf-8?B?WHBRMjJSeC9weFZ1NzFhWXVVTU44T3JRcE0wajhWR1p1NmdGRHNDU2FnZ2tM?=
 =?utf-8?B?R1JiMGFTbHFyQ2JCZG03dlpOZGRuZCtJaU9mR0h4eEhhWGVyUUMxSUhkbmYz?=
 =?utf-8?B?a1RlNWxObG5VSmNQWEJMMVBkOWN1SGZMTHlzeXBtaW54aW53K01ueHdaSGdo?=
 =?utf-8?B?YUN0Z0FEd0pxNkZrRHlwY0hKMDdPRXlsMzlyZzFUUWJ6N3FJRWUxb01VdGNY?=
 =?utf-8?B?S2x5MU1xemxwazUxUzdUSThWcTltNXRBYk80dS92bWhiTkV1WkhVOUllRjlK?=
 =?utf-8?B?RVpBaURmZEwzQXlFRzI1akhPR3ZLbjFPWEoxQndmZExITkJqNi9OTXJLRHU4?=
 =?utf-8?B?cTRNWmlwQmtyK1JGekFRak1GKzhHcWtRbVdiUjdxVjhOMDMyTHdoNFBOcVpo?=
 =?utf-8?B?QXViNTMrZnBBU1I0U0NCN1QrcFJad05yNkM1N2I5VE5ReXZRcEhhTG00Rzlz?=
 =?utf-8?B?ak1kWGVGRkZLQWFmOHF3L2Z4TnFhRGZ0R1ltY1N3RWhGTGFxdk44b1ZvQnVt?=
 =?utf-8?B?VHZPcGRtRlNzNUZGTjJSZGNXazh4ZVl3MEF3QkFTcWJZcGZCdVpMME04RDlC?=
 =?utf-8?B?Q0lQRkw5OEhSeDZzMnl0QzVuSC9KZlQ0bVFNVnlnamhRQ3ZUNHM3Q2w1bkMr?=
 =?utf-8?B?dnh5SW9tWGZ5eVBqb0kvN0s3MkV5bCtwOWF2M1p0K2pnTDhRSUU4WHVmQUxK?=
 =?utf-8?B?SWNySWUrMUgreGZrdEZZSERpUy9Odlo5VVFwRWxQT1o3bEY5NUcrdTBXeDZL?=
 =?utf-8?B?dldtV2hiRGw0c2Y3czNxZHdkSW81Vi9jUGc4NUhUUWRlTE1tZGZ5b3VGSnZL?=
 =?utf-8?B?VTN3ZG9FdVhITDdnVjhjN3NkVWRFYUV1aXJ5Z0V2dlBUWnV3ZnF6L0RFTVha?=
 =?utf-8?B?NnBadHVsWmNkamZTUjVZbms0OFhiZWtTalhYemNvajg4ZFRzOHAwcUJ1ZWZY?=
 =?utf-8?B?TVdIZ0kvbytnR0daeWNSbEdJSVBkS2VNMVJNaGExZmYxT1prNnJtNmJySnNL?=
 =?utf-8?B?L2FqSlhpOVBLWnBaMS80T0tJLzVKbW1QNzFVZ0dYTHYvelQ3NEs2WU5sc1NX?=
 =?utf-8?B?R1psQkpCUHUrV3NhTlZGU2F1VVRHVVZtcjhiWHBoMUJpaStnUFcxaTVpQjhq?=
 =?utf-8?B?b0R1VUltK0pubmtwK3hFaFY0TDlQbW15RzA1R1cvYWhVQXdGd2RFV0dnQUVU?=
 =?utf-8?B?NVVPbTBUUUhvdk51QkxISnFsdC9KMHZhNldLckJ3NE05MHFuU1NHLzg5NDRq?=
 =?utf-8?B?ZjZnZzlqQjBydVN2U3FFc2x0OWVsdjMrK1RLTnljYmNHWGxrZTlpcTFjVGhW?=
 =?utf-8?B?bFJneUM0RDdUWktvbHBwSS9Fd3hzYVhaTU9tOWc1VnA3MVlvczh0dzB0elZ3?=
 =?utf-8?B?VTdMMTN2R0dFZ1VLU2pzd2k3Z1k0ZVRBWVBva01NRWU0cWNCM0NSOGUvU2lp?=
 =?utf-8?B?cWNIMHkrQUFGSi9HQjFSUTcrenJiNldIOS9IYXgwLzRsbHMrRG9pNy81L1JQ?=
 =?utf-8?B?SU5XNVMxaFBkY0w5WTRTSjVwblp0akQva3pjSGZJSW02cktGMUhIcnQ1S01K?=
 =?utf-8?B?L0RRK3hFNnVxMHpBSGtFRUxGUTFoLytaOXlNVFM5aXBxRVJMQkpNcGZsYzgv?=
 =?utf-8?B?LzdoSDNxTmh3Vi9wbjZCQmFPeDRISVRKdHBPRUZLZ01PRXVIVFMxWVBTbUs2?=
 =?utf-8?B?YlhoYU9VRlFHSzNma3d1SE0wY3dTaTVUcFo1aDhnNG14R2dkQXQyaFdycEtk?=
 =?utf-8?Q?hY0U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:32:18.5282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278c9a15-bbe2-4782-e000-08de3c8601c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109



On 16/12/2025 10:29, Luca Fancellu wrote:
> Hi Michael,
> 
>> On 16 Dec 2025, at 09:26, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 28/11/2025 10:58, Harry Ramsey wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> In MPU systems, we implement map_domain_page()/unmap_domain_page()
>>> through mapping the domain page with a MPU region on demand.
>> What prevents you from implementing the remaining few helpers?
> 
> Only the fact that they are not used at this stage, otherwise we would have seen
> a panic while running Linux.
Sure but it looks like that they would also be a few-liners hence there is a
feeling that they could all be done in one go for completeness sake.

~Michal


