Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A87CA943
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617546.960217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNVK-0006by-98; Mon, 16 Oct 2023 13:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617546.960217; Mon, 16 Oct 2023 13:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNVK-0006Zi-6T; Mon, 16 Oct 2023 13:19:30 +0000
Received: by outflank-mailman (input) for mailman id 617546;
 Mon, 16 Oct 2023 13:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsNVI-0006Za-Lv
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:19:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d09c63-6c26-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:19:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9956.eurprd04.prod.outlook.com (2603:10a6:800:1e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:19:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:19:24 +0000
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
X-Inumbo-ID: a1d09c63-6c26-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGQIUGdGOywMLB4IG7873pziqC1sKPWIinxvA5W+lESEOmbs+vpMHY5b59FzjuwlnOdvZ5noBiI20H8vhr93Fw382wt0HwSJNFGjVOpSlyBSoUVmP6eUwl+ElMyzsRHlzvQkXmwyn7j5nUYKtECq+4fkYsDNj27D+0I+itO5LM6E4KjsYqMzmdisxtCVmkvroiw/Y3i10hInF0kW/q7GsYvkOJmaP1G6LRpAwKeZ8DvywjJEedKQqYUDr6LUQkZzsyG0O4NNM8U5g3JdqsAGkSYzxQwMWOq6SADqiGXQkgNf2VYWoF29a24hvFMF3RYz2p5XaYBiQ/o/+l5HBx4/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpx+Yix6AQFVozW9xTmDMx85TJ9CpNJSc6IEQic2RaA=;
 b=eRpIa2uuE3aTPY+2+I5jJXzFYsiyeHKw1asfJspdyKXvWA2Wl1Hxep9jfNda+gseiEOl6oXLP3t3sH8luGc4x93mx8xIXpfcqcXn6N9xEwB6F4Y98U4T7yRYtZGDb1GP6VEEkI/DuH4BTxA6Ek4gNB/S5FY23rvCg3EXhTSkvkTvx8BkecQj6jA/xoBOr1VywgzQjOq1W5fIg4ML3JfsOO+aBLzWc258SC5FKsQkZXNTfvIEDxlg0ddJoS5/j3GVThpY88Vh4oy7nB8DSCXZ4R/u6nh7583itcmYMd1ej+S+Urvi86vplg4cBJMxw+vdg5MbrkTLXcAU8MaC/KWeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpx+Yix6AQFVozW9xTmDMx85TJ9CpNJSc6IEQic2RaA=;
 b=aojg4X6hYHyINGZ8Edfk+N488mBuzcwa+6F4crYZKZUq+hMKRW9OTl7e5AgDBCesp+aR8sL/WuXlHJU4c+fB1Uz0Psfrafyl2Sfk8AdQ8IqwXgEG4kck3ewCJzoMUqAfci3Oj+Jy8TLvtlpCpegWzRHOrYwMpGSsqGD/7jLb7MEMhmd0hnZdA9MpKBLDssTCcCP9FmCVqZhJmIi8eiM20kAo00ONQ0fZIZrrHQugsPuH1EGdAX1Fbxe6yJNdsUdaXl4V+0V0ubmJ/JdFpgxABuZ4PX+Vjglfw6LaSyokTMj4v+taVnvMfQOJ0BVenh8q6R3o+pDhPY3jzlD4zvknbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed43fb9f-590a-fd39-ba87-b45acddd19a9@suse.com>
Date: Mon, 16 Oct 2023 15:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <jgrall@amazon.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
 <ZSAnX3xjM91-tYbE@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZSAnX3xjM91-tYbE@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8622d8-c0bf-417d-ec1d-08dbce4a840a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	stLeJYBMThZmyodNueC2zkWe9nrIRSJctE4D/E2lS01oBkvV2woq2/tf+sDdW8ZCxccPYTwkZNmoi04gxPP5rWvcgFLjd2T87zF0xEu07unOdesx9cqKYpb3fiUaCmBEE8qcgK1Bea5ikWL3YxdKxbaPN3W7mOVIOouJa7xoWt73gFWlOvGGotQJTD4zz71hUGZBJDjag9E1GPQPT5aVTFSTKLwPBEZHWXXa1IR801e0dKo7SM8Iy5xwuX6uyRE2Q1BMmVTJnl1TX1ZVsG9SEcmFKe9RTWS2qGethpGpujjq0RwMEmVYYIFPbB0Pjq4EunDtbmuKtVdrNTG32nEf2XTYgMhp2ppZIKRfUdvAujrxkTg/E71MTZN9YqF6G773ViVss2Jn0ipJlV0kOu3I7OJbOOiOBmKVrBvJ1KLa92N0ItjHnLqAG5F1oZ7r13gOj0YHwIfBPgJ54ZzSlM5oHTc7XIxIyWkxSae9UdhKZqVMlkRjt4rVKMd4k+e/82dID/w+fEUp3PqNCKTHmjiRZW7XZsGnoHiDpEFBMLHTmjDYxKGEygJ/vmOKzYwE+lRgKn7uSycsAEKvADOCFybMY/XrWyh8r9i05aIrGRufbHzFpeYrOk7LQ/zaDL/zS5pF8Ugw0kTDdMHcPbIE75gPCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(366004)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(83380400001)(6512007)(7416002)(54906003)(66556008)(66476007)(66946007)(8676002)(4326008)(316002)(8936002)(6916009)(53546011)(41300700001)(5660300002)(6506007)(478600001)(6486002)(2906002)(38100700002)(31696002)(86362001)(36756003)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVVrbkJhRFZlSHMyS2tJeEpINkUrelNiV2RNNXBJdC9xdklGKzVoM3hSSWVt?=
 =?utf-8?B?K1M1YzBXK1RBb2syY2dHdkVYekthME5PTzBMR3Y5ZURSa0NRUG4wTUI5WVEx?=
 =?utf-8?B?ZUhlNXI4cU0vc0IxNWdHU1ZGRnlPV2l4U0Q5OEx0cDEvNjc1eEczUHhFbko0?=
 =?utf-8?B?OUZEOUpUYjJIQUV3MmQ1cGhWbjhHSVRJSGVENFB1TklweEo2Y1d0QnhaTHNN?=
 =?utf-8?B?T3doelVpTnQwbUhzaGRCdSsyYWhaY3lSL0g1TXZ6UXFMd0hNRzVobnZhdG5L?=
 =?utf-8?B?dEdIZ0NTZm1lMVcvVmNzUHpiREphdUZNb1hSYWZaSW1hM0xwRHpjOXZheGIw?=
 =?utf-8?B?M0hPM2d4SlNTZjFIYXJlRndyeFFIUWF6WXQyUHZKaW11WXlSRFdCajBHQm1C?=
 =?utf-8?B?S0NjcndYdWJ3WnY3WElTL1JBN1QvVitiYkF2NDc0NEU1MVV5amg5WHQrb1pi?=
 =?utf-8?B?eFNCR3ZWaEtLTW5WVTRjZ2ROV0xoY1BmWC95SndIeEFnTng4S2ZtN0EwNHlL?=
 =?utf-8?B?ZjdnQlJNdEI4WUdYa1RGNkJtWnRYY1FOa2lUclRsdXdPN1ZCNFhEQjFoS0ZX?=
 =?utf-8?B?RXJ5WXdOWXV5ZG9FTFlkTFRBR1dJQVMwM2lGemZERm83V3VzVzlrU3dSdTFR?=
 =?utf-8?B?aFNnNi9xUVB5TGxjYWlqYXg4R0NjSmxSUzdUZGFRNytlNEhpZ0pyZTBOTEZs?=
 =?utf-8?B?c0NGRVVtNlg5U0kzclkwdmU3UFVDNWowSm92RU1TS24xakNPTUtYaXJUZHZX?=
 =?utf-8?B?VjFQNEY5OE4wZ1B1bXNYWDFZTTY3T1k0WGk0MnB6K3NXeTJTQ1RhUGJ0WHpI?=
 =?utf-8?B?dTlUeDBuWFh2c0FmTzVIR3djU2p0T01UNTlTenNJL0pwMW1zRllHejYvVmZJ?=
 =?utf-8?B?S1JvWkdzbEFPZmJZeUk1Q0lnU2hkTnRtaHhPeE1yN05pb1QwV3lsd2V0cnAz?=
 =?utf-8?B?WWdleXdodUg4OE4rTTFaVFJiTTIxbVVoTEdUM1JEaktsUk82ZlBYRGcyeG4y?=
 =?utf-8?B?KzF4K29FWithZTY3TC9ERXZaWHhHc2VGYXpmQUN4eFpXckdXWUkwVnFnZk14?=
 =?utf-8?B?SVdnMVp1R2d6TUJYK2hMVmVtSkcyRWFXQU1wWUJWbEJ4bjNnVmdDNC9xdXBY?=
 =?utf-8?B?ZEdQQjJpbmhwSGw4S0Z6dFRYcWFteHYrUmFKaGpiK283QStLdEVLUVdjUXB4?=
 =?utf-8?B?UUhKMUpVODBuSUFBVURVbWxzRXo5eHlMUVdCdUVnYWVLZlVBaXNNclRvVUNP?=
 =?utf-8?B?OXpvZjM2dG1heVUzV0xHVlg5R2pseS9EOHYwdGxWNnFNVXZOMWFNcHFnY2c4?=
 =?utf-8?B?N09SdVhjR2RlbXF4cVYrSm8wbzVCMllsQU9DZDJTSTBUMDdubHRuRDcxN0Ex?=
 =?utf-8?B?Z3NWaWJsMlJuYU5ET0NmQU0wU1l6dUJGRjc2N2kxY2hNbk94VTgyWjRPaXUy?=
 =?utf-8?B?T2JZTFBFeDVPVTFhQmJuRGJLSDlMMGRGTjdSUVhPQUNZRGYrZWl1a2kyaGVm?=
 =?utf-8?B?emQzK1ZSNjJZRGZ1eGdURVRzZ0s1OC91bEtqbktna1FmUzlUTHd5VlNEZFVZ?=
 =?utf-8?B?bmk3V0xEVk04ZUlJZ213SGhmcE1jcUVXNjdlbzFDcitaNGVxUlMvQmhDS25X?=
 =?utf-8?B?b1NiM1F1SzNORlJiSkpUd0VZcDd2cHp1aFVMUjZxelRwVXFMNlF5dTFsdWti?=
 =?utf-8?B?blQwWGF1c1BQZU44Um04ZHEraTNtU2I5dkl0ZHlJa1RTZUt6N2J5VnBUMFdi?=
 =?utf-8?B?RHNXdWttaTEzcEhWV21hZkt4UlpkaVhPSEN0elFNeThNNEhhYnBGYnlmWEpV?=
 =?utf-8?B?RlFJZDdRcTJ2cG5CM0l4blBieTY5bkI3NXVZWStqVmdUY3JPZVdmN1kwdnIv?=
 =?utf-8?B?dlpSWUoySWlBQ3U4SCs2WEpKazFzcE1IRTZvSzh4NG5mRTVBUnZuc3d1Y0xP?=
 =?utf-8?B?REk5UTJwTFc5Z3ZGUkpqQW00WEtIbmhaNGYwTmlIdGFNdVhkTWZqemVtcVIz?=
 =?utf-8?B?V1d5M0ZJNVJkSjZsSTQ2L0ZLdHExMWhWalUxVnFQTmNncEF0VEFLWUtjTW5o?=
 =?utf-8?B?N1phd29FcHFXYXJycEU1YVJoZGRVcEZsWTRNUHN2dUFzaVZQNmFWNmJVcWRx?=
 =?utf-8?Q?DBhr2oXJ6m7ic6+tnI8zl+eqD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8622d8-c0bf-417d-ec1d-08dbce4a840a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:19:24.7434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIJqWkGCdpkwyNdQLKvgzlLbbYGLwQm1dXcWbCAEYsGpCfbe2mthHi/IUp0Aq2QiiG3XC82lNRzTMBpfgtrR+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9956

On 06.10.2023 17:27, Roger Pau Monné wrote:
> On Fri, Oct 06, 2023 at 04:09:19PM +0100, Julien Grall wrote:
>> On 06/10/2023 15:44, Andrew Cooper wrote:
>>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> Adds a new compile-time flag to allow disabling PDX compression and
>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>> conversion macros and creates stubs for masking functions.
>>>
>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag.  Despite the
>>> illusion of choice, it was not optional.
>>>
>>> There are ARM and PPC platforms with sparse RAM banks - leave compression
>>> active by default there.  OTOH, there are no known production x86 systems with
>>> sparse RAM banks, so disable compression.  This decision can be revisited if
>>> such a platform comes along.
>>
>> (Process remarks rather than the code itself)
>>
>> Jan is away this week so I want to make sure this doesn't go in without him
>> having a say.
>>
>> While I don't particularly care about the approach taken for x86, Jan voiced
>> concerned with this approach and so far I didn't see any conclusion. If
>> there is any, then please point me to them.
>>
>> For the record, the objections from Jan are in [1]. If we want to ignore
>> them, then I think we need a vote. Possibly only from the x86 folks (?).
> 
> I would be fine in leaving the option to be selected if we knew that
> such x86 systems might be feasible, but so far we have seen 0 x86
> systems with sparse RAM.  That said, I don't have a strong opinion, but
> the hiding on x86 seems fine to me.  Interested parties can always
> forcefully select the option, and a case can be made to make it
> available again on Kconfig.

I find it odd to demand people to change source code for aspects like
this. The very least I'd expect is that BIGMEM configurations (which
I've never seen any production use of) can actually also engage PDX.

Jan

