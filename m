Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2913216C3A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 13:48:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsm5R-0002iQ-MN; Tue, 07 Jul 2020 11:48:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YS/2=AS=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jsm5Q-0002iL-Lt
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 11:48:32 +0000
X-Inumbo-ID: c754309d-c047-11ea-8d53-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c754309d-c047-11ea-8d53-12813bfff9fa;
 Tue, 07 Jul 2020 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5Tifxque/dl15ra/s1SFPZ8EEDTwfsSXLPNjxlgRWU=;
 b=ys85qp5AbsapNo1epSUfuqMFdbUWuicoDO1ekM5OIeaOK9/EUErSHKgsJsXq7ZFPYNAIkng4HbR1UGlVyE+8sCXm440pi/tJ58AqTFW/tKZdF2KEzkG0FJDMOW86NDh2RgcuaAjFikJf2KYsdppXEvnMe7cvw4oBrOIu0+IxDn0=
Received: from DB6PR07CA0067.eurprd07.prod.outlook.com (2603:10a6:6:2a::29) by
 DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.21; Tue, 7 Jul 2020 11:48:29 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::bf) by DB6PR07CA0067.outlook.office365.com
 (2603:10a6:6:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.9 via Frontend
 Transport; Tue, 7 Jul 2020 11:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Tue, 7 Jul 2020 11:48:29 +0000
Received: ("Tessian outbound b8ad5ab47c8c:v62");
 Tue, 07 Jul 2020 11:48:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfbf81eb248924bc
X-CR-MTA-TID: 64aa7808
Received: from eab0f25cf421.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85E6F30D-9A9C-4550-A07E-CD97DCBA7AC9.1; 
 Tue, 07 Jul 2020 11:48:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eab0f25cf421.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Jul 2020 11:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auF1fNc2ganQgJLiwXcTI6/D0u2rcgDfyTXjR9whUjGZxcauPvhRQLXVtQ2heUSAhktL6mUMTLxO9l2gt4t8vVhQHqXlRK6x83X72lXjm7uUaXIXSwqE35+MASKt9nlDd2F30f2sEtKufyFN3ZYSazWT4WcbPcrXqW3S51j06e54kEY+tDUjbEsdlNfIoUvzTIXq8LFW1mgc+Pno7X5c7yyV+d3qzYUiKU7CNUGi1XKBhut+el2YIDi0mKqIGu83Go0dc7bVJabWAHobE8EvhzgsseTD6P07283NFNj+oWv/YMoZrMVSa/3GbAWrlnzscXGa+8QeNW604/b/k5JPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5Tifxque/dl15ra/s1SFPZ8EEDTwfsSXLPNjxlgRWU=;
 b=j/0SoL+fvOcwO7NWTSchTcB3+xjBpu3mkM0NDGVg9p+sP+FRJ8dU8dYPiyc+Of54Q1EFSzeevEAQDGGB5J39yVaIVRpUIO4LagSqLHSObSzIOnRQ9bONUeCSGubuKKA1GtE7VWVxbt4Cysw4v3mnMyvaKQ0JrrJqV38DKobi0f+3zibQATtSZ1HPAfVVUNrqjhi9VqKunIU0JqHLpQzwO6PJ5bd6XRTXQtA7Ak0sjFn9J0gAFq/DTR+y7oTlEqX9pwbfLwEmZhqBAri5sZ+lxzFSoK8xmA9fhuNGq4kGsdetJmS71TsqMo70Of2ZFq6IoEEvgHIUlJEWLgfTgAb4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5Tifxque/dl15ra/s1SFPZ8EEDTwfsSXLPNjxlgRWU=;
 b=ys85qp5AbsapNo1epSUfuqMFdbUWuicoDO1ekM5OIeaOK9/EUErSHKgsJsXq7ZFPYNAIkng4HbR1UGlVyE+8sCXm440pi/tJ58AqTFW/tKZdF2KEzkG0FJDMOW86NDh2RgcuaAjFikJf2KYsdppXEvnMe7cvw4oBrOIu0+IxDn0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB4140.eurprd08.prod.outlook.com (2603:10a6:10:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 11:48:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 11:48:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAA=
Date: Tue, 7 Jul 2020 11:48:23 +0000
Message-ID: <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
In-Reply-To: <139024a891324455a13a3d468908798d@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d0dc605-7636-4cb9-d3db-08d8226baacd
x-ms-traffictypediagnostic: DB8PR08MB4140:|DB8PR08MB5372:
X-Microsoft-Antispam-PRVS: <DB8PR08MB537297FD0714E56914D16CFF9D660@DB8PR08MB5372.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Obor/VWC7Jyvj+6y7IZdrk7QmRpCyvpR0r9pGueAxUhwxkbtUxVsTBoI7+Llx59+cCix863p9IR9lfY+l5W+V2yZUbRfG9PJEuu/OKrKeJowGDIflgPWewYmwD2UiFxyQ3CEKs6Lf/f/DneRzUKnM7wZT9oBKw6t8b91Ua0Np8X9akb11V/Dpwmfs3qSFTlUJ7SxbXEFLzWG9Ci2JoJjbIj9VWwf17Dk7mq8CLvIaqbQgjncvocLB1QCxZYb4FhIX7sDxJnqsicUGq2t5dkWmSndg3fXX6F9QB+sNx5JpaPz52S+qXbvuagH4a0zQaulbeJy/tdEFpiFvea9tpdBJg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(478600001)(186003)(8936002)(26005)(71200400001)(6916009)(86362001)(6512007)(6506007)(53546011)(6486002)(2906002)(5660300002)(54906003)(36756003)(8676002)(316002)(66946007)(66446008)(66476007)(76116006)(4744005)(64756008)(91956017)(66556008)(33656002)(2616005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 5bWMzyXS/tGe1oI2WKF8cnMJ8miPufqgK/EkikyymyGIf8ZtaROchGOk/432V9gx3Vj/vMOCugHF67Qnij0Feicf6LM53zP8nI3Y3ghKibHSniDdYSoomXwqA9ufHTr1aiJVAzpLs5cCNA7FvNLDZcKQRHyOR9yqJRYz1YE8MW3i82sIgfC2n2cyp2O8wWrsjVSkFv93ZZ13bJ6pKSYI+LVfbiqX+Hwo/kkBUKQEUcoOXeaeoD5KdnYry5fhBrkKKMZSRVoZCFyP7Lgy64mmHQ0NjY5yHt1WHxg95OeCF/KagYX2l9pXjPYyltxxHXRnrxFVsQLvN/xRRh01uOarxcb0cHjaP4D8ENvN92WUfg9fILCsh/2SikirI3mC66NvugxS4h7yV/1ydYUKbcwRaTfoKznr3XXU0qD9ViApRlDEF0XMX4h72oRAbXIfQsiDDNnoCVmnuaNEdvpi38tcxp1vQQNSiCZjZofC6UGmVbP+jAYm6QEGDH9V9YwkwNLL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FAE6ECC876282042B9FD1F6C9C429B46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4140
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(47076004)(186003)(2906002)(5660300002)(6512007)(336012)(2616005)(6486002)(54906003)(8676002)(53546011)(82310400002)(70206006)(33656002)(4744005)(26005)(36756003)(81166007)(6862004)(86362001)(4326008)(70586007)(8936002)(356005)(6506007)(478600001)(82740400003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dfe98605-a2c0-462c-1d12-08d8226ba70b
X-Forefront-PRVS: 0457F11EAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0aVKCTjpNZN5brBo7FtcWZs7uHZd5b1kcdkEdOpfOXr1Z0VHXz7PvBHGnebZLprPQwgfNK+nzfWoyw4BdKfVsOAPV5Dbgil4UQBvH/bTUZVSDMm13UyTRy+uJd+f1xgM+Qr8MnBVTYeeYlG02j2hBBmk8pmrBqjpGE4TYAybCBTAuoSFJKVAp1xXwflMvGnWKLFjskgidVI4fPGwspbEUhSjM7rltPv7R8ORnaJHvPbW7ccDtU+TtG4Ao+bdy0oBmHn1tGWYB6xa22SwUyW4AXq9T3UjHe4sJ8q0BzDKtQY/nTmKG0bWB2ANt2w2/07VHqEDeCDV9F7jvva+/7t7LnWM8U4MZ8v0bX801IX+6ckktnRmpfavkGafyCg3T9i9EuAzbGlnXcRdnSrCdd6C5g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 11:48:29.5316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0dc605-7636-4cb9-d3db-08d8226baacd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5372
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 7 Jul 2020, at 11:18, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Bertrand,
>=20
> Thank you. I will try a fresh build with dunfell branch. All layers in th=
e sense [poky, meta-openembedded, meta-linaro, meta-rensas, meta-virtualisa=
tion, meta-selinux, xen-troops] right?

right

>=20
> Also, Can I use the same proprietary drivers which I used for yocto2.19[R=
-Car_Gen3_Series_Evaluation_Software_Package_for_Linux-20170427.zip] for th=
is branch?

I have no idea what is in that but i would guess it will probably not work =
that easily.
You might need to get in contact with Renesas to get more up-to-date instru=
ctions on how to build that.

Bertrand


