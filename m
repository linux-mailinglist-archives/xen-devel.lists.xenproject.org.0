Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0A67DEE7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 09:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485361.752526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJrS-0007hG-49; Fri, 27 Jan 2023 08:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485361.752526; Fri, 27 Jan 2023 08:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJrS-0007ds-1J; Fri, 27 Jan 2023 08:13:26 +0000
Received: by outflank-mailman (input) for mailman id 485361;
 Fri, 27 Jan 2023 08:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLJrQ-0007dm-Ts
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 08:13:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b73583-9e1a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 09:13:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7373.eurprd04.prod.outlook.com (2603:10a6:800:1ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 08:13:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 08:13:20 +0000
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
X-Inumbo-ID: 77b73583-9e1a-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uqps4NbFksyLnoHc298MdU8OEcyTiZ2L5bqcy9Ok5o2I3kW+JLwLhjbs863WnBnhV4and/AbTPNYPNdzCTQ0KfUom8tiLt0M1cB9foUpMh3LBWAlLyOTuOwwSHI0zBdyaV/ZyzlE38CYeF+P5VVnmddYw+kSEn0mstuaGFaDleQOvbHPq+cpfXPd/BRpApkteqfUPk6aHs5td+nlcGW50zCKktD6SM49BT5bvSg9WKGfWPcMh/8FpPm9Qsh0he+PZaVdDkKpOqaYGUxe030p77yhX8XDV32vd5zhtKjFf79EWAe9QBHW/jkLHJ1UXH936M8u7gPnPy96Rf2XFtGbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9Vhe70Om2MBmgaGBCi2JO16S9NIgYIWitcatAN8/Q8=;
 b=jsKCv/y7QzH7AglA3NtSHGS7gQojpW1tdN17nEbMS4KQJ3EzxoZrHtTpTKaXjPsukHwfZhx9bLJLhlsfNybvWM8W0aQi6mJ604W4MAzMEvQoNp1ejrhjVwRRqmuYXILLQPtDrXnrtEI/rQkx54ftCEsdSVznOZVO/nUUp7LbAgXA+UqyKrrt0YRJ5tAEigzX5cwjuD8YYDMGYdhTdugvEJI3aERSe1TIYZGDzLmV6sfO1b1vEg4Gxnazso8K3/L9nJ08EhH4pHmb7siN6xq9AWAFHON06VglFXXpmtOvol/QoEnseO91885d2zSrlUiBY45E4xHVO4IymxVU+Yfofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9Vhe70Om2MBmgaGBCi2JO16S9NIgYIWitcatAN8/Q8=;
 b=IBF2OxelOgK8rlYuJcmU0DvqkbZxUbJ0kzU2+gyYKQB8FUfl5Srx+nfC4h4Bws9fI8wvzIU2nYOxYJ9xDFaS+L8Lt3iYzG9n9TWTfj+Y3ZZnesLAgpJA/7Q3SOfOQmkkv9piDp7nMM0QM+e0ym07kc9mRSdKstcP/FHAQlo6tH2mQb26UMR1qXwDOxmrlyO6oua1+cxHoNa//FaShK4sJnBqmoHZmXLkMAFmBiFMz2ltm7ONWRbUx9/3vmH5EB83WX0LFQ7TQRKhgppdYkfWK+JT5mh3GQ9Px2ju1hl/9LBLFXxds59A6REP7c6F19QL6gU+qre6gOvuG5pLSOG39A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97112cd2-d16e-6c9d-7c3d-a3fe5ab76125@suse.com>
Date: Fri, 27 Jan 2023 09:13:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-4-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261541420.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301261541420.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 33217c4d-e635-401d-2895-08db003e5a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sv9NzCGZUal7kUNBE09gUeoZS/KYX14WhWrQ5u9B/Sb1FQPzdWCT80pdE1ETPMcWt+4+bj3bdz3nVjOgM8tBlb3hFPsnwywewRCC/FWoHp/77s8hbdtInAaM8B6WVG/VITdETMvgoMMG971l624ISxcy4wj+Iy1Z5cu1RLY4+bLiTA8zw2wTw/LzL8jpu6M6hMroCO/qEzJQ8NSeFuIrSb4EGi/MNNb/kdHVgh/bH4kFpv7C7jrjDXh6mRaxzDGgPGPPVGWZwV4aRNLP1JOKNjY/kZNtOf4H7Nms9Y6Rd4lCq2z+sdzCOq7pgXA4hQBLmrSET/8mqb3HU8O/mcXOrqqbEPyM6zAg0fktTm9GB8jQajxvNKqOLKPSlZ93WbvZABzECK60NyCtVSSrttfIG3gJJWXYgZZyZB4/Acvvp0wMtCCigQRHbgXQihmkEyhFcDCbOzOraTS44jeeQDRU4+tnFvWtW/pAylJR+6M00qaFSbU4RC/tMnXb+H37QYGZUocFI56niCb6eo2lKt0uZQ8a8j03pXYXtFFQ0cCKlPq/PwdnhwWW9fJOkrDfAcPQ5+znic4E8Lx9o9EL1FuM+Cu1A/pisGKegaBjXXv2dKQ8Sv55zeUEDber2RniSP1IYQONRzucI4lKNBhg+0yHrutc9z31TFd+pGjLZ59gzvUkCyDa4FWGB8CPvBtqhELFX8oQAiF+bHEjODq7f1TBzEHLxr6qx8B2C9lxdWIMydw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(376002)(39850400004)(346002)(451199018)(31696002)(38100700002)(86362001)(36756003)(54906003)(110136005)(2906002)(6512007)(66476007)(66946007)(31686004)(41300700001)(8936002)(4326008)(66556008)(186003)(8676002)(5660300002)(2616005)(53546011)(6506007)(316002)(26005)(6486002)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0FDRWh0dGNmTEpiYnphWGpQU01HSjNzckZvMlhyNFIwRWVYNTk1YUd0Zlk4?=
 =?utf-8?B?RTlYdWorS2pDOUNKT0h2dGY4WHVLMm4ydHpUZHpaU2dQUkdGb0lxNGg5R3pG?=
 =?utf-8?B?OHVodUlHU1Q0Um9ZVzY2NDNKaCtxMDdDWkZodGV5ejdUUGM5Qmd4UkttUTNi?=
 =?utf-8?B?RGNRRFpjaVdnaFR2RkNzYXE1WndCc05VRlhpYzkyWThsNVhRNFEzQmIrbEo3?=
 =?utf-8?B?QjBaRVY1MHNyWlFTTmlITnpyZWxKOFJpeGRFRzFjVmVEOHJCVTY1Qm53d0V5?=
 =?utf-8?B?NmlkY3NaUEtjL2ZNYmsyQkNDQkVvdTRFMkZsVE5tQ0pMc1BXak4wMFozTmZK?=
 =?utf-8?B?OE5UVFc0aVVnNEVKdytaSVRCNWJXaytQUTNEbUI1a01VWkRSZ2x1ZC96Q25u?=
 =?utf-8?B?SUdkZUtNY01BV1crK3hMc1FjMEdlNHVkbmczMmt0MTAxNjZOZVZGMVp2aGxi?=
 =?utf-8?B?MU9yK2JMcXZ4OFF6b0hzd0ZIOGpoK21lUC9RMXhqaTU3T0dmTTgxVnJ3M3Rw?=
 =?utf-8?B?blgrdk11VHI2S0NpUThNeWwxeXB4QzZhd01EK2R0QVNITDBpL0F5Vk9sei95?=
 =?utf-8?B?OUxreXZ6SGJFLzlPRDltWDFjaC8xK1k2TjJVZy9yT29WcFRKRENTaElUM1Nj?=
 =?utf-8?B?WjBTQ1I2NVphMnFOR2gyN0pHV2paM3dnT2JvMjV0dnI0TGJoQWRIcDhUcDJx?=
 =?utf-8?B?MTZMTGx1K2l4WUJwZ0k0QUFIU0k4YjJXclhKVG5LSDl5OU1GL1BEb1JPbHc4?=
 =?utf-8?B?SXFKNUN6czdHZTd4N3R0bklWNGYvcUZkUmdKWjNGRHhIYmU1UlQ2bWZxMzFV?=
 =?utf-8?B?MkNrSUdDaWNwZHRxYkx4WDRwems3TDNyeDZmb2lGRWNWQVlvSWIyaTlaN1hG?=
 =?utf-8?B?U3kzc3F4RDNNeVA1YVJodWdCbEF6WFRveFlMY3dQNWpZMFhyckZJTUM3YjNh?=
 =?utf-8?B?bWR0V0FORWVYdEI3L0pabU1kY0ZlWitOU1RsbnVGanBxVnRjSE1LanF6TlBw?=
 =?utf-8?B?U1RZaTUwU05iMEljOHIyeWZ0UXZCYjFEN3RpT3NUMGQ5UURjOENyM0NFZjQy?=
 =?utf-8?B?TlNTSFJENDFrMCtWai8yME5XazVVM1MyU2JlQmJuTzE4czdMZW82RFRUNGFz?=
 =?utf-8?B?UHpZL214Mms2Sml4cndpcE9oU1ZHV3NYQ1g0MkZnOGY4NU9iYStySk1zVVJk?=
 =?utf-8?B?U0Q4WUN3ZDJyTnRlN2IxWFJjV28vbkxEeUtxYTdvVEZLN0Rvdno4NmhLclp0?=
 =?utf-8?B?aE5PcmU3VWNkcTN5aXpFTWc4SndGZ2JNeGpZUFhBWSs5MVd5bXllcVRRajRS?=
 =?utf-8?B?MjdWRkE3ZHpCeUxKRUQwUER0d1NhWXBZWTk1Sm1hc3E1RTkvRWVseThYaU85?=
 =?utf-8?B?SUtZUE55bHJwSTBmaTdRK2IxSzU5NUFidlVHbzVOQUpaSHFNTG5xWlZQY1oy?=
 =?utf-8?B?bHh2bEowZUs2ZVQ4NmlvQkQ2NUw1bW5yV0lYVEtpbmpHb25SSEdwTXNmTnpQ?=
 =?utf-8?B?WGpad2toNnZsRnFsbmRzcTYzeDBoa2Y2ZHFrQTQ2YVk3UkZKY25YbmF3OXho?=
 =?utf-8?B?ZG9lR2ovQTUrMDdjTGZFbDljeGMrMHM4c1JDeWU1MUtjdEs2b1dhaCtoVEdO?=
 =?utf-8?B?VlpuL3ZVdTg5b1ROYzZxc2J2NXdiMC8zWjBCekR5NldsYmlDQXBUYWc3NU1U?=
 =?utf-8?B?bGZQSjZZaStxTjc5VG84aDlKV3BFNUVRRndVd1ZDeGduZ1huZmNuc08xWGl5?=
 =?utf-8?B?YkhZL0hZYVZvQkJMdHZxa25VSG1wMEZ6K1hUQ0d2cXRZSUN0YWVuWFY4bWlh?=
 =?utf-8?B?UjNaYTZDQWZhMWNPanYwd3IwdnA1VDN2aGN3TC9Jb05Xa2pucFFyb1pxZUtt?=
 =?utf-8?B?UUZETzgvckdFRGJ1aTVSVjZkVGVkSGRWRHNCTEtSWGlYa2pCVWhQM0tvS245?=
 =?utf-8?B?YjliM1BnRU1vVzI0NUkzVFYvQmtQOXgrYWlCMXQzZiswa0IzL3FOUlk5WURV?=
 =?utf-8?B?MElQQk91YTZLbzVYbTFIUEVpV245ZS9tcWlZeTl0T1ZTMnoyUE5Da1FPUFhu?=
 =?utf-8?B?K29QNUowSmh4eWJob3dNSnhJVGFiYnpDbWZLOUdCTzFxbkJReVVDSjFHN1Rp?=
 =?utf-8?Q?VV3lepglJWZ2YLaB34o6Fkhgf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33217c4d-e635-401d-2895-08db003e5a1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 08:13:20.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqkK2eGyxrAnr7avLw1C5tm2uQrVMOjciRZf5uhv5WZhrBOEM3Jx3EZzSKSren/cdfpQIJWUP9gDc2qRHfOpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7373

On 27.01.2023 00:56, Stefano Stabellini wrote:
> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1641,6 +1641,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>>  {
>>      pcidevs_lock();
>>  
>> +    /* iommu->ats_list_lock is taken by the caller of this function */
> 
> This is a locking inversion. In all other places we take pcidevs_lock
> first, then ats_list_lock lock. For instance look at
> xen/drivers/passthrough/pci.c:deassign_device that is called with
> pcidevs_locked and then calls iommu_call(... reassign_device ...) which
> ends up taking ats_list_lock.
> 
> This is the only exception. I think we need to move the
> spin_lock(ats_list_lock) from qinval.c to here.

First question here is what the lock is meant to protect: Just the list,
or also the ATS state change (i.e. serializing enable and disable against
one another). In the latter case the lock also wants naming differently.

Second question is who is to acquire the lock. Why isn't this done _in_
{en,dis}able_ats_device() themselves? That would then allow to further
reduce the locked range, because at least the pci_find_ext_capability()
call and the final logging can occur without the lock held.

Jan

