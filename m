Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AECB1702D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065451.1430817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRB3-0003MS-4Z; Thu, 31 Jul 2025 11:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065451.1430817; Thu, 31 Jul 2025 11:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRB3-0003KF-1E; Thu, 31 Jul 2025 11:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1065451;
 Thu, 31 Jul 2025 11:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAjF=2M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uhRB1-0003K5-4n
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:10:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2544a4b-6dfe-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:10:21 +0200 (CEST)
Received: from CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::16)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 11:10:18 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::2d) by CH0P221CA0033.outlook.office365.com
 (2603:10b6:610:11d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 11:10:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 11:10:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 06:10:17 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 31 Jul 2025 06:10:16 -0500
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
X-Inumbo-ID: f2544a4b-6dfe-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv3zyK08+Z48ht6/0+D1ZyGr5eU+dLBgY2auaQr7YWRe1zjJtLlUTQbYXR8y22B3pmLJcIgESq0Qtnd+gSNKLeisDmoVjS53bEVqwrH6fMR6gLSZdZK02eXKBmNALCIEiDoPg7GcTpGTAVmGHuS0bsCtHz1vXte8CDHystHtuerhz8INIVtplJp1ymO9CUg/01FC2YW/P8Zx0r5FV0k1W3ABQpqrBEG8ICC22KsTJOHSwEAisLQycBT6dEVWN0FS1wy1dbfKRlBkHavrhdPWcDN1t9i+jqUIGwTLuzrc3qpGeVWI4Aem4sufeqDKtm03aiehwZMrjhY74G/jx7JwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hmgFzGO3KbkpyX2B+JSHlG9hduinIG9/F3ESOLZJcE=;
 b=PO/+F60nqBtUMcM6kIDdXu/BW+wqJa8oUCzvY4Y+44t9JDxWc8vpD8wybXuV2PIfktbi81ZCWZ/1ksvvqky7NF3f5DBbuHyiPCqhT31khlG9SHqhkaecaEvXcbvvjFnVgSKWfx3lDfFe7L3pV5CvFxfiduH/DaXvTeFw5fO2UMYrzqyt487c75Q0Jv1il7KW4yVpF0QS1r5o2AJjY+2XK7ONytHvnl/Ld3/jqLk3ZaWl3EoWi/bEtJqmRPENbjFCEDUlQrtaIo/vz5p23/PbzWpaAe41/l9wyPl6BpT5/6un9bgdbEUkbUtRr/4Z7tu0RUFyc1XxbXcSw2TIsHEDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hmgFzGO3KbkpyX2B+JSHlG9hduinIG9/F3ESOLZJcE=;
 b=J9TuZ2FnxyM+uD8nUWHUoivfCZyzdKHiLQOhe+UTHGiviDi6g7+g4zYSRHtf0dhzRfO18C9nPMZ3ZLXmJ1nUri4tdMrYTB3SlkzmzUCE80R//Y5YwiRurfRLd46XiMRuo2Yz3uh6Ku6VvTnnmukbzq3zMhTKx3aawEaW3DhKqiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b5801413-f077-445f-a665-e9e8e4858dd1@amd.com>
Date: Thu, 31 Jul 2025 13:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] common: Make livepatch dependent on HAS_VMAP
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20250731080522.810468-1-michal.orzel@amd.com>
 <20250731080522.810468-3-michal.orzel@amd.com>
 <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: dc42b575-c89b-4246-f8d4-08ddd022d51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NituSmx5SUZPbTJMWDRQSzhGV0VwdlNCV1IzN3FCYVBrVUJQeDU0MGI5bkhx?=
 =?utf-8?B?bU9nb0ZvVlVEZ1VjNlJFd3V0aE1wcFZyaXlselkvMW13UUJiYWViSDFjMXVx?=
 =?utf-8?B?SU1RN21ZVEJoTkVJM3VmSmRiVFBXZFJjUnBpVlRLZ1NqWWZJbG0xZHlSZ3dj?=
 =?utf-8?B?NUxONWtJTG85UWxEL2lnOU5oVEZMR1NFamFNWTlXVHV2enROUW9lc1RhTjFq?=
 =?utf-8?B?TDhoQiswSHNkYmFYWXNvNGJZTndybW1rVGMxekRJaGRwc3c2c3pXS2N2WC8v?=
 =?utf-8?B?UFBKWDRMVHdHZ25SVzA4NjdlWEY4L1lIdjl6UnNDS0FTb0lXZVBYcStheW5S?=
 =?utf-8?B?b1lEVVY1Q1JPeHJ4cTA4ZnRFTUlqNlN3MjhTTFlzcndEa25lbXM0VzE4WGFt?=
 =?utf-8?B?M2liaHdQNFpGc2JoaC9wNFF1SW1WYzJkUmFaWmxrbklmaUxqUzcyQXdxQ21T?=
 =?utf-8?B?dW5FTXVHb1RvOHpYSUhpRHUzUWdzL2JlTkNRbkNrdUh4N3FrMndvTHpuRW15?=
 =?utf-8?B?UGhKdVZEWjJVQWtXcEE1aDFjNTd4bkJucVE1d0M2d1gzQ1BMSFZWT085VDhx?=
 =?utf-8?B?Yy9zbUN2K2UvUjdmZzNBSEpTNDQvc1kxWlVtcUNBQURrRGFyT3UvajAxREgw?=
 =?utf-8?B?ZVlBdkdoa0NLWWVRRG5LUlE0eWpVaTBnRXEwUmVQUDNIUE84OWtqWG5UTkpC?=
 =?utf-8?B?WmJpcktvTjFOeldFYXZaaXlvUkM5Z3hGanZpN3pLZ2hwdEY4dm01QVpiMEwv?=
 =?utf-8?B?YmF6bnhJL3dvdDR4S1hmVXVyc0JORzRaWUI3UlVCY2FqWXVQYUZNWXZ4WkhW?=
 =?utf-8?B?V0xGenhEWE5sQ053UjdSMysxSU1ENjloWXlUZHpPb2E5MEhWblJaNm1USFNE?=
 =?utf-8?B?NDJIRWxhYzQrbG0ycDZSK2MxS2dqZms3ejVTTHYrclVOdkYwTTdzUDEwR1I0?=
 =?utf-8?B?SDhjQTVyR3BqWWQ2V3dKRWV2amRyZFdhZk1nbi9lYzF6R212MGQ5ZElmaXli?=
 =?utf-8?B?Q2dndnZpM1d4cWROMEpEZXJXazFCQXhqSHZlQUdoZHhzdUpTcFphSU1jcDV5?=
 =?utf-8?B?dXcxcVl4bmUrVDVNWk1YNHVtR0V5NEkxbzNvNk54TklyQU54RGdXRVY5dHhN?=
 =?utf-8?B?emw2S09EY1cxbjFvNm13S2JIeTlkTUJ1WEJEaDhjZEF0d3E2TTQ4c0ZLK05u?=
 =?utf-8?B?Z1JEZUE5TUVEVmRMQ1N0aGRlYi85NThxOWhaV3dSQW1jQlpZbVpKcDF6aUls?=
 =?utf-8?B?TlZEWUVrSGxORnVKS1d6b1g1cDk0M2VyY2xhMlhWc3pDeTVGbUl0UGhEcUlr?=
 =?utf-8?B?NXIvVjJUWDJtZlNGRXBobC9RZyt5alV6SC9CajBCRjE3ZDJhL3NOdEdlc2ZB?=
 =?utf-8?B?RkpacnptcW1uNlptTkhSeG45YkFzdzZydTRud0k2bWZ3S3dJelBnZ1JISUpJ?=
 =?utf-8?B?L1AxTjhOVXlPMndrTFAwNzcyL2NqcW82dHFhMkxCejJWUHlkRTljbE9nOGNl?=
 =?utf-8?B?cWhadDZJSHZ6blI5M3Q2Vml2VXJ6VHJUNng5VklYRVlLa0Y5emJjd2NiMWpV?=
 =?utf-8?B?U0RqYldhcjVqUlhTUmpwSkYwbkUwMlVVdXpQaFpDYnhQM1VyWk9yY1V1YTVK?=
 =?utf-8?B?WVZSeFhwc3JjK0RHTjY3bDZYS0xOMXdlbXc4YU0yYzVGV2o4aERMR0xrbnRE?=
 =?utf-8?B?amV3TVZzenZ5R0VWVWdIaTJKZ2c0TTFxZlVjZXhKR0ZJWjJSeHhzNVlTbDZJ?=
 =?utf-8?B?TlBabjRuT1B4bCtZakYvT3o5NkhVdGdFMFcrSFFpNmtSdmV6TkhadEZrK0xu?=
 =?utf-8?B?eDBnUkNIdCtqYWdvSlh0UmxENHBobzdKUnAwSU9WbjZHU2RTNW1IaG0xZ3Ju?=
 =?utf-8?B?T29NSzl5UXlWYTNQMU1ZM1J3SjZmeDVwKzIvL1FicnJDblhzdjk4Z2xHUVRO?=
 =?utf-8?B?OTdoV3lrMzJLUU40RExxV3hQUGJOSDdpVWpsZTROZFArVkwyWUxwVExZdU9t?=
 =?utf-8?B?Mmx2enJrdHdEY1JjSUFZKysvUnBtbXN4MXd5L2hZVlNORUJRcjhSYmRUTUNk?=
 =?utf-8?Q?fPFiZr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 11:10:17.8779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc42b575-c89b-4246-f8d4-08ddd022d51b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415



On 31/07/2025 10:22, Jan Beulich wrote:
> On 31.07.2025 10:05, Michal Orzel wrote:
>> It should not be possible to select and build livepatch if HAS_VMAP is
>> not selected. This is the case on MPU systems.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> I agree this is necessary for now, so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> But in principle live-patching ought to be possible without MMU as well,
> just that the code will need suitably enabling? If so, it would be nice
> if the description could somehow express this.
Yes, I agree that it can be enabled in the future with some additional changes.
I can tweak commit msg when committing:
"While technically possible to support live-patching on MPU systems, today the
code depends on vmap. However, this relationship is not reflected in Kconfig
and allows to enable live-patching on MPU, where HAS_VMAP is not selected."

~Michal


