Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C1765374
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571080.894061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzxw-0005zd-IV; Thu, 27 Jul 2023 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571080.894061; Thu, 27 Jul 2023 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzxw-0005xD-Fb; Thu, 27 Jul 2023 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 571080;
 Thu, 27 Jul 2023 12:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOzxu-0005x3-UU
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:19:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86d6be2-2c77-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 14:19:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 12:19:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:19:05 +0000
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
X-Inumbo-ID: d86d6be2-2c77-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqxa6SLII9UH6AH1Rpm2bzExCy9fiib6GnhZDd8+sFudkPzC3s9vhMSrEZpwwJpulnTSwNXrrIUcrl/hZzPBjc4R69AxUEckHKL/QOYccGJbYRBCYzlzYHp2qKcxfYX8/e4sCkhsqBBkZRYqRAi/FHfZOWoXQshSNGdZ6avXTNw01a83hezg4kGjLm8tTWxMLY6vaOhlSuTZsGrJCgMYbyUVFARqLB5zONJqxx1dTyaKvG0tcz2hJ9NDM8CCDNIe03Mcgo/3YtjVyxrZmI24i6qXr8/fndbSSWSTnmKYoMHsVIrv/To40B2/T5t57uMEVsDNUdLR+nlRaKRvnxKpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py3/I3RJ0McyuR2GdFyoXWdqpNhh7eph6tun7XJltvE=;
 b=G1N2oW73M9/biSglTRgJ8Lne/5NdYIJl0yS3w21d9K2Rw0Mazd3kWANG5WmggTq8u2jkRv3JMODPEgSDnl2dylwqBpDloK0rqu5sUeDicRpIcjXGTB5InrNrNDfxD+kJTG2nR8jAjp2M3lMkNietUJY6PMp+TM1eLnVOOtbZ0iHIm6izOXG1av4YsfUEk9B/LTmutfjUA/P5VxLyvypzcdIZtmIh0LRwtJbYNCz8TapS0hP682a0ezt/UbMlOm7nfTR0+qrkKRVN8A8p093b6grXZja2YF0MMDMhO5Hk8gfxvEtDMTxQ8JgFmiNYRpKmashYLEwW71n5VgQ65PUheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py3/I3RJ0McyuR2GdFyoXWdqpNhh7eph6tun7XJltvE=;
 b=HKive4Xbqq9UiUdFNW1oCwUIx46WyfYjUaetDKwEWhCaf5Wesai+mXeWbpJ0Lep9jQblsKV/nqY4raPbCid2YQCoEeJkQoD/Up57oRA4uQPSpWAJ2+0PO6fcFZjRS2zGEP7GDHaCUF47bMhnrCVi6Y5iRCmMySFLgfX+L6CpFIOvjH6SiNUjaAux58uEgBLqGkk2HHfwMfIt+rBXRSAr/ByKNUNfc3XMgQ6DoRnj6JiGlvaHNueBMNbyuWoHv5eTEB1iZcXg34XxAjEMvg79YDZ7xOcae5aQboWMiUUQh8Xj89xQdUFW85X0mSpRVNHwITA2uVV1vgkheQbQKQRvEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43c5db82-ce39-bc6d-228d-da2f8d1b147f@suse.com>
Date: Thu, 27 Jul 2023 14:19:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/4] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230726125508.78704-1-roger.pau@citrix.com>
 <20230726125508.78704-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726125508.78704-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8b38ad-cf28-49ee-2dba-08db8e9bab62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pq6MzBC2/juH1pOjSL2LpWrWgtlk44SrV9+m3xynKWMIBcOc2rmPksAKWmG1a4JER23XKvUmTS49V8CiHfJV/QND53wpua9b3CMSRBbDGSctXaZV6GmrzxjcCLgDbVo8y3MtPSrIujIVqDJ/XIJffgRxTMBea753La+FjzXcsZhustnuEPn5Ta0UjLpNk47gKMUcp5Nv/ElfkDr/5tH2VwzecZCHaZGlEgpzOQ6KW0Qd6dlmZTWB9CNh5vylVgYb9e80L1wy7ap9xVocu+blXbbMrSrQH8egojB1NG6AhgHBHDYSCkHMrC8P2pz4W7MQzQm3MmwKzHq7glV1Z2aYxGM/J0Bw37zu0BgKW/Ulc3qmSVd5zul7xfFBB0D6ZidvzK7ui7xpSb/qbUy3jY6E3dLfNLZ4ZYIkoWhAC8BCM15XzBM3ZmHqSEBs9TV9einNQx7XVp3WIFz3nQ0Yd/tH0YP/7/vWobOa4D5gb8zd0IG9WQyKuHBe4k3UzLPF+rECLXzihAfZehNBfVD/Phwk9uJaG66/d4cOfSw528J2+Lw0ZXm1FA8IP3f9BjvK2EiT3AXV79iZQHY7AmcqV3kZUIVMh3s0OPfxN1UnPl3VS/DqVuxBsGNDEtHM5hH+RzTZNcHuNWI1BYBINvDp2bCS9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(4326008)(6486002)(478600001)(38100700002)(86362001)(31696002)(6666004)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(31686004)(6512007)(41300700001)(83380400001)(36756003)(2906002)(2616005)(4744005)(8676002)(8936002)(186003)(6506007)(26005)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzBQa2ZvZUlQbHF0R2xlL3pTS21pcEpveFQ3K283V0JTNzNHSFpYTFBrQ0Ny?=
 =?utf-8?B?VFEzVTVxU21NZmZZWHRXU3BkdmIwTjZXeGdyYk5XeTlxMzZNbmE1OC9LMGts?=
 =?utf-8?B?a0x5ZHd1V29ZMXgwa2JRRXlyS3Q4U1RWTUhWU2J3dTJBbFVmRU83Z1krQUVv?=
 =?utf-8?B?RWU4TlpaU2tMSkpWMFlIZFdlZ2pHWTM3WklHbkFRcnd5aGNiSEFXT3doZ3RD?=
 =?utf-8?B?VWJCMjRGTzVzd0dUYmh0TFpRZ25Pb291WXZYSjBlWDU5UCt5dnYrTGJXcVNj?=
 =?utf-8?B?MkVSbzQzQnNYdTQrR0MzTGRTa2tqTW54eFlXZUVMTzEwOTI0MFVJZll6bUlE?=
 =?utf-8?B?TjlKT2pMOXBKY3VHdGtUSkNGd245T3RERmhPUzlOV05oVTRWVVArbWZUaFE3?=
 =?utf-8?B?dEFNbEltRENLd1RHMExvZ29NWHRnd0ZMS3RIM3c4ZFpJVFhyT2pDRTBlVGVp?=
 =?utf-8?B?dHdOUnRpTStQUk1KZ1c4RHFkdllvb3ZKY0Z6c1I1UVlBcWR0SW9YYWY5TUsv?=
 =?utf-8?B?eDhGSEdKQlp1azdTeUVaUTdOeGUvcW5MdWF1dXVGT2NBSHBKb1plSGx0ZnRH?=
 =?utf-8?B?S05KVnNSdXp5Q3p0VmdNMmkxMUtLeUYyNnhERERzZ1FadG8xdjVHOFB6NGZQ?=
 =?utf-8?B?MStOOXFhd2d0U1dyY2NOL1M2U25RS1hwWE11cEdkNUdrZUgwaUZHVllKOGIr?=
 =?utf-8?B?c2ZwY0N2eGtrMU40NFFGYmZwQ2IyK0lNcnNUSTlYZUV2QUxva2tJSFBzMTZq?=
 =?utf-8?B?QkpMbU5YV2pXVnVtOG5pSGI4cko0cHRLQ1pzTGNSSWFmSW9JeU9TMHN1UHkx?=
 =?utf-8?B?U2s1WkF6di9PWFR0Uk5ndXlmcVlwdmdRdzY3SXBuOUFPUzQ4NmJwWmpBUjZz?=
 =?utf-8?B?bHZoQk8wNUR5a3NacTZiSm9tV2ZScS82TVRtQldEbFc4N3hvOVdrSWJsYTdN?=
 =?utf-8?B?Sm5MTVVSVU85d2tweXZySE5mc2VNZWhidW1YOXBWdWVvei9nUjl3YVR5aEd3?=
 =?utf-8?B?WDVVbnJFRkZXMk5TSkdkKzJrdW8vT2RMUGJ3ZmRsY0diSUc5L3VnVEt1Y3ZN?=
 =?utf-8?B?UzlBODA4TVd0SHRLTEdwTHdMMFkvenFBS0JsSFZFcndqR0l4ZE5PWjA4NWJs?=
 =?utf-8?B?N21SSGEvbW5GOWI1TEExRUhGVlBycjJkTWdpMG9icWJCUDUvZFpMUndSNFJ5?=
 =?utf-8?B?YW03YnpjWHNza2FYeDJaSlJkQ2Zta0UxMVJJM3crOW5Xa2E3NkxZRElNdHZp?=
 =?utf-8?B?TCtKOGRWdTltR0RZU0FqYm4yY1hzcDg2ZlZUcGViVFhrN3FCeWVET05XV3hD?=
 =?utf-8?B?bngzMENydWxCTWFrWHRQN2twWDVlL0sxU1QyOFFxNnJZeVNPbithMllWSmls?=
 =?utf-8?B?QU9wbTFVcXJkRDU3cUNsMkRKQWpkbURlRTd4MzE1R1Q1enZiU2FHS0QrQks0?=
 =?utf-8?B?VFBkYzZvc0RoNkJ3akV0bmZnYTIrQXc4SCt4a1M3WVdUZ2Z1bXNiQ0RQVTJq?=
 =?utf-8?B?d3lnd3diZm9hVTc5SWpnZVNOaGYzS1V4VWtRSHQxdnl0Vkl1M0U1S1laU1hs?=
 =?utf-8?B?VUZ2NWE5MG1UdGVaME9jeU1Obm5CQmRyOXlaalF5VzBrQ0pFUHNPZFljTk95?=
 =?utf-8?B?ZzVjRTdqZXJ6b1hvdU9ZdFBGZmZSUUR5K2k1RENWNjdnY0pFc2FXNGZHcGE5?=
 =?utf-8?B?R244QWsvOW5paGQ4TjFwa1Q5Yi9laTg0YVYreXM3UDljcU8rS25OeWloTFFX?=
 =?utf-8?B?Y1N5T3Z2TitOMkxCR2hRVEp2WnhDVGRXeGZJQUltRnpLWHhaNkMxQXZ1clI2?=
 =?utf-8?B?UU9nbFk0L0k1RTcxSWgzcldjZkw4aFJGaGlBYi9OS2VzaGVlQ3VFdDJ0ZWhr?=
 =?utf-8?B?ZFBuaTB2dEhEQmg2R2l3c1JoK0IzaGdPWHZvcWkzZ2QrUWVTSXh6MTBRbWxO?=
 =?utf-8?B?bG1ubExmemRNRk9QdkQ2MWY0azlQQUM1SXp0VGxJT2lSaWVsUEkydG83S0xU?=
 =?utf-8?B?SlNNSEhkUzRuZTdxY2Vtdjh4OXgvY0E4dGFmQ2ptRHdvdjlJU2gydFZLT2F4?=
 =?utf-8?B?aXZjelFGcXBERzhnUHhSRk5BYUVYcFJQM1FtZ3pHekJkdnhLSWJtTkJxVmdR?=
 =?utf-8?Q?EIgIh3g7HdJkQbCDdc23LuZl4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b38ad-cf28-49ee-2dba-08db8e9bab62
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:19:05.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39eykrHZZN3vGe1yK0E+Qw/JEQG92xdTsFmbW7cxtAohJktPcCqm7WOn5oaNxMLUimNLlFoh9CcRVfeRHidh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

On 26.07.2023 14:55, Roger Pau Monne wrote:
> Do not allow to write to RTE registers using io_apic_write and instead
> require changes to RTE to be performed using ioapic_write_entry.
> 
> This is in preparation for passing the full contents of the RTE to the
> IOMMU interrupt remapping handlers, so remapping entries for IO-APIC
> RTEs can be updated atomically when possible.
> 
> While immediately this commit might expand the number of MMIO accesses
> in order to update an IO-APIC RTE, further changes will benefit from
> getting the full RTE value passed to the IOMMU handlers, as the logic
> is greatly simplified when the IOMMU handlers can get the complete RTE
> value in one go.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



