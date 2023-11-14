Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EE7EAC4B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 09:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632207.986348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pFq-0000Da-DT; Tue, 14 Nov 2023 08:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632207.986348; Tue, 14 Nov 2023 08:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pFq-0000BQ-AZ; Tue, 14 Nov 2023 08:58:42 +0000
Received: by outflank-mailman (input) for mailman id 632207;
 Tue, 14 Nov 2023 08:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2pFo-0000BK-I4
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 08:58:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 002f51bf-82cc-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 09:58:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9349.eurprd04.prod.outlook.com (2603:10a6:102:2b8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Tue, 14 Nov
 2023 08:58:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 08:58:34 +0000
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
X-Inumbo-ID: 002f51bf-82cc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVjz/NRQYGzdSXZmF2gFO/Hd5eg6tnksOHpWuKzoSmd9rrdbCGucHJJsTNPYc0lNH8P1n4rfGc5Xr9nh4vOcnt6ycR7B6OrbizcryeRZ5cPCciaERun49GN25HVaoNYAPd/5XvhagM8V8imgVse2jSDlyFXOJqxfogq4SX3cBjyTFNkL8mhC42qP/QxbRviT/DnXhNDb7QkQXZ7ap899jhd7ee5/Sj9NcnB9tI0upS6aDJJPmSaZIkRml753C9rCVcVSGZ/eav7tsUyV1kAM95e/Bpnaf2A9TVWU72NpO5yyhS9QXsY27FGP172FJoq7dViya+KRwNnfP03aLHuzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uBKZuXL0g023eWHSQWl0n+qwENAapxOUbxZ/kGZDWI=;
 b=L8j+aE2ncrQAX5vK1FKSSt4d/BeECBe28iqupROZgs8vuJgCbzJf57nXODMYwJXEmlrlGFiLkNYEyxDT1XPXqHAFusCyqpEgFAFuFvmIm4zz1wb6mXyS+efgkdbrElWhfmHdGIQC3IfomW+vu4mFyUP1M3qq+V/QoSw0vqqI8vJ6GUxGAVYDYGkYCuYXuPtI/Xn1Agg2lH8TAY6qjv0reF+PALErP5vB57coWDgEab8Mywnoxjyg8yusnXSrdl1Giklw7zioXctv/c9woi4j/N5Nysr1UI/JyUYkZlTsOLy4WkIrs+CT+ZPM8valWHz7Ata9Udrm9unPZMiALLHN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uBKZuXL0g023eWHSQWl0n+qwENAapxOUbxZ/kGZDWI=;
 b=a5WqTbtMqwhHAcj0OYnpMBpSF8LQ9zbBa3oDFLBjRPSzGumsXrorlQ2E2ORS6IGxZwyoQkOoUJayMyA+H6DS4tQD449Tzgg3q5FObi9dGpY0+OMFESwgjVt0gKTe8nY71gUx4RsJ2BXgNrJLqPnnMHq876h/8XrhwJYpeDR6jjMr5V8Wsak2lHmSua4a8vES2nrwT4DDyPg97yOpqkrvc1ISYLtFruNjfgFOx0E4ZtH6YODZUmxBFWlK4MasTibEAd3ozR9fftA80w/vi3xeHEzhi75oyNKvKOBn2W8CKAImjGIiAZFX8oYttdgTQkNNWD3YCDcHo12+uGcvVhacqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <474318ba-3734-1d0b-435f-514075243ce0@suse.com>
Date: Tue, 14 Nov 2023 09:58:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-5-stewart.hildebrand@amd.com>
 <72bb9f75-66a2-1452-40af-a90430cf7eca@suse.com>
 <356283b2-063f-4bd7-b6d4-c45f001f824f@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <356283b2-063f-4bd7-b6d4-c45f001f824f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: aca9e08b-4cc2-48a5-1d93-08dbe4efe215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aMBuLJVcgWqFnOlB85xyHRn08jC0RHsTK7yeTf5AmpTRKKeqbG53G7Ahtvy7kmrwCM4RKDX+10DV5sV4NCHV3/9UhtMQ3AHKfWYw8CbUZIMctQCxPNIykmLb43Envw6Jo5KOJVafgI4fyjNgkE/NvU4hiBNkb02tHYk1shKO/sTVORs8TDj7txkCs3GHhd/X5wwpB3ry+LPVUSbT7m0WT6YI2qA4VTdZCgyJrIvivprR2h160js3RKHJtClTWJLTCKSHKqNcYPKwlPGXlcPzuqsi1r+30FHMfTWwdoD6Yq2sFFePoecMOrA4j6EYIyY1JV56gfkjSgL/JcAsEymrCrY9QuYyS2UQTIJAPF6cKNchrobugiT2oST5i1NIle4A6uSgCpvnpADUO8+vPKIEEpDTL7QB+6igQ/qOQxN1+6yChVC55vhcLjz8dEJQsjbReTPbMM8SCeYwSzGLRu+2G8sygn/NhUiImKWhi3Xb1fp+EN19Ad4UekRFEwhmxG+Bhg7tmSFOftLiW+xpDNHLtbQWFPjzZbhD+4m6wpfidX/l8mLDg/sBGp2LUf/T9B106VqHI1ImZFg62wGsBteIX9osRLkZTH7wRtmn2sJZunJ9RZqerAcvJsu5gqB/Zg1Jlzhnn1wvsN0xVmIRhWqSK1L5Itynt+axZbRcUfC0iTs5mmlJOS+WJbFU8ZGxvJ23
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(31686004)(66899024)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(31696002)(36756003)(38100700002)(6512007)(53546011)(26005)(6506007)(2616005)(7416002)(2906002)(4744005)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGhtNkMwUXhxVXJldnVuRU15WkFqU2VnTUlCdDB6ZUVnb210eGpVT1laL1FD?=
 =?utf-8?B?aVhNVjgxemVFSTVIbTJIeURZU3l1RS9Ea3RGYStyTjFsMjFzVHozVVlXWDYz?=
 =?utf-8?B?OEJDN1lkcjdUcThEdm5GV3dDN3lTNWZ5QTFhNUkyR2U0MnU2cm55RXhLekhq?=
 =?utf-8?B?eUVzcENHNmxiM1d0SUNRbEs0OTM2dG1rNVVveEFneGoyMW1oRUhRQ0JKR1N2?=
 =?utf-8?B?dTdhUFlhVGNrbEkxR0NXY1QwTkQwbHp2MllxWlNNU1NDc0l5N3g4UGNidGtJ?=
 =?utf-8?B?ZjYrc0ZGVmdNclBvd1hRRUFta2dzdFFUbDRqa3hEcko3algyNVFKTDBlTWxZ?=
 =?utf-8?B?bkpwdnhsQXZFdWprL0tRMkRYRlZHS2xDMWI0R1M4L3RYaUZhTE9zc2V0a282?=
 =?utf-8?B?T3Q2VEVEVnRjY3RoSEFlOXhtcDlLQzVxR2szeVhmd0JrM2RIbyt2cnVRb2ZS?=
 =?utf-8?B?K1N6RHpOY05SZEZHM3B1MUVrS3RHMUc4M01QdnM1aFBtbm1rVjlieUdIM3d5?=
 =?utf-8?B?SVNEdXhDQS9OY0dWNVVmRjdLaWZJWEpyUFhnZzhkeG50RFA0OWJ6akNrdnhM?=
 =?utf-8?B?SnlEODlNQWRCZE1tbWZQWkcwK1B5bWxLWGxJM1dBNTE3L2I3cjVMNDd3bjZo?=
 =?utf-8?B?WmdCZkdobFlFeFhTY285cDZVanFkdU9OYjdGdGtPQUE3b2FmcXMwOE1QYXBK?=
 =?utf-8?B?T2lnRllnaUZidFFxOCtjNnVoalBTVWtMSEhXblhrQWlzRS9tRjhCdjZRVGkz?=
 =?utf-8?B?U2J2R1FPZ0hkejhsTkN3UlVETmd4eElma25YcEJQV3g3WS80L1diN2dpUXdh?=
 =?utf-8?B?SHdCZ3NZQ1hsYkpqZjBjK1VxbnJqOTZWUnRReEQ4OHRaTU5XVXBiajNaTVVo?=
 =?utf-8?B?YTlnMUFVSXRmcjRtWkRJaDZSVVFIZEx4RDdvcEhsQ3ZnWXNjS2VDWFQvOHgx?=
 =?utf-8?B?RG9FMzd4bHg0eDl0RTdGdjdIRms3eFJMQlAvRTNsMEI1UFZMVjNiRTdrUXFR?=
 =?utf-8?B?ZHZkb2lFZ2doVXlrV1UwM2J6V1hhem42dDNyTHJYcVQ2WWJVeU1HekRPK20v?=
 =?utf-8?B?VEZYczMvdVlyNklxL3ZIWVlmT1FwMXhFaFUxb3IwUzJIaTR5anI2K2VSUENE?=
 =?utf-8?B?ajg1VzdLWlhxd2k4V3ZOU3ZieEFUWXg2c3VNbTJYaFlDdmt2a1JOL2l6dGJX?=
 =?utf-8?B?NUljNno5UTJXSXhNZkNDY2VnUzdpQ3hWcDNIVExjVkFjR1oyU1U3OXJ3RWVU?=
 =?utf-8?B?eW5CZEFGU1pEMzk2UDk4TmpYN3JkM2RucTdpcSsySEpKemdTUlZlK0pXd0M4?=
 =?utf-8?B?Z0Q5TVY3WUg2QXRDRDRjWGVBWGRXZ0dMNGIzeUJIQVNGWnR5dGFtVW56cnNM?=
 =?utf-8?B?OG9CTTQ2TForUnE2MkVkVklGUHl3L0pkOHYxdUM0eFFqcUxUQUFObHpBNXZ4?=
 =?utf-8?B?eTlHRUxSd2xwNU05eTZqWVZRU3hZQ3FMTzdkaGVCMUdHSVh3NXpoeEdKWVNh?=
 =?utf-8?B?NmxnSmc1NS85Y25JekY4YWs5NnhjaXloenlXa1Y4QytaOFFHdEoyRGxYQ1BD?=
 =?utf-8?B?cnRWcmMvc3hCYzc3eHhFT3BMMTFLa1pQVDZGd0dESWloQ3BCNU1UVVY1OUdD?=
 =?utf-8?B?bVZhbXAwRE9rZTdVUVVhTzRObTJxZWxVUkxHbk9lTEtKYUdEZWJqYnN5STdr?=
 =?utf-8?B?QldJUTNraU1EOTFsd0tRNGZ0Snc1N3lkSjVzYVZqR2lGRHc0V1grUFJpeHBK?=
 =?utf-8?B?OFhZQ1NVelltbmR0dEhCK2ordXV4c281UU5mSCszVzUxOTduMkxnRU5nNlRy?=
 =?utf-8?B?Nm9oTUFINFpRVzVWVUFYR1JNNUdQSlJqeVZkMmwwazRZeVZiWnVTSzVPZlVh?=
 =?utf-8?B?SG5ZMjMxSVRUZklzQmhWaUc1V3dROHc5WjRWbnJsV0NnVmJRWjN6aXVjYmxk?=
 =?utf-8?B?SmovdFhoQjVrMzVZVkVlNFo1Y0JhNDZZaGxTRHIrOFBuZlowY0JPYWNtNmlX?=
 =?utf-8?B?QnhyNFpHa2FUQmVpU1hGN1A2Z2Q4OERXN1Bhelp6NHMzLzFmY0ZiSVNyS1lR?=
 =?utf-8?B?N01yS2NjaEdxT003OGhrS2FLLzJmOU43UWl2ZU9kY0tDSW85cGZkLzBNNXF5?=
 =?utf-8?Q?72yh5+3bPxCU2J+CEE1p0bLH1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca9e08b-4cc2-48a5-1d93-08dbe4efe215
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:58:34.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKBPlLc4hJiVt9GXsDa2c80vvvKgOIcYZhnVZpyNB58bD83Cj4HMIFZSLlEkHfLU+CKx9UAOyElift0bOia6dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9349

On 13.11.2023 22:10, Stewart Hildebrand wrote:
> On 11/6/23 04:26, Jan Beulich wrote:
>> On 02.11.2023 20:59, Stewart Hildebrand wrote:
>>> +/* PCI passthrough may be backed by qemu for non-PVH domains */
>>> +#define arch_needs_vpci(d) is_pvh_domain(d)
>>
>> Wouldn't we want to check for exactly what the comment alludes to then,
>> i.e. whether the domain has any (specific?) device model attached?
> 
> This patch is primarily dealing with Arm, so I'm considering simply making it return false for now:
> 
> #define arch_needs_vpci(d) ({ (void)(d); false; })

But that's wrong for hwdom, as much as - strictly speaking - needs_vpci()
returning false for hwdom is wrong in the PVH case. This would then at
least need clarifying comments.

Jan

