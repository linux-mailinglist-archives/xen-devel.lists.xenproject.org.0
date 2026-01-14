Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34AD20E57
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203755.1518802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5w9-0003hY-NF; Wed, 14 Jan 2026 18:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203755.1518802; Wed, 14 Jan 2026 18:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5w9-0003g7-KT; Wed, 14 Jan 2026 18:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1203755;
 Wed, 14 Jan 2026 18:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSw=7T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vg5w7-0003g1-Mc
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:49:43 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7be48ef-f179-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 19:49:40 +0100 (CET)
Received: from BN9PR03CA0788.namprd03.prod.outlook.com (2603:10b6:408:13f::13)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 18:49:34 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::49) by BN9PR03CA0788.outlook.office365.com
 (2603:10b6:408:13f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 18:49:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 18:49:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 12:49:32 -0600
Received: from [172.28.136.14] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 14 Jan 2026 12:49:31 -0600
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
X-Inumbo-ID: c7be48ef-f179-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsHPCVNKPJUv8EgEs140Q5sty5bIgUnGTe5T7O6NIiV2Kwe254H/sJETPko92Gpk3raODD61Jfj+a23eWE9i8Zt1aUwSDKxVr7DH4RrTd8yk3ARuVkTMazJqz4zRt58u+WHuVZiHVoMTs4fnaEcjsetZTN4R6VW8NqQ5k9J9xBcFL3me8if+7Qu9aQLN9cYOyMnbPeYDtuTOVKbS8mxpQvI0fefzHNJWw03D8xP9zG5La+UouHdIGyjTKt6G6kC+lJ0qmj0ormms754OAxOk/srfcWTe4Wep5Kpy1ffHxoyxkfW8JTU2hu/iCVSQW4SK9AVbX/zw0A5oaMr2JuYe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2rXE0xpYpVD/5RkoyymIGKvNPcJ6yv8N6AT813fJ6Y=;
 b=rjqxapGGu/roOQv9b33xbMFwS82UT1f/1QuZQn74XTsiN1a+Bg2XOEd3hsbtka/dKCv56HxZcJTzkAW/Yv9W+3IWYJpvQJ2z6PEomNnIeuaeHz9szRu24+djJQtV4g98WFVikmJquF88DpIDAy2c86eRret647FAERZ7Sy6QWj3TWALmXDvXbdAgFsrgD5WRKxapN97Tib8dJ+OEjXPNE9WgKfXTI6DXHxqrFCwfyHDB6okCKKIYlGucP1kshI7sQ1zJwPhpq/mWmtN/h3cut3mocH897XIoLGEUdfDxinxIc+ZVA7wEspAUjyaWAAM+h+pjbbhlCgtIEXpgbE08og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2rXE0xpYpVD/5RkoyymIGKvNPcJ6yv8N6AT813fJ6Y=;
 b=arGo6bVaNM1b3OcDvHQLc823kI6mfpuYbs+kON/nkIiwzDp84/ovK2MKo32RuNhelhL+d5+WXiuBUEqzXIw2PQ6MVy8avOlOMfLxA6KWrSm/dhWRKPbqSMwqjOYr9CKcrSRMdyawH0DA0qzOSSg1CeKa3Yn3jlYsj5S5NBzhl1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4091e373-fb1e-4544-9d73-47cfa650f904@amd.com>
Date: Wed, 14 Jan 2026 13:49:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] x86/cpu-policy: define bits of leaf 6
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
 <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f95197-2c8b-4fda-a9cd-08de539da8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3R5RnM4eXBJWGU4cHBqL2ZiN241VGFaT1pMaEhYMm1hb0VKRko0Z1ByMU4v?=
 =?utf-8?B?eWdTaFlkWTN5NWplTzhNK1piOUtJL3NLMko4Rldkd2xaSEdJSTNwUGJiQUFZ?=
 =?utf-8?B?a3lMODF1VWw3ZUwvRU1NSmFFblVRNHNaUVRSQjd5Y2xoQWZXMFNFZ1lQcExF?=
 =?utf-8?B?SFJWdlpPZ09xVWpwOUdXb3JpcnZ1SS9ad1VtWlo2Tk5MdFJpRHNEYmk1aGg3?=
 =?utf-8?B?azhqL2NpZ1pnbmMzOFlrVy81dngwWVgvQVp4bm5GRGJ3a3puOWR5eHNHNFdz?=
 =?utf-8?B?TUx0NVhuelQ5aCs0akdzZSt2NGNLSDllQjN2WDMzOVAyY1l0ZVZQTkt0Rk44?=
 =?utf-8?B?L0ozcUNGMlJGM01GMklNZW1oR2dzTkZLc3FFa0lCREVFNnNZbmdpWGhtNWE0?=
 =?utf-8?B?d1J2cUFabmtTWjhqa3Y3REMydmxkVUdKbkhnUHkvNWJmak5vdFFkZ3F1N1NS?=
 =?utf-8?B?TERmcGh6WGJheHZ4S1NVY3FmUVE4Um8xc1VTVnFqWU5GNFZKaWVGVERyU0lo?=
 =?utf-8?B?ZUMvSStuRE4zNG5ScXdiU21YRFdaRHQ2UU5WKzExOEpxR0VhNmFMOFNwL3ha?=
 =?utf-8?B?SjFZalcyV3l1RkJaS2l5b0c5R2piYldGTmtGbG0vMGU5YitVbUcwV0srZldL?=
 =?utf-8?B?elUrY2ZrZ0hkY2Jaa0E1NFZUdnZRVkhHN042bDNaWFdaVWdLWTJDZjM2Z080?=
 =?utf-8?B?NGU5NCtrRW9NOTZ0bmthd2ZhTkpFR2Z4Z2huLzFoWkVSK2grRGd6TkxtcWcv?=
 =?utf-8?B?YUJneWY4bDhrTEVFZ0RnUVZwaG1qUjNRZFllcjVucDMzeHc4U1F6STBlLzAv?=
 =?utf-8?B?SUd6WU40cEFTVmpIekpkR3B3ZlY1RzIzN2ErZVIvdmdEai81TkdvK3FxSURZ?=
 =?utf-8?B?bm85TlR5MFNxNGFvYWJFTTloQkxhbWtTVFduRWJ3OWJPV3BmR3ZIWHpuOTV2?=
 =?utf-8?B?eGFuditGVVZyV05VZUtWa1NGZzFNK054eU8xclJIOVIwOWNzYjl2bEFFMzJM?=
 =?utf-8?B?QnowU1IyRW5WQ3g0OEFqZE1PL2FwSHAxVnBBbmlac2tMM2VvYkxLTlNIdU5F?=
 =?utf-8?B?RkhCTG1INGZHMzYxOWJyMCtxVFpuNVpLMkpib0tDL1ZGQVhuQXMzUjM4RGgy?=
 =?utf-8?B?RnYxd0RISDlwSGdhY1FLTXA5TUpjdGVEQXNKeldQaXlMVDlpM1hGbkxNdG1v?=
 =?utf-8?B?K2ZrY1k5S282a2FiZlh3cEZoTGRpdTZ4RkN0NWpybEFobXMvNVdyZVRSc2RB?=
 =?utf-8?B?N09ubzRyVVJsaisweEVoNUhDTFozZjZ5OWlLRVZxbUppVlU4WndXQkNIWUxS?=
 =?utf-8?B?WDVCVzBlVEFDZThSWm1MTENtTkhMbUw1d2VPdHFZYnhOdHJFOUliSjBQOWI2?=
 =?utf-8?B?QVE0OWJOUWV0bERZbzJoY0ZuRjl1dmlMdkh1anN6RDBCTXczWXdzTGlwSEhM?=
 =?utf-8?B?Z0JiMEJmZWhhK25wMllzTjl1c2JLSko5YnFhUGlLYUlFaHpKc3oxdm5mVVpN?=
 =?utf-8?B?RFgvQS9QQVU1ckhNYW5YSDkvMnZ4MTFiTjVEcVl4QTN3L3VaV0VqbURMNGVN?=
 =?utf-8?B?WEFpL2NhMi9pdm9ZVWZSQTl4YzMrWVNJRnhCVGNPZWNWaWVabTA5dlExR3No?=
 =?utf-8?B?RnkyakJNL2RXeFdYSXVDOUhGdmU4UmowclFpRXY2K3lQU0VYQVRaMVFIRU5k?=
 =?utf-8?B?MFN0b0ZKWEExTDZPQUw1cGJJZ0FxNVVVL2lpUTA4ZXJNRFZoSjQxcCtXbDNB?=
 =?utf-8?B?bWNRVVRPaTBHam1ERnB6aHdteThobVVReVArQlozS0VML2tMNWQ2ekhhMkNP?=
 =?utf-8?B?VHJITzFxVnVKY0J3K3dIUkpuZU4zalZSb212Z3IxSkFQcEN3WURmTmFLa3Jx?=
 =?utf-8?B?QzRyS2E5ZHJFL2M0ZUplY1ZGVnhhTGluc1pibTJ5ckx2NUZKdGxicGd5bmNP?=
 =?utf-8?B?dHF6MXZhdHQxK0VoQVFKUmdYMlhoTXJwSCtxZFAreENYaHNlelpwbnZkWi9H?=
 =?utf-8?B?VnVzQTlLeExRV1U1MjlncHZaRitpVTAvVDRQYXFhanFYYVZzRFBaV0ZZTXpz?=
 =?utf-8?B?RzR5bjgxaUVMejRpeUY5THpQZ1lWRVJVbWpwRW1MUWYrVXpyTUQzeXdXbFRi?=
 =?utf-8?B?ZXhoOUt5SG5yWTlXbFljcHh0T2cySmRyZzlHY0w0aTFDRjJZVTd5MllVNG1u?=
 =?utf-8?B?TDhFeFR3SC9VZDZZRTUrOUE0L0s3TWViU282V3Z3U0JvYVRSKzNKTHlCbWhI?=
 =?utf-8?B?ZUY3L0NLdGpnU09mWnNMS3k5WEtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:49:33.9455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f95197-2c8b-4fda-a9cd-08de539da8c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

On 2026-01-14 08:43, Jan Beulich wrote:
> ... as far as we presently use them in the codebase.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

> +            /* Leaf 0x6 - Therm/Perf. */
> +            union {
> +                uint32_t _6a;
> +                struct {
> +                    bool :1,

> +                        hw_feedback:1;
> +                };

> +            union {
> +                uint32_t _6c;
> +                struct {
> +                    bool hw_feedback_cap:1;

Maybe with an comment of "/* aperf/mperf */" since that is probably how 
it is better know?  I was confused with hw_feedback above which is 
different.

Actually, looking at patch 2, I'd prefer leaving this named aperfmperf. 
While not the SDM name, I think it's a more common name for the feature.

Either way (but preferably with aperfmperf):

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

