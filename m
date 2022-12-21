Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A7652D15
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 07:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467576.726618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7t2E-0000CH-Ji; Wed, 21 Dec 2022 06:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467576.726618; Wed, 21 Dec 2022 06:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7t2E-00009X-Fz; Wed, 21 Dec 2022 06:57:02 +0000
Received: by outflank-mailman (input) for mailman id 467576;
 Wed, 21 Dec 2022 06:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7t2C-00009R-6G
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 06:57:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c2ca8f-80fc-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 07:56:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 06:56:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 06:56:57 +0000
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
X-Inumbo-ID: a9c2ca8f-80fc-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZtPznVuxIB3k1QO4gqVzYETWY95OW9V8BDP/NlJNzXG7CquD4Nqai1I3bZLOsB7XPd4V/DJq8fv2hT+E9FSrPE5GiWdemSI1IL8K5/LRa+B4hubEWu79fohMAuc34rNGLa4vHDvuqX6jE3e1cNBAOr/8//H1F83lctJuQKL9bjfLSjl0GyV/gu7CMROT0a3hcKX8I0JMoEGVrMee0KwUWiEkgnrxKv0Fv//ahVHpwBm+9iqlGchG52uJaxTREhS7AKI0JjNj0VBC7wYLmJe9UoV1MtUzwz1jPKrbXD3QNZd8rLypHTsMjNsf0f2xbSN+dZBJzv3XAUMz+iceCA+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPjWrfvNt2Tbc1Uvv3IB3if8+YSTHyMS+Vhnt9u+/to=;
 b=da8BdblrZcLNF5ZjoHfW/yJETHS2aM97bgQuD/eNhDR2MBPfEagM7Vo3QkVvsQra4R0NLYTERjQsSLJKCggFQRxNi0X0wP/h2qoulQWl7dq5kPG7/X2PZ+8LpylwtA/AxuHldZHIPBJ811Ins3lzIVokSvmv3CNFLo0cCvTPznk0DlAI3tolGVKM8P3CjJLv5h8RYWjQujVqzKiz+PJV+2BZsKgI/3IWXloGAZPIM0QL1tbZcGKEWZYLHyRJbYPpMk5693vQBry5NV/imTpavt96sDAujEfq+0oAtymZWKUhMu2Y8PAJTQBlJnO2yAoFgkwO8sy+TQqiKurLc/pNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPjWrfvNt2Tbc1Uvv3IB3if8+YSTHyMS+Vhnt9u+/to=;
 b=Lpey+meoL5lcrZbwQtpHDR1TVoBgCyy8yhtdBcoRWi6J2521LobW4fcVE9hPa1Ob8XPSJwZDUCi7d5nYDXmKZu7Bl4qzQo7wACLYuz+ki7ZfYIyo9s8i8bWMV/5JEM4PUiMJeOTtgH5EqqzS1xWNcLnrLP3vPd3ze4tt2ndcvsJNaa1eoJlqZaTaB72B9p3wvIo48+7ncQwVxmU1lZ10dTTGNWLgbAHGjDukAy+JRazStSflSq1XqkqNK3doxr5IKeaqGxUW8gBih4Bve58PEA+1fbvYD7sgKScebfimmJb2R3cx/itYul5cnI5tl38cgW1y0Wl4WC7OFCWoJwnkOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e0838cf-8fcb-228e-3f61-6101c28bd5fc@suse.com>
Date: Wed, 21 Dec 2022 07:56:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 11/10] hvmloader: use memory type constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <24461a6b-b118-aad9-6407-d215d07a2924@suse.com> <Y6H0siXlkOwASOdk@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y6H0siXlkOwASOdk@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e902b8-57a0-40d1-b1e7-08dae3208d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YAjIakxj44aQP3Hys2ppfhFI7xngBLeK0VUMNuv6j56GKvtarpCCP1Z3iJJtrr1mYBvFc2gVCKB5njRX91ddf5dGek6fxw4eWw2Qle2Ko5Cuai76oKqbYJ+GpRPtpG6NtHw/A14LbnvOPY1WZBuuoOSBaxfZwGiRaySR/cL4kTVoZJjNIjLYrV7hMiiv82qakPhWUDSuOKZQcdTaAu9ngn1Y+DUJ2XAKQzah/qPQKeatUVhy/XYkVQjs+EgdGKX/TI/SAayuhyP5EY3XDh5oS1ClALGKRgseqso6VAt88es7pXxJhqKdTasnEsqO1677f11E6TS7J5slEDO3tuSMxX97LuepWOsUGSj+BZl28KTwai/MgaLjvV2gBLfjaFwAE7Kx01Crf5FnsmsqIc3EXn8cvEuDhGmWLppSlLT3113+6kZk57Uz7rcq9lJsTe4LX5a9vz6d4rxh+0S9c5mGjuU4G2R/HyV/sqmSQIX5qrPDd+AvpGXiXG9lxjJ5qEbC3GXwmTZ+JeQaZriZnNFiJNEpAXUZpLoyTp4GPt5xZlzvwIhuttIeCMUtJjqQp3udthx8BNswdo04u8o7eW8y6C+hWcoHx9GwSgxkkNfuXuf2CBdhUfqdGrAujZm6gsDu6G8G3lAYoK+nIuSCCx1Vu5e5U/raOvEP3zWJJzLK5l+nPg+POLAUyngGyNIDGJfTUT1UkihpInGdrZzDoZbi6t/MY5JF15kruEMIdBP4uyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(31686004)(26005)(6512007)(6486002)(36756003)(2616005)(86362001)(5660300002)(41300700001)(31696002)(8936002)(8676002)(66476007)(66946007)(186003)(6506007)(2906002)(4326008)(66556008)(316002)(54906003)(6916009)(53546011)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0c0NUQvc2VrZlROMThBTi9ITjVPb1dNZHl3dk5vK3l5RldXcUpGc1lCc2pV?=
 =?utf-8?B?bkc2QnpaQXBQYUx2WUtXeERjTzRwdE85eE5EbVAxYUdsKzNJMC9SVDYvTmlE?=
 =?utf-8?B?ODRkcnNUUHM3MW9zLzJBeDBvZFhORGd6NnNIQUJNeDhVeU9JVjYweEtOaVlD?=
 =?utf-8?B?NVhUOFdJWUtkb0pEZGFrdk1vVkJ6Znh3dHNFV2ZTTVFQaWdFR1ZnQXFZWnpN?=
 =?utf-8?B?TTVXQittOTBUNEhNdUNJZmxoc3lvTExoenpaZ2s0ejV0djN2M2NjUVFXazBw?=
 =?utf-8?B?VFBCUkRYVWE1QVlBOG9ZblliMVBhRllKYWxYTUV1dDArWFRUVGJnd25Hb2d3?=
 =?utf-8?B?OGFBZkF4QkIySlNQa0l4NVpONmo1bkFUOEFVOTVPNTVPYkMyWGRPQys2RUlh?=
 =?utf-8?B?dENEc3lDMWx6YWg5aThyaldGUldDYW1jaDRENkROM0xuQTlqeFJwRjhYOGVH?=
 =?utf-8?B?alhnT3NWNmNKalh1NExxQkI5T0R0RlVWbEV0ODVlWm9XNmhiVWpROWwzNVI5?=
 =?utf-8?B?TXhQb1g4bTlUeXkycUV6dEJsbkpkNFp3OWFFTTRIdEJLMHhsS1dOSWgwclg1?=
 =?utf-8?B?cUpHNi9FeUdkT0p2UkpBSnpTYi9RejMvTVVWMHZsWWwycWRPZlMvN3poeENQ?=
 =?utf-8?B?YzlQU0NVcDRhZnAxaHBXMDhHaG54UXZjd1NvM21adkdySTN2VTdYU2lTU2Vp?=
 =?utf-8?B?VWxGeFlUVk5mZ3hzRHI4ZURCMFpzdmt1TXREQVVwMWNucGVPZGJpVFVCN0Jq?=
 =?utf-8?B?Vlp2UXVvR1hoWFhCUmNjVXRGUnRhRXF6akdrSFkxYUovTHRFWHI2UW1Gbys2?=
 =?utf-8?B?MzZmcjUwMTczaiswSXBZR3VZTHJETnJLZzB5SUgrMEtKd0ZnekhwL0E3Mkxl?=
 =?utf-8?B?bTBZRUF3T0dmMEFweVpXaGFxTmhYMWJOaG9vaTFXKzJML0s4M1QyK04vaW5q?=
 =?utf-8?B?Q3BieEVRRTJZTWcvcXZGcFVnNldRSXZLOGdtak95YTJIZmcwT2Z4QXAzVDMr?=
 =?utf-8?B?ckw5Si93bHBFYkZzWSt5ZkoxcVN1UC9saWRtYlF3RDAwOVJaMVZDYStYS0gw?=
 =?utf-8?B?aEZYajg2dU9WU0R5YlVkeC9WWUZXNUtJU1VIblhsalM1dlM5N0JLUnlhbVlT?=
 =?utf-8?B?MElONTdlN0lybUpLRDlBV2o1NEVTejMzc05XT3hoT2xiMnFiTmxleGhvcjlP?=
 =?utf-8?B?aEpNUk9xenBVdTIvODlFYzlRY0RCRkhNdGxIN3hqVjEwbGIrNmRrT0QvcGxG?=
 =?utf-8?B?dU5QWlptbXdLbEtKNGJVbTNVSTB6N1dBMHJyTDcwZG9oalZNRjN2eUxrNU1G?=
 =?utf-8?B?azlyNngvbTBNdG9IK1FHUGoydTNRMEJxS1FSTWQrOGNrUTVsbG5NdlpkWUtu?=
 =?utf-8?B?ZS80QjRjVkVzcjhtRm5rSTZPVnY4alZpTHpTTFFnM0xSQ1dUbDJ4K3FGcXpP?=
 =?utf-8?B?VUV3RnNhMm0wNTVYM2RpVlp4U2xkOVN5R2hia2krTmRPUWdtS2xreTg4dFlF?=
 =?utf-8?B?S3RGMUF2KzQwMFlJTzVTUzN0Y3k2cmg4R3hKOEFSU0pDRSt5d2VMRkhNQSsw?=
 =?utf-8?B?SlcreWZwSHEzd0tUekJWNi9jMDJ4WTVWaVRVM05aU2dFcDNKRWhsRDFUV0li?=
 =?utf-8?B?ME1McktmQ015UmZjRllnVjFuc1UxeHp2SFhUamdUSWVEN1pSa0ZoblRPNG1V?=
 =?utf-8?B?TDVvRSs4dUNTQVFYMHFvKzA5cWdCMFJPbWZPcFc4Z0RxZWJIek5lMXU0T1dh?=
 =?utf-8?B?cnVOWWdKUm5UWTNESW5iVHd4S1I1VXFKcVpMYWlXN00razdZVXd3MzVEQ3JS?=
 =?utf-8?B?NHV1TmZkWngwWVJkL2UwaWJkT2g3VG5uNHNiV3FsaUVqSVV6NnQ0ZHdDU3N2?=
 =?utf-8?B?Nmt5WFN4RU8zZ1NFRklBUFJQUlNxOEljdEFta3I0Q0NiSVdxdVNKM2lyRGZX?=
 =?utf-8?B?a20yaWQxTWJXYmpWa0lNNGRUSEgzU0Y1ME50c0Vqek1aQ2lNZDJ4QnQ5dnls?=
 =?utf-8?B?djBhY3ZrVnNMTEMydldNeFluZ3hZNFdkdGlSVlpzNjZmTmMzQkQ3MFZ1bCtx?=
 =?utf-8?B?eUFHMENsT0Q3WC9VVm1PY2FaNllEZXNUK2Z5OStBSVNRMVBxQ3JrRzJwOFZE?=
 =?utf-8?Q?I+xFjYFs/LZXacKLF8pU//hg2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e902b8-57a0-40d1-b1e7-08dae3208d0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 06:56:57.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1hBejCbjOurCaUPvMQ7g7qf/bW9TtWRbUJ7Umpc801Eb8Md9p55xKkEO1sElkKdxSny9gJCxnaV1cQzs9NP7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

On 20.12.2022 18:45, Demi Marie Obenour wrote:
> On Tue, Dec 20, 2022 at 05:13:04PM +0100, Jan Beulich wrote:
>> --- a/tools/firmware/hvmloader/cacheattr.c
>> +++ b/tools/firmware/hvmloader/cacheattr.c
>> @@ -22,6 +22,8 @@
>>  #include "util.h"
>>  #include "config.h"
>>  
>> +#include <xen/asm/x86-defns.h>
>> +
>>  #define MSR_MTRRphysBase(reg) (0x200 + 2 * (reg))
>>  #define MSR_MTRRphysMask(reg) (0x200 + 2 * (reg) + 1)
>>  #define MSR_MTRRcap          0x00fe
>> @@ -71,23 +73,32 @@ void cacheattr_init(void)
>>  
>>      addr_mask = ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);
>>      mtrr_cap = rdmsr(MSR_MTRRcap);
>> -    mtrr_def = (1u << 11) | 6; /* E, default type WB */
>> +    mtrr_def = (1u << 11) | X86_MT_WB; /* E, default type WB */
>>  
>>      /* Fixed-range MTRRs supported? */
>>      if ( mtrr_cap & (1u << 8) )
>>      {
>> +#define BCST2(mt) ((mt) | ((mt) << 8))
>> +#define BCST4(mt) (BCST2(mt) | (BCST2(mt) << 16))
> 
> This should include a cast to uint32_t, just like BCST8 includes a cast
> to uint64_t.  It doesn’t have any functional impact since none of the
> memory types have the high bit set, but it makes the correctness of the
> code much more obvious to readers.

I've already followed Andrew's suggestion.

> With the suggested change:
> 
> Acked-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Thanks. Since I've addressed this differently, I'll hold back applying
of this.

From a formal perspective I'd also like to point out that an Acked-by:
from a person not being maintainer of any code being changed by a patch
has no meaning at all. Only Reviewed-by: has a meaning (but of course
implies more thorough looking at the change than Acked-by: does).

Jan

