Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB2562B19
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 07:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358858.588254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79bj-0004CP-QE; Fri, 01 Jul 2022 05:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358858.588254; Fri, 01 Jul 2022 05:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79bj-00049E-Ls; Fri, 01 Jul 2022 05:54:23 +0000
Received: by outflank-mailman (input) for mailman id 358858;
 Fri, 01 Jul 2022 05:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/an7=XG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o79bi-00048J-1t
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 05:54:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9a34b7-f902-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 07:54:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5725.eurprd04.prod.outlook.com (2603:10a6:803:e3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 05:54:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 05:54:17 +0000
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
X-Inumbo-ID: 3f9a34b7-f902-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP3f1xUTt2i2sMc+TiMazckP4VF2lY1og5KieUD3tZaOkJJHiCS6qcqUHm8GXKV543mldYC3C549dJrHTKc6dXZ8wG85ljoer72Qgo635qW4LGdNZvFcTkq6PuTh1nHVrX6PbqzNzTJAhvzIJJ8dR32+Lsvd0TnsUt0j5myschnrt1DBmIS2PsRB8DkHSROILZsgmej2F1FC6uTbNzdL6ekDV3QJ2LniIzb/hC2yaLM9770tavtmQDcWlHJNLqXqdK9OzWfna765iDNZGRKeF8/vadT/5ceTiOPIYQFm57gEp185B4tT8lcxHEE4flJ5NbEx8eOXOQ6VA3bqcmpCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqlDZZ6b28GoaYLA1f89ZHTaarUOMAkMgn8aeWLHv/k=;
 b=f4KQAEJhuFduidNCSQUTGiLlR1eTzFPKTay3eSMozJPU15ohtXxGs/7QFBToMcBdsGl3FxfQ3mnuTlq/jD/SKIzbIfZRWY5YcejszoaN/UlhIkZnoqO/iNONihY4kjqFck0Q8Png/MsO6Gr+IYL4QlUqW5N6cU2SVBO5LyfuDjFl5IHyCJKfrN3egVVGQJH9xubCIgjltbiT9JNunlG8ygTuIbK2xiMtP3uttd5UG8I3yPW3GqjYD3a/5JZCQ25Zr+qjWnqeEypVk2D5w8MnSSvjuz7EJsMPR/YuEK5d4YN0lchP3j3nKZ8DQlHFqdWYDJCBuwN01282vgAX9GbPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqlDZZ6b28GoaYLA1f89ZHTaarUOMAkMgn8aeWLHv/k=;
 b=kzWliUXdZzkXh+tJE15zaOErGfqzC1+AAtULzALGnfFf7H0cni+X9+kOtxfqKLJcSNNev7Pxy6+kpynVZMNvZaXzSx5cH2AY6wlfdTt5zLODKs7Clk7MXu6yY3BNNqj9AlOi/6ufmN7LiiK36Bg8PLJLgveF5faOjO+o+RVuahbaSkhc+r6amaEQvDqDA2NoIvPpZ0vhB2b6ToJDTXH2540k5F8wWjfCiULXvYDCOT+noDOh39iERpeG0Ien3fVNPVJdwsHnBg71YdPNbUsoOs1lZJ3Hx2RB8PC35DBa/mug6GN8dUfJo6AQnlfMiGu9be4XGKwL1WVO/rUEqXgbIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13142c32-f67f-751d-4783-87e8afa1117a@suse.com>
Date: Fri, 1 Jul 2022 07:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
 <PAXPR08MB7420F8745E83D013AAF566689EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420F8745E83D013AAF566689EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0072.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 340e8986-f828-4c43-e9ec-08da5b262295
X-MS-TrafficTypeDiagnostic: VI1PR04MB5725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdooPxgYJmX7PhRrr4SofOvcBti381J+70wWYejyJ5fisBa7UWz6bj8i9usxALRioD2CNimqRtf+dJinJSofMUnWkp1WvkOm6vf2Z/mmbNDQfQv2Z9H8jAFwSf9MfZqMvTXfH9fqny9O4Ng5SXZP+h3qBOt9HTlnO+4pjqOI75yxzLM4hJTDLw9zlIyB9/r5sVbaRzm5y5IynS0nWznPTihV9We7z8mUMpfuzyoHJtmdUVnY0XCiTaOVZNE3vkkrxyH4j+tmz86n0WIYy8WZbh5/bVKLhQSP8tw7t/zCesp2udcWNZv75DScLcYrZ8xvl5BJq+KJf2lO/Hy3YAj/P7CZLNRO8882TLkV8D0tJGqCOstTvqXAd+wC8d1fe+ts+eED3XsddMPpfKm3vYQtJj/RL6CMQVegNYLHrLMjCg9f7FC8XSpILpjEMuS8p6JniRnvQ5/MRz+E+MrMzzk9eLCaLYCtzug5dvnmGYDzT7Zi6X3p0Dc8WedXjtVAY3Xttf1GYWOn/wEEHYyp29r2mtBGtPOUFFLTp1FjH1cAx2+pWfOh0lmpM87wdC6siTabFcxpjYI1OtgWoCGPELpfBoSiIKjYcTGyVMWeD2ZCgkftX5LxSi6fq+FlKHJRZ8jFDkugm2luTr6e4p2DaiGrtZql46q3QeZXgZ6GLP/FE7LGMHcYSE9BdmFwL0Ufq9dQi+6NkRecpm6ZJr65kC1+45T+jbe5kYXB7nvqjkrpYZrgywNUy/A78WASpUjVGKfMpXPkBHwmyw4xff2cAj+6AykQNDTjbf9nHvPrgKSgAJrNBlJIl3PbhIBO8E+JkrSdFBWsX2WgoUVmxkCRWXDLBXaC7A++c791fEsilM6FwRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(39860400002)(396003)(136003)(31696002)(86362001)(6506007)(38100700002)(316002)(66946007)(4326008)(8676002)(66556008)(66476007)(54906003)(2906002)(6862004)(8936002)(5660300002)(26005)(7416002)(186003)(2616005)(83380400001)(478600001)(6512007)(6486002)(53546011)(31686004)(41300700001)(6666004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNybzlsWGFFc1k2MVdoWm0xQm5ld2VCTDl2YUZwc29pdVNyK0NEOTJKdDRx?=
 =?utf-8?B?S0QxQ0dvNGVSVXV2cm9oN2NEcjJxMCtSRHBWbW81UWlIWDM2YXVDQ3dzZkJx?=
 =?utf-8?B?dWp3bmhlajdjaXBvS21zbE82UjBacVp0YVdxdEw4UG1rL3F0WGJiUkFsa2lF?=
 =?utf-8?B?cmlFeG1DeHZyaWg1eWlRcHliaU5RTERwT29ZVkp6WG9aMVBxQ0VnZzJUWkh6?=
 =?utf-8?B?Q3gyeDRMRElFbGVlYlFIM1lzdmFDZWNWRG1sR3krZjdLZDhPYS9MMHYybm9Q?=
 =?utf-8?B?YmZpL0R0REt5ZFNhaThFMERHcnBzQldWQTE2TGhZR3l2YkVMa20rdWpyZXo5?=
 =?utf-8?B?NkdvQWtyZU1tSXFsN3oyVllVTXY0SlR5bUZuUE5KRndIYlhZa01Vcm1razFm?=
 =?utf-8?B?aTBVL1B3aHlpTXRwcUdEeUlFYVl5M2Q3VVVCdzJDV0ZsWUk1Rmx3b1hpVGxV?=
 =?utf-8?B?MlhmYkxxcXgvR0hYVFRURGZ3MnplVjJxQndUdVZzczlnYWxQNTdJdnRwSngv?=
 =?utf-8?B?MDlWOXZBMmRoVEZTY2dmYmt0WlFmYTdDc05zVzR6S2o1ZFowdVM3WVlYeml0?=
 =?utf-8?B?NHBjeHl0SGJ0cGJ5N083TlFjM1V3Q1c1YjZ2V1kvNCtsak9EVlVOWm8rM0Fu?=
 =?utf-8?B?NmxPZmJGb21kWnRleE40RW1uSnlOK0g4WGhMMHFhUTFFa3JkVGl1aDh3bGQ1?=
 =?utf-8?B?RVk4bW9mZnRFNjBwZHZjRkJTdDFwMG05cE5FMlFTdDZubkRNdUNsYXFnbnFM?=
 =?utf-8?B?UlV3bm5SdGg4bVo0UzlJNUZnMXIxVytLQWpiWnh0WVdBOHBVOVNtOUJhYVlJ?=
 =?utf-8?B?MlNsZWQrS3JpVUpRZ1AxckozSkVmR1NENmdGSWhwb0JvUHpBb0FjWlcvZGdJ?=
 =?utf-8?B?VTZzcjZROGltVDFib2Z0aFk4a0JRSlB3RjYyQnZXMi84R1l3N1YwTVVrUFlX?=
 =?utf-8?B?ejJ5LzRpNHhYeEd0K3ZxYWUvRDFsMWpCdmZaRHVuUWg2UW5LMmNPMVVSQ0xW?=
 =?utf-8?B?akpUWXR5WEQ0WTJqb21lanlQZ3JDeDJXR0NlNTJxN1VMa1ViU1dWTExFaFhq?=
 =?utf-8?B?dm1RYzY2cERHalNmT3FHVWNSNkh3eTdaZ25nTXY3dkdOYjFBckV6MTdtbkdx?=
 =?utf-8?B?aVg5ZmxNN3RwR1pmV2xYU3Q1dTlLL2RzVDZoZXNBL2o2Z1l4RytFc21IUS9i?=
 =?utf-8?B?QktWbTYyL05WbnNGa1I0NERPSlVuSlpOMENPeGwxMW00L05pTHVRcWtGVkRX?=
 =?utf-8?B?UE83QWpadTBFR2ZXMGkvM0RkSWd5RXJ5SEpZaEw4QjB6TFpNSUFidDgzcFFC?=
 =?utf-8?B?NDh3MzRSVXByYkRyMHNjVTljZmJPN3FXZEZkUkJ5VWVoUWQrQXBPNzI1Umhl?=
 =?utf-8?B?K3VPTTBvMEpjaExBd0Y5TjB6UXNNV25peHVLOWpmZHQwcm1vYjdzRUVZaVlV?=
 =?utf-8?B?T3g5ZFNSZlNHUkFWN1gvN0kzNkhqakgyUWNWUFl5OTA4bE9nS0NvS3lCWmhx?=
 =?utf-8?B?SDVRbEZLMU9mWHRXbElDUjZKWlBVdGR5SVJzT29KdnZ6RFRYV0V5R3N1UUcv?=
 =?utf-8?B?LzJPNEk4NENvWmhyYS9SNXpONkdud2pVNVkvZjVnUWV4ZUNpbHJNSVZ6UUo3?=
 =?utf-8?B?WEF2RGVJN2pKa3NXalk2Ymx1eWRjdGNVdFJqM29ZUFh0UkxRUFRvaWdpRXp6?=
 =?utf-8?B?UkMwTjl5Smx2WE9VLzdSNlR6WkNKOE5GQitZUmVTQ1BsZ0dTazNVUnZkVkY2?=
 =?utf-8?B?VVArN082WDB5S0pFUHovVmdsRTFmNTM0K2J2aGhNUzh3dElGTG9RWU5WaytK?=
 =?utf-8?B?VElQWmtWTVB1WkxFUTgxL1VQM3lHRHc5NkxmdTJVR3d6My9nS0NUUWMxeHFJ?=
 =?utf-8?B?OHE2SDJVSHcvbEhqaXgxQlZrN2FYRlhJL0lwM0RTSHZwWHVIUmJ3eHVneGdX?=
 =?utf-8?B?WW0rdjZwYmpsaU03N2NNOXVibFhIK0lyd255WVFWcktheUhvSG1NNGxXTW44?=
 =?utf-8?B?UE5XVW55TWhRdmFMS3IvU0NtQVpqVCtxZ1Z4SkY0emRoTzYzbm9YSlltOEkv?=
 =?utf-8?B?eGtFaVFNOUxGYUxmUDZ2Nmg2blFCUVNIVUF0VjdIUTVVemM3YWpRWTg1aGx6?=
 =?utf-8?Q?zMCWHROjQBInAdaiFN/EUWCZE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340e8986-f828-4c43-e9ec-08da5b262295
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:54:17.5981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibC1M6hTpC12MMVc0D/03nIlxXYKaGgUoMIl/tg2Q/xqg2gsNe1za0/A6DfrUmS82cQZBd2zyW/2bnecXCtC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5725

On 01.07.2022 05:11, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年6月30日 20:36
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Jiamei Xie
>> <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org; Julien Grall
>> <julien@xen.org>
>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>
>> On 30.06.2022 13:25, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022年6月24日 18:09
>>>>
>>>> On 24.06.2022 12:05, Jan Beulich wrote:
>>>>> On 24.06.2022 11:49, Julien Grall wrote:
>>>>>>>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>>>>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>>>>>>>> @@ -1,4 +1,12 @@
>>>>>>>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>>>>>>>
>>>>>>>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>>>>>>>    obj-y += $(EFIOBJ-y)
>>>>>>>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>>>>>>> +else
>>>>>>>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>>>>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>>>>>>>> +# will not be cleaned in "make clean".
>>>>>>>>>>> +EFIOBJ-y += stub.o
>>>>>>>>>>> +obj-y += stub.o
>>>>>>>>>>> +endif
>>>>>>>>>>
>>>>>>>>>> This has caused
>>>>>>>>>>
>>>>>>>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the
>>>> output is
>>>>>>>>>> to use 4-byte wchar_t; use of wchar_t values across objects may
>>>> fail
>>>>>>>>>>
>>>>>>>>>> for the 32-bit Arm build that I keep doing every once in a while,
>>>> with
>>>>>>>>>> (if it matters) GNU ld 2.38. I guess you will want to consider
>>>> building
>>>>>>>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with
>>>> that
>>>>>>>>>> option.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks for pointing this out. I will try to use -fshort-wchar for
>>>> Arm32,
>>>>>>>>> if Arm maintainers agree.
>>>>>>>>
>>>>>>>> Looking at the code we don't seem to build Xen arm64 with -fshort-
>>>> wchar
>>>>>>>> (aside the EFI files). So it is not entirely clear why we would
>> want
>>>> to
>>>>>>>> use -fshort-wchar for arm32.
>>>>>>>
>>>>>>> We don't use wchar_t outside of EFI code afaict. Hence to all other
>>>> code
>>>>>>> it should be benign whether -fshort-wchar is in use. So the
>> suggestion
>>>>>>> to use the flag unilaterally on Arm32 is really just to silence the
>> ld
>>>>>>> warning;
>>>>>>
>>>>>> Ok. This is odd. Why would ld warn on arm32 but not other arch?
>>>>>
>>>>> Arm32 embeds ABI information in a note section in each object file.
>>>>
>>>> Or a note-like one (just to avoid possible confusion); I think it's
>>>> ".ARM.attributes".
>>>>
>>>> Jan
>>>>
>>>>> The mismatch of the wchar_t part of this information is what causes
>>>>> ld to emit the warning.
>>>>>
>>>>>>> off the top of my head I can't see anything wrong with using
>>>>>>> the option also for Arm64 or even globally. Yet otoh we typically
>> try
>>>> to
>>>>>>> not make changes for environments where they aren't really needed.
>>>>>>
>>>>>> I agree. If we need a workaround, then my preference would be to not
>>>>>> build stub.c with -fshort-wchar.
>>>>>
>>>>> This would need to be an Arm-special then, as on x86 it needs to be
>>>> built
>>>>> this way.
>>>
>>> I have taken a look into this warning:
>>> This is because the "-fshort-wchar" flag causes GCC to generate
>>> code that is not binary compatible with code generated without
>>> that flag. Why this warning hasn't been triggered in Arm64 is
>>> because we don't use any wchar in Arm64 codes.
>>
>> I don't think that's quite right - you actually say below that we
>> do use it there when interacting with UEFI. There's no warning
>> there solely because the information isn't embedded in the object
>> files there, from all I can tell.
>>
> 
> Maybe I should describe it this way: Arm64 does not use wchar type
> directly in any code for parameters, variables and return values.
> So Arm64 object files are exactly the same with "-fshort-wchar" and
> without "-fshort-wchar".
> 
> Although Xen's EFI code interacts with UEFI firmware, similar to RPC
> function calls, these code also do not explicitly use wchar.

How does it not? There are ample string literals as well as enough
uses of CHAR16 (the UEFI "abstraction" of wchar_t).

Jan

