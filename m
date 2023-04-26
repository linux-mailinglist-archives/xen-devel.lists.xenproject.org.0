Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118256EEEA1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 08:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526495.818276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZ50-0006R6-6l; Wed, 26 Apr 2023 06:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526495.818276; Wed, 26 Apr 2023 06:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZ50-0006OP-3w; Wed, 26 Apr 2023 06:56:42 +0000
Received: by outflank-mailman (input) for mailman id 526495;
 Wed, 26 Apr 2023 06:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prZ4z-0006OE-De
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 06:56:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dea7be9-e3ff-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 08:56:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8560.eurprd04.prod.outlook.com (2603:10a6:102:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 06:56:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 06:56:35 +0000
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
X-Inumbo-ID: 7dea7be9-e3ff-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNYkIb7GsHA5yZmZx9LNdft8RH/ndfS3uER6I/lw5rJNzo0AIelm+pMczZPbcb5bSKv8TJGqNrPXvlT9dL8zne1uJLqFGBpjVAlnIvAl1aVHnUOLKDjcbkFM0fRcJR5Qhy0ADJuZWKhvxDt7H3uScj41FmbK7PiIHWcgRYuDi/lZkjB5WBFU7xYtWmyE6JM6fAsY+hI4r96D0+cLpzI0R12i25U8sZQXr+Dv+dcVCuRMmTW0m4A+7sceSqEH9ePF/u3dHl86Dtl2TW5ju8oG+oB3byrDr3vEPfkvApxloTN48xw8K1vynMGWuhmg6QCgKYQySZVPW2W7+OHQw2RgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qG/e5edz6n7E3IYj7TTk5sucdHWBDsJLvmI1nmGUH4=;
 b=ElJbW2vggq9FWRWjZA6f+Lkfa6GLoTf5lQTA1+Q1VP6b4EmX49Rcdze4VNgME3zFDXTNmVQPlLiwa2rTWrbaWPC/giZUQhTvXyIXsZauvuGv+xibL5mhmSbyns1ckk0FzrYLzYV1iQyY9ZbDJq4EldPDyv41tkXxM62ATlSDw31Cmu2skRYpRgu99VApo82ad0IdC2oNo1OG8rrBjR9HOgOoQJqUzfOzBKrWZfMXv0Jm98P7JN1SrtxaRPQoN+nbwTfT+/RKXTXhcMWddpydEB47FwD6FNbF7XC8BLM0zl8Oyf1iegfnDT3MRXi2widpTk+HfW766pFrUDeAJXNiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qG/e5edz6n7E3IYj7TTk5sucdHWBDsJLvmI1nmGUH4=;
 b=W3ATk8iZuwB8N6+ZJtVMbNteLrcvwwMpB4bRK7LCgJGbCnoZAO6CdXYLfiGXnoRgxcQ5KJWTH+lVhDuexvAqwo1V7UnV73AdX9nzSBVoSzPz4zzbOnqk30Hqbb6+zOiYNz/ygYEi9HPXoGuPWs9rCia+HazJuwuOEWv5QnrV/mGk+OKjn8/FQo1Ba3MDYLSCWBZrrUVgqvGtbbdjqCK27tX6ranYsa4ROpOkAKPnTGX43u4r5gpQv1WLEABzCMIM8Tqz7eBkJ1FuH2rF/SX7OoZpcAFlVgUvkwd+kDFXL5L5pFQSaoSVyAm5Zp13lXxOPX7mk6FOBVnOAdh3E3Y3wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13635377-e296-370d-121b-5b617dc210bc@suse.com>
Date: Wed, 26 Apr 2023 08:56:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a6f454-3591-43df-a959-08db46235fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LDOqu8LtWScq6K6fOiyfdF/7dqF1ZOfT23A389UmS/8wGAuqprdI+hYdTNbem7xzwlTNV1F0IhogOq8zDJJwSnu4NAQlGxzuMlyAF81CBLI0xWLOLojPMN8PNdqv2KKRiofYzEyNxys4PRJNbrAfATW3FDwVtI1Nx3RlcuLqMR6T+oYHfBkmFDFq9lNAoEv5ixmA+0z86UfndGVroP5xzmrrW1hMAUAY+TVTcF6z32CfNaiFDU0pXZebCV4jrW0jEGDKck+T9446n1PEH/4yxDJEIrRChzqFvnIbHuc0+m0DYLRajksaXsQ9ND3W4q/KMWTyciD1k0bjkhAZKky9xVD+bDVVXq3BcqNROG6P5fdxK7NxZalVdV4BlDtc8UjKXU3Q6w/69IMRznsFJmgNgoYJ6f9kZ2swOl75LD4V6St9uQde4DuvR+R/jMbPie82EmM0FoNDQ+G/mpro3zBk/MsP0I6J9OjA3EpGugDVZDOPnoEUqJUtwDb0/2E+yguX7jPCseERik0eFx4398mEXp6101Di6w5k0scyZaDwY/sWqepB/mA1V/Qs5vs+v5hrmCuQ3MBAMJefNUzWjRepf5FmfHWPNwJ8JLOzDE5bRwcsTHX8/wHLe5L3hTei57JfAP1r2W53YUPJ1hWBUnYWSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(2906002)(5660300002)(54906003)(2616005)(6486002)(31686004)(478600001)(86362001)(8936002)(6506007)(41300700001)(66946007)(6512007)(26005)(8676002)(186003)(53546011)(316002)(6916009)(4326008)(66556008)(66476007)(83380400001)(31696002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3dyNDBQQ3dlaHJKSkxjTVZHeHRYNDhpa2NqOFRGMThWWG9HeGNyc09GVVU4?=
 =?utf-8?B?WFdmc3drbUlwY3BpS2Y0ckRMS25qZDVUejhCSHJaQWllRDlqT0FSUWFyTlFD?=
 =?utf-8?B?RTV3Q0VjemtiQ0dPWFVxblZEVlVLMTM0NUpuWFV5b0ZMZFR5V25oR1lPcWF1?=
 =?utf-8?B?MEFhdSt6anpDSE9OYlpQMFI1b0ZUVkJLQ3VEL0RCYWl5aVlaaHpBSm1iQ1k2?=
 =?utf-8?B?YXc4RWR5U0s1UUhjWW1zTkp5Y3RTMXVyVTcwSDk5elNXV2dHQzBVeUVESWRN?=
 =?utf-8?B?ZkpIMmRQclozemZZcGNucXV3cmpVNFBxSFIxQ1Vsa2x0NHQ2eFlMb21tc24y?=
 =?utf-8?B?ZkRvc3JobWd4WHRVRVpGWHI5OVhZdGFPS0hGZVVlS1dTRWREOWJLbERWbm1Y?=
 =?utf-8?B?Z25tMUpkL2xUY09nMndkdjZJT216K0lnUUVmK2hzZmpHRFVjQ1ZlMEp6NEd0?=
 =?utf-8?B?TUtIcTlpK1piQ04rQk1GQ3I1TURFUkp4UjhWa1Ayb3JTNzFpaks4S0ZNNXRt?=
 =?utf-8?B?WVNrNFBEbk55c3dHMzJucWRUZXB0MC9QQjE4bGVTVHJndS96eFFxQkJWYmdm?=
 =?utf-8?B?ejIwWEdzQ00yTmlQSWJqdEFVcGV2N0NVYW1aZkNEMUhlcmNkckFMVGxaVXhr?=
 =?utf-8?B?ams0aTlZVURNL296WjB6SHdDZzFiOTY3cFllQUUvZHhaNWw1eXBWMjQwdTJH?=
 =?utf-8?B?UDR2MXE2TmJZdGY5YUU0M0RPV3k5K2JUTTVXbFBSMTIxUmJLYjRBUXg2YXp3?=
 =?utf-8?B?Z1YrSkdaQ2JHUjBNYXhIejZiQXZHVmtlZjRLZmpSNkZtU3d2bGpxMHhSak9t?=
 =?utf-8?B?bjQ4NFlySXFtSHpvUng5clNCR1hUUm9oTEdnTTZZcENlOGhYYzhjNkVJMUpK?=
 =?utf-8?B?N09zaFNmM3duS05jWHZBd0wwaU9NZnZJMmoydlFRb3l0bHR1YjY2S1ZJWGhS?=
 =?utf-8?B?b2pSTi95L2NDbkZQcC9RcTZZdXJ5akhEODhndHh4VERYUGExajB3TlJ6ZG4w?=
 =?utf-8?B?b1pHeFloL1ZqVXE0V1NQcFBXUmFlVk5PUDVYajN1dXVWOEhvam52WjBJMTI3?=
 =?utf-8?B?TE9KSkU1c21zRnA0d0lHVGFvTGJtV3REeHZYcnZhdnZ0QmNwUmJKTGppWHpC?=
 =?utf-8?B?Q3Npb0NOeG9DRzZjVE9nbklTdkpHTUtaQ2RsWFdOTTFrOEZTZDBIVmtsUzUz?=
 =?utf-8?B?K1kvajQvclp0Y21WVU4vNEMyN213NGkvN3cyWDZ3OUJpTkpIWVN3dTQ3OGRP?=
 =?utf-8?B?V29CanIveWRkd296ZDZuQnMzM2xFYk04Y05MVWJ2QUJuVFRISi90N24rZlYx?=
 =?utf-8?B?KzhkTjZrYmlRYXBmY1RxaXI5YVg0V3g2S1lPanJhWjVpaGpacDFRNU8rUFAz?=
 =?utf-8?B?ZWo4WFUrdEJYZ2prQU5OZzU3WUFDeE4zQnM3aFNwZGpvbjhOTUpLNWpmSTM1?=
 =?utf-8?B?OGhvSUpJQTVNcEhOdUI3RDdZMmtuMFFnMDNid2NreG13Zy9lNUU0R2kyekgv?=
 =?utf-8?B?WE8yRllwWXdqVi9CazhHUmUyUlc1WGt0bUx6UHoySHBENW5VQXRSTW5WVW5p?=
 =?utf-8?B?WkliZ3JMWlpJVzNOd1dwajN3MFIwNDl2NG80aWJMbEdPRXVySWdXajRQemQw?=
 =?utf-8?B?YmVvcEVwQ0RSazNEYnJyU3hqMnZJUDNoNE1EMWJWclhCOEQ3UFZkR1N5WmRH?=
 =?utf-8?B?M3lNWGd0azFPUVgya0oyVG15WXUzaE1ZQmh6WUtwQkU0ejMzVGY0VTk1QSt6?=
 =?utf-8?B?dGl2ZkI0VTlRRWdEZi9CVHFSYlVUenJaVktyWkFubG9ON0ZPS3U3c09xQ0Fp?=
 =?utf-8?B?cmJOR1EwMzR1WCtnWkJrWTRaMnZYRlF5aFAxSHlqamF2UkNISHdEMndpY3A2?=
 =?utf-8?B?d0RsZ1kzeU94N25SdXFwZHNIck1sMFEzQlJhNTVPcUdsSHpyb2QxTHZPSjFJ?=
 =?utf-8?B?YmhsMDM1LzFxWk1Fb2hENmdhRy84ci9TZm5PT3ZqbXByazVRTy9GbnRWcWl6?=
 =?utf-8?B?MDA2MVlqVG8rd0o1anRkSzVRKy9ZWnZVS3cyOEs1YnhjVkdZSlFpcEJJSE42?=
 =?utf-8?B?akxncTh3c0RWRm5DbVpheVFvcmdsQUpCMVFzNzJGSU5TOTJrbzd4alVzU1A3?=
 =?utf-8?Q?LPx8t06z+CLLO1+iqVBg5jkz0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a6f454-3591-43df-a959-08db46235fd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 06:56:35.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkxEoc3o8hCcTJ2FDIvSWASSLAQGN0EXiQLwFiPeuFCKNbaoLcE/vIyFPmdpcA0SjBoRQJrm5MccbaUQsSiPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560

On 26.04.2023 07:33, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>>> +        /* Get opposite way distance */
>>> +        opposite = __node_distance(to, from);
>>> +        /* The default value in node_distance_map is NUMA_NO_DISTANCE
>> */
>>> +        if ( opposite == NUMA_NO_DISTANCE )
>>
>> And the matrix you're reading from can't hold NUMA_NO_DISTANCE entries?
>> I ask because you don't check this above; you only check against
>> NUMA_LOCAL_DISTANCE.
> 
> My understanding for the purpose of this part of code is to check if the opposite
> way distance has already been set, so we need to compare the opposite way
> distance with the default value NUMA_NO_DISTANCE here.
> 
> Back to your question, I can see your point of the question. However I don't think
> NUMA_NO_DISTANCE is a valid value to describe the node distance in the device
> tree. This is because I hunted down the previous discussions and found [2] about
> we should try to keep consistent between the value used in device tree and ACPI
> tables. From the ACPI spec, 0xFF, i.e. NUMA_NO_DISTANCE means unreachable.
> I think this is also the reason why NUMA_NO_DISTANCE can be used as the default
> value of the distance map, otherwise we won't have any value to use.

The [2] link you provided discusses NUMA_LOCAL_DISTANCE. Looking at
Linux'es Documentation/devicetree/numa.txt, there's no mention of an
upper bound on the distance values. It only says that on the diagonal
entries should be 10 (i.e. matching ACPI, without really saying so).

Jan

