Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B843DC0821B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 22:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150897.1481848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCOlt-0002u2-Gp; Fri, 24 Oct 2025 20:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150897.1481848; Fri, 24 Oct 2025 20:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCOlt-0002rW-EE; Fri, 24 Oct 2025 20:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1150897;
 Fri, 24 Oct 2025 20:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOOD=5B=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vCOlr-0002rP-57
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 20:52:23 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a31734-b11b-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 22:52:21 +0200 (CEST)
Received: from MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 20:52:18 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::a6) by MN2PR03CA0013.outlook.office365.com
 (2603:10b6:208:23a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:52:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 20:52:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 13:52:16 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 13:52:16 -0700
Received: from [172.21.152.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 13:52:15 -0700
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
X-Inumbo-ID: 55a31734-b11b-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHWtAaiQgV1awx8gTZhhAZcCKAEvVWMLHkUCCREK5yGcX3HtllUPSQ6smTN7iW1dLI1/S7WwOl/yN44yEuBc/5Nsj/ib4R2vj8zRZXWbGZRhCzYmAwDEBOs+QNU56u1PhCTr1zab68ewxtVYuz9JAfTMl8RxGKsHXbaHYarSW5Y7v0XbIuvRwvBQtkADt5rPnpiSnf/Ckzoh0x+1T/N75cOFf6B+sLesX5egBB/ep7zuvm5K0tJ9SnXWQXRHXlQmtY9jO6yqk1AhiO6pjhjAEI+vtRe6UCTSx4y90iNHKUDr5J6XijLJE6t2TcoJkPyJjvKs9ssgX/1S5RX8Loaz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLUAowvK4OzKsAR4PaJV61wrPmQ1FXnvFjtbDbBn8JU=;
 b=uV6VHcjx2jbjugF+AaDS8WTtTry/y1jrbzDW2JGHACDkdt5pfECWKJzCMu83HhcaX586TPoEjDGPccaRIqNht4WUf8WKgmSpqbQeIks9CPiqSwLQqlJVdkSalATKKllCxtkeIwhvBq4dX33Rz5I61BEAVnRQH7ZMcxJ/GrnXEIOVtTGHUiaAgWDj2OGn89J0EYLNz/GVnBK6Z1GVzcsJ+nkfOodB+i+llneq4mIB4jFGmORa7pIX2OEvtgAgvnPQ1Zuc3GTS9TERPrSs5FtMmjb8t4ZYBKV0YNL7fCjVP3nR+HxbYygYhwyEKjJ8Ri/752YejiLTTOG0fe+suVOKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.dev smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLUAowvK4OzKsAR4PaJV61wrPmQ1FXnvFjtbDbBn8JU=;
 b=gR8gz8Q0D1aI7yNlkERa0YIcGwnws4aUdFXRjSXWlRRx23ymGi2YePhLJrl9e18/5hxK/UiuU0zlNTmcxyhoKyHlXPfy3ZSfKGWVAplSlKHVRL/uKQYfsyLy8Txdu5LaFacCaaZxY1DE34xb1FdClesgLG73kivSb00At4wrKOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <fe02ec8c-a765-483d-8ad2-c3ee713001ef@amd.com>
Date: Fri, 24 Oct 2025 16:52:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen/xenbus: Simplify return statement in join()
To: Thorsten Blum <thorsten.blum@linux.dev>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Dr. David Alan Gilbert" <linux@treblig.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20251021135002.1228-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251021135002.1228-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|PH7PR12MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dde6dbd-591e-4e20-b6a3-08de133f37d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXYxVnNXVU5FRGJGV2dYTllmcnJPMFNGR2lJV3lXMU5Eejl1Um82SUkybG8x?=
 =?utf-8?B?a25Gb1ZYTy9IVVVYRnVWQjNoYllqUVZrSS94WkhuNFVQMHd1Q1BqS0djOUZs?=
 =?utf-8?B?Q1ROVnVadTFFNzVweWpOeU1sK1YzdUtqMVV6REFhOXhqdTFaMW1TOVVmdEhO?=
 =?utf-8?B?Z0lEZkdWZnNYR3lTUk0vWmlPOUFYcFA4bjcyMUZtdHRIMmZJMjNkWHkvM0VU?=
 =?utf-8?B?K3BVcDA0QzZQM3l4N3JsMDc3WDZHcE5qZGlTMUswMGh0eFM3bHFTWkIzcmVI?=
 =?utf-8?B?MlV6TS9UME1XSjg0R0N1c2FNR214emNNazYyVFREdDJlMGdob3lsZlUzSDJ3?=
 =?utf-8?B?ZDRUZzJsM1RlY2o2eUJxTDZhMzFXNmhEQ09ka2U1emNQOFRHWUlMZWZycHBE?=
 =?utf-8?B?RWJ4cE14MkwrbXVUY2dKNzh1dnRydjg4UGlaMmJPRE1nTXNZNE03REFkN2lq?=
 =?utf-8?B?L0hoTjIzNGlranFERFVid3hGZXk0TXFDS3c2ZG9NdTZkRnNnOXcyZmNNNHM5?=
 =?utf-8?B?VmtUOXpXQlZVV21nOGh4SkV6VlJUUGVtUVA3ekZwMzlIMTdYcWxmUHVIalUx?=
 =?utf-8?B?RzNoTXJkSGZ3em5tOU1OUytKNWMzWDVibE96ZG83TWNRS0RnVFBhRGRBOFJu?=
 =?utf-8?B?V29YcEtWMkhiQncyUEttakxmWWh2MjVZMmVxcFVDM2NYS2xsR1FoblVjRE9H?=
 =?utf-8?B?Qll6V3dxTVZRbDZwdWRFNzdsTUV1Qi9aek9GMGlNMEovQzMwVXV0R1ppT3Fq?=
 =?utf-8?B?L0NibDU3QkN5KzdHNFd4TkRoalRlNmhEV3UwUHE1UlFBTlFVd05UYW9tU3Zi?=
 =?utf-8?B?cWlxcmFuMkZCcmtQUkNXRkdGRWk5YStxc20rQ3lPbXVYNnQ0TTZyT01TNTF6?=
 =?utf-8?B?SWxkOWZzaXREa01CSXVWVHh6N2lxd0l4c2ZCTmtlaVJCRUFFNVphMkxnY0V3?=
 =?utf-8?B?STQ1bEx6UmRydVVIZmE5TlVhcXpQY3ZwWXR0aWtvdDN1ZlA1S1hiUFQyQ2Z3?=
 =?utf-8?B?ZlpkN0tkdGtMRFA1RjBHNWJCdjFoN1MvWWU4dG1nZG8wM1ppOFFRRXhIeDE4?=
 =?utf-8?B?VVBJZ3B5czR2YXJUaGNaMzFMYVZsSUw2L3Z5RzNHOUxqa1UrN3NaME5XT3Yw?=
 =?utf-8?B?RFByOTE4QWZnLzJKTTBSN1hNWUE3SU10dlBsZXU2ODlNUXpJdERiem1HSDlv?=
 =?utf-8?B?M3g4d3k1MXJZZDgvS2YyZlV5czl0dnF2N1JhS1k3cW1QbXNTNTRWY3U4OXoz?=
 =?utf-8?B?TDZSSDQxVkJZd3pBNzl6cVBRWnRCeHRCMzNvRHN6Z2hKRkZJQUJzSmJhNVl3?=
 =?utf-8?B?YlorY1YxZTBtRXMyaEdPMlUyam13ZlJVR1FubzFmUlhtcmdyV2RLb2J5eGZp?=
 =?utf-8?B?MjZjcjJubmJ6bmpXMHRkejA0ZEJXbElHaXBWYlJGcUxXc2RlUkViTmlSREo3?=
 =?utf-8?B?YkFJTmppNk5XaytNb3cvand3c2U0R3NaRFdwbXhJQlQwRDJUWjd2S05oN1lT?=
 =?utf-8?B?dDZ5THljRVNOemJiRjNCNmNyUCtvdFRwVCtMQXNOb3dVbVQ3Mmh2VjQ5QnRt?=
 =?utf-8?B?Y0dXK2tjRnptUWxkSzc0ekhWRXZvTDh1NkFVdWdTSUxGaWxZQUZlREp6bnNk?=
 =?utf-8?B?eU9pZ2RmeW1GWm84S2o5RW5raUtSRnpzclUrWGxQME50NWZCTlFNOHVHQzNa?=
 =?utf-8?B?TExEeW1vYXZUaFBwaHQwQ05mTUZrZ0orcmlVTWhYOUhGT2Y3cEJpZWRva2Rq?=
 =?utf-8?B?NFE5cEJPZ2QvbXpqdXRKZzI0ZWNyeXpzTWhqSkhiVDgydkM1cUIrdG03ck9S?=
 =?utf-8?B?TlNpZUdjQy9PdkkvZzF2bnM4bGNQNGk0aEkxbEhSYWNCTUJwMWNTVmVyeWhr?=
 =?utf-8?B?bzVvZkRCRzBpU0JHOTRramg3SWFkaDdHSmJ3RFpNeVYrZGxsM0RVLzcwRm1O?=
 =?utf-8?B?NStsQnoxUWo4MmU5ZS9LQmZqLzY3blNNQWYvRnByVEltUzNiQWZCSndLOVZp?=
 =?utf-8?B?SHRIbmNXQ0RqM2p1MmxPVmpJVmpGVnFGMEJ5UysxOFBKM25YeTFjem1BV1RN?=
 =?utf-8?B?YnhIWkJydklqcktaU0pnM0JKTWZhdHZuOHZVMzNPQjYxd1J0UGF3WFEyTTM4?=
 =?utf-8?Q?/G28=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:52:17.3107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dde6dbd-591e-4e20-b6a3-08de133f37d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977

On 2025-10-21 09:49, Thorsten Blum wrote:
> Don't unnecessarily negate 'buffer' and simplify the return statement.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

