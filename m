Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D53F780D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172459.314715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuYr-0005JM-Vo; Wed, 25 Aug 2021 15:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172459.314715; Wed, 25 Aug 2021 15:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuYr-0005Gi-SB; Wed, 25 Aug 2021 15:11:29 +0000
Received: by outflank-mailman (input) for mailman id 172459;
 Wed, 25 Aug 2021 15:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACUI=NQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIuYp-0005Gc-IR
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 15:11:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0c8b687-1500-4972-92e5-d7afd64a9395;
 Wed, 25 Aug 2021 15:11:26 +0000 (UTC)
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
X-Inumbo-ID: b0c8b687-1500-4972-92e5-d7afd64a9395
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629904286;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8f1tvQLtYNsywvhk1xS6BxAe9JNTsyKOHT7bohh6MPg=;
  b=hCb4Ur3I+sYfBobmUiR1e4Vn4VRsCbHAd/6xI8UXKs2nqbm8FToTsBgN
   PCLYMT9l6oQ9edqPQlIm6fl/XD1lkXPYcg9scwt/3CWfT7UchhI9Zyabu
   TIGr41khlkVS7bwpsKdacljLNxJRx204ah1BI1U3WWVVVcrdfp2TERViX
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s9tj0hN60upg/SFacLlOo+4GtbetIw0OjkoBLLrHy63YYWkeskRC+BZwfwNt4P5KNBPP+5RMUL
 gE0mB2+07kgyJcEElymzdCgVYZmQXQobdANajrN3Phav6wohfFf0oaJesR/9/YeNqlyKPfUZFz
 ZrdRFDfV0Q+Pg+gLA1V0lB6NLvK598UJXFwmrouC3WypINEQCc8u6O7dW/15rkYXFRZjrF+3/R
 5sYoEUVFm7TRjd7+qX6U+ZGY0/WgOXSKr24+TEd/zuIN7KyOcZBzcOizCjcii77zyafJESUE/5
 GkKr2T0Krm7QnfysLlHBhl0K
X-SBRS: 5.1
X-MesageID: 50898095
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q9yK96G1PHpzXo6apLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,351,1620705600"; 
   d="scan'208";a="50898095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMq5sP2gsVHRxXQ3XlMYCaE8WtaGkiurE6r/sRWBv3FiAizqU/CUI9WSdoGHr9VLnX503cKaeDdp0wK8MHKuebS7pd+6XSVi1eoBqCwPZpHBMCuhGlsQOptvWWiVaGDBL6G5byfqk5oQ8br9BaNv0K9MFfzhC5+vwbFR5kZjPU59mdydmEi+xE2Vx43Mrv3mW2dKjuvOol85QAsAMRUNvOh7Jfx7t4sgpOpeEm2r4XEQBixAv2iirijk4cuJVOIyfDq1xCDf8CkJMpXqNxTGwep7D/7vZ8PVerxYL/84Jf9BW4ci330nZ+O1O9+ZeanChiojlJVZ0Ta50mW1Nwgrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f1tvQLtYNsywvhk1xS6BxAe9JNTsyKOHT7bohh6MPg=;
 b=L5x/fNmbXoZf/TGhEqlZkqmfQ+8Jt472gc05qEWEGYSzZqjC2/KeQnrO9ruldjq1La0Y18qZessVD3n8fikJxs59vdH24uN6IBVfTAEXjpxaUFHvU+8qIfjiXAFm6wM6sx8bvbW6aWSv19dWyYFbbtxElwjzD8WlQEoM+Id05YXRTnyoZFyx4f5stU5xsA+oKmUt4mgbsg9HuFY37Pc8GS+9VDOVzD530p/5A5sdeBgwTrxiRjyXwxPOwxbY28aLa5PUrqrwDORMnAkAxp6qVQPmjnUBOXxSr5Hw/O1PdOg12jbGpZ2Gc0q84LGrBKNYxwnaHjcVRteBQaX9M3H2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f1tvQLtYNsywvhk1xS6BxAe9JNTsyKOHT7bohh6MPg=;
 b=Afu1rmsoDo2oKyCcroqsGOliBiklnzGYQOub3MMzWfe2uCTEVLood1aBZP08PZA3OTc2n7+bJ8cIF37ujX9HKbJ0F5HKzVj59dsxOW4SHGeXXaMcb5SlTvRBlp8WKEw/xUJUafu6SIJztABu73kRoL+CDpjZnr+QO6zRRinld6I=
Subject: Re: [PATCH] x86/spec-ctrl: Skip RSB overwriting when safe to do so
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210819162641.22772-1-andrew.cooper3@citrix.com>
 <75e80f6e-f7e8-60d6-93fe-1a48e40593b5@suse.com>
 <e2efa715-b523-9c78-79c3-04ad6ee32746@citrix.com>
 <ffb04572-eb40-64b8-2156-beac6324a5fe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <10dabd6c-3cff-a2b1-799b-227bf39be9bd@citrix.com>
Date: Wed, 25 Aug 2021 16:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ffb04572-eb40-64b8-2156-beac6324a5fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c44534-561a-445e-11b5-08d967da999c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4613:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46139366438D0768C0567946BAC69@BYAPR03MB4613.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9T+yw4Y+4imnldMegU2rb4gHz4FnevJCXpR1BmvpaKe96TSUDX/Rw9sFQQONxMBya3N+vMv9kXFh+ZmVn1p77hRS1ZyRuqprA7PbCTJBzGr4q+tCAp4KK/XLFTdvgCzT6zMAmS7uAxzD65Pv101Dp1EoWARcEMcUfsy6ZRA34/y0fCQV4q7RDmpLYbqIaJ/1T1USg91Kz3CU0aDVormf+vIl7cZ7mIqazwxq3kzrtfQ/j+q3coxG3zR42nUWSZZRRp4lwC1gSyd03EaNB3Ve3HeRyGc7cudeqcEToZioxzucpagtz4opC7AgVaHRFjvwrQBwqbOpB/s7SaglOoJwVNwueRxum2BlOnnu/3xN71CKBAYySVQWUkZL3QKEYvhsvctvjkSTE894NoOfdnmuRWgwZ51s9zpFzbfMc0VwOY3TRn+//zD3q/bb4okhDQDSsn3oJCxbtCh/TcLIHdAXXSEy2WLLoVZZDeELPPH7MpI3uDAbGvV3uJ5+SnHsvde9zYb0vRm38/XW0CuVaR2sbFLGqDe6FAe7db5oJzadK2+t5la3jk18y4a4t9N30Pq475mQX/2R0wJeI/k53W5y8fuAMSEfDmuDyTiVzJ+p8IC2qRhrCIdwysLbZB3oL+VIivQDilLJn7h2SxjPBNKmVArZWgMFnUCHrihl+6SALxz9ZjzfCZz5bSi9GX9WnANCY8fE+iUldecE2rPUI34BOvAG8G/4xrWcOYnsS94ab2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(31696002)(4326008)(38100700002)(86362001)(53546011)(54906003)(2906002)(8676002)(26005)(8936002)(31686004)(956004)(2616005)(5660300002)(6666004)(186003)(4744005)(316002)(66556008)(66476007)(66946007)(36756003)(478600001)(6916009)(6486002)(16576012)(55236004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhKMk9mUDkwWjVFa2c0RFllcW8wcS8xOUZqWVpqc0Y3SDVlS2lQV0VvWVpr?=
 =?utf-8?B?REdud0pwY3RWRVI5akQ3VXMxSjVMS1NuU1pqY2xibVZ5dVRVZjI2K3c0ZWlo?=
 =?utf-8?B?dnVmV3Z3WFhnNm9xT3FjaEZzd0dWdTNORWJOc0RaRHJzZWVWVjFNaW1DeFZm?=
 =?utf-8?B?NnJ5YTFuQ09qdTJKOHkwSGdHSzlVczNLN1ozcU5GTmZQdVdKSkZvR1VubjFM?=
 =?utf-8?B?a3dObnVRdXI0aVFnSEEzUE9haGU5K2s2a0wyVDdTUkJFR0xIQXpLNHVRL2dx?=
 =?utf-8?B?RDBvdHpRVHNTTVhLVmhLMFB6czZzMUVXRWNLL3lQWXVSY0VFM0FWbnE0ejh4?=
 =?utf-8?B?cDFNZzUrY2V0T29yT1p6L1FWbjJCK2R4UDJWWG5lWGNZTGswN0RJcWhKUVEw?=
 =?utf-8?B?UUFuZEo0dVdHZjdVUjY0TERUaGNvY1RMTHJhdWx1ZmcwZHZFWXQyUmxjSXlW?=
 =?utf-8?B?Ykh2VXdaSkh2U2UrRXdLZlJMQXd3b0F0WFVtdmdGY0VGcG1oS0ZkYUxsOWF0?=
 =?utf-8?B?WW9IS0hSWFNKZnA1QTZsKzZZQndtYzJaTUszZ21OL0o5V1pKQXBnYmNnNThP?=
 =?utf-8?B?Wk5KMDV4WE40SkcxeXdkNnU1Q0EyM3NiUXNwUHAxbEw2bmluY05Cb2FNTGlR?=
 =?utf-8?B?RTBCakxvZTloRGx1c3hXZDhzVk5sSFBmS0JIak5WYTU2UW5ZVVk4bnNybmMz?=
 =?utf-8?B?QkMvUTRiOTl2MnFucmd4aDZRd1BKYjZ6LzVoOUlBcUNmVDZZdXRkRitYS0dO?=
 =?utf-8?B?Y0NZMG1BZFdQbzlHTi93MGJJZVB3aHZrU2NqdEgzczM4QUdERWFMMVNsZ3JH?=
 =?utf-8?B?SWJQMTBrK3o1YkUvSE9Uazh6UFJ5UDAyVDRsSDJJT05QL3lZTEVmcTEyeE1q?=
 =?utf-8?B?aVNPeHplVG5ZRkdCaW1mdHU1d2JtS2RzWjM4THdhTzFyNzhwc2NJUSsyWlNz?=
 =?utf-8?B?Mnd3YjV0NFAwU0toMlp2VzFyUmpZWDJLamRQeGhVYlA3V09EQUV5SUFxSmRy?=
 =?utf-8?B?TjNqZTlqeWYyRkt4U0JwTFlVUDVMVkdITTNMS3B5OXFsc1loTU85NFN3a1U2?=
 =?utf-8?B?UnZPK1VmZHQ4MFA5RnV3c0tDRlJ0c1JER09NYzY5VmZ6Z0VGSTB0SUdPOVVo?=
 =?utf-8?B?SWU4bU9EVUdadGxGWk1Ka1BuNmNpQ3VIa0ZVVVhWRUZkeldmNHpMSUpzMExt?=
 =?utf-8?B?MnpWNENrQ01RTzRXN29xVjVnekcyTWtyVUxvVzRSeHJtTW1uZit3amhHby9a?=
 =?utf-8?B?Y0RrcmJwR1BTWGdhbGVOMUJRMzJUTFJITHF2VitiQjFWcEhqYmtXaWQ0UHhK?=
 =?utf-8?B?cjdhZUdQVTdmenNiM3dsTFVlR29QRmdEeDZNSTV0T1piVkR0a3NJcjhHU2RQ?=
 =?utf-8?B?WEZyaDJyNmEwalNaU1Rnbktjcm1VRG45YzY2NG15K21jRXFaN256S0t5dndz?=
 =?utf-8?B?VitsTmxGRnpTb256Yjc1cHM4SFhBUjNCQjZZeDJjZVczbFBpN0NRQmE2Vytu?=
 =?utf-8?B?cWxJdUloOVJGS2tNYmFSbDNDa1hra1U4VDc5TmtwenhmaENzOU1WUVFLY2to?=
 =?utf-8?B?ZjR2ak44RU1pZWhYNmRualBpMnpRTVlDQVFPK3FpUnM5cmZ4N2w0MkxnY0hC?=
 =?utf-8?B?WWtiN0dieWs2MGVjMUo1K3FmV1lMZTgzTWsrOE90YVBqYjVGR21LSWFkNXRq?=
 =?utf-8?B?QWVYODJDWHFLMkJkU3ZYd05zWGhPSlZzS0J3R3dHWmkxbmc1YUFMT3Q0Z1Fx?=
 =?utf-8?Q?gD3GiOzXpS/T4tcO0gaPttnR6LSLtd8e3vkxrS5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c44534-561a-445e-11b5-08d967da999c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:11:22.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HVXxN7rZbLFeL6svqEiYikMS7aF3QwTkOzXYPC90qgRPcMCOmaxMqcfH2ep22Jaw9XWLcy1PzXREwFlF3fINOLiq4vkIoSWCnKg1YwEEDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4613
X-OriginatorOrg: citrix.com

On 25/08/2021 15:36, Jan Beulich wrote:
> On 25.08.2021 14:12, Andrew Cooper wrote:
>> On 24/08/2021 14:04, Jan Beulich wrote:
>>> On 19.08.2021 18:26, Andrew Cooper wrote:
>>>> In some configurations, it is safe to not overwrite the RSB on entry to Xen.
>>>> Both Intel and AMD have guidelines in this area, because of the performance
>>>> difference it makes for native kernels.
>>> I don't think I've come across AMD's guidelines - would you happen to
>>> have a pointer?
>> APM Vol2 3.2.9 "Speculation Control MSRs"
>>
>> The information about SMEP is in the final paragraph before describing
>> MSR_SPEC_CTRL.STIBP.
> Ah yes, thanks. Still need to get used to this now being in the PM rather
> than in one or more separate docs. I now recall reading through this.

I'm still pushing Intel to add a section/chapter to the SDM, because
this is is all architectural functionality and interfaces.

~Andrew

