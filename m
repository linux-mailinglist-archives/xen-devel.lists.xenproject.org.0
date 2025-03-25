Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E84A707CC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926776.1329608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7pM-0002TK-KE; Tue, 25 Mar 2025 17:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926776.1329608; Tue, 25 Mar 2025 17:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7pM-0002Qg-HU; Tue, 25 Mar 2025 17:12:36 +0000
Received: by outflank-mailman (input) for mailman id 926776;
 Tue, 25 Mar 2025 17:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gb8l=WM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tx7pK-0002Qa-Hq
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:12:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2409::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56efe125-099c-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:12:32 +0100 (CET)
Received: from SA1PR04CA0016.namprd04.prod.outlook.com (2603:10b6:806:2ce::21)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:12:27 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::58) by SA1PR04CA0016.outlook.office365.com
 (2603:10b6:806:2ce::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 17:12:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 17:12:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:12:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:12:26 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 12:12:25 -0500
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
X-Inumbo-ID: 56efe125-099c-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+3dPd6Yshdorx7EThQlEBsFJwDZHsL047NzrUuZF8QBu7fDmQ1qAd1N6M4jrkCA6Xbz8Y6heedzXEu8DjPQ+/H+kyz7WQS+SSTCmIGswLW0gl4qQcmrza/tMU2NlUsaHVGRbWPswvEcyLWIwRAe/V93/fCwCc5l5em0XSBBk621D3XBbPcUAW1TjIUyj08nM7hgroWhmRehpfv2e1If1CoNennXqCbC67oxYtWKVQ3A+jWLsbTMPGk63w+odAlJYiMD6TOhgSxdFdtoWEwb9dKeMCVC8C7uHHWHIyfEi2/rFG3FHbWT8KByd0elCGIxZsnfRIJkCGYhaj0cptFLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvPC5b/ZXX5yhI5ir4m1yjdZju8YX9AEOvQGPoXNHeo=;
 b=juHl/0jfiv8f7Umz1eFL7EUAGnQLkiMUftNm9GOVuentkU/mA3WC5BggmDaQ/khM4rvFhktCLi2NSfSNK7ZbE9W+vHzjeWi03eBhg7BFs8elU8tskgaEP6eUB52Cmm/ptyrTkB2XDw03egCszaKap+Gj2b0gvMvQLpB/jbNCc0SD43Uh+njEveo//vow3n6+PlxTuYvykgsWve+3zGQFesKJNmvsHkmncbwv7IXB2RMzdJXtrmtgjGvStYqvg5hk3ntcTGjN1mhOHF5kBuXBsCvWqeY0deIQh+2rC8OajMoJ5Wz2s3zhLeQn168Kv90bVxijDW8JNh/07LEXhYbfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvPC5b/ZXX5yhI5ir4m1yjdZju8YX9AEOvQGPoXNHeo=;
 b=v56WMgB3sqviK2ZEOk7XMSeDrd/I5b95YsZJ+aGIKe3fD4w4MUotaGdqpNIiELCWdjMR3xrMq9W1moYBmA0kF8uUCDJl7Jg9cKiQXGZjNmU9+p5rg8hSsCr2lNOLF1CKIyqhA6Oy+RRJReuULNWuvZXJ/INmH67MW1WClwzZE8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <690ec4aa-626d-4418-befe-863642c51b1f@amd.com>
Date: Tue, 25 Mar 2025 13:12:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenpm: sanitize allocations in
 show_cpufreq_para_by_cpuid()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jason Andryuk <jandryuk@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
 <fdab048e-3738-4e3a-8865-41af3180bf3c@citrix.com>
 <a2cbbd03-b91c-4d64-9392-7db46dc582be@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a2cbbd03-b91c-4d64-9392-7db46dc582be@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d16ce82-4c16-4fec-a010-08dd6bc037ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWdyd3Z4MVM1UWZxRGNpOTJ0RHFYN2VDNkdXalc1L1hHMWJSWERSeFFHaXRn?=
 =?utf-8?B?OEpaTWt3OWpmcngrQWxZMGtzMzZNNjNFb3Qrak5tNHU0K0IxdzdSaXg2a1dI?=
 =?utf-8?B?TzgzemhPR01TQytBNHp0OTF4alZjelBRaXJTeDBtenpaVUNPaHE5ZUplWjZK?=
 =?utf-8?B?ZjZsK0JJam9XMjUwTlpmT3ptUUFZaVVFUEF0VHB3R092UEJOUUJUV09XbUoy?=
 =?utf-8?B?dVhYMUJiTS9pU2ZPdm45cUZWU3dwN3U3Tm9PQzlObjhrK1poUkdBSndIWnhu?=
 =?utf-8?B?VzJVYUxOeE1BNnBVRU9McEFjVDZ4Q3JLUUxHeitEYUsvcTB5d2RZc2tocWhw?=
 =?utf-8?B?anNTWUphSGlHbnRvZSttQVpML1krbzZXUTZ3OFRGS1JqMXpyNncvOXpvQTBN?=
 =?utf-8?B?Y2dHT1BtdFdQd3lTSDY0RHFiN25VcTZsQTdWT2J3UjliYTZ5YnRiMEEvenRT?=
 =?utf-8?B?MUVUSUk2clZwM2pKaXZid3hIaWN5RS9WNERLR0VnelJzVGZmTGptVXovbEt6?=
 =?utf-8?B?dkl4ZHpQSC9jOU1VLy9DQmZqbWtNei9PZUZyTnFyNE1VNXBXQlhqV3FWZEVB?=
 =?utf-8?B?S3lmNDZjOCtFZnY4UDFhWUNzMVBPdklwT01qenpJRGR5VzZZV00xbkVZTmZ3?=
 =?utf-8?B?NEJ0L1dIejdaSE1qbFFZdmx5djlkUjREVUlQMU9YT01MTURONFV1NFlXNWhM?=
 =?utf-8?B?NVFBMDdTeGZMMFBZVGQzRnJOVHN1RjVpYkh3VnF3eEZ3blBodFAvZ1RrV29C?=
 =?utf-8?B?eUFpWVROZGcwdGpOVzcvUjBITmFPS2NjaVdLVHZKdTJCVlRCemNsK05KbGtq?=
 =?utf-8?B?K1NZMC9OWTZnS0hMc2Z6U2xycmk3eTRGQ08rMCtjcFBxUUM0TExRWVZSeXVq?=
 =?utf-8?B?SzZYOEpVUHoyeXloWWF3amZ3WmNnUTd2dnExSzA3T3B6WW9nUjBTYmV2c2Rt?=
 =?utf-8?B?KzlkVDRaWFJnb0FUeTg5a2RieFFZWGcrNXFBY0R1a2cwdkhVS1M0M3ZOY2Rs?=
 =?utf-8?B?anI1Mk45cVBteDM1RDJsOEFkY2UvaVFoaW5Lem9pUmxiR29wdldJWFpVTldY?=
 =?utf-8?B?eE1rQkR0aTZKZmN0N1V6c1RGK1g2QXJZOUJ0SEV3ZGJDNHVmT0NxdWhOWS9s?=
 =?utf-8?B?TXA2VWdURTRPL1ZMaE1uc2hqMDZ5TmJHRGVXWUgrSUtkUTcvUXRMTmc0aU1o?=
 =?utf-8?B?ZFMyaWVPQXlKVE5rNDBTUkxrL001QnlnU0ltUTBXUFNGOVY1OG1qUjlHTUJY?=
 =?utf-8?B?S0tXS0dadTdONS9jNHpiS1dGYUtJM0FiMTcrK3pUdWsranJ6VmhmL2dCbFdr?=
 =?utf-8?B?SFNOZnF0RkxZR1BIdGMwenk3UlExajQxaWJNUnZuSEN2WnMzYlJkT2RZUnQy?=
 =?utf-8?B?aTlSUEZ3VVhwRUNiQ3hiTkNTVmVySXo4MnI2NGMyMjVSU3d6TnZGL1AyRm92?=
 =?utf-8?B?Kzd0NHQ1THRtMnJ2M0pyWXk0Y1RQTUZsQjJCSzdWeTdDQ01pTE56ZlJiWlUy?=
 =?utf-8?B?WkFabVNwK25kNFcwcEJLYkhBWWpkMjJjeFBOZkg0OGlWcnFDK0oyTVY0NGtZ?=
 =?utf-8?B?RzdVZUdWZ0pDVzNxUVRRZ0NzaXU1ODlFWFFtbHU5aWtlU001NndoTWh0a1BJ?=
 =?utf-8?B?a2Y0N1ExU0EzOWlwWnVER3hMWmcwUGk0UGlnN3NPTmVRREE2Y3hCRmphUlNk?=
 =?utf-8?B?T1hDMTd1R0tyVFNqSm9SeGZUdUJGWWs3T1UyUDM2M3ZXazA0aDdjME5ZUHdo?=
 =?utf-8?B?cXRTVUhQa3JkSTAwMm9tMExPdTFwUUwvSTBYTXdwOUg3WisvVkhLb2hnMzZv?=
 =?utf-8?B?aFdqbCsyUjZVVU92L2QxZ1hmd01RNHdiTmo3M2NmcXowYXJFalo4ZC9PN0Zs?=
 =?utf-8?B?TXNrVVUwMXRtV2gycHRseFQxU3JhdW9DdHA5WVFZbWx3WDMwcTQ1dlJ6YlFN?=
 =?utf-8?B?ZWZzRjhqUzNLVWx3UFFhNjB5QmJFeGI0eUVLNXZXdUJxZ01aZCtKUHdVR3ZV?=
 =?utf-8?B?dGpJdDRwOFl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:12:27.1713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d16ce82-4c16-4fec-a010-08dd6bc037ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190

On 2025-03-25 10:30, Jan Beulich wrote:
> On 25.03.2025 15:20, Andrew Cooper wrote:
>> On 25/03/2025 12:51 pm, Jan Beulich wrote:
>>> malloc(), when passed zero size, may return NULL (the behavior is
>>> implementation defined).
>>
>> More importantly, this is the Musl behaviour, so is how ~most of Gitlab
>> CI behaves.
>>
>>>   Extend the ->gov_num check to the other two
>>> allocations as well.
>>
>> I'm not sure what you mean by this.  Only one of these hunks has a
>> ->gov_num check.
> 
> Not sure I see a better way of wording this: What I mean to say is that
> the ->gov_num check that there is already is being replicated (with "gov"
> replaced accordingly) to the other two places where similar allocations
> happen. Maybe simply s/Extend/Mirror" would already help?

Yes, "Mirror" is better.

>>>   Don't chance then actually using a NULL in
>>> print_cpufreq_para().
>>>
>>> Fixes: 75e06d089d48 ("xenpm: add cpu frequency control interface, through which user can")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> The code change looks ok, so Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com> but I'd prefer a clarified commit message.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

