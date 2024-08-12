Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663494E7A9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 09:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775374.1185589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPO7-0006Qf-8W; Mon, 12 Aug 2024 07:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775374.1185589; Mon, 12 Aug 2024 07:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdPO7-0006O8-5P; Mon, 12 Aug 2024 07:22:43 +0000
Received: by outflank-mailman (input) for mailman id 775374;
 Mon, 12 Aug 2024 07:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTGf=PL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sdPO5-0006O0-IL
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 07:22:41 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2407::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c94d37-587b-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 09:22:40 +0200 (CEST)
Received: from SJ0PR05CA0197.namprd05.prod.outlook.com (2603:10b6:a03:330::22)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 07:22:36 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::2c) by SJ0PR05CA0197.outlook.office365.com
 (2603:10b6:a03:330::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15 via Frontend
 Transport; Mon, 12 Aug 2024 07:22:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 07:22:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 02:22:35 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 02:22:34 -0500
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
X-Inumbo-ID: a7c94d37-587b-11ef-bc05-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIs1RFGuivszGu2TCHQZ/OmAI3GsmbUrXVrq82lOujtnuI4/hiZBdd27lHJC3VknxYFbLZ6i0aY0G5JYKxH4bVYjYqbTBt7MKcnwIt64xiiSN2VePX4drZRI3tOoKcpBEJjUHVDX2MkwTEZjJEZ0Vl/iGuxsLoWWrXMNDvWzUioDlRv/Szg0PiqeTXizIJcAU+/XHMinYI80mHCEbDOI8TCSkMw3MDvuTisU7UJgXb1QPaHOC8vkKLbxoq3ZHOBNRd8vK9ifIIsXsW0Yx4KoA83r1MIln1jbAA4SqPRSk20zZtN8vlOHi49/pRCHRskunxQyXsrbxxxXmh1UzP2msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3H6QrIuUMJs5hCoepO/7EeJIGAJswBcWDuH5TzngMOo=;
 b=o6q66MWN2rCqdc2S+7n5onAVK14qR/oGRvn8CDlo8EQ911vNoMkMzl65uJh+BvHCyjAI+nTt697oJXZP0unIAsGXYO6F0Zau8HdRnfv5umdTlu2JfIF4OZnS0I6qTnfjbftq2euXuONyTtwwk1+mA2ThbevGChehLU+Croz7NAadnzcS/Q3QI/kkOY+Y0/yldGlbSjCwOOK026nOgVhgQh4dfCqkKCuk66A8tsamPP33Hz9t/HABlaNfZ9WqSN6Mm0uKbpbpIAwTcSShEAJN3xUOyLYJ1pES0mo+3+wKgS/xfKPt0qJ/RFhlnclmYtemMn5sVxJ/8AlGxq0HVwIILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H6QrIuUMJs5hCoepO/7EeJIGAJswBcWDuH5TzngMOo=;
 b=GHF2dhZ3GS+diufpzS7pcLt3FjsxRi/1edG5Sj7rZdUkt0atwQhD8nnsZl1QcQ3AfjLlfzoMAvQl6MxZNmFo8XX/kS1M/GpUfgue5pnwMUGpoLX4xEXJudwh6KuYQKlCjaBH01NjWQm1IZuZXkDBnzEbD02s5OBydJSCEkKTY3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <063fe8ba-3566-4377-af92-94d53549da4a@amd.com>
Date: Mon, 12 Aug 2024 09:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] automation: add "expect" to containers used to run
 QEMU tests
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
 <20240810065920.415345-2-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240810065920.415345-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 700beb9b-d32c-47dd-d0b4-08dcba9f8a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEtzVnc0dHNVNU5DRW1Oc1hVazhYNVRMWThzL1p1REdpZHJ5UVJIaHJaTlcw?=
 =?utf-8?B?dXZxYW9ZSW1NUEpXb3ErY2pZc25DY01IeFlSaVN0bGUvT0dpQzA4K3pqT3Vr?=
 =?utf-8?B?TjYzUkFWSFZBQkYzamlHSUxNMU5VM1ViWHh5UXo2TjJyVUEvSlllcWJlSjJp?=
 =?utf-8?B?VGNrY0JWcndoQ25oK0FVaWRqeXNuTnhFaXhXbWhrTGNsMmt4WE5rczgyTGpv?=
 =?utf-8?B?OU9yWHlxKzZYVXZ5YW9lZDE5Qk9oNW5vaVpzWXZ6NXBYRFQzU1R3cFpqbkVM?=
 =?utf-8?B?dldPY25Cdm96OU81N1hHL2lvQUVmUmFVcmhNOW85emNQMitCNW1VTW9oUzVK?=
 =?utf-8?B?bzBLQ3lTbWJDMGEzMVJHSHZ3RndOM2VJanRqMjNPMFhTdG9rbXJYU29naFFH?=
 =?utf-8?B?NUV2eGZwWS9BRkpjbXh0dkJvbmJnUEtGMHRPSzBnUUFhc1lHVkE0c25ncXBs?=
 =?utf-8?B?M0xOTHlyblJuc2xvMFFUYS9saUZZZXRYR1RsS3poaWZtZGppSXNsVFhQamRD?=
 =?utf-8?B?K1U5OWljQWZ6UXNsSUFVZ0NVanZYUGkxWElsNnl5MDRDbEs3aVlwS3dUSDlw?=
 =?utf-8?B?NHBscVRTZ0JSV3dOTXcvVU1ha1l2Y2twYk5sZ1JMVkhvSnhFdktWWnMwT0gv?=
 =?utf-8?B?Mm1BczJTbDYrQmdpeFludDZXdzBocnJkOG80VHNkaXY3UXFlZVZLMXFRc1ZJ?=
 =?utf-8?B?aEZRaUF5VlRhck5TUjhFVng4YVhrVnNjTG1pbEI1MUlwQVhwd1BjWlI3VlZZ?=
 =?utf-8?B?Sm1BQ3QwT0s0SzlWaGN1R2tac0svbFp2TVVUU09NV0VsLzUzMnE1VGdJQWdK?=
 =?utf-8?B?L3JvaFVpaDdmNkN5NU1uT2Fva25wdGd0am9hbFNZei9Lb1Jxb3I4WXVQWFhM?=
 =?utf-8?B?clc0dGd5alFOVWNsWjRoaVZCUjkxVDVGdlFBTm93U0NuMitvTEo1M1JrWVZ6?=
 =?utf-8?B?TWdPcG1TSGxkMjJMU2NKbVNkNXRmNHRTVnJPb3NLcHM4cHNHd082RlV5QVV2?=
 =?utf-8?B?YnBENGxYK0gzalRLZS9TQTc1ZHg0TlZDMngyQlpvd3pZb3R4ckFNV2NOeHF0?=
 =?utf-8?B?cjc0TXo1UGtDV1VkdGhuTXNzcnpQaXdFL2JLQUFjN3p5K3FmRVRrOVdINHZo?=
 =?utf-8?B?dkgxN2xxMGFnNGlHdEk3SU9PRWo3Z213Vy9GNXY3bisrTkxhenFVSTBIU01Y?=
 =?utf-8?B?RUN4ZEFaVzE5d2JCWTREVDhZRzNxNDNFYlBDdzNhc0JFWUIxaWVKVUNCYkdw?=
 =?utf-8?B?Q3k3NUNXeEtydFpUcTBXUnRBQW9DODRwUnFNYlpTNi9ndWtJa1pVQ1ltTFRv?=
 =?utf-8?B?MjFSRDFNWlhEdlJDOEFXMUxhMlN5SXk0Q2dpVmV5bzNnUHFxY2FDNi9qOWZE?=
 =?utf-8?B?eTY2aXY4OGdmM1BTZHNIVVVyNUFSS2QxSEc5MnpFTnNqbjgxRkQwdEQ2UEsy?=
 =?utf-8?B?Z1VkVU1PWGpwQzNXd040MzliNmhvd0NFbjIzOExiZXhOc3VXVVluTFFPTHZw?=
 =?utf-8?B?VDZhVXR1SHJ2S2pzdnVuNWVHVHZBOTgvZ2V4OVlOSmJkSjU4S1NzTXhpVWxt?=
 =?utf-8?B?Z0hkZjdPdGloK3RsVkkrOWk4QllPT3ZCRWkvY2duaVFXakw2NnJUcnNtK01G?=
 =?utf-8?B?OEh4R3JxTlFhUEo0QS9GNlZCVDcybmVFdlZFTnk1K21JZWRqd2NET3BHaWgw?=
 =?utf-8?B?OVhNNWVWTFVaYnUrZHAvcnBUMUVOeGZGYjBOWWhGMXFwUFFKcE95MThyRUNK?=
 =?utf-8?B?SWVvcmQwcDdSSWtqSGxoZHpmR1JvY1lodmtwRGJiVmF4L04wNnZxRnIxeDF1?=
 =?utf-8?B?bnloYUhEUjY3NlZjT2VZMWtaTXc5UDMydlNkRDNKc1dZbkZVRS9rZjhoWFk4?=
 =?utf-8?B?TXNScFd6S2ZmV2p5SC9XV0xrcXlkM1UreU9icUhGL0Jkdjh3N1djQWxlTzVH?=
 =?utf-8?Q?bf0O8OXuGN0YwQ1g1TESBFIP32XT4qER?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:22:36.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 700beb9b-d32c-47dd-d0b4-08dcba9f8a4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909

Hi Stefano,

On 10/08/2024 08:59, Stefano Stabellini wrote:
> It will be used for QEMU tests.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

