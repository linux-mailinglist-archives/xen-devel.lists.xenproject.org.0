Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4976FA25
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576892.903561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoMg-0006lw-HO; Fri, 04 Aug 2023 06:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576892.903561; Fri, 04 Aug 2023 06:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoMg-0006kF-EB; Fri, 04 Aug 2023 06:32:46 +0000
Received: by outflank-mailman (input) for mailman id 576892;
 Fri, 04 Aug 2023 06:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoMf-0006EL-5j
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:32:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b82b4042-3290-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:32:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9242.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.48; Fri, 4 Aug
 2023 06:32:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:32:42 +0000
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
X-Inumbo-ID: b82b4042-3290-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ausqHzoCmVVOMvAxHlOil+uf59t1vqcGTrHPaCncvU1n/cyQeSMeynLEz/jnpKNOqjIIdJg016Mb40wZGw03z95N4pVWwwk8pHD6X55vZJxpJ4QlmC03R2i2sCCZ+KHof2OxuPsx6VcdPEKTZ3fenVh7uZ0Ds4kRXsLakaE+o7cCy8f6KIbzfon2zls9Gls/EmzoFSfbTYSvPhOHZ62AGRSqtlzzg6TZesxlTILGznKtSO3sxWhdOsZPqcIsx+CsI5cUb2tf6N9fBU71hyYDE+DMeIVaDmWxV2tjmiPT/WctXMIqwnhTutBsIm2VZ0CkzobrjxTUh0nh6Y1+bJxLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYd+Ywgcxb1lA7p76Cb3f57FcBHVU4ae7hWXTzcbzcI=;
 b=NJNWBBQfjY9hbizmc2j8x3xidKkJ7dyI/RmUsxKreDb9ciShBpdbCAHyIhpi9+ski6DxC60G6hmHGALjLBSwj8nxAoCHb9D+eXjLUQbnKc2d9hbVR9HW3OliwnznUI5GVhO73H1mDedvsrgtujhh5RPLcYjwQiXXra9zxKJVRAmdk1hpHBQ/i3KWOW1iAxTVSX3O+/qMaKHW8dPgzjhFlf9Fdo+p8CcqWz4GwPiHusjyC9Jad5DUY+iBU34lgN0BLqhwohwu0sg9RGEyGyqUB2MUf9wEtRWOpX4jjrk65Ee8Jd05rC4wKq93CD81lkN+zMWDJyNWVg5QpeUHOHNtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYd+Ywgcxb1lA7p76Cb3f57FcBHVU4ae7hWXTzcbzcI=;
 b=OXwCqSVf6arXcfZx58JIwM8Zsoxbub/BKASRLMddLmL8LnomtFTlED+TQILUUxJfivM20HBIp9cUYfgn9CEWylA54bmi/7Q8nAXaBNKlBN2fvdiff5YLbJjS7AlrWLL+B91QYf8M0uxaWV6YMVgAwwk7U3bxvvq196E1s+kXsFr4mkq2uGR4K3OJvuWVC9bVn6swmRb5buFkZNuV4KRJprGhBCdGvRgdJOqIfSR3W0sC1XE/AML0kzmIfgxWPD5AOY88muKb0Fkac1W4plJYDyHXqxgCVTM6q3SIZKHHPCUzbqASV54TgWYedtVgbwNtsbrob3F6rt5E06UJB6k+DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd775e7f-c06e-63f6-a4ac-4904133000d2@suse.com>
Date: Fri, 4 Aug 2023 08:32:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4 0/8] annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acb9389-e93c-43ac-059f-08db94b49b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8v/d2sE4EV0s6hbiO7Ar641x1+7C6hjeCzIC28OeRA+OkGY6tbhaTHijS5XOBEmuzszsGfKGwnXqoQ26EgnP2jBE7UiJ3xVfB+CRWia5NnTDpMJqiLeT/iO2QRGMD8AIynq2csi1qLPuKWkZ/sgO6zR4NgAj6FMAlgbZmzKMs0ND/laNZFAXgwM+Mbe4tmidUyY2mfZyRu9uYXUh0li44D+JxrJtGiOa1B8wZjR30FGU1Va+Z/Tgc8yuaAranRPGZBCyB471oIdLYkv9IqNMPVWbl9qBRViqRse6oALEcRcWK+s0Pt2dgwMkXCZZ2YLbhWjA0vv/aSynqNLj+0Ls6vUP4MgEDg4MUmibfI5nT3vKvodEqHoTf4Bu8NiFlxsZBFdoK6YjnobWCZsIbmKwLdzSx4nEubwPMQO9jbEWov8T9MY2ve1Sfy5G4OqsmiEfqxl8ECnPO8yK9uyYfnZDBIIV1H31GPz3Bb/ZrI9JS+1bZ4PsxDXfhzEw9u0o3A8M9o+sj7Ope+yvTaD/6qqaynvgEFUlZhBk3NK5tPwQ4WOnsDGkqCixlm9CDA/nZXrr009UHjPiJNFD47YeghplreJVHRzg2d6wl8wCjAFmYy5s7YdXdeW+85qLw4Lc98kJ/EXT8iHrsBeTaknlKNZaCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(1800799003)(186006)(316002)(478600001)(2616005)(5660300002)(86362001)(7416002)(83380400001)(2906002)(31696002)(38100700002)(4744005)(36756003)(53546011)(6506007)(26005)(6512007)(41300700001)(6486002)(8936002)(8676002)(6916009)(4326008)(54906003)(66946007)(66556008)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVTSlhJWUVpaTEzMkpOSFVSQ2JzL2wwYU5YeHpTVGM2a0dXT0JodWlsRzVQ?=
 =?utf-8?B?K1RiZWcwM1FrajdwTVZSOEprWFdhUlU2YlhUaUtyc1dFbUc2SGp5KzV4Yklp?=
 =?utf-8?B?V2FXRnNONTlmL21qVU9Bb2owMmh4Z0lrTE0wMUUxcG02TnQrN3Jld0lySEk1?=
 =?utf-8?B?L3RzdnJ3MXhlZFgyMEJjbGRETFB2VUNxQm0rSXhUQkNReFlRQ3JyTXZTMFRX?=
 =?utf-8?B?R1lIV200OG41Y2tPcWlXTmt1dFFjbUROMFBFQkhsR3hhaGUyL1NabkRQZ1lO?=
 =?utf-8?B?blpQZVZIUThYUElTQXh2Zit0M2kvd3RlUytQeGk0NXBHdkwyZDlZeEUwSGdz?=
 =?utf-8?B?OGUwdDJhMEgydVdiR2Q0bFJ2bUdweGRvd1ZTNG8wZERKY0lxRnV3Z3RoMm1z?=
 =?utf-8?B?Z01yZERyWk5nbVVBUEVYdElwbzZsaS9jY2FaV3YrYklSVlhwdUlyQkYxaXM4?=
 =?utf-8?B?NjRiZ21Ld2h2WThoWE9NcldMV3h6dElIWFJ4THgvQUxGZjNPWGMxQ2hDeW43?=
 =?utf-8?B?NmJBWDJSS29tLytRU1Y2TGdXWFBTamRRMnAxdHphRS9vMlZGdDQyYVB1NzMv?=
 =?utf-8?B?T1NVMk5xanJNekFOcWxMb1U5NmllZWovd2h4bnJjcFU4NWdJUUpraDZpd0dF?=
 =?utf-8?B?KzZOWHlLelAwL1AxVnhHdlBGVDdLQWZLUzhJU1Z2U216WnhCZmxRM0VhdE03?=
 =?utf-8?B?UnVOdzhlL2JYWGdTeWZlYlQvc2I3NUVBOGQ2cVhhWEJiRDM1a1VHM2JpN2pv?=
 =?utf-8?B?dkswWXA2dnlFck1HdGtGYXU1NUpseGp3YWlXUUh2OWR6ZjhpaVBpb1VGRXVn?=
 =?utf-8?B?RW55NmlTbDdDdGJOMnVrakNyYjlYT1FhbzdrY2RKVC9OSHlFeGRRRnNXMWVa?=
 =?utf-8?B?ZkkxQU1ObXpQYmJ3bjN5T240cVYrZlI0d3B4K3VWTUg5Wkc1N1JmWm9wTnVi?=
 =?utf-8?B?cENia0ZRV2l5MFAwUFEzOFE5Tyt2SXA0cWlBVURrNFM1bGVGc2M3WWt0cXRY?=
 =?utf-8?B?NDNERm1LUEttbXNCL1dDWHRIL1lhUnJEODRlZ3Y0eSszYUlKMmlSZWY2aDhE?=
 =?utf-8?B?eFlKeE04QWQzaWxzUHQyS1pTUS9FSTR2ZE41Z3FXdlI1YzhUTmV1eUhsQ0Nl?=
 =?utf-8?B?elBuNGxPZmN0OWE0NFMzU3ZJRFEyVGJjRHRPREt2Vmk3ODViVkc2S0VJL1hp?=
 =?utf-8?B?b1o4Wm00bnFVNDN5UkNRR01SdFRndEVpQkt1c01KM2R6b0pHeU02d2VxbjIv?=
 =?utf-8?B?blUxcGV1VG9Nenl3T0hlVGw5bVllZUZrK1c0WDJ1WEhXZFp3RXpVWVpEWDc2?=
 =?utf-8?B?MWJ1am5qTDdEVHMzQlpUcTM5QVFjeTMxSlhWbUdyOG00VXZGNHVMNFRDSmtO?=
 =?utf-8?B?RWd1WlM3ZWxlVTkySlpXOGZ6ZWRndFkrc2dvNEltY3JvVi9IQVFKV1M0QkVX?=
 =?utf-8?B?bHFSL2lCbXVvRVRCMUlwS0NITEZ6ZUNydnFDZ212N3ZpMG5OU1p4S1ZmM1FK?=
 =?utf-8?B?M0xUM1BzUkg1Sm85WUJrWWswSEoxQ2xTNFR5WlMxRXhFenIxVTRlTlRCcVcx?=
 =?utf-8?B?MUdaV1VaUjdPT1JiK0R5REhrRnlHNERCazZ2aWgrL29lWG5uUHk5OURyd0lu?=
 =?utf-8?B?bS9rNUVsdDMyZ0xNWldVTW9iUVhtRU1Ta2FPNTNDUE9WYkhVSlBpZUh1ekhy?=
 =?utf-8?B?aXlPbUJid1h6OU8wb2IyV2Z0YzRIUkhjSEhjM3BYbVVIU2JBdDFtMCtDOEk2?=
 =?utf-8?B?OGwvUENxeUJmanZrTWVYd3hqMW1sNUdBZDA4NUxwWWZtcGNPdWlUTWpsN21m?=
 =?utf-8?B?VEN5bEtkOTNWWVRUZ1FtbVNsNU8zUmtwdmlhSUIwN09NZVd0NERob0ZRRFlN?=
 =?utf-8?B?bm4xSmFPQ0pIdStEQjFPTHllNXhQbE5NN2dQQzJrQ0NtU29iS3QzNEtnV0N1?=
 =?utf-8?B?ejYxRkxJL2NVNm8yK3pMT1ZhZmY2aVJ4Y3BrbG9jUTIyUi9CTHZ2SnQxU2RC?=
 =?utf-8?B?NWpLSHprNlJLZmhnVlgrbXVQSDZxaXAwbEdUR25HR3RXRGZmVWtDdmx1SERv?=
 =?utf-8?B?VmI4ZllwK081NTdsU1doZldYSjFSd2FLb1grL0NDWWRJd2IvMXl4MU9TNzdi?=
 =?utf-8?Q?/t7EsvpUfuinURuTg8h4IFORT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acb9389-e93c-43ac-059f-08db94b49b45
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:32:42.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF6w60+3MH7NfOTaaFpiCuoqZoCDJOR06Ki+PTVBTbI9sdEZ1NQ3SzGkyV1S6H2d/5OqOlPPW+lh8mu3tIcopQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9242

On 04.08.2023 08:24, Jan Beulich wrote:
> The model introduced in patch 1 is now arch-agnostic, and all arch-es
> are being switched at least partly (to at least give examples of how
> things will look like); PPC and RISC-V are still small enough to switch
> completely in one go.
> 
> 1: common: assembly entry point type/size annotations
> 2: x86: annotate entry points with type and size
> 3: x86: also mark assembler globals hidden
> 4: Arm: annotate entry points with type and size
> 5: RISC-V: annotate entry points with type and size
> 6: PPC: switch entry point annotations to common model
> 7: tools/binfile: switch to common annotations model

I'm sorry, I notice I screwed up with the numbering of patches 6 and 7.
I hope things are still clear enough.

Jan

