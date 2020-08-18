Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6EB2480EA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xJR-0002xz-MB; Tue, 18 Aug 2020 08:49:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k7xJQ-0002xo-5a
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:49:44 +0000
X-Inumbo-ID: 17c9002c-0f9a-4ba1-8886-35667cec76e1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17c9002c-0f9a-4ba1-8886-35667cec76e1;
 Tue, 18 Aug 2020 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvu1p3o2Eoy2RYFgbXvnxxpBkEAai6FNil0RIQcOvF8=;
 b=XM0yzLf8fNh8labVKYM+V2snu5dIwstrhedXIWyaempeGwgitlIfPpJqu96sDyb5SIREZ6ayDuvG0G3AGTFwxv0K62EakPDiJ0lRQznULvG66IFSSli9K7kas40aqFYI6yMco3CJVIggY7pv44mixel1Pzpk4yquVFQlQ9dtuc0=
Received: from AM5PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:203:91::14) by PR3PR08MB5865.eurprd08.prod.outlook.com
 (2603:10a6:102:92::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 08:49:40 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::7c) by AM5PR0502CA0004.outlook.office365.com
 (2603:10a6:203:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20 via Frontend
 Transport; Tue, 18 Aug 2020 08:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 08:49:39 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 18 Aug 2020 08:49:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 821e422d9562a7d2
X-CR-MTA-TID: 64aa7808
Received: from 49a0e8632202.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDA808D6-CD9D-42F3-8068-3B3AEE3097CB.1; 
 Tue, 18 Aug 2020 08:49:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49a0e8632202.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 08:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aImjuQbZXP4e+waNvUtbvLwW1kADZ6vONE2qnDXZVbCO/U6BRGDHs3njjGp7+Zs3UBsNlyPYUef7kXaYBkpQqLyRmMfdRu5u11QYceFr3dLMhiCz3fiXInVbRX4a79QwtnogC3TcBrVJnle5Y5k6dTing4uMBOWvazdo0at65bcyAUY4PX74mTNL7199tX5+SLRTvKyAYTd5X89DpUcp+cx+TRYgbZOhHDFc7RCV6Hk3ZVNfsJLnKVvhjwqSrVzE7YuyxQJhjOnt/ITZEtLGQfU4uJbNK95PMujssXLBYcMw/aB92UpbUaKqgScgVeUGDWzH+VBwmW+osptB/MsLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvu1p3o2Eoy2RYFgbXvnxxpBkEAai6FNil0RIQcOvF8=;
 b=BOB98Jz0JDXNDHxBDtKMrehWRL97BeCxP3tptKjtjpBN3twxPUqfJPE4DY1QoAIzuhWaBdzw7dl5XOjOxL5EPZhY/UClkGs/2fGNdgw8qBSCNvLNWuhQ6GCtWXwxFCTa2Wju/Jh6rlAJtFj97lrwPNGYxQWt5AxHlkbxRWGc/bzfK/vx9kZhLMLTVRQ46WZVBEQSQ637hhL3lby6KSJ3bzLTWgFjzI92wotbIB/FKW+iKN9CladQYTVEkwbm6Cai0MizUXl7sjWB1uVOF4r9kR5g2wGTUinxSTkF+XdGgNFxL4Gbxek6h3ZAMJhy+YQuc0TsIRPafXEiHNkMLZZCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvu1p3o2Eoy2RYFgbXvnxxpBkEAai6FNil0RIQcOvF8=;
 b=XM0yzLf8fNh8labVKYM+V2snu5dIwstrhedXIWyaempeGwgitlIfPpJqu96sDyb5SIREZ6ayDuvG0G3AGTFwxv0K62EakPDiJ0lRQznULvG66IFSSli9K7kas40aqFYI6yMco3CJVIggY7pv44mixel1Pzpk4yquVFQlQ9dtuc0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5321.eurprd08.prod.outlook.com (2603:10a6:10:11c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 08:49:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 08:49:21 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andre Przywara <Andre.Przywara@arm.com>, Steve Capper
 <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Topic: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Index: AQHWdQ1DgIquqcpHPEOT+qWxYeHAMqk9jtIA
Date: Tue, 18 Aug 2020 08:49:20 +0000
Message-ID: <F12E0E88-C28B-4ABB-9FF6-DF10EA19EBB6@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
In-Reply-To: <20200818031112.7038-1-wei.chen@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 794d8d25-d025-496e-e8a1-08d84353a4ba
x-ms-traffictypediagnostic: DB8PR08MB5321:|PR3PR08MB5865:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR3PR08MB5865AB3BA381F4E3A4CD627C9D5C0@PR3PR08MB5865.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FG3ZuOidODn2mYY9aSxv7BMMETNPLHiwrHCMTd4xy/6Nr3/gjzBmLWZ+JdxaO3G+mFMgQRRLE+4CPCAECSsXlGYuyg9hf1TzosdnTA7zO1YXL8hhcVDSXBXbGl3hW5/RVu9Lp6Apf716bYh2U6/kzR+iSmxESL/wy7CPyvG4xoMzGLTgbRkUBl7Sdcs2YZKll++1QBRuETj4CObCQxABw8td6jdtwCDTGB+myItZnirKRTxwdcx/NF69gjL1eTO/Iuv8ZN9eGbpSu0J9At5nI6cuV80ADv/bzcs0brrPTwUYr2bx3hLj1kQW6hOBKv11
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(33656002)(86362001)(66556008)(2906002)(91956017)(66476007)(66446008)(76116006)(478600001)(6486002)(64756008)(66946007)(8676002)(2616005)(4326008)(83380400001)(8936002)(54906003)(36756003)(5660300002)(71200400001)(6512007)(186003)(26005)(53546011)(6506007)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uxwtIggpgPg0aRKESyxyZdNAvzhLYInf8BZKp4NVVNnfPQGITS9g6sekFurkoy2nls+azFSYs8xOT7eitvXU1JLYKE7J4Hzn/edxIHxHR877YyKOd7QWBRj4vigzHh+bFIMv/w5WzGp6sLTybiQhWXVsmTPEwi6MgQoiVnjVJyCaQHcYNVA7S8b1PycvMW9J5MSBFmLyMuvtQJ7XjTVQGQcr9XRKrJvOlIrvWZpr1y2PX73J+j9X9z/CddkWBdy2mwEUmVY8JwRgKm2AqXCwNZBSIEJxNLbjv61+yP6xSca/XWy9/+0rP2dKoV6/Ktax34JQBkTPskDIg9FmrBS74C82uPyl8ESol98yrl8wkI9QHJ2nFY1fQOoiDP9G9hABDu/hxWPZYTKwttH8zCJIpAL26Dax23ylPw6ut4NxlhYeMYUlrMOQydjhxgDZW5zqLf4bJBwI+qhFtNVWX1yWr1Y3GSwI6uo/nCZPtoJbKdafUzjzynL9FNSAFaKz77k5pIzg5b18lzS/Crl8/oyH+ePPs+ff3FLrJhAQ5/74222e/jjQFJVGFpVGBGsqzqu87qhPK4a+eUyHiqQ/5CmXklQzhOh8PBl5Sgap5+IG6MCjl09OF2vLax57KaHoxfMnkHJ32JO4CrzuYeOWSMeEbQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7564D03D3742834395B73BA4FEDAED0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5321
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a84a2561-e4aa-45f0-438f-08d8435399a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdFuBbypYlwS7Jz7L4VYwWfN1pl+adbUWNgNyNSMYwK3gA3gj3mHxSagrWbPqDuXedl8rMhY27i2ynKF6859QzmqhfvaSKwU8zkxIYDcFKVufaegOHP+XBcVSgmVGe7xGCJ/1ZiOIzv0niL86CUkWpFP+BX6De9llAToNQ1d70LXb8zOwgHZ4gekuFpBx3cwbv9sk0Z63Bgw+rpTCoKEVWg0lnQW4WPkJ/YN/asxMD/+ErNa0Tupq5mjEegSSl9i+aEO3CeXQSnj95wZIBdGOc8m9aLiAoP9VH4eQet04d4RAAeSMR7SIMA26k4uLwJ/XGyXeojpm6LIP01jyoeB85gipPU6LxdRU24r4Z8RH28vRSzC6ry87cS2USVBFpzuZGZwY1154OpasYCQxh4UHg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(6512007)(2616005)(336012)(36756003)(8676002)(5660300002)(70586007)(86362001)(70206006)(8936002)(4326008)(26005)(110136005)(54906003)(316002)(6506007)(36906005)(2906002)(6486002)(186003)(53546011)(82740400003)(33656002)(47076004)(83380400001)(356005)(82310400002)(81166007)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 08:49:39.7414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794d8d25-d025-496e-e8a1-08d84353a4ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5865
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



> On 18 Aug 2020, at 04:11, Wei Chen <Wei.Chen@arm.com> wrote:
>=20
> Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
> FP/SIMD or not. But currently, this two MACROs only consider value 0
> of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
> that support FP/SIMD and half-precision floating-point features, the
> ID_AA64PFR0_EL1.FP/SIMD are 1. For these CPUs, xen will treat them as
> no FP/SIMD support. In this case, the vfp_save/restore_state will not
> take effect.
>=20
> Unfortunately, Cortex-N1/A76/A75 are the CPUs support FP/SIMD and
> half-precision floatiing-point. Their ID_AA64PFR0_EL1.FP/SMID are 1
> (see Arm ARM DDI0487F.b, D13.2.64). In this case, on N1/A76/A75
> platforms, Xen will always miss the float pointer registers save/restore.
> If different vCPUs are running on the same pCPU, the float pointer
> registers will be corrupted randomly.
>=20
> This patch fixes Xen on these new cores.
>=20
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I tested this patch on an N1SDP and it solving random crashes issues.

Could we consider applying this to 4.14 ?

> ---
> xen/include/asm-arm/cpufeature.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 674beb0353..588089e5ae 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -13,8 +13,8 @@
> #define cpu_has_el2_64    (boot_cpu_feature64(el2) >=3D 1)
> #define cpu_has_el3_32    (boot_cpu_feature64(el3) =3D=3D 2)
> #define cpu_has_el3_64    (boot_cpu_feature64(el3) >=3D 1)
> -#define cpu_has_fp        (boot_cpu_feature64(fp) =3D=3D 0)
> -#define cpu_has_simd      (boot_cpu_feature64(simd) =3D=3D 0)
> +#define cpu_has_fp        (boot_cpu_feature64(fp) <=3D 1)
> +#define cpu_has_simd      (boot_cpu_feature64(simd) <=3D 1)
> #define cpu_has_gicv3     (boot_cpu_feature64(gic) =3D=3D 1)
> #endif
>=20
> --=20
> 2.17.1
>=20


