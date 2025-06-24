Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A9AE706E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 22:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024072.1400110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUA2D-00052d-Cp; Tue, 24 Jun 2025 20:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024072.1400110; Tue, 24 Jun 2025 20:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUA2D-00050V-AE; Tue, 24 Jun 2025 20:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1024072;
 Tue, 24 Jun 2025 20:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnmP=ZH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUA2B-0004ys-Bz
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 20:14:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf12cd02-5137-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 22:14:20 +0200 (CEST)
Received: from MN0P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::17)
 by CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 20:14:14 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::1) by MN0P222CA0011.outlook.office365.com
 (2603:10b6:208:531::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 20:14:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 20:14:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 15:14:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 15:14:13 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 15:14:11 -0500
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
X-Inumbo-ID: cf12cd02-5137-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWjOmclf/gU66jnvA462W+JyYV90BjkpwpND6VvnC/q1c9WLMHQFH/kYh+TgILoorbUHd/VC9u9NOb4zeLzGOJirLHQADSFhFvp5kkHR4ZZ3X9N1fcBflM8C7VcALC2d4H4C6WFzPCydV8pPoZRBmgRIELe2Qtya+T8mBVG0UlIQ2wTetpKCG2V/9DsKYS9oAkwX05VE1pU6jZvmHT3bBHCEOS+lndHy7QTFTMjxiUPxicZtULPYz1T/fgbrRUyEvjBDWE115MftJGAmgbYoKjrlmEULoimrq30PKr64bIEeLwCz9Exk57tl9+M9faGzyJgvu0vjM1GTWY94ZtX4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6e6LxrDUk7QNpNs1K2g9YMcxMyKsWbi3PcOKroJCnoM=;
 b=oWgRIN+5B02xl05OPogbuzWCmEGF66aG8XE0BTDQUGh2kQpxw87GJ1MoaeoNUetMN168+rOpJ8iDm5n2cBZcxyDp2l4uFRGO4TpPwJUw/ED3GDWYce5R9WT4MJgglqhcvLXBjyGo1UM7G4Mzkm9Z3VUnOaFyTWcwFUrNwM2F2sCnBgy0PDP/KdcNZTOJDg3yDTLyoDduJNl81bcqdMQMMTXOWacSs6gpMD1pisaAjo+UZ/7js2A9M4pjI3Xx8q5DsilstZjJDZgzCjQQtdUuU3mr5nFnZWSAJMZGMVhYV4DM56GuM7PB6rMGacfUtqSLvnCFMhKPxU5p0kvbXrwJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e6LxrDUk7QNpNs1K2g9YMcxMyKsWbi3PcOKroJCnoM=;
 b=eF7Sfz4loDitidUzC1gHBYfYgjuF0eScwrD+o+FemaXyMwTw3UdmNBB+bSxNuOKxhSbJ0Ws8kfpwLjA0VBWsLkuxBWix6BRpDRs1MVBGUY3TMcdTYHYsSICR9OpJwmtAtdLg14lVAfplVLoaGmKNsXu0DZ4i/dbHcrzC59mxi4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2e27e128-398a-4714-b019-eab04520cc97@amd.com>
Date: Tue, 24 Jun 2025 16:14:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hardware domain and control domain separation
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>,
	<demiobenour@gmail.com>
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
 <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
 <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
 <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
 <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CH1PR12MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5392ee-b896-4506-f878-08ddb35bb05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkxkUHhhbE1QdWNaYUlwRVFJVjRtM2gzTlBQRWpzM3dHYnkwYkRxazh4aW9D?=
 =?utf-8?B?RDg5OXVnbGNRUTlvL0YwbzVjcXIwYk1uczNsZG1jWWxzRUJ6MlBXRTlMdU5q?=
 =?utf-8?B?ZDZHN1UwOStQZEZkQjY5RUkzeDhuMUtlSzRLaVYrRExPczlObGRpQi93M0dv?=
 =?utf-8?B?OTBsOHk2cWRqcEVHM2lHTms0ZmZVVStyZE1lZkhlRjQwdS9iVWhHRndQVDJ4?=
 =?utf-8?B?Rnk4QWsxeWhuSURuNGRyVmI0M0NmTXppL2hNOG1tU0VnaWpRV1VyeUdXVXJF?=
 =?utf-8?B?TXplWHU5NVJTZG1RQWhnQXZENE1BYWVQbGhuN0haMW9aVERSRHNTTUlNdDlu?=
 =?utf-8?B?QW83cGhNcE9sLzcxOWZEdFZaQklQTWVuUUg4aFJVOURvU3VVQ3JjdGIreHlh?=
 =?utf-8?B?MDR5NFZucXJPb2gwdnE3OXFXSi9sSkZ0OVZNYXFtc0tYTHZpcUlSR2Vlemtj?=
 =?utf-8?B?bzdueW9FK3BWVlk3dEJPMklvS1dyREM3NHNDaHE0MERmZGN4QW1TaHRPaHEy?=
 =?utf-8?B?Tm1haml1bHBUSGE5WW5QQXNCUXhWeWJXSGZlRVZnNXBQNWZFbU1DU0RDd2xO?=
 =?utf-8?B?WU1lM2NkSW00aWRnYTF2S2ZCM0srTG5HK215YzNHeTM1aTVSODJXK1dvbmhs?=
 =?utf-8?B?c0Y3MS9BcGhydm0wd2t5TTY1dmxnT1ZZNlNOYVNUd2FpTjlkWFFsdGpGU2Va?=
 =?utf-8?B?SEhUaDd0bzJhSGg0NmFhN1lndGtXWTBHbTM5b3VDMWkzb0hSKzlBeEVPWmU1?=
 =?utf-8?B?b296TGc3OHZ1dlBlb1M4MnFMUklDSDh0dkVybjFBbDdLVUVWQlc1eXpzcmN5?=
 =?utf-8?B?QW9CTmY3YTlIVVdsVG9QM1Y3bFVEajZyVWhtSm1oSjhLSXJPa2V5cldlajRT?=
 =?utf-8?B?U0I0S2RpNjZnSVNFTWVnWDVwY0hwdENPbkVRYlVna0ZaQTVBRlU2SXNobDJS?=
 =?utf-8?B?VWc5SURBUDdCREg5UWo0RW9MdWU4UVExUEkwQjN2NW9BYUdRdStOdENHOTJK?=
 =?utf-8?B?OGppRnVsakJsZXRBd0ZqZTNRYWlwLzdYQStLdVY4UnlUclFTMkVwL0RIVjR3?=
 =?utf-8?B?RjhadUZMSkhQMjI3ZXdvc0FjRjZTK0NEcnFaQW1GRlVoV2c1MWU0YUU4TlM5?=
 =?utf-8?B?b2VNNjdEQXlFQXNtMlFuOFRoaVNGMW4zRldsamNoTXZJV2wvZThwY25yM0dJ?=
 =?utf-8?B?ZjhuVHdONzV1Q3lvZ1grM3VQWTgvMzhwUExOZTRSTmJkRE9hMExqQTcwaUUv?=
 =?utf-8?B?SXdYUGw2U1l4MTRpSzZNcU1FWVZNcTduaU9zcGQySmNiSVpXc2RuREg1VEVL?=
 =?utf-8?B?QS8ySVoyZEFVVVBoeUMrVUxlRWJRNVYwK0ZoWjNvdzRlY29BSE9RK3hFOU04?=
 =?utf-8?B?alpEWC91WWp2dkltMzlSZGNqOU8zaHlnM25IRlNZR2wweElmSUM2Q1diS05r?=
 =?utf-8?B?M096L0RGNnhHMEsxcmNGeUdQencweUwrRktWT2xJTmw3OEZ5dzFCbXorb3ky?=
 =?utf-8?B?MU1sTFBZbG9EaXpKTHRyaHJCT012NElTdkxhdVptWkNTNXFhZkxuOUgwa01K?=
 =?utf-8?B?Z0xEMnNLeWNYTzdQY2UwbmEzMWp4Nk44eHkxTlNtWTlEZjUyTHpmeUJoUUFC?=
 =?utf-8?B?ZGlFOXZURFNmVHVUMGlnYmh5aHhMUjlBcEltVERncDJHbU8zdFBsL1YyckdP?=
 =?utf-8?B?ZVAvTEkzSzVMbWdrWUdEMXZZMS9kL2srVGZ6VXgvNEtHNE9XTkhjVlZpT0d0?=
 =?utf-8?B?Y0FFYU1Cb1FsbGxQMTJIWU5jbGh4NWRndWFLTlRabVd6aGxOMHFmc1lwUEZy?=
 =?utf-8?B?YitrM2RZdHRINnI2V1diV1djaHh6TUxoSGlza3ptRXVpQk1zL2FSb3Y5U3pi?=
 =?utf-8?B?dkNwMzRLZHFxSC9kNWUxMkhPZzNRTHlxWXVjMFliMGdEa1hMNFA5OXd1NS9t?=
 =?utf-8?B?endpY1ZzSHRsM3drT3dYaFVpZnlpaVFXdi9NM3NEUU1qcFkyekt5MXlPTFV3?=
 =?utf-8?B?azIza3UwSndrQXl0a3o0bWhZYlRQSTlhUXJhcGVDNElwTXdzY0dkV00xY1pB?=
 =?utf-8?Q?zrsIOu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:14:13.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5392ee-b896-4506-f878-08ddb35bb05b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9670

On 2025-06-24 01:25, Jan Beulich wrote:
> On 24.06.2025 00:51, Stefano Stabellini wrote:
>> On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
>>> On 6/23/25 11:44, Jan Beulich wrote:
>>>> On 21.06.2025 02:41, Stefano Stabellini wrote:
>>>> Also a more fundamental question I was wondering about: If Control had
>>>> full privilege, nothing else in the system ought to be able to interfere
>>>> with it. Yet then how does that domain communicate with the outside
>>>> world? It can't have PV or Virtio drivers after all. And even if its
>>>> sole communication channel was a UART, Hardware would likely be able to
>>>> interfere.
>>
>> There are well-established methods for implementing domain-to-domain
>> communication that are free from interference, such as using carefully
>> defined rings on static shared memory. I believe one of these techniques
>> involves placing the indexes on separate pages and mapping them
>> read-only from one of the two domains.
> 
> How's that going to help with the backend refusing service, which I view
> as one "method" of interference? Or else, what exactly does "interference"
> mean in this context? (More generally, I think it is necessary to very
> clearly define terminology used. Without such, words can easily mean
> different things to different people.)

Yes, there are different kids of interference.  We are concerned about a 
domain blocking another domain.  The main example is an ioreq blocking a 
vCPU.  The blocked domain is unable to recover on its own.

A PV backend not servicing a request is interference, but it doesn't 
block the frontend domain or vcpu.  The primitives don't block, so 
drivers can be written to handle the lack of a response.  As you note, 
this can't be a critical service for the domain.

Regards,
Jason

