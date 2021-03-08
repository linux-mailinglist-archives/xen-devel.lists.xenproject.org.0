Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD3331132
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94995.179149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHAP-0004Uu-KT; Mon, 08 Mar 2021 14:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94995.179149; Mon, 08 Mar 2021 14:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHAP-0004UV-H9; Mon, 08 Mar 2021 14:47:29 +0000
Received: by outflank-mailman (input) for mailman id 94995;
 Mon, 08 Mar 2021 14:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBqT=IG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJHAN-0004UP-U8
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:47:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc80b3ba-005e-4879-a1b6-48ff5cedcf6a;
 Mon, 08 Mar 2021 14:47:26 +0000 (UTC)
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
X-Inumbo-ID: dc80b3ba-005e-4879-a1b6-48ff5cedcf6a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615214846;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e4GaBLhRKn0ImMER2Gu5f4y+Opc7r9KicYRYk/z1cfk=;
  b=KtqmuzwVjiE1qObhEtMiByBvq5W7RoAJlPtAHbeTTTKlQIqHLo2IX3uY
   KXdpXF+ICCjDD6B0V/YGwnLW/VTtSL4QoYPLJd8sXMtOjoQJqaQyguDfH
   /YhVnJz8+T5jjbFPFTJAFl3nrBBBhcecvI/2+EGwFjerY+lwpZOgtGxUG
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EXBsyg/ePDMnJH5t3evzpqmz54fMtiTQpAj+ifj2RBJ0KjkOGqK2CYpK1he6KnQtEan+TGE9QF
 vO1PAybi6pvD5xgnV5XQL49AudPuSx80gWRkX9ESK+6XFScPaYjpfa3icoki1teHPPuW74COps
 T7guhze9ZhVZEwnuVPBr3j37VZFwE4HSAS5DeeXpDYxH5RBXboklnCsQdHSpABi97vjnOALL0u
 G3+9HzIsGQIe1uT0PFtfLnRFobXNYuhSGoXj9a4AQ7T9FUQqzfue9V1lKRTxurGIaQVCeHOY54
 YLo=
X-SBRS: 5.2
X-MesageID: 39142679
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="39142679"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3LTbmjZL2gpK5K6NmRPLsp+nCez1K94tLIp6a1686hPonmsnr9zLf+Ela04kdfaHf3vRm4kF6a3QKEOba5j+iYU8dR48q0k/S+o0jxw0/ShQR3qbCGUNL6LTEWGoKd6JtHTQQVwrt+IrCWPaBfce+J9p0z26Wj8tN33aEQZOgg/qNGaB7Z4TvYQm61fV08iL2YglfxAlQRw52ShpOQZw+7jPMPqJ+JDDsI6jM0G9Hx4e49BliGEbS/5iS8dww6ZW2ClH76gVHa8yPvRfNHE5G6v3s8t3TEgCIH7CEqzshhKsXJLgCWVW2MyBchUuzMsY3XKxvbpJ+tWiZse1tO8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4GaBLhRKn0ImMER2Gu5f4y+Opc7r9KicYRYk/z1cfk=;
 b=hXaxvWMqoNGwG17XCFlgcwSffHhE8A/xz5JfgFKq70STtYnLjpre/ZvIdVbjgsVXNEZtU3bJVF23WJjJxbNaunH2rSFjnBejXkdIM59LcWH8ZpR/jy/wNINbgMXneDVuD/hyjdyunZhe8J+BLzEm8CczH7hqeoJnblDdU+3MwFMG/4971UwiFvp8wBAx5c7iVv0Khq5MmSA8mrpQSBKqUD/fCs5UR0up/v0WFKTrPgNBwf2LSfvrR+V33UWhO4e4qU0Fkh0yBVLa5w01YWxkhpVD0Qv0MINZTGAugqCE7VKC04CB66ktRFMxZvTcsWfyWUOGu79jJs+xihz2X+PFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4GaBLhRKn0ImMER2Gu5f4y+Opc7r9KicYRYk/z1cfk=;
 b=DktSnJQleUlAYVloihOczzgkz1j7lqkZIOsDuFQuZY1SRRQ7YogTd2h5jeWNtQjjPu4+5Vf1x98P8S6WafdU5f5JSkgwLOykIgwbe+1OEMF4tHSAbnekLhv2tTP1WqRMd99G88Y5RLZ+/5DBuQRnhdygP3VJeszTiZAyRvKQ8Gk=
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Tim Deegan <tim@xen.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
 <96c83adb-9e81-8398-c905-f4f0730ba240@citrix.com>
 <ceed3443-0b83-6baf-2ccc-c59d834263e6@suse.com>
 <8fd91411-ecb7-c0ec-000a-b1937c98f57e@citrix.com>
 <55964b2d-a826-710b-1814-c68eeebcc891@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <439bb00e-b279-d5db-87e7-72ec6ac9a316@citrix.com>
Date: Mon, 8 Mar 2021 14:47:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <55964b2d-a826-710b-1814-c68eeebcc891@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e5728e5-74bd-4b4a-fb9a-08d8e2410da1
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5597:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5597745E9DC869D8E87D8015BA939@SJ0PR03MB5597.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5CQG5raJzhT1j+imng7RpjQgXP7IEgBfylYb/9qGtwt6ognouhK2ZDRQvwzO7dRkrWpQtT9xEYO25HixbW/O8zK3pj3IVAlXzOGuXwpbdcHQobz4RM9Hk4arxvoFblLwQ8jfYdJTxK/OF9bdXt4fZF+Pb02LkK4q/LLS5OzJiekgyA6Yk+iwG6rMSjU3HCNtvqdTJxBHIZ/30di+toY8Sd9dRXaHlE8GBKC6IRdX9saXwF/RSp/+sL0E4Dx9imQ84Wamk1cZMwxHoOCHSP1faBzD9onplVd6UuCFENyJivCTRJXbmBt9VZvUl8pytUy8fMqnwyBO4yBiNXZgOdEqCM3m5xe3bSv0bTM2bGGp0aFBeMN4yYba+bWcQ+ItmuRtIxS8QbBC1VH8TuoxiwA7NRxNyMSPeNrWFGsKZmfHu2K1mbPXf+7amYzau0aTECbdQeFdo8vkaLE7ccYpbZndLBV2LPN3KnkBTvh22TUuS5r2Bmr5tGFWYHyUJpYoDZeRHxw1otFy8l7kzjhEcILFtLNcQ10Hu/YS1BpOyVrPR3Elog/8T+yoVdnmLcZuEui9jNo2ZTq+Yc19MY55C+FbHG7UhEJ0JhPuM9dNaxDQ8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(36756003)(54906003)(83380400001)(66946007)(2906002)(5660300002)(6666004)(478600001)(26005)(8936002)(8676002)(53546011)(2616005)(4326008)(86362001)(16526019)(31686004)(186003)(6486002)(6916009)(956004)(316002)(66476007)(31696002)(16576012)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2lJcWdPSDB2Z1ZkSk02dThjaEMrZ1E4Q1VYN2NCSFZJNUJITzRSdmpLa29K?=
 =?utf-8?B?bjZ4M0hnRGE1bEVLLzA2OHpIUlc3QWxpUkd2VkxhRUU0eDk3Rng0VUk5d2Fz?=
 =?utf-8?B?QURERGl1Kzh5SzEvc1lKeWo0UGlGRVVsQ3pxZ2R0Z0xtRVg3S2g1S1g0K2Nr?=
 =?utf-8?B?QkFOK09KMnptWHp4TUo5NmlEUE9OUHJETmpzTWJUclNXV1FHN3BYR3poZ3BY?=
 =?utf-8?B?MnFYNE1xTFpEaVY3dURDOThEOXZEcTVXNFhSalRXYnNlOHhtczZHb1BlOFM0?=
 =?utf-8?B?Z0NOVnZSMVcveXVRS0xGQVp5U3VNN0MvRnAveHdLSlgrZTYrWDd2Y0NBcG9Z?=
 =?utf-8?B?Mi94bi9MUGtIVGQrM2lHdjFhamhoOXFSNkN0bUQvSm9NU09BNVpkdHRWaElq?=
 =?utf-8?B?alhacjJJYy9henJXUFJaRzNHWmIxS1U2QTdpSlFlbjhtWlR3K2JmZExQRGl4?=
 =?utf-8?B?MUlNRFk3dXdKNkNtV05Gd1lSbTBocGxUTGhBeW0zdkNTbkkzWWJ2OTZNMVpm?=
 =?utf-8?B?cWhPenlZOXlwZFF5dnFpY2h2VEZ6Y3FGTjBlS2wwSjNTZktocGZtUXVFRFox?=
 =?utf-8?B?UkVaalJzNitLN0xXS2tlZWpLM3NKUVNkSG5lbVhjOTJwb1cwZDJKTEp4ZTY3?=
 =?utf-8?B?MGlnaGJZQU5ZcGc3TDZqWEhkUUxMMjNTbjFZTTJINGV0TFJ1R2JLanYzYmRM?=
 =?utf-8?B?Q2ZXZ1JPTWR1T0lMZjA1eG1iNFZMR29PbXIycjRQa0ZJQ2drWVN4Ni9WdEF1?=
 =?utf-8?B?ejRTdTVFYTZXNTFqU3F3QWFDRlJCN0dnakdTYzZvUnQ4SnY4bmwwaFJiVEY1?=
 =?utf-8?B?ZU91RlAyNG1kSWNxNjlyMWV5ZEwzZWU2cmNHOCtUTkcwbDlxWlN3OFZvVXVO?=
 =?utf-8?B?SElvdElKMkE2QmZDWkQ3Sk5VaXhybDhEWFRBek9jTmtuZXh0TDUyMnFRMUI4?=
 =?utf-8?B?VW5qTzErY3puaWFrN2docno0QjVyQkhLSEVocGV2b3IzWGo1LzVOaXFzK2o0?=
 =?utf-8?B?RXFBVmZweXVjUkd4Rnp5SFBkMUhlMStpTHk3bndpTWQwT1VPT2ptZC8wVGR2?=
 =?utf-8?B?WUhHNzhUTG4wRlZsenBNcDdDazg1Y21OMzd2N0Ewd1hoZ3FOVzNVd1lYbGFK?=
 =?utf-8?B?TnpMdTJWQUlnTlhLR1l0SzBzQ293ellVQjNRT05Xc0dGd2pzMVZFZHVaWFVu?=
 =?utf-8?B?V213ckh6c2JiWjhkZ3dQZ1NmQ2JxdjhqSFpkTEZ3aVEwSWNQOG16TXhBbXd3?=
 =?utf-8?B?YnFzdWVXeWswRGFPeld4R21COC9teUxNNUZIS3VOU252dEtmMlVFUXpqeVFB?=
 =?utf-8?B?NXN3dWVkTTQ2dTB3SnlEK0NSMm9WeDhYa013cnNHL1lOTFYrTmM5YWtjd2JD?=
 =?utf-8?B?VWlQQVE0V0pnUlE0dTF4Q0hDK2xLZnN0WE43eU96cHNWWlNmRTR4RkdhcHZB?=
 =?utf-8?B?dS9rWWxYRjJkYnk0RDgxTlpaWWtRWjNzREdJcHFsQnQ0QjFWRVFIdEZmK2ZJ?=
 =?utf-8?B?WXBnQXVzSE1pS2djeXB1NzU4d1o5aVB5NEVybWFhekR2NlR4WFd4QTN6K1ZV?=
 =?utf-8?B?TmlXN2ZBblAzSVR1Z05ialg1eE54dWUzZEoyTkNzTWlaVzJjSmhhOGxEei9Q?=
 =?utf-8?B?dzg1MW5QakhteEh0UERic0xyeXhOSXNma0M3T2c3ek9HYVJkSXMxQWh4Z20w?=
 =?utf-8?B?cE9hWkNWK3pBMmhzT3hPRSsySVRkR09Jb3QybWd0WVhJckFRWjhUazNFeG13?=
 =?utf-8?Q?fihUMs4b15AbRaTUQuKN/u4OGmavwVCuD1mvJKb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5728e5-74bd-4b4a-fb9a-08d8e2410da1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:47:10.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAtM57ye3bZGtibcaYTe/jqagb9C0O0gqJH5pEtsp6hJPmQNgGLBt7mFDWCZxwL0agDRwUB+omCZAAchy6TvRleZRwjaaGbkL3P0n03/ems=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5597
X-OriginatorOrg: citrix.com

On 08/03/2021 14:29, Jan Beulich wrote:
> On 08.03.2021 14:59, Andrew Cooper wrote:
>> On 08/03/2021 13:51, Jan Beulich wrote:
>>> On 08.03.2021 14:47, Andrew Cooper wrote:
>>>> On 08/03/2021 09:25, Tim Deegan wrote:
>>>>> At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
>>>>>> We can't make correctness of our own behavior dependent upon a
>>>>>> hypervisor underneath us correctly telling us the true physical addr=
ess
>>>>>> with hardware uses. Without knowing this, we can't be certain reserv=
ed
>>>>>> bit faults can actually be observed. Therefore, besides evaluating t=
he
>>>>>> number of address bits when deciding whether to use the optimization=
,
>>>>>> also check whether we're running virtualized ourselves.
>>>>>>
>>>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> Acked-by: Tim Deegan <tim@xen.org>
>>>>>
>>>>> I would consider this to be a bug in the underlying hypervisor, but I
>>>>> agree than in practice it won't be safe to rely on it being correct.
>>>> I'd argue against this being a hypervisor bug.=C2=A0 If anything, it i=
s a
>>>> weakness in how x86 virtualisation works.
>>>>
>>>> For booting on a single host, then yes - vMAXPHYSADDR really ought to =
be
>>>> the same as MAXPHYSADDR, and is what happens in the common case.
>>>>
>>>> For booting in a heterogeneous pool, the only safe value is the min of
>>>> MAXPHYSADDR across the resource pool.=C2=A0 Anything higher, and the V=
M will
>>>> malfunction (get #PF[rsvd] for apparently-legal PTEs) on the smallest
>>>> pool member(s).
>>> Except that min isn't safe either - the guest may then expect reserved
>>> bit faults where none surface.
>> Such a guest is buggy, and in clear violation of the rules set out in
>> the architecture.=C2=A0 All reserved behaviour is subject to change in t=
he
>> future.
>>
>> Any software (Xen included) deliberately choosing to depend on the
>> specifics of reserved behaviour, get to keep all resulting pieces.
> While I could understand what you're saying when considering our
> prior unconditional relying on getting reserved bit faults, are you
> suggesting the recently adjusted behavior is still "in clear
> violation of the rules set out in the architecture"? And hence are
> you suggesting we should have outright dropped that optimization?

Strictly speaking, we shouldn't use reserved bits at all.=C2=A0 That is the
most compatible option available.

Given that we have chosen to use reserved bits, it is our responsibility
for ensuring that they are safe to use.=C2=A0 That is why we elect not to u=
se
them when virtualised (for this bug), or on native when we think they
won't work (the previous change for IceLake).

From that point of view, I think we're fine.=C2=A0 We're (knowingly)
operating outside of the rules, and now taking appropriate precautions
to cover the corner cases we are aware of.

The behaviour of already-shipped CPUs, while not architecturally
guarenteed, is known and can reasonably be depended upon.

~Andrew


