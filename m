Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BCB3902F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097212.1451650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQh5-0003UE-QM; Thu, 28 Aug 2025 00:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097212.1451650; Thu, 28 Aug 2025 00:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQh5-0003SR-NK; Thu, 28 Aug 2025 00:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1097212;
 Thu, 28 Aug 2025 00:40:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQh3-0003MP-Dk
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:40:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09c1ffa-83a7-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 02:40:43 +0200 (CEST)
Received: from PH8P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::27)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 00:40:39 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::4) by PH8P223CA0022.outlook.office365.com
 (2603:10b6:510:2db::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Thu,
 28 Aug 2025 00:40:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 00:40:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:40:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 17:40:38 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 19:40:37 -0500
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
X-Inumbo-ID: a09c1ffa-83a7-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU02y+VEYWn5WbDfS4ID/X+jRKlRxLtFJwmiRqQL1Kb1o7tvypJgQL75PDlDvHkUeRf2i3nD8dUrVGNMfRsTpiOpfzU+VoIn6hIVxH3C2ZYjQjAO9hB9/DKz6ymMUle08GLdKq4jCPzu+//pAjMum2PoVWPQvXrnhNEiBQaUuKLRZ+EVLeonX3Qy2Bbu8CwLPOzSSgMKfXdPqMzqQxehXLoQe+OApxpN/+yb8V59CKmya40q9Z09VyEtEvuWQze1I7Eivf4Xw4EWLraopOfBNiQYe2pXU2JgV16G1+WwLfQzciCR/Valsd/Y+qWQEGQ0lblPZaB5o+zCfsF8/jCDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4cyw8hU59UlTG59IPAhRC9P7/TjVATwWDM2how3Bfs=;
 b=ScFFTUKlbCbvrZzW+s0lTi3tF58Tm6YHaSQDeWtPJQq2JAIfCbsGCEEwVBtXzwnzjpbCxuMdTezW0BgbzoonHB6HK10/aT2cIqf5rWPA9NjPWmXGcjukYq7n2CrcRp3dahaGIySTJ1dbeCSgmfQXlxm8DMpeZTYtmF9B9StgPOJlE0GsiDg5XI+R2HgzlTomRHEu1pO9x20Ai4N0Zpwa6wH0+yEms6HF4+BVDxa217N1qfQ95CXG7tbpg9hGGMZSbq2U8yaBD3k7nRkvOorvW8L466AwInJK6pTdUwPOxgEOSlsdApIS7nZ0O6IJETYAPgekQwegyNhqnWt3ANVihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4cyw8hU59UlTG59IPAhRC9P7/TjVATwWDM2how3Bfs=;
 b=OH1lws662RULuoCICTVRy2XAyHWmDmbZsJ/vjRNYMzuMZ4EfZkJnuR6s+/r/cMTNJPMq98amCFVc1S9HfRwjMHpI/EK3wUj0sc+XVqsiggnqNTcEHaZZWaRV3w9oMtB31zEp2Pg9q6urzPzs8TsWSNU5jDxlSFiBdYGfNwBrc1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9378d846-0e90-4be6-92d5-1a5d639fa137@amd.com>
Date: Wed, 27 Aug 2025 18:20:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] symbols: split symbols_num_syms
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <5015ce6d-a961-491b-9fe7-f6628329f3f0@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5015ce6d-a961-491b-9fe7-f6628329f3f0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: e0267803-e595-4519-7080-08dde5cb82bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXhSOVpaSzIzRXg2RzJKWUFIOStJYXpJR0xXZVVtbUt5RkRGWXJRZWxXUW4z?=
 =?utf-8?B?L0t3bkFwSnpXT1JGQzN3NGVwSEE0TUdIQ21HTnJiYVRpNGhXNW1SMUQwNVdN?=
 =?utf-8?B?V29WOGwrZ1c4eVFLdzhxZitWd0NUY3hsUm01djFCQjhRRUkzZUlDckMwUUJz?=
 =?utf-8?B?MDdla0RjcVllcTA0RTFaTU4vVkU1NjRMaWlxZ21CK2RoRmVkb2ZFamlqbE9H?=
 =?utf-8?B?YVI4SWZTbERaN3BraTlCWUtQMkhnRDdMdGFldGNFRHZhTkFOck11M1FMQjht?=
 =?utf-8?B?K21ORy9aZ0MzZ2tvREdGSmpVSFhqN2hIYmJRYlI1dVcvLzN1VUZ5aTNYd09T?=
 =?utf-8?B?UHhibFIrV1Zva2ZjRzloSUs1dlhtaGcxYWY1d01PakJPV3JseVJEVHpwL3pp?=
 =?utf-8?B?RUxzOSs5bXlpWnJaM3RJY0JyME9HUC84S0pjemM2cHMzdm04eGJCTEQ4dW56?=
 =?utf-8?B?N2V6eTlxZ0lRZTNVSjBqaUVCbWQ2QzB1TWN0NXhKVmFrdUNSVHU2aWdsbHRa?=
 =?utf-8?B?bnpTaFBLUGNVTnBZczNSNHptMnRTUXNBUmx3d0Q0UGhtdVpYRm0yMVM2UXpj?=
 =?utf-8?B?QXcrS3ZCRXNEMlEySkpQM29UOUMvRDYxd2JWVWFiT0pyVGMxK3hjaWZMU1c4?=
 =?utf-8?B?bHpWcGh3UWZWRWdJcEJwRS81QXRTbWZibXQ1bEtxd0YwclNGZm9idk42dWFu?=
 =?utf-8?B?dzBzY0pmMVErZ0l1VkZlWG8rbVlPRnBVSnY0TmFjTnpoQURhWHExcWpQbVRQ?=
 =?utf-8?B?SnVpaHcvY1grT1lwMlFIc2lDOE1qL1ZTejNDbHVtTU40QU9RRDlFa29Xakh6?=
 =?utf-8?B?NFJnQ3NXZTdJdSt0YVZBK3dCQjNaRW1WWXAwU2ZaYmNZeUtNTDlRWVhSVk9i?=
 =?utf-8?B?bVZwSmoxWjFQZGF1T1h6YWNVeUxaeWlldVdQdklzMTYrdERocGhVWm16cFNV?=
 =?utf-8?B?dGxrYWlRV1I1bzREOUlIaVZHSXErc1JvZ0FtaUZmMDhwZzNlSjNZYTFFamJq?=
 =?utf-8?B?WDcva09zKzhzWHRPb2FVUHFYTW5DSWZleVpGSnYvcWdQM2doT0dTTlhxQVpW?=
 =?utf-8?B?eUt4bWhpOGxRR1JVak10dlhKMmVWWVlMa1VFRUE3cXpDT010eENKT1M0SCtO?=
 =?utf-8?B?V3o4WlFJcEtHdnRNZitSQzFycXVHOVM0SXBVRTBqc3NlT29STmFJWkdQM2RI?=
 =?utf-8?B?a3NiK0VrZWlmSllUdUp3YzlwSDlGWThDbDR5NWJ5Sm1SUnNseVgvY3pXdmQ2?=
 =?utf-8?B?NmRXVHlZdXQ0V3VhVm05UGR1RHFFK0xGYkl6cnlqZWVMdVc5OTRNd2FMVXR6?=
 =?utf-8?B?Nkl3TnFrV1dQYmUwZ2dxb2ZYa3plN2JjMm5GalVXTUlKdTFNMEVRMkE5V3NG?=
 =?utf-8?B?NlZlZlRsKzFnY1NIVlF3YWRkRGJaUmMwNzBHRkpQSElQUStScjVrT082Z2RD?=
 =?utf-8?B?cEVBSnN0aEZicmVaQXQvYVhtdSt5UEFYQjl5U1pZY3hHckhkQUhYMXlvZ3JO?=
 =?utf-8?B?M1RUNk80Ky8vUFB0dXNDSkRMZkVJT2pJNUMxZTlnRStuQkFtbm92Tll2dDUy?=
 =?utf-8?B?Tm9iTWNyOWNHc0hMZVF4UVRDdmpYdXk4ZHI0RWhwSzhpVitnbmp3a2grS0Ra?=
 =?utf-8?B?OTNkM2QrUnE5RDVydFBMY09GdFE2dXZKMldycG1zem9IUlN1eGJUWDFBYjlP?=
 =?utf-8?B?RlpQek9MaGpQVGtLK1BxN3A1M3FHUHF1UFo0L3ozYUZVOXFQTlBFYkFVWTQ0?=
 =?utf-8?B?ZXdva1Z5SDhRTzFJbTJWV1NBZnFTbW1oVVh1YnI1ak9YVlFhRXFVbzdEeHU1?=
 =?utf-8?B?N0I3RURHTmM2TFZOMGhWYXZiQlRscGJvbENodFBuUHFNZWZDVUVhdE1aZldw?=
 =?utf-8?B?UTZrT094bzdOM25qM1pEUlU0cVBTSEMzUk14dXRhTENvOHJtZnlMT05BVzdM?=
 =?utf-8?B?T3dVZG5CSmhzeXRlTVpRZEU0NEJXbXQ0WHlNU3RiY3REeUROTlRMOFpST0Ix?=
 =?utf-8?B?UGRKM2h2b2pLUEYyaVNvWWNuSXo4MjNvVS9rOVlwQUEyWUZyQ2tmNjNvM3I5?=
 =?utf-8?Q?j7e4lT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:40:39.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0267803-e595-4519-7080-08dde5cb82bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

On 2025-04-02 09:58, Jan Beulich wrote:
> In preparation for inserting address entries into symbols_addresses[] /
> symbols_offsets[] without enlarging symbols_sorted_offsets[], split
> symbols_num_syms into symbols_num_addrs (counting entries in the former
> plus symbols_names[] as well as, less directly, symbols_markers[]) and
> symbols_num_names (counting entries in the latter).
> 
> While doing the adjustment move declarations to a new private symbols.h,
> to be used by both symbols.c and symbols-dummy.c. Replace u8/u16 while
> doing so.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

