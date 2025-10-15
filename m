Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECDBE042C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 20:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143917.1477492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96as-0007wl-5k; Wed, 15 Oct 2025 18:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143917.1477492; Wed, 15 Oct 2025 18:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96as-0007vD-2m; Wed, 15 Oct 2025 18:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1143917;
 Wed, 15 Oct 2025 18:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v96aq-0007jK-RH
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 18:51:24 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed92aaa1-a9f7-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 20:51:15 +0200 (CEST)
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 18:51:11 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::23) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Wed,
 15 Oct 2025 18:51:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 18:51:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 11:51:09 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 11:51:09 -0700
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 11:51:09 -0700
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
X-Inumbo-ID: ed92aaa1-a9f7-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu33UoRV6bUFbE/ogSd1ac3QAq9XTptrj86SP4uYkYxXwGuT3etzCbFh2wpVCvkqaci54jh3YLODmwKAUa0ssvV5X9p0NSxGrN4BucI3Q8cFnO/msGNA+Wz6GVVhWheMOs/LnnzvKDV+b03MNMKDeh1fPlAEGgZ/LMU3yEuZ87IpNtrAwX+E4WQbAYe/bEtGvdVSr1ScPI5wbM24ZFCm6QaZnlSMYluvn+RqblXiWuFqkXvWn5GMHWewMGgx/DF+UsunmMp/AbJB8NQbC3xV6Gaw+8Eqedl4Cy1q3ALlB7uVmZfDolzFXSdiBxq/R9J6F2/LVBo6KS9oWiQn3I2itA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KViWu/4i+Fg+8e7ob3dctVe3dvgToo2WPPfh02SNOYo=;
 b=t4IDtNZq7DDgA0yfZP2nOzZ5M3Ob9jXQcRx0cdIfkIH+wqJxAAwY7glym2vfc/TDbKgWmggiMhto6loBb7EqhRzEjqoZ4cf45YJ3hjBWD5SS4QHwUGPXEOP5NmXvn2pv6bOrwWZTG+Ktr6yNoDzM9iaEzdpHMdPQLZmd3hdqn3kF+HC/K6O0bqOFaZaQp5e7/BQQhcD/dY4tfQdW/JgE+GWeDgoeFDrUwnGxZGOGRMP0YOO7myulcm/nhtQtE+W9jXN4vxWRPH9SyZbS7yZA0eUrZe3derM881nBmD6mZMSYKwPX2f1LyWvD+0mQNzn1ai9QS7jsYrndRMX8mSBnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KViWu/4i+Fg+8e7ob3dctVe3dvgToo2WPPfh02SNOYo=;
 b=bfypLU/fBav2idkDt/nvhdtlWjIeYCLGDW5WkJVB4sDF7hQa0OyQjjSmDg6+y0aYcD6UUXV/0LPgcGjDMhWYg5XjVnElexzqBLYuv1OVdLf0Voeg9fIRaVVJZwxJ4oQ+F2fE8JbxUXpEqzU3VbgWySOKiMvJ3vxQdrl4k13I0d0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8ce4fc37-b9bd-4ff0-b82c-3fb7f24f248c@amd.com>
Date: Wed, 15 Oct 2025 14:51:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 3/6] tools/xl: check return of
 json_object_object_add()
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-4-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251015134043.72316-4-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM6PR12MB4058:EE_
X-MS-Office365-Filtering-Correlation-Id: 69605dfb-213a-4469-2d1c-08de0c1bcecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WCtLazM1YUZxeDU3dTRKSk56M1QyWEM1SDRnNDhIZi9ZKzN0Q1J3VHNoUmlk?=
 =?utf-8?B?R0M4OUs4YzU4TzBrejZPd00xTjU1Z3k0Q0pwK0M5M1FKVWszd01zK0xXYk5U?=
 =?utf-8?B?M1c4VkJzWmFZSDdrMFVTeHRqUnN5Z2lsVmR4d25ubVNzMlZuM25jS0ZEZzk0?=
 =?utf-8?B?WGtZVjQ5WkhybjJVOGplSlNSK0ZHQUZidkR1ZytnUE1sU3V4b0I5OWlsWHFk?=
 =?utf-8?B?ZTZXeDUycVNtanJFYzNsQm1CQUpUVEtqbXB0M0dDOVQzUDBHeDhIYzRhbWpt?=
 =?utf-8?B?MnFrUlA0NDY3dUpzbmNVMkxISXhhd0pvNlVHRmlPVnBPeUxjZTJ5RnhzZ3Uw?=
 =?utf-8?B?MmVJQW1LM1ZrUjJWQTFadzA3bmhEcmFTK2RmMTcwZXl0MGc1dVZZSkt5SzlQ?=
 =?utf-8?B?NzdRTklwN2FKcEpCcjB5TDJqbEk1SExEQm5WcE5VTTBFYnJ1Qnl3ZjlxbGNB?=
 =?utf-8?B?YkY2YVhUOFhRd0pxa2hmYWlmNGVJVUxYMDJaa2RtNzBKcTRXaUF0OWVxSUU4?=
 =?utf-8?B?NVpCU1FrbXJRcmpIR2hiaDhHVER4REhwZWh3eDliY3R2clIycE9iQVNUL0Mv?=
 =?utf-8?B?RGJLdHMzamNXd1hVOFl1R0MxNUR4U0pOZlIxeTZHWVNJZEZBR0lKUWp0Sm42?=
 =?utf-8?B?dStYU0FPNXRjZnI1NUlwUERzZlhuTVUyM0t3cEppR2x2ZEtvbmJGWXNRcUNs?=
 =?utf-8?B?UGlSdktac1VJaWRpcmxLblFST1hKNUdWcGZRRnV4b1RqMWw5VEpaeXRrN3Vi?=
 =?utf-8?B?VDN2TFZvZXB6NVpBK0QweHFpWFcvWjdkTEg1L0l0R2tJT2VNOXFkQld1ZnRv?=
 =?utf-8?B?T0NuY1o2VEswMjRoUjEwWTU2Q2hYMnpFbytJOTdtSE43clBCc1dERGFRTzBi?=
 =?utf-8?B?UlNLQUZPekROcm53aGNsTTNGKytta0M1bDNOVVhZT3U1bm1MSmtLQWRYNyt0?=
 =?utf-8?B?YlRRNUZaeXdiekF1UnFYWTRqNWRtb3oxcDdCbHA3Wmg3VHFVOFJwMFVKU0pj?=
 =?utf-8?B?MzBnc01vd0c3Zm8wWTFNNEFPZUllOVMzQk1CV2VjV0VXVEtsZmg2ck5wZ25w?=
 =?utf-8?B?V1QrSWNXM3U3ZEROaTNVZS8zMDdDeUlYOVVnVWcyUmRVYm1qLzEyR3l3bk5B?=
 =?utf-8?B?NnpuSzZxNW1TSHc5ZXcwV0RYVUtYSE5oaXNVMzE4dFY3bWgzMVhPUitiYUtZ?=
 =?utf-8?B?ZndLSkFnV2JlanZRWHQyZ2tOeGR2V3RXd2l5aldjbDJmMm9JNTJwREVQSG9u?=
 =?utf-8?B?N3MyY0o2ZVJvQ2dHZGVtMkh5M0RnMTVEa0lyMXRNMEFQcWdCaTRwQnVWc2tw?=
 =?utf-8?B?bmdnRFRyVlFLVkVuNWZSTDJZOWFVN2lOaklXc01sTHlzUzN3dmFpVjZnKzdt?=
 =?utf-8?B?Rk9UV2VwZFFtREtqaG52WWQzaWZTdThiYjFjbG8waWdwTWxJTW93WEgyd3Vu?=
 =?utf-8?B?b2R5NWtVMm8zRWRQZm1wV2s1OHRZUUE2WHZqRjgxSTIzUnhWYXRteDh1bklS?=
 =?utf-8?B?RTRuYmpNWHlDRTdZOENmbEg1M1Y5RmpEeUFiNEdFRnF5WHdtdmF4bzBNQjVW?=
 =?utf-8?B?dUFBMVpydUI4NHlZckRnY0FBbnkvNVp5TldFWWdWdzlEVnQ2d1krNldCSjN2?=
 =?utf-8?B?RVZHcC9RNjBNa0JQaXNHUlVkSmJiaGN2NVBXWVlGeDVOUTBxUGV3M0ZLUkVz?=
 =?utf-8?B?SjBna25qc3ZQbnJxVlJGek1zdjlBK2tmWm5QK05jZmpZSStyVkNRdnZXOXNn?=
 =?utf-8?B?bkUrbmpzZnBUeFZkMmNBbXNBNXhqMWdvTk0vREpWdDJoUUFORDg4VTRPYmpK?=
 =?utf-8?B?ZU5ab09qN1FWbVRQTVBCdTRXTXQ1QnVleFV5ditqYVJzMFpKdzVia0hITDI2?=
 =?utf-8?B?YUN5aitXamlTRER1WVVyNDZuQ3FuN0Zua1dJZU04YytDdmxISXJuc2NJSzBZ?=
 =?utf-8?B?NHd4Z1FxY0Q4aTFZNHpNckt5UGdROWYyYjMzOE5veFFXc2Vrcys2SWovV1Fn?=
 =?utf-8?B?QlE5R1A5ZkV5aFQ5dXY3b0JkTGMrL1FVUC9KSzVnNHZ1RjFNSUc2V3I4Z2RR?=
 =?utf-8?B?Y1VMV1Vkd0J6ZkR0VWVGOVpGL01rZmVvL3g0dTRUSHZVdGZnWDlidzBUZUIz?=
 =?utf-8?Q?hi6I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:51:10.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69605dfb-213a-4469-2d1c-08de0c1bcecb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058

On 2025-10-15 09:40, Roger Pau Monne wrote:
> Check the return codes of json_object_object_add() calls in
> printf_info_one_json().
> 
> Reported by XenServer internal Coverity instance.
> 
> Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

