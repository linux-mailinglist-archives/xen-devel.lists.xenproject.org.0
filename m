Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45B8AC5D6B
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 00:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998803.1379504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK3CA-0007G9-LI; Tue, 27 May 2025 22:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998803.1379504; Tue, 27 May 2025 22:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK3CA-0007Du-If; Tue, 27 May 2025 22:54:54 +0000
Received: by outflank-mailman (input) for mailman id 998803;
 Tue, 27 May 2025 22:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfAC=YL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uK3C9-0007Dm-4K
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 22:54:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 984baed0-3b4d-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 00:54:51 +0200 (CEST)
Received: from MW4PR04CA0209.namprd04.prod.outlook.com (2603:10b6:303:86::34)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 22:54:47 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::f6) by MW4PR04CA0209.outlook.office365.com
 (2603:10b6:303:86::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 27 May 2025 22:54:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 22:54:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:54:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:54:45 -0500
Received: from [172.31.32.79] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 May 2025 17:54:45 -0500
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
X-Inumbo-ID: 984baed0-3b4d-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d60D5/QZRAEgRXphK4Rdq6ous9PPg+SJczJghFfA9yxymF3lauObIATyUsTLsAnqKiigYUlvKbOW4BCAqMZvKTWTun+PZGcu+rntIK0MEuY4OConIkVYaKXDTbBdZjlA/93KjL2wcTXN9ZLQKjKOupotu2McS58e8tKjhAWyvg27UxLwa+GuddnrWcLaIWYZL8A9ITZZBn6XcFPToSEkj5TlVIMkRfTk6fQOQbY2OKPAeAre82fnziDJWOH0oTsAEOddktx5wr3pVTB1NODH9QhJzfW585zl2FFCALwIvJBOr+8lfj3BLuCAfy0p1kJzhv9Hf4WIkeG+IpDzzk7pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAm369P1Yl+9qv/sZTUPGuqQePdOUbvJfCryarsCOE4=;
 b=aRFn+446NHSyDZfqsUpECa577AjvPXH67Mwr/uA/v3T4o5QFHoSvvO8oo9DEqPuUP8ObtJ2WRIr5ZVpwwrK+yM0uTVSpjwIZibMjDnkPFyaLcpmcTEsSHb12nG2kVmVbOHYGNwe+OntcnrF0cjtkCXOnMvmQSpLrMi7C43RvmURCgFH4h1vFYWt9kaUKWwaRZ7b4fNvkSktE9Cl2zARMoK/MyHh0MaSmDAAA9nayvEMyB8h0d+Eaji4T3MIEqespy3cpR5wRNSAEnNrLpz5+dFSS6xJv/wO0zf2a6zUos0028RLbZ8fwMcMtQG9BfPNj4DxwCIi4/veDoQLExGPl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAm369P1Yl+9qv/sZTUPGuqQePdOUbvJfCryarsCOE4=;
 b=N7F153fPPFElps0Wo5qjfCPIQMUiFV6vQzRagcz31S7TFH4AlpIfYe63OoRL0DEjUPuWvOt0sibsebjLSI9e9LfCOOa2piHcRWL+1KT5QZsaW6REhsroi4gUU9oLD3yTfUZsdK8YPMLTi55YlVHRh+XQrRmjo2r090yTC5IslZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <50b2500d-f732-471c-ab0d-cd2e4d0136e5@amd.com>
Date: Tue, 27 May 2025 18:54:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove is_periodic_irq() prototype
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250527223753.47055-1-jason.andryuk@amd.com>
 <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e27c94d-4259-4653-7bf9-08dd9d717a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJXcXlnRzBaR1BUV0F0WVZacm9pbnFSTzFQS0pmUDRTeFdYdWR2Y2xBb3J0?=
 =?utf-8?B?aC96U2RlQnRpSmExY3BVN0YrWFJ5TXRZcVptRFhIa0xIdHNTSGx3RC91RXlH?=
 =?utf-8?B?cXN6Y2xwdmJFUTdVdi94bEhvWTdJRng5NTVEbEQyb1pzSGFldWFEUFlyZVZF?=
 =?utf-8?B?bE1kYXIrbzNHREwyMzNMQ2VqM20xZ3dpbzZ5L1hROWVrY0hyMUpvN1ZoUnJZ?=
 =?utf-8?B?bEl1L2JIb0RPd3U4ZXQ2bEp2bjJDSlNOTGRScGhuSU9EVk1yMjd6WEJ5eTZN?=
 =?utf-8?B?RkNmTk1ld3RHekZJZzFlelJUa0FmZTkzSzYwWmhpTXBjSDA1RVJISDdOY1Nk?=
 =?utf-8?B?VXlQTXhBVUJESDUvZFNxOTBCY0tVbTNDTzVRcFpOcEF0Nm9NMVppWnlTSVlO?=
 =?utf-8?B?K1lIRXpHZVUrZ21lUDdKTVhtaThNb3RveXV5eFBOYVg1QytWRUFFeU9oTjYx?=
 =?utf-8?B?RWZFU1VpaDJ3L1dzeTNDQmY4TjdKUzBiS0tNOEU0REkvM2htZFZjalN6ZVJK?=
 =?utf-8?B?RnRpVVp0Vm5NZytzUHRqaE5odFB3ZlJaM1VLRDNNRnFBc2hkTWl2T2ZrWTlD?=
 =?utf-8?B?dktrSjY5VEJ4MExnTU9yZEZudERJSWdFKzRaQXg5Sk9jQWJPbERnaENhRXZC?=
 =?utf-8?B?UW5CZmpUQzUvT3krZmNjcVBJK2tleUgrZlprb1BuMkdDa2FaUkM3Y2tOYmNu?=
 =?utf-8?B?b081S25ydXJRWWtkd1RTSXdtTmpRQUJwREE1Z1E5WHlDelFUSzdkbzBZRll2?=
 =?utf-8?B?R0RmNkZKZ0VHZFdOazlXWmRUREdRWnJEcU1zWS84MmdVemJOczZPdGpvUyty?=
 =?utf-8?B?R2lTUXUwZVVhZFpTSm1GWjM4azMzL0t0YVpDd21uUStFSEFWQitqTExobFdp?=
 =?utf-8?B?M3lPdkk0NEdOT0wvaXQyZ2ViMHFmWDd0NzBBRnNTdFJZUGg0R2FLRU0zZEtZ?=
 =?utf-8?B?WkJtWkd5UzNGVEhFelBONW5VOWxTT09XOW8yWGFLdVhuZytCZ0wwM1g0N3hx?=
 =?utf-8?B?NUw0VUVaNVlFcHVkMUxBTHRxVThNNGtVUnFmaWxkVHdNNEVlaHNra1hLVnJh?=
 =?utf-8?B?SjdobklGWHc3N1VRK1FLU203UUxDbU9lMWZIbHgzWnhBaHVzVVpJS3FEeDYz?=
 =?utf-8?B?UlFpL1I1OUxGVC83T0lpeHdkNW02d0pwTkRwd0tCa0M4T043Lzl0TEhLL2Jx?=
 =?utf-8?B?U1VnTUxyc0Y0bFd2WkxJcEw5eUVhR1Y5bGEyMFRYNm9IdjBUMkJkNGFvUDF5?=
 =?utf-8?B?WnIyWlZ2YXRRbSt1bDdxZTUybHdHeElVSWZPcDJwNjNKTmFXSUxRYkREdzF3?=
 =?utf-8?B?OEQ0WVRodXVOV3VxQzJ6WDRPZEVmWThvL01XRmcxOCtidHRJSmlSaVlvdjhj?=
 =?utf-8?B?L1FMeWVaYjZZWUtmTEtiaEtJeDRiTE9BTU9jb0JPUi9QcW15VWJ0dnJoRVgr?=
 =?utf-8?B?aDR4OHQ5ZXNaWCtwOTV6ZUtEY3dlMWpsZHNJRXRZSEsrUHoxL25xR2h3d0Ny?=
 =?utf-8?B?ZlFBa0VpTGozT2RuUkkwR1dxZGVmOU1yRThmVUdOeXkzOXk4eFN6czlXTlpG?=
 =?utf-8?B?SUQzUE9SMnZZRU4rSSthMFlFRHJ4WjRqcWx5MGVqK3d4T0RLRnJmOHFSNnVW?=
 =?utf-8?B?ZUVLY1R2azR6ZjFQZ0tLTWVFeVkwN0pOVmlGdHdabFA2VXJXRzhTQlpyc1NJ?=
 =?utf-8?B?NEp4dVhiRmVKOEpOM0tMMUIza0d6TElYaFZlQWtSMDc1R1NUeVNrZ0V5Y2Nj?=
 =?utf-8?B?eVNNMDhLVDcrYm1RSGIxa241VUJscVRPUVFoWGZDSjF3ck9qNzhXNk4zOHBm?=
 =?utf-8?B?SGREMWNlSVBpeWFOeE9pcFdqa2tPQm16QjR3QnRqT08yb1lqZ1VQN0d2N24x?=
 =?utf-8?B?ZlVVNXhhWlB2bEhnN2IvN1o1LzJGYy83L1ltaWNUQ2dNRGhMeGlkS1pJRVp3?=
 =?utf-8?B?VU0yV0JsdytJOFNiWVQ5QjhUelFhZDFsOEZnVkd3UXd1TVR1Z1NabHh2cEtr?=
 =?utf-8?B?MUxjL0I4VGZmbmg4TVFzcjZNWFU3SGZGYUZEdHdGTmwxZXpVYkd1WUFtTDRp?=
 =?utf-8?Q?9mKFCu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 22:54:46.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e27c94d-4259-4653-7bf9-08dd9d717a69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007

On 2025-05-27 18:39, Andrew Cooper wrote:
> On 27/05/2025 11:37 pm, Jason Andryuk wrote:
>> is_periodic_irq() was removed in the Fixes commit, but the prototype
>> remained.  Drop it now.
>>
>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks!

>> ---
>> The full Fixes line is:
>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer (PIT/RTC/HPET) programmed as periodic timer and adds them to abstract layer, which keeps track of pending_intr_nr to avoid time interrupt lost and sync'ed timer with TSC.")
> 
> Yeah, the older commit messages weren't as well structured as we insist
> on them being these days.
> 
> How did you find this?  inspection, or a tool?

grep after looking at your vpic.h patch :)

Regards,
Jason

