Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD2B3859E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096279.1451034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHeZ-0000CL-3K; Wed, 27 Aug 2025 15:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096279.1451034; Wed, 27 Aug 2025 15:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHeZ-000098-0O; Wed, 27 Aug 2025 15:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1096279;
 Wed, 27 Aug 2025 15:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urHeX-00008z-Uv
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:01:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b77a4a0d-8356-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:01:33 +0200 (CEST)
Received: from BYAPR08CA0060.namprd08.prod.outlook.com (2603:10b6:a03:117::37)
 by DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Wed, 27 Aug
 2025 15:01:29 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::fe) by BYAPR08CA0060.outlook.office365.com
 (2603:10b6:a03:117::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 15:01:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 15:01:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 10:01:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 10:01:27 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 10:01:27 -0500
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
X-Inumbo-ID: b77a4a0d-8356-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPBYxRAFb09pdqCayRxOQ/4fWwWT6DcjAsHadXt7mt+1+y8aSrDZI47VuCb7bT/qDBl45yhlfkV+QTdsGGgrRJ1s1v2DSp9jCQkF0xfBPGx/MMrlvZb02NYrBPpijcpWJHRJiX416BrHlPV6Ifd+k6ZOzBc8nb0hQ0L1lGfLiA+XP6nwxxEd07N4fd8A+sZS4K3qW6NggG2wb0mVhj1lwAePswFVNLa3YojiqJa8osEiRyarMhFrwXCcQJ7rUiXxR/MXFwfJNyHZLUlLF58fvdfPjRYqDcG8SEVarJa/EWT98j1EEMySvQ67fi8fLVmntvG6ExM/kcSQMqQrzBCGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxccLamGa+j5seMOs5NnfcvoD5XqIsKra5Dpt0g2S5Y=;
 b=fOeH9y3OR7bHtn0m9JFKYap1HgndV/3pUiriE+skiQ1PjHmptf3g6H1Yb791DnCMt3RENCxnmb647mwWK2GZnTszG2Nn8pOvw93Vzzq26OrL19Xo/Jo45YQdfh8lvD8NLh3/IEWRPAViFVKu2FhllSWifujihXiX4R2hyVkxVbXQn8sgAyjem5fzffEOjJm3mHUsct4Gy0wD7xcaiEjX8G2YxJzHgUqQlkg6fj2D1FK8obwlmhgkO7lyzZt3g20GGuLK4Z8gXLYyCyky4GqbkrMLQTn/Gb4VlN2joQV5ItUsSjySFc6cpMuC053bkhnZJci226Xq0zGD7q7H/TsRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxccLamGa+j5seMOs5NnfcvoD5XqIsKra5Dpt0g2S5Y=;
 b=U9rhBBc6OZ3M0zIoLzCQxxxKrL2HCCNjOEQWZW7+IS0LAb7E2FkiBz3fksYg3+5PHeViFNZ2gpSsj+wDzH4hz6z4e9iUSSVXVLc14Br8QqKfYC9Y60cPjh9pQd7kkzWEX+Cjkrn1cFCAQhX44TgwNLKYe+YHRza4Zeb8WDbQdT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <39b2fc9e-44db-4f42-9586-1dcdac118659@amd.com>
Date: Wed, 27 Aug 2025 11:01:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib
 for libxl
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-5-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250808145602.41716-5-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DM6PR12MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe04f88-9326-49cb-135b-08dde57a999c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1E2V1pXNDVUVllJM2tPamQxZGpoMEpjZnkxenBVdWo1MjlqL21Hc3lCem1r?=
 =?utf-8?B?ekV1bW8vK3BnbHRscTN1WGg0MjlVMWJlMjAzMG91elJ4elk4K0FRNnBmUEc4?=
 =?utf-8?B?L1BkV1JkcUpsaUt5YVZTTGZhcDhRWXpXaW9sUTJCUGF1eUQvaEtON29RQnlR?=
 =?utf-8?B?NWNiTVl6QTI2dmdURDJMc2xyL0JnS1loNHpFN2ZCVmh2VDdnT2ZQZWUwdVJK?=
 =?utf-8?B?NThYVTdmWlphU1dIQkxaSFdncW5RUVpMeFZWNzhXUndZU2pick4xSHdVRE5I?=
 =?utf-8?B?VXM2ZWFNWHE3R0tLeS9hQ1BQY0NoRVc5cW1NWXFPMmpXVEZEK0NHeitNaEFx?=
 =?utf-8?B?aG9wWUs2YllDOW9TT3Jnd05nUEV1SVg0c01scW1kdktHMkFray9wdnEvNnl0?=
 =?utf-8?B?RUZJbEM4eWtkSVFzSVpOZGc1OWZ3UkZFandGQVZFYlJvckluanpFUUN1VjVH?=
 =?utf-8?B?YkhKQjZ5TGFEZ0Z2djh6UXFpUWV1cnlPN0JCWExMeVRDZU1zV3FNbGhUUE1E?=
 =?utf-8?B?aHFlck9WZmFNMWUvOHVYS094RE9KZUt3d1hBM1ZYR2dzbmU4WDE0dTFiUnR2?=
 =?utf-8?B?QURmbG1UNnVPYmtLaURaTGNad01kUEdhOEJYME1ad0FzbEpKKzJtRkVidHlF?=
 =?utf-8?B?QS9RWlZ2SGNyTE9KbUdKOWRJT3lEZGw1dDM3QlFWdVhZUnlqUmtHV1M5ZUtz?=
 =?utf-8?B?RXJwK0ZNMDdMMkhxSG8vVU11RFBKb2YrMmdCRUJYaXh3dlNOc3BnVnloUXZl?=
 =?utf-8?B?dm5OZ1J4dDhEZ3RuSG9MM21EZVlBQm9WYkNaVjlqekJBeEtEQmtkUUxIMXRo?=
 =?utf-8?B?aXVRRkJTZUZrUEQrVjJnOGUvTDA3c0dhMkpnQWxPTi94VUg1UGtDV3o0VGxt?=
 =?utf-8?B?eFlBbGRRWXZFeGdwc1lEZ3JiTGorTU1MeEw0SmRRVDhCbVJqa3RBZjhJTktV?=
 =?utf-8?B?Y1puN2QzN0p2Z1RNZGpidmpIUmw5TVRoSG5rV0tkdGpmVjl6VlpoYXZSMk9R?=
 =?utf-8?B?QzNGbXBJek9RRk9QdzRCaFJwMGVzbFVYYmRHQUlmSmpma3NjQ1JnSFZRRU1F?=
 =?utf-8?B?dWw5ZzlhN1JPcUQzZldIbGJJNytZMk9UeVhuajRCYWVZby9tbjhZNWxzNjM1?=
 =?utf-8?B?a0VMT1U0SGZ1SnhBUGxqRmdjbmVybGF4dUFkMnFJd2NEblpneDBPOFhSZ2FX?=
 =?utf-8?B?bG9rN3VmL0NiNmtKSTNTOHNrcE5iVFJUaVFEdE1vS05xTmVzYzFwWDNPTVl2?=
 =?utf-8?B?eW5MNDBxb0wwY2hGN0NjMEk3QUtCeEkwcnM2OUxoOW1rd1lHZDEvRnFzY3Yx?=
 =?utf-8?B?UEFsdGlXT2oyZXgwWGJmWEJneEM0eHpBNVc1WHNIRi9iclF1WlMvNWl2VTBB?=
 =?utf-8?B?VVVlTjNlSlc0N1huYkRmNzloeTVDZWphRHRGZUZySGNqamdLd2pKOUlCV2pE?=
 =?utf-8?B?K1ZJUlRoNnVERHMyQzR0K2g5NVZRRWFybjllL3VHbHMyUk5TOGxKZUgzdEpG?=
 =?utf-8?B?eUNDRG8rdHRwUXMzdXVNV3ljZnZVeDQ1TXBLdmRXcUsrRVVLZUJUUjhMU05p?=
 =?utf-8?B?NFpNV3pyTXhsczhOWTk0M3VIVVhvZGhzVDMvTHhIcjhUMjFrMHltZWs3ekNS?=
 =?utf-8?B?c3lZTjV6dzNaZU9CVGNZT1l6Qm9KaE5mcHd5T1Z6Y3RvdXFUR3ZsZ0ppMkh5?=
 =?utf-8?B?dzZOOS9Oa0hOWlRxblM4MktmVHJWc1VudVcwTjZSQWtWQTBPNTBFOE5xc1Vr?=
 =?utf-8?B?VDFNMUFtb3ptaVlkWFJaVnB2TDZLNXlVZVhpOGk3UUtMcCthNFVESTZ5M0dC?=
 =?utf-8?B?QUdyZmt6eVdQTlRudGwwR3d1YVRNZmd0b3ppL2w5UjNDaWhsQ25VbkUvcjZJ?=
 =?utf-8?B?cWFGTmhUTjhvSlRtQm5DV25sZ3diVjdlTmNUM21yS1kzT0J4dUExU1pqOEJK?=
 =?utf-8?B?a2t3ZlBYMGwrUDNNR0hCblpkL21FRWJiaTVvcUxaSUFDM2V3cUJvYnlLc2xp?=
 =?utf-8?B?K2ZTRkhvVkhTQ0M3T2I0bnlLcnc0TlFaS24yaVNhV3NlTjUxL0ZkSCtZUWxq?=
 =?utf-8?Q?EZg+KT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:01:28.1733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe04f88-9326-49cb-135b-08dde57a999c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355

On 2025-08-08 10:55, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> To replace yajl.
> 
> Introduce YAJL_LIBS variable, to be able to remove "-lyajl" later.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Should the two configure changes be merged and placed at the end of the 
series?  That avoids a half implemented conversion in between.

I think Andrew's XEN_JSON_LIBS suggestion is a good one.

Regards,
Jason

