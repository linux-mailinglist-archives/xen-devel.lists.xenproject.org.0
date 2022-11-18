Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E562F58A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445748.701096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow162-00055M-RU; Fri, 18 Nov 2022 13:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445748.701096; Fri, 18 Nov 2022 13:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow162-00053D-Ob; Fri, 18 Nov 2022 13:07:54 +0000
Received: by outflank-mailman (input) for mailman id 445748;
 Fri, 18 Nov 2022 13:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow161-000533-QT
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:07:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 023cdf6e-6742-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:07:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 13:07:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 13:07:50 +0000
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
X-Inumbo-ID: 023cdf6e-6742-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8PUtd35oirKymh9ERMG6KexNqDPGaMz8tVODYcpKy5F2uPIFF5ikearzrxpKwEErdneRm5PhHAB/HOdYiU4ZuuIRPU9y6sp4r94hStuSwf2EYmNrRtBX4popTpLDPytnpqVa4qyMFrxpJ5e/PoffpwEeKlTSzRDLwjqBwMX3wWG908sQiH0fPVi5bDbhSxCxL5bfYL8yj0Y7xHfVeIsPGjGPOqA4Va3Cp6hSOkuB4o4qQd6ePb6P+RkMLzyw8/rjKCKgdG52moL4GoH4YwpMpMyawDqahgV2L5nSyZHSGo2ub6N8uab3bbi+D+aESigLyt64//IHEuvlP5GGZekJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj+wN79UIU++EZEPDK8h9OnzJpEAaIWwPp7bth08jRw=;
 b=U1INVGbgBcMTVyLRasD07llkkZCNVpZIt41X37OZ29tgRNaD6upEgxwFznwd6nB9B6ZfpsIwAmOjBYBMQVX6oZ77lBduWNfi0749+wNU0ycrnKbq65vIZo4E/qn7yKjH3mFRS1siDWNwwV+sSrYf6oxvKPFt1yr1GQvuRMl1iYMAoiTFqxcfjwhbIyd2DGYjtrsEqv+9cn6IhtnOfq5ruzPxHhgrq8iY0W1mtlRKDVT1uehtipbr+bURNU7ZrsZS9mrW4ou/1/6w+2+LDYNxHW/YiQeQtgmWO+ISMpvY/1i+ZLHJmHuFLzZFTgWG8/91YrlHGolurzIiB3z3ui1Fxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj+wN79UIU++EZEPDK8h9OnzJpEAaIWwPp7bth08jRw=;
 b=rW0H3reDWSTkAtBpMzrVd7dIRNUwcWh8QAnS+th8JWL9wK/J1PmgneAbGdMNBrjguSEQAx46tAl+tSn+m72AB2k18HmQajE+dhavR998T5otQ0ZeUPh4jbz0Z+hzXf6ueYkeQN6n0oW0e9c1R61SYZw0+R+A+8w3kkPOVooCl/pdZjBhvvPrsjsW3i80XhKTFxiTI2n0Iyzsvhbqm56JtLpWQCnUG0/Z1ERdgnPATCruwqkBhS/HCIaUyukGLey5CgKqinuAY/8IbpdsScec5LYxPlth/y0U32ocsv+EmrAtFFviOsZCgQbCyu5UHehHGNTcxXKhUA+pyd+QYBXiDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6566ca22-e1fd-6e5b-3401-25838d7c5c17@suse.com>
Date: Fri, 18 Nov 2022 14:07:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com> <Y3ZwAJITlD/rSf/n@mail-itl>
 <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com> <Y3d4aW4LjYwEZ85Z@mail-itl>
 <9d034957-822c-74ba-9aea-0944cc456870@suse.com> <Y3eB5+GEQ36X9LnR@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3eB5+GEQ36X9LnR@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 53889188-6f46-4d6c-7623-08dac965e582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Pw1LdIZghYKKvDKjC9wS2gXmCK3HSfiJ0NEv7eAMkTtIW0hEthaObpHv9P63pmc80oBQBQB2/tbvPwuoEvMwy+vgGwxu/zXRAkVorxxUmU/AenHKqqfQZpK1bQqVQCgKNVonlPihggkfuE7PCmp66tKh3wVgbMJj+mp58B3nTaHZIjMQMDLCvFD2l3uSvrBADEa+On4YoO2ZOh2VcKvLlL1Jwkk0kiSwFav2IhXqnQXQ0pH6oP8fK4PU9S78ffoljV97PJAzoymPfVyNM19n1tI/FC8SY7jhCy7nwN3aFZb9u8avq6NcrtXG3Jfg9AEtj5ANdMo8ZLcVwd3MFLNN80YinXv2CMWbeesARiCJRgzvywoG6bh9rwKDFBMW8Ks/7GPhBkv3Js8CRuS3lYIqhwxc22CMapQDM7y1vP9rXONeAa7kHqV2LRhSaiI1S6mWQUnHNEryAqQRw7kbZ2suDJG2ovx8sArQEYhjVj5QW7f7urYMuxIWTKIBv083Yz09MYKvkILiD80tr2P4NKSTYA0xOPAjFJOEPFJSnYChOPI9ThD1GIxRMo9+Ov7vJa9/iugD3wr2dsFAUkV3UoogQSuR66E2NSdbFq5RBkoM0zTplvf3h+0P2zsfwsK8h7VyoO+Iq3NFDGEs1P3ZwrvQhxDk/56qouGckgAvnE7CY1I0JaBpVzh/NJPUUgUHafOfWV1rI9X6Ik/Mnt7gHoy4+QCDPau/x5mT/Pq3YOqjB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(478600001)(31686004)(6486002)(8676002)(26005)(66476007)(8936002)(4326008)(66946007)(36756003)(66556008)(6512007)(186003)(5660300002)(53546011)(6916009)(6506007)(316002)(54906003)(2616005)(2906002)(86362001)(31696002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1hlYzE5TUpYMlh3VjB3blg5RFB2NzFxcTNRcEpWMndOMGdxUUprdVhINE1u?=
 =?utf-8?B?N3dkM1RYZ1oyK3hwZmd3YU1lUE9rYkJoMVQ4cms1MXIwYlViTExQTUJGQ0l5?=
 =?utf-8?B?Z255OVR3R1BmMFY2VFFJK25scUI5eFpqaVZJUGwvT1huVnU0NnBxc2gvcHNh?=
 =?utf-8?B?QXpLbERuREZIZFFUTSt5OTJxRmdnYmd0WVhMeCtNeGJrdmNUNHBnQVZYYmN4?=
 =?utf-8?B?eDYvaGVoVEd1R1hTZ0tVeDNoa295aW01WmM0aEZFV01tSzc1SWpDTmRZVzdN?=
 =?utf-8?B?MzhlWnBGVmFKTi82N1lmb0pMNGNEd2V1ODZienB2RUVKV25UYnFENU53emVp?=
 =?utf-8?B?alN4TDJ6TlZLVVVyZDhGc1NHVk1GYldiWDlTaEZDa29ZZUpHMW5Ib1pGQVov?=
 =?utf-8?B?aWljMWRLRStMZ2JDd0RXM1h3YmdNUUR1dk9obGEwbFhOd004K1U4bDl6N1VK?=
 =?utf-8?B?bUxMbzFxbUExaU9sV0RUUkllN2wydkF0ZzZXTEk2NW9lRkdWYVU1a2c2WFFC?=
 =?utf-8?B?ejc5TVdhQ3R5WDVldHVoOVUvSmVOWlB4c254ZHNxenZuVGptYjFtcURTejVq?=
 =?utf-8?B?cUVQaG81SVRaUVk5VEUyUm5yYllaUWo0RE1mSkxNOG5CYlBzajBsdk1CclZR?=
 =?utf-8?B?OXNQZjZ5Nml0ekNUNnRFVk9TN0Z4Mk9vV3FhYXY5cjAzUG1aVDNKREtEYi9N?=
 =?utf-8?B?eWJ3ZmlzTlBuTUtHSk5qVlZta01SeXBuUExYVDBnRk5HSld5RC9MYW56N0JL?=
 =?utf-8?B?NS9ZQm15MFR5MTJVTEg5Lzhsa1djcmtIVUhSN1hJV2RwN1htdzUxcnV0L1RX?=
 =?utf-8?B?Ny9LQU81SGdmdmpaeGVpSDVaTnN5Z1dnZnpTOUNuekpuaHBjM1NTekV1dVkv?=
 =?utf-8?B?czMwYXlHajFMZjd1VkNsT2p6cGtZNUQyRllHWmVVS3dwb1BkaEl0QTdvOFJl?=
 =?utf-8?B?QUVYazRaQkJBeTZKOFF4dGRGRkp4V2RlSVk1U3JqNkNWUVhISVFIeE9vYUxQ?=
 =?utf-8?B?WkgrTVRDVDd0K29pMDREWGg1dVN4eG53RWNSM2N1Y3EvaXJHMW94aUFKTi9P?=
 =?utf-8?B?V3ZkM3lhQVNlZWZVcFZiYUVNTFlSZEdzOXFxS1JmV2NmV0Iza2Fkd213Zkdi?=
 =?utf-8?B?UUNJQTc4V0huc1dxaXYvb0hqeTJ1M0ZMcFV6aVkvMjdGeGxVdmdRN1R2c3dx?=
 =?utf-8?B?NHVDc3BzVFNIUGkzME0wTk1KQ24xT2MrVHgrQitGRG9ucHN1UytHOEhHRmxx?=
 =?utf-8?B?bHVOUWFCSnlLSHk4ZWVmdkg1Q3B6cG1vcXo2NnZYMU5jUmFSODN0cDBrMFo0?=
 =?utf-8?B?Q0p0SmxObkV4czZsaWJZU1VRZ3FRU3R3dm1GWFNydUFDMFRDejJXNlZYMHlu?=
 =?utf-8?B?eUN4RGVLSTdjVWhRVXhtY21IWHkvTVhhdGJGOHZtRWZ3amEwZGJmS1JlNHRz?=
 =?utf-8?B?QkIyRlpIL3dsaGFFczVuQytHWis3OHRMMUI1Rm4zbUlSTXM3WTBRMXFHeWxq?=
 =?utf-8?B?Q2tDNGNrUUQwSDVQckozZkhpVHRXSVRxZ1BhdG1zVWxGbnRJd1F0YzRvRit5?=
 =?utf-8?B?eE4wWVBSdjFSRGVzQXJ2aWJ4cTBnZ3p3emFyQ2E3TjdJemVIVGpCaVM2cjdM?=
 =?utf-8?B?Njdlbm85ZHRCZVFUc1dCQjF2ZmQ1TG1IcGttZmZ3OXo3WVhBOU45dk14Qk5v?=
 =?utf-8?B?QUV6bVVFUzNBTWlRWUlhM0NwbCtuS2Z2OEEra3RKdk1IUFFNK2thTm9saGh4?=
 =?utf-8?B?elFsV3BjbEJXOFdIc3BQOGpKM2J1Z3BjRHBJUllBbzRzajdjcG13blNYTVZ6?=
 =?utf-8?B?a1FuZFU2OUw2TmZjMERJeVFMY3B2RzlyOGszWUxOdDBVYXVSSnRLbzRhZ203?=
 =?utf-8?B?ellCWVNiK2o1Qm13Q0ZDNVpuVzV2TkEyU3VUMEdIZ2U4UllPQWdPOXlLdE1P?=
 =?utf-8?B?VSt2OUtPcHB5T2xua0Z4N0RtbHVTRy9CN2FsN0xUWTVQTjZvS01Ec1g2OEgv?=
 =?utf-8?B?ODRJdW1ZOHF4U1QxOXpPYzByTDNFM3FKTUhyM2dTUU9HcGNmUlpPSlU3TFJU?=
 =?utf-8?B?N0lubjg5NnUzREgrODdzd2hHZm5oLzllSWJ1Z0dPL3RVTTN5cEhHVkZMc09U?=
 =?utf-8?Q?sISbEadtNdUOBAxxdldT1xgel?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53889188-6f46-4d6c-7623-08dac965e582
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:07:50.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amQwVAtWZhaQjaX9xrsfPOJar1N+P9Fdcm7yjmUaqZLTgb8gbxwDLpGzmPBHzKyMyq64sddSgKzZUzddeANVkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

On 18.11.2022 14:00, Marek Marczykowski-Górecki wrote:
> On Fri, Nov 18, 2022 at 01:33:39PM +0100, Jan Beulich wrote:
>> On 18.11.2022 13:19, Marek Marczykowski-Górecki wrote:
>>> On Fri, Nov 18, 2022 at 08:20:14AM +0100, Jan Beulich wrote:
>>>> On 17.11.2022 18:31, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
>>>>>> Which in turn raises the question: Do you need to handle reads
>>>>>> in the new code in the first place?
>>>>>
>>>>> The page not being mapped is also the reason why I do need to handle
>>>>> reads too.
>>>>
>>>> Just for my own clarity: You mean "not mapped to qemu" here?
>>>
>>> No, to the HVM domain (in p2m). Xen (outside of MSI-X specific code for
>>> HVM) doesn't know where those reads should be from.
>>
>> Hmm, I was expecting them to be mapped r/o to the guest, but perhaps I'm
>> misremembering. Clearly both ept_p2m_type_to_flags() and
>> p2m_type_to_flags() take mmio_ro_ranges into consideration, which is
>> what I was basing my understanding on (without having looked at other
>> places in detail).
> 
> Qemu doesn't map the page (using xc_domain_memory_mapping()) where MSI-X
> table lives. I tried to modify this part, but it resulted in EPT
> violation on write attempt (and my emulation code wasn't called at all).

Well, yes - that leads to the other path I pointed you at, which is
used for both HVM and PV (and which, as per what you say, then looks
to be relevant for PVH only right now).

Jan

