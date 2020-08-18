Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F72486F0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82Ow-0003N0-Bw; Tue, 18 Aug 2020 14:15:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k82Ov-0003Mv-Eh
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:15:45 +0000
X-Inumbo-ID: 20767eb3-edc1-4fc2-884d-1449fc8b4248
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20767eb3-edc1-4fc2-884d-1449fc8b4248;
 Tue, 18 Aug 2020 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS+7qyAP2Y/s0iAkSuxOvlLd6GhNP1YLlPrqUoSlGo4=;
 b=vbEqb0oaEoT2lYYT7N7VU5zhyb9TWrZv4MqT67nQZiGU6mZA+tQVyvcHMla/D/CObVLCioHEskk2vf+1/De3AojAEnfaZ/0bLaWJXG44y4mtTOfeciYhlHrZP0eJ2s1aXDviNy2Yu5OwEazhY5mmzHC0a+X+Sdvx0HprDDKfbTM=
Received: from AM5PR0601CA0060.eurprd06.prod.outlook.com (2603:10a6:206::25)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:15:42 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::bb) by AM5PR0601CA0060.outlook.office365.com
 (2603:10a6:206::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 18 Aug 2020 14:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 14:15:41 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Tue, 18 Aug 2020 14:15:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7272b2ccd1c84a47
X-CR-MTA-TID: 64aa7808
Received: from e58366b0544b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9484EAC6-FAF2-46F8-AC97-1A3D7A8F8770.1; 
 Tue, 18 Aug 2020 14:15:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e58366b0544b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 14:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyQvbGniV5R1aug9ZGHxS9UA3JlKnV4lhX26hxeHNNkuyaHkqvb6dYHdMEq/oZcvwdZXT2tkWvrHYz7nOdzjI4IbZuhR12LC6Si8/zqsHSzlbKU6lJd4eoEwWjDYGE2cRmJLOIbOLHKST+A97RPCB4XgaJDP6PUCNQdqniFMcWOfcMTF0nZqaoTpb80GKRL9Tx7CZREYBfwsvC+c6ujqcDexAOA3dq8YJOtB8ukU/+/+/Hw1dBv/d3w8GWMo4acAOGBnXf/if4FJV3DHorSCHe1Kg18nxJqRqYQ4KuHpeGaz0sxWX8k4/17FewL3TO9x2+eF9y8jku/ckdwmA5XVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS+7qyAP2Y/s0iAkSuxOvlLd6GhNP1YLlPrqUoSlGo4=;
 b=emlZhsU48hqevlFytIuKeTq8nVEMXSgOzjHbr09EsshED6wCDrTMSHPsYOt3fylPp7cw1kScgsBGEYfiKkPZlmkydYtyWHTp9wCLwnhOwK/eqUjzrL3vcHkE83NxI7vvtrxYKp6hdDba/jrAgkQbCCgOcgpXNOYWg37PkRWRG7B0xu+Bg8kyqw3lr5vvmT6TSW61BErV9rJkorv4d9Ck5mqVwOf5ZwslSI/cGpU+vb6XzVkdIcETFmHiYhlkYzajbaeTqbx+vCU5gq5c94SrcHHCKZETNbD2dRovZxfq9ZWvTKV+O16IaQKBxQ4pc7UgJejY8zhuONiCrwkVtPdAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS+7qyAP2Y/s0iAkSuxOvlLd6GhNP1YLlPrqUoSlGo4=;
 b=vbEqb0oaEoT2lYYT7N7VU5zhyb9TWrZv4MqT67nQZiGU6mZA+tQVyvcHMla/D/CObVLCioHEskk2vf+1/De3AojAEnfaZ/0bLaWJXG44y4mtTOfeciYhlHrZP0eJ2s1aXDviNy2Yu5OwEazhY5mmzHC0a+X+Sdvx0HprDDKfbTM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 14:15:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:15:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>, Andre Przywara
 <Andre.Przywara@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: Enable CPU Errata 1165522 for Neoverse
Thread-Topic: [PATCH 2/2] xen/arm: Enable CPU Errata 1165522 for Neoverse
Thread-Index: AQHWdT2y/OacB61ZH0CMlwNCwz+bzKk96EUAgAABK4A=
Date: Tue, 18 Aug 2020 14:15:02 +0000
Message-ID: <4444F18A-BF47-442C-B44D-8ACCAB679C95@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
 <8680961067334f6049eb5215b3939195d3da00d8.1597740876.git.bertrand.marquis@arm.com>
 <dde51d6b-faf8-02af-9b84-ba665538a3b5@xen.org>
In-Reply-To: <dde51d6b-faf8-02af-9b84-ba665538a3b5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc81cc42-1551-4421-08ec-08d8438130a2
x-ms-traffictypediagnostic: DBAPR08MB5816:|AM0PR08MB5490:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB549022F718E4A3A4A37B4B039D5C0@AM0PR08MB5490.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OzbQeZC3CThP4VFYIYiZ8WGGjigZwG3aJJQgnLzRLHuh+bVJG34HyU/lUfY0f31Mmyy6uDbVCkVUBShy4Ze8GsPhcr+y/d7L3nQ5xls9heWSY7E2wEqSosEJ4aAfYjkWXPpRnmnk5fNjuxZy2ToVVi6h0Lo9aBnxVDCRhG1BpCUsGhlBbG8TprEYEVSakcnTPr9JuwpmnCBBopfPTXFSHhK5NroQ7h9U1hzsrHp7fOoZlVwaYpq5iQ6fZb4RC7wJfidAaC8rX9mHYrLb9yUeDacedCAffU/ADdpBcyrhmYIZVx0ZQMd8+F9TwDAKj/An
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(53546011)(4326008)(8676002)(186003)(86362001)(6486002)(83380400001)(33656002)(71200400001)(478600001)(66446008)(66946007)(26005)(6506007)(36756003)(66476007)(54906003)(64756008)(8936002)(76116006)(5660300002)(6916009)(6512007)(316002)(66556008)(2906002)(91956017)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IJPuFmtbTLX5RFKvPoznjjpEcY7Z1eR7EPfv5Zh/pZvbqTuBkgIjOZFjxX56aJnrahiRJuQrRBzmzx82GGsPbjCdtRd7aejxw6GHMR3X9uYMynanDvhvbcA0Po3nLtf7rKNMYwBCWa7+7P1cKDZv3fnNiuc0K69miEm7U5NMIJpthEO5xBA513AlyDavO8uSG8bSX6xJ+GuTl/sXk+3F/O+OyqB0yx0BHJnXabCeE2Fsg5aAzTTbWnSh/GcTQyQGr+n3ZXfiuDrM0YdPxcwUFNK52Lkzak+CCGZW26HHva6T5SMXkUIJ+lo79m8lkdqO9hwJwLyUxX9HlF3x7S5lBpFl7e6zz0fAJufAg4Xv9RKPAtwZDe/UgcN//w1kMVJRFInwFRDolVVB9P5lWX6/c4EbmPi0yX9UwmIN21dr9Y0GEWZpgZIHcqqAY4Z4kjVmAkCSUu7bhWFW/DZc7qqJc0THCR47uymU351vBFeU6sgBLYDj+CI19YBaqLBPTzIcSJYeIWSk093IiR+lsm+++FEfxVQhQbeqS/86eIskQI9MGUpHO6Fr/XFtgylNEB+8a0vG/FpidO1F5VJrmTifH2uawaJkT3F8edWJ5KRC2349lRWEkfhIaPvb8BkQGB39irmhoMnTukItl8PYnN7hQw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <753F5403A88B9048AA31739DDCC72C2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b9afafdf-e05d-46d6-247a-08d84381192e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JelLrYGRnPVFO/djymb6r+kjXO5xTaaR+OUmh3MUK5kf2zcyKFZwVOEnnyODf46BvaxJOpUlCQIJgEltzrkO/Mjc0x1lVIsc/Z4Oqj5mweqJYkX/8wH4hzkMsbZjVNy4Y8eLCju6OEpZ3OTw9mFOsfJWxeluF+Jv84b0wnxZgjnlHrJDt9PFus5o3buW757Do0FoFhlPUQim/cq0Iy8MbV0tA9730s/0oq9ePFeZeQrfGiGMiDwTZq9N+otyrNbOJUAXPcCPb6ZTIxoF2DtLqTlU4NraeDmJi1pss+gJv7cvMz0jTH4RvL9mmJN1DvLA2lQpV7ToyyU3cSSp0ipMv/IPiJ/rIc7gUCZcLwrWkS8HYiTvipx+djwo7C2uaYwjetceljIOWaWA+oiN38b9mQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(316002)(6506007)(54906003)(36906005)(53546011)(83380400001)(356005)(47076004)(36756003)(5660300002)(26005)(81166007)(82310400002)(86362001)(186003)(33656002)(478600001)(6512007)(82740400003)(8936002)(70206006)(70586007)(336012)(4326008)(2906002)(6486002)(6862004)(8676002)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:15:41.8073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc81cc42-1551-4421-08ec-08d8438130a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 18 Aug 2020, at 15:10, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> There is only one. So it should be erratum :).

True my years of latin are quite far ;-)
Anyway grep for errata in commit logs would be defeated if we put erratum i=
nstead of errata.

>=20
> On 18/08/2020 14:47, Bertrand Marquis wrote:
>> Enable CPU errata of Speculative AT on the Neoverse N1 processor
>=20
> Ditto.
>=20
>> versions r0p0 to r2p0.
>> Also Fix Cortex A76 Errata string which had a wrong errata number.
>=20
> Ditto.
>=20
> And good catch for the typo :).
>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> All the NITs can be fixed during commit:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks
Bertrand

>=20
> Cheers,
>=20
>> ---
>>  xen/arch/arm/cpuerrata.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 0248893de0..6c09017515 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -476,9 +476,15 @@ static const struct arm_cpu_capabilities arm_errata=
[] =3D {
>>          .matches =3D has_ssbd_mitigation,
>>      },
>>  #endif
>> +    {
>> +        /* Neoverse r0p0 - r2p0 */
>> +        .desc =3D "ARM erratum 1165522",
>> +        .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
>> +        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
>> +    },
>>      {
>>          /* Cortex-A76 r0p0 - r2p0 */
>> -        .desc =3D "ARM erratum 116522",
>> +        .desc =3D "ARM erratum 1165522",
>>          .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
>>          MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
>>      },
>=20
> --=20
> Julien Grall


