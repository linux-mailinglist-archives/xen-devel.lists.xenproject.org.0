Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1DB640224
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451537.709297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11Rx-0002I6-UQ; Fri, 02 Dec 2022 08:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451537.709297; Fri, 02 Dec 2022 08:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11Rx-0002GA-Re; Fri, 02 Dec 2022 08:31:13 +0000
Received: by outflank-mailman (input) for mailman id 451537;
 Fri, 02 Dec 2022 08:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11Rx-0002G4-64
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:31:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acfa9f43-721b-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:31:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Fri, 2 Dec
 2022 08:31:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:31:09 +0000
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
X-Inumbo-ID: acfa9f43-721b-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRqvwtSLuR8u4Zd2nK63V/QY8kwQqtxohkuUUkIkB3f7xPf+C+eCk4E+9HL0UNcYC52r8X4n1YTBKjcQ7Lio5v692Kqtl6+qTamSOWiElsMSg/rBOD/F45lnnfrNfvDkz6Lc4HGwefQkEZPBhWNlF3OHVW0o8dExXgeU4NIXa5DlJ3Zt0N3J6zsYQyWUNVnxB5Gfx1CquspgO/ltg/mTslMZF581SSIGt8B4HFYFhsDcDI5p3dusustShQmZxvmAw+4ra/lRzF/0JOHWGKlALgoPo6cZZNmuukZO7SfI+cMvOk28SyGnrlkmQK3oKlG3Zd7GztTGgsLxcxxu2tKC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxbW+aRMrgEOz9y0LOeXrdsB5+rJ1bnEGX77qJbykfY=;
 b=h8bGZNuiehX3IPiThL9FqQ095sWh3LDIvqyiilPFJMKA9Vu8o9CLP32NUk1AVEEcOggFOcZnpquAEwDPONrrdNnzik0NmB1i4OJAcZKHp7usy+0Xd0ggk9+/CNX8e26k2BYOC8aNtSPOiu21FBD902pWl2Lyr6JjmT9Gi3jWcUMangD8o6xknPHAqNIKBeL2PmfWgLQoy/lwC22rXUjDzz4227yFyG1zb7z1lraFeKBUbS1Sg0jw3w3h/ioqRc6t3LL6pM/qwPoFEItBqRJ00eh6L03xo9mCf4KSHKxu//I5zrcD964quW3Bmneu5V/LoWRvneMSXKa+V0i2+LC3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxbW+aRMrgEOz9y0LOeXrdsB5+rJ1bnEGX77qJbykfY=;
 b=40o3MTXETZR/CHgoSjzGILtvL3xIKLjONpRIBRQnmPgh3qx3P37BsG8qcNOOlMkKmRv4uPSpgvafOppm49rawkGWLATus0vBphAzpLVuTc0shncXYrrWWEuC/vp6vNrLEf34Y4Z8L4V09q2p4qnitVuUoLXl3oa8G4nlQiqfVeg/l2+T0/Kl+X7uaYpFSKAluE4DJkRmutBBTSkrzMJ8dsPFoZUre5yzvcgr0JDInU9+XbjELDsB0XqQrX5lBYL4Qr1bV/ps1SWU5WvLnEJcM/3063GyUZIArJlFGuBpCWPF6q1L/iUjoGu3DtP52nVLoyiOlVPFKTo1t6V7xN1Mrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d974a8-d463-9362-8b6e-cda1691a3464@suse.com>
Date: Fri, 2 Dec 2022 09:31:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v2] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used to
 shift "unsigned long"
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20221201181145.45279-1-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221201181145.45279-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 38865847-e8fc-4b3e-d487-08dad43f901a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7PGMSXawsIh+c+vwOHb+UiD25zfi35QmRGkx45uLdjsaWWZu1WV81p64b2yax4pKcCUIzseQlAImWpodQE+wrRirsWBoOFj9oYT7YN3/6hf7T/CpH0ucGe55Q41rFvXb3ZFU7QuCV4ERuZd5Yy6tjFU5o29kpNn0ghJOw6e1dbzW7uH2ju+VKbnYxwbt+rqfUcQBpBcaZJhB6BqWeSAxq3Qs3kdcYKos6vSRANxagce9Lfn7WZ1oMWEQ8DCMZigbyD+TsJ0hT24A4utOsIrxfGyKWBbHUha8gjOF/13Z2JhK468/wcx9iN+0rohWG/jRsDB0b993tRSTYo2UpPQc2WEUHeN+tEaXqhnpqHkiIwIQ1aARm3jlE41TFtiPXwHnqrDdnhr8AYkhocBmEutbaJNscOqHb9L7MiBdRPaZL5/e1qxcf0tgqW7haF/f2619jr5qcEOZXCnetlMEQzDVMdjhg6rKGzlQIlUprcjjhfk1nPplYpf1+zB19ScGh/dgfGIn0a5IiMiVOWGj2rtWNtqPr9Dcfvgl6PZGQMl4q0mEZ5J9TPtG04EK09GG5j9jl7/UaO6fhYOGxvtAFqWAstAKgKcZiFsyy/M9RR76wJQRUXa4DOHMVrAEu1rYCh9Ai1kLKxAlDy+AC/DeFTrIv3Jh34P5eobOcSxt/Yc9yWGVzdNcG2piQH+CKAdWs3VEplMnECC9O5qIitDf2RAMNyhjC4dJj8Y3bICAUaR48Jg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(31686004)(8936002)(36756003)(31696002)(86362001)(316002)(2906002)(6916009)(6486002)(478600001)(6512007)(38100700002)(53546011)(6506007)(2616005)(26005)(186003)(41300700001)(8676002)(66946007)(5660300002)(66476007)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk1Oc2Njajg0RHR5NmlXbXV2czZNTFBvUzg5TzMvUmxvU2ZXYmFEWlhMQmR5?=
 =?utf-8?B?aGFvNU1qZU1zN1JJZTRJZ2pGajhlamswaTdlZmowcjJWa2hkQitOcUR6c2VK?=
 =?utf-8?B?RmROUTJSc3JuTUk4RWZaQ0xFR3FIb0tobXcvb1J0WmJORWxPTHNUVHJseElS?=
 =?utf-8?B?clpONVZMQUVrdUFDem1lOWg3M2ZCaHFaQll1OVRvMlZ2eDVWTFY3dGdiVXpi?=
 =?utf-8?B?TTg4OWVhTVVicVc1T1F5aEpLekpqd3lRY0IxNmxDM1BnNU1FYjhSdTllOVBl?=
 =?utf-8?B?NFhEME4raHhkTlpIcHh4M0tsVEF4YVNGSU00MW1tbzg1MDdMU2ZkR3MrM2Jq?=
 =?utf-8?B?ZlRNaVZVOXFWV2ZhOVEweno1MnUrK0ZQUHpWWExSSkxaU0dUMWdmdjJtSlBS?=
 =?utf-8?B?MFJlcUQ0Y01OWFM0OEVPMjRTcWdwR0J3dUlSWE00OENGNzBPZTNmS1EyTEFK?=
 =?utf-8?B?ZmNHckthMWNkY2MyRVNqK0ZWeHRKRWh3amJBRFBQZzJsamZEenE4VHdDdzNM?=
 =?utf-8?B?SEJXTXhzWWZ2OGVab3JabE9zdXVzZzZoUFllb0lSOGgyU1luYUg5VnptMVN3?=
 =?utf-8?B?UXZRY0FXME4yQW95SjZDNVFWSUFCK3c2ZXduVmpGU0ozVnlUeFpQOUxiVWdL?=
 =?utf-8?B?UkRsSFRiNXJuOERPdXlYbUs5MGU4Tk83bzdzNHN4QXFKWnM4dk5EUEo5Z0Rm?=
 =?utf-8?B?dnJuMlkxMnJmR2c3QVJEYWV3eFBuc2V2bkhmV1RvOUhQSUpPeDZmZGFzdkdj?=
 =?utf-8?B?WTVrY1hiTFdRenY5Tmd3cGZxeExJcEp1aEVLakdOb1RTY05hclhIT1VPdGUx?=
 =?utf-8?B?NElUUVBSSXVrbVF3RmRVV29hUlRJWms5OXI1WWtmb0tqL1pzRkdQdkpSYWZH?=
 =?utf-8?B?cTZYVHFQSzBIT0VqRnRuWlJMR0xiWHdnRjg4VEtUOXpGekZWbHJCVHJEWEJM?=
 =?utf-8?B?YVNVZnoxZVR2WkFkMXlUQmR3U2pJTWYycnpna1JWS1c2SGh3Wk44U3FLT2FJ?=
 =?utf-8?B?a2hWcFlQQWtyMFB4dURBdWRPTHljTytkZWJBdUp3SlJEVGtqekdmUUwxcUJx?=
 =?utf-8?B?bHlrSnJ6NTVybi9HdzFicVl5Wm9Xa0wzSTYyNVJ3Uldsc2JzU1luSkJzdzF2?=
 =?utf-8?B?VzQ0aGNSSzViVkQyMkRsMnZrRElOc0w4a0pKaWxQRDdaTm84RjdEWm5zcE8z?=
 =?utf-8?B?UE10QnVZMVZKbjN0MmRUSEtLelNTNHZWWEtwbngzUzFxRnA0T01pTEpmSGg1?=
 =?utf-8?B?RytpSy94YlM3aHJobWlrMVc4bW9KcmdVWnEvYkdRWVVLTHZxZFMwOXpHSHo5?=
 =?utf-8?B?blhMSDhLRDIxL3pvaXlmbmJva0NQd3c3elRWZFhzNENNSVU0NFNkQkt2a1R0?=
 =?utf-8?B?SHpLUGg3MVVLQytkSE9mU2Noa09MRFBSWXJiY3FjMW1mTi9qZ08rL3RuV1pC?=
 =?utf-8?B?MUYyYm1hYm40Z0U5NjhxZVFqODJPTE9aNUpTajRTblc3MDl2OG9RclJvL2FW?=
 =?utf-8?B?dFZCZ3hLdXlkOHpPNk5qTTNlbW84NjNRYi9QcjJGVStFVlV5V0srY3lzbDUx?=
 =?utf-8?B?V1JidGJnK0tsM05VSnNpS3czc3gvM3F4TnRhMUpTSzBDekV3Ym4xUllBNFJl?=
 =?utf-8?B?NGk5QWxwREcrbEx1ZHhTaVdSM1VQYVR0d1dzdG9ha0hoaWM5Z2lFN3hJOVpu?=
 =?utf-8?B?c0RLMUJKVm1XakczbW1DTGFUdHNzR1p6ZzhTS3gvSnlMWnZMeG5ia2lQVnNQ?=
 =?utf-8?B?MWhQa1JxdXdyQ2xXYWZsNXBhTHNjYW90Y3JmcVowalNQSnNLSkRYZmpsbTJY?=
 =?utf-8?B?aGFRY2hQMnpNcFo0dlV1bHo1TC9DWGFOSFFxNkJkVHZHRDRJcTc3LzR6YndL?=
 =?utf-8?B?bmhZc21ibFhueG1mckRXU3Z1VjdRWUJEcTN0Nm5IM0VmVnVYWjhrVmZjL2xI?=
 =?utf-8?B?ckFiUHVYblhLOEVWaXNtMXk4UWVzNnQ3clFZaVBkaDh6ZDdUdERuVGhUWXV4?=
 =?utf-8?B?aHRZZGh3c1FKbHVNN0NGaTVsSkRqV0ROTS82eWR3b1JkZUNuNVFEWi82RUwy?=
 =?utf-8?B?YWtEaEo2NTVqM3NGZXpRd3c2aUhjS0QvMThibGJtSnhZTmQxNEtMNGJLWGJN?=
 =?utf-8?Q?TKR/9ZOdY2NEhj87jduxFOpuk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38865847-e8fc-4b3e-d487-08dad43f901a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:31:09.3145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtXEtnbf5tStww535JKEGpp7+XKruCDCtJX7A5QrRMkIOzmj4ndcv6sojbgvnrKcQk8sgniFgKYhHjjKN+ZwiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991

On 01.12.2022 19:11, Ayan Kumar Halder wrote:
> Machine frame number (mfn) is used to represent the hardware page address.
> This is an unsigned long variable. We need to check if it can hold the complete
> range of hardware page addresses. To ensure this we check that the count of bits
> represented by 'unsigned long' added to the bit index of page size, should be
> less than the count of bits required to represent the maximum physical address.

I'm afraid I can't connect the description with ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>  {
>      ASSERT(!first_node_initialised);
>      ASSERT(!xenheap_bits);
> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
> +    BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);

... the actual change made. Julien, when replying to v1, already gave
a clear hint what is relevant: The use of (xenheap_bits - PAGE_SHIFT)
in right hand operands of shift operators. As relevant is of course
the absence of uses directly as shift counts, which otherwise could
still be UB (and which iirc is why the adjustment by PAGE_SHIFT was
left out in the original check).

Jan

