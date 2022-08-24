Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B594459FD18
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392746.631291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrGK-0006sg-AU; Wed, 24 Aug 2022 14:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392746.631291; Wed, 24 Aug 2022 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrGK-0006pn-78; Wed, 24 Aug 2022 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 392746;
 Wed, 24 Aug 2022 14:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQrGI-0006pd-7w
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:21:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140040.outbound.protection.outlook.com [40.107.14.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12545b56-23b8-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 16:21:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2931.eurprd04.prod.outlook.com (2603:10a6:203:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Wed, 24 Aug
 2022 14:21:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 14:21:39 +0000
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
X-Inumbo-ID: 12545b56-23b8-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk7jG52bFImnqjOd0z58SHaaqbnq6yVpjziX1LPcAYzeLWBBszX4TLECquVR7szZVptJwR4O7Brw1iUaEGjQnfNX72ZKoofN7ect/0CEJ/gCAzkpdnEwuxY36QqnpsxJzfuYOWASjThWPx+tGG0K3lIJ2uRlOLqJE8tsZ88p3OI84Fz5LUHFixWG0RNrDeRrHk5+qbXijyExEpow1mmmHwQ+w4uaVTQ6h3ZOynunCTp822+vY1dkDsLudV2KUr5ghSJ1zyYnAjoouVFYQGWM3o6FMaOUtgUN7f/qlO0wHmMErda90e0QnCNZa6NhI7inKqBbNXMP77WrvZcCUI9xgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HncmoGUauMg1q5GHgJGhFLsoqjjbYYa2O7UT1hOvxA=;
 b=VWm8+mv3eAYylLjSCDIYLDB/c0qqgfM7w7svbLwhBFsQGfbzQKb3hav6DlcQqDu0Y3UXrQHDfWKw8XAGKxv+BXwdj3PdGtu9BbVXV5v0J22aYflRCsdwPq0A8ribM0vHhNidEYtHfaTyH+QI356YFnHv+RpN3uX5UTIX0VEKVoRzC8mpr6LGyFhO76o69I4YcNZLBw1vP4HTGShSw3bY79m7FQpSsKNbz3bNFLKDS7H+H8XhF9awrPJwta3kbvVBM3Lt3jmBGhXPsXqPw1/M+MA9R3gK97HG6iRxlBqUOtyAlVelNEymlfexBYgjL6z9Ah3jAbLXkccVZHAOMuA0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HncmoGUauMg1q5GHgJGhFLsoqjjbYYa2O7UT1hOvxA=;
 b=HysIbsmUnU8Pm05HEq9Q7iq8ctjvUvJa0zlAjG/l6Vf8GMsrSnPvdY6KnweXFSRWaI41nUoHnDKuoDiJxgYdVP4fxoOC6DEys+7bZIvxj424uKv7mdHOlyW9NaBlnIreZ9J5g8yQW/IlkUjLcl10jJlGBNZJ+Xv6DN97o1QcGOhXV5PmTPPZOCn3yXrIQ/2Uw4PfDtHVrKsSlo2VuHb6BQGhB1FFqE2kk7G46yoBWnm8aRwr95P1Nv03KWFJNu4RmsRm8BgEzhRXLCaBFQ8JUVYpKXw2qeA5PKXaiZJgknwyAVPaOnChpPnWgSgTIpVutE6rQqIBOq20Am2OorIWSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a27627e8-9f26-eff3-c94f-0ffc7108914b@suse.com>
Date: Wed, 24 Aug 2022 16:21:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] x86/hvmloader: SMP improvements
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824105915.32127-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 772ac891-bcaf-4d1a-50bc-08da85dbf59b
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2931:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	reUrMC0V2U0hMjMGG9n77lajTIaSatRWSgYQmp/S1P6C0pq84YihzOju7vi+G0V1FnBwZzyT9KR8Ri5O9XZUkDfp/Fua/5V5YYwmD3il0z76cKkTpRdbn44POn51oAR29NZqT7r+S4780yTuwwHlr40ZhBqm1s7NV2gkKcndPqaNY/ACR7DJyPp8Z+2u5v5GMyHLSOjxTKYAuIfkJgh+AZyvmWJUG5utoNiWqgdmJXegbr/Kv8VVx5O3UAAKBL0eqjcIq1p+U2QYxnsqE7r2J6KYgs3360OVUz+Z+hcKDDuz9O+jZiRvs8nKB7i7VoRHElp2e2KiRhrBFa0Fck3T+Iqid0NEUGdALw6cmt6OFe+AE4t4IdlVpd0yt3ElYPQLT0LJX8U9JKH+j5qXw4NvB3h+zZWaiMGFwzSFPtIEkr34flxFKbxbuSTqJtJGcHrhqiA/N/iqtBGwvQSfoyoelz6utVbiKjklDWfHJ6q91CDL/AzVd0hxppm9eoRDBOWzpz5wWeauUoeIrzVCf10vybJUNA4f8p3EJSzuXqyZXzNnqc9hB/y1uQH4IrYR4oPbXB1ENocUnSvgFgCG2nMYXQlOmWCOX0C9P3dJGCz7AWYBexGhdAv0UWhweMaHi9cxZptDTDLmfZjg1rTN3jwO8DdLEXSNTO29B154q3HmLegM1JUc7ipFloak2IENrHb4qsVSB4X0JC3SBzhblL6sfTlzVTgmZ0Yu1uPNctdZ5/fm0YUqjVoo8jEIuguecS5Y0JqTfQIG7pa8RXVycUtN0Rq0K+ZRwCZdqFLrioUvpzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(346002)(136003)(366004)(8676002)(4326008)(66476007)(38100700002)(66556008)(86362001)(31696002)(5660300002)(8936002)(66946007)(2906002)(53546011)(6506007)(41300700001)(26005)(6512007)(478600001)(6486002)(316002)(83380400001)(186003)(2616005)(6916009)(36756003)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWlBNHJYVTBkL2ZBYkk3cVROckpobVhhbXdoVlNicUVNTUd3RVNIc1ZpMWN2?=
 =?utf-8?B?QlZhaXlQaXgwNlBvR0Jzdk95ZXBQckNxeGVhRlYvdTdOMHVIUWhsM0hmL05D?=
 =?utf-8?B?MU9EMUFCcUkvbm5pOFRqQzNkUEFkd1NManFUT1VIYnJFRFZLK3pHaEZvOFBn?=
 =?utf-8?B?NTVYeVhWWVczU1VLUzJOT1RKdzlZWGk3YVcrVDNXazRQaEw4bnVMMDl5bHJx?=
 =?utf-8?B?MzIxOVZ1TkJoSVgvckkrdlJhYWMvNlYzMVJ5UmJMV3FDSGRqM3ErQ1VCUDda?=
 =?utf-8?B?RnQvSnVDRTZwQTZJOEV1Vi9BT1lDTnphcS9FRUp5T29oaGE3RC9DYmJHUzBU?=
 =?utf-8?B?Und4VldLNXloS1FQaGllenpaSDY2aEVPUmdsZ0RxeXQ4QzlMY01pSkpmelFo?=
 =?utf-8?B?MzNwVml1S3dWeTcrdVNQbE5IbFNLMkg3djZpeDgxcmFWaXBnTHB1R1Q1WDVI?=
 =?utf-8?B?MThXMGJlVHBGbTlrakZ2eW5EYUE1aEJRZGlyTjJCMjJWNW9MMHZqeGo3NFJr?=
 =?utf-8?B?R0taOS9GYnlmUVRoN2hTRi9FaTRwem5EZTdQU1g2SXRCNFdJRjlaK3Z1VmlQ?=
 =?utf-8?B?ZlZrOUNXUDM3RnVqUmhPcitDTjJQckRzTUVVa21ubVdzanhNR3FrVXRQWmVH?=
 =?utf-8?B?WlE3YUQ5enNkSERlVVY2QXdiQWNwbTFySE1OMlhkczlIcU1lbUxrZGE4K09E?=
 =?utf-8?B?UjlZN0g5emlid2FWaEEvcHZsSmhabFhXeU1LdS9iWlVQLzFRVjhSV05YMXVI?=
 =?utf-8?B?NWFmYVM5OVBXbllXRUNHQ0Fyd0Zqd3BxS1M3V05OODdqd3MxY2pOSlJucTJS?=
 =?utf-8?B?RHVHN204d0VEd216TDQyOGxJOE14akRISDB6T0VvZ21xRmxGbEdGSlVIMVVp?=
 =?utf-8?B?cFMydEF1R01UMEhHTUxlVkd6VFdyZGVwL2Yzc0NSNlloTGI2cDkxMjBGVGpN?=
 =?utf-8?B?ZnVmaG5OOFFMdHpJQ1ZzZHRkVDBubi90YmNlOGtvUFZuZnYyTmNzajhaYUgw?=
 =?utf-8?B?SDBPSjJYUDR2L0JhYWdHeUhBNDNRNjZWNTJraE1CQjFVUGc3LzJCOXhSTnBm?=
 =?utf-8?B?V052THlRMk1IMFI0dXRTS1l4TGJ3cW1GV3RCZDNhUVM4UmtaR3RicllwaHQ3?=
 =?utf-8?B?UXNvTmEwWkRpM09yK2JVWVJtUmR2ZUhTMzZrcEZ2N3FZVmJheFh3RXlVYkFz?=
 =?utf-8?B?ZGVpelZJMFZPSG1uamkyQkdYZWFadmIyS1RMSCtYOEpSdFBkb3RtbFd0M3k5?=
 =?utf-8?B?NHl1WEJIdlRTbGFWcW44VVZUaVRTK0g4YXdhdmxYb0JlRlJZWGVrek9hTkw1?=
 =?utf-8?B?VUU0L3J4MWdaa1BubUFxSnNURDljS1lCSEZTejZnSGtab29zYm8xNDZYUm91?=
 =?utf-8?B?NWtxcUdHSkZCLzk0ZDNHOHNoZEx3UkxzUDg5ZmlyZ0pEZ2MvQ3g1elVyL2dN?=
 =?utf-8?B?K1UyVzQyaDNMSHRkemY0cFp3U0xOTDFxS0ZLekpIVkh3NHl2djBmQ0k4R2dZ?=
 =?utf-8?B?YjgraE5XU3VEelZSdGN4dFMva002ckRoNFBXVEJwQ1pOVGRRNG01OVJMVHUy?=
 =?utf-8?B?bmpGT01YWXRXMVRBYlBTRnVTUUxqNno0Y3hiS1Y2VGxvcTlmeDhZaUpmZUto?=
 =?utf-8?B?UmRRRGJ1MWkvRWZJK1B4ZnJEU0l0ZTVCT1dNc0hLdmpDWFRrV1QzbFM2YkZO?=
 =?utf-8?B?eVpkNy8xZnduRVlVVGpzK1IxcHZiMkV3ajhzNGdrRm9JSGxmTlVCbmpMdEo4?=
 =?utf-8?B?Q25KVDM2Mk5VWG5EaFVOTXNSR3dhcFdYV1hseEg4TVgzMzhqeGVPWGt2WTJK?=
 =?utf-8?B?ZFArMld5eHJ3RVdXVE1lclRYYzBaL3hLamZseXNvajZGc3hQbjV0WEw3UU1s?=
 =?utf-8?B?bnF5V1ZHYWE0cEI2dUN1SjF1Q2c3VGFqSzFNMnNTVUxsL045d2xwWTBPTFhu?=
 =?utf-8?B?RkE2RWlpMkRzdjNXaEJMNGVUOWZ0RGxWWmN4TGZ5UHJEMGd3TEV4VngwbCtG?=
 =?utf-8?B?RjVwN0U5VmFJOE8vU3pQeDBJdTRvcklxSTFlZUFIaTBNUUgrNmwwV0prMGto?=
 =?utf-8?B?VExrd3h3eHNObXNYdzlObGxwclRJV0lSeGg4OUIwU1VoOGprV1g4UjZGSHZH?=
 =?utf-8?Q?h6ZuUPHT2e5fWEqx/8JTCD32I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772ac891-bcaf-4d1a-50bc-08da85dbf59b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:21:39.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lrxuR78bfuvYwg+fC/hlAm8nTH/Irta17QkNuI3IzYvIgndyEz6FR0iFoSvSXGKFOSe6bN/8UNB94dZGQS3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2931

On 24.08.2022 12:59, Andrew Cooper wrote:
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -35,9 +35,9 @@ asm (
>      "    mov   %cs,%ax               \n"
>      "    mov   %ax,%ds               \n"
>      "    lgdt  gdt_desr-ap_boot_start\n"
> -    "    xor   %ax, %ax              \n"
> -    "    inc   %ax                   \n"
> -    "    lmsw  %ax                   \n"
> +    "    mov   %cr0, %eax            \n"
> +    "    or    $1, %al               \n"
> +    "    mov   %eax, %cr0            \n"

Hmm, yes, read-modify-write should probably have been used from
the beginning, irrespective of using 286 or 386 insns.

> @@ -68,14 +66,37 @@ asm (
>      "    .text                       \n"
>      );
>  
> -void ap_start(void); /* non-static avoids unused-function compiler warning */
> -/*static*/ void ap_start(void)
> +static void __attribute__((used)) ap_start(void)
>  {
> -    printf(" - CPU%d ... ", ap_cpuid);
> +    unsigned int cpu = ap_cpuid;
> +
> +    printf(" - CPU%d ... ", cpu);
>      cacheattr_init();
>      printf("done.\n");
> -    wmb();

Is there a reason you remove this barrier but not the one in boot_cpu()?

> -    ap_callin = 1;
> +
> +    /*
> +     * Call in to the BSP.  For APs, take ourselves offline.
> +     *
> +     * We must not use the stack after calling in to the BSP.
> +     */
> +    asm volatile (
> +        "    movb $1, ap_callin          \n"
> +
> +        "    test %[icr2], %[icr2]       \n"
> +        "    jz   .Lbsp                  \n"

Are we intending to guarantee going forward that the BSP always has
APIC ID zero?

> +        "    movl %[icr2], %[ICR2]       \n"
> +        "    movl %[init], %[ICR1]       \n"
> +        "1:  hlt                         \n"
> +        "    jmp  1b                     \n"

The use of the function for the BSP is questionable anyway. What is
really needed is the call to cacheattr_init(). I'm inclined to
suggest to move to something like

void smp_initialise(void)
{
    unsigned int i, nr_cpus = hvm_info->nr_vcpus;

    cacheattr_init();

    if ( nr_cpus <= 1 )
        return;

    memcpy((void *)AP_BOOT_EIP, ap_boot_start, ap_boot_end - ap_boot_start);

    printf("Multiprocessor initialisation:\n");
    for ( i = 1; i < nr_cpus; i++ )
        boot_cpu(i);
}

thus eliminating bogus output when there's just one vCPU. 

Then the function here can become noreturn (which I was about to suggest
until spotting that for the BSP the function actually does return).

> +        ".Lbsp:                          \n"
> +        :
> +        : [icr2] "r" (SET_APIC_DEST_FIELD(LAPIC_ID(cpu))),
> +          [init] "i" (APIC_DM_INIT),
> +          [ICR1] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR)),
> +          [ICR2] "m" (*(uint32_t *)(LAPIC_BASE_ADDRESS + APIC_ICR2))
> +        : "memory" );

Can't you use APIC_DEST_SELF now, avoiding the need to fiddle
with ICR2?

Jan

