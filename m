Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05E58F7B0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384165.619454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1le-0007xx-GX; Thu, 11 Aug 2022 06:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384165.619454; Thu, 11 Aug 2022 06:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1le-0007v7-DI; Thu, 11 Aug 2022 06:34:06 +0000
Received: by outflank-mailman (input) for mailman id 384165;
 Thu, 11 Aug 2022 06:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1lc-0007uh-AK
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:34:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9760bb05-193f-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 08:34:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8043.eurprd04.prod.outlook.com (2603:10a6:10:1e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 06:34:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:34:02 +0000
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
X-Inumbo-ID: 9760bb05-193f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYarP3jHLAV0qcrZBAWX4KaCZumzRQcVRkoikrVy0CfrRGeTFMsXyYfFATbwVvvAL2fNGoJ4ihPUZlUH8wIDtsWSCA5ETytLM2USxR4yrKnyq8Mo6Bw0Ahf4WpBH82HE7cU04rZ1GfksupHLvRxFsVBbQdbg9uygYYbRGJ5T/Ca+AEUWOmpq6giHzuUiFMfzlCWjgfp+CgsUYVi9QinfoL7m1NWdARKyrMuEUfkTzNGJZp/zqpAwBH+NPw1JqOWMhgt5WFEekBG5R3WBS5/XNdcXMCpPeUUjuhpJ3g0JmJe8Mktukx3DLNpm69rtoaCTmqmc6hD/SiCuKt37y1GBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7jJ+P82HsC43H2tehMpBIbZLspeOZBz755EeWgzy0o=;
 b=CORt00xSONAieirTEfJ/tWrA/tWMrjCJwinT2VOi1oazClxKpFF8xZBCl02fuCVKLPjo9nArpB5egYieOIUtMtPNHQf2CuCu12sTKrgr7QaPVIoHY3SOiapwu700MiiiDcqjidbuQG2vHiMfzD+eebdrzZ31MInoSHAzwN16uqgWdUIwpVaqirp6VFie1gynyNCZSX08Skm/1MjUKwyhp8hboTYGur12je/NfqZvm7lMtagfQOumE2KCemu8kJcFvDegFaZLxRKhODH1fqQ6ueYLYSwAn0f70PKsqRv+NayX2pCvl7wxy/yMmE39Xo3DGz+5YZml4m20Own/C388QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7jJ+P82HsC43H2tehMpBIbZLspeOZBz755EeWgzy0o=;
 b=5ecToddr+lVRANtoj1EPmG3KSttY3R3Vvx+dQA9trWp0/XoxUU4wjbESvxM+TZAtrFu8ELeOJjNT1GyHviHaJHekYfarZzKzuSP+1htu9171Go1sQ/TzSF1xTCdCFy97OnGyemm5wLaruUJwnU/PhvXJ7UJq4WD5C1f1vXLd/8uQI7AffSKEsHl4oerMrfCYVdaPYY/wtCCN0DOpjmlA00w6N4REgdEtFV2vgdfgFBUlzsM77azg7koP8qjztNnldyZcnjzOKCPUD9B9UyL7j9pjJ18X6Eds94fBYYpcV10dQAdxTxZtk9IkyoGir2OKSI6AW81b7Vy1+BqiFUvaEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed928e9e-d8a3-9631-2a0d-0fb4d3868f31@suse.com>
Date: Thu, 11 Aug 2022 08:33:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 08/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int16 insns
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <5c77cdba-fac9-d82b-9d68-40f8b4f82d66@suse.com>
 <b2c51a01-6c25-7893-f822-854f378755bc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2c51a01-6c25-7893-f822-854f378755bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea53e2d5-563e-48f8-cc69-08da7b637aba
X-MS-TrafficTypeDiagnostic: DBBPR04MB8043:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vpg0bTN/nYOV46FHMUyJeMaNR9dszD+hbwkf+qpBnhtigy2UXAe5H75NKUkbQQOANxEB+BcDcx3N5/ALOwpB5I/NBqH09S9kHTGHIikWmjyB4ey33QSat0THv54AJdyuHzWINxM8EuVmjIb2UQoUXWgcHpGVyxss3mHSEOxuCFjWKLSZK6JATK0ZMQpE+03wWL+aMPfICxFfSLDhbSo30/QcmwJGNn5PVTHaIKKcnDxXjBLsduxpbTBjfqRhIw88kYzGZG573mot013RbpetiXXVVXgtnbXMNw9FraEjvkPaK7MNLvem2Ai/WQNiAN4N4zxsymUl32H6XCCzCQ4xbK+vZtNPY12EMxc6VRx7/JrhkSGwk5sfGx94PmC+wehCayPsmtx4Mjwict+W5JvaepRDHDMQkf2cUU1zUSN6iqB8QUIs6c0HNjvPAu84D2fxNauLH8XXfYF+eMlSXfekmkS036HPFYjQzvrRTx3yURtX8K8MlqZKI9sjmEbW0g5692ComGHTSY/n+4oAnU9B5BY1tId5zes0o4PDPi1rUCEqaMhqHhvlEfRLt9SymNYW64D0bqurcLx2fzeQM01xM83OjNWvoi3BhIchu6kgjLN2GzfdgKCNJmEH+d4C65D2FAQrW7AuY/wQ1GfKacntWyGTXED3rCCwmE01FljKTUDKS70cMSwTPUSwgJf8ZTCowTM5ac2M81BJUMLRCtmkX5ZZd7nobr9wuP0cIHUoBPkKxSAE/y0OVjRVLyeCxfw1Wrl0xDj/cXg2SWOOVOzkCcPA/cjSwWTnp8IuP0+IBKilzk+y1JEMkEL90GMk22reZcFLw5NVt/qLNG1dzIXPNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(396003)(376002)(346002)(6512007)(41300700001)(31696002)(6506007)(186003)(6666004)(26005)(86362001)(38100700002)(2616005)(8936002)(53546011)(31686004)(5660300002)(66556008)(4744005)(66946007)(2906002)(4326008)(8676002)(316002)(54906003)(6486002)(36756003)(66476007)(6916009)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lQUmlmcDFuOUFhdEZRdlQzSjFwS1dWZ0hmSFR1VG9jbUgyN1pBMWhpY0Iw?=
 =?utf-8?B?bVo1NW9hZVpZMWh3MzQveG5zTlNtN21rSHB3RlVuUDNTaE1UZ0pON0tNc0Jp?=
 =?utf-8?B?R0t2WjRuMEtXTWdTMXY2VlNKYzd6QWlBazhrTnowSXVXUVRWVlY4a1dZNWNP?=
 =?utf-8?B?aW5MNmNvTmZHYWo0di8vY2RacE0zN29FNjVNc3F4dTVyQ0ZVRGZxckFtZy9T?=
 =?utf-8?B?ekE1bW5TTW9Ib2NzRm5HQVNoY3VPSTFUbnBCYmIxOThxZFhSRzk0VjJVeXJC?=
 =?utf-8?B?c1NDMURtdnVLb1pCc2szT0N6eUp2YW9jRGdvdVVvOCtrMURET0JNNTY1M3h5?=
 =?utf-8?B?Y2JaU3kvMGcyQWYwSHJyRDJQR3NrQWlFcmR0U0x6U25UTmMvSnh6TGpmVTVx?=
 =?utf-8?B?WXJFMnV3VnZRcjNpSGV3ZmRNVTNiMm1XaEsxRFlya2lFYVZUMU8rd3hnZW85?=
 =?utf-8?B?cE5LT2JSQ1VWYzgzRGN5SzIwN2RmZjZrYjNvbDJ2bm5OV2dGODBEaXNhcStQ?=
 =?utf-8?B?QTJoQWRCbFlMR3RiWndMVUpCY09Zd1dYbnAzVGJKOWtVRGtwRW9ReHdadElW?=
 =?utf-8?B?cEZrbTZ3Ykg1VGtZNTRWYkVya213RE1XTjlrNmZaSGJMc3dkOWR6bEh4ZFVZ?=
 =?utf-8?B?eGxMTmwzSnFiWjhFc1lCNHlYSzVqT3N4dFp1aHRSRDk4eGFKVis4SlQxODhm?=
 =?utf-8?B?dm9SNGVUTU5yL2lqbDZBQ0dQTEs1OGo3QWRiSWxyOWdMZXUvR2t0NkJmNGEx?=
 =?utf-8?B?UEtXN0ROaWhmZGdaSGRLS2E1OEZlSVVrVHI0dTZzYVhBWmRHeHpEK1JTTUt4?=
 =?utf-8?B?WEY4RHR0WVVXN3NCZy9IQVZEckd2MlJ5ay9BUUJwaXFhbm53L3BJMm1ITFd4?=
 =?utf-8?B?Ykg1VUVib3l1VkpHQUJMcGh0blUwZlQ0MTZORFp2ZUcxQWdNWWtPSFJKdG5a?=
 =?utf-8?B?c3hBRFNlWmxBUHJ3VlVnbkpCdTFZRllLUXp6cEVzM0JjQ3ZGSDdRdTdoMHJl?=
 =?utf-8?B?MkxYMlJETHZ4ZElwUENqU3dmalM0N3I4WXRaTU5PUFlIaldaZytRd0RDazZr?=
 =?utf-8?B?VnhwN3pHT280a1I2Y0MrYjJrWmQyMTliV1IycGUxZTFKQ01KMjk2N1BveG1D?=
 =?utf-8?B?Y1JMNVVYQWxDNE4yN3pOUGtqQkMzQUJrNzhUdGp6TElOVCtPYmhrd2czZExj?=
 =?utf-8?B?TnNzQXNBa1NPTE55WWJUNC9oNVZzMnhud05oUXEya0dJeGNGYjRRSGI3YjZs?=
 =?utf-8?B?Zyt1YXFabUxsWmdNTTgvYmd6MCttVlJQODRrRFV3VTRSWVZlK01vZ2RDNi9S?=
 =?utf-8?B?OWJ5OGFMMjZXRCt0NWhDd2dpckVCaUtWZ1pYNEFFbk5rZjNEckpHRUFHekVX?=
 =?utf-8?B?RGhsMXlkOFVXRGZCMEhMS1JwK1ZFN0EwaDBvYVBsekQ0SVg5WjFLRUx6UG5h?=
 =?utf-8?B?Y3lpRDJOYmFPbW5CZDcwUG15Y251b2tmNUViWFRQYUViUTJQTWZ0aUZKQ0xP?=
 =?utf-8?B?b1B5Y2pLczJ0R1JyMlZLZm9xdmc2dVAzamkxcnY5cWZkc1JsNnV4aWorck9W?=
 =?utf-8?B?MHkxb1l6Vks1ZktjaGtEcElCME14Uk1QWXUwS0dDWXg5TjF5bWJ1VFh5VGY5?=
 =?utf-8?B?SjBsQnBYc09zSW5raVlQNS9FWEkxVWR3UzNEM3BkS2luRGRjbkRNemZIQyt0?=
 =?utf-8?B?MlNJRWpEQ3VoYSs0ZHRSdEZpSmFDdjFiNEJFQ1dzb0lTVTdDU05hb0Jidy9F?=
 =?utf-8?B?eVRTbVpWVkNTaWwyekZYcDVmckV2ZnUxQkw0eWh5c2NrS0hiRnZDV1NLMkZR?=
 =?utf-8?B?WEUyVnlRWElpQUd2dGpOL2pUY212Tm52YS9PZWFBUzhwalNYK2MzdEdiSHFs?=
 =?utf-8?B?c0g3QjBFSWwwaS94K2UzNkVLMFdKUmtjc2JtdldmVXZsOWFCeXJxM3p1bHht?=
 =?utf-8?B?b2xCM09yWENOdTh4ejZKb2ZtTUxMeGdXb3JockwrME1XTnZHNmlYVWU1Nk50?=
 =?utf-8?B?LzEvcjhaTGxVK2RBb2VseUs5dzR6WDZzbWlUNFU5SkljQUQxZTk1a2huejQ0?=
 =?utf-8?B?RVFOSFJRc0svRjVzNVV3K05RaHU2eFlBYUlnTE8vRFNSN1ZsNDBBWUtoQTI1?=
 =?utf-8?Q?1AzPEeHdrugjRJTFRVCzwISSm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea53e2d5-563e-48f8-cc69-08da7b637aba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:34:01.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+Xj28beYHu5Os21396uEjW7h6ojidzS/7DtvPiSsGUmXMaLUm/Kt0SdQnHQfh26w0sOTy29ITWbTGn7tt8sKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8043

On 10.08.2022 21:01, Andrew Cooper wrote:
> On 15/06/2022 11:30, Jan Beulich wrote:
>> These are easiest in that they have same-size source and destination
>> vectors, yet they're different from other conversion insns in that they
>> use opcodes which have different meaning in the 0F encoding space
>> ({,V}H{ADD,SUB}P{S,D}), hence requiring a little bit of overriding.
> 
> At what point is sharing the opcode tables going to be not worth doing?

Very good question. I've not been able to set, for myself, a good
threshold. The vague plan that I had was to wait and see what the next
uses in map 5/6 are going to be, and then decide whether to introduce
separate tables. (And if still going with overrides then, re-evaluate
on the subsequent set of additions. But basically always with a full
new set of insns in mind.)

Jan

