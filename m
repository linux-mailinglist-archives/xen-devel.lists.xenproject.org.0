Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9C8C68A4
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722435.1126431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FbB-0005zG-L6; Wed, 15 May 2024 14:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722435.1126431; Wed, 15 May 2024 14:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FbB-0005xO-I0; Wed, 15 May 2024 14:27:17 +0000
Received: by outflank-mailman (input) for mailman id 722435;
 Wed, 15 May 2024 14:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6wQf=MS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s7Fb9-0005pX-UO
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:27:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38a0a0c4-12c7-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 16:27:13 +0200 (CEST)
Received: from SA9PR13CA0139.namprd13.prod.outlook.com (2603:10b6:806:27::24)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 14:27:10 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::8e) by SA9PR13CA0139.outlook.office365.com
 (2603:10b6:806:27::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.10 via Frontend
 Transport; Wed, 15 May 2024 14:27:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 14:27:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 09:27:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 09:27:07 -0500
Received: from [172.18.62.51] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 09:27:06 -0500
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
X-Inumbo-ID: 38a0a0c4-12c7-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRN/NWowAMa0CcFnVMuLoFG15i/j0niUdCQym4mqB7EPiN1JqQWnw72b1YTB5BX6bLeXkPreJVulTtnr27Xgks/aZ8M4eOfsdzXy93C/MhhKSI4c+9kmspfmX8N4CnWT/ceKhwBQ+2DPwP+onLNzKkLLdKynzTCzpjzTmGpqx8yuU6zzUHYLEl6dFkSf/7YBAeT0V734SnWRyjhffOXelEQSP8WnyoxIw/y7mhT/OeGxuZ7JkqpoufczX1M5PhTCYWREvSHqWp82UjkOewBYwpEWAzVD2FVMKrD08RicrqdZ1J6+23PqeE5JpkLKb+kM4x/rc9z5eEiEayIZHytWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miWKji/1XntNKyYIcFoAx/UroAi6DyHJuVvRVQCCt7A=;
 b=TtMew6jD/3kCQzeEq9QQeHewSC2cgdqRLwQWizRMoDH0zwjNzHwvP3RhlqEFRkvst/nhp2Ax4uPn5S92nhz5yIqXcrHkFl2TU/IPLRts64JPlOweuiXkvFtC0iASoBJjlC1L3UDzpkp48VY1EienAaoexX/ee2uON3Zq2XUv/oJ/i4t8XHDn6zcgCZObpJMOPwe3ioYM6j6uixz1VtR6oa55Muos5Jv0KlevD+Yh0rG1tfgtzhDXxkv1lRQy/m+anlFjK80o5wYvfVZkQ2IVwMe75Jhsh4KzbGB3aNLp7QQUsS/cAJ/a3sVcSyrbTHKQC7QYjjhd5PNPU/FUFJ2UgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miWKji/1XntNKyYIcFoAx/UroAi6DyHJuVvRVQCCt7A=;
 b=2J/WU6mCSX635BmrZ2MhKf2NJuKlb7FbzPZvEzDiqbMeWQ5+nw3NBcMPorJocGEUpV4Bo/6Vu/3pgvAG8YKG4hFgVLjsKyzKuMa3a/j7OsIeyjIQrU9Q78riMlb9zKHob/I2qSV5AXY5uXwDOuakJPvTu/T+KLgQA0fe7K9h8EI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4eab3820-d357-42cb-a367-a7a0966e7e3b@amd.com>
Date: Wed, 15 May 2024 10:27:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v7 1/5] xen/vpci: Clear all vpci status of device
To: <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii K. <oleksii.kurochko@gmail.com>
CC: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George Dunlap"
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Huang Rui <Ray.Huang@amd.com>
References: <20240419035340.608833-1-Jiqian.Chen@amd.com>
 <20240419035340.608833-2-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240419035340.608833-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5006f1-ef14-4344-1490-08dc74eb1af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|7416005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TER5eHNHQ2NiUisyaGJQd0diNVJIQ3VjWlkzUlN1Y0VHUk8xbFJkOEZ5aUJC?=
 =?utf-8?B?K2x1cnVFS3BCNEVZOEFTK2xSYUhiZWhKYWdyajdXOGxxUFZTK211djJId0xG?=
 =?utf-8?B?QTV2Qis2S2lrSDNxVWljZG1iL1lBYzBQUENxTEdEZTZCeDFrSmxmVFhFaGxJ?=
 =?utf-8?B?Z2xSSjdETW1HYVRFOHpITi9sOTJvSjkwajRLOStySkN3YlFOaXczd0crenJR?=
 =?utf-8?B?c213OGNFWW0ydE5ZZjR2Z3lTYTNXYnlFVGRpMlA5blVVLzdJYk5LYTZQMFQ4?=
 =?utf-8?B?a2JoY2kxVDZNQUhGTzVieitIK2N0dm1oN2ZtT25VZDdlcysvbFVBVzkzUEcx?=
 =?utf-8?B?MDNGcUhTVGlwajg4RGdsWGJzZEJuNmVOa0NuL2NjMi9oL2hTNHp5ZnREaFVp?=
 =?utf-8?B?NHA1aHViUEZ2S0VMb1VIaFh3UGZCeWIzWktReVMrOW9DaTFYa0x3VWJQeFZs?=
 =?utf-8?B?N21SS3NNRTJiejh0ZnlBcXdEYmZickViRFZ5T0NSNG84aEROWWxWalpSUStx?=
 =?utf-8?B?a1piQUdSNmNwdW05ZzF0eG1rNHZvUkx4TGQyRUU0T1kyd3NLa09NMVNoQS84?=
 =?utf-8?B?ZlFlU2hLUDF2UlJYYW1mU3RKZ1RQeEZROTVwQUhIWE5XUHBXQWpSR2RqR21i?=
 =?utf-8?B?UDJETGJHeTlxZE8wK0dKenp6dmJtRTZYZllxNm9vQjJLSDNKM2JOeEdFSzM0?=
 =?utf-8?B?WlRvaSt3bXdXQ3ZhWW5nNERLK09VV1VRZzdvZkFSOWZUOEZyZjVMbk95OVZT?=
 =?utf-8?B?bDExYmVLS2V2TTJFM1ROc2M5ZFplS0hOYldYcmd6SG5KTE5ZWDRjQlV6djBO?=
 =?utf-8?B?NG9QMmo5YWRsL09nS2ovK1FybDdHNU9tcVFLczFWcEFCK2RLMkdpWHZaczJ1?=
 =?utf-8?B?NXJQMFhJRnVIMndjV0xlaU5xcXVMZnlwRmJhdkxzNW5wRzhadWhJMEQ4ejlC?=
 =?utf-8?B?SUlmOWxXL3E3ZlNFQ1R0dlV3TmhJRnBBOFVhZUZBdTFzc3ZvRnRVRGo4SC9z?=
 =?utf-8?B?R3VOZkY3VXA2VnpBNS8rYXJCazVOZHdYd1B3UWhCRkRzNW50a3g5S1FSVnhH?=
 =?utf-8?B?QWtvb0RMeENSK2JieHlIeldRSXpiL1hYVDdVVnZtcVhiUkhXbWgyQ3lzTXhm?=
 =?utf-8?B?OTM5T0xDbEsrYkZDOXpDWWR2eXpYeE1qM2drNkFtMERjKzQwc3p0aVFWMi9I?=
 =?utf-8?B?MUUwN3JaNzZYREdkOTVYbWJrK1lZWVIwOW42TFFFRW00M1V3QkdTNlhRamJq?=
 =?utf-8?B?aXZJakxIeVg2dzZHalZ4aklzeWpBVnRvcWVFeWdaRUw0eE1EU3lGaVlWWDhM?=
 =?utf-8?B?TDNTd0YzOUlyVGJwOXFRQXBpKzZ0emFSUVMvaHM5RTJuQm1rVHZqTitnd2hm?=
 =?utf-8?B?UzFlWHYzejNSSVpreGpBc0FDbkNBbEh5cnNubHd3MGtDQ0JmMUhzV0FaaHNw?=
 =?utf-8?B?K3Buc1pVdnVncTRXcHdRSEN0RE8ya21yWkdKZTNLNStuUTBjKzBWQjNySkxj?=
 =?utf-8?B?Y1ZSN0tMenA2cTc3VEVlTmtoRXdhbENPajUwUkZsZWxTYmw2VUUwcTMwdGhM?=
 =?utf-8?B?L2NKK25zK0wwc29VVDYxOVlMN2xSSDk0SzVhWWdaNDk3UEdDQVJvQWRhNG1z?=
 =?utf-8?B?ZVRXell1bkxpNHliMXM5Z01RZDJPZ1F6bFZXa3RnTGlUNytJcjFOcCszZ0tN?=
 =?utf-8?B?MUF0czMzSmcrYldNZlJ0dlUxdHZlN0k1Slplc0pBcERlRkRISXMvOTdVdXZS?=
 =?utf-8?Q?3tu+bvcxuxNXjbJVIZr2WOudsGrh3LOWriJJMCG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(7416005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 14:27:09.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5006f1-ef14-4344-1490-08dc74eb1af3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954

On 4/18/24 23:53, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the vpci on Xen
> side won't get notification, so the cached state in vpci is
> all out of date compare with the real device state.
> To solve that problem, add a new hypercall to clear all vpci
> device state. When the state of device is reset on dom0 side,
> dom0 can call this hypercall to notify vpci.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Could we consider this patch for 4.19? It's independent of the rest of
this series, and it fixes a real issue observed on both Arm and x86. The
Linux counterpart has already been merged in linux-next [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240515&id=b272722511d5e8ae580f01830687b8a6b2717f01

