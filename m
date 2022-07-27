Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3C5828C4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 16:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376234.608871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGi8P-0008RM-Vs; Wed, 27 Jul 2022 14:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376234.608871; Wed, 27 Jul 2022 14:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGi8P-0008PS-SR; Wed, 27 Jul 2022 14:35:37 +0000
Received: by outflank-mailman (input) for mailman id 376234;
 Wed, 27 Jul 2022 14:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGi8O-0008PM-Km
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 14:35:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600dcd6b-0db9-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 16:35:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4822.eurprd04.prod.outlook.com (2603:10a6:20b:a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 14:35:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 14:35:33 +0000
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
X-Inumbo-ID: 600dcd6b-0db9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROIVX14GLnxT/J6ZPk5YVu1kMVGMH/xfq3GkxW+jB5zZ7tQwYCHrFtDCEJJVEuGSF5pokqsQ8cQUgsS3Whgwv0+ChIXh/GcK49D5wyg0kvh+3W08RMrx3OW9lxDknIl7LNNIxs0N6WzkM7+HFp6IyZioef3Jtgsp/CDlgldbPrBnEpS5xKloBHQK0AM/NmGh1x1elPz2lX9ciBFonZUp8xaqfYQpJNO0Sm1siTG4Qlx+oDmHCHwxHzfKjkSZuhrLZQ0EWhC759yyu1g6ZDWEHzhJrocKh9YPp4jMb8rgPhsnj0iwx9rSFhPDQ9H6LjmYSNgvKVe7OJegAXTlJx5cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXqUcNOF3G5Yb9/Q8ml6EsXPGSoHXS4xG436JcArDjY=;
 b=kY3pMGGo1TuSA4y2W5X7jFLMCabcqy0zJEb9zssIfATunT5rufk7j+9r+1xnaG+mUo0Vk++jaw6whQ9XhCJJJT/3JhyZWCwyta2/KTnMbz2lXoSxh6hLpNV/hYmFHHulrry5YOHuNX/dzxnoa88q/pr8i3n1p+Vmvmct0zDhYYt9ia+sfQcSj/3zPkXYoRZv1kGUBm+e9d7wvA83nAnceWXP5Yn/4gGqJq0NGmF1RKSPXNuoVm4X6eOvhjJ1GTSQXhzOk/IroXSvWeAa2QtiVzqQRwf02y7/qty4A2x2w33w0HU957eID9/RK4sLV3eNCewylHbCtIu+55MdJWQHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXqUcNOF3G5Yb9/Q8ml6EsXPGSoHXS4xG436JcArDjY=;
 b=4pjQtrmuGO8l1X7e4VZETz3Kmda3IT5ro2CnCRb1YUyR5uzVbb/ZDaEumZN1bwTUe+Rwl483l782ywaPVWqMs7IQzz3qQMSndE89c4WpSbSz/N5eSa6pVwjZQ2hTSkqEPm56L6GIAeK7PaeaQgfXYFb3kjlvK7k02d9IclTsBPxFRQR99aO9ZUuDxd2hVv7zBsip6YHJsrgmv38CR6mgRvE7rH9l5J2QKaioxJn2X4umSCC/mjh+vIiQHJ8T19l7LZw3LODsmY0Jehib4G3uIY7Ws+ucX5FIxpu9EyePyexO/wFkhDjtInC6V+QBSo+C8GEkp3sPahzCM3eAULmQbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3947230-59f9-540a-4685-7e395e076fe8@suse.com>
Date: Wed, 27 Jul 2022 16:35:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 02/11] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-3-olekstysh@gmail.com>
 <51afa25b-93ea-2685-b238-2edd9292bece@suse.com>
 <2e0efae5-27f7-831d-6f9e-06d03374b716@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2e0efae5-27f7-831d-6f9e-06d03374b716@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47769f27-d847-43db-69c9-08da6fdd4341
X-MS-TrafficTypeDiagnostic: AM6PR04MB4822:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GaYOVk97aUhaPpNNjybRRdI0HGWsvU1ERImiv5pq45p8ioHv6L8xm/5SXawUqYCYEt/OZdLh4Z6rb+3649T89UYeWv8G9qKwaMMylT70LpQ0rJY5IkSN2Q5x5idv0+2L+Izgnmm4t3+BkzXWVejQTXyGMLCShcJZOdw6oBv/XlOIHWiMYFYyyCorHPFBlK7p7Yr4uHCrIY90PHqevdb8bGBWKqZNYuy1Fj9P1pZ6qc8Xkki3Iqr25PPH3HuwC5GqASj3y6bY88EpuM0r3rGsWZBRpNKgChc+ROCCURflmPlnw6NX3n36q3vIvGyxvyjSao9BWuZN7wk7yk7CMa5rAoyAtb1OEZK+4F/XG3LVno4lkuJZs++ty/sa6sNihQlH25uxPrUaGGtLfRGJaSEqYDxZnUuDeWQHHnxfq7F/3x7xKWUEiaLIkokw5McPC5u1hKylfIqW39ZYKnfKSNHPhI1yVgiy848YYqLx/B1PrvoATxMF685aK4rYliXlYPbIjsaqhaZKNXE5dcavnePGNFFva9MdGiRv6tyOIV25O2aFYqokB7QOEwagQTMnCzpYfWe+hrVRmj8lWsanvtbsaVkeNJnec6gxXlGjJ/BRbo7ZkDtrqEFZXAlKsqGaKrNxPTEbSmLKaNt9iOfyzIoQo5gwvJ7nLQBLNZ0VYVGD1KH21Yq9wQiDoULqKiF6WIM9YySIm0EMkg6kmUydV9K09tRo9jM18kiZKyU8IVjG153P6vYia4UQvZqEVPHqwWJm/AgMS7pqPSXS5m756i2e/0vln7lkv15ma0GeHAIguWv2UFHp+r8rrmES/ZA6lpGku5uWuJSenMrXvz/RWlL6Og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(346002)(39860400002)(366004)(8936002)(316002)(36756003)(2906002)(38100700002)(53546011)(2616005)(26005)(31696002)(6916009)(54906003)(83380400001)(86362001)(186003)(31686004)(66476007)(6512007)(8676002)(4326008)(6506007)(66556008)(41300700001)(66946007)(478600001)(6486002)(4744005)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MllCbFRMdTZIaVY4eTVKS29OTmVtb0RYbzFtcjd5NE50R2tqVmdkeGd4N2Jp?=
 =?utf-8?B?clZhVnRHSEM0SzlGTXloR1JmcnVyUzBWRE9RMnJ4SkJiY3VPNk53bVN0QUZ1?=
 =?utf-8?B?WGY3SmJuWHNGS1NtdWkvSUxXWjhzdGJOVVdUVHFDTDlaV2ExNWhQc1VVN2dO?=
 =?utf-8?B?NExNUGVHeHRGazgzZlk3V2UxUFpXcW9mL1U2LzY5OWVYb3pkM005anZBbUxN?=
 =?utf-8?B?L1ZmU1BOSXJJeUxkU2g5ZDFITzFJRlBHWHZkVENRMEFzUlpkOU1XM21DaEtx?=
 =?utf-8?B?bDF4R2FmMFdwd29WbmFrUlV1ZHBLUkh4MWxwYkdQS0VDVU1mN29zN1lSVGFH?=
 =?utf-8?B?VE01cmVXZE9QbDJreVE5RXltcm9SYzNQNXBaQ3pqRnpuSEhjRlVFR3lHekps?=
 =?utf-8?B?UTRkajF5ZjF6cjJmUm1jSFZaemozTUFBNGdVYjRwaDkwekZpS1VYNmc4TzJh?=
 =?utf-8?B?c2VyQzY5YzVUaUdFeFJCZHFWbksxcHNtYnpuSlFOc1JPSVNhc1JpSzNmMGVX?=
 =?utf-8?B?UEZveFpxTGdKV3FtS0RHa29VRVhRaGF1MFQxU1NCR3RibHNKMHUwRnprTk1r?=
 =?utf-8?B?NWhZT3VVMWJuM3RMdkN5akttV2RYN0VsRU5Id1ZKZmZ3aXVMNGxiK3RkZVNB?=
 =?utf-8?B?bTlpTk94ckV3UXZOYlpXTE9lTlFzdzcxMDFES1dVRDVVQUN5Z01oT1JEUHQ3?=
 =?utf-8?B?SnNGOWRMRzlMQWVuMFAweHcvMXJKTUxrUU5aeGdOQ3dOSU54SElVSDJrWDQy?=
 =?utf-8?B?Qy9jQXRFMHNVZGdQM2x4UkVYaFYrS2ZYR1kwUi9nNFV5NlRDUkJqdVZQOUsx?=
 =?utf-8?B?UUF6YU96TnE5bTlUL0tENHdXcWFKWU1Vd1V6d0t4SHVYTHBUd1pxQjhGUjR2?=
 =?utf-8?B?SnZXRkw5bWhTanRRWjllZm9IeWMveE8wSUYxd0NsWDhSeXEzNU9hdTk5NHBC?=
 =?utf-8?B?akZqNTZOVzBNWWJxQ0FpRjJ2czZtQ3N3Z05uZGdLaVIzMUtvWjVNaU4xWENk?=
 =?utf-8?B?d0ozUDYrbmd2ZGJoUkpwMEtZbCt3a1JqNVNKWDhhbHVBN2o4empPUktlaVJw?=
 =?utf-8?B?b01FZDduSnNuYlZvQ2tPc0wyZXg4ZFI4TjVWamJnRHEwaGFzbjlndHRBY056?=
 =?utf-8?B?TnhQVmdaVFdrK0N4MkMvOVJnV0NJN0NWUWVEM29SN0lVcjFEeWI2VTZyL0Er?=
 =?utf-8?B?YlFnYlh0SHhhQW12UWtORnpSTndDUDk0RGl1Z0Fub2ZqWTBRYnRFTStCeGk3?=
 =?utf-8?B?K0RWaEFkYWpxUGl1d25mQkd1NHI3Q3NNNTBpOW1hNGVXVjFQUkkyN0dyTDhs?=
 =?utf-8?B?cWgxRFVmbGJwOGt5QUVuVUp2ek94RU1wV3N2WiswbnJML1NYMy91bVQ0ZkR6?=
 =?utf-8?B?aXJId2M4VWQyQU5Rb0cxSlBTK2lzVDFKRDhWUll3SEUvYWRQc2xqYnN4cEsx?=
 =?utf-8?B?dnpOQmU3dDc1Y3FwaUdMYlFoNkNTMVFkUjFOZUVTYmhpWlZTbFM1MUNtTlo4?=
 =?utf-8?B?bzRjQUx6NUsxU1lQQm9mWU52cWVNb2RpcTZTN2trdExSQ3gwYldjTmNVRUlu?=
 =?utf-8?B?cHdHb3ZSTHcvQkowUFhDTzdkZjNMdUlJV3VnM09IK1VCT2syZ0xqRk9teEN5?=
 =?utf-8?B?bEpiYkswMytNNmVScHRVWDdXbnloWGY5NUNlWXV2cFIyTFp2TWNrdmJKbC9h?=
 =?utf-8?B?bGlnWHMxUGF1UUJaKzVNeWx4UU9lUEdpWWVoL2phT1Yvd051R0NmNDdjS1dQ?=
 =?utf-8?B?Z0E4VUZsczhtV0dsY0dMdjJBNVp3TTFvUDhDamRIUmNXaWs0ZWh3MzNjL3Vw?=
 =?utf-8?B?Y0tzQ2xRMThHUkRiNnpSVHhTaTR2S3FGYmFhWDVZbC9PWXIxU3kwWllmRnNz?=
 =?utf-8?B?S3pubzEzbTgzUitnUTBEazF5R0tWSWNVaW9pVXlJVHBkcGk3eEw2aTZCMTYx?=
 =?utf-8?B?RG1tUVlQQTZQc3p4T0diQ0tsdHRGYmc3WkFCdDN3TTJmRWJrc2lJM0RaRHBu?=
 =?utf-8?B?RnZBaC9TVHlvVG4xZEVpRWVwL3pYcVgzdnFWRE5TSEwzQlBDRHJKRjI5MnVU?=
 =?utf-8?B?cnFpRGtFeGdVR1B0bkVheXNwNk5KNmhSK2d0VFAwY0UrVnRBdlMwU1dyQWhL?=
 =?utf-8?Q?ZwGDzVIryh5f9PvtqucAxwtUU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47769f27-d847-43db-69c9-08da6fdd4341
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:35:33.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIxSAQoewpZYQTioBKNHkKa8yA+Z4Hf3zGQWUhXdPwOSj8GG+ZiWco7VxswQ3PuFLW65EbAwlpAVBcuZ4YLRLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4822

On 27.07.2022 16:01, Oleksandr wrote:
> On 27.07.22 13:03, Jan Beulich wrote:
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> @@ -1603,6 +1610,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>                           pci_to_dev(pdev), flag);
>>>       }
>>>   
>>> +    rc = vpci_assign_device(pdev);
>>> +    if ( rc && deassign_device(d, seg, bus, old_devfn) )
>> ... use pdev->devfn here.
> 
> 
> Thanks, good point, will drop old_devfn and use pdev->devfn. I am 
> wondering whether the printk after "done:" label (and other possible 
> printk-s down the code) should really use pdev->devfn instead of devfn 
> in PCI_SBDF construct?

Yes, that's intended: If assigning a phantom function fails, this
should be distinguishable from failure to assign the real device.

Jan

