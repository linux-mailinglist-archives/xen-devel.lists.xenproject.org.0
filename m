Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EE3FD902
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 13:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176325.320860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLOkb-0006dY-8R; Wed, 01 Sep 2021 11:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176325.320860; Wed, 01 Sep 2021 11:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLOkb-0006al-4J; Wed, 01 Sep 2021 11:49:53 +0000
Received: by outflank-mailman (input) for mailman id 176325;
 Wed, 01 Sep 2021 11:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqR/=NX=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mLOkY-0006ab-LS
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 11:49:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5789470-0b1a-11ec-adcd-12813bfff9fa;
 Wed, 01 Sep 2021 11:49:49 +0000 (UTC)
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
X-Inumbo-ID: b5789470-0b1a-11ec-adcd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630496989;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=35SwvRjjqZ2KnuTWfd6fU16T0czSr0GGQW4+FbwuguA=;
  b=D/rmxfz8wodF7lzhzF55kz0snDFbLU9ZywLVWwCLEkKo9S7141kVq894
   DjGbkPoHx1V4f90freWZsUCdfBdLU771TZP55Z8RwMEUrIdPDbA11LPB0
   Bk+abGn6Co1sp4EVKLlXwLeYoAfayCwiXFWxgEQKPVd8+iX0njGaZv0F+
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tt9abo8Jh6bH658YlIkLPZtE83hkPRUjbi68J1FQIjXHyvupdzQ97k/6MOLc/WCgito3LGKiIG
 1NsRBVcjwaNxXNbAZDhSfPy6Iw0swWH4mb6C6nXyI49fieD09Jzk/LGfKGhkUBTSLAzmtJO9KK
 gmrBQ0FI6gynknTMTWvPUPXSZq8Lpf87XXQ6/CaE7DjI5+5YrQ2dM2+salV1AxkaICYgTVqix8
 L27fhgILjctj+POvhFWi8BhhsCvfBlxMwRCkw6D+ACesd93Jh9lqRPWy35p363l1uhXpdokpW0
 qyF2EbTliryKgiPVC/pYcaQf
X-SBRS: 5.1
X-MesageID: 53523089
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8i7vcK0NYLSmBIeU/mjBLgqjBTJyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AeV0gj1XYfNu/yKDwHeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1LtQr6ue72q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiiP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dqk/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69M9kWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS1NI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/FWH+ObcGUjbIy32BHTr4qeuomFrdTFCvgglLfUk7zM9HMlXcegd2w
 ysWZ4Y5o2nTactHOhA7ak6MJCK4sGke2OEDIuoGyWRKEgwAQOHl3fG2sRA2AiUQu1/8HITou
 WMbLoKjx98R6rRYff+lKGjtCq9GlmAYQ==
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="53523089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPZbS1jOrRpOst6n+6nM+/o7uOL1PHvVU96Xn1xsOp7V6/xuFQWZLgU1xg1cFjEniKOOedkju+UIUNNJMh5vtdRH56wUU3x2mCkfuor/mgvx3kLvcs9xjlPSpJ/l653pm55ww272tFRlzfaoKmcgIPyxmtO0WUVoILsg9sZ2wHs0ljklugi1JddWC6ogo0ZgRcXDpTlyAiT3Tx3sNhE8ByXoL+pG/l8vMHZPI5OE+fndV4xZqjozjGLUgZV1AUJouvY8DWYBfHhVwUGZjaAfcHmoQMagbGrupJA/dVVC/ngjbxYrz3ABxu62deUnyqPvvQ9av9n0SkCgcBnE64SuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cKjO7PQGRNxGgIvaAymBw9Wc66auu2P0CgYv89Iupg4=;
 b=QBwBcrcwv/kk/NQ+wrBHuDoE7zNr/28C5XmKa/55gMcYTPcAnjUxCNaoG2nG+Pvx5sUBp1k4SRa8YasxjUCrAo78hrkFfdNPDBaoscE0k9/2HPs/K/4k4y9xyG9SbVrbKFZ/4E4mPIL0ftTtq3KsS2HiIdL8bdOVvZ87YFylEfnmiSCFOaSoYIlChOS9w1k7SBq/MVh7+fYGn3Zs/oObaLMCwAJ2r8xu8Oky/AZj6NkmYQqCO7dHcbyPSSsVq0ItOprT4OetvT9jSsVxO2YTD16Hdw3DTl0tAPycMfVyGryigTC6F3QjseMMH/zBL+7I388N4XMjuaRdNfArYyE8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKjO7PQGRNxGgIvaAymBw9Wc66auu2P0CgYv89Iupg4=;
 b=SLHwyq6PSzue0yxO+Chmeh6OVKBD6amNIqCv6VwOZYb6yx9gn0QMMcwvG4LXX8ceHv7W2/S9OEFmccj59h6qm/TejXSxw/P3LQ8F0EMM0+Rx8w40W/OKWDZ7M0t6amlo76EC2IBZu3w4BTrnNeSADnaPuZgDeLocoqxhPXUJVHA=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
 <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
 <2265ca67-2a30-a858-38ba-a6343782929e@suse.com>
 <2ef761cf-e609-e0df-e360-9e904f5ad9a2@citrix.com>
 <a64e4a10-6792-2900-128c-ece7ba6d6919@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
Message-ID: <96563cf3-4c99-520e-99d4-68bf98ef46a2@citrix.com>
Date: Wed, 1 Sep 2021 12:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a64e4a10-6792-2900-128c-ece7ba6d6919@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0339.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fa0e4f4-e39b-442c-f827-08d96d3e9588
X-MS-TrafficTypeDiagnostic: BY5PR03MB5045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5045AD594FF6FA10F8939EFEBACD9@BY5PR03MB5045.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdDZsNlVRE/GOg6HbW5K4gdbEeLHaCClLtf7HYeElVkHygl1MzxpTUU2eMsVOAOorQR+NlJUJrnC6iTG5RHdMaqRUb3Pju/rr1Gaj/Ezte2ORlCnh4LHV7yldAEHA/siwrXu/j3A1/SaItvM5VR/RDvweaa8FCJNwy9brSbp/NeVMs/O7ExCyTi4DOIzCE7M4FbKtJPV7LGkDRPLZqTuvyl41yVHwBfi70zbFioka8bPK88kf7Ow3t/QjryAGHO9/zz30AZbGHnI/4CPev165uQRgaQ3prQDxuAqh8ak3ntWaQtXtIW1GF4mucVKprQOvYFNXgLa18Kkd64Lxh2xTtW4kQbl39i7B1X4PkhqFcxDtJFgPF1olrKDtsahkykES7kfbK3NFk9tpDca7NNhz8DlDWZPxKKfmjNauVUwq1ETLGGwfpceoexhefLGcYn5c2fP+aH1dLpzM3wjJk1OzmBNx76/+L4EDAe/TxuFKrkqT+nLYz0zgw0P39PJ7tMq3PxiI2JPGscg1XHMuZ/Vjaci9L0sfBPOn4z7V0Zmzu5OstCKOlj6li1URdSYpirbQIVxSS+6fFtaJF3OCrC+Vkm90W0l45kbJQMBocaNqSv5r0L6gTfgdHsgibJsq/zDgnD6jMuOStZMMyTDUD+DbmbDLdDWKdQS/0DGwaCHdYU/OKIBU2eWW4jogFe6uEBf/7s0/XqBDVFHeGWwzq+5U0ab6xDQLq1PjPL6OpX3z3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(956004)(38100700002)(54906003)(2616005)(16576012)(6916009)(66476007)(86362001)(31686004)(31696002)(508600001)(6666004)(8936002)(36756003)(8676002)(2906002)(53546011)(55236004)(66946007)(186003)(26005)(316002)(4326008)(66556008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJYSjl3WjFiYmpOUzJodTM2R21TeVVlQWdrOHc3M3Z4d2duOHpQZ0RWMmFY?=
 =?utf-8?B?a1NYbkRVWWVvNkdBMnJVZllNUjIzS0laU0FxWVJBSXdrbVhlRFNnM0ZFQi9a?=
 =?utf-8?B?cit2NmRKTXA5UWc3SHV5NDlPV1pHYmxtejlOWFZpak5YN0tta2FuSmprc1RK?=
 =?utf-8?B?Ty9IY05iTlZtYmJUSjFNRGJCU2RObVVXUnlWZGsrNm1oYnkyVndVZzFtbHgx?=
 =?utf-8?B?Vk1vMTdnd2psb0NEd1pBQVBxRC90RTZtSTB5L2ZWUU9McjVqWEtwSDRJNFBu?=
 =?utf-8?B?SWREV20vN2RMVkNLZWUxemNRTDVaYU9wOHlOd1M4R2JuQjdCam5oL0pRQXlo?=
 =?utf-8?B?OU1CYnZmYmdwOWNmU2h6NXgrUkZTeDBHZE9WQlJSQVRoQTdxdFdSc1BqWFY3?=
 =?utf-8?B?T0FpSnQreDhoQ1hDTlhhUnJndXBJWTEvSkxkRzJlaE5DWVgyUDZJWjlBQUNq?=
 =?utf-8?B?MTFEQjc0RU5tODloRUNXeFlZZ1JZZ0syamtIbDBlNHU0ZWxWOTM5TkpOT2ZX?=
 =?utf-8?B?YkErTjZQQWZzYUV6SkhOMnRwcSs2U1d1R1dhTk8wY2VOd05NbndvSm5ESzQy?=
 =?utf-8?B?VXZqZHBzQ3NndzRXbTQ1bVRsZDJtNXZYS0JuWGNCdERDbytOWUVvVzFZK08v?=
 =?utf-8?B?VTZwaDRteGhBOHY1UFVseE43eDZWbzVKcXJjUUQvSUpNZ0YrSWhaWDR4ZVpT?=
 =?utf-8?B?RkY3RlFCUjlVdjdLUGFFNWVKRDhsR0w1UFJGcTNJZzk4N2FOWGV1Q1ZzL2JC?=
 =?utf-8?B?ckllS25ROGdqTDdsWkZqdzN6TTd1MmNnN0RDc04wWU5KVUpPT01DUFhybitG?=
 =?utf-8?B?TWR6bURET3ZzSlN6cFBLYTJmQWM3bitPZ2FkT2tOTEJnTklLT2U4WWdNNmV0?=
 =?utf-8?B?b3p4a1Z5STNkNlc3YUNuUTVMaE1YWGI4YjhQRDUrazNQeHJDS1g4bDl3dklk?=
 =?utf-8?B?SkJ0bUc0Wktta1Fad2ZRVkRNV1JVN2JYZVl2d0NLbmFQVTNMNUtBZXlWaUs2?=
 =?utf-8?B?Z1VtVG95QlBLMkQ1MVpqUWxCdXdtR2syS0dVdnF0MjdjY2dJTUJCT0l0Q3ZJ?=
 =?utf-8?B?bzZOUnJnTWRqenlpVzdZSXY4OWVQRW9xeFhiUHlqVlBwaFBrUGMwd1owYWU4?=
 =?utf-8?B?MEVnSmxyVCtLcTBVL25pRHcxUTRMdmM1RFA4MHExdGpQSVFURmhpc0xOY3Rh?=
 =?utf-8?B?WmJ0NHNSTlpuZGdnWm1SVGEzbGRiV3Z4SU8vN1VHb1FER21kZ2x5bkV2YnVl?=
 =?utf-8?B?TmtvSm5XOHFZc1d6a1phV2NKTmczWCtrNWRBT0FQd0tQYXdMUXNDWlV0b2Vi?=
 =?utf-8?B?YmRUY3NLRk5MQXdKV2tFWXZBU2JXZWs0bHA2QSswVXNmYkZVL0ZpcFBEbTZl?=
 =?utf-8?B?NUs4VTdsenhRVncxSTNhMkhVa1c4dTdRblhHUEhCUTN1Mk9GTGtST2phOUlP?=
 =?utf-8?B?SlVzbGtBTWwzMW9HdUFJdzIrUmJ5K1Ezd3U0Rjc1aDUxYi91eERBMCs5SGta?=
 =?utf-8?B?YVZ5WDloOEs5SFdIKzNiMnFFSG9sTUFyVE1Ud1RjOVc1WXRZMFkyRmFCd2tt?=
 =?utf-8?B?dUd2YVE0M2ZqUXhhRy9obkdOZ2hSbXZhMFZNRVhKZ3lQaDQ1RUk1Y1I4WGV3?=
 =?utf-8?B?eXI0QU4wUkRLZXMxeXhRWW1YTmZFS0dRM25NMUpWa2FTdjRDNXRTeThwUVpw?=
 =?utf-8?B?dnlwbGx4MHNEczhtNHZrbTJRZnFPcjlBMXlSakE1cHFqTGZwTDJQSWRTcUtt?=
 =?utf-8?Q?fOW478VM6qY5eO1FIm04AOT2dYkgv0+/rAg1fNE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa0e4f4-e39b-442c-f827-08d96d3e9588
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:49:41.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHMNK6NdFOd2YA85XwjNKIBtMBOILlhob2fYU5wmHUxbIsblrzafj2ySPylL/k1FtwPEwaRV1dufV+uUl/y/ApknV9uhfHEch3gi9sUNuIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5045
X-OriginatorOrg: citrix.com

On 31/08/2021 14:36, Jan Beulich wrote:
> On 31.08.2021 15:27, Andrew Cooper wrote:
>> On 31/08/2021 14:19, Jan Beulich wrote:
>>>>>> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>>>>>>          nr_pages =3D PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>>>>>>                            d->arch.e820[i].size);
>>>>>> =20
>>>>>> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m=
(). */
>>>>>> +        if ( pfn < PFN_DOWN(MB(1)) )
>>>>>> +        {
>>>>>> +            if ( pfn + nr_pages <=3D PFN_DOWN(MB(1)) )
>>>>>> +                continue;
>>>>>> +
>>>>>> +            /* This shouldn't happen, but is easy to deal with. */
>>>>> I'm not sure this comment is helpful.
>>>>>
>>>>> Under PVH, there is nothing special about the 1M boundary, and we can
>>>>> reasonably have something else here or crossing the boundary.
>>>> As long as we have this special treatment of the low Mb, the boundary
>>>> is meaningful imo. I'd see the comment go away when the handling in
>>>> general gets streamlined.
>>> I should have added: And as long as Dom0's E820 map gets cloned from
>>> the host's, which will necessarily consider the 1Mb boundary special.
>> Not when you're booting virtualised in the first place.
> You mean when Xen itself runs in PVH (not HVM) mode, and then in turn
> has a PVH Dom0? And if the underlying Xen has not in turn cloned
> the E820 from the host's? That's surely too exotic a case to warrant
> removing this comment. If you insist, I can mention that case as a
> possible exception.

It's a long way from exotic.

Also the magic surrounding the 1M boundary is disappearing on real
hardware with legacy BIOS support being dropped from platforms.


The comment is misleading and should be dropped.=C2=A0 The logic is still
perfectly clear given the outer comment.

~Andrew


