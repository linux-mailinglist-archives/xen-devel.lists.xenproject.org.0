Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9113A9E17
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143323.264237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWsI-00046f-Ep; Wed, 16 Jun 2021 14:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143323.264237; Wed, 16 Jun 2021 14:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWsI-00043c-Bc; Wed, 16 Jun 2021 14:50:38 +0000
Received: by outflank-mailman (input) for mailman id 143323;
 Wed, 16 Jun 2021 14:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltWsH-00041z-CU
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:50:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03c52529-3755-4480-a5a8-5acfe8d5dca8;
 Wed, 16 Jun 2021 14:50:36 +0000 (UTC)
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
X-Inumbo-ID: 03c52529-3755-4480-a5a8-5acfe8d5dca8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623855036;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=j4HSTzgP+pmeWq0lADAI1AhbzdnY6QzVvcnb0xjihH0=;
  b=c2gVyNlmnF1D3jCov5KH9b4gScXQgR+565u2rkMCehVaY6+6sVXlZKlc
   8/QoDwmCZHxiUAjjiz7ZR2+d0ZFGYLYZCXFx1cwkoK5Q0dx6HkkoRLW//
   BVAbCgOV0YpyMz5jQVLq7OH5RVXCepVDVZKyKyHlSyUvErlwTXdyEvzws
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5HEtx2E7DCkbnn//7JtX9Svp8KnRrt+UyvLYtWpizPFggbf/QQPgYkXPnZlQ2ccG+QyFe8dvvS
 gWOxMSJRA8gdZ1t0WmQZMfh4Poh1ZDkxXeycVao/s7e7VB7J8jaiYlWNcp5hSqvBbxuTdTnRCs
 UVklxLOQn1GD55suE79kPHT6GB7pOaGdEMTmFB0Lgthk7MAzPj3nxUVP+XP+W2lyoV59AIZjIL
 ihZovFr3y5KlZwfPC80DT0+6Q1cm+s/SmEV553kYny0gIg9Bn7jLoKmvjWLYNtIcryfn7y5OyJ
 ftU=
X-SBRS: 5.1
X-MesageID: 46640997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:b2PeOaqSBjt2Hh5Hm6kp0Z4aV5ulL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ki90dq7MAjhHP9OkMQs1NKZMDUO11HYSL2KgbGC/9SkIVyGygc/79
 YtT0EdMqyWMbESt6+Tj2eF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6T030Woqqg9jJwPr3PtiEnEESotu9uXvUkZ1S2hkF3nAho0idsrD
 CDmWZnAy050QKqQoj8m2qR5+Cn6kdg15aq8y7lvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesfMfrsplWL2zHzbWAdqqN0mwtQrccDy3hEFYcOYr5YqoISuEtTDZcbBSr/rIQqCv
 NnAs3Q7OtfNQryVQGTgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D5NE++
 PHOKJ1k6wmdL5fUUu8PpZ0fSKTMB2GffvhChPiHb3XLtBzB5uWke+I3Fwc3pDbRHUn9upMpL
 3RFFVFqGU1Z0XiTcWTwZwjyGG+fFmA
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46640997"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR8r90kpL8EA+vtREXwXEz0gqtLGMFtbUYAioPgv0pNoJoIzpw++xr/Rw4/539xIHhchUbKpN/23QiJigZbjEQ63j+SBvHZSy5qcUMaXnbDwNuQlcFu/kecX+9Z7xpyMdQGqe7udBSZeJt91BElSSQ86TOl2RpPKkdwwNsN/x6blH5V7irqLPIeKmPPjgdRL3KXr7NO8ecsXc/B7POXKkYdzL7WDVsIsnMMdmkcrGFBospSMSPxABfeTHDu75n8MfC5xsPrlQdkUk/v6yXzkD6i8+CF7nSSl3NZ/me8caHuXCW1K/Csde5dyI2g0y96UO87flmBVlbXM7WzGTXxhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4HSTzgP+pmeWq0lADAI1AhbzdnY6QzVvcnb0xjihH0=;
 b=BQ/Jkeie+7DdexBzl4Is4zcxT/8SW2+QzuR3a5IzGiWM8on8OjhnoiJFBErYgzL5ulhg4+5cEb3S9p67siNL/rWVO4i/VqbqDayBzMk2nySDHdqdkf1rtpSKT+Eu0awIS58hA0w0RUzciJuJ+dA5EIFzr0PielXtmU+Jrbk/+XGFNBbE/qJC03WLX1Kq7ZHhlxkGPV8cgk0uzY3068UAoi7+CuHW+XRDzpiB7hfqqh4cyV5Utvv4jhi3YoMlNhPFE5F8pW8WQ79pfyPgEhuVTFjP9EhqoLOPi0Df+pf0FVlgxGq03LWtf9Jua4zxbvhD5Sned9JexLMeVXYi/KZstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4HSTzgP+pmeWq0lADAI1AhbzdnY6QzVvcnb0xjihH0=;
 b=uLlde0Z0NrXrTLCjhHyBwfShRP3gqYduLi5Gey2ekDjqIzXbVrNOiWInjCs1FcQTCxMCPUNcwCDOaYtKAD6Q4TImrKSAM5iP+jWp1GazJ3pF7UPHGo/oW0JWGyNHn36BAr0HA8NjrCP1i8/hH8nulcES148XeLwDTLKeD4UrMAA=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20210616125129.26563-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
Date: Wed, 16 Jun 2021 15:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26186757-eb45-4650-58c6-08d930d61634
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5437:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5437E300BA342F6B8BAE2051BA0F9@SJ0PR03MB5437.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXW3+ZxaOlUiKxXZSulXca/9KL2QD7VvP28tjXO0nK0JK7RhIAD0ncxO//pcAl73WwsNh503reztKrgQE+i4Lo5XNkDj8Q8xfh1TQNYdaXQrAUni9bw+28lEG/dk4EkH8HRrG+SBkK6mOgVPP9x7jSCCZ3+V+igBYjAWltlLHhwjo03dKXJpBHVeng4mulmA+Pu+RbYi/mAw9tm0HBKzwoDhsuTmMSx7pRuam644h5maPiRxgrdXDuNMm9/iS4VfwzEawliGAiYNfKwu+axZcOAXDOQOiu2kxNUKN5HgRiw+0UpfFYvJghNYxZKnlCTG+mtS8aM17trmzHDo5FLy5VjCE4C99IbXyq6nbGTNY56+sYSxsd1peJVFUuD58LFmgiBnkR1RADIg6z1m+AdRku61xuv4JgOCzqrZT7BJeHL60G5fa/agZZAeJg+/FEMA6m1VXH3g6bZ3LPrDylJDH+1ewwxz+riq7wWoJPZlL0tlp2tPdrn0k4H4mN+xhAZ61taAYjTI68KVvo5ay78+oxl9Y5pk5/xuhw+tIX2mzEeW7tedMErH2GYRPGNEXSAYSOemF5RFbCwzgdtu4xphutD/rsHsB4gg8CSrIcGfv6gce8yrMopofao6bwwq1QCCBl8ULRIU5Uy2mKy2Z0pgEPaqVFV3shHdPONlIar5/O5ksZtxkJUhSFy2C4aeBVKoSRggHTYrXQo4WTuxRYlJk+snBQ+KAHGdxD52V4ipr2Ro9FFk7G1Qh9phUYfNikwC/MsNsXRQV+4nI5N7nyQJSOcE7hNHfyl+02QEdib7f/y3y6ft8oU/h9IV/OdX0nxAkDmrgVoDkpxxlXD8jWKPWYNjlpT1yZV1vx+DI69mya8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(186003)(16526019)(4744005)(26005)(6486002)(5660300002)(66476007)(66556008)(66946007)(6666004)(31686004)(83380400001)(86362001)(2906002)(2616005)(956004)(53546011)(31696002)(316002)(16576012)(38100700002)(8936002)(478600001)(8676002)(966005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0hsaWJXeEtleElkRWNhTkd1L3VhM2doQWVENVRWR25YN3MyVkE4ZHg4SWpR?=
 =?utf-8?B?UmQxaEs2endqYTNvcXBMandqREhTTWE1YS9rYXNMb0pWRWRrcGFmSmtZTTFV?=
 =?utf-8?B?RDEzNHdCZkVvSURRQ0NvZFdnaW9XTm0xRGx0aCtNL3NBejIrT0hFOUk4Z28x?=
 =?utf-8?B?TzhhMDdQMitZRzdzSnlVQ2JvSkx4ajJzVmVDQVFpZmpKaVd3dUNja2xCZjFE?=
 =?utf-8?B?YVY5bUtMa3IycGJ6VHZVY2htL2VqZzR3b1Zhb0diNGpaUnRsdWIxSkxPRHps?=
 =?utf-8?B?NTlSSDJMWGp0cjBEbmlEWXRBQXc1VE5saW03ZCtkZW0vZWZnSk1icUZ3MDEv?=
 =?utf-8?B?YUd0LzBTSUZhUkdWNC9PMXBVZzRJWGxMdmcxOFhNcDdzWFVLLzY0ckZCR0J0?=
 =?utf-8?B?d3U2VFdrREhXeW5KaWxZYUt6YjRyT3VLSk54NUhsM2dXMGJ0ZDZKRm54dHl6?=
 =?utf-8?B?Z1JXblRYcHRnejJXZDNnczE5bnNpVCtPdHJyMk5hL0VrWVVRL2REemFuOERN?=
 =?utf-8?B?WG5RTGwvRHQ5Zmh3SDQ1c3ZPUDEzM25jZEdmLzBydTFINjZRNTFlbnRZZUU5?=
 =?utf-8?B?cERlM0JQZENHNXZTZTd0OUNMcEJwTE5mZjdqbkdpRDZ4SUtGdzl6QUF0MC9Q?=
 =?utf-8?B?Y1dwd2pjZUd6WU9leE9YdEpXRnZaTjhmSVQ2Y2NzMGlrSCt3MjFwTStBM0Fn?=
 =?utf-8?B?MEZjTUlQQXhtcEc0akQvNG5ZcXFsZ3RDYmhZeEJzWDV6czNXQitWTXdzVlgv?=
 =?utf-8?B?WGlnSDQ1cmN4Zmx0YjNia1NNdmo1Y1lKb1BtcG1zTmI0d210SDJUcUpLc2VS?=
 =?utf-8?B?cnNwNlAyTHJycWE0UW9ydlVJeUczS24wbVlpYjhDeUl2U0F0emdHL2J1Vit0?=
 =?utf-8?B?UDQvdnpYMzc4eHRBMFNsN3RsOWFXcmdVMnVhblAyMFpwS2V3bzNhL2V1cUhi?=
 =?utf-8?B?eGFQTVcxZGRSM280M0cyNXlVTENpaW1Yb1o5Z0xvNlZmQlZ6NWF6cldmUlRu?=
 =?utf-8?B?LzVoR0NZdzBiWkdBeXRLck1IaUZrczVQSU0xcnc4aDhrQW9xcC9ERWhtM08x?=
 =?utf-8?B?SGppWm5sc1VoNzc5RmxLTTgyNkI1L0JoeSt1Z0R4SFhqbXVrY25lSDQ4TUkv?=
 =?utf-8?B?Qk9FRDNXczJQYk5NQ0pZS1ZmMDN3ZHY5SmgxR0dxZDhKV04wM1QySXdyN2ov?=
 =?utf-8?B?NXlvUnlZcDFmejhxM1lHdE5WTXFVMzQzUW9mMFRJRWR0SEdpTWd6Rlp6bUIv?=
 =?utf-8?B?bkZ6ZTRqU1cwSHB4M0FWRlRjbnN0bEwzSjAyWDVzQThuTE81UDd5eDB3NWhk?=
 =?utf-8?B?MDB1QTNsNzluTWNkejdrMUxRekNTdExnOXpQTkF2VEVRaGRadkdubE9tQk5y?=
 =?utf-8?B?cTJlRC91SVF4dldzQVY0STlKbUQ5b0xORUd4OFNCenZEaXZ2b2VTNXNNZzB3?=
 =?utf-8?B?clFHNTR0bWJ4a1RObnRSUGVIWk9mSWN5NjNTdkdhWVgvM25GWnNkODQvTlRM?=
 =?utf-8?B?WU5ySVZ4Vnh4aUxPMy9ydFNJekFET05vT2FaTEk1a3JRWnA0ODRhZC9kM1dx?=
 =?utf-8?B?WkF0ckhqc09PaDdxTFcvSEttaWROdk5SaFRKL2RTUHkrb3Nwdm1qbEJpSzRp?=
 =?utf-8?B?d1pwb1k2SFVkMThGV2VFL21xOVo3NEpaRm04VmowaFpxNGpoTFMzY0Eycis2?=
 =?utf-8?B?VStGL0hVQjVId3d1VHlNbW9RMldJT2FvS1RuQzB3VFg2NHBrSkkyUmsxMmR4?=
 =?utf-8?Q?35i0Mb6+h6uGNn81x4fuTJOjSdgRn/qA0JLiXyr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26186757-eb45-4650-58c6-08d930d61634
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 14:50:30.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obQ9118q8YVwGTJ+pDIPdfdyqfmWsVF2BISI3k3dAMy1Yv+nOLf4YyM8B8QfvFD9KVGHJGvHsrMgAxm8O5VXmfxAOTrOlPKQhiOBsF4HWNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5437
X-OriginatorOrg: citrix.com

T24gMTYvMDYvMjAyMSAxMzo1MCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gVmFyaW91cyB1bnJldmll
d2VkIGNoYW5nZXMsIHJlYmFzZSB0byA0YmNmNjQzM2VlLgoKR2VuZXJhbCBDSSBydW46Cmh0dHBz
Oi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy8zMjIwMzI0
MTkKClNvbWUgc3BlY2lmaWMgZmFpbHVyZXMuCmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVj
dC9wYXRjaGV3L3hlbi8tL2pvYnMvMTM1MTk3NzU2NyAoMzJiaXQKdG9vbHN0YWNrIGJ1aWxkKToK
CmNvbW1vbi5jOiBJbiBmdW5jdGlvbiAnX3NyX2JpdG1hcF9leHBhbmQnOgpjb21tb24uYzoxODc6
OTogZXJyb3I6IHJpZ2h0IHNoaWZ0IGNvdW50ID49IHdpZHRoIG9mIHR5cGUgWy1XZXJyb3JdCsKg
wqDCoMKgwqDCoMKgwqAgbmV3X21heCB8PSBuZXdfbWF4ID4+IDMyOwrCoMKgwqDCoMKgwqDCoMKg
IF4KCgpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGF0Y2hldy94ZW4vLS9qb2JzLzEz
NTE5Nzc3MDggKGFybTY0KQoKbm9taWdyYXRlLmM6MjU6MjA6IGVycm9yOiB1bmtub3duIHR5cGUg
bmFtZSAneGNfc3RyZWFtX3R5cGVfdCcKwqDCoCAyNSB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGNfc3RyZWFtX3R5cGVfdCBzdHJlYW1fdHlwZSwgaW50IHJlY3ZfZmQp
CsKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn4KCgpJIGhhdmVuJ3QgbG9va2VkIHRocm91Z2ggYWxsIHRoZSBmYWlsdXJlcyBp
biB0aGUgZ2VuZXJhbCBydW4sIGJ1dCBiZQphd2FyZSB0aGF0IHRoZXJlIG1pZ2h0IHN0aWxsIGJl
IHNvbWUgY2xhbmcgZmFsbG91dCBpbiBkb20wX2J1aWxkLmMgaW4KWGVuLCBhbmQgUFYzMiBmYWxs
b3V0IGZvciB0aGUgc21va2UgdGVzdHMsIHdoaWNoIHdvbid0IGJlIGZyb20geW91ciBzZXJpZXMu
Cgp+QW5kcmV3Cg==

