Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556133B705B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 12:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147995.273306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyAYH-0000U7-As; Tue, 29 Jun 2021 10:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147995.273306; Tue, 29 Jun 2021 10:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyAYH-0000RN-7Z; Tue, 29 Jun 2021 10:01:09 +0000
Received: by outflank-mailman (input) for mailman id 147995;
 Tue, 29 Jun 2021 10:01:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSCM=LX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lyAYE-0000RF-Gy
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 10:01:06 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 964a43fb-1653-41ab-90df-338d5b5dfc07;
 Tue, 29 Jun 2021 10:01:03 +0000 (UTC)
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
X-Inumbo-ID: 964a43fb-1653-41ab-90df-338d5b5dfc07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624960862;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yv0DeA/V7uiSQCloXwlL74oiMYp91zxL6wChZDR+JQA=;
  b=L6oQO8RLXaJTaVTQlhbYc5DXDLgBci7LL3qoWbMi6Cea8nGwK2z5Ky4o
   WELFGvyRE60yc/pKCGqCM+9PlK97/eKxneIK2Rit7BEary2JkfsgmJiUd
   30IVgGaiHtNVSsPC0ec5WTni0+gL+ft7wvUODrM88uSfTNT5uM8ekfKou
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rQWncyUDLPsgWgiEJuyLx81l2Jg63mleAi9+Gdgs3yk5homF9Mo2cEWFmP3908Qj5XWKnrhwgy
 PBOb5XEmM0VuwNmykFF8PhRVJ9gRXzCzhchfujbXaLn6xorAOIVPOEf45EHdPJz1US8yWxYseJ
 r6626L+k8NcKAR+cJNbhNDCzBWfXzI+SGkQg3BHlQrTbSIaYl8QiZCCx4YmouBk/X8b/6SZaLx
 V1+6joL0/GIutaDrUjLOH/xiRbgMvfxvuwaDOdRFO0APiwvvPKb0XI8AAPOw5oFOPgEOIxLb5z
 wCc=
X-SBRS: 5.1
X-MesageID: 47234934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+vUBLK7aszhMINkvWAPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXZVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykIsS+Z2njALz9I+rDum8rJ9ISuukuFDzsaD52Ihz0JejpzeXcGIjWua6BJdq
 Z0qvA33AZJLh8sH7WG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxx75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzEC3abFuLIO5kLZvu3+8SPw7bWTHAcEcYa
 lT5fjnlbNrmQjwVQGBgoEHq+bcLEjaHX+9MwI/U4KuomBrdN0Q9TpQ+CUlpAZ2yHsKcegO2w
 31CNUdqFhwdL5hUUtcPpZNfSLlMB2AffrzWFjiaWgPQ5t3RU4l7aSHu4kI2A==
X-IronPort-AV: E=Sophos;i="5.83,308,1616472000"; 
   d="scan'208";a="47234934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTUVqHU3wxTSTz8EqOpBKkc4xDF+UaqG/aH1LkcjAGzQFi7h/OtKiaKauBSHzuepWeAbIAOWlnyAJpVecZCd0G/5rzwPfRRDIZOYukU3wRByIcqtCWnjkqFpAeaDGH1wvza1AIHDe/4Y3JPVdpMSbkfgqmsRgke5UFXSSTUMLaCapGfKVS5iJGVMxQ12ft0qE6S/vxN0mFa9OSljmJ24UC2XBoj9Gb4sJnBEhqPvSPkMyQPuq9C+vdQtlAEfZewh3fXueLbW40pD0xTaWrbYC5QaC/xGPQzMMUf3XAaNp2zbl4rAYEroNtJneHmtPRM9OJMeE/DdnJcMQG9W56RPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLgipyWsdCU1xKHlwrIa2KemOhIzT9rb6VhyMVYIw2A=;
 b=mQIYLLkbrDIvKzrSoWUY+T7qj7bJxMTeCktv+S9XlIwTG8kqHa7f7ghbFXBGjIV9m85ST4Z78xX1ZmYLZkoy0V31GuMpUQ8iZWulhijZsiGNpLdqM+aNnruP2Dg3BDMh7po5acqsh4rihgYfs3cPrO8NHUeCK6fSZIAkTpPJyqKmYaRmIcTkUS225o5VRNOwcF92eHv3gP8rfj9neHB93r8Qvu9kTMu/mQ+S4xYH+cFlHhVGJM5IlmPf0bCOMyJ/SnGetG5SpMtaV473tipoWq6ql6eiy8JTB3nEAZks+KcQfOTt0VU8tDRTuFoHbDTMzzObElr3th5xpgEkJ6Nfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLgipyWsdCU1xKHlwrIa2KemOhIzT9rb6VhyMVYIw2A=;
 b=s2x9OQT9ZUGf6MORQLMiMhq/LavaMKv2KifHWurAa1XkVA0twym80RSUQxwRY2I0FP9L4SqUYzTb2ppzuTc0NKmNV62Di825rUBrmlxMGd7DFH8LzG9HcWY0lAdKMTUEBbj0eSEaE5V/r4z/Oo/XtMzXh+kmzwbW3SRlA2/dL60=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
 <4362c5af-64d4-ef13-dd84-1c885616afc8@citrix.com>
 <56b1144a-f659-2b67-f054-8e141694f9cb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: avoid using _PRE_EFLAGS() in a few cases
Message-ID: <aec1ebff-34ae-2f41-ddb0-07ef147502ec@citrix.com>
Date: Tue, 29 Jun 2021 11:00:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <56b1144a-f659-2b67-f054-8e141694f9cb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29be55ae-6acc-4f24-8884-08d93ae4cb78
X-MS-TrafficTypeDiagnostic: BY5PR03MB5046:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50466DF32260B2BFA8EA62D5BA029@BY5PR03MB5046.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hH0kr5zpd/T9Cz7y+pf5wvJWKIPxleS6B3Jed4tjbJHTKhcGoKFg1zU4WXwb5VdbS96jTJkVRny+ijA7PQ3jl0J9yAdLpIwND9K+nORHTSTCvd/xjD8l9cA+X28trXu9ECqint2URZ3PHOP36nN5vthmif2LQbXX4tZhSnymfpJwysoin6QdOTg15yvpTSg+0ha8E0aOhy/WUi/1lecw8OU+hL96/331lryEbM0LLZ2XdI260EmOL0yYYa3bMuCgb9WdYySNYIRQEKDpYFgJ7cf5K74m4q1+THRIHaWX26wpw/7kKmzvpxPqsljUj2lO6oo2rUTRfC/Mpokc7UHNECIG9zOLrcwLr+ZqotElRV12zoIejAOObZGUqBx5a9l+9vF50sweZhdZePDDTN6QIIY1UJ6X4QgNqo4uJAYV6mD8awnmOf2ey+PlK1rVJY/CKU2mUTatJLsJpzEzpdqYwx5vDzNdZudT/Fko5GJOGrLbfBHugbHBIxulSgjdtQzONS5CgpqrOlk4RvM2c0iJHz6thY+T1hQcvtrayS5+0xqseThuV56+FtxwzLiYIO1MvlNZYc9bO1Ope8IXGDeFJpbwlKtU1LLISLetD7FRY4DwFjVVzT1iJO0/PAcIrYFfnRfL5gMcKb6DqkcLbfpKAFdin5ZKcYQjYYNvUF6x2LUdOWAhiuPaK1RYDiPpjT701PkVTTshm1KJfgHSMAObNAPMZ0w4aO+UiUwsQB8LYsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(36756003)(6666004)(16576012)(956004)(31686004)(38100700002)(86362001)(316002)(31696002)(2616005)(6486002)(6916009)(66946007)(8676002)(5660300002)(83380400001)(53546011)(16526019)(186003)(26005)(4326008)(8936002)(54906003)(66476007)(66556008)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21Pdzk0TU4xbUkyTDQyVlNNanFXMGZuWi9CeE1JY244NVhuS2dPU3FoYStV?=
 =?utf-8?B?cVVsTHN5cjBrYS9yT0N1N0VxdjY4NFc0SVBsN2laR2w3Z3lpWFlkNnRuZndt?=
 =?utf-8?B?cUJ0SjNZajJ0a0N1TGFmcnJxUVUvbnRjMVN4ZGVzTjk3Y1NhUWo1Um8xeGZW?=
 =?utf-8?B?aEZicWNSWkFnNzRUTkxkYi9kWU1yekJTSnY0eUNKRENFU1ltN3hNMjNzck1H?=
 =?utf-8?B?MVpQNjM2QnNXUUNIY3ZEWFNpVVNWa3VJMDR4UldZQlhXVU9aaXhjNlQzUmQ3?=
 =?utf-8?B?aFl3THJGR0xzL1hreEkrTlo2R1krTldsczRUYkhkb1hZYjc3Q2JSQ24wazMx?=
 =?utf-8?B?TGM3ZkJBeDZlOWhjQTdtZGwvYmducFNuaGFZSHhJY3lBWTlVRDdlSFBTMHJL?=
 =?utf-8?B?Z1V1bmV3dmlaajZXQ255MW4vMGxFMkR6WWFpS3pybmdnZ1czK2pSRFE3bisv?=
 =?utf-8?B?MnlidmJUNWVvNDJzN0UvY1VUT3pGaDVNSFhJUEx4N2o4bmw3N1JqRFZVUHM2?=
 =?utf-8?B?VzNaVE9Ha2VQd2p4MWtVQi91SmlZTThqUDQzKzJ0QW91U2JVOGNLKy93YlRo?=
 =?utf-8?B?S1FuV0RrWHJ3RDE0TEZpY0prNTBTcFpGbVJwa3JIaGxZR2U5MWFkalptV1Bp?=
 =?utf-8?B?R0gxYWtYZDdVbmpXL09ZU0xJVGswOUdqL1gvbHdhNzRNV1c4a1FDVnJzSlVt?=
 =?utf-8?B?VkZ0SVBva2RRVGtPa3ZaelVEY1RmOWkzcUozK3dkd0FGQmFmcVkwOHdIT0tw?=
 =?utf-8?B?QzF1WjhNTTduZ3dzMmNWMHMwZUszV2ozK2RHZjVpSlp0bk4xN1NFTUludHho?=
 =?utf-8?B?NDRXM05jZHRYR216NGZFOXhySStHZzRrVUV1Zi9tU212akxhN21yL1F2anNl?=
 =?utf-8?B?US9XUFg3bWRkM3cyTFZtVVlaMFg1bU9SOTVyTnVDU1RsSjZ1WFlCbFJLOGVZ?=
 =?utf-8?B?MjM0bjlhMXc1WDJkdkxkZ3pFR2tVaHJ0d3g0RzFXMElrL1ZxcUljU0M4aVE0?=
 =?utf-8?B?bWJtWlREL0RCTEljS1pVODMyaFhwV1g5ZDZFMmZIckJWSjZjY1pSTThXZVhs?=
 =?utf-8?B?cFRhTFpmWkNPUldOQW41ZHVKdDVPSzY5Q1NNOXAxZm9UR3VKUG9YYm5HSDJo?=
 =?utf-8?B?WndrbUdITHJVaDJxOGd4OEdhdWduQ2hlMTdrUmJHZVJ1RXZPbUJpL1psVjk2?=
 =?utf-8?B?bGczWlhJT0ZQN0lNNGhjbVZ2eUFoR2FFUVg1K2dFOFFLZEI5R3JFaTJ5NmdM?=
 =?utf-8?B?UWFOY28yaTU2T1Y5d1pHZ1VzWDJFWXBYTXJ5ejFFbTB0WW9xTkQwQ2twTytG?=
 =?utf-8?B?M1c0aWpBVTAxaklKK2I1S0NLMFo1NUtrWk9CeWc4WkZvZmtWc2tpYzlBNm1D?=
 =?utf-8?B?U2xXOEFTZkczTDNTMkthWElqNHJ5NTVqYmQzNHNBVkY0RUpYTzE5Y2NUWnFM?=
 =?utf-8?B?bWJad2k5cmN2TEgxMGxZaUFXUnNJdEdna0NMTDV0d0U3ck1NYWVZL1duTVox?=
 =?utf-8?B?RGc0WnlGWnVSbXV6RWwwZGVDQ3BWRFNlVGFJZzBacVBUdG9QZjZCYlNMT2w5?=
 =?utf-8?B?VmFWMm54bjB4WHpvTjVobkdNVGlyTEZvQ1FyVHl1aWNjcmFwMFFXUFhuazlJ?=
 =?utf-8?B?WUlpZjNRNkJIcDg2M254WHpqOTNvREVabVlHT2xua20weFYrdWJpZjB0UGho?=
 =?utf-8?B?ZTlVZEIvVHMzMXZqbVo2ZkhJdk9Udk5HRUtpSmFmUDhwQW9JNjRHT21RUlRI?=
 =?utf-8?Q?wb0tJUvMOgybsao1KjbCIlVebULP6TrXlGTU6Ju?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29be55ae-6acc-4f24-8884-08d93ae4cb78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:00:59.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaquqNSOTHYJg1pXrmvPq5qxABQAYSziqpAtIIQJ2RoDFZvvExwgukq34/3x3uGn+nNOcybrGVNgIvXvjOxUjekrbzjWU6nQeU9qjioyQoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5046
X-OriginatorOrg: citrix.com

On 29/06/2021 10:09, Jan Beulich wrote:
> On 28.06.2021 19:14, Andrew Cooper wrote:
>> On 02/06/2021 15:37, Jan Beulich wrote:
>>> The macro expanding to quite a few insns, replace its use by simply
>>> clearing the status flags when the to be executed insn doesn't depend
>>> on their initial state, in cases where this is easily possible. (There
>>> are more cases where the uses are hidden inside macros, and where some
>>> of the users of the macros want guest flags put in place before running
>>> the insn, i.e. the macros can't be updated as easily.)
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Honestly, this is the first time I've looked into _PRE/_POST_EFLAGS() in
>> detail.=C2=A0 Why is most of this not in C to begin with?
> Ask Keir?
>
>> The only bits which need to be in asm are the popf to establish the
>> stub's flags context, and the pushf to save the resulting state.=C2=A0
>> Everything else is better off done by the compiler especially as it
>> would remove a load of work on temporaries from the stack.
> I'll try to find time to do something along these lines.
>
>> Nevertheless, ...
>>
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -6863,7 +6863,8 @@ x86_emulate(
>>>          }
>>>          opc[2] =3D 0xc3;
>>> =20
>>> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>> +        _regs.eflags &=3D ~EFLAGS_MASK;
>>> +        invoke_stub("",
>>>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>>                      [eflags] "+g" (_regs.eflags),
>>>                      [tmp] "=3D&r" (dummy), "+m" (*mmvalp)
>>> @@ -8111,7 +8112,8 @@ x86_emulate(
>>>          opc[2] =3D 0xc3;
>>> =20
>>>          copy_VEX(opc, vex);
>>> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>> +        _regs.eflags &=3D ~EFLAGS_MASK;
>>> +        invoke_stub("",
>>>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>>>                      [eflags] "+g" (_regs.eflags),
>>>                      "=3Da" (dst.val), [tmp] "=3D&r" (dummy)
>> ... this hunk is k{,or}test, which only modified ZF and CF according to
>> the SDM.
>>
>> The other flags are not listed as modified, which means they're
>> preserved, unless you're planning to have Intel issue a correction to
>> the SDM.
> kortest has
>
> "The OF, SF, AF, and PF flags are set to 0."
>
> in its "Flags Affected" section. ktest has
>
> "AF :=3D OF :=3D PF :=3D SF :=3D 0;"
>
> in its "Operation" section.

Oh - the pseudocode and the text don't match.=C2=A0 How helpful.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


