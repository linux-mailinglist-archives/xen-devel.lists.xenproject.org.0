Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA10B1CE5C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 23:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072243.1435471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujlcR-0006PL-Sv; Wed, 06 Aug 2025 21:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072243.1435471; Wed, 06 Aug 2025 21:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujlcR-0006NE-Pg; Wed, 06 Aug 2025 21:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1072243;
 Wed, 06 Aug 2025 21:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPx=2S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujlcQ-0006N8-EM
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 21:24:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2412::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b199dbb7-730b-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 23:24:12 +0200 (CEST)
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 21:24:06 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:8a:cafe::cf) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Wed,
 6 Aug 2025 21:24:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 21:24:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 16:24:04 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 16:24:03 -0500
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
X-Inumbo-ID: b199dbb7-730b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZATdNZaHjT1fTZvxqTot48iPjdglfKrBo3fyi7Qa3egnfI9iRhEpUoAy8/+yJy3jjUBzeREsqwOo3MZw9xL6q99KGNvr4/jGjvMFslk+DDM8e/9p3BeQ6DPVHDV9mvnUKZ7csvfi92syc1VMwTG+F0kW7yKW/WJMsEv12F+sMVWERfTGr39ync997zVPNgmuFmgUDRXvUjoBrVm+0ftGigUEmhHuIczt3zu5YyfwEulVjO/wZP1TRV53x57RD2rYUoGddyggoK+Eg0hjROmplynjHUal1c5XtoJGQ4CoUolNfAht6pQ5mbRmrMN4ZTnX9b3+PCQ5LjBqK3xqK0/mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39EmAH5FAicSc8YRclDIl5SElJIogV7JY0cYKX8W230=;
 b=RSzmtYso2OYnH42pyzDZJMiRlknhWczWip9UxjqmGUcK62itBMz/pLcNt0gnpkJG3Bl2hnca8vdVBmRzCAiGtnlFfTxXHsvImk5gEXwT7F7IqXxZUSUm80ao9FfhLisvpVNcZW8VbRYiFaLhV1DY1BcoWpfBh9dpojs35Ucx+ngKieLToDtnSYWmKA5KzIOO6swr5gnIJGUdJZ3x10wpS1+BWdROKWLGQjLyKvbs7wwLbBszTHf26uhyfjxoJnwe3N/B1H0NLoA2s1BoTnFiHs13H8Lg3ewgxyM0iwJDVUv/KKhqUVytrLHu9Ca/M8GjPtizb8JJqQKbdgmT907/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39EmAH5FAicSc8YRclDIl5SElJIogV7JY0cYKX8W230=;
 b=tjwqBFbFMiaaykTwv9QWckuXtF80hCQlvfiP7D4KKtsSeOrA7M1IvfD81UaebNS0WTslRUgwvfvfvDywi9eE8lY4jLvdgly3nB28uO1tx+amZn5027S6Kllq7P3LAUKaCbHGI4/Xy5WR7WbSzm++AIZTrHTLF3K+jin+vmBAOY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b3edf693-6f54-487d-b465-6224daf9746d@amd.com>
Date: Wed, 6 Aug 2025 17:24:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/mm: correct PG_log_dirty definition
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Penny Zheng
	<Penny.Zheng@amd.com>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
 <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 646cf61f-ed6b-4cd0-c099-08ddd52f931c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUNFNnNnd2FWSmFkYXlZdjF2TmF3MWxQbEZIbCs1SFdqN2NsV05nS3VINHlz?=
 =?utf-8?B?aHk5Mk03WVQvYUloZXdtVFM2SjV0K1pEMDZlM1NzWWlOVVJGMXM2LzZLZlhQ?=
 =?utf-8?B?cHBLYTlSbDg2L3JRcXZzdU4wdUV3VzlkUXNSMGUwZ2N5dVRHenBOSURMcEs3?=
 =?utf-8?B?TEppTFM0Z1hLUFdHY2hWTk41RmJzcVJHUzFCejdYSHVpTFdKV0h3Mmo5a01L?=
 =?utf-8?B?dkJ2ZkREVkt6eTFtOXhpZm43UUlqdUdmTitPdHN1b2lKSnFscTROZ1JHZnNm?=
 =?utf-8?B?U3l4OFN3RTlzZ0MrbjJaemNqbUV6SEdiUXZJMDh5V0hrQ1UxazFCclR3TVVS?=
 =?utf-8?B?SGZwaU9hb3IxalRpc1dJZDNYS3VSRjB5Qm15UjdEZ3hjNER6a2podTlQRmpp?=
 =?utf-8?B?U1grOWh4UjFiUUFOd2hzbit1MXB3VTNXZTE0VitjaExYZm42RUtFTkR5Q1U2?=
 =?utf-8?B?SUx2RGlVM1U3RWhxVlFUUjl5a1IzYVJHZGVkTGlqNWNudkdVZzlPaUFnSDB2?=
 =?utf-8?B?SHE5SGEyV1hPUWFKNzNWTGJWd0NqQ1UwNm1BUElUVXhLTFpBbVczOElub3pQ?=
 =?utf-8?B?SmdHaUNsVGJzYmZRV3VRYWJYRjI5RHhheXdZWmdzeEY2Y1NwYnlTRFFCOEZ0?=
 =?utf-8?B?dXkyT24ya3d6dVByQTJueUpNdEhlYjJBWlJmeWJpWFA4N0dOMk9qWXVyUk90?=
 =?utf-8?B?Y21KaEhSRGtzdlF3TTd0eUpHMXlQQ3p3cmpSRit2TlZzRU9kbFJyVVFWSkVu?=
 =?utf-8?B?eEVKcWUrUVZtaTR5aDhscjE4S0Rnck1Hb3lDWmNZZW5wMDgzYjBSc3JlcVFQ?=
 =?utf-8?B?dGJDWEMwSVFrMElhVWVva05mc2VKUHAxMXp4VzcrWSswdStKNk83eXJiWXU5?=
 =?utf-8?B?bUVkb2kzMnhZYmdEcDlqd3dUSStQYlV1USt1N3FkYjRtNklnUS9NOWhLUTJo?=
 =?utf-8?B?VTR3R2NHY0xTTzdKTUF2NzE5cFc1VXQ1dnRzNnFIOUNwclZ5WVVDc3JzalBM?=
 =?utf-8?B?RHc2MEZ3V3lRd25uWHk4U2pYbG1GOXdPcW1sVGswbkorNy9LRVJoWExUUndJ?=
 =?utf-8?B?TW1zSHl4dlUwcGwvdmdPWU04azU2b2hQYmk2RzR3dm0xV3R1Y2RpdG1tNXhp?=
 =?utf-8?B?RnFCS1E4bUg3ZzdQaitBMlpMTmxIUmdyL3ZPVkMvTlpSK3ErWEh0QXY3MDh1?=
 =?utf-8?B?dDJaVDJrTzNvaDA4dk5DYmtrU3VhK1d5cWhXZDdRNml6M09rVGM3OFlxU1pV?=
 =?utf-8?B?eGQ5eVBOdThqWjBrTWZ6NkxENE1zMDdhaGtyZVd1ZUJFNURxamh6TkxpSGVo?=
 =?utf-8?B?VVNGVkR2NElkL2hET1NhSEw4Y0JiSW5TRWhuUEtDRlBlWFU2a0lqelVkOHQy?=
 =?utf-8?B?dUhFRndsVlQ0Z25LaWNMWER6ZzdNVmZ5ZzIzNHpzSi9EMW82K2M4MnpTRGJD?=
 =?utf-8?B?R1NBNlV3QnkvLzZ3NEYxZzk3L3drQ0ZMNlhVMHhyMENuZS9weFBQTXdJQWJi?=
 =?utf-8?B?ZW5namhSa3V4UWtZd29WUVlIZzdBbWNLZEd3ekhISzlPSXQ0TGVIRy9xejh1?=
 =?utf-8?B?aTFiRlY0K01LR1E4SjhpUVV2cVhTT2owcDg1YWU0aE1vQ0x6WVlPeVdwUW5S?=
 =?utf-8?B?dk5hTlRaczk3Q2VWUWtHOS9QOWsrc3JmT0h4YlcvaTlSc2hxVXk5SHkrb3U5?=
 =?utf-8?B?TVJXQVRqM1NwOWJjWERuZCsyb0g5cmwyRXZjUU5halEyMmNPYTR3ZG5nbXZV?=
 =?utf-8?B?K3FjZnB2bkpPaU1Kbm5CK1ArVithR2k4VE8xMTRzMzBmMHZtRmwxVys4Zmo0?=
 =?utf-8?B?a2duVXBPR0x1VG1MeFZtaFVQdFBoV2s5Q01aOURPd1dzZk9KTnQwTUFuaWEr?=
 =?utf-8?B?cUtGc2F4QjhtMmducDZwa0xDWk11UGlESmN5TnJPTXlTVkk0WnJ5YnB1SkJx?=
 =?utf-8?B?VXE0NkhSaDhvaU5MSVAvd0lDZmxxcjc4ZWIva2tsa2Q1TnZSbXRLSENxNGQz?=
 =?utf-8?B?WmEyNVBjYVo1d1JMMFlXc25id0gvY3ZRaXVVZDhaNlBZbzJxeHBiU3E1Vnoy?=
 =?utf-8?Q?RtchG6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 21:24:06.3429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 646cf61f-ed6b-4cd0-c099-08ddd52f931c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389

On 2025-08-05 03:59, Jan Beulich wrote:
> While it is correct that in shim-exclusive mode log-dirty handling is
> all unreachable code, the present conditional still isn't correct: In a
> HVM=n and SHADOW_PAGING=n configuration log-dirty code also is all
> unreachable (and hence violating Misra rule 2.1).
> 
> As we're aiming at moving away from special casing PV_SHIM_EXCLUSIVE=y,
> don't retain that part of the conditional.
> 
> Because of hypercall-defs.c we need to carry out the dependency by
> introducing a new auxiliary PAGING control.
> 
> Since compiling out mm/paging.c altogether would entail further changes,
> merely conditionalize the one function in there (paging_enable()) which
> would otherwise remain unreachable (Misra rule 2.1 again) when PAGING=n.
> 
> Fixes: 23d4e0d17b76 ("x86/shim: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course PAGING is at risk of being confused with MEM_PAGING. It not
> having a prompt, I hope that's tolerable, as I can't really think of a
> better name.
> 
> Other PG_log_dirty pre-processor conditionals then likely also want
> replacing. mm/paging.c and mm/p2m-basic.c could also be compiled out
> altogether when PAGING=n, at the expense of introducing a few more
> stubs.
> 
> FTAOD, the Fixes: tag being referenced does not mean this patch corrects
> the far more recently introduced build issue with the combination of the
> two features. That's still work that I expect Penny to carry out (with
> there still being the option of reverting the final part of the earlier
> series).
> 

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -864,6 +864,7 @@ void paging_final_teardown(struct domain
>       p2m_final_teardown(d);
>   }
>   
> +#ifdef CONFIG_PAGING

The file already has a lot of uses of #if PG_log_dirty with similar 
meaning, if I am not mistaken, so using that would make it more 
consistent.  But CONFIG_PAGING is directly tied to the Kconfig, so maybe 
it is better?  Just something I noticed.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

>   /* Enable an arbitrary paging-assistance mode.  Call once at domain
>    * creation. */
>   int paging_enable(struct domain *d, u32 mode)
> @@ -889,6 +890,7 @@ int paging_enable(struct domain *d, u32
>       else
>           return shadow_enable(d, mode);
>   }
> +#endif
>   
>   #ifdef CONFIG_HVM
>   /* Called from the guest to indicate that a process is being torn down

