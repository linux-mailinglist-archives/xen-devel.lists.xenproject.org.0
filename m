Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027864C875
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462163.720347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5QLA-00027Y-QQ; Wed, 14 Dec 2022 11:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462163.720347; Wed, 14 Dec 2022 11:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5QLA-00025d-NM; Wed, 14 Dec 2022 11:54:24 +0000
Received: by outflank-mailman (input) for mailman id 462163;
 Wed, 14 Dec 2022 11:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5QL9-00025V-OI
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:54:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2088.outbound.protection.outlook.com [40.107.6.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bbfea64-7ba6-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:54:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 11:54:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:54:19 +0000
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
X-Inumbo-ID: 0bbfea64-7ba6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3GdCkrtDMcs9LUchMF3+0VnPydSYfi2vPpC+7/Pc0+foGlJqe6/HnoXecfE9oRdAoi+z3ErXIankJXscPc/3zteRzzJ6aTI2lpgNsS7Cd70XCLXCHdKoSUUdilyS+1UL/tqPcNiunSHG+JpmK+BlHzN8uv8ip1wNSYetpaSFHzEeGrnDjMGqxOcWb+/3duB8t/9OMFGHdP6cWiuHQvhp1W1+nh4Vx2v+JDNdWm7jMh2XrG3hNtcvpEAyXSHmxDeyEDl967uAML55I2DXqsZXV0uN8KtT3mMJWUIhrEHjktQObYRILMVWxdgevhBIoFa7QuUpc8DDY25HBfvGz49eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qdv8Na738mTutxaTQ2Oa+Hb/dUEQRhluANPt31YL9m8=;
 b=T8gEZWlCXGKV9wexlFaNIbbjp9p9721oZJDUTdZvqWA+qqOEc9+m5236jWHZuyiwLhVtZqfpaoJyOUtoBUPZuogXD11ol/Dy5yFz7fQ5bMyFk9wFBHDJ24PA5n0ZXRq2WsBurS1GKgLeiyyp6MJddJ76ctC1Cd5KVBkD6nJFC1YpbDqksxqEKuilhqUSLaM84Ml353mPRU0Xe3iET1PxQdwJVvWKzsXHocXi98rVsdNierzKyVPcxTYTtqXaZn2xghKdMOaXPlmimb09bpQyfwnAo3O7YJKBXAndP9U3sSbQZtmYAQ7UUpTPn8Xg4FGZC4Yn1+hYJ9tM2lfomDs2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qdv8Na738mTutxaTQ2Oa+Hb/dUEQRhluANPt31YL9m8=;
 b=laFfJxH9A0icgef924Wa9foCloIi0zRgCuYmd4yBywMW+J9uOlfJmmuU1IteE1fWQUPdh/MyCAUDz7cxy6ePn1SAZgevGUH5/zJUK/6z2bZXEEP5LHeWwJ56nhjLUS85GpAyWGdQL5Irq0Y0Rvjxnpz8bmvGMeLOwV1qNzGquRwMxHpIQK44oWydEVjsJ+VJHY2Sg0T03NjmECwb1ZggbvnvBnu9q7xXWjgEFzQjSRj41yGINdqPrTz1QctxaexO7OeKik6g6ergfTIrMObWmRDgCjpeC0RHtcy2ftTKMktzfsKJgAWvnq7ZQlpfzAO6jYuWrayNndQ/xXtlmlddCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <933cd359-7b79-0261-825c-2b5ca1c7a917@suse.com>
Date: Wed, 14 Dec 2022 12:54:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 08/14] x86: Replace MTRR_* constants with X86_MT_*
 constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
 <fec68f62fcea8fe7f6cf6e7963ea4c6b30ea5166.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fec68f62fcea8fe7f6cf6e7963ea4c6b30ea5166.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf517bc-54f9-424a-4c17-08daddc9eee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DScNakBsFPDd8ImarjqlRLTiD8xT7z7NkYb14R+qAsMbBnedQMTh4o5+3Mcq5+ow1oQ5l4/OhM5nFYn+JvSYnn5z6h1/Fbttu3LRsAdvQUtgBqd9fKjYSgpD10VfNZDQBPGFB0Di8HgxuPjntboj+GOlxFqpuqn6jLpkzkgTlxOBiKJ1Nk2wJA70oLIVbwkCyMIFyJePynjfx/VH/8FdqeVN6wYCC7w/vNOf+MxeOaIN7WeRGS0z9Kk7jwxCzqU9ejZ0PD0pPxF2QRsfvU0g7s3cgJNlrkpPd7Pt4HDaZkFVQY188ZOwfjWkf95XEzssckUXnnrkbrDSjdKI6DYpbCs/CURc0hdBKfhYNCvoUIVtZ60VTmYfWL/7QkMhQa38jJ4oxsbD7BANgr8B6xrXUSFccuOmKuaRDhz8cya+moLghS2AgqEWa3QwDnuIIpTdFdTvqVJyIt5SJoLMjGyInAK3bVbdhNemy2hAyUVmpqcK1wJ4pxHc+gt5nYXJZ3JioelLvPKa/yikV5liTSdeR7clVQpmfFHrEjyDrof+MnhEuucJ5nGeRjYYVtln0DY55LBEH18jCudUsVKEhgEx4g9lLnYhyKmKs9e7tPbx/jdyEXMGUBYQCxMV/RV9jYvbT5UZzzGG3ylSzgORILhhF603kTA9VEfGDuz2EIJoqXfD8a/dwRdFI9OAJz5C7SV7+quPxrHAO/XgJ+PZEQsNAkoKWWKe73yB0zQTxD3ykms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(31686004)(2616005)(86362001)(31696002)(6486002)(54906003)(316002)(6916009)(36756003)(53546011)(6506007)(186003)(26005)(6512007)(38100700002)(8676002)(2906002)(7416002)(478600001)(5660300002)(66556008)(8936002)(66946007)(41300700001)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1RPUzJWUVFuTDBBVTVZK0FadHVQRm9hODRlcVhXTi9ocWxhY3V3TGdWUyt3?=
 =?utf-8?B?eFRVRjhtUnRmTzBMSmc2Rm1TNFBMOTJhQ2RPY0ZMK0s5MlVHY3JqdGFHNEJw?=
 =?utf-8?B?ZnNKOWtHbnl2b1R0RFdtZmNWWmd2Ny9Wcmt2b1NoVGcxY0lYUnlHRmw4Y2xP?=
 =?utf-8?B?VGg2NmVLTFQzbWozdkJtcStleXZmYVVndmFZWUVYUkQ1bVlzQ3FSZk1OeStL?=
 =?utf-8?B?RVN4cGk0VCtqWlV5MFNVaVNwZ1dOSkdrNVZJMzFLQ3ZVbyt5M2Jxb3NwZS9v?=
 =?utf-8?B?NHV2UjFXdkVraTNBWnhuZ3JKeVM2U085ckw4Yzg5S01jck1xYWozbGlQYk5X?=
 =?utf-8?B?UzVGOFJEcVlOSmdUNTVOMWxEbDV2bGR6ZWpUSEpleWd4V3JwakFydER1VFlB?=
 =?utf-8?B?YUd0YVVWYkVXYmZpQU9ZZkYyVDFCRklXLzVSUzFzaENEK09iRm5SSWZUM3VI?=
 =?utf-8?B?SGttZjhWMkxkMXVsak1vOWRSWWQ1M2dod0pIT3ByMzQ1eE14NzEza0VBOElN?=
 =?utf-8?B?c09nL2UzOTREdERqVnBaZ0FHWHZadnRjcmw4Y3prNElVWnJMSWVhNlh6NHNp?=
 =?utf-8?B?dy96UGozTC9VY1NGRk40Qkt6dU11SXVhR29vSnRCdVphSzdUdHZ3ZDNOdmlp?=
 =?utf-8?B?bC9ZaU5oRjJqbmNkNUR6emhFQWZkMzJOeFFPemFYL24xbDdYZ0liTmR4Y3FG?=
 =?utf-8?B?Tnc3bDRRS1JmQnkzaHRtNnpuNEVnM3d1OTMxZ0ZmQWlxQ3ZCNTFRc1VOL2Vj?=
 =?utf-8?B?N0VSaGxwampmMGxBcmRBK3ZZdmRWYTNkaFN2OWpFV0pCQkUwOEtXck9wNHJk?=
 =?utf-8?B?QUVLUlBHMGpLQnlidkVRbHdYK2JvVURXOHYzZ3Jqckw0QzRqQlVUVmFaQVNH?=
 =?utf-8?B?dmJMUEw1b0JES3NWTVo5Zm8wTmEyd0hxamZ1N2REdVFXeXU5SUQ4N3FVVGdz?=
 =?utf-8?B?ZGV1Vk1CTmluTkVUcm91VnVRR1FUWjBCYU1GK29oYzdzMWVmay9EYlR5c1hk?=
 =?utf-8?B?R0w0Z0VzSHZpZDhMRXRadmE1b3ZER2R4OGVBSzVmejM3dlBscUR6dS8rZUh5?=
 =?utf-8?B?T0M0Um5DeWlHbHA3U054dDFyVDR4aG9BcVlyNW9vUUl2dll6WG1nR2FmVGNL?=
 =?utf-8?B?czBFWm9yQ2pUTDltNmVRZ24zbzBSMldHUUV6VUxCQ3VSSkNuZWVnSktETnRC?=
 =?utf-8?B?R09TVTBCdGJGMUlmWXdSK1FEZnFRQURRR2xPSElySEZIaUhadkRiamZvcTlY?=
 =?utf-8?B?MTNmMlcyYUp5bUVaem9IbWVDUzByWHNRUmR5MTV2SGFwYTZDQm5lTG5KYVUx?=
 =?utf-8?B?a00vMllLbzR0N3I1S0tIOXlwUkdEUkFiQmJleUREYUJ6Y3NPMitIUWRhMFVn?=
 =?utf-8?B?aXpBUCt4bzkvNnFjd2MzYWpyNGpyTUQ1VExlRTVyNzdEdis5ZytHVFJ2SjZx?=
 =?utf-8?B?Zkl1bTRFVkZHbVEvclJlOHlGRmhBZGZhTGNIWjBQalRRLy9GMTlZRC9xQWh0?=
 =?utf-8?B?bmFwQTFFalVaVWRLaHJ5QVgycmZ0QTdkcUZuZFg5c2pGU2Z5dlRHbHFIbzdt?=
 =?utf-8?B?SGpQUjdGU3F2OWxidSs5dlNPVVcvbXJpMjVSSjdmaUdOUVNNUlY3dUFQNGFa?=
 =?utf-8?B?NGJwNnZGR2lWbmxjM1pPS0p4aUM3SHRwbDM3d3UvdEVwcmZwSmRoRlJGNUJY?=
 =?utf-8?B?NE9IZ2R1VFIvbzlCTlAwUTFhL0wrRmpGUU80ZWFuZXoyRzBjbHMrNEUvZjFJ?=
 =?utf-8?B?VUNRZzFlRUdWRm1ZL1lYbm95WE5TcGNrQnQ4N0s2V2NaWG1uSDBoUEp3SUZO?=
 =?utf-8?B?QVp5REdlUS9TK2l1REZCRXJFb2FzbU1xZnZnTjVmTDQxNmVHSE0rMHZUMnRX?=
 =?utf-8?B?ekFRd2FQS1RhS2tzU3RZOGlkQXVSNU45OUNNUjVTeXNqNmVTU1pZS3B5WFQw?=
 =?utf-8?B?WWQ3WGgwT2xtbkw2WTVzcXNsYzFYRnEwemJieDRRZVRHRzRCS1BtT1FvcE1T?=
 =?utf-8?B?cjVQVzFISzAvbGdBeFhTSzNKSUgvRXRTM1UyaUVzNU9EUHRoRTJhcFhYZTd1?=
 =?utf-8?B?VjBXblZkZE5jSjFVTWM2VmNINStvQzBDYVJmTlJDc1VSNTZiWnBNaTBlczhJ?=
 =?utf-8?Q?1WuPltV3zCw5vYgIZz4SuGjyN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf517bc-54f9-424a-4c17-08daddc9eee0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:54:19.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQE4ALaxZ7cmPKLEBH4NCdJLDlkOBAkPYX0/P3ZSt5NMk39Q3C0zIlmSQdU6bcUgV/uvByMz/iFhduzgVeybGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> This allows eliminating most of the former.  No functional change
> intended.

"most" would be nice to accompany by what has to stay, and for what reason.
Is this solely about MTRR_NUM_TYPES or more?

> --- a/xen/arch/x86/include/asm/mtrr.h
> +++ b/xen/arch/x86/include/asm/mtrr.h
> @@ -3,12 +3,6 @@
>  
>  #include <xen/mm.h>
>  
> -/* These are the region types. They match the architectural specification. */
> -#define MTRR_TYPE_UNCACHABLE 0
> -#define MTRR_TYPE_WRCOMB     1
> -#define MTRR_TYPE_WRTHROUGH  4
> -#define MTRR_TYPE_WRPROT     5
> -#define MTRR_TYPE_WRBACK     6
>  #define MTRR_NUM_TYPES       7

May I suggest to use X86_MT_UCM here, matching the transformation you
do ...

> @@ -1426,12 +1426,12 @@ void ept_p2m_uninit(struct p2m_domain *p2m)
>  static const char *memory_type_to_str(unsigned int x)
>  {
>      static const char memory_types[8][3] = {
> -        [MTRR_TYPE_UNCACHABLE]     = "UC",
> -        [MTRR_TYPE_WRCOMB]         = "WC",
> -        [MTRR_TYPE_WRTHROUGH]      = "WT",
> -        [MTRR_TYPE_WRPROT]         = "WP",
> -        [MTRR_TYPE_WRBACK]         = "WB",
> -        [MTRR_NUM_TYPES]           = "??"
> +        [X86_MT_UC]  = "UC",
> +        [X86_MT_WC]  = "WC",
> +        [X86_MT_WT]  = "WT",
> +        [X86_MT_WP]  = "WP",
> +        [X86_MT_WB]  = "WB",
> +        [X86_MT_UCM] = "??",

... here (and where I wonder whether MTRR_NUM_TYPES wouldn't better be
kept).

Jan

