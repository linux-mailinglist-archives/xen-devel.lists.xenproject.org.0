Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA8CB3E09C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 12:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104405.1455461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut28L-0007zk-HY; Mon, 01 Sep 2025 10:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104405.1455461; Mon, 01 Sep 2025 10:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut28L-0007xU-En; Mon, 01 Sep 2025 10:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1104405;
 Mon, 01 Sep 2025 10:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RBY=3M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ut28J-0007MC-Fm
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 10:51:31 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2409::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ceb9303-8721-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 12:51:29 +0200 (CEST)
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Mon, 1 Sep
 2025 10:51:24 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e3) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14 via Frontend Transport; Mon,
 1 Sep 2025 10:51:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 10:51:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 05:51:20 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 05:51:19 -0500
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
X-Inumbo-ID: 9ceb9303-8721-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2+qwlO2ejaTL5JkaafZkvPpwpzIKc8Rw/Kk5iWMt6aDhGoRX++HoLXFHn0ps366onzcxixKlwQrdn1h1DoFAYURnAdavHwpbjmgZxRMTC7aIoql/lx/O+YYaHW2ivHMjlH4m66Zk46YgAlEDl73XMsGjq0ag712Edoa33oWIETwKzEdLIiKuhguybFns9G54xfHWevyariQNUqpwKL6sWDm9bvYMlWis2YCK57EfMpFuvWuo/mB2ERk9QyNEi008SSPx6MC7ugmjgt2YtEskATnAyEsxMRoKic2VNsIUbTiNrparKNEoZcH6lX4MPP5WU9XplA15HtLBw9858yHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Yxk7jc3b5WPUKFLYqIYBiG+mHtJeAvRcajD3ti/Xo=;
 b=em6tY4iTJxpft5lO5Jx1FyNGWgSJxrb0PNzEZEXG36f9MVT1Sx4n3CaKlosCLwEm7ih6+dTk20KcwjlyGVNbgwElwGMwFQQUeDC6bLsgf0Ax4np++POqagRLww1NYnaSZjN1BwnA+r0gbGdNYuR9XsRWtIXCTHJmEVTE00vKo8OEP2y8Ov5rS/MqIeGrHfWu10l0uqj9N086VdsdLZr+st/3ssXCbof715yAtlx78HBqKpDmn6I8pR1GQDh8IrinfX3uMhi5IqIxgRfASTVUL8CbWDL3G0DnsFLuaniTdVGcdx3L7ZVcK2vNT+2pzGxnyHga3/NICJlGQDNPTuNR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+Yxk7jc3b5WPUKFLYqIYBiG+mHtJeAvRcajD3ti/Xo=;
 b=s0c18v/j/RwKztZxjR4MyaB62aGsnv9HJcIqdBeHOzQggM5Ik41K45D4tw24xA1GGleuRHsC+JJvPJPTAdbvP+SeTHXqOsyL/2bUvk+i1lNLrZULwtU2O4ihxeT3RhJkoPILvzrXOGjfmxpH6HYl6PIIJPSaLCxEylYBuVeAwy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <de880f1c-7874-43e6-b229-7630113f273d@amd.com>
Date: Mon, 1 Sep 2025 12:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <41cbf42c319a95c92517b6042414de6d13dda077.1756718656.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <41cbf42c319a95c92517b6042414de6d13dda077.1756718656.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f4bd05-8330-4864-e191-08dde9457e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ei9Gd3lOSXJNSFBMeUZKZUZBcGdKMEViaVVoWmY5Sm5mMlVkcUs4N1czaVNh?=
 =?utf-8?B?VktWMGNOZ29PdmJ6bitZdjZqWk5uTlR3b2dQNWlka3lJS0l1Y0J1eVBXbHNj?=
 =?utf-8?B?K05hMXpOL3RyYk51aEk3WDFxdGU4cmc5N3VZbTBidlVNMmJLTFIxZDlxMm0v?=
 =?utf-8?B?Szl4aVI1V3JEYzZPUVJ3ZWJHOTZIZ2U2ekxXOGtWbnpHNUFGd3MwTlh0dEV5?=
 =?utf-8?B?WTFnQ0ZmaEVPMElyVWpGQVhLUk0yZjFVY3VlWWE0czZFNy92ZThDYkRxVXZm?=
 =?utf-8?B?OWFuTXFkZml6c2J2TFAyLzZ4cUVVTVVjTWQreGtrOGhxdkplWXVtZ2N0UFV2?=
 =?utf-8?B?cjFuaWkxcGtNZVFUNGpZTUFkVGlTWkpLS1RIa0ViRnV6OW41QmtJUjJQNEky?=
 =?utf-8?B?WTFnV200N2NvMm9ueVFHVXBTNmpqOUxuSXUvWVdIUU1PVk5OUzkybXJPSW5t?=
 =?utf-8?B?aDNJeXpvVUZnUmdCNEJFZjVjWDBhYkNZSHJLOFJKMzFpOUJ6STRNVDgrTjhJ?=
 =?utf-8?B?cUZLMmFpQmdTcXVNdnliMk93TXZWaStpOGpVd1dQaHg3V2tSSCtrdUFRQ0k0?=
 =?utf-8?B?U00yd0hldll5TVNCSkVUMGMrMHdwbHEyU0E1SGticmJhR1dUL3lLaCt4K1Fx?=
 =?utf-8?B?YXNaQUtLMUtYaUZyc25oMVJOejdsaEpsa3ByRUNaSElxUGZEV2ZhR1lLNmJC?=
 =?utf-8?B?SjdtVTdhTVZTbXRMeTlHcmhjVVMzeVgwWUJlSUVYeEROTloyMzJTTHZhZEpJ?=
 =?utf-8?B?SUhSR0NyU0RmSXZZa3VLMGFSU0lNSTU3eDhtRFo5RWllL0hrVGp6VW43cWFQ?=
 =?utf-8?B?MklrYk9OdFRIcjFVUDJ3K1BFVjA0b21Pc1N5RHRnVkxUZzlDVWpCQlNaT3JU?=
 =?utf-8?B?aWMvbDcwQU9pMXNWazM1aXpOajg2Y0VxbUtTeVc4Y2xuNC9lT3dZa3VyT1l2?=
 =?utf-8?B?djBvNnAxVHE5SmpNT3d1UkpyckJ5UHhxYnNycmFhVExJUjNMNktjbFFROUNz?=
 =?utf-8?B?dDRnVVBnOStIUGJSZVFrTmdSSHNwYjR2eE9SZStFUCs2NjViRjhEbHFNb1BT?=
 =?utf-8?B?eGtrYTQ3MVVZRXVId1R1ZmpjeFo3OW9iRUtraFE0VDF1NUVMZXhMYzlkVXFs?=
 =?utf-8?B?S3BmVkgzR1pzNUVsWjl4ajNYV2xoMTZwc0lhUGwvaUpUb2JXeXJoK1lnaTBM?=
 =?utf-8?B?d1pMTWdLajR1YUtqeEwxbmhIVHdISTF0NzFKeC9wSExNQ1EyMm15bWxxQkVM?=
 =?utf-8?B?SE9HdCtCSGZTYWordUpEbnQyejB1YWx5WmdqZ3QyQ3RpSE9BZDRQbTRjNjVE?=
 =?utf-8?B?MGx0aG5xRllncVMxa2ozN0wzTHVRNXBIZnhCTG44cjFWSGFTT1FsODF5cmVk?=
 =?utf-8?B?RGZTTVl4elRrYk56ZnY4a3BCWGpHeW0xZGdhem5CVmcwS0NSSU5UT3hxNENH?=
 =?utf-8?B?WHJJdXBaTnF1WnB6Qm5yTzluVWlNaEtGTy9iU01wQzRxRml5NUFmM3NVelNv?=
 =?utf-8?B?TnIxYTZLeGtyM0xiRmRHeHVic3I4bEJFYkNubXhMZzNQdHJMZTRNaFVUYk1k?=
 =?utf-8?B?ZHRqcUFueC96aitSVGRLZzJZWE8wbGxDMXJFSzA1WThRSVN2QnU5TTN2YjlR?=
 =?utf-8?B?SmRGNXlTczIxbGxVYUJwR3VqWTMzU2JjNk82eStYUUF4SmRxSEIxMUVwZFRw?=
 =?utf-8?B?ajZIYm05WnJaZ0w3dWlmRVRBZ2JWUlFVNlBoQWRvNW9tOTdFQ2V3YVNoa1JF?=
 =?utf-8?B?aWQyR1pYT0tHUnRFMytrdTBreWtsa2wra1I0WERjUWdMZityUUpYa050eFFa?=
 =?utf-8?B?MFlTTGdsZ0EwWnVFVDRRY3cwTGZ3NGxvSXpBSkdTYWF1S0RHNW94WE5ETXBT?=
 =?utf-8?B?U3FOY1NYcTc2ekpKUi8weWxPY3d6bVdVUWJFZ2lBMlgwWHlkN1UxZmlOUEtU?=
 =?utf-8?B?T1RwWHRzQzVaOFZyTHJ5eUo3RHN1R3VJeDByaUxmMmNLQm02ZkJJSzFqMUxD?=
 =?utf-8?B?NHNHRE5uWXF4dFUzVUFvSFRxaWJvSWhwSUlwazlwTVRZV2c1T2xqanlhUFdI?=
 =?utf-8?Q?l6mpgL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:51:23.9321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f4bd05-8330-4864-e191-08dde9457e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111



On 01/09/2025 11:26, Dmytro Prokopchuk1 wrote:
> Fix an issue in the 'fail:' cleanup path of the 'assign_shared_memory()'
> function where the use of an unsigned long 'i' with the condition
> '--i >= 0' caused an infinite loop. Update the loop to use 'i--',
> ensuring correct loop termination.
> 
> This change adheres to MISRA C Rule 14.3: "Controlling expressions shall
> not be invariant."
> 
> Fixes: 041957bad382 ("xen/arm: Add additional reference to owner domain when the owner is allocated")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


