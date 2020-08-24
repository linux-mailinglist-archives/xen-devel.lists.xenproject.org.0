Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FEB250426
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 18:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAFmt-0004qY-8X; Mon, 24 Aug 2020 16:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZpN=CC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAFmr-0004qR-N1
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 16:57:37 +0000
X-Inumbo-ID: c43e72f2-a21f-4d2a-b5d6-215b94280ea5
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c43e72f2-a21f-4d2a-b5d6-215b94280ea5;
 Mon, 24 Aug 2020 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0FlwJELG53bRwdhKluepWoZ2uTK0+rOQ9V5twN6I2E=;
 b=DZYY85a7X73cp2KQB+or5kuPDkYtI/pQszwlqY2Y1FQ8xGHLHRTYzTvI3fTKjV4lcKYnmM1Zs3ESQbgzYjpPExBLbuMXkjS2/xfqbRVIjsYtfflyrZt78WjuOS0kJwOW9a0MtF4h9eS1b7Fz7mKEw22DlVvOLwoFnWmqb6uDe2Y=
Received: from DB6PR0801CA0049.eurprd08.prod.outlook.com (2603:10a6:4:2b::17)
 by AM0PR08MB3203.eurprd08.prod.outlook.com (2603:10a6:208:63::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 16:57:33 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::2b) by DB6PR0801CA0049.outlook.office365.com
 (2603:10a6:4:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 16:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 16:57:33 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Mon, 24 Aug 2020 16:57:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19e24d3399c461ac
X-CR-MTA-TID: 64aa7808
Received: from d51287e9ef0b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B6D3834-AFFF-4DD5-9BCF-A7495DB9A841.1; 
 Mon, 24 Aug 2020 16:57:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d51287e9ef0b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Aug 2020 16:57:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMTsKrHx6QbnvgD9Zc3YhKcc/9n1uNHNBPIZ3h5AOikDi6XFezovpsoGkkq7SVEKuMEbBbeli+9SETEGmplCBQphVOY5SKIUCw8DsJESHuXJAVWO5iaZYym5mIS5peLL7gSmT2KCNvzDeyZPzCgetkZ0+Q0NdWnVwtdYREZuh95jzCk4YeLEEZuk4lxjpOsfg2i2HGOB3R7mtDk/vHXY9gy5b2k1W3s4Dnkex1QsLC5yuTMFfbYGmHUaKWl4aQykzlDy1WeFR508iLtGuzZxLhvfYS6FeZOMoNi7/pcrA1gIfE4CYQafCbh/nhQXY0rloIEUU/y9y+qeH+Rl9OEWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0FlwJELG53bRwdhKluepWoZ2uTK0+rOQ9V5twN6I2E=;
 b=SA3IeAM0/tVq/W7w0Zu9UgREwabryO4wqVth3w/6h+yU3HH1ABgXnfY2WKwsdK2UI6VRPNashNcTv8P4OiGTrnmQyOf985bl2QCJegC4rfW80YUS49AzKVgLdBLBCu/8Gopr30hPflpZ13T2JkcIaeFnP+O10hHHlOcsNAMi4kDUSHpQZeKbRjStDUO+ElwXfMllfa7PdWbfEjqCXImtA6Nb3CeJqqRX+zvRNA/7fr4eH3SvZRRegiQSWxuO1IKfAiP9TV/f9BP354z40NsW9Sieg6lX6rviRmqC8+Za4hza3uzsFZHFDi/kNrJfAGR4gvHpwSPJGzNs5Z6Ci4YIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0FlwJELG53bRwdhKluepWoZ2uTK0+rOQ9V5twN6I2E=;
 b=DZYY85a7X73cp2KQB+or5kuPDkYtI/pQszwlqY2Y1FQ8xGHLHRTYzTvI3fTKjV4lcKYnmM1Zs3ESQbgzYjpPExBLbuMXkjS2/xfqbRVIjsYtfflyrZt78WjuOS0kJwOW9a0MtF4h9eS1b7Fz7mKEw22DlVvOLwoFnWmqb6uDe2Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3163.eurprd08.prod.outlook.com (2603:10a6:5:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 16:57:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 16:57:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, Andre Przywara
 <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWecazJFpryBm0PEiL+drgXPmkLqlHQwyAgAA4rQA=
Date: Mon, 24 Aug 2020 16:57:25 +0000
Message-ID: <4CEBEFBA-6AEB-4CFC-B569-79056AAE0E3D@arm.com>
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
 <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
In-Reply-To: <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 787e50b7-3068-42de-3c4c-08d8484ecbd3
x-ms-traffictypediagnostic: DB7PR08MB3163:|AM0PR08MB3203:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB320364B3F70EFCCE57D001519D560@AM0PR08MB3203.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Og2zi1GaA8aPkgyKPjlg3DbXatHqe+jlBTcUg958NEfxXM0k+/n/riK06RGsqDJjHWoPY3XmzP9MIplJGKsMG40cOR/0QrJx4JS7ykEwL79iu70GM5gqPRLh3tYnzy5pdw70jGzRIYnZZCi2ykTytLRYhjBhfhWvn3cTAQaV3ZyHWWTRVfnQUl3f8bzagiRaoh1GZUyrvHp4OpznPlEu/GC6seYUWbYxcv01OJ1S2oasTtIr7OKkhrVVTASiE2PHvn4PVvQu4PqA3SOHY7imDhIBGJqDQIzzusb8Fp6earU4lpaLUYBF6hLWYt9tyV48iPzNNQzTxJkmPrYwCyz/GA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(4326008)(54906003)(6512007)(26005)(15650500001)(478600001)(8936002)(316002)(6506007)(8676002)(53546011)(2616005)(64756008)(66446008)(66946007)(66556008)(66476007)(33656002)(71200400001)(6916009)(36756003)(186003)(83380400001)(6486002)(5660300002)(86362001)(91956017)(76116006)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2zRRD7c7+s45CUjIDfEl+VGrxFMAPwM15nY0aI5ZP1tZW8nA2SxA/65258YBwWfrmuWFvyd7KS2xTx9UPI/e5JvpSWoiwzAz5LSZVNpcZQKpD/eVeznsLI1WP+vO+oVA67tgRcsY8Pue3I3IRMtnYoYZZSZVbwlz3+m0SFZtA0sNWY9lp3zbtDHpaeW/KaYTDOaX6mt6Bnz+t5fzhBj0GjHoYW0OixJJxY7jou58xpQ6bAfjFHlaplgt2WQrbZVtIG8U1ZuW72t2zU+AsbSPdQBYYJnsiVlRrFoUquH0MF1WZeTYWy30v1MaA947MAZaJU82ArVLNmM8NhHr8eWsd6MZhaOUJ8pHWjvyKQZCU5F4AFJRYcnqpyHkldQfI8E2kkY8EnEq36ZrhP/rs8JyRJfovHmTUef69UzZT/T5pMMsqzVR8oXfSYnou7ngHX5WNaV9zwSrK574xANOy2VU+1MWp4u2DEgj/A1gkGnY9wXKsBrvtlO24WsL8xTAVdE66R9ZOXTOykpASUlFMMAkLOIrtpmBPr60AFiR08grYCyegyIWnv21118r3OH3koTPVL2yKZ6IIFBt7UiQmXPXhyeX/7rpUddLOMEAtZRmt4IYZA37o2P+YYsCfepXVV2G/oxGf0NXsexBtJZsWqDvBg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3173F7192F40C4084C369FCBF1C1296@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3163
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f1f6b7b1-3a1a-4b71-b392-08d8484ec72c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jA8bOwtL6aa2uOSP7onlCcZdP8IXUbfo30vGC/rU6wUt+MtaRXNy54apmOGNLEW2zasZ+PwbO+R4mQVIlOI0ALSQxV95oyMh8irfHHlCtQhqCLxzYp0eHLcmeP+h/nwCb4G+5CcUyZJaD8uCBdc/TZGbw0VMMDqBXD0KLvK8iBgK9l1OD3d3sHBaeupQQooCTGkoVF5Jl32hHGJdiA3x8/V3dcjIJrCsWp9gQXHCaGOBhGYoSzdFRMGg+jxKmDBgEoVBPlj5Ems25JtCNjjzZ55O8J6UcGftV2k74pUFLKpHGnul3tvdA88Zl/rdV6bsn90Bi+v8LwbgV9tr2EmSlU6NXI3qxyH2MyJOM95Y9FOQKe2/FaIqWNLPx311tmwmVpRDHCO+qRG109zyCJAC0A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(8936002)(336012)(6486002)(8676002)(5660300002)(54906003)(36756003)(47076004)(15650500001)(478600001)(316002)(53546011)(6506007)(2906002)(186003)(26005)(81166007)(82740400003)(86362001)(70586007)(6862004)(2616005)(6512007)(4326008)(356005)(33656002)(70206006)(83380400001)(82310400002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 16:57:33.7122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 787e50b7-3068-42de-3c4c-08d8484ecbd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3203
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

Hi Julien,

> On 24 Aug 2020, at 14:34, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Wei,
>=20
> On 24/08/2020 04:28, Wei Chen wrote:
>> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
>> FP/SIMD implementations. Currently, we exactly know the meaning of
>> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
>> features presented. If there is a value 0x2 bumped in the future,
>> Xen behaviors for value <=3D 0x1 can also take effect. But what Xen
>> done for value <=3D 0x1 may not always cover new value 0x2 required.
>=20
> Right, but this will also happen with all the other features. This may ac=
tually confuse the users as they may think the rest of the features are ful=
ly supported which is not correct. For instance, dom0 will crash if you boo=
t Xen on a SVE-capable hardware.

I would see this as an improvement already.
More could be done for SVE (and other bits) but this should be in another p=
atch set.

>=20
>> We throw these messages to break the silence when Xen detected
>> unknown FP/SIMD IDs to notice user to check.
>=20
> It feels a bit odd to me to print unknown for the FP/SIMD feature but not=
 for all the rest.
>=20
> IMHO, the right approach is to sanitize ID registers exposed to domains a=
nd only expose features we know are correctly handled.

I actually started to look into this last week because I came to an issue c=
omparable to SVE with pointer authentication.
Maybe we should discuss this subject separately as clearing TID3 bit in HCR=
 and emulating all ID registers is possible
but I want to check first if this could have big impacts on performances an=
d see discuss how to design this as there
could be a huge amount of cases for example if we want to allow different p=
arameters for different domains.

Cheers

Bertrand

>=20
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>  xen/arch/arm/setup.c | 26 ++++++++++++++++++++++++--
>>  1 file changed, 24 insertions(+), 2 deletions(-)
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 7968cee47d..c7802d0e49 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -99,6 +99,28 @@ static const char * __initdata processor_implementers=
[] =3D {
>>      ['i'] =3D "Intel Corporation",
>>  };
>>  +static const char * __initdata fp_implements[] =3D {
>> +    "Floating-point",
>> +    "Floating-point + half-precision floating-point arithmetic",
>> +    "Floating-point Unknown ID 0x2",
>> +    "Floating-point Unknown ID 0x3",
>> +    "Floating-point Unknown ID 0x4",
>> +    "Floating-point Unknown ID 0x5",
>> +    "Floating-point Unknown ID 0x6",
>> +    "Floating-point Unknown ID 0x7",
>> +};
>> +
>> +static const char * __initdata advsimd_implements[] =3D {
>> +    "AdvancedSIMD",
>> +    "AdvancedSIMD + half-precision floating-point arithmetic",
>> +    "AdvancedSIMD Unknown ID 0x2",
>> +    "AdvancedSIMD Unknown ID 0x3",
>> +    "AdvancedSIMD Unknown ID 0x4",
>> +    "AdvancedSIMD Unknown ID 0x5",
>> +    "AdvancedSIMD Unknown ID 0x6",
>> +    "AdvancedSIMD Unknown ID 0x7",
>> +};
>> +
>>  static void __init processor_id(void)
>>  {
>>      const char *implementer =3D "Unknown";
>> @@ -129,8 +151,8 @@ static void __init processor_id(void)
>>             cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
>>             cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
>>      printk("    Extensions:%s%s%s\n",
>> -           cpu_has_fp ? " FloatingPoint" : "",
>> -           cpu_has_simd ? " AdvancedSIMD" : "",
>> +           cpu_has_fp ? fp_implements[boot_cpu_feature64(fp)] : "",
>> +           cpu_has_simd ? advsimd_implements[boot_cpu_feature64(simd)] =
: "",
> So far, each extension name are just a word and they are all separated wi=
th spaces. With this change, there will be multiple words per extension whi=
ch is quite confusion.
>=20
> If we decide to go ahead printing the "unknown", then we want to provide =
a full description of the extension on a separate line. Maybe:
>=20
> "AdvancedSIMD: With half-precision floating-point arithmetic".
>=20
>=20
>>             cpu_has_gicv3 ? " GICv3-SysReg" : "");
>>        printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
>=20
> Cheers,
>=20
> --=20
> Julien Grall


