Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B043E5FEB49
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422597.668730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGYD-0003o7-Sq; Fri, 14 Oct 2022 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422597.668730; Fri, 14 Oct 2022 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGYD-0003lA-Op; Fri, 14 Oct 2022 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 422597;
 Fri, 14 Oct 2022 09:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojGYC-0003l4-Bd
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:00:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e0ef6bc-4b9e-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 11:00:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 09:00:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 09:00:12 +0000
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
X-Inumbo-ID: 9e0ef6bc-4b9e-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaN2wjQQOZVEHJZ71X/vI07Fg9G+51Pq76RWskmumBKrMvtqdbv5rwgr7IMg+CAVPXhS8lMM2ALv8sG7XCYjyGap1AmVlTryrLVTPlp9KR6MQfRY+WaTeXDv8QzFT2mWolXevJ3rK8a3hW+tkqrnhu1v3nBqkboc1bOPSPyG/WjlmMEhr3KvZ/BvxrDnJd2BcW4v04Kw3bSqJja25tHXdDZDp09DKsF+pt1GXVVb1OZfScs3Yc2NLmT2Zy6cQVaw0iEvRsBey2aHeItSzWxYRZnsdC19Al5+1BYCpjwOdntSD8oz0Hhx9hrycFp1mtWYmZiWB7yAPO4XszjfMoSb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjplBNW+RgXUi+BL/4Ogjbzs6ieH+wtWMYCTOnWjWzg=;
 b=fp55HboPLeXVK8XmzVh2cCzDKRaMuIns+snUsiBxCoeVaBHtmf0eyg8D/gr1jXfdw+WGDUJsWzngpuu27eJ/KVwnyZ8EFW5vbxQ6+NJTa2haAwjDnJjoPMW0Q6mATeivP0Z+Th+1V/8fHEbjva3HWGT74gk656kIhv86ggozApFL3vfe9AX4i4uT8LjjbKwIZThr8tyNHAJzkAk20x/v56OjXkt+Zo/TzrX9PUlqDXQcI2lznaPKJhPFlenn6qPsbZOeu5C9pBE1r4YELV5Bzgy8L0+RR8bQRSX2nGy7ivT8I7zgOcti0zllOEOpGAr3WfrpcFy0YMmEwrKO2AVJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjplBNW+RgXUi+BL/4Ogjbzs6ieH+wtWMYCTOnWjWzg=;
 b=Xvj3IBWX8n8UNPEIo/dheXUkkdqZiFo3P7UF2MlkRRtuqdgl91h90IEJI5MVcU85YIiaKI8F0bBeJTabsYFqnD0bAwfgRgBObwaofdBQPktquU/ScTm+dEGfZvGZAyjqVymSW0+jP5+Smq+c0Tpx5gXo9X94vck2+MULEAicZo4Sz0POEcmFtd7+sA1hWhLEqz94FL/ISCxrRq92og6clH8PK0HdM+SPXR3TXq4lMBKsBE2HowN7OSUCb1EIuwL7qTtMl2eFriNyuVVQ+H65+6spmlr2zHMbnSVZELfxgCKhHa/ivh7czsHb68MtGu2MFO326tcRTF50eGYxVV/irA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5220f340-5380-0b77-86bb-323898efc208@suse.com>
Date: Fri, 14 Oct 2022 11:00:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry.Wang@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
 <Y0gXnD4jsyIp2kKb@Air-de-Roger>
 <870d5cf9-26f7-f4c7-4fa2-5a18bfa163bd@suse.com>
 <Y0kbN+Zp6F2kBFGz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0kbN+Zp6F2kBFGz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: a3af985e-3666-4e6a-7d40-08daadc280d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LxOJJIWSiv2xRnshwIsUmY0CCpET+5O588ualW7Gf5bkgnBH8iyJuLzTSgT7upuBSZqGlijA9O2HQo4OdpJwjJ3Z3OaaXxoK6MLuIEOB50TCEeinwhmGQ8+MvcQa/iNbMkrZeFmU3M2ev514X4a50WmjxxzhNPLM4BcvhjfVw1ZC3/rHagHHeX0t0l0vcduYfOi0KD3nxUaa03G4nEGRSYiPK7sDibBqdizNjsxuHqFTv8rY7yy9W+LOcvUU4s7DVbex/26AyDyzc+A8OP33NDc5cwXAYUpTsdhjlLUV5nPAkK28yPhmAW6jQnBc40TSi9aKedaUK3S6wMTVyfQZ+xtSd/JGbQt6TQ/sjiTQMRT1Z4hS1uIFTd50PWcDdbi8KJAcqOtRN+U3qocyPG0ODzXCyREyPpfO2gx4s235muZ6Ugx2BDdgIA5+NQkyRwp6DITAptVs6Fis5OndkT+NbbylwMgLwSQ1kjKb680uoAtxVe78LL5eOm585W/x5GIjdex2oN6t6ThB07GeoT4wf4XsPKrYw1vueVj+WBoYv6LfI9f8T6v2rUvj84HJ5tjipTsTe5AIXNARjf99LwfB835szESKUrprsNr4CFxLvVx8rbQYBGXS0Gxns3k/MPuq0MSuvHd5dDyH9GKb9gbbLb23grRVgRgSsUiZj6neaSh/kPjt0RxzhYL5IYRZbOs1Cyq5g9vxwnpvyQ4ASnk2AJWFx7r9uhT2hA8EsllR5a4Baax5cMJEC58oOu5ru4iWk/t8x54N1gNup0IckBXAmRzK0Rz5l9fyNobMl0b/PAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(2906002)(8936002)(41300700001)(5660300002)(316002)(54906003)(478600001)(6916009)(6486002)(38100700002)(6506007)(26005)(6512007)(2616005)(36756003)(53546011)(8676002)(66476007)(66556008)(66946007)(4326008)(31686004)(86362001)(31696002)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFVjaUY3M3RMY1YwZVYvakVtNWlZV1Vld3R5cWdYWjFXTTZaZWdRSTk3TGtu?=
 =?utf-8?B?SUQwdUhLb2U5Vi9najQvV0xsMFpFY1NESjdKcktHTE9nU04wWnlLR3VYbnhI?=
 =?utf-8?B?RlUxUkZ0azVmd2hxeGtLY3grSUZIcHF4cGE5dE1EZm1NdDRVSGZSL3ZjdUcx?=
 =?utf-8?B?WHlEZDJUK3prOUg0VVdyQnJja0piU21WYU1OSXhPNkN1NWVsazZLVHUzOExr?=
 =?utf-8?B?QS9JdjY3STFLL2ptV1k0R3ZzZGd0TmJXUEUyeld4aDBpbmJycFdLaDF4dHpB?=
 =?utf-8?B?K1V4UXVYOUVXVlVkR0hMSUVwTThJNWtvdGQweWszY2tBYmE1Z2IxeXl5ZzZo?=
 =?utf-8?B?b09Hc0xvZ0VEOVpNQzJCaTZ5b0ZuVEZxTHh3TmxEOHZkN0Z5TjRzRyswaUlP?=
 =?utf-8?B?Sm9KSVVyVkxxeXBxMW1xOStEUDkxRGNpemxkOW9UNjZwRWg3QVY1NmlZV2k3?=
 =?utf-8?B?MldxMXhuYnZpaWJreDZ2c0svc1EvOVZqWVBDWmZDd01oYkRmNHZzWTV2YlN4?=
 =?utf-8?B?aFJUTnh4ZVNtUE5VRXRHMHhVTkJ1eVBFdVRUZU5ScDl1blJPd01LM1YxMjRy?=
 =?utf-8?B?b0xnbzZ5bVBEWllhcHYzVDdQQTRvanYySlEwY2tQRndhbzNYaE8yOGhiM25x?=
 =?utf-8?B?UWlmMjBsYzgxQ3MwQ3lHQmRMSDZPY3BtQjFMeTVaWjRVNldvWmpzcGtsWjQz?=
 =?utf-8?B?R3pqck1mN09ISFZFNVQyM2NIRjJ0cnhjMzNjekFaUXlMV1NMVnQvTDVGb2l1?=
 =?utf-8?B?dmpnMWJ5SEQ1ZEVzTStxY250U1FGZHczSEF3cHJLbHJiSWFqNmYrVUcwYndO?=
 =?utf-8?B?Y3EzcXRFRWpHVEgyOWZWcGk4eUVpZVFQY2I3blo0UVFoVVZCT1A5ZkpSL2g0?=
 =?utf-8?B?UmQxL2NMM3RVZTJaSnBoY2VKR2ZDaHFoK2tETjByZWlnb3Rlc3o1RW5ET3VI?=
 =?utf-8?B?RmFRaDRBZ0U5QXhEWGFJaDRNZGR0ejJCWkVuZ0RrQUJOMmdKcm9qcHdvYS9p?=
 =?utf-8?B?RStJenpESklDV091ZlU0U2pXL04vTmlKc0hYaWI3VWYvVCtac1YxdlUrYkFE?=
 =?utf-8?B?czFyWjdZZXp4RGJ4cldQcEg5WUxXN1F2eWRFdXhOTGx1U3VpL1kxWFNVYzdh?=
 =?utf-8?B?dE95STcvOGhTbFVGMlVvQnNQMm4wM0hBbFI0ejU3TlhrcEVvakQ3R1h1emNw?=
 =?utf-8?B?WmpuUXZQUktuRnlEWW11RFRQcjJDY09FOGwyUTJ2ejRxQVV1b2FLb2o4d2Fa?=
 =?utf-8?B?UWwxU1dSbndrMW1lZkpQb1pMUEhEWG90TWhKSUV3dFB1K29ocVBtVXp4WExV?=
 =?utf-8?B?WXBDYUJIc25EMlQvQi95bjYzRVlYNEdhMmhHck9UcG9zckF6cHRRbHpJek9D?=
 =?utf-8?B?TXRtNmNDbGhKMm5xbGVzUE1xbEVsS2JmMUkzWGZiandHbGVLNnB1NW82L3Er?=
 =?utf-8?B?QXgyY2prZ3dkSTdrNFpCVGRjaHBVdUJBbW9RSDhIcVNpTE9zelBmZWFUUDk4?=
 =?utf-8?B?cGpsck82MEpZRitxYnpvRnNMQVZFTGs4Q3JiWk9NVFAwSTZvbE9mUmM5L2R0?=
 =?utf-8?B?VXlBUk1XOVpPbUZYL0EwRkhaQlp0U2lRWStKRWlvbjdBZGU5VHVySEllY0pa?=
 =?utf-8?B?Y3E1UnAwOTA4cXB5VGVHbjk2RE4wRUYxYW1uT09jMlZrYUdVd2cxZUFBY0My?=
 =?utf-8?B?T0NKcXFsUHlkT2oySjFQc1AzUm1Tak5jYzFtSUFxUmVzc0s2VUY2UExiY1ZH?=
 =?utf-8?B?UmRhR2NLMXBDc3VXYnJHYzhRRDVKTVNNVlBqcFJnUDI2aHJkbW5DYTFIUHdS?=
 =?utf-8?B?T0p3eGZHTnF2SUdCdmJ1cVlNcUM5YkxxT0lFU3VoaEJVQ1hGMXBsNDgrbDdY?=
 =?utf-8?B?c3d2d1JtVkg3M0FmcHJsTHYxd0Y0a2M3LytFWHhQWG9hYS9jMmVXU2Y1K0Zt?=
 =?utf-8?B?U2g1MXp1MkdtVlZucGpkUVpFUzFqc0QwVkUyK3FuY3BOR2NzcjBwRGtPQ1VF?=
 =?utf-8?B?SmlHS0tNVFgybGhCT0VHSXJPS3ZqNXFUZG4wbWhzRHNLVjZTSDFLczhXQU9j?=
 =?utf-8?B?NFE5WWc5MmY0M2JJOXY3ZEhneHJ6UllMeEtpSkt5THQzNFVnTHpIbzU2WWIv?=
 =?utf-8?Q?KCOySxNlSoF1S5x1+7pZ5jxYf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3af985e-3666-4e6a-7d40-08daadc280d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:00:12.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvnfcz1BlM63PEW+gV/QEy2BhgddvQbT8hbGiMEBn+xiufYnhGbJaxryZFJdzbnS3+02puOhfqeIfrvp8JnsVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058

On 14.10.2022 10:17, Roger Pau Monné wrote:
> On Thu, Oct 13, 2022 at 04:20:45PM +0200, Jan Beulich wrote:
>> On 13.10.2022 15:50, Roger Pau Monné wrote:
>>> On Wed, Oct 12, 2022 at 10:30:45AM +0200, Jan Beulich wrote:
>>>> On 11.10.2022 18:02, Roger Pau Monne wrote:
>>>>> @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
>>>>>  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
>>>>>  when hardware hints recommend using it as a blanket setting.
>>>>>  
>>>>> -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
>>>>> -option can be used to force or prevent Xen using the feature itself.
>>>>
>>>> Why would we want to take away this level of control? Shouldn't we turn this
>>>> on while in Xen if so requested? Which would then either mean enabling it on
>>>> VMEXIT if a guest has it off, or running with it turned on using the OR of
>>>> guest and host settings.
>>>
>>> Right, but then we need to context switch the value on vm{entry,exit}
>>> which is problematic.  I could move the context switch code code out
>>> of the GIF=0 region, and assume that NMIs executing with the guest
>>> selection of SSBD are OK.
>>>
>>> Alternatively setting ssbd= on the command line could be taken as a
>>> value to enforce for the whole system and prevent guest attempts to
>>> change it, not exposing VIRT_SSBD, AMD_SSBD or SSBD (haven't
>>> looked at whether not exposing the SSBD CPUID related to
>>> SPEC_CTRL.SSBD will have impact on other features).
>>
>> That would be my preference (albeit I'm uncertain about the "not exposing"
>> part, as we don't want to misguide guests into thinking they're unsafe or
>> can't guarantee safety when requested by user mode code), but ...
> 
> For ssbd=1 we could expose the SSBD controls, as the guest trying to
> turn it off would have no effect and it would still be protected.
> 
> OTOH if the user sets ssbd=0 on the command line then exposing the
> SSBD controls to the guest would be misleading, as the guest setting
> SSBD will have no effect and thus it won't be protected when it thinks
> it is.

Irrespective of your subsequent reply: Unlike "cpuid=no-ssbd",
"spec-ctrl=no-ssbd" ought to affect only Xen itself:

"On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
 option can be used to force or prevent Xen using the feature itself."

Jan

