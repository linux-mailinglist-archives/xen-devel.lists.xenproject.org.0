Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE041A6DCAD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925659.1328532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiaE-0000fG-Oi; Mon, 24 Mar 2025 14:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925659.1328532; Mon, 24 Mar 2025 14:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiaE-0000dF-LZ; Mon, 24 Mar 2025 14:15:18 +0000
Received: by outflank-mailman (input) for mailman id 925659;
 Mon, 24 Mar 2025 14:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AQO9=WL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1twiaC-0000d9-Kh
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:15:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2417::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 672e64d1-08ba-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 15:15:14 +0100 (CET)
Received: from SA0PR11CA0203.namprd11.prod.outlook.com (2603:10b6:806:1bc::28)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:15:11 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:1bc:cafe::f8) by SA0PR11CA0203.outlook.office365.com
 (2603:10b6:806:1bc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 14:15:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 14:15:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 09:15:11 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Mar 2025 09:15:10 -0500
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
X-Inumbo-ID: 672e64d1-08ba-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Esng83yaWLo6uJZFQqoTG6vd6f5b8wrG7/6H5JsLxivxczgSSyoKJYnfMj3gP8ng771KafBqaSYmFZQE6uw+bTTKxHzbDbfqV2CJ960JbifY2SWVz0gP6vx6y0B2Mdy4jAKDEdgBEsNc63MWTDrDSpBO6MB1AXEIGdcQf40EbuWVx26TqjYkkXE+IagpjcZzsbpLKfEIjjfULuJocE12iQnSwmA9rkNQUeZSUSAMJkdfy/dxAQgAh95NbgXWPEMSheH/Xj9lhmmbFCKuiIdz+ht6rUIrRl/QoJVhPoEvNHmLLNzviseFkFgcVq+aG68cKD96Ni1xLbN6f8mVDJhkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5z2Jk8pS0sdY+XAJoGCiLloKydFAn1jSHUoLCMMg0E=;
 b=Pls3hPK1ZMb4fsOHxl+mgxEXfYQCAnsU1/YZYEEeOLlA4Cm733OlAiLU82T/uZh6Y6Un/jhJOEBfjdB8BT9rvr4vVC1mGot9zdrCLsw268OAMcxrIwwrEsNztU9FNBq9v+O15acRX8dB+J++6HSDFUf1CKObugSxlVk3zeBw+mjvPACCSj5ZPuyQWTZYltSwJLCfMqA1QqJ0Ll2bI1DU6OK1jZ8Ta6owkaRTduUaS/XWXdPUuMss1U0PKUasDbWGV6aw9EmXa9cfPidE+WnGkoH14Sowk4KacCwOuka96Re10xzvz8SGf5y0Qst9mJvvKaP9bGsaaB9cKpV6FugJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5z2Jk8pS0sdY+XAJoGCiLloKydFAn1jSHUoLCMMg0E=;
 b=5bPGpWXdk7MdomlRwEx6XRVBPHGnFzQcLfMg+CG29TDmHpH8YzulAUzIO+ZDo2cNQyKJxvckoi0HW9WFBxnJS0ODWqm06bxr6rQ/tEreQEWf95R+KkaRJGE+qeJ1OwIT6Cgeksd7XU+uk3E8xkbg46P5i//3YR2m3RRw2j7Issg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1cc07b74-6222-4c1c-8e57-e710fedf7ff7@amd.com>
Date: Mon, 24 Mar 2025 10:15:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>
References: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|LV8PR12MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 5548b8dd-a9ef-4f87-2fbd-08dd6ade4a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGlyalhWVTlKQ09VbWdZWHZwWURHUmZhUVdjdkFwUndUSW83dzZyRUZqckQ3?=
 =?utf-8?B?WWYyS09JZVNKNVloUGoyOHpjdWtxQlh3VzJtNkRIQzVCZlc0TTBNVno0WUZx?=
 =?utf-8?B?N0UvbHJIMFZyY29iSWI4MkNSVmpXazZVQm04TXF0d3BnRVN1R0hBNVhnL0Ev?=
 =?utf-8?B?N0RPZ28yUXdTWG54WGlRZG9UazJWcC9UVkdlbHk3N2tONHc4R2xTYzVEM0RM?=
 =?utf-8?B?RzAxakdFUm5pbXpSM2JzM2lQQ0xPM0p4TCtxQ1FncVZZVUFTQ0dVaWtBNGgr?=
 =?utf-8?B?YVBwNVl6MkRKRS94bU9NajdsYjRyQnhHKzB0NmRRa0tXUUt3L0IzNDVlZElZ?=
 =?utf-8?B?bmlHZWs2ZHlmVU9GSGRONWVYR2RsWWNpK05wMis2VU5NSmFJRlBiUGwvSWpI?=
 =?utf-8?B?MXNTM29WV2gwNjRDNEpVQWFncnhlNUNIQkRzQXE1VFNEL09UQXk3NFVJdnh4?=
 =?utf-8?B?dHhlT2oyYW5aNloyaGdaN2NQMnhQNUExS1BqSGdlK0N1S21yOWtaN1JyN2d1?=
 =?utf-8?B?SnlvZE9SbUxodEljUmJ4YXRKUkUzMlNWNjgwQVVibHlNSjBadXhSQWlUQ1Iy?=
 =?utf-8?B?VUg2L2g4bmdMZGN0dGtYUTZRazBZSzdLYlViZmhmdjJTMjV0aHpLS0RaOGhG?=
 =?utf-8?B?d3NCclhSTFNnUk9XcmhWNEJKL0RqNXZ3Z3JjaHJMVFdycjNMSGJrQ3BtQUhl?=
 =?utf-8?B?bm5KSHNCNTJscWU3UEp1a0ZjUlJMV085ejJGZHlLL0RSeUF0N09oYWZzQXl0?=
 =?utf-8?B?K3FsbmF2dnk4U2VNc2t3a0hONFo4QXhBQStXM3luWFFRaFJ6cVpBT21Jelpw?=
 =?utf-8?B?UnYxZm8wSkozZUVBN3FqY3RHREhxQXFnbUNuSEYzWWdSQ1dUM3FZU1AwbllT?=
 =?utf-8?B?UnVGYXJ5TEtjcGkrVklxQTMwaVB1UDFweE9XS1RQY2pHSTNaT0p1NUNsNlJl?=
 =?utf-8?B?aW00K1FXZERqUGs2c21rdWZIa3ZISVVLTWxIRmtnMVNrcDVRTDJoejBoYzgx?=
 =?utf-8?B?WXM1Q3BiVThKbjJ0SytNM1FZUERpVGI5aWNLZU5GbnVrWHlUL21iUVhKc2Ni?=
 =?utf-8?B?OVF1dmFmK2NPQVlYejRmNmE5NGpoWXVQMXJjR3J2ZW9SdmFXb3hsWld4ZjFP?=
 =?utf-8?B?TWtWa3FkQmExRm80WjQ0Ly9XOEVaVmgvdkpwZ0JWalY0NnhrYTBnd2Y4bGt6?=
 =?utf-8?B?TmJ3ako3RmthQWswZWRMVzNhamNESE13Q2YvUlkzck1TWCt4dGdHTUhtNUND?=
 =?utf-8?B?OXVhdzdWaXlmREduTVplTDRmWXA5aUU0dnkvbGgraFlwTkR5c2lQdlF4amJl?=
 =?utf-8?B?SkxYWmlYdHVtU3lwSUtqTWNXdUFYTytEOHpXeTZUaTZ3L3NGR1BwSW5VeW5G?=
 =?utf-8?B?a2JtWXFsY0E4dXlJK1lxM014L1A1VFN5cktpQURjMjZQb1B4S3NFcWNXRUJl?=
 =?utf-8?B?QWxjZnlXMDZvdUdtRmZxaHY1Y0xwYXJRMkJJa2pPamRDSnUzeGhyT1FidzlE?=
 =?utf-8?B?cnY3K3VoSThmdVMyUUh1SnllcmlOeTVDamVCeWhjek40c3k0WGlBbnBydXhJ?=
 =?utf-8?B?QXRvSHpwdmxOSmhRalpvRHNTMTlpRnJoK2FQRGxnU0NQaVNqNzMvckg1MUNo?=
 =?utf-8?B?SS9Iemh0VHVLRW40WTljWmNueUZiS2xidFZBSnNObzRkR2pndDJWcDZURFFY?=
 =?utf-8?B?T0tyRlEwYnNndzBFeGZMWTAwZzZqdlZjVGJqdVVHQk5wWG43eUtrbTUxci90?=
 =?utf-8?B?aW81WlQ5N2hvZkU5RFFST0s2eTlRYTlRdEtkWjFFSXJlNEZZNXJpUzAvbHpI?=
 =?utf-8?B?OEFyOTVTalpkSkNBSWJSSmFIcVJSSDZpWDVYZEhNcUlLRVZsZTRJM2o1RTJl?=
 =?utf-8?B?bWJDMVJrZXd3L2JsSnBiOGxMYU0zMmxqM2pNUE9sQzF3M3ZtaTlMeDhDYTlU?=
 =?utf-8?B?cmVsKy95eWdmVng5SWN0S0VVY2wyUnd0MmFlRHNlZE5FT3dreDJXNXFoRWE2?=
 =?utf-8?Q?gD13+2A/Jm9tpNl1rphsN50ltCps80=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:15:11.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5548b8dd-a9ef-4f87-2fbd-08dd6ade4a3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689

On 2025-03-24 08:03, Jan Beulich wrote:
> As per observation in practice, initrd->cmdline_pa is not normally zero.
> Hence so far we always appended at least one byte. That alone may
> already render insufficient the "allocation" made by find_memory().
> Things would be worse when there's actually a (perhaps long) command
> line.
> 
> Skip setup when the command line is empty. Amend the "allocation" size
> by padding and actual size of module command line. Along these lines
> also skip initrd setup when the initrd is zero size.
> 
> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

