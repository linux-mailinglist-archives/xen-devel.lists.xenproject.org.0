Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6D4EC1DA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 13:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296264.504271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZWxA-0007q9-SH; Wed, 30 Mar 2022 11:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296264.504271; Wed, 30 Mar 2022 11:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZWxA-0007np-Oh; Wed, 30 Mar 2022 11:57:32 +0000
Received: by outflank-mailman (input) for mailman id 296264;
 Wed, 30 Mar 2022 11:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZWx9-0007nj-DG
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 11:57:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92d5a11c-b020-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 13:57:29 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-OV6MA9NdOg6BtBvRtOOr-g-1; Wed, 30 Mar 2022 13:57:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5100.eurprd04.prod.outlook.com (2603:10a6:10:14::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 11:57:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 11:57:25 +0000
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
X-Inumbo-ID: 92d5a11c-b020-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648641449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLHnHWHCATAUFSMbY4s7RZWHT+hT6h26e+pqBsTUq5s=;
	b=h1dwYjbo2QG8BEcbfqXlD9yCGZnpjMzYG0O8sHncVL4gdv6zw98DAMAvH+i7FE8uhp+6AX
	lQEAyltx5R35eYjCNOtVUPPOfEvCWhOUpQIelyc+0JxcPdZsS44rZZ2tVQCc+CiT7rrqoo
	6nLAeShlBueM4HC738CDG/mia5x8SpQ=
X-MC-Unique: OV6MA9NdOg6BtBvRtOOr-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7sBEX7PIQ6SS1v+qqhjRS/bMwQYlwbCO+Ve8kd7fiATWpoMvrA/jODOu77+sjU2/v0YOiD2G7FH+/da5hCoKo6OdrhkMT+Eb/RajF1gYM5Gc/K8JP+oNefWIqIue3TlbzrC85G3ONUNeLenHK2nlCaa7pXTDzngA2BQIZuCgO6y7QemUwxdumQWkzcVHSilaWx1NuIPybts1zBwc7ev9T6v6MR9RYHSujarBc1nDQOK9lXFhPW9UAJuUHdEjC96KYHdOWH3CtTkHMVy2FfiKIpKp21K32or4Jf7OhvW4+yHwACR57EVYbxLzuCTBUsKHjN8DhJWQ3bjOyEKsTjH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOSFShrkaiYP4CP6OEy4umetxHbuHPZerAGZnJ/sr+o=;
 b=O7Pi5UlqA6VM90E4Oy5ndOHCDZ81YMYQExN9LT8u+Bvn3ulvnOa/5plP4gSs1x46LVx0ick+tXdCzhavmvb3+bVGR2k41dO+58xGHp5bYklaY1O7ksmPUYAOF202C5ON5OOh2LkQLRdQ1vuEBEMwTFBNmp5Qcyev4wr1j4HMjCUVdp3LtYIeDqRfrmpbW9y+onYOEwB/RgiMfTdzbyQDg2ZXozg3r3ojuwx9ADrLOPIRhlKRqtSbz/rV8JnF2xceyd4cf+5zd1byaCEK0d/8N0599FhIR/22F+JNKmG90WMNqsnrI6OKsHmv1fWMa7U0OfYUSDmNoMHKy7x3XCprkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
Date: Wed, 30 Mar 2022 13:57:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dac76ff-eb4b-476d-ea6e-08da124473ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB5100:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB510027B6657BDA53807C1A5AB31F9@DB7PR04MB5100.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JE1uW5XGLqv5kwCMm3Cx2obBlHvpKho7qALlgC60wZQDGCEIgpL8yw7/MUiPMQOW1ilO31wnjC8pR8vyoBcEGIE1IzS9WRbtLKXLv1l4slwnx/l87GXUC7taD1lv7dXG/iSzyk9Myv++z3g5HIISQGOeYwkbzif33O6xgZQYf9pyqx24bY6zOKP7hkmFBrKjSa4VHnObYZK9CzVFJGCIeiKoJlXcRaCF5ApPUwwZqHxjmyiTPCxyGwnb53HVMav7dRihrn/4ERFGRC2qcz2gJ83gVh/+xf1ADNifOqek8zxuzHZ4pb/Cv4QMOpFywfGvggp+3IdbukUBfKL+yCLYdarXUICx+D8Le83o3X6IoVMCzpoElf4m2UT+XAq2CuYgry9ts5v8/JLzsKlyA5iqqjp/8EvxOYYJWkoPif6MpE/eDinZiNNB+K5ecYlLB4PfxURtJCoQvzSP1a/bVitQUhzplwF2GVk7gMZEJ+V0+hHAw1O4IoFC9Vclj7wD/wpwTJT/GEgmhoyM4xeeZVil9/Hc/uDbfp9FUxHVadHzARp63wWmojHcOovCVM0jwXX/t6LxcvhEzo5fNaDHJLiD9RaWHiiyGyPGceREr72V3zlBQXoF92D7zqq0+OstbnBr7BvcUMhwGdD3ioA4FvtYaoRDmxep12xjt7Mvvz9EWKiEFLthWRhyc5KcnRdfFTS07XGap3kFw0qGtBcpnpE/nOCvh3ml5b7JtzxL+eP7sm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6916009)(54906003)(53546011)(6506007)(2906002)(6512007)(86362001)(26005)(186003)(8676002)(5660300002)(38100700002)(7416002)(31686004)(66946007)(66476007)(66556008)(8936002)(508600001)(2616005)(36756003)(316002)(6666004)(6486002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dznYwjYMRAmm7odKKScHR+05FaEi1Sh+d6Xw49Tz3j/RgrT0T4kk5lZZVaJv?=
 =?us-ascii?Q?+rrRT9JqhOfqVSxUjNC85xXIxxnP/Z0UUdseQfuNss2W6xB1dvKDKN50qIKf?=
 =?us-ascii?Q?0Snl4YMlOrdpxhijtdWkfhnGMDng15Xc2R3cOOFXZl900yrWbZa2CDlIguGT?=
 =?us-ascii?Q?BBkNQysej8048jGmZyZenoLwPAnNk67nDNTSiBVihFpdf/svFH0ZEe+rWLFv?=
 =?us-ascii?Q?nycHSlojfUU7nIF58Hwz4Qv9oA1nLHUwECWgsxTCO3U+hLs7lDAe45AgSVJn?=
 =?us-ascii?Q?KfGroyVIiLesBVChzKV93TpHHhHNP3rzNMxMwz+69qzEG0AmDaOknXzohLII?=
 =?us-ascii?Q?dKhcC8NHrpJXVmZFx/LYq8AKc92dr82HJpiR8WQ3EiggVXOopUls6kK43N0w?=
 =?us-ascii?Q?IT5p86Hhxi4xKR6Lsr8J1x85wZeK5xzaMt3JchTDDGMf/knfqnKyAff/p6cP?=
 =?us-ascii?Q?GcgzG+nqDv4zJCrM42noOXLtRW3qNEPe7XLZEiFzZsSckx+sw0MCCz+ELiNU?=
 =?us-ascii?Q?cn/06rclktQsDOh4Sdo0svSJl/yEM+7GRDwD/qqrg4p+62MGVSX2AqlZHhDV?=
 =?us-ascii?Q?14p4jICsHZtbjOTu/Q7es49kR2UGVkDr2dyhMjcqhfyD3L3yc4LnxUOYkYI9?=
 =?us-ascii?Q?CzEbLJ7eMv/tqUhnYBAKwsW1w51RwNYrY1OSn/qDEF1YssP6SKojjH+DanT0?=
 =?us-ascii?Q?0QvSRQ16Pjw2RVW2lFj5WMgdd1u9xpzxEFkyDiG5bLuaR1TkpEzdvfdEr0Pk?=
 =?us-ascii?Q?fOkVf5pFXrEejdUDWBE+CWX9nfI28IkiM07zl530coiz2Powt+4TflqIr+IO?=
 =?us-ascii?Q?DM3Qt4FwnB7ZFW2SPnyjVwclZwSOgRQ1m01LBlUz/4PDvfsQyCyLO0pyrG9u?=
 =?us-ascii?Q?tnYimGp+a8W5HsI2pklK9h3ak06h+BNnZWmlAaApOlVe8TiTLVyILBbDUxP5?=
 =?us-ascii?Q?oC1xA8ukhEfRKVdj5PuAWhBNSJcJjZ45/GOX3i2j5EeSL1Ap8Vcxsj5xAgLv?=
 =?us-ascii?Q?iTCvhBy/g9WN0x3O1p2ldDxZu1CvVHA6xfAVyUGL2Gp+WbKjEAsxbdDhns1G?=
 =?us-ascii?Q?GRGkltgAL8f+JWuILHTj5Kade/Gq2iNq/dRdJPBm8UqQji36yXqDIdViTai+?=
 =?us-ascii?Q?sSf/Q8HnlPVVJxfAFWN+WwltI5GYdxE+l+q/HG9SKWGdQh1aD12gyH6RoB1U?=
 =?us-ascii?Q?hQYVLQwZrn4DXNLGRH0KGxARkCpgCIDYD1fgWSKWwW9TXUV7jjBRS/xQwm9x?=
 =?us-ascii?Q?V8KCX3wVrQ5ycSMOPF/SwSwtIBw1vDGV55hxpeyjkaWFFGdW7c0c+95P6OgX?=
 =?us-ascii?Q?z4HoPpNiUgB9gphNljHubfSlqBnYanH0QG/gNqfhaF0TnLa1Y5pBMr+mC1oD?=
 =?us-ascii?Q?yksWZX4p/JkOWbPEPvigyTP0jCccKMDX0CKc0S2gkLGeCrQIJbW86431nr7x?=
 =?us-ascii?Q?EF9l3nby+Wsoh5rTijHhXmshusOgMMNJWtcwhLM5qVTS3odNvh234HzyKm3K?=
 =?us-ascii?Q?HfwFIf+CxjWT4nkpo79pKpG8+tAsTLvPdsSHOiU52U4YqJwLIF1fJWEzLXuV?=
 =?us-ascii?Q?1/NZn77zDHVjS8nPPz475MG0qw+zxgvNGe45uOKt4KPZ3AegaHF/SYC20db3?=
 =?us-ascii?Q?M72k2slV62Ucsqn52vdtQl8YCd2S19DHvrONHVu4he9DQAmGAoKzhjCbb69l?=
 =?us-ascii?Q?6IMkWepXKOhKU/194DerpzMNPFPSCh+2SsuZldrOlh7nPeY+0VYAzgcmS30r?=
 =?us-ascii?Q?bO1oRnw6Wg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dac76ff-eb4b-476d-ea6e-08da124473ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 11:57:25.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McMrrK2RNsQw4WwrCE6fWo1Jvsdb/PcCqK0TT1GA/ltl6QT5Um7rtyQPn5D14Zhggu70dTemV/aZ1OVh89CHEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5100

On 30.03.2022 13:04, Michal Orzel wrote:
> Hello,
>=20
> On 30.03.2022 12:42, Jan Beulich wrote:
>> On 30.03.2022 12:32, Julien Grall wrote:
>>> On 29/03/2022 12:42, Jan Beulich wrote:
>>>> On 29.03.2022 12:54, Julien Grall wrote:
>>>>> On 29/03/2022 11:12, Michal Orzel wrote:
>>>>>> On 29.03.2022 11:54, Julien Grall wrote:
>>>>>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>>>>>> --- a/xen/include/xen/xen.lds.h
>>>>>>>> +++ b/xen/include/xen/xen.lds.h
>>>>>>>> @@ -5,4 +5,104 @@
>>>>>>>>   =C2=A0=C2=A0 * Common macros to be used in architecture specific=
 linker scripts.
>>>>>>>>   =C2=A0=C2=A0 */
>>>>>>>>   =C2=A0 +/* Macros to declare debug sections. */
>>>>>>>> +#ifdef EFI
>>>>>>>
>>>>>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do supp=
ort EFI on arm64.
>>>>>>>
>>>>>>> As this #ifdef is now in generic code, can you explain how this is =
meant to be used?
>>>>>>>
>>>>>> As we do not define EFI on arm, all the stuff protected by #ifdef EF=
I is x86 specific.
>>>>>
>>>>> I find the name "EFI" too generic to figure out that this code can on=
ly
>>>>> be used by x86.
>>>>>
>>>>> But, from my understanding, this header is meant to contain generic
>>>>> code. It feels a bit odd that we are moving arch specific code.
>>>>>
>>>>> To be honest, I don't quite understand why we need to make the
>>>>> diffferentiation on x86. So I guess the first question is how this is
>>>>> meant to be used on x86?
>>>>
>>>> We produce two linker scripts from the single source file: One (with E=
FI
>>>> undefined) to link the ELF binary, and another (with EFI defined) to l=
ink
>>>> the PE/COFF output. If "EFI" is too imprecise as a name for the identi=
fier,
>>>> I wouldn't mind renaming it (to PE_COFF?), but at the same time I'm no=
t
>>>> convinced this is really necessary.
>>>
>>> Thank for the explanation (and the other ones in this thread). You are=
=20
>>> right the confusion arised from "generating" vs "linking".
>>>
>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI.=20
>>> That said, it would possibly make more difficult to associate the flag=
=20
>>> with "linking an EFI binary".
>>
>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>
>>> I think some documentaion about the define EFI would be help so there=20
>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where t=
o=20
>>> put it. Maybe at the top of the header?
>>
>> That's perhaps the best place, yes.
>>
> In this case how about the following comment at the top of xen.lds.h:
>=20
> "To avoid any confusion about EFI macro used in this header vs EFI suppor=
t,
> the former is used when linking a native EFI (i.e. PE/COFF) binary, where=
as
> the latter means support for generating EFI binary.

No, that's the case on Arm only. As Julien suggested, it is perhaps best
to explain the difference between EFI and CONFIG_EFI, without going into
arch specifics.

Jan

> Currently EFI macro is
> only defined by x86 to link PE/COFF output, however it is not unique to t=
his
> architecture."
>=20
> Cheers,
> Michal
>=20


