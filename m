Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DAA2486BB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82Iw-0002E4-JT; Tue, 18 Aug 2020 14:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k82Iv-0002DY-5b
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:09:33 +0000
X-Inumbo-ID: 2bbaa7d0-7f28-4add-a7fc-76600695f004
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bbaa7d0-7f28-4add-a7fc-76600695f004;
 Tue, 18 Aug 2020 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLf9s3Zy1h/k41q6Iw+AMd6kaCZSolz1u6JDEh1SKAs=;
 b=nYS0pGYqg0r7icK3SL2LKpKLcRIqqw9a3UAiBDe2bARbl3OydNdjCL1XHeDmSb9KT6vWhgcCyTsgvkZCCKJHRGhSJ7MODXpawX7Q3+VAP0FkMcChyepg+aCL+W2qQE7B4sUxUwnUVd+90u+l+tFuoCKb4CJLr2GMnPMI/V2CN1o=
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by DB7PR08MB3497.eurprd08.prod.outlook.com (2603:10a6:10:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 14:09:29 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::53) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 14:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 14:09:29 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Tue, 18 Aug 2020 14:09:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 139dabe3d2fda0ad
X-CR-MTA-TID: 64aa7808
Received: from db628ae5a6df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B39B20F-914F-4EAD-9760-BC8F003E710B.1; 
 Tue, 18 Aug 2020 14:09:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db628ae5a6df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 14:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN1JC3wzmhCJ8IY1AqiLkni9laDmbZAHTsbWC6EzYg9iFLEH5+z0iiXStPofp+Lg7hYJYiuAqGrZvUMckNLqnuDnUQ3VI0/Ny9G6SigCWVDBVYE8M/40FALs0rOLhJjyz4Lhu5sf7kcV1Qy4sCi/Toare6Iz9xyIp8VNzRplKSLxT3deuV0mH/dhvbGc4uJUh33wh+GW2pGwu0l3pSfkg4Apbw14whChdmvj8haw6WHVHPL5AsNQobkzaESpS4ucltpKPhysy/SwVTRnazv/HOqabffi4DcVQbnEzxg4v1KgPWlwPMAitNTMb0oL/IPNLMF/bzDiWAlLP0VrjP5IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLf9s3Zy1h/k41q6Iw+AMd6kaCZSolz1u6JDEh1SKAs=;
 b=jgFzMp0SLxrxn/f6zjEqovdyprN0Kw4Ob8CpHDgvQWn+p2UHm+l1hq0+os4jkkBSal31d0hWo3ALGuKTqaETDCskWRkQqI48kFk4E25JtmYWVIjRW7Znb1Sx3x/bXPqPfS5sJV3qPdfcVBWaHpZRC60x9Zx5jqgqEZW6hSusA2vausJpYqp+dFSDC1ktOHYcflAlzGLN1+XMLLoEygb3Gc+Gjb+FkatgKwUrhGEv+Vf1nGygACrQJr9igJdkrf4BrOgvZPZAqXSU+x/n5SBhHjfR729mTLZJDKdP7zxByP19/+o4X+kkk1NeuUymG4ujOQqd6ws1X2KzL/4C3BBJZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLf9s3Zy1h/k41q6Iw+AMd6kaCZSolz1u6JDEh1SKAs=;
 b=nYS0pGYqg0r7icK3SL2LKpKLcRIqqw9a3UAiBDe2bARbl3OydNdjCL1XHeDmSb9KT6vWhgcCyTsgvkZCCKJHRGhSJ7MODXpawX7Q3+VAP0FkMcChyepg+aCL+W2qQE7B4sUxUwnUVd+90u+l+tFuoCKb4CJLr2GMnPMI/V2CN1o=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 14:09:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:09:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>, Andre Przywara
 <Andre.Przywara@arm.com>
Subject: Re: [PATCH 1/2] arm: Add Neoverse N1 processor identifation
Thread-Topic: [PATCH 1/2] arm: Add Neoverse N1 processor identifation
Thread-Index: AQHWdT2yoayu22y5ek2UW5BuuN0eYqk952AAgAAAcYA=
Date: Tue, 18 Aug 2020 14:09:13 +0000
Message-ID: <E0A12B0E-F82A-4D55-961E-0AEF6992B389@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
 <46faecc92bee2a02490b926a636c3eafef1d185e.1597740876.git.bertrand.marquis@arm.com>
 <30bb7d3d-864a-6f34-c55f-7130d2acfcf7@xen.org>
In-Reply-To: <30bb7d3d-864a-6f34-c55f-7130d2acfcf7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bf97e60-7734-4811-4e06-08d8438052ba
x-ms-traffictypediagnostic: DBAPR08MB5816:|DB7PR08MB3497:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB349781F7182679FAC3717F829D5C0@DB7PR08MB3497.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:335;OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fl69afi7QJMf8lI8Jkf8y8f1+0jA2BRGoxZsHl6gHPz9tqYV4MAtmxFqebM9soRJoOmG7NlXU+QFf+wVkmAhNyrFi0HltUnw9N3cNLXBRd16J2InGVu9ya8I3v1owfQfDxpeZMkHwDlFmzD0DopHY8l2q9yMugf3tDJFFAKswxONh/tdfCmphbhTHWqyE5MYPCcGj/MzAj5Q9sk06Io/Y74NSffczza9+fBokaa8HaiePLSgpwwQs+peO5Sp/tsTaqxopiGu7KwPU11i8vw33F0I4V/tnblJIxbGLubPD+lXr60CIix5aqZhe23SJTiYMxx655yTo6/O1PoXkpgV3Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(53546011)(4744005)(4326008)(8676002)(186003)(86362001)(6486002)(33656002)(71200400001)(478600001)(66446008)(66946007)(26005)(6506007)(36756003)(66476007)(54906003)(64756008)(8936002)(76116006)(5660300002)(6916009)(6512007)(316002)(66556008)(2906002)(91956017)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: jyXliMcDnvmCq2a3VeXf7M3BTuAMhDLzcXqhObQV/SXVMK4LwLm17E+0WQDuWhuPkxBF2V9IYZU7hz7CmcMsVrlLOYfzq5p2fTDTecru54Vmnmwbl0JwPFPwQ5Ue5B1/Qs9oRu1l5IjcOrpNSBOYoSswJJcJdgUk/5B7FaKrHUnd6TaRACWNQsFvK/g0NeEWIYgoGpAnXPhnq+eJ7wNzWh7NpBa5RS+lUN8SaQJEFjaPYviKjGnak3GZEVjp3uW4Kf5/F1eiR9M4aycaaLsCTQX1MENLKDjbTdOnvb2liuvKriP19+q9cPxEqdZaqGihHFd+BZ5g6+c/QzkYqVQydzZITwVGCK+Vv34EXcY8vWc8JD736EWwA6Vwwl+U0evHDTVeP1Eqa3BObUefxxkDRP+qi9BfwGZm30/IVc0WY2+9Rhm1KqJrOsRFi02SBNFResTC7dXEeZNAy6BHg6BLe0ZiSbS5fDyRQC6UPVe9JJpn63DvEWYfzGIPg1aoZkv+hzevVDC91v7eubnOnkwbJ6vOlzrPjXnspx63dgB/HAnAfJggN3bsb3vzF3cuVcsC6GPHAoctN4YhbvgkFOhuowEHQpiW3mPLsf1HbYS71qnMKoh0lGi/fJkg/PE60Wk9oQZZQrjnAbMCSwrmLU67Cw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2C003465F9B8F64586AC152E0042355D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 647bda78-ff84-431b-d94b-08d84380495a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZdVZIWgwCfVVkb+HOrHtKaayXAQTP+hsjB5a300fF2ChMrecbAILT8PeMLccLYoexa7IsfHQy5EuI33r83FAote1ROesZPsJKVSMJ5NBP0aD/DUZTenK/xM23DK9DBRBdSPd+UC/GegvZLKlLraru6SjsxYrRNaUNasTLMvq7oNFTdQ2thXZGAcja8frIu1UerOCeSWI72hJLgT0Lx53xQjsFLkmqA36p4iJABJb6p7O1ihe8bIphInFaZQVi64oUluk0RYGi9e/FRrJbXLicUfBXtH9Et6KgJGPMw+GQxxqMr+qPrlSJykS1Nc1MceX6fDnSHPQPEvGlHOTg9ZmpFFdiX56ujghylJg9M2/Tvckm1JMPycd2Yx/a5C0uRNb4pdu15gWkL+kCZfa0g7Dg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(53546011)(356005)(70206006)(2906002)(47076004)(6486002)(36906005)(6506007)(336012)(26005)(70586007)(54906003)(186003)(478600001)(4744005)(5660300002)(8676002)(6512007)(33656002)(2616005)(316002)(4326008)(8936002)(6862004)(36756003)(86362001)(81166007)(82310400002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:09:29.4971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf97e60-7734-4811-4e06-08d8438052ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3497
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



> On 18 Aug 2020, at 15:07, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> Title: s/identifation/identification/

oh yes sorry :-)

>=20
> On 18/08/2020 14:47, Bertrand Marquis wrote:
>> Add MIDR and CPU part numbers for Neoverse N1
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> I can fix the typo on commit:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20

Thanks
Bertrand

> Cheers,
>=20
> --=20
> Julien Grall


