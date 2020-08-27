Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910025468C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 16:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBIe7-00035j-CL; Thu, 27 Aug 2020 14:12:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcIR=CF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kBIe5-00035e-Aq
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 14:12:53 +0000
X-Inumbo-ID: aee183c9-86a6-40c5-b96e-c1ad806cc11e
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aee183c9-86a6-40c5-b96e-c1ad806cc11e;
 Thu, 27 Aug 2020 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWH+z9aNjle3D54c33J4HJGaT7GE9vtpK7Wt/M3XetU=;
 b=omZIHI2ywq0ZMIQHzyS+R1ktMQDdTWAKv4s1Rx9oGU4kmPHwZBdOpIXqt5evXMpCy8DnebPGyNGG0NX6foqImWlmaGH6/GHR0//WCq2MHcYl1AQZK6OSmzO7OI7Tg290uhBrJTnge04/ow9G/BsJupm1Ol0L9cyWLsO7+2k0szk=
Received: from DB6P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::31) by
 AM0PR08MB3476.eurprd08.prod.outlook.com (2603:10a6:208:dd::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Thu, 27 Aug 2020 14:12:49 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::7b) by DB6P193CA0021.outlook.office365.com
 (2603:10a6:6:29::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 14:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:12:48 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Thu, 27 Aug 2020 14:12:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a37377b2c45a618
X-CR-MTA-TID: 64aa7808
Received: from 21ba2e3012a5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F8695D4-6F17-483F-A7EF-F961CDBD70E2.1; 
 Thu, 27 Aug 2020 14:12:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21ba2e3012a5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Aug 2020 14:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKE35K/aufJiCNCgH2DwhmZLh+Uvl1HgaZreNGldoNLQmttgpokFFoJCbEdEoHAQOpWwem74w9RPaahcQ4eK4B0HsnX/CShNVj/7/DGyRQljveEq5jn0KP3Mot7NnGZP/4Rl88pMFIh7wfJKdZhx422cvzDPEu/0JHaInSB0ZKi1nADbYZ0LhVCJz1xdsViTKlD6omjVmEbuWDB6qc8PlhncVSXELR2d16b9JYHy1eiFCg9Ia4NaDTKQmtsQHylv45x78vK2oYvfl2tLWwEiNCpAM0Efs0yftxK6oFpKqJCr9u9OlNFtQP8FOqy8A61/8eRjOIEdLjDCyp41jmRAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWH+z9aNjle3D54c33J4HJGaT7GE9vtpK7Wt/M3XetU=;
 b=Q0j42+7Vz28GyfYubO91ZlBNN5SW/ggOjrHHFrOyRSrFkksTfpyTEU3SpIvDMyLd/eJqjJyRImhkcVJ1f2kI7YpUi2edWKMsxRl6t/4HPVfxF+vjKhfhW8HWUHrfzgJCE/H4T/Z7CYr0mA06NWp6BcqB+SM1OgisuG+X9HAGDqt00yVNrOELwFvk1gy+wTr/LnZoBU+q6aNSm03TdB77wSWBcz42uWcyzTZie9w7Wk070mOHOY82aF2D8QcLazKiDL7r6pQFBnY6k/s1+14EPlwRfKq+7TJY796ni50LnvaCU1BtUoAaxZ5+VWKYDA7mQksfhZl7q9PSg7pQ5PYfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWH+z9aNjle3D54c33J4HJGaT7GE9vtpK7Wt/M3XetU=;
 b=omZIHI2ywq0ZMIQHzyS+R1ktMQDdTWAKv4s1Rx9oGU4kmPHwZBdOpIXqt5evXMpCy8DnebPGyNGG0NX6foqImWlmaGH6/GHR0//WCq2MHcYl1AQZK6OSmzO7OI7Tg290uhBrJTnge04/ow9G/BsJupm1Ol0L9cyWLsO7+2k0szk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 14:12:41 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:12:41 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Andre Przywara
 <Andre.Przywara@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Topic: [PATCH v4 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
Thread-Index: AQHWevnEimYVHQJQokOz0w3bGnc3NalMAksA
Date: Thu, 27 Aug 2020 14:12:41 +0000
Message-ID: <8B738286-083C-42D3-B4FA-7E9FB8915499@arm.com>
References: <20200825160603.32388-1-wei.chen@arm.com>
 <20200825160603.32388-3-wei.chen@arm.com>
In-Reply-To: <20200825160603.32388-3-wei.chen@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ed20a89-1631-4b10-01d4-08d84a93472c
x-ms-traffictypediagnostic: DBAPR08MB5816:|AM0PR08MB3476:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB347628017AE3BEECF203CD429D550@AM0PR08MB3476.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nD82GSmtjm5hKYQggUx7sB+++QoHDgfoMCT/Un7gos7ugkk1e/n6PEAA11Tc+TrC1j2LLajLXbANHK83l2UjiY21Jl0yba8f1L4ZlItPmTQA/oiHOl25CwzQ18iqnDp0x03oO/gDfLrISmCf29HMiOfpvTK/U0e5v/0N8mF1w/yjF6iz+DBrWiKQjpffQ00FBzSoVDvMYjY7cOTfuzNkypyQHHGKJkE7b7IY0LXMN/P5YyhpZvDohPwbmI3/uWTzRaxRp+dO/zqW+ILX8n5jCvWvi5eb2w+4HTJH9p69zV2AGvaJRF4VQpY7EgF3WsW4v+zDRmH5zvJlpDpG56LSdw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(5660300002)(186003)(54906003)(2616005)(316002)(86362001)(26005)(6512007)(8936002)(478600001)(6862004)(6486002)(37006003)(2906002)(6506007)(4326008)(53546011)(15650500001)(91956017)(64756008)(66946007)(66476007)(8676002)(6636002)(76116006)(66556008)(66446008)(71200400001)(83380400001)(36756003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PVXzQxpvbSPelG6WBzimgIjd64lBbBgTB325Sp0Tr0QklHnDqiRQaC/QfAFVb+hXyJD3RHBEomQvH/MP9zv/Xun0QeAQKlKgJtDK79w1h7hXxU8EjPX1XHB/Hj6l3iO7YelIYBapbogjA2w+AZql8shXQnuUF5pXFq9Gx/ktI9o0M3g/gE4pHiGjtIzv78kNDKbkcsY20Nb+0Z/jvZKX/rAaQk5eB+rbSLgU36DRrwQdxClwh85U5iLbc0OFALplJY9lJ82Rc2viG96Toey3ErMBfgfkECJSGpQBWVckNTsSrNiI/0d2I4loc59Ih/Ds9wbu5fZI63QVF7O+ewvQ4iFDX1hig2vjTiC5q4DLnhj4EnDwxpHqWlhL2Ggln8f2DBghYNV7CdFOOxf/FT9e40oJjjrc5MciKvX+B+0d7Bs8khCdBi9x+/YhHCtepyT4lziZVus/EhcVZPmzUAZJ8mrx081POG4S864qjQzudxFFKyJWnj1mU3mXYzIj+vSuJWXtGkAt5XdXl0KYm1gAE4FDGSs9RBQYp9Ydv2Qy5zHSflUv305HLa26MQT/JKn9qAxVzS5XKilJwGVDdEaPFvlP/qElnjxl9w1r0kojEpGiK3JWSStXujGMNCuiUw4JTeCHulj3dmockkpgR9TBUA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CACF5ECA8C3144D92F2DD30E2F1A1E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ff7fe96f-d733-47a6-4142-08d84a9342a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfKC4hjMabHAHREAM3QxNeDBlttlCgzA8FKXlx3c/YktY26dweJtIQWYtTlNMMBotdlltUYMChQYk0Q1Jv5Uuvye2PUCZXboNGea4f9k0V6ol6iDOI3fIoKoaXffk3ZypOmB4YrDIPaF2M4vxfW3HoJKfkj7P2WbCLPQm9nNxnmTts5U6mpUgKTKHqSkugfripv0LY/Z17o1a9V12xmKDDZT7TaL9onJUOGOkIZ754O8WJEmz2F6DX0HZdBViYNRb5kt+XAexNihhOoDgPB3GoUHpSZwbSS/Izqv95TsTGKxD0Aqvqw4PTtGavO1iuQHx+ngv0gufPH6ruk2KppuNjZG/c0zAKhNTBUKWfVA9wr26kyle2M81HcIm5VLp0kHk1cj8UHjIWvI4BCjnot0Uw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(6862004)(83380400001)(54906003)(4326008)(81166007)(2906002)(15650500001)(47076004)(53546011)(86362001)(82740400003)(33656002)(316002)(6636002)(37006003)(6506007)(2616005)(8936002)(82310400002)(36756003)(356005)(6512007)(26005)(186003)(5660300002)(8676002)(70206006)(6486002)(70586007)(478600001)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:12:48.7579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed20a89-1631-4b10-01d4-08d84a93472c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3476
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



> On 25 Aug 2020, at 17:06, Wei Chen <Wei.Chen@arm.com> wrote:
>=20
> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> FP/SIMD implementations. Currently, we exactly know the meaning of
> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> features presented. If there is a value 0x2 bumped in the future,
> Xen behaviors for value <=3D 0x1 can also take effect. But what Xen
> done for value <=3D 0x1 may not always cover new value 0x2 required.
> We throw these messages to break the silence when Xen detected
> unknown FP/SIMD IDs to notice user to check.
>=20
> Signed-off-by: Wei Chen <wei.chen@arm.com>

With the small typo after fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/arch/arm/setup.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..6a31eca984 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -133,6 +133,18 @@ static void __init processor_id(void)
>            cpu_has_simd ? " AdvancedSIMD" : "",
>            cpu_has_gicv3 ? " GICv3-SysReg" : "");
>=20
> +    /* Warn user if we find unknown floating-point features */
> +    if ( cpu_has_fp && (boot_cpu_feature64(fp) >=3D 2) )
> +        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
> +               "this may result to corruption on the platform\n",

s/to/in/

> +               boot_cpu_feature64(fp));
> +
> +    /* Warn user if we find unknown AdvancedSIMD features */
> +    if ( cpu_has_simd && (boot_cpu_feature64(simd) >=3D 2) )
> +        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
> +               "this may result to corruption on the platform\n",

same as upper

> +               boot_cpu_feature64(simd));
> +
>     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
>            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
>     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
> --=20
> 2.17.1
>=20



