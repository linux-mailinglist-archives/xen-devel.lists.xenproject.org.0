Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF1565A9A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 18:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360459.589854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OaE-000347-PG; Mon, 04 Jul 2022 16:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360459.589854; Mon, 04 Jul 2022 16:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8OaE-00032L-M9; Mon, 04 Jul 2022 16:05:58 +0000
Received: by outflank-mailman (input) for mailman id 360459;
 Mon, 04 Jul 2022 16:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8OaD-00032F-0l
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 16:05:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150054.outbound.protection.outlook.com [40.107.15.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f52f557-fbb3-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 18:05:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4938.eurprd04.prod.outlook.com (2603:10a6:10:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 16:05:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:05:53 +0000
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
X-Inumbo-ID: 2f52f557-fbb3-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNKOepDS7ON4SPkWN2DLttn0mAaQL1HpIH7Y+VYc4mLjmscmX4qym6QAqUN8XAbZ2CV5p/jtmIDsu9tydjOjcZtOMnaIGznrT5qKJrlRMybZ3mxFanIEOxsAT1fVPr2vUFDzYQtG2YPLmqo8Ae6hWq5jaxaOD3OsDqi5XhHjsbvAVI4qsKL8slnOZYcWt0Yg0RnfED+VGn1ltfJvxd4mFDM8wgYSqK10GWXV0AcjVHn+UYNDWJ1wFz0dXQH4Sbf7TAMRA6qU6LWy++amjrWcc0ZTS/NkhwTp7Jaeur3W9xHNmvMmxhmFWK5rssHsxnbOA2ww7j46msszSbnArZL09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m47xhOm/aDXB9ZZsWzK6a2O0sUtKynKll9WL+JTuz/I=;
 b=j3dP8IVp69JeWnQn7kYBX7owww7Va+NyUmQtME5hlRcYH/QemznXjeoDVmbNaVL0ZrwC7Cn2qWfFhkSHyi+Hp/8C06WKJySxeKxillxa9oEEC+EpbdyMa4RuBcuJkXFxn/l0LqJbCP/gKBEIMzYuiVv4R0wAYxpVw526ou9cQAIy9rCZeRtJlyvlnzWDcxBrsDO47QbNAPOwzCxdyma31JHpe3RM/hZ5DOIQRbfGrMz0UDICTHMP7XGp5kcGjZpb/kJCHCM6m6p0CXwHCwl8sf1vH8nJQtVD6H/PxpnBFZDUk5+eAFQIN+eElEp8+tijxYr7D6Z5oSaiw7tVSWbw1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m47xhOm/aDXB9ZZsWzK6a2O0sUtKynKll9WL+JTuz/I=;
 b=KGRZHStIJIaSvsG9e3I5PXrEyfi0G/J/ttkvSsWPBFCf0dEnMZzjIdjzkk2SUzHvZhfd1u1yHT6Oqw5VL7+rpIepxVLQf0IUhdX7UzdLhoLdXKUomQUpU6BD3/7Na9j3IauNDhMXrc9jHBfspffCHpSkFmG0Z/Eq6g+omcge4qCJe6D1xkdye25j3pKR5vXKLvb9TAPDjzR5k+stiQtQ20YkixD3AlvGcz/NNDoVief61DJGZNDdQaAV6rO9r3BSFT2UFf/XBkKduPB0LSxHaFj4e+2MrtQM+Jjs0ucXSL1hr1QC57ATMq7IcblGAWifw6zi774ffRPa38tS+opx0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c3e3ea2-81e8-34f7-1ebb-e4bd260367be@suse.com>
Date: Mon, 4 Jul 2022 18:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>,
 "G.R." <firemeteor@users.sourceforge.net>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsMIO3E5/hzFgxSa@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b49c9dff-c714-4348-3072-08da5dd7128d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4938:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TmYPU6T1rEORqdiCLLS+zrNTdIKsjlr42x+ErtU0pSDAujoPzIpyQzx7tjHJsz/ZTMxCrSQdtLrbk9Iv8RqRcJ8rZrx0IBd8+h9PQPB3H4cPmA0KSN6jZeNB2fyX1u5e1hHi4ffHqF8NOaHAE6VBqGK5p9AI1jqN1ayImxvuSaW930TPWtfcVewcxLoxDaxhbiam8VUkR7rn3wN7JfbgiRNx5eQ6Tb2m4mlGBQIzMLghIX18KkC319qHTII5cGYIKhUQA5ZJ5Zg2Cw8Xu3hGwvV+y8bRBdsW/jP5M2fozxmmen4B+UYA+/63/fazZNOaeiWD5YOviokPHORqVPaTCbaVR/7Jw4Knpg5plLbKVMh4shqdHWWXljqMUzXD2fVEK6UMBmwnkugfTo6BnlrhcEwrbcJTV2uyZ+BekR5mUWR4yQcnDyknTJIIH9oTAE+uJWkWSc0hdjvvjJIChXQPU0GQ//Vh52ZNFCt/6xI/G3597dDicj+gF35v+5ISL2EOvWxgZ5sC8W6oYxDR4EzyTHF3dYDeuYKv6xcpNuNWkQDARRY0dUUzNDZT1LAX0x8DRoM0vULFswiFnhs3dRAqwmWSWt+3J+v5CCbrobyRWN86HrcOrzrCDzx449XO01tmhLH6LxC+0VkiA8Gs3SmWN0VrfkGsP6xLGeTWf5yNhtkw6rhL4LI7Zk5bA6vPFYj034GPO1t0U5po61YNCjQqOWNkolVVpZkqgN7dhfFrqvuzaS+qciQE43tqAMy+b5ulSYER2qRzRY3MWeHr31IZkp/8hVjYe4E71h5YrbEOCh9HsFWAMHRJoTfdjLPHvQ+0eB6wmEXbVGi4onRnVnL+z/2BRZ/g0tKkoHC/pNBH/t2UtStWwoHbgumRG7Ux95UG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(376002)(39860400002)(8936002)(4326008)(6916009)(316002)(86362001)(66556008)(66946007)(38100700002)(8676002)(66476007)(54906003)(2616005)(31696002)(26005)(6512007)(6506007)(53546011)(41300700001)(6486002)(478600001)(5660300002)(2906002)(83380400001)(966005)(31686004)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1VKM1BqakJ2WUNxWUZTTG83VXFDTG1mSndtaGlNSVZsdWU2eDhZZmJCSDBH?=
 =?utf-8?B?dnVuaDJ3V09Rd3BzdmRNMmVDeFBxbmt3NEUvbDdFSGRzUFJ1c0tKTUtZU1dB?=
 =?utf-8?B?bmpiTXVFOFFjMmowNnFZSVg0b0IzazA3Q0E1dHJXRFgvQ29mN1h1S1BkVU5O?=
 =?utf-8?B?M29iaGYwTzB4YVVlZVZCUnBEb3pXc2ZHOU84bHZIMzcxTDRVY0xDUGhlWlBT?=
 =?utf-8?B?eXQ5RnlNZzgwOEo2VmQwR0htQWdzWERkTk44SDJtQ0JuSng4RERmYTJJU1JZ?=
 =?utf-8?B?cjhodVM4UnJjVDJZN1c1NE9GdXlyVmxiUFl2N0J2SEE5OFRSaVhOWWFBUVY3?=
 =?utf-8?B?VFdlOE9RWmw4cUZtcXhtdEgyN1ZEZmw3cFNZdHEvUHV6eU9DeFFiZ3VOUFQv?=
 =?utf-8?B?SmQxNktsZDNsb3gvS3U4YVhuU1ZHUmtydzlndE4wWkprNU40b3c5bnRBTi84?=
 =?utf-8?B?Y3VsRi84bnJ4ZnM4bko2M2hhNDJ4YnVjNTJ5VHpTVnFkVzh1ODZWN1E5bU1Y?=
 =?utf-8?B?dkJuY01KNXlpd2lsamgvb3cwUjF4MmNHVU5DN0xydDduOTBOeVBLbGZucHVJ?=
 =?utf-8?B?cnEvTzkxKzlsbFA3VFhQajhybnpSZ3IwQzlEK2ppdnpJZG5xaSs2MDA4eWlp?=
 =?utf-8?B?S0M3cFdMZzhrcmJkLzZsd3k0dTVZSmpXaEtxT3RrWWxGSExOeCtBbk1sNVNR?=
 =?utf-8?B?Y0d2aE1QcUpCaG8yKy9lTXZKb1l3VE50VWh5M1ZtL0R2U0Mxalh0YWVGMFFV?=
 =?utf-8?B?Um1JVVhZRFBwTlUrbVJ5TitJaHJ2eEhHQ2JzNUgyeDdveS8wMXVhVUwyRW1j?=
 =?utf-8?B?QTJQbFp2L2tnZkFveFN0ZUs4enY3UzZFcFFJMEVFVlF6ZWg0TnJHVU56c0JH?=
 =?utf-8?B?VnpJaENYM2JCSXZZaVkyY0wwZDFFZWU3b2JEZUkxZDJTb0hEdldwSUprOFNa?=
 =?utf-8?B?VVZvR2h3SGFKdFBhakdGVUZta2RaYy9vQTNweDdOWUdYT0lCR1c3SFZCZStO?=
 =?utf-8?B?VzBOdXBjcDRySml5dkVkdkU2a0ppSXJLbXQ0UWUrVCszR2xpUE40UlQ4TTB3?=
 =?utf-8?B?NjM2UFZlWmJaVGJzc1J4aGt5aHBvNm9uMXBoQnAyLzFCanJobTBvbU5BTTht?=
 =?utf-8?B?RkJzVy9oUVA4NWI4bGp6NlJ3bHN0MDN0T1Z4NWZaVVFLZ0kvU0tMd3IrNjZk?=
 =?utf-8?B?bTQ4YmF0MmV6VkVUOFBHV2htWHpXYmVyNWVXWlkwcFR5aldPMEhnRzRNQlRv?=
 =?utf-8?B?cWdrQnJxZ0xFOTk5dGpWTHNqRll6aDdHSk5ZR3g3cVhRMEYrN2c3T09kUzRT?=
 =?utf-8?B?bFN0QzNSWHFtNE9SZEl2emg2NHVjWEppdUpQLytHRGpJOCtFZWdROFVtRkNj?=
 =?utf-8?B?T0Q3dWtOZ2RmKzRlTGRwSDQrSHJENElHLzJia3NUcnBtTWhOcm1aeDJlcWZa?=
 =?utf-8?B?eHQ3ZisxUkFjRUF5bENoQTlWTG9pZ3M4TnhlQ3BFNGl6VHA0TmtGMldRRkZ4?=
 =?utf-8?B?YkdKdzhlb0tSalBKcExTUFQ1dzAwMTFJSnRtTkFESlZNSUovRG9KZWRRRTIr?=
 =?utf-8?B?NkhsWmdqT0FsNk1Id2c2cHNwaGhacUV4VlNKT3hLaVFhMk10bkpRTS9UZGVx?=
 =?utf-8?B?ZGZEVEZDREE4K05RUldhMHlady9BUVM3eXJCVDROU25BYmxqbUVCWkhzVzdP?=
 =?utf-8?B?RlJRSDRZc1FkS0NNcDRwOHZBVlI4WVY2T3E4dThJT3dGdmk5ajUwd3NZUGdj?=
 =?utf-8?B?SGtPUU1OZFJwbjlKK2hBbXhtMVhYVUxjMkY1dkhGbGNhb2Z3SnNVSTBGaVh4?=
 =?utf-8?B?dUxoS3ZGc3Brd0FuTzFtUWtPZHZqUmwvelpTZXdGUU9hUTZQUDUzdzgvaVlD?=
 =?utf-8?B?azJUVjIyYkNCY0c1akpKaitRR1Q3U2RFMFYwVEcvTUZHMWlQcjExN0wvdWpi?=
 =?utf-8?B?bE1BN2M5NTNmK3Q1ZHhnNjhNM2wwN3ZwbXZQd2NiempjdFRJK01PUXBaZ1NO?=
 =?utf-8?B?eUhZa3Q4WURWa1JEK05VVzJodDcvTmdtQ0NPVnMzQUlaTysreWZPWVk0SjUy?=
 =?utf-8?B?VGYxODdUd3pzSEkybEZhVGhuckYwMWFNNjcvTDd2MTRHTmdTVFg4MTFTNHJi?=
 =?utf-8?Q?ppijyr7Ypfc+nnyYPUuAQ+fky?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49c9dff-c714-4348-3072-08da5dd7128d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 16:05:53.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9U1Rh/KL9YwQQPZhXrJW6su+ZxO8jrv9PHnXdv4Wgcw/VIRHDaFOJ5yIOnb8/4kkC42/BKuw1hWSj0FgzLEQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4938

On 04.07.2022 17:33, Roger Pau Monné wrote:
> On Mon, Jul 04, 2022 at 10:51:53PM +0800, G.R. wrote:
>> On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>
>>>> 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a (prog-if 02 [NVM Express])
>>>>       Subsystem: Sandisk Corp Device 501a
>>>>       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>>>>       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>       Latency: 0, Cache Line Size: 64 bytes
>>>>       Interrupt: pin A routed to IRQ 16
>>>>       NUMA node: 0
>>>>       IOMMU group: 13
>>>>       Region 0: Memory at a2600000 (64-bit, non-prefetchable) [size=16K]
>>>>       Region 4: Memory at a2604000 (64-bit, non-prefetchable) [size=256]
>>>
>>> I think I'm slightly confused, the overlapping happens at:
>>>
>>> (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
>>>
>>> So it's MFNs 0xa2616 and 0xa2504, yet none of those are in the BAR
>>> ranges of this device.
>>>
>>> Can you paste the lspci -vvv output for any other device you are also
>>> passing through to this guest?
>>>
>>
>> I just realized that the address may change in different environments.
>> In previous email chains, I used a cached dump from a Linux
>> environment running outside the hypervisor.
>> Sorry for the confusion. Refreshing with a XEN dom0 dump.
>>
>> The other device I used is a SATA controller. I think I can get what
>> you are looking for now.
>> Both a2616 and a2504 are found!
>>
>> 00:17.0 SATA controller: Intel Corporation Cannon Lake PCH SATA AHCI
>> Controller (rev 10) (prog-if 01 [AHCI 1.0])
>>         DeviceName: Onboard - SATA
>>         Subsystem: Gigabyte Technology Co., Ltd Cannon Lake PCH SATA
>> AHCI Controller
>>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
>> ParErr- Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
>>> TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Interrupt: pin A routed to IRQ 16
>>         Region 0: Memory at a2610000 (32-bit, non-prefetchable) [size=8K]
>>         Region 1: Memory at a2616000 (32-bit, non-prefetchable) [size=256]
>>         Region 2: I/O ports at 4090 [size=8]
>>         Region 3: I/O ports at 4080 [size=4]
>>         Region 4: I/O ports at 4060 [size=32]
>>
>> 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a
>> (prog-if 02 [NVM Express])
>>         Subsystem: Sandisk Corp Device 501a
>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
>> ParErr- Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>> <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0, Cache Line Size: 64 bytes
>>         Interrupt: pin A routed to IRQ 11
>>         Region 0: Memory at a2500000 (64-bit, non-prefetchable) [size=16K]
>>         Region 4: Memory at a2504000 (64-bit, non-prefetchable) [size=256]
> 
> Right, so hvmloader attempts to place a BAR from 05:00.0 and a BAR
> from 00:17.0 into the same page, which is not that good behavior.  It
> might be sensible to attempt to share the page if both BARs belong to
> the same device, but not if they belong to different devices.
> 
> I think the following patch:
> 
> https://lore.kernel.org/xen-devel/20200117110811.43321-1-roger.pau@citrix.com/

Hmm, yes, we definitely want to revive that one. Having gone through
the discussion again, I think what is needed is suitable checking in
tool stack and Xen for proper alignment. Unless of course non-page-
aligned BARs could be adjusted "on the fly" by some interaction with
the kernel (perhaps at pci-assignable-add time), in which case it
would only be Xen where a (final) check would want adding. Of course
if we can't adjust things "on the fly", then clear direction needs
to be provided to users as to what they need to do in order to be
able to assign a given device to a guest.

Jan

