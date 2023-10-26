Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A727D8591
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 17:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623869.972133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1xH-0001DI-8x; Thu, 26 Oct 2023 15:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623869.972133; Thu, 26 Oct 2023 15:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1xH-0001AD-5g; Thu, 26 Oct 2023 15:07:27 +0000
Received: by outflank-mailman (input) for mailman id 623869;
 Thu, 26 Oct 2023 15:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qw1xF-00018c-Iz
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 15:07:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe12::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d942b0a-7411-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 17:07:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Thu, 26 Oct
 2023 15:07:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 15:07:20 +0000
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
X-Inumbo-ID: 5d942b0a-7411-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S72JwK/HPCB75Q+0a6ugiISmdMAeFVu71V5wkWtNJWcQNuIkOi4yAjmHuz80wA74xGKrncjB5MgBeX9ZvhKYD50x5baCkVC+/Oux8OTSDIHcgPBUqgi1oEKiYYDe0af8uBUpOZjrxhgqUT7B7cmMVTCm3bmjjvUuQ33sYR+1qxopMKoL6IeTtBQf136ZDObca0lFIua0gAgBa9xhxvV5hNfA7WB9SNW7RjmDeOWlkLohhwC6pWdU42Q/g/aEGjH6VlucQdTs9SNRBFlASkgj3dNzlYv9pYBswD2sSR4dsEk/GcZWctpuPvKPlxgJC+T5HGbh0crsZ7IXN2odXplAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bliWtgXN1cE5IhQ7TxkR2kTzshNlTZTYQ/No5RqF4fg=;
 b=JuSaXYMnHJeQXrKAvv2Bb1oFLQ0kpZVc0S5LD1oOSMlUxl/Fab+RVoiWqSuI3mjgKODKMUMPZWCUYI0ZsAcFcTu1Rc9eXH/uInUfigUpxMZ9fSmm66v9Ws77PjVdAjijxaUgfmW3GWX55Q6cu//Iqc0IwAcItPBYh7EQ0oLWT9AcZWmIKkuGIuAagdAgSixqUtL33m1Eh6VLgWwjg9/ijrTqM2Nh7KyWMRfIluWCDKdVR1N+ieuRiXRzZGXbhUuR/ZJPztOLs+hgqVk9Lzdrc5FLO3w18T6Od/xVJUL1nhVEvfX60li9okl1/f6NI/bYoaprfbkOXC9G4useHRXMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bliWtgXN1cE5IhQ7TxkR2kTzshNlTZTYQ/No5RqF4fg=;
 b=5roi4bNM57L/QIYmD5GCoqNfubP8o1q2lI5qiSPsqtW1tzV/FBiNAh0JqvLpPw4UiQ5wDy+zbBcD1oeyqg9n/q4psRVDK6RgSNSCo/NV9yoM9J3LOn+1DY6k0uXalrn+2ZN+GHxbofMq3udBWVR7PgcGlMWl/oj3orSWSz2j+hnUbgIZaPcJiaptpnTiWtpUUadvVuGUm9qYeq5L5EmtjhZrJcbeZG9soKjxFSkRRsutNTdtUXCtgQ9q1oOaT0RiDa9P9oatVgYdlcyGzHrIgCSeCG0IZzoAm2PwQAdeDey1YUgtHFePukUTuSf4gAB7AhWGreSVlosIKUKuO4Zobg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
Date: Thu, 26 Oct 2023 17:07:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com> <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com> <ZTponIYDYDWRZhzi@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTponIYDYDWRZhzi@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbef4df-c502-4cc4-ee46-08dbd635406d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oSOiDCtO2IngFgMQtR7r683arAAXg9YdBmYdjIXEb8uh0tQAbHHqFfhKTffUcOpgtcKVcZG+Tl9ZTC7KslsULGL6H3Dxd/OfHLxyy4fiWhLFzpzdrmmsY4rpev/ecVYoUNh6Jg2qYtNkHMCLBqz778h099zl1CLmmXEL5Ra7fqSEf3qxs2FpaO1b4+eOJNBQg0vKVcZMfDybFQ8iAAZYsx8fPO1dPKRCQKA0Gx+PUOUlAry8KehAne0nCp33YQ/nHmm+5REZkpa7MjTrl619W8yeKZ+5ohpfaPBWpdMDzOzc8cLXfWvTpT8lbBiGhvOlBRKHN+2mOdGaQWkDuBIKI8xAMUse21f2uy6J8IIHzQtMHyi2h2epUGUsjj7sz9ejSaAxhXZ5PVLaAZy7TRLOcYcoXh+g5pFEdJetHsYxi2c8ozlsDTGZVl/rSjLPjeLLgkvVJfS0HydAuN8w4erN4V1z8Q3tHNZizLpj+hE7h6YMoSdyuNqH0VuZTEMG6cDkFQWzuRI19BLE73Q+GnUkLJqmJYEWdht4snJ9GSu3AMYXjZ1kW+wMyrRfcbR1qw1NDdO27EQDEywODutYtRPpm0kGDqnq/2M6Y5oc4keuwr872C8g9eADZQcs708nJoH/d1KLlLZvHtyoVDiHYLgHcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6486002)(966005)(54906003)(2616005)(6512007)(38100700002)(6506007)(26005)(316002)(6916009)(66556008)(66476007)(53546011)(66946007)(83380400001)(8936002)(8676002)(31686004)(478600001)(4326008)(5660300002)(41300700001)(36756003)(2906002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFrdW5pRC9PNHNlQkhaK3F3ckRaT0tHbmZlbEFNQVpQUDUvOER1b0pUWkI3?=
 =?utf-8?B?cGRlSU9qVE16OVpGUkZRV3NmVDFDRUM1MTlkeUNaNkxDUEVUaFJyODhPOFFo?=
 =?utf-8?B?SlZjSGt2TUJ2ZmdHeXZmRHpPWFREaDBCZVRMWnBuaTRNMUpsdGtPblVkYWx5?=
 =?utf-8?B?RmRPMElXWXQzSW5RSXphbCtNVUZKYndVNEJRUUhtMU1zWUdSWXYvS3hYL1BU?=
 =?utf-8?B?cVdaL0lhQUJ6SlEyd2tvckwxVG9vU2xPUUFIS0xQRTdJdHZBU0h1aXc2ZWk3?=
 =?utf-8?B?YW80a1BDdGMrb3ZTcjN3NHYzZHozd0szWnJCZFRVb1l6aEpBOTQ1RFhlZmo1?=
 =?utf-8?B?eFkzaUdMN1JEMjlhZlZYaUU4YmphN2dVcWdqK2Qwa25mbjZLYlQraXdNbVUx?=
 =?utf-8?B?aWo4SGFRNGpLVFhQR3YvTTlld3lMK3R5Y0N3OUxHeUIrUXBnQlFKTVdEc3NX?=
 =?utf-8?B?WU44Q1FXTEVrR0pacGFlT0IrVi9SVFNPWERjZk5hUzFkb3JpaE5pYXpobytM?=
 =?utf-8?B?a1owUUtvdVR0RWlHOFl4TGhYd1ZZaUhta2pLNTR3SUtoblRrUG1yaUY5R0tX?=
 =?utf-8?B?Wld3dnNOMkgvUy9TdWxMM0pzQkgySlR0VjdYcG1FRmpHLzV1ak5OSE5UR3Br?=
 =?utf-8?B?VFEvQWhIL250WWZadVdBMi9nWmpDb2Z3bzJRZWROV2U3R1BYRGx2aG53aWZs?=
 =?utf-8?B?WjlCblRsYmxDK2pqNWJnZ0VzZE4xR2ZWYSs4YVFlQUczcG9CY25QSDNCaEFv?=
 =?utf-8?B?eVNhMHVpTk9XRE9MK29sYlh4a0xzUHVzQU1IZjhuU1cwT3ROcG9rbHdxMFVJ?=
 =?utf-8?B?bnJsZStJQWQxK0F4LzJJbDJaa2phZDhQclJZcEtzVGE0TTZCU1ZtTkllNi9E?=
 =?utf-8?B?emE5UUh3K1FpWllJTTRDL2dad25Cc0diUDR2aVRnWWVVU0U2OWZTZkhwMUFI?=
 =?utf-8?B?cGt3VXBVdlpjcTFWbWd4d1AzL3FJYW13SG5iMUVqdkZjeUJ4YlNEdkIwUy9k?=
 =?utf-8?B?ajgwMW5pOTRZODIvMG1RWkxoalFXZ3VzYkF3bXZtaGJDVHJ3Yy85RmM2NGhZ?=
 =?utf-8?B?N3kxejJBMjRkQmpYMW1PQ1laL3NkVDZ5UGZ4SDlPQTFFNDdEeWkveUptYkVX?=
 =?utf-8?B?TXl6c25YaTZuSGthNlpvRmJlRDlYRHFNM0xRenBGVWFTMEg3SzlBQjhCYVhk?=
 =?utf-8?B?VzZzU2syY0xacEdCOU9HK1pCVUFQa2szOStJTnZZSmdVWEZHRlM4Y3lJc2g5?=
 =?utf-8?B?VURTTGdOWlNCb1c2b2pkanBaWEsxdmd2bHJDUzkybmZnMndxZTBNaDNITWNZ?=
 =?utf-8?B?aVNtTUJMK0tkMXlTc1QzYzVGTmVodW5CVVpGQmxjcHZWdzZ1NExqUFdtY1JO?=
 =?utf-8?B?U2Z1WWF4RDV2RGV5Q21iM3pQcVMrVWFoNGxsR0dWR2NmVWZZQktnNVdUaEZT?=
 =?utf-8?B?OVpJN1laK0lZSTI5eklSbGxPWS9BbWo2aEhOMmtmSEMrcXN3cXVnT3hYQXFw?=
 =?utf-8?B?b1hpNkxBVFh2MlgyK0xuVHc0bXRJeUNQUWFmaENMd0xuL2hwY0tiOXE3QTh0?=
 =?utf-8?B?NURES1JqMm5jMjZyUUI3TUMvNmd1TnJ1aHZKS01rQlM0djM0M3g5d3JLZVlJ?=
 =?utf-8?B?Q1pzN2xUTjFNMWJhaE9BM3QzbzFzd0lWb0Z1UmlzZ0ViUjk4WjEweDNjMERy?=
 =?utf-8?B?aFFZZnZIOXdndmIxZ3ZOcEdURmdZTHBjeWJmSnRvU21ndmxwVnovY0VRTlkv?=
 =?utf-8?B?Sm5qSHdIVWd1cDR6SEVHeFYrY05lb1BlT1VtMUlHUUVGTUhUb3ZhY1BlZVZ1?=
 =?utf-8?B?b0NvaUl6SllWdk9keU1hK2pGMTR5ekxDaGZwRCtwR1ZYK3RhOTREd1VJMlpj?=
 =?utf-8?B?clFMSFppVTlNNEplVEkvdXgxMnUyU1dvdEpwVTlrYkIzOEV0YmxEcEwyQXg4?=
 =?utf-8?B?eWQxKzNsTytnT2xIdnFtdlhhRGgwTnM5K3NvM2txV0pkL2ZwcnZkbnRGL091?=
 =?utf-8?B?ZHRRUGZRbDR4RnBJcHdzMVBzaWt0RjM5Yzlad0YvSXM4ajJ5THhMY2lhV2t1?=
 =?utf-8?B?bUNpY0J3ZC9jM3VUOUVXdVYzWkNWQ1J1VXBlZXVOSGxrMHFWQXJkeEVGTTJM?=
 =?utf-8?Q?hM0ejaoTsZKLWoKhppeFNqPTO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbef4df-c502-4cc4-ee46-08dbd635406d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:07:20.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N49M1v1WUBoYfQQ29Qv4zTiQbtbCzoidvGbhdqwvvqL+M+3jypcDdG6XRB3SmxeX4Tz4A9X1bWz8FhbtGYy41Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

On 26.10.2023 15:24, Roger Pau Monné wrote:
> On Thu, Oct 26, 2023 at 11:03:42AM +0200, Jan Beulich wrote:
>> On 26.10.2023 10:34, Roger Pau Monné wrote:
>>> On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
>>>> ... in order to also deny Dom0 access through the alias ports. Without
>>>> this it is only giving the impression of denying access to both PICs.
>>>> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
>>>> operation later on.
>>>>
>>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
>>>> from the probed alias port won't have side effects in case it does not
>>>> alias the respective PIC's one.
>>>
>>> I'm slightly concerned about this probing.
>>>
>>> Also I'm unsure we can fully isolate the hardware domain like this.
>>> Preventing access to the non-aliased ports is IMO helpful for domains
>>> to realize the PIT is not available, but in any case such accesses
>>> shouldn't happen in the first place, as dom0 must be modified to run
>>> in such mode.
>>
>> That's true for PV Dom0, but not necessarily for PVH. Plus by denying
>> access to the aliases we also guard against bugs in Dom0, if some
>> component thinks there's something else at those ports (as they
>> indeed were used for other purposes by various vendors).
> 
> I think it would be safe to add a command line option to disable the
> probing, as we would at least like to avoid it in pvshim mode.  Maybe
> ut would be interesting to make it a Kconfig option so that exclusive
> pvshim Kconfig can avoid all this?
> 
> Otherwise it will just make booting the pvshim slower.

I've taken note to introduce such an option (not sure yet whether just
cmdline or also Kconfig). Still
- Shouldn't we already be bypassing related init logic in shim mode?
- A Kconfig option interfacing with PV_SHIM_EXCLUSIVE will collide with
  my patch inverting that option's sense (and renaming it), so it would
  be nice to have that sorted/accepted first (see
  https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html).

>>>> @@ -492,10 +492,17 @@ int __init dom0_setup_permissions(struct
>>>>  
>>>>      /* Modify I/O port access permissions. */
>>>>  
>>>> -    /* Master Interrupt Controller (PIC). */
>>>> -    rc |= ioports_deny_access(d, 0x20, 0x21);
>>>> -    /* Slave Interrupt Controller (PIC). */
>>>> -    rc |= ioports_deny_access(d, 0xA0, 0xA1);
>>>> +    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
>>>> +          offs <= pic_alias_mask; offs += i )
>>>
>>> I'm a bit lost with this, specifically:
>>>
>>> i = pic_alias_mask & -pic_alias_mask ?: 2
>>>
>>> Which is then used as the increment step in
>>>
>>> offs += i
>>>
>>> I could see the usage of pic_alias_mask & -pic_alias_mask in order to
>>> find the first offset, but afterwards don't you need to increment at
>>> single bit left shifts in order to test all possibly set bits in
>>> pic_alias_mask?
>>
>> No, the smallest sensible increment is the lowest bit set in
>> pic_alias_mask. There's specifically no shifting involved here (just
>> mentioning it because you use the word). E.g. if the aliasing was at
>> bits 2 and 3 (pic_alias_mask=0x0c), we'd need to deny access to 20/21,
>> 24/25, 28/29, and 2C/2D, i.e. at an increment of 4.
> 
> Right, it took me a bit to realize.
> 
> We assume that aliases are based on fused address pins, so for example
> we don't explicitly test for an alias at port 0x34, but expect one if
> there's an alias at port 0x30 and another one at port 0x24.

Well, I wouldn't have called it "fused pins", but "not decoded address
bits". But yes. The same was already assumed in the CMOS/RTC patch.

Jan

