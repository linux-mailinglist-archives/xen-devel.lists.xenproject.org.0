Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6064C827
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462145.720333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q5j-0007cL-EK; Wed, 14 Dec 2022 11:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462145.720333; Wed, 14 Dec 2022 11:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q5j-0007ZR-AX; Wed, 14 Dec 2022 11:38:27 +0000
Received: by outflank-mailman (input) for mailman id 462145;
 Wed, 14 Dec 2022 11:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Q5h-00076G-O2
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:38:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ad208a-7ba3-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:38:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 14 Dec
 2022 11:38:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:38:23 +0000
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
X-Inumbo-ID: d1ad208a-7ba3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4Mch/R7mxTNxz6b9oVQKETC5oBszEvkgRd68YZ4nSga0ucQbCN1P/0buCb9R31JPFUMuER0XcByBbfoqq+zScHn683cGnEHsAWVqszyEPrQbk/PiOTbxss7HnurFyh0i4gD/G4WnD0C2jtKxnXp/bPTtNVRO57r8L5OlujpDBvyfTmUkEy5POBFUkQHcnsrEvrgAfR2/7CM6nDa3dOr7klVXYwgaKLURly9nNAfLbKcik7CnfO009Go88OX3pMh8/B2kp2wmPaFknJYMX+62QsitEZERiD9NmSUtbIkMnqgkmhziYwehkufUhcHJuxX8OLQNY7AiX+hjFutRsTXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oucn5LEDRW60YoGzgSCT9hN8TSmGKPLzZU2HJpdsSEk=;
 b=ObM+w7/WVJHaqmyy8P2Rzmr9eRUJ0MVLS9iXJy596AyTIx5Usmr75W+TmXDrQvHoTM7wg0epk5xUHIX1gexflKGwC7LtvrANY/JNYsAWofR4QocfYWnEdSGmi1thYfsfHi7DJLusXhggSghZ26YIyKRAX67pWbsx52gqz+ONbV5/8uSJSe1PCECcbedL30+tOEFm1/B9TowpG1bBuzpNCS18ISJnAiUR3aCNhJsk1nc2mo76lWd0gmbIHBSAFxs6oejvAwjgUFyknR8VyiZNH6Hj8ZbqPou/Y+RsK2cAi3NYqgchZ0tVpZeo85cqb2kboDCUUQtct16P/iDCNnC0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oucn5LEDRW60YoGzgSCT9hN8TSmGKPLzZU2HJpdsSEk=;
 b=mFmVEJzMBUpsXF800CjOIMtC8yqjwX9uPAymWvjm4/nadbEqw+FRtNSfI+XHLOZYIW31IGApEuzKk8mxX6LOiD7HQ359j11NA5ioNI17UdeaXFXwXnH5FEVbatB4Hrc4e6TQEmirw8v+tvHBC/UFLjGWIaG6Fh97cGceZFjtsznMwVWoXCIjRw9A8kvNsyjlcXMDHL2/ota7csfzFrUgE0koah1AYBs2sqVxQbabwa/jykBk0SQNfaA4jrbgJgjyDx555vuxEQS7IZJ85SNRa4Hld5rGp416Q9CsYwgDe51PzZUziEyjZVj5Ji1prXkIxYjqCZFRvUpJHEjWYKq/ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a2a9b0a-7227-f4ce-ff79-23aac151b895@suse.com>
Date: Wed, 14 Dec 2022 12:38:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 07/14] x86: Replace PAT_* with X86_MT_*
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
 <7e961ee6d14f52182b023369b770d7831e006783.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e961ee6d14f52182b023369b770d7831e006783.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: c77caea1-4787-4f4e-99f9-08daddc7b4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NUjME6fviIovNu8bgPs/3EvOoZc/Nwla/ArVZERXi6ogMBcGfQffG645KJgxpecVg1lQMLY+RmZLtYRNQUOIb7yaUQsOCMSbARNSqw6ZZ7taIMyohTTE1BoYsB/ZOEC/lTB0PDXcu8d0Ypyxcm6DKrC4OSVhdl41berI7JLniPagOlsHqAe3ZU9P6Z8LX3+jf9XxAhGk3oWxkzMN5iqcfsNmxlGWmNaThQ3xSVQzygdtuDnt+ykKQBPkhhjxWc8zBgo/YF9vwXXdFAQFjT1jrNEfOiwUqXl6il7XgzHrv2WTtiNlcuYD7Q6DclgBqGzbhvPkobzmYfKYtK2PJYEhACdL/LoHf1c1E+wCdFk5ZZC3cM5yq0lPDzik5qnetb7XuBeeX/uAE/D/V5aglIfKpbM4VWgiftR/xt+utYtXU9i+HnpgBKRHMYnnlRN5VFcV81XYbxtdzP5doo1YfSFrOSPKrMPZEaNNY6D7HyrXcFSfqP7LYD8NhOWpdymr+6r9vX/B32MbY7Qxz9AAmfJbxDKhnwO2X9yV18BVqTk34NgrCtM2XJ8gw5LhyeU7UM61IFXMn/64hc6zFeZzTLwLQzYFCb336WLnBRbQkZeISvAYMv3a5b7ykIKCdJAcDx/F7KyB5DgjKm8l9lXpdieYC5kQYHWYy4o7xBhOU4IkuuoX8XEljcBiBMGWqGnuZEqEK/OCIIVhFIvS2VdeJtNQ9dLkJLTug1mhblgLpLnzvmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(6486002)(478600001)(54906003)(6916009)(2906002)(316002)(36756003)(38100700002)(186003)(31696002)(6506007)(26005)(6512007)(2616005)(86362001)(53546011)(5660300002)(31686004)(8676002)(66946007)(41300700001)(4326008)(66476007)(66556008)(8936002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djI1MUl5c2FCcTJRL2dEc2RndEpwc2V1bnR2cElGcVpORlRSc1p0VVFsYUZ4?=
 =?utf-8?B?djFpZXU0TU1rUldEMG5vQVUvSzRTNW9GSmFHZ1JLZXlqOVVMK0dFcmZEei9x?=
 =?utf-8?B?V2c1LzEydVZlcDhUS1haNHozVEJ5ZTFMNXVCbHIzWk1rd3E4RU4zdE5Hcmdq?=
 =?utf-8?B?T1dMdE5mMlZTZHZDK1FhSjQxYTc4NWhuQTZ6RlpEM3BveFRsdEpxNkd6bmh5?=
 =?utf-8?B?NlA0a2JINyt0djI1L3orTlY1Yms0WmtmMjc5SDNqb1lTci9lOE5TSC9oUnFn?=
 =?utf-8?B?c01XQWxuNGFjaldGQkhNV005cVlGaGRJU2JLcjJpL29KOFkxa1Q0RmxHVC8y?=
 =?utf-8?B?NU9IQklmSkljT0xxRUR4Nm1iYkpQSVlpN0tOQjBUWkFaL3U0bHRyb25mczlD?=
 =?utf-8?B?UURmRksrS01oZTRVTHFvcHhpRVUvOGJWMExXZWtOTXFuTXFmd0hjMHFuYzQy?=
 =?utf-8?B?UGxzdzlFd04rbnYxMDRQR0pBUUNYampqUHVsdjJqOTlLUkpPMmxGcVRobkpF?=
 =?utf-8?B?STRudFdYci9WcWliczdiUmFLT1o0cC9nU3JrbFYzUFVKOE9MWEtDVVFXUkV1?=
 =?utf-8?B?RThGb09uVXg5QTc2Wmc1MTREOW53UVFqTUUwZHd6cVpzN3diTEpGSER4STI3?=
 =?utf-8?B?V1h4UGJTYUF3a2hpdVdkUVQ0azB5WGdLU3lxMG9SR1FXb0NMdUVGWlZQZytK?=
 =?utf-8?B?UW4ySmpVb09xTlhyY0F2U3htRTlzSlduVHFCSGpPdzlmY2ZBOWp5aFlrZHVu?=
 =?utf-8?B?WE96d3NXSWJ5ekYzTWd6THV4cUMyMmtTK0x2TWRUYmIyRlMzNDQrQVppRTRS?=
 =?utf-8?B?a3pxQnF1T1V4dVgrNDVkSktKNUc0L1FLcVZ6ckx6dGpnN3QzTXFjTDJxNzR4?=
 =?utf-8?B?a1ZsL2RxdmVGdVlHLzlKNlcvTEF3TzhxVEJWUXdRNS9KMVg2VFdtTEx0bW1C?=
 =?utf-8?B?VnNaWVBkWVhodGIyaGVHMFFwRURZWGo4bFp5YTZ6OW96cDVKT3JqM3F1aWFJ?=
 =?utf-8?B?M3QrNERzbldhNDExOTkraUc0SHdHS2l1aVY1RG9jTGJVVS93UHlKWGZQQmlz?=
 =?utf-8?B?ZHp0SnYyZ0Z6VVREdmVBdGs0K1owcHlLVlR4a3dZSTZ4MlpWY0htRGNWSGZR?=
 =?utf-8?B?VnBBWTJMdlY3NVNPTWtscUVpNnFCQ1hJTHJyMnI4M0R2Ny8wM2pjQUNYQ0Iv?=
 =?utf-8?B?ejZHNXFKU01pMEhOamxDU2RWcGVMYzNRRmUydVZ5czJTVm04VHNWQWVKdkFI?=
 =?utf-8?B?WENzaFNrWFdySDlRdjFUNStnNldra3M0UWxyOWdIMXRBS1FSM2RZbEQyVjc2?=
 =?utf-8?B?dldMbVFNSWNsd3U3UzVJVEFmOHRVTGY3RmExM1NWNTlvUGR0SlVQSjNqOVRK?=
 =?utf-8?B?MVdqeWhSLzQvZmVyZTJ4Sy9kK25ENi8za3BHaitkSDY4K1R1aEJYVTU2OVZT?=
 =?utf-8?B?U3l2M3lWMGRhUGN2bGZmS1liT1RzMjFPWURmVEFHbUtsQWhSRHNIbFR2cGhk?=
 =?utf-8?B?TjVXZC9CMnB2amJuci9WTjE0Qm9oZlkxWExUS3RHY045VkdNR2E5UTRpUG00?=
 =?utf-8?B?elBVVHdHZHc4cEpaV1IwY1ptYkRxRXg3alpyZEpWcEdpL3Z2aU16RlVXRjFR?=
 =?utf-8?B?QVYzNkVIUmpRUlUycGxXeUt1N3JyZ1VrcUcyWDhmR0dDRkl1OUtGR1pvelVx?=
 =?utf-8?B?eHk1Y2E0Z1F4SjBmeDNiWTZveE9Lc09zL2tldTAzU2ppUVNZVzJLUDRzeEQx?=
 =?utf-8?B?OTFzTjBVbHlLc2JXeE1tMHc2NG0wanAwakdsem1uMERhY3JWYTJzRkRKM1ll?=
 =?utf-8?B?QU0xTmZwei9jZnNMc3VCSlZIcStjelErdWhabytNVGV3R3IxNVRTOTVHZy9B?=
 =?utf-8?B?UXIrTDEzVlpqaHdadGx4cHY1SU9yaWFaQjdsNDlzdm5sRTByMkhhekM2ZUZ4?=
 =?utf-8?B?Wm1nby9oRlhzMXZ2dG1ZWnBya2VJN1VKSUpHRUkybnRBMlQ2QnhhS20wRXRV?=
 =?utf-8?B?K0t0T1BVYVBpVzdUckllRUtNa3ZoUGJSSlk3dWlpU3ZXZ0NSak5QaEt3L1Nu?=
 =?utf-8?B?bWpXZlJiZXhFVzRjMFg5bzQ4bmE5VGdHWEpPc0N4TW1YRkROYi8yYW83ZWdB?=
 =?utf-8?Q?UKoRUdyWMCNdFH23Pfs/L0Vrc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77caea1-4787-4f4e-99f9-08daddc7b4d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:38:22.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ge/WwpqAbLog4JlTOA+eRv5u6DPRk3Wr5DnVzZ3+ZllVDFPjBEnnYE0mKQN07NIV7hSzge3A7N9MBPoafFA4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> This allows eliminating the former.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a couple of small remarks (some asking for minor adjustments):

> @@ -72,8 +72,8 @@ static uint8_t __read_mostly mtrr_epat_tbl[MTRR_NUM_TYPES][MEMORY_NUM_TYPES] =
>      };
>  
>  /* Lookup table for PAT entry of a given PAT value in host PAT. */
> -static uint8_t __read_mostly pat_entry_tbl[PAT_TYPE_NUMS] =
> -    { [0 ... PAT_TYPE_NUMS-1] = INVALID_MEM_TYPE };
> +static uint8_t __read_mostly pat_entry_tbl[X86_NUM_MT] =
> +    { [0 ... X86_NUM_MT-1] = INVALID_MEM_TYPE };

When touching code like this, please also correct style (here: missing
blanks around '-').

> @@ -145,14 +145,14 @@ int hvm_vcpu_cacheattr_init(struct vcpu *v)
>      m->mtrr_cap = (1u << 10) | (1u << 8) | num_var_ranges;
>  
>      v->arch.hvm.pat_cr =
> -        ((uint64_t)PAT_TYPE_WRBACK) |               /* PAT0: WB */
> -        ((uint64_t)PAT_TYPE_WRTHROUGH << 8) |       /* PAT1: WT */
> -        ((uint64_t)PAT_TYPE_UC_MINUS << 16) |       /* PAT2: UC- */
> -        ((uint64_t)PAT_TYPE_UNCACHABLE << 24) |     /* PAT3: UC */
> -        ((uint64_t)PAT_TYPE_WRBACK << 32) |         /* PAT4: WB */
> -        ((uint64_t)PAT_TYPE_WRTHROUGH << 40) |      /* PAT5: WT */
> -        ((uint64_t)PAT_TYPE_UC_MINUS << 48) |       /* PAT6: UC- */
> -        ((uint64_t)PAT_TYPE_UNCACHABLE << 56);      /* PAT7: UC */
> +        ((uint64_t)X86_MT_WB) |           /* PAT0: WB */
> +        ((uint64_t)X86_MT_WT << 8) |      /* PAT1: WT */
> +        ((uint64_t)X86_MT_UCM << 16) |    /* PAT2: UC- */
> +        ((uint64_t)X86_MT_UC << 24) |     /* PAT3: UC */
> +        ((uint64_t)X86_MT_WB << 32) |     /* PAT4: WB */
> +        ((uint64_t)X86_MT_WT << 40) |     /* PAT5: WT */
> +        ((uint64_t)X86_MT_UCM << 48) |    /* PAT6: UC- */
> +        ((uint64_t)X86_MT_UC << 56);      /* PAT7: UC */

As per my comment on the earlier patch the casts indeed want to stay, but
with how you had the earlier patch I wonder why you did keep them in this
version (and elsewhere below as well).

> @@ -356,7 +356,7 @@ uint32_t get_pat_flags(struct vcpu *v,
>       */
>      pat_entry_value = mtrr_epat_tbl[shadow_mtrr_type][guest_eff_mm_type];
>      /* If conflit occurs(e.g host MTRR is UC, guest memory type is
> -     * WB),set UC as effective memory. Here, returning PAT_TYPE_UNCACHABLE will
> +     * WB),set UC as effective memory. Here, returning X86_MT_UC will

Would you mind at least adding the missing blank after the comma while
you touch the line?

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -573,7 +573,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
>      if ( gmtrr_mtype >= 0 )
>      {
>          *ipat = true;
> -        return gmtrr_mtype != PAT_TYPE_UC_MINUS ? gmtrr_mtype
> +        return gmtrr_mtype != X86_MT_UCM ? gmtrr_mtype
>                                                  : MTRR_TYPE_UNCACHABLE;

Please adjust indentation on this line then as well.

Jan

