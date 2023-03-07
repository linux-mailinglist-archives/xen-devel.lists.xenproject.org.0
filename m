Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AB26AE2A3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507452.780962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYOm-0006v8-Ot; Tue, 07 Mar 2023 14:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507452.780962; Tue, 07 Mar 2023 14:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYOm-0006so-Lx; Tue, 07 Mar 2023 14:34:40 +0000
Received: by outflank-mailman (input) for mailman id 507452;
 Tue, 07 Mar 2023 14:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZYOl-0006sP-2j
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:34:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2de43a51-bcf5-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:34:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:34:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 14:34:31 +0000
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
X-Inumbo-ID: 2de43a51-bcf5-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwmtIVZijkSsfjTty1F9thoBv8roF270bD4v3TiBK7oZ7eDg2gnFQqT+wGgUW0kuOqfbyQNBhgYM1L+EFa9tJddzXgTxWv7pCy3MdVWR/SA7dO2REr+CEQbzOttz4ltHIkX2OPXrUtdw5KmS/TvDsePYNx5etEXMjrf2BcJSBm0zdyEHhwbeSQsko25xj4F43gWCeW/5y/TV1CUVCrHyIgC2wcXmS6TtNhhtSu9aSSBI07FHlaskVa8sNXMZVZr4n6/DBGFeDwF24Kwd0//4+p5hu/S5MAuoiyHVhEekukyhHNyE5EZvmafi84MfGat7d//OAoNUiQhI5uF4b8USjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz80npVi72Tvjkc7EC5ts0i3fMZ+JO67v2Ty7Cmml04=;
 b=hk6gDK42RrJ89N2oydVTF9TP+NDKy2Jw1YdToSd0rqxIzXtBeYwKiBSo8OLwizz0qCTcmSO6BWnSGkRW0skTJz4VepEXfVSyVebmjzfPHubD9WSfuCCoiA2fH9fxTGINJ+n9aGTIrcLzqI4p55bbgdUhjYSl2PGKWoQWY1niMOBtzl56YRMBNB6DcZO4k+SMPe+S7hpt/xfiaJu63dqNjQ7HOPawrzEddjtaC2KXxwe5FeRCZzQKF5BMftsGQurEBGY95WNYz/GWuqan8HFw+h6nb7HNgMcsDOPldJjA7wb11X8eQp6t9ZdisMUs/k/39gEKwNYewP3M0bifj6voRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz80npVi72Tvjkc7EC5ts0i3fMZ+JO67v2Ty7Cmml04=;
 b=ONrgSMeKcvV/jgiuWlHDdxm02ZW9K0sP5hKum/ZVzsnTmdayoO9tUk+r3PDNh0yWTd1HCGTHoGRaJDo/WpggoyfbRC9oHdC7H4Gy5DO0iT5s5ae6pdCHM2tnAMCN9D0QeQRSPu5G6ZdZ2+j9A45GdtPlW5Dw8YBpn2nFRR/lpw0byPepnptao+C5qfWHdzOc4uxr7m0ADvC3A72Cl3GJ6wRlkF/+KRoro5qzrHw9qdEyyPBN/KKx5SWgSYtC75hqWuPBcWniufjHJt0a83ZMT4AL3vEQILLtdz/tsx4Ea8vP925Q/p8PN0t7ZLLTP7iPq70p+1ipvvgxVVCKlKVatA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
Date: Tue, 7 Mar 2023 15:34:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f39697-f016-4cc8-9848-08db1f191069
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5W1XfB1oCaOHRGKwUQw164z8a1ct909Akez/j7vT/elC8PTIHz1hgsU6P/K4IDvUnommXW6dfoXr0O0ykPhWzZ+oIDtzURl9oOEh8qgGYgbilUHeCs/K7AQbYz+HUkQjo6flNsv2KTZ4s1ypu9kPwK1cRNIp++XrZ/Ey68ZNURq3HfJudq+sB99YHUJbANClkwiBeYY8OD1igG41OZIKPqmr4I1x4o9UadT7z+k/6Pop7ERIRhnyFFCT9jC9v2eb4LneGUv1yCHqHrD1iI701eRQlgYuCDXCI3C6goUf6fGKw/82LAM3rYh3TTF1cMxTjfMxK3F7dLEuCTsL5uXG2ubHGTNAZItVmuGO6XCq6FE8Z3ebq/6YWqnjJ36swMjzP0Y39lOiGZ0bthZzbr5bnvm4YMAI+thKHOSmiaDUbhiSsLgu/pJoFFgCnkplnlV+aojYnJSDKyTOG2JdUOaWw6qrwrQS2+XPCNansGl/9IrNavgkw+YWFQqqHFGfibvY+TIXds0Y53D10JEhs06JxIYUevVLu/3BoLW3D+nxGia537u731sztymksHRGPtiXR5XpKrIYx6bfOl1vdjagBbzZUGRQVIc5GRPIaFVVRVFFIK5U+j1HwSYIVDfL92k+FX2oe1tcFCr3KbMgNrPukRenqXDBt7wB3QCS0tD/b21I9mu1b9lPLkIh+MNAW9c0KHG4vrj/eA2dC0eEJVi0i1kV+nmTRazbOeTPI8kiT7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199018)(316002)(31696002)(8676002)(66556008)(4326008)(66946007)(66476007)(86362001)(186003)(2616005)(26005)(38100700002)(36756003)(478600001)(54906003)(6636002)(37006003)(53546011)(6512007)(6506007)(6486002)(2906002)(8936002)(5660300002)(6862004)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmNmVS9CbzIvekZBYXFmUXUwbXQ0eERjVTZWK29BSEhrNm1BZXlqOXljWEdj?=
 =?utf-8?B?MWhzZVl3eHlIczBuL3RyTVdRUVF5aVJJL1RvTDBVU3RQbUR3dmd5WEZMT2I1?=
 =?utf-8?B?WENkS0hpVy9SOXlIaXNEYmpucE1oOEtGUWxpZE4xcTZCZXZ6NlVoQ3hhckV6?=
 =?utf-8?B?TDFCZTFKMWtNdkpDOXlGVjQwNVZMNXV2dUx5Z2hGRC9Pc0xhNlp1aTRKbTJB?=
 =?utf-8?B?MUg1bStzRnpaaHhxOHhaOEtMRlM4WFkwSnB2eEpZbkNEWDdOckxTZ1ZWUEZJ?=
 =?utf-8?B?YTAvSDJZbVIycEhNdlNybHVkRGh3UHNGazdlWHdIcVZBcllJazNQMlpBM0U3?=
 =?utf-8?B?SURMdGNkU0lWcGhkOUFoN0d3OElyT3NiT0VIRGw4aGg3bWgvZDlGd1A5NVlY?=
 =?utf-8?B?cTRLQ1RPbm9YYVBuZ1piUVVpcWFqbVZtVnNIazljQmNoTkZ5ZExRSHdqR1Jy?=
 =?utf-8?B?SzF3YUJGNTdjbzF6dklUTmdyZnJUZkJKaGl0eHBPZkJqMUFvcnhDaVR3ak0z?=
 =?utf-8?B?ejNtVXR4TnBFeFFHbDJSdWViQnViVWg3OEhnWStnMUJmN1lUZmduT0hyZ0ZJ?=
 =?utf-8?B?ZEw0Y1JuOUR4SUliQ2dnTXpUMHBoaWpaS0hVMnUvYkIyUStXTGdMdHU3ZDNh?=
 =?utf-8?B?NkdwVVp5bzVpR0VDMW04bW9QTWUyQnFja0hrM281NXZhNXh6UWk0U1FIMUhk?=
 =?utf-8?B?UE54cEg5eFlsMVpHVEFKbXJFeFRtOTlBSGFzZnhhcVl1VG91UXpaRk9SY1NL?=
 =?utf-8?B?Z3JweWxrTThLSDcyZ1VNbjdzOHV1REc0NDFkbEJ1L1JYM080ZVBabkh5OEZh?=
 =?utf-8?B?amliWTZ2RDlNZ3JudzEyVTQwSGoxM1o2bXJGZTFkT3VrOXdIc2FpeWIzcFFK?=
 =?utf-8?B?Mkg0THFDVjlNZWZMNG1STzJUL25sdkFVcVpDazRORnU3YXNua0hjSXNZZEI4?=
 =?utf-8?B?S1hwYjlIbTBGSWRHRjd2MXdFa0RCTVVXZGtYQWlIUk9ibFhaNHRoMmJ5MHZk?=
 =?utf-8?B?ZlVaOHlNRHhrTGg0ZDJQdDBEMzRWVlc0Y3VPeXF4TThicUZBTzZkTVFEMTVl?=
 =?utf-8?B?VG5td0d3cmZLMGM1VVpDVDVQdVJ2Rlg3czEwU2l1M3NrRVpCMVBuY3gwdVpl?=
 =?utf-8?B?N09jVVUyanBGMjYxN3YzS2xLSktqWjVzaFhQTWRzZVcrQWhZcUhreStRa3JM?=
 =?utf-8?B?bmM1N0RHZlU3V25hcUcxcUJiUjdZZWNzODVpV0llaTMvNjROdGkwamZPVGJx?=
 =?utf-8?B?ZUZHOUxCanNsK2ZRNklFNGYxWGYxSjlISU5rcHJ0S216UDJnbmZuMElJZEJo?=
 =?utf-8?B?TjZ0d2s0L3V4T1ZmME9IbSswNlk2UmdlTmkydW1BUHBEYTc5V2hMajZtMUI5?=
 =?utf-8?B?T2pYdjBkaXJ2K3JOeWJCbi8wakZiODRXTFlscjFBSmI2UFphYndaOExwQUxF?=
 =?utf-8?B?eGx4TXU1UHk4RE1VMkVHNXU4YllyVmVWREw0SSttRnk3Y3JDLzkzR0xFOXdq?=
 =?utf-8?B?a3JId0xWY05XYStMS1lxVFUwYmEramJjV2ZUMFowTjgxdWltdzN5cFB4cWhE?=
 =?utf-8?B?eHFHdXFxVzZjcXBFbm00azAxMVVrU1ZIN1ByeHNrTkdOZlNDa2I4Y1RBWkFC?=
 =?utf-8?B?Ni9IUDBJVVZEaWVrZWNLZG5rYkRlbnBqT29vWWYvNnJVM1VMQng3Qm9GUSt2?=
 =?utf-8?B?WnNJWjBpR2V6NjRTTFlWYXh5dTRVQzJ0S2xWeFA2REdqZ3R0U0lYanAwbU9z?=
 =?utf-8?B?djU2c21HWFl4eUdIaFUxMEV1RHNZc2lzcENlaHV4V0VLZk15NTBGYkViZDdN?=
 =?utf-8?B?WElNZkxBSDBUQjZMdmdZNjUzSjBKbE1GYUI3b1ZMRzk1YXNuTjNnQTUwZUR2?=
 =?utf-8?B?dWVoMGg2SlBiS0J0NDJ4c1RnMTZUY0FNYzhKbXNpc0R3bTBUYWRVNEIyRE9v?=
 =?utf-8?B?Vk9pMHZ5UGEzdnFHZTZScWx0UXNtVTZkUHhUN2hMZGJuWkYwTlhESy9DNWVO?=
 =?utf-8?B?RUtQN0RHWjgrYXBiZWNVZDZwcHMzQUNWWE0wNW5NbFF0RzcvVXBONGZUZnBG?=
 =?utf-8?B?UTZyS2Nwd0lhTTg1RG02c0ZmZGtIakFMRnBmd1Mxbk9nZVphcjFvTVRwbW1B?=
 =?utf-8?Q?07oyuqf/Y6v+qEA06wUKLGk7Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f39697-f016-4cc8-9848-08db1f191069
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 14:34:31.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kG1LozC0A/eVDXqzkLqO6COPyjM01LUL/4bB2SWLQ9QrphnPV0Z2JKQcbzIA60bjzQpS/srRIYhJ+5j1iTRnqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

On 07.03.2023 15:23, Juergen Gross wrote:
> On 07.03.23 15:18, Jan Beulich wrote:
>> On 07.03.2023 15:04, Juergen Gross wrote:
>>> On 07.03.23 11:41, Jan Beulich wrote:
>>>> On 07.03.2023 07:32, Juergen Gross wrote:
>>>>> --- a/xen/Kconfig.debug
>>>>> +++ b/xen/Kconfig.debug
>>>>> @@ -15,8 +15,11 @@ config DEBUG_INFO
>>>>>    	bool "Compile Xen with debug info"
>>>>>    	default DEBUG
>>>>>    	---help---
>>>>> -	  If you say Y here the resulting Xen will include debugging info
>>>>> -	  resulting in a larger binary image.
>>>>> +	  Say Y here if you want to build Xen with debug information. This
>>>>> +	  information is needed e.g. for doing crash dump analysis of the
>>>>> +	  hypervisor via the "crash" tool.
>>>>> +	  Saying Y will increase the size of xen-syms and the built EFI
>>>>> +	  binary.
>>>>
>>>> Largely fine with me, just one question: Why do you mention xen-syms by
>>>> name, but then verbally describe xen.efi? And since, unlike for xen-syms,
>>>
>>> For xen-syms I couldn't find an easily understandable wording. I'd be fine
>>> with just saying "xen.efi".
>>>
>>>> this affects the installed binary actually used for booting (which may
>>>> be placed on a space constrained partition), it may be prudent to
>>>> mention INSTALL_EFI_STRIP here (as a way to reduce the binary size of
>>>> what ends up on the EFI partition, even if that wouldn't affect the
>>>> "normal" way of putting the binary on the EFI partition - people would
>>>> still need to take care of that in their distros).
>>>
>>> What about adding a related Kconfig option instead?
>>
>> How would a Kconfig option possibly affect this? You want debug info
>> in the xen.efi in its standard install location (outside of the EFI
>> partition); or else if you don't want it there why would you want it
>> in xen-syms? It is the step of populating the EFI partition from the
>> standard install location where some equivalent of INSTALL_EFI_STRIP
>> would come into play. That step is done outside of Xen's build
>> system and hence outside of any Kconfig control.
> 
> We have 2 binaries for the non-EFI hypervisor (xen-syms and xen[.gz]).
> Why can't we have the same for EFI? E.g. xen-syms.efi and xen.efi.
> The former would have the debug-info, the latter could be installed
> into the EFI partition.

I view the two-binaries model of the non-EFI case as merely an
implementation detail; it just so happens that there's little point
in mkelf32 retaining debug info. I therefore don't view it as very
reasonable to artificially introduce yet another binary. Another
thing would be if there was a way to produce a binary without
debug info accompanied by a separate file holding just the debug
info. Yet I'm unaware of such being possible with PE/COFF binaries.

But yes - technically this might be an option (although, just to
mention it, I'm having a vague recollection of there being an issue
with this, but I can't say what this might be, plus it is easily
possible that I'm misremembering or mixing up things).

Jan

