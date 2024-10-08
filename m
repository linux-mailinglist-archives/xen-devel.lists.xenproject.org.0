Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A74995842
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813502.1226473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGdy-0000YO-VS; Tue, 08 Oct 2024 20:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813502.1226473; Tue, 08 Oct 2024 20:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGdy-0000VY-Ry; Tue, 08 Oct 2024 20:17:18 +0000
Received: by outflank-mailman (input) for mailman id 813502;
 Tue, 08 Oct 2024 20:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGdw-0000RL-Qd
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:17:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2417::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4edda0e1-85b2-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:17:15 +0200 (CEST)
Received: from BL0PR0102CA0066.prod.exchangelabs.com (2603:10b6:208:25::43) by
 IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Tue, 8 Oct 2024 20:17:07 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::5a) by BL0PR0102CA0066.outlook.office365.com
 (2603:10b6:208:25::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 8 Oct 2024 20:17:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:17:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:17:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:17:06 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:17:05 -0500
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
X-Inumbo-ID: 4edda0e1-85b2-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULoDJb4fRxIMoTTzDU8Dtb2Nu3pCjvodbMQ6gN2R2sRRVzwHPfPUv09AdUnCAMRTboYK7SQL2Fbw8wJ2DaBYAqUkI7rkGoQAQaSZS9sSOxTOft9DaIdKETWj5ochhkkR9WczwtRtgS1WMBzyuRc10tD+1+s1oflUsMe2PCSenLbp9CgrIVMlcVX7Nkh172SgZZ/rjsKIap03FOYk/q7Ed/aP0xmDljTP6OhiT3E1q2L5gc9OPlvl5MPuEwsW+IWhVbR3uQ+gkAHhW6XdOAdvrxjDZc1h5H6TGL3zKdo3gL+Weg53kaBxJrrrSLA5NBIfKzVrggqsnfKRq3XDilgq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eijqgetKrjeM4UAEX+oVveTnAJq9eRG7Hna6I5oxDiU=;
 b=xYBat1MrgByc6KmWdkeyp9yu1T+GDiVQp//9RgH2TLJC95lBTcE7k+M6xNolE9SicELzmfHW1gcXp0Zeogwvb+CrL7wnQKxR9cxO+w8WhcPLrCbgs3Ci7zKsUguwwjh+Fov3AetvPBV13Kvh0gXvUamR7MqcjqGqga+u/KO7+E+DpSHrlKt6g9tYW6OOAhO1FKh8gx6wXD/+vTjSYg0Ptd5weXwiHD9X8d8K8HCD6/zCtJ2hHNw4Jhan9wgdfw17bsuOzg5ERp2VeMOmQ3YsyQ+mfT5lbrt9ZoX0BacMCYZ1tnE38Hs5p9ZEIIvcHGrNnd/UiCe47IigcLLVPWnymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eijqgetKrjeM4UAEX+oVveTnAJq9eRG7Hna6I5oxDiU=;
 b=VkH5iMU0VwBIfFafjUTeiLqfvBjh0gVC6cccaY9XgUSzqyii9PoBZdx9VJYVq1sMSRk/eWpFmNIlcGO5UVFKKd5IOSYsFGSIW7C++4jbZndmE6M+XcSEmU/OM8JVn2cmf2EahhLkZZUn3ZXxTY/IYngeNzT/WPY5S7CnIitntqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <be523c17-6641-4c86-af29-37f9cb0ee716@amd.com>
Date: Tue, 8 Oct 2024 15:16:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 37/44] x86/boot: remove mod from struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-38-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-38-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: c46261a1-5e6b-40bc-0733-08dce7d62ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDhPcnJXc3RLTU9CZm56bHVYVnJXUVc0amNwVDl4bmZjUlkxQXN6cndFWnJ1?=
 =?utf-8?B?V1c3bEtzY1N1c0x1Zk5TaVo5eFpxZ01mYWlxZHNuVkt0ekhUZEF5TGlZb2Nk?=
 =?utf-8?B?c1YwK2NyVloraldRR3hKSVhuOWFWM215aWx6LzlVSG9CaDdERDBDVHZqNWxr?=
 =?utf-8?B?NTdET0F1NG1tR1MvbFh0QWpQb0lJNmlUUWptY1pMQ09vOC9leTM5c1ZFV1Yx?=
 =?utf-8?B?ZlhvMS8rNXljMEowSXQyL08vM3pMZDZKY0psSmNYa0JPeElJc1hmYmUweWZB?=
 =?utf-8?B?NzJGbHB6TVBlRlZFUi9XVHRtUzl2Y2VER0RWVVZ3NFRodndScnM5RDlNL0JX?=
 =?utf-8?B?amJPYXp4ZXpaRmJrMk0ydzhFNTN3UHpZWmJpemptY1huQ1JjVjFnb2hDdHNS?=
 =?utf-8?B?S0ZIa01uanlUaHpzWS9VVzlWS1hJSXBHMVdmL1J0RkpvQjJYNWF6UGhPdGFt?=
 =?utf-8?B?ZHJIUW0vTEdxZkpXS3VRMWgrQXo0WlZYOVFSL05aYyt1VWRaaTA3NTF0UDV4?=
 =?utf-8?B?bHVSeEJBcXdVUzFkWll5eE5KMEgxZnFCS3dOOU9ienB0R3IzUTdQSGZpb1dG?=
 =?utf-8?B?WHJyS3RrdmRrMzZyZ3RrWmxnRFNTR2poMEgxKzVPOUR5WWxqQWNJVHh6bXNt?=
 =?utf-8?B?OHlTbXBVZUJ0MUdQbnVzT0szRk80MFJoZEVQUzJwcXdiZzZwazV5QkVTbzZz?=
 =?utf-8?B?akhRdy9XL1NyNU9kelFnVVZWMWpiUUxOVDgyUzIyeVVCWG5UbVFmYjlRZU84?=
 =?utf-8?B?Z2hUMkd5Z2tTaUUyRFl6YkNOT3hHWkhqMnMrOTBuSEthM2M5dTJDYWE3NEFh?=
 =?utf-8?B?Ynh3WW11ZWlRdFNWR0toSzZDN3RHbzZBeWxybEYzdVRqcHk5ZjBYR3dsNXZs?=
 =?utf-8?B?cWpWWmhzeUxEbjBzbDNMd2p1NjM5ZlBUQm9SZ2VUOG5GQTdWcEo0b1BvUmc0?=
 =?utf-8?B?MnNFMnRJRmlxY0p5cTN1VFI4WnB0aytlU1BNSXdIdUFoSGdmV1RFRUVheDlP?=
 =?utf-8?B?L0NYWjFrNlpiWG81QjFaTXVtcG5ReHVvZ09qUThhZjhDSjc5NDFkMS8vRFp0?=
 =?utf-8?B?bENOZ0RBYm96dHZ1OW1WZFQwYmFJUXRzaWFMM1FRTHNMNUd6M2pkdUZqbGla?=
 =?utf-8?B?MFZRNWg5NmZGVXNsZEwzNGJjUjFNa29NRHZRZ1A3V2JYSGsyakVLb1BVdDRC?=
 =?utf-8?B?ekZGcmVUVEpFcXpZVHhOQ2xrV3ZNM0lQeE5xZDZlWWdVTGQ3b2lWZTBqTXNS?=
 =?utf-8?B?b2RlYmRCdDVLMWduUUlkVmJiK0dEcjA4UHRZTzd5T2FURzZiU3ZxbExBVnUr?=
 =?utf-8?B?bFIvSlpVdGZMQ3BLRndZVmpaRlg1UUlQSkJLNElRTnRIdlBiV05rK29vcVBh?=
 =?utf-8?B?bEVuTkNOM0VoZlJVUlJoeUZTMG5kS0txVjZ2eURIUmxBbjlIMlgwNG1tRVVY?=
 =?utf-8?B?TURvT0JhUEkzd1VjWEJCZ21JUzZabDF2OTFLWHF3bXNMUkpmbllLMGUwYm5B?=
 =?utf-8?B?MUJTcjF2NjFhTGVEUTVPUlF3akI5WjNnelFGaDM0WnBwTHptaWNvUG5Vc21a?=
 =?utf-8?B?Q0lTTmUyejY5VnVwZkY2ZjBTaEZlOTFVelFPYjBNWS84WExnTUxCd2JVOUd5?=
 =?utf-8?B?eWNJMTRJZXZMWkxmNDNSaEh6V0p5SzZUVStuZnZjOXkwVjlkcUtRK0pkWDJo?=
 =?utf-8?B?bkpNOUNBNHlyTzJQNlpuWHdHN29WRHpUN3hPbjk5L1poZys1WTAvcXBKeWYz?=
 =?utf-8?B?S2l2NVk4TElYSUpabkY4MHREbE93alF1bjNONUViblNiUXNrYVNCZE1Dd2ps?=
 =?utf-8?Q?AnZ5MRCHCR8WpDWyZY7NJTeD/AjU/4f0P50yM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:17:07.2471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46261a1-5e6b-40bc-0733-08dce7d62ec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517

On 2024-10-06 17:49, Daniel P. Smith wrote:
> With all references to mod field removed, remove the mod field from struct
> boot_module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

