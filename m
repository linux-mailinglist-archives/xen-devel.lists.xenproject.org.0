Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F8033C0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646916.1009584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8bC-0004Hd-So; Mon, 04 Dec 2023 13:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646916.1009584; Mon, 04 Dec 2023 13:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA8bC-0004Fu-Q8; Mon, 04 Dec 2023 13:02:58 +0000
Received: by outflank-mailman (input) for mailman id 646916;
 Mon, 04 Dec 2023 13:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRmP=HP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rA8bB-0004Fk-8P
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:02:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f58ce99-92a5-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 14:02:54 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 13:02:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 13:02:49 +0000
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
X-Inumbo-ID: 6f58ce99-92a5-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+R9ct+fmdIAiDQc3V8+YYdyUAeDqcDonKzH4jb0XeWxIZuBWhy8oEXL1X0dy7nILpmoU0BlF9GhNMEblrbeXUWpzLjOTpAw8QKAUhZpcWy1+HVWX+bT7UQNYTF4LMlRbOQe3/jKzH2gYxR8ihewC1xVMCfm0yDoAm+tyfhG4ltgnyyKPYQPEdvJ0pSjOj54zYuaZVCkSw8BnUTPqrXlebpu7aPpAP/PCZOzLIZrtM06QpRrMztTOK6AowQFIsdGlJOWAkIiQ9iGRu904ZMWoc0KrqVV14kMRPE4IMgO5mSPb1dVDt8xDL36iu12M0nOF4aKIgEp3w68QJeiG72oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aA/rz75yZpoiQATE/yALj9ePwuFL8Y46CbUJ3WV3dcw=;
 b=IsIfmF8xcmAjdQwfOiaR9uPxmLHVhPd1HNlFm4aMjIYTH2/Ww16FYfClgaRLQeabAd53W7xit4syhFWmMAG7BQeiumIkw3uDNeJ/ZwL6jjenm/9HY0K42Y5hgts9W6PRSTOPgq2VByg7wgAZzup5mgBo2urnXStTwCuwISMCW/vzWl1umj2jStF1NpEsn+BPhkH3wVbXz7WI6VR3lTE9STkFxnIv7s0pFQ0IayJW0sj3Rv+DFEvLwJknkPYYcsS8Ensm7qwBJVTNR6nPrOW4SnG/7dwOOrGWpDfEnESnIJD36RPL4ghf+/hWISVPbqPdEJO5y5nVxI28ZoGNXWQL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA/rz75yZpoiQATE/yALj9ePwuFL8Y46CbUJ3WV3dcw=;
 b=EbrsvCFQv5i/D1ysGFdUKzU66VX6x+Q5x8EPrBG4ewADyxNPuvB8m3spiaEwRuuFF7f1or1HbxdfQ9JyQokqGkZNSei6aHCXlwFPi/gLrhAhBYh7meVwYmO8W2ZR5OoyawTxeQCk6SE6kCngiOrbnO0km1YoWqGvGy0l3+VQYeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
Date: Mon, 4 Dec 2023 13:02:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 stefano.stabellini@amd.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: ed498a6e-cc03-4ebf-9cd5-08dbf4c95138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+DG0yr539Igq3AQac78xCn6vlLzj1SlOs0UKUsV3LniQPR8fABg1dttRGzaWRov9HCNO/vsTIAK4XEe2zkYjakvkKXeFhU5ufuzPjSuYj3RdWNTLIEjTItsqMv0IzUOoR5Pi7Sf1Qr9RkMxwvbxxADkhRYk1Vs5MNyWGiAvy6pUWtG1PV7tbQTAqjN18avLSDxnCFd2k5VPXj1kUodtPGjEMLnV/EV12jb19cnXKlupEjT63Lg1KQEzXkBAVlD3L8w/Cb2RmHh4eele28LIDeeQiH790OSRcYS8aUgk82Kzu2wJTZxAuGfXsBkpZiaLCGHPK7FDXBwg90zH2aGjj6wYnolAz82irGwMToXW2YAuQ/7P5ys/6xRjgrhqhSYAnhSceI+MDFU/8TX3t+J9fVYmBMZimd2s2cU/YWuvZlNleCDqLrCYUWqyYMeOe5ghC6KkbxU8flkyo5Z2PXQCq0E5XjAWpRim8K9j/3146PyLDpMP1I6SqZmFuwBamLfWq+eTpT/f/V0irlWm4k9IUndGMN8pDwGRvoTZNYH5dlpg40RIueBoafH98VL26GDw0enHbf2dGtu6PVQEzdtYFqsRT170nFOLiriEiLYYfa/phFDABYDY1Ng2Ch+lWGVpVT/6huhMhW80ROQfpjtTHcKIAeyBVKaMQ2EW3fJVN/EQNCsls/lBhnytA4Z/tdl3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(451199024)(64100799003)(31686004)(2616005)(8676002)(4326008)(8936002)(6512007)(6506007)(53546011)(83380400001)(26005)(6486002)(478600001)(6666004)(66476007)(66946007)(66556008)(110136005)(316002)(2906002)(36756003)(41300700001)(38100700002)(31696002)(5660300002)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c092emdjMHdQMDhvTjJ4VTJjaHpwMDBHUUdNNis5aVVVN1l3eld1Um9qN3Fw?=
 =?utf-8?B?R2xPSHdtQmpVS09vdFdqK2pkS3lBSGUzc2xDK1JiMFVkRDBwNjZlWlVxRENV?=
 =?utf-8?B?TTRWRUk2RE1FOExCb05TSHA2Ykk1ZHduL1UyZnZQUDBrb2RTdUdtQ1A5QXg2?=
 =?utf-8?B?MHpXdWJEYmdaOUh5cWFwVkMxQU5MUjFZUkdScWxKQmxBaUhwTExmaDYwMnFM?=
 =?utf-8?B?MmdvYW5CcEMwVXZNKzlpa2RRbmN5QUl6RmJzK0JpcVBKcUNyM2ZXeEdFN1Nv?=
 =?utf-8?B?RW5sWHZWQnBNVXVKcy9NY3BhWmZsZ1F5WlB3aGZxRXYwYVRZd2Z4c21GOVpt?=
 =?utf-8?B?YkxlNlVZWVAwUytJazlkV2RmbEc5ZzN2RnV5Qkc4OVJRNkM5ZkpKMmljRlhJ?=
 =?utf-8?B?NnpkUmxUaVdlNjBrVFdWL1dnd0VKU29WLzlsTkxIbEZDa3VsazNnaFB0RW9D?=
 =?utf-8?B?eHpXUGhkSGs1ZUFFRGxJYnVuYXlyMjI3dFdrZzdybXZjbk1kY0J2QUx4QnhU?=
 =?utf-8?B?aTlES1JoYWhLNG9uZy9NNmR0RlJWVDl4VHM4RHlzcU5MMTFBWHFOT3Zxankv?=
 =?utf-8?B?SGU5ZDdUV1dvSEVGdWsrU0RRL0h0dlNRYVpoRVBsR3RabzZ5bDNZZjNJMzBl?=
 =?utf-8?B?bmthWUg5Q21IU09tWm9YNzVUcmNqcUtvZWlCRmQvTHBkS2l3QmxFU1pZa1M4?=
 =?utf-8?B?WmpYL1JGbjk2QkxjWkFFOWVpK0hiTTBFcWpEbXhSaEMwcnJuYi9XcUc3U2Nk?=
 =?utf-8?B?cy85YmZoN3pLY2JjMFFzcDMyNkJJVzYwYWFMd0Rjem9DWHZDWmxqazFOYUZK?=
 =?utf-8?B?UEpqTHUxUXZRN2ljSmFzVDl3dGhZZmFuY3JNU1Y5Y3AxTHFUNU1SS0dNWmtL?=
 =?utf-8?B?TzlkaWhVVUlFZWJnVVVuazkxM3lkWHRhZVpEdkJVaCtWcCttUGgwQ1BmRHRa?=
 =?utf-8?B?MnlJL0F1U3I2THRPSFN4ZVBVY1ZRK29DVnB1UTd1S2VWNUFFeXN5cTVnb0pk?=
 =?utf-8?B?aHFRYmhwcUhnMkVFWGk3MW1rNXhva3gvMCtrRnVjOHBiOGhnbUNXRjRWa2J4?=
 =?utf-8?B?Y3ZRMGRiOHh2S3Y4dnRDZmh1UGN1MUNZZEdPb2sxQWc1aFFHUWlXMFBJTUpI?=
 =?utf-8?B?TlhsRzNNUkx6WjRZMEpJYnJFaE9OdkVNOTZKY1NoYjhYNDlWaGozaHZDb0E5?=
 =?utf-8?B?eG9uL04xZnBCOFVRQVRwVzBBRFdPSkh0THNTZVNaa3MzNmpPbXZUL25WOHph?=
 =?utf-8?B?ZDlxa2x4VENNa1A1NzdDbVh6Z3lobGM3UlRGdlJlOUtFQTgvZEtZejc2dDJM?=
 =?utf-8?B?cW9pUkhmWjlGTElUZ1JPQSs2VEtGNGR4TXdESmNGeGZneWc2S2FkNWM0OHNq?=
 =?utf-8?B?bnFVNXVoTGN1b1FocVA3cy81YVBjcTdQOXZVZHBLWlRjNGtSZEplRUJ6ZE56?=
 =?utf-8?B?U3BsTk9VbHNucEs1TWU4Y1ZwYWZSQ0dyRzFzakdOSFN2MWJ6dmRCamlTT08r?=
 =?utf-8?B?bFpkWlk4RkdienR4UG9iREdzZFFDdUE0YzR4RzVjamo4d09DY0NLUmIybHZs?=
 =?utf-8?B?bkIvbUZhWTczNktCVlhnMURjaVRTWEhTVkFNbnJwZ1cvek1vaHJjUW5RS1NV?=
 =?utf-8?B?djVZWklMVnBxM1BnNFp2dnorTnBDVEJBeVVzbjk5N2FhblpNc2U2TUF2bVJS?=
 =?utf-8?B?RlJmbm1uek84VThTcm1TQ2hRZHZJaEl4bUZnK09yWGRrdS9OMVZadEthbktB?=
 =?utf-8?B?UVQ2clVWYnVnQ1FTdGZvckJoSVZmR0NaVE1RYkdSbmY5Z3dtdEhQL0I0UU1i?=
 =?utf-8?B?eTdzanNtSjJFR0RlUDJyOU5HZlBVQVAwWGJFczhQdzNCdjI0OFB4Z0drZXEv?=
 =?utf-8?B?WGVoT0lMb0gxL2JtQ05mYXhtMzR4eW8xV2VYektQMDRJSHRsd0FObnJRQ1Zk?=
 =?utf-8?B?MVhjQUdhYkZCUzVuUG56cGlaRzd1Vit3K2VwYWRLYXFRME5MeG1WbzVaZXNj?=
 =?utf-8?B?ODN1OG10STh1SkttQkhLcTFMOXlpSWw1ZlBaZVc0VDVZTHNxVkN2VUx0TXUx?=
 =?utf-8?B?ZVpka1pPMWMyWkxpNmk1ZkhiV3RCQk8wNUl2R0gvN3lGZEoycFRZa3Z3VXhL?=
 =?utf-8?Q?fnl8ihuOAKs25cTm13qwXViTn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed498a6e-cc03-4ebf-9cd5-08dbf4c95138
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 13:02:49.3834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv7Q9Bi8fE3dbo0BxU/uZ56WdVqLowHwQY+qroWz+U9z+nNDyUGNlrj0YGFcEljXKRJ5yYdovZs7xTX/dX/C/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123


On 04/12/2023 10:31, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>> Currently if user enables HVC_DCC config option in Linux, it invokes
>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>> an undefined exception to the guest. And Linux crashes.
>
> I am missing some data points here to be able to say whether I would 
> be ok with emulating the registers. So some questions:
>   * As you wrote below, HVC_DCC will return -ENODEV after this 
> emulation. So may I ask what's the use case to enable it? (e.g. is 
> there a distro turning this on?)

I am not aware of any distro using (or not using) this feature. This 
issue came to light during our internal testing, when HVC_DCC was 
enabled to use the debug console. When Linux runs without Xen, then we 
could observe the logs on the debug console. When Linux was running as a 
VM, it crashed.

My intention here was to do the bare minimum emulation so that the crash 
could be avoided.

>  * Linux is writing to the registers unconditionally, but is the spec 
> mandating the implementation of the registers? (I couldn't find either 
> way)

 From ARM DDI 0487I.a ID081822, H1.2, External debug,

"The Debug Communications Channel, DCC, passes data between the PE and 
the debugger:

— The DCC includes the data transfer registers, DTRRX and DTRTX, and 
associated flow-control flags.

— Although the DCC is an essential part of Debug state operation, it can 
also be used in Non-debug state."

 From this I infer that the spec mandates the implementation of these 
registers. IOW, these registers should always be present in any Arm 
compliant SoC.

>  * When was this check introduced in Linux? Did it ever changed?
>
This check was introduced in the following commit

"commit f377775dc083506e2fd7739d8615971c46b5246e
Author: Rob Herring <rob.herring@calxeda.com>
Date:   Tue Sep 24 21:05:58 2013 -0500

     TTY: hvc_dcc: probe for a JTAG connection before registering

     Enabling the ARM DCC console and using without a JTAG connection will
     simply hang the system. Since distros like to turn on all options, this
     is a reoccurring problem to debug. We can do better by checking if
     anything is attached and handling characters. There is no way to probe
     this, so send a newline and check that it is handled.
"

As of today, this check hasn't changed.

>>
>> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
>> is emulated as TXfull | RXfull.
>
> Skimming through the Arm Arm, I see that TXfull and Rxfull indicates 
> that both buffers are full but it doesn't explicitly say this means 
> the feature is not available.
We are not saying that the feature is not available. Rather ...
>
> I understand this is what Linux checks, but if we want to partially 
> emulate the registers in Xen, then I'd like us to make sure this is 
> backed by the Arm Arm rather than based on Linux implementation (which 
> can change at any point).
>
>> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
>> Also D17.3.7 DBGDTRRX_EL0,
>> " If RXfull is set to 1, return the last value written to DTRRX."
>>
>> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
>> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
>> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
>> the guest to be aborted.
>
> See above, what guarantees us that Linux will not change this behavior 
> in the future?

If I understand "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN" 
correctly, it seems that Arm ARM expects OS to check for TXfull.

If the condition is true, it should return some error.

Let me know if I misunderstood this.

>
>>
>> We also emulate DBGDTRTX_EL0 as RAZ/WI.
>>
>> We have added emulation for AArch32 variant of these registers as well.
>> Also, we have added handle_read_val_wi() to emulate DBGDSCREXT register
>> to return a specific value (ie TXfull | RXfull) and ignore any writes
>> to this register.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> We usually expect the first Signed-off-by to also be the author. So 
> should Michal be the author of this patch?
Yes, I will make Michal as the author.
>
>> ---
>>   xen/arch/arm/arm64/vsysreg.c         | 21 ++++++++++++++----
>>   xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>>   xen/arch/arm/include/asm/cpregs.h    |  2 ++
>>   xen/arch/arm/include/asm/traps.h     |  4 ++++
>>   xen/arch/arm/traps.c                 | 18 +++++++++++++++
>>   xen/arch/arm/vcpreg.c                | 33 +++++++++++++++++++++-------
>>   6 files changed, 69 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index b5d54c569b..5082dfb02e 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        *
>>        * Unhandled:
>>        *    MDCCINT_EL1
>> -     *    DBGDTR_EL0
>> -     *    DBGDTRRX_EL0
>> -     *    DBGDTRTX_EL0
>>        *    OSDTRRX_EL1
>>        *    OSDTRTX_EL1
>>        *    OSECCR_EL1
>> @@ -172,11 +169,27 @@ void do_sysreg(struct cpu_user_regs *regs,
>>       case HSR_SYSREG_MDSCR_EL1:
>>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>       case HSR_SYSREG_MDCCSR_EL0:
>> +    {
>> +        /*
>> +         * Bit 29: TX full, bit 30: RX full
>> +         * Given that we emulate DCC registers as RAZ/WI, doing the 
>> same for
>> +         * MDCCSR_EL0 would cause a guest to continue using the DCC 
>> despite no
>> +         * real effect. Setting the TX/RX status bits should result 
>> in a probe
>> +         * fail (based on Linux behavior).
>> +         */
>> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
>> +
>>           /*
>>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We 
>> emulate that
>>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>>            */
>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, 
>> hsr, 0,
>> +                                  guest_reg_value);
>> +    }
>> +    case HSR_SYSREG_DBGDTR_EL0:
>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>>       HSR_SYSREG_DBG_CASES(DBGBVR):
>>       HSR_SYSREG_DBG_CASES(DBGBCR):
>>       HSR_SYSREG_DBG_CASES(DBGWVR):
>> diff --git a/xen/arch/arm/include/asm/arm64/hsr.h 
>> b/xen/arch/arm/include/asm/arm64/hsr.h
>> index e691d41c17..1495ccddea 100644
>> --- a/xen/arch/arm/include/asm/arm64/hsr.h
>> +++ b/xen/arch/arm/include/asm/arm64/hsr.h
>> @@ -47,6 +47,9 @@
>>   #define HSR_SYSREG_OSDLR_EL1      HSR_SYSREG(2,0,c1,c3,4)
>>   #define HSR_SYSREG_DBGPRCR_EL1    HSR_SYSREG(2,0,c1,c4,4)
>>   #define HSR_SYSREG_MDCCSR_EL0     HSR_SYSREG(2,3,c0,c1,0)
>> +#define HSR_SYSREG_DBGDTR_EL0     HSR_SYSREG(2,3,c0,c4,0)
>> +#define HSR_SYSREG_DBGDTRTX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>> +#define HSR_SYSREG_DBGDTRRX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>>     #define HSR_SYSREG_DBGBVRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,4)
>>   #define HSR_SYSREG_DBGBCRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,5)
>> diff --git a/xen/arch/arm/include/asm/cpregs.h 
>> b/xen/arch/arm/include/asm/cpregs.h
>> index 6b083de204..aec9e8f329 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -75,6 +75,8 @@
>>   #define DBGDIDR         p14,0,c0,c0,0   /* Debug ID Register */
>>   #define DBGDSCRINT      p14,0,c0,c1,0   /* Debug Status and Control 
>> Internal */
>>   #define DBGDSCREXT      p14,0,c0,c2,2   /* Debug Status and Control 
>> External */
>> +#define DBGDTRRXINT     p14,0,c0,c5,0   /* Debug Data Transfer 
>> Register, Receive */
>> +#define DBGDTRTXINT     p14,0,c0,c5,0   /* Debug Data Transfer 
>> Register, Transmit */
>>   #define DBGVCR          p14,0,c0,c7,0   /* Vector Catch */
>>   #define DBGBVR0         p14,0,c0,c0,4   /* Breakpoint Value 0 */
>>   #define DBGBCR0         p14,0,c0,c0,5   /* Breakpoint Control 0 */
>> diff --git a/xen/arch/arm/include/asm/traps.h 
>> b/xen/arch/arm/include/asm/traps.h
>> index 883dae368e..a2692722d5 100644
>> --- a/xen/arch/arm/include/asm/traps.h
>> +++ b/xen/arch/arm/include/asm/traps.h
>> @@ -56,6 +56,10 @@ void handle_ro_raz(struct cpu_user_regs *regs, int 
>> regidx, bool read,
>>   void handle_ro_read_val(struct cpu_user_regs *regs, int regidx, 
>> bool read,
>>                           const union hsr hsr, int min_el, register_t 
>> val);
>>   +/* Read only as value provided with 'val' argument, write ignore */
>> +void handle_read_val_wi(struct cpu_user_regs *regs, int regidx,
>> +                        const union hsr hsr, int min_el, register_t 
>> val);
>> +
>>   /* Co-processor registers emulation (see arch/arm/vcpreg.c). */
>>   void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr);
>>   void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 3784e8276e..f5ab555b19 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1676,6 +1676,24 @@ void handle_ro_read_val(struct cpu_user_regs 
>> *regs,
>>       advance_pc(regs, hsr);
>>   }
>>   +/* Read as value provided with 'val' argument of this function, 
>> write ignore */
>> +void handle_read_val_wi(struct cpu_user_regs *regs,
>> +                        int regidx,
>> +                        const union hsr hsr,
>> +                        int min_el,
>> +                        register_t val)
>> +{
>> +    ASSERT((min_el == 0) || (min_el == 1));
>> +
>> +    if ( min_el > 0 && regs_mode_is_user(regs) )
>> +        return inject_undef_exception(regs, hsr);
>> +
>> +    set_user_reg(regs, regidx, val);
>> +
>> +    advance_pc(regs, hsr);
>> +}
>> +
>> +
>>   /* Read only as read as zero */
>>   void handle_ro_raz(struct cpu_user_regs *regs,
>>                      int regidx,
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index 39aeda9dab..3f1276f96e 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs, 
>> const union hsr hsr)
>>           break;
>>       }
>>   -    case HSR_CPREG32(DBGDSCRINT):
>> +    case HSR_CPREG32(DBGDSCREXT):
>> +    {
>>           /*
>> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
>> -         * is set to 0, which we emulated below.
>> +         * Bit 29: TX full, bit 30: RX full
>> +         * Given that we emulate DCC registers as RAZ/WI, doing the 
>> same for
>> +         * DBGDSCRint would cause a guest to continue using the DCC 
>> despite no
>> +         * real effect. Setting the TX/RX status bits should result 
>> in a probe
>> +         * fail (based on Linux behavior).
> If you want to mention Linux then you need to be a bit more specific 
> because Linux can change at any point. So you at least want to specify 
> the Linux version and place in the code.
>
> So this doesn't get stale as soon as the HVC_DCC driver changes.

(based on Linux behavior since f377775dc083).

- Ayan

>
>>            */
>> -        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
>> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
>>   -    case HSR_CPREG32(DBGDSCREXT):
>> +        return handle_read_val_wi(regs, regidx, hsr, 1,
>> +                                  guest_reg_value);
>> +    }
>> +
>> +    case HSR_CPREG32(DBGDSCRINT):
>> +    {
>>           /*
>> -         * Implement debug status and control register as RAZ/WI.
>> -         * The OS won't use Hardware debug if MDBGen not set.
>> +         * Bit 29: TX full, bit 30: RX full
>> +         * Given that we emulate DCC registers as RAZ/WI, doing the 
>> same for
>> +         * DBGDSCRint would cause a guest to continue using the DCC 
>> despite no
>> +         * real effect. Setting the TX/RX status bits should result 
>> in a probe
>> +         * fail (based on Linux behavior).
>>            */
>> -        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
>> +
>> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
>> +                                  guest_reg_value);
>> +    }
>>   +    case HSR_CPREG32(DBGDTRTXINT):
>>       case HSR_CPREG32(DBGVCR):
>>       case HSR_CPREG32(DBGBVR0):
>>       case HSR_CPREG32(DBGBCR0):
>
> Cheers,
>

