Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9E6D4BFC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 17:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517519.802961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMAp-00080B-O4; Mon, 03 Apr 2023 15:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517519.802961; Mon, 03 Apr 2023 15:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjMAp-0007xU-LM; Mon, 03 Apr 2023 15:32:47 +0000
Received: by outflank-mailman (input) for mailman id 517519;
 Mon, 03 Apr 2023 15:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjMAo-0007xO-45
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 15:32:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5749c1b-d234-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 17:32:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:32:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 15:32:40 +0000
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
X-Inumbo-ID: c5749c1b-d234-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9npcgi1+bMVFezilYeE8bOu6Olj2VyP3KcCmsg5G+ZpVs5+CIR1JFLB82e6G0IWFqV/131USArPUZhODtJpu4UjJaMMZf2B5QUzz5iv8hEikgtejyK/zBfcBsXGNkKj67qCI/StS9mJ4P2esUQrKEpgnVmIQLkrN1tgH76o9siOtvVblmmNLlE58RR7+BQOyHy7P+UtRdjfCLqFamAN3Isn1nnpGzavlCqGrvnrEC6SHWhGNbngMRw/t42kuTrtcVS4FgiUUjQkvk6UEg1LR4m3F+qtAb9dyLzigBtATiPfAHaqUroUyl1IYmnTE8XxUJlfH9erzh35RsQFPOht+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW/TYZcHxb7whSHZnCCIC13DmOy6RkRRJZkmFNF2v9c=;
 b=m07aEJNuiy5pMk3GTfVwPhYPoiLta95wHv8rSvFoSgwewluzk1bNm2C+WCzi0LXWoNYa21BA5tLlaxvSn8DLC+k4yakUfCCRTl/IbLVEsrlvFRpL6iylIULND4qcbYc7m8PMKli5u1M2ORHTVHT6jf6ImgeK8+KsYBg65NtggybXxcGg9XM4cwiJc1lWkqvTShcoVUqku/u4u5MOMYh2H2oQPHYpQpb8+wCMP6TOlwu/C72s1B/amlro4SI5uq4OS1X1Ji43E6Lab6fjYw520lEg4u7wYqfk4E0GAchzLEx6cYR3JQavnW8G+8Ti8+hIeCo/yh4uVZR3KJ21fdQSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW/TYZcHxb7whSHZnCCIC13DmOy6RkRRJZkmFNF2v9c=;
 b=ZXt+lPT94rfssoFdpe3MjBBAmny+NMLUUwkVfv1QgwmVyCgP3UdKtfHehG2flaRCKarzJmVLwt3Ukf2twlDXKQjimtb0dxhr236aV3Q5QTpqo/RnWHKNlkyCEHcB2QGAcSdc2InTH6bGAYXzHK8jrzMaGUnRTBgkPVvR3hoVe7ZEQTNZRnHDS6KPOjxCnQ4pvd7JspWWgOgv60UFoEYxWgRzCFWfvaHpIJpq7+DQqQsMAGjhbpyeEkafT/7kPIpI2UHlVn6rhxCFw+x4vjf5ubseXgRFFQAFUwLMv8G+7wneWzafqXV0Z9x3QrN/GguUDu8/bRJP/IyRou6YfZw5Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0adcb388-d2a9-e43e-ec20-de1df51f33d7@suse.com>
Date: Mon, 3 Apr 2023 17:32:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403101449.93323-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230403101449.93323-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae16332-831e-4b02-4488-08db3458a93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IjDEoTk22sxoybyjViHc6gj6hhsNoWi93iVA7Pb4rGtPRH2gPmmSOjwKbazmNqa/FsrtUKeK3/+1KJrQ9MzU9cBSkLdsJQ8fCACHke+KKdpeRJvaIjQaebQcWn8+1bRYKaBLW43VoIwDgXb1Ab5vl2d/HzlZ3MYTo6U2tPFip+IfJcH2/O8gXHHdsEVP95m8vNFyVs8DLfuVeRwY+ok11oRzU5BfPJWeTa9RBIBBgwQiRPlv3XMagUqqafeAoe1l76tHmJt0tpAH51dxrE8p2usDYTJqzpsPceXCwXPDYKY9l+tu0iuQpeem7W2wMTtCFciV9mEPkl1/VgecfW8BrXl2XqTMHkmvIh3xKYecP6HkWDkjvXaTVKb0cnJLAOChZrbUvgDuCmzYLNtkW6delazM867P4ARZ8YD0QZJWiq9O25eN8ALJZBPY2gHGDec2WiIrmAzh8kRT1aAalu10Ex0oWXscE7X9B1hvFyY10VDbO5yL1rxeBTKWf41G7kBM+a2i7Y++OdWbH3T/6MBcEtQqzwILjnWWZDfBkh1Lb/IMk8QX7c/NeL97h2jGon1jT1MC5+YzZTfg+564T7lFZS9V/Bxi0iyFHG5YsvNwQzXjaV81sXYWW9ZN8BvUC735NgPIdv0X2+5wFiWDvEv0yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(53546011)(186003)(83380400001)(6512007)(6506007)(26005)(6486002)(8676002)(6916009)(4326008)(66946007)(66556008)(66476007)(41300700001)(5660300002)(38100700002)(54906003)(316002)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q09rTXp4cnFMeDBjWGtGMWRPU3hFbmp6bUNSbEVRSmlXNm0zWlpSVTFwRWY4?=
 =?utf-8?B?QW93NEFtUUcrcEgwalJKdW1PY1B1YUVJbGZBbVdyYzlOZjB6YmNGcWlpdWxN?=
 =?utf-8?B?WUhBc0VJamd0N1prdFF6VXZ1NEJIeXB0ZzVpbUtxcUptallYY29hUEJTb0RL?=
 =?utf-8?B?cG9Jb3RRQnZJRGx1NmRLRUtZZDVEKys5VUw1ZGxXNFRvajJialkxSHVKRG8z?=
 =?utf-8?B?Skk5N0Fld0dDRmR3bTlHeFpQL1RRSTR6LzJ2Slc2QjE3ZjR4NHdEZCtORDNN?=
 =?utf-8?B?RmRMcXBFSnoybi81blY4QUI2VVhhS3FzK3JqdlRlTHJmbWpIQ2ZQNTJxT1hR?=
 =?utf-8?B?SVNKSnFZMWlqSmtEa0pralZHMkt5VWNXcStzcitKaDByVnRjcmZYaDErUUox?=
 =?utf-8?B?SkFPNVByckJQZG1OMlJWQXV3SkZDY2N4L0RTVnFLd05VNForU0tFTXpWMlE5?=
 =?utf-8?B?OHE1bENUZ0ROSGUwakNJLzh6MThCRWsvS0hDYVBkb3YycW5tTVg5ZHBWQTk5?=
 =?utf-8?B?aHMxSVgwN1Q4YURBWHlSRVg4anprenZRNFRJcWliVVcyVlhDTU5yVHpZTHB2?=
 =?utf-8?B?b3FZZWgyUm5KVlVKMUw0V1dZM1hKYnEvbGZ1ZGFBc0UxWU1hNXFzU1RhSmJP?=
 =?utf-8?B?aU5KUGVtWk1SOUFtWGVxT04rQ3pDUkJwYWdEbGhCSk5HUG03RHk2cXV5eHlX?=
 =?utf-8?B?K2w4YVN2VEo5K3ZLdDh0K2xvT3h4SFhseWZJb3FOM0tBT1VQUXdaUExHZm9S?=
 =?utf-8?B?d1BVc2xWVVRFUWJsOXQrUk43NGI4WFgwNi9sTGhScm5FWnZWTXhOTWE2MERQ?=
 =?utf-8?B?TldSaytyQXNWTmFLUVJUSWh4QndBMGp1c3Iyc05zdDF2SytLSWI5TjhMTFFW?=
 =?utf-8?B?c3kwbk1zaWhPK1Y3NUIyb0xETTRaZy9vQXVwTTZwOEh1bnEyajdpREc2ak9s?=
 =?utf-8?B?dXVpd0I4VzE5ZFZnbjJUL0I4cVRzYWZXQTExb0pzOEJoUEJkK29tV3Q2UUti?=
 =?utf-8?B?UnVjcUJ0STlwZTY1M1p3UFJ0L0FHeWc2WDdDdXhwdmFQb2ZKd1I3akZEdHF1?=
 =?utf-8?B?cGtHQTRjK0lmQUQvd3VzWHY3SHlRTWd6bWV6SWVmMUFnUitQQ091T2tncmVP?=
 =?utf-8?B?aEhVK3l5L1M4YnhNYi9hYkh1K25oSXpPNTdrOGdzNDNqMjdJc0R2dXZBWWhL?=
 =?utf-8?B?OGtYeTU1c2J3K0VzY3p4QzhMMk96RElmaGJOWVpqc1c5ejJRcG9RRHR6bXNK?=
 =?utf-8?B?cUdwU0ZKR2ZFUzRPTTdhL21OdHdMWlMwM0s2QUJXSk5idS9ROFRiaDl4Rnho?=
 =?utf-8?B?d2ovMW0wRnZhcHBIRndnZGRxOWJPb2FZanVMNGRERHNyZHhPT3ZHWFljaFBD?=
 =?utf-8?B?THpic2ptSHVjOGc2a3dpMHB3Ymx6T3VqbTYzZEdweWhXS0lEVVdMQ1hyQi9C?=
 =?utf-8?B?aFB3Ymh2NnRROThkMURSZHZLdVlyWmZLdi9nZmc3L0ZYUHJmUnlOZ2RNRGkr?=
 =?utf-8?B?Lyt1ZDBTV3F5dWNreml4aTFvODFjRXhTa3diM0RDQnRIZDlVVGZyVGZZOE9R?=
 =?utf-8?B?N2NBRDZmN2QvQ1VLc3B6cDBPTkY4QlpGNXphSUtvSU1hT0phQWdyaE10QzVX?=
 =?utf-8?B?Q3A1eUEyRFBjSlAyRmRlNEV5T3ZQZmhucnArelZNaEx3MzFQdjlzUE9xamtS?=
 =?utf-8?B?MGxnRUhrY0lIM1RkQ2J0V3R3K0JKc0tRSG5mVFFuZFdLTFkvYnVuL2E3RG01?=
 =?utf-8?B?emtCK0tNOFRLVmtHNWVNZXYraWhKK3dPUW42dWFESk15ZTRWc0pjTGkvN1J6?=
 =?utf-8?B?WldNZ2kxa0NyWmxlNzlacGdIdTFoMzJkVDYvNGRZdkJzMzVZUVZ4OVBXOWNl?=
 =?utf-8?B?NWlUb3JmN0U2aHltOVJ1L2VLc1VwQmk3WllMbUJMLzhUVHhFRnVRZHhUK2ww?=
 =?utf-8?B?VERvcU5lTm1JazBtcTVnOEFYOU11TkhlUUp3bHRtMkJoOGppN3kyeWVzVW9B?=
 =?utf-8?B?T3BMbjNDZUZOOFFCZVZEQWs1U3NMV2ltS0lWM2psc1ZibEFlN3kzMEpjb1Fh?=
 =?utf-8?B?czRsTHVIV1pGT1dVZGd2V3FqR09jZGdYSGhVOEl4SnVYVkd3a3duRytPN292?=
 =?utf-8?Q?l8DkJLD+eAv6UMp1/BAa65Bse?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae16332-831e-4b02-4488-08db3458a93c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:32:40.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwAw3nFK9ODvlJA9bLC1jdt0LCDwYbvXPrJ3bsFZrnCL2TN9MMmC2Q/Eb3M2V3l/vyD1maJZA/zJNahBH06ujg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

On 03.04.2023 12:14, Roger Pau Monne wrote:
> Global p2m type recalculations (as triggered by logdirty) can create
> so much contention on the p2m lock that simple guest operations like
> VCPUOP_set_singleshot_timer on guests with a high amount of vCPUs (32)
> will cease to work in a timely manner, up to the point that Linux
> kernel versions that sill use the VCPU_SSHOTTMR_future flag with the
> singleshot timer will cease to work:
> 
> [   82.779470] CE: xen increased min_delta_ns to 1000000 nsec
> [   82.793075] CE: Reprogramming failure. Giving up
> [   82.779470] CE: Reprogramming failure. Giving up
> [   82.821864] CE: xen increased min_delta_ns to 506250 nsec
> [   82.821864] CE: xen increased min_delta_ns to 759375 nsec
> [   82.821864] CE: xen increased min_delta_ns to 1000000 nsec
> [   82.821864] CE: Reprogramming failure. Giving up
> [   82.856256] CE: Reprogramming failure. Giving up
> [   84.566279] CE: Reprogramming failure. Giving up
> [   84.649493] Freezing user space processes ...
> [  130.604032] INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
> [  130.604032] Task dump for CPU 14:
> [  130.604032] swapper/14      R  running task        0     0      1 0x00000000
> [  130.604032] Call Trace:
> [  130.604032]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  130.604032]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  130.604032]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  130.604032]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  130.604032]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  130.604032]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> [  549.654536] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
> [  549.655463] Task dump for CPU 26:
> [  549.655463] swapper/26      R  running task        0     0      1 0x00000000
> [  549.655463] Call Trace:
> [  549.655463]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  549.655463]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  549.655463]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  549.655463]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  549.655463]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  549.655463]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> [  821.888478] INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
> [  821.888596] Task dump for CPU 26:
> [  821.888622] swapper/26      R  running task        0     0      1 0x00000000
> [  821.888677] Call Trace:
> [  821.888712]  [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
> [  821.888771]  [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
> [  821.888818]  [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
> [  821.888865]  [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
> [  821.888917]  [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
> [  821.888966]  [<ffffffff900000d5>] ? start_cpu+0x5/0x14
> 
> This is obviously undesirable.  One way to bodge the issue would be to
> ignore VCPU_SSHOTTMR_future, but that's a deliberate breakage of the
> hypercall ABI.
> 
> Instead lower the contention in the lock by doing the recalculation
> with the lock in read mode.  This is safe because only the flags/type
> are changed, there's no PTE mfn change in the AMD recalculation logic.
> The Intel (EPT) case is likely more complicated, as superpage
> splitting for diverging EMT values must be done with the p2m lock in
> taken in write mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm unsure whether such modification is fully safe:  I think changing
> the flags/type should be fine: the PTE write is performed using
> safwrite_p2m_entry() which must be atomic (as the guest is still
> running and accessing the page tables).  I'm slightly worried about
> all PTE readers not using atomic accesses to do so (ie: pointer
> returned by p2m_find_entry() should be read atomicallly), and code
> assuming that a gfn type cannot change while holding the p2m lock in
> read mode.

Coming back to this: Yes, I think reads (at least the ones in do_recalc()
which can now be done in parallel) will need to be tightened if this is a
road we want to follow.

Jan

