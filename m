Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68C1E7803
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:15:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jea9f-0002f3-5B; Fri, 29 May 2020 08:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jea9d-0002ey-3a
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:14:13 +0000
X-Inumbo-ID: 606a549c-a184-11ea-a87e-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 606a549c-a184-11ea-a87e-12813bfff9fa;
 Fri, 29 May 2020 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59hoZBAK2rB0b8gl3WTDIfJ4A9zFDcZO3/xCm454M2A=;
 b=QtYbl8ip6ZC2NdVHivMzBs+qO6Zr4QGHQSy9poIQ45r54kOJcjCBXxjSct7n7pJQ20Z+2Xcg7yuRigZaEGs/gWpTSUUm8VtrtsQwsOfGCnPXu0DySM/4QASQumrOZpzPweVBtMpQWvKiadnm4LahK7ETQDnm+0+47/OLIXKXa+A=
Received: from AM6P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::22)
 by VI1PR08MB4400.eurprd08.prod.outlook.com (2603:10a6:803:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 08:14:08 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::8e) by AM6P191CA0009.outlook.office365.com
 (2603:10a6:209:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Fri, 29 May 2020 08:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 08:14:08 +0000
Received: ("Tessian outbound 9eabd37e4fee:v57");
 Fri, 29 May 2020 08:14:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07f6684c94e68cd5
X-CR-MTA-TID: 64aa7808
Received: from 1f4d4bfd69a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71E3942B-750D-478F-98CD-5047EA84ADB8.1; 
 Fri, 29 May 2020 08:14:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f4d4bfd69a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 08:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3LS4vsRObt0zMIgde9IaM45mu8NWlAo4K2u2Tu7i5AGXHGcVgIkswobXF14oTorDPVVTrHX2GuKpuYCZXD5h2VjP8NaWpCEhuxFxTFdMPol5DP4O7SnVtPPSmPwrOS9B2P9OSzVLdwJkm/LdCgno5ZD8DxM/J9Mtt+Yq1C4uleMJgeJuW9zTAm7ACHsd/QPwFX6J+72n/SzQ8IJmfyNhtk3Sb8WcC0WJCHr/sx517CLxi/3XxATbHw+8PBaxyul9xF27D6eANnNriK7DyCXTHQ86ylKHl5coHEqm3oKSL289aWImRKeWPOme/qrZrLzSxF/MgdIk5AEEyr4ql+8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59hoZBAK2rB0b8gl3WTDIfJ4A9zFDcZO3/xCm454M2A=;
 b=FAxb3Zi2FLgNAeO5nCtKjz7Qvynsgp59ilF5rNIcKLM4GaqczcWvawFfzJ/qO+itOGhZd/Drs4PNtEXRJJbKgJNCpWYyF8mzlOsq76fmPMcr0mJTrhjtiaw8R9xFFPN98nnIoCvNJj0MBE3YiEhu1iiXbP5EwkGtMewnzdeWMVqWih0sT9f/7gTlICLJSBmCPkDa4EdSFrigpbvtu61gXur0VuafXR/a/ZZUJdoXHtCBe7I64VWYoBd8BU4tb6Y6lJqALFCo+nh/adKYmt9nWjpSqYy8Tgi1rVBXQoMzhePqRbnQa+uzIXFTKNOIR7LNQbhaVfLncy2cJbE1aQ36nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59hoZBAK2rB0b8gl3WTDIfJ4A9zFDcZO3/xCm454M2A=;
 b=QtYbl8ip6ZC2NdVHivMzBs+qO6Zr4QGHQSy9poIQ45r54kOJcjCBXxjSct7n7pJQ20Z+2Xcg7yuRigZaEGs/gWpTSUUm8VtrtsQwsOfGCnPXu0DySM/4QASQumrOZpzPweVBtMpQWvKiadnm4LahK7ETQDnm+0+47/OLIXKXa+A=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3003.eurprd08.prod.outlook.com (2603:10a6:5:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 08:13:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:13:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADfWQA=
Date: Fri, 29 May 2020 08:13:58 +0000
Message-ID: <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
In-Reply-To: <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afd9fb9a-7e5e-4d31-fb27-08d803a842eb
x-ms-traffictypediagnostic: DB7PR08MB3003:|VI1PR08MB4400:
X-Microsoft-Antispam-PRVS: <VI1PR08MB440064E954E6B9EB031603E89D8F0@VI1PR08MB4400.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: immARdMgT12JxKrNwOuzJ3NdQuZZH4kXPL4GEghpcjWHcPdzzr1kBoaOlx98Jwc6pzNpXH40DdAx5Nj2sJuSbdk23iuBgNatHcKsm188iXCqKJ+CHWnuVO+/T/WNI8enBB2k95n/ZXsSIToiraDUwFN+m9eEODh6LgO4hqMdDEynX7w7TezLV3oFoyQaE/JoIK8OVOsJhOwpfG75+6UmfFbzTmMuNnGUKNc0BXAQrLMiMLT5J+1FotiKwywTO7hGk3qcal3y4n0PnlKSy5SyYeYu/ITw8KvWwjgIGIJq2ngcpEIr4/HCC8bgGJNSmpUK+LIedE0MNQAk2bpGi652E8+SwZcExqo2d7UFBeTEnf9ueqLSwwPtYZAd70FZ4DtS
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(478600001)(26005)(4326008)(6512007)(54906003)(8676002)(8936002)(71200400001)(2616005)(316002)(186003)(6916009)(6506007)(53546011)(33656002)(86362001)(2906002)(83380400001)(66946007)(6486002)(76116006)(66556008)(91956017)(5660300002)(7416002)(64756008)(66446008)(66476007)(36756003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lFm75CrLAFE+DESr4SUkN/zEIcsGRqnFbKeHu/1Kk1BpG/2jMS89YfIa26/QqH5t2CElXUuVYgO3EFNbJLJbuizSLshLTOAr+LLWZsMYd0p/U87t8HwV7FmDilaTooCJpm+OchZX0j5CG/Q9FPP8DIEliFci78EY1h80r3IhsRdx7NdCXRDEFCY5Oljmu2aDF5IdBoMY/wqxkt/MlL/+kic3+EzyXbh4VWGhH8A9R7secBryK50RfQDAhCjPYw7jEszkGpoIu2HcPqloDhFSuNA4kqymArrUFZBs3TxtwKxo3c9rw3Q5eSpKmSfnKUpwU7JBo++zNbcI72ZORvpvnkkY6OgUzIgBKzdtPpgPcQlBVn3CaJNX2vRyWfQ6r7cyqkulmKHu0WGEQxFVzu+VvkNmkwvYp+wpne6AusVQrdpaVs4UrHJhk6JU0KLVaC5H3d0RYNwdIGjeidTSbnvGsT0JBnTY+ZytAyyndFpkVxYTcIKOgumnop5Zlr58Xd+Q
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <87638ED74B9B0C4F87ABDF00161B35BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3003
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(6512007)(47076004)(83380400001)(26005)(186003)(86362001)(4326008)(336012)(81166007)(53546011)(6862004)(6506007)(82310400002)(33656002)(82740400003)(8936002)(356005)(36906005)(36756003)(8676002)(2616005)(316002)(54906003)(5660300002)(6486002)(70586007)(2906002)(70206006)(478600001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 09c794e1-ce42-4155-fa6c-08d803a83d6d
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6B9No99P3TBIfNPZa8+7v2eR/XeOjXBWnr6rUNeWnedYEx+5SGMYZPltgIGvl5JvtcgTICnd/aRUCx4cqZvepgMpNH8nTq5bRJ1IQxg1vcZBXgObw4lCokvG/V/94kfv5+gSSM5I26Gm1KSqD1uwxH8iG09rmoHLJbdcMS+N2wf5cJNIj9lpfESJlwkj+6byDD+7gIR9hjM59jBovklw0Q0I4CPUz9nZ1u2wwz0pS0vV3jyeruiTkyI9T8VeTfvVmaT+BggqIL5cGzi3MgP9YDOGbxFsW6CRTb0YYRvtL4Yl7J2LsVwHpvNgV09imZVOwd7zrqBV3pTICsQJlB5PbV/T3sEsIXCsTHGKDxd42mI44Pt0m6q4Tvx4wRCs9HYZ0wh51hgPuSPXWeJpByms025qz1XzpSa252YOTdu7wI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:14:08.4286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd9fb9a-7e5e-4d31-fb27-08d803a842eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4400
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IE1heSAyMDIwLCBhdCAxOTo1NCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gMjgvMDUvMjAyMCAxNjoyNSwgQmVydHJhbmQgTWFy
cXVpcyB3cm90ZToNCj4+IEF0IHRoZSBtb21lbnQgb24gQXJtLCBhIExpbnV4IGd1ZXN0IHJ1bm5p
bmcgd2l0aCBLVFBJIGVuYWJsZWQgd2lsbA0KPj4gY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3
aGVuIGEgY29udGV4dCBzd2l0Y2ggaGFwcGVucyBpbiB1c2VyIG1vZGU6DQo+PiAoWEVOKSBwMm0u
YzoxODkwOiBkMXYwOiBGYWlsZWQgdG8gd2FsayBwYWdlLXRhYmxlIHZhIDB4ZmZmZmZmODM3ZWJl
MGNkMA0KPj4gVGhpcyBwYXRjaCBpcyBtb2RpZnlpbmcgcnVuc3RhdGUgaGFuZGxpbmcgdG8gbWFw
IHRoZSBhcmVhIGdpdmVuIGJ5IHRoZQ0KPj4gZ3Vlc3QgaW5zaWRlIFhlbiBkdXJpbmcgdGhlIGh5
cGVyY2FsbC4NCj4+IFRoaXMgaXMgcmVtb3ZpbmcgdGhlIGd1ZXN0IHZpcnR1YWwgdG8gcGh5c2lj
YWwgY29udmVyc2lvbiBkdXJpbmcgY29udGV4dA0KPj4gc3dpdGNoZXMgd2hpY2ggcmVtb3ZlcyB0
aGUgYnVnDQo+IA0KPiBJdCB3b3VsZCBiZSBnb29kIHRvIHNwZWxsIG91dCB0aGF0IGEgdmlydHVh
bCBhZGRyZXNzIGlzIG5vdCBzdGFibGUuIFNvIHJlbHlpbmcgb24gaXQgaXMgd3JvbmcuDQo+IA0K
Pj4gYW5kIGltcHJvdmUgcGVyZm9ybWFuY2UgYnkgcHJldmVudGluZyB0bw0KPj4gd2FsayBwYWdl
IHRhYmxlcyBkdXJpbmcgY29udGV4dCBzd2l0Y2hlcy4NCj4gDQo+IFdpdGggU2VjcmV0IGZyZWUg
aHlwZXJ2aXNvciBpbiBtaW5kLCBJIHdvdWxkIGxpa2UgdG8gc3VnZ2VzdCB0byBtYXAvdW5tYXAg
dGhlIHJ1bnN0YXRlIGR1cmluZyBjb250ZXh0IHN3aXRjaC4NCj4gDQo+IFRoZSBjb3N0IHNob3Vs
ZCBiZSBtaW5pbWFsIHdoZW4gdGhlcmUgaXMgYSBkaXJlY3QgbWFwIChpLmUgb24gQXJtNjQgYW5k
IHg4NikgYW5kIHN0aWxsIHByb3ZpZGUgYmV0dGVyIHBlcmZvcm1hbmNlIG9uIEFybTMyLg0KDQpF
dmVuIHdpdGggYSBtaW5pbWFsIGNvc3QgdGhpcyBpcyBzdGlsbCBhZGRpbmcgc29tZSBub24gcmVh
bC10aW1lIGJlaGF2aW91ciB0byB0aGUgY29udGV4dCBzd2l0Y2guDQpCdXQgZGVmaW5pdGVseSBm
cm9tIHRoZSBzZWN1cml0eSBwb2ludCBvZiB2aWV3IGFzIHdlIGhhdmUgdG8gbWFwIGEgcGFnZSBm
cm9tIHRoZSBndWVzdCwgd2UgY291bGQgaGF2ZSBhY2Nlc3NpYmxlIGluIFhlbiBzb21lIGRhdGEg
dGhhdCBzaG91bGQgbm90IGJlIHRoZXJlLg0KVGhlcmUgaXMgYSB0cmFkZSBoZXJlIHdoZXJlOg0K
LSB4ZW4gY2FuIHByb3RlY3QgYnkgbWFwL3VubWFwcGluZw0KLSBhIGd1ZXN0IHdoaWNoIHdhbnRz
IHRvIHNlY3VyZSBoaXMgZGF0YSBzaG91bGQgZWl0aGVyIG5vdCB1c2UgaXQgb3IgbWFrZSBzdXJl
IHRoZXJlIGlzIG5vdGhpbmcgZWxzZSBpbiB0aGUgcGFnZQ0KDQpUaGF0IHNvdW5kcyBsaWtlIGEg
dGhyZWFkIGxvY2FsIHN0b3JhZ2Uga2luZCBvZiBwcm9ibGVtYXRpYyB3aGVyZSB3ZSB3YW50IGRh
dGEgZnJvbSB4ZW4gdG8gYmUgYWNjZXNzaWJsZSBmYXN0IGZyb20gdGhlIGd1ZXN0IGFuZCBlYXN5
IHRvIGJlIG1vZGlmaWVkIGZyb20geGVuLg0KDQo+IA0KPiBUaGUgY2hhbmdlIHNob3VsZCBiZSBt
aW5pbWFsIGNvbXBhcmUgdG8gdGhlIGN1cnJlbnQgYXBwcm9hY2ggYnV0IHRoaXMgY291bGQgYmUg
dGFrZW4gY2FyZSBzZXBhcmF0ZWx5IGlmIHlvdSBkb24ndCBoYXZlIHRpbWUuDQoNCkkgY291bGQg
YWRkIHRoYXQgdG8gdGhlIHNlcmllIGluIGEgc2VwYXJhdGUgcGF0Y2ggc28gdGhhdCBpdCBjYW4g
YmUgZGlzY3Vzc2VkIGFuZCB0ZXN0IHNlcGFyYXRlbHkgPw0KDQo+IA0KPj4gLS0NCj4+IEluIHRo
ZSBjdXJyZW50IHN0YXR1cywgdGhpcyBwYXRjaCBpcyBvbmx5IHdvcmtpbmcgb24gQXJtIGFuZCBu
ZWVkcyB0bw0KPj4gYmUgZml4ZWQgb24gWDg2IChzZWUgI2Vycm9yIG9uIGRvbWFpbi5jIGZvciBt
aXNzaW5nIGdldF9wYWdlX2Zyb21fZ3ZhKS4NCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1h
cnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2Fy
bS9kb21haW4uYyAgIHwgMzIgKysrKysrKysrLS0tLS0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgIHwgNTEgKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4gIHhlbi9jb21tb24vZG9t
YWluLmMgICAgIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDExICsrKystLQ0KPj4gIDQgZmlsZXMgY2hh
bmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQ0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gaW5kZXgg
MzExNjkzMjZiMi4uNzk5YjBlMDEwMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21h
aW4uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBAQCAtMjc4LDMzICsyNzgs
MzcgQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfdG8oc3RydWN0IHZjcHUgKm4pDQo+PiAgLyog
VXBkYXRlIHBlci1WQ1BVIGd1ZXN0IHJ1bnN0YXRlIHNoYXJlZCBtZW1vcnkgYXJlYSAoaWYgcmVn
aXN0ZXJlZCkuICovDQo+PiAgc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0
IHZjcHUgKnYpDQo+PiAgew0KPj4gLSAgICB2b2lkIF9fdXNlciAqZ3Vlc3RfaGFuZGxlID0gTlVM
TDsNCj4+IC0gICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyBydW5zdGF0ZTsNCj4+ICsgICAg
c3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGU7DQo+PiAgLSAgICBpZiAoIGd1ZXN0
X2hhbmRsZV9pc19udWxsKHJ1bnN0YXRlX2d1ZXN0KHYpKSApDQo+PiArICAgIC8qIFhYWCB3aHkg
ZG8gd2UgYWNjZXB0IG5vdCB0byBibG9jayBoZXJlICovDQo+PiArICAgIGlmICggIXNwaW5fdHJ5
bG9jaygmdi0+cnVuc3RhdGVfZ3Vlc3RfbG9jaykgKQ0KPj4gICAgICAgICAgcmV0dXJuOw0KPj4g
IC0gICAgbWVtY3B5KCZydW5zdGF0ZSwgJnYtPnJ1bnN0YXRlLCBzaXplb2YocnVuc3RhdGUpKTsN
Cj4+ICsgICAgcnVuc3RhdGUgPSBydW5zdGF0ZV9ndWVzdCh2KTsNCj4+ICsNCj4+ICsgICAgaWYg
KHJ1bnN0YXRlID09IE5VTEwpDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZ2
LT5ydW5zdGF0ZV9ndWVzdF9sb2NrKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0K
Pj4gICAgICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBkYXRlX2ZsYWcp
ICkNCj4+ICAgICAgew0KPj4gLSAgICAgICAgZ3Vlc3RfaGFuZGxlID0gJnYtPnJ1bnN0YXRlX2d1
ZXN0LnAtPnN0YXRlX2VudHJ5X3RpbWUgKyAxOw0KPj4gLSAgICAgICAgZ3Vlc3RfaGFuZGxlLS07
DQo+PiAtICAgICAgICBydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIHw9IFhFTl9SVU5TVEFURV9V
UERBVEU7DQo+PiAtICAgICAgICBfX3Jhd19jb3B5X3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZSwNCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikoJnJ1bnN0YXRlLnN0YXRlX2Vu
dHJ5X3RpbWUgKyAxKSAtIDEsIDEpOw0KPj4gKyAgICAgICAgcnVuc3RhdGUtPnN0YXRlX2VudHJ5
X3RpbWUgfD0gWEVOX1JVTlNUQVRFX1VQREFURTsNCj4+ICAgICAgICAgIHNtcF93bWIoKTsNCj4g
DQo+IEJlY2F1c2UgeW91IHNldCB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIGJlbG93LCB0
aGUgcGxhY2VtZW50IG9mIHRoZSBiYXJyaWVyIHNlZW1zIGEgYml0IG9kZC4NCj4gDQo+IEkgd291
bGQgc3VnZ2VzdCB0byB1cGRhdGUgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSBmaXJzdCBh
bmQgdGhlbiB1cGRhdGUgcnVuc3RhdGUtPnN0YXRlX2VudHJ5X3RpbWUuDQoNCldlIGRvIHdhbnQg
dGhlIGd1ZXN0IHRvIGtub3cgd2hlbiB3ZSBtb2RpZnkgdGhlIHJ1bnN0YXRlIHNvIHdlIG5lZWQg
dG8gbWFrZSBzdXJlIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFIGlzIGFjdHVhbGx5IHNldCBpbiBh
IHZpc2libGUgd2F5IGJlZm9yZSB3ZSBkbyB0aGUgbWVtY3B5Lg0KVGhhdOKAmXMgd2h5IHRoZSBi
YXJyaWVyIGlzIGFmdGVyLg0KDQo+IA0KPj4gKyAgICAgICAgdi0+cnVuc3RhdGUuc3RhdGVfZW50
cnlfdGltZSB8PSBYRU5fUlVOU1RBVEVfVVBEQVRFOw0KPj4gICAgICB9DQo+PiAgLSAgICBfX2Nv
cHlfdG9fZ3Vlc3QocnVuc3RhdGVfZ3Vlc3QodiksICZydW5zdGF0ZSwgMSk7DQo+PiArICAgIG1l
bWNweShydW5zdGF0ZSwgJnYtPnJ1bnN0YXRlLCBzaXplb2Yodi0+cnVuc3RhdGUpKTsNCj4+ICAt
ICAgIGlmICggZ3Vlc3RfaGFuZGxlICkNCj4+ICsgICAgaWYgKCBWTV9BU1NJU1Qodi0+ZG9tYWlu
LCBydW5zdGF0ZV91cGRhdGVfZmxhZykgKQ0KPj4gICAgICB7DQo+PiAtICAgICAgICBydW5zdGF0
ZS5zdGF0ZV9lbnRyeV90aW1lICY9IH5YRU5fUlVOU1RBVEVfVVBEQVRFOw0KPj4gKyAgICAgICAg
cnVuc3RhdGUtPnN0YXRlX2VudHJ5X3RpbWUgJj0gflhFTl9SVU5TVEFURV9VUERBVEU7DQo+PiAg
ICAgICAgICBzbXBfd21iKCk7DQo+IA0KPiBZb3Ugd2FudCB0byB1cGRhdGUgcnVuc3RhdGUtPnN0
YXRlX2VudHJ5X3RpbWUgYWZ0ZXIgdGhlIGJhcnJpZXIgbm90IGJlZm9yZS4NCkFncmVlDQoNCj4g
DQo+PiAgc3RhdGljIHZvaWQgX3VwZGF0ZV9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2Y3B1ICp2KQ0K
Pj4gIHsNCj4+ICsgICAgLyogWFhYOiB0aGlzIHNob3VsZCBiZSByZW1vdmVkICovDQo+PiAgICAg
IGlmICggIXVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHYpICYmIGlzX3B2X3ZjcHUodikgJiYNCj4+ICAg
ICAgICAgICAhKHYtPmFyY2guZmxhZ3MgJiBURl9rZXJuZWxfbW9kZSkgKQ0KPj4gICAgICAgICAg
di0+YXJjaC5wdi5uZWVkX3VwZGF0ZV9ydW5zdGF0ZV9hcmVhID0gMTsNCj4+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gaW5kZXggN2Nj
OTUyNjEzOS4uYWNjNmY5MGJhMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IEBAIC0xNjEsNiArMTYxLDcgQEAgc3Ry
dWN0IHZjcHUgKnZjcHVfY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2Y3B1
X2lkKQ0KPj4gICAgICB2LT5kaXJ0eV9jcHUgPSBWQ1BVX0NQVV9DTEVBTjsNCj4+ICAgICAgICBz
cGluX2xvY2tfaW5pdCgmdi0+dmlycV9sb2NrKTsNCj4+ICsgICAgc3Bpbl9sb2NrX2luaXQoJnYt
PnJ1bnN0YXRlX2d1ZXN0X2xvY2spOw0KPj4gICAgICAgIHRhc2tsZXRfaW5pdCgmdi0+Y29udGlu
dWVfaHlwZXJjYWxsX3Rhc2tsZXQsIE5VTEwsIE5VTEwpOw0KPj4gIEBAIC02OTEsNiArNjkyLDY2
IEBAIGludCByY3VfbG9ja19saXZlX3JlbW90ZV9kb21haW5fYnlfaWQoZG9taWRfdCBkb20sIHN0
cnVjdCBkb21haW4gKipkKQ0KPj4gICAgICByZXR1cm4gMDsNCj4+ICB9DQo+PiAgK3N0YXRpYyB2
b2lkICB1bm1hcF9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgbG9j
aykNCj4gDQo+IE5JVDogVGhlcmUgaXMgYW4gZXh0cmEgc3BhY2UgYWZ0ZXIgdm9pZA0KPiANCj4g
QWxzbywgQUZBSUNULCB0aGUgbG9jayBpcyBvbmx5IHRha2luZyB0d28gdmFsdWVzLiBQbGVhc2Ug
c3dpdGNoIHRvIGEgYm9vbC4NCg0KQWdyZWUNCg0KPiANCj4+ICt7DQo+PiArICAgIG1mbl90IG1m
bjsNCj4+ICsNCj4+ICsgICAgaWYgKCAhIHJ1bnN0YXRlX2d1ZXN0KHYpICkNCj4gDQo+IE5JVDog
V2UgZG9uJ3QgdXN1YWxseSBwdXQgYSBzcGFjZSBhZnRlciAhLg0KPiANCj4gQnV0IHNob3VsZG4n
dCB0aGlzIGJlIGNoZWNrZWQgd2l0aGluIHRoZSBsb2NrPw0KDQpBZ3JlZQ0KDQo+IA0KPiANCj4+
ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+ICsgICAgaWYgKGxvY2spDQo+IA0KPiBOSVQ6IGlm
ICggLi4uICkNCj4gDQoNCkFjaw0KDQo+PiArICAgICAgICBzcGluX2xvY2soJnYtPnJ1bnN0YXRl
X2d1ZXN0X2xvY2spOw0KPj4gKw0KPj4gKyAgICBtZm4gPSBkb21haW5fcGFnZV9tYXBfdG9fbWZu
KHJ1bnN0YXRlX2d1ZXN0KHYpKTsNCj4+ICsNCj4+ICsgICAgdW5tYXBfZG9tYWluX3BhZ2VfZ2xv
YmFsKCh2b2lkICopDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICgodW5zaWduZWQg
bG9uZyl2LT5ydW5zdGF0ZV9ndWVzdCAmDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQUdFX01BU0spKTsNCj4+ICsNCj4+ICsgICAgcHV0X3BhZ2VfYW5kX3R5cGUobWZuX3RvX3Bh
Z2UobWZuKSk7DQo+PiArICAgIHJ1bnN0YXRlX2d1ZXN0KHYpID0gTlVMTDsNCj4+ICsNCj4+ICsg
ICAgaWYgKGxvY2spDQo+IA0KPiBEaXR0by4NCg0KQWNrDQoNCj4gDQo+PiArICAgICAgICBzcGlu
X3VubG9jaygmdi0+cnVuc3RhdGVfZ3Vlc3RfbG9jayk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRp
YyBpbnQgbWFwX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYsDQo+PiArICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgdmNwdV9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYSAqYXJlYSkN
Cj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gYXJlYS0+YWRkci5wICYgflBB
R0VfTUFTSzsNCj4+ICsgICAgdm9pZCAqbWFwcGluZzsNCj4+ICsgICAgc3RydWN0IHBhZ2VfaW5m
byAqcGFnZTsNCj4+ICsgICAgc2l6ZV90IHNpemUgPSBzaXplb2Yoc3RydWN0IHZjcHVfcnVuc3Rh
dGVfaW5mbyk7DQo+PiArDQo+PiArICAgIEFTU0VSVChydW5zdGF0ZV9ndWVzdCh2KSA9PSBOVUxM
KTsNCj4+ICsNCj4+ICsgICAgLyogZG8gbm90IGFsbG93IGFuIGFyZWEgY3Jvc3NpbmcgMiBwYWdl
cyAqLw0KPj4gKyAgICBpZiAoIG9mZnNldCA+IChQQUdFX1NJWkUgLSBzaXplKSApDQo+PiArICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFRoaXMgaXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3Ig
Zm9yIHRoZSBndWVzdC4gSWYgd2UgYXJlIGdvaW5nIGZvcndhcmQgd2l0aCB0aGlzLCB0aGlzIHdp
bGwgd2FudCBhIHNlcGFyYXRlIHBhdGNoIHdpdGggaXRzIG93biBleHBsYW5hdGlvbiB3aHkgdGhp
cyBpcyBkb25lLg0KDQpBY2sgSSBuZWVkIHRvIGFkZCBzdXBwb3J0IGZvciBhbiBhcmVhIGNyb3Nz
aW5nIHBhZ2VzDQoNCj4gDQo+PiArDQo+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+ICsgICAgcGFn
ZSA9IGdldF9wYWdlX2Zyb21fZ3ZhKHYsIGFyZWEtPmFkZHIucCwgR1YyTV9XUklURSk7DQo+IA0K
PiBBIGd1ZXN0IGlzIGFsbG93ZWQgdG8gc2V0dXAgdGhlIHJ1bnN0YXRlIGZvciBhIGRpZmZlcmVu
dCB2Q1BVIHRoYW4gdGhlIGN1cnJlbnQgb25lLiBUaGlzIHdpbGwgbGVhZCB0byBnZXRfcGFnZV9m
cm9tX2d2YSgpIHRvIGZhaWwgYXMgdGhlIGZ1bmN0aW9uIGNhbm5vdCB5ZXQgd29yayB3aXRoIGEg
dkNQVSBvdGhlciB0aGFuIGN1cnJlbnQuDQoNCklmIHRoZSBhcmVhIGlzIG1hcHBlZCBwZXIgY3B1
IGJ1dCBpc27igJl0IHRoZSBhaW0gb2YgdGhpcyB0byBoYXZlIGEgd2F5IHRvIGNoZWNrIG90aGVy
IGNwdXMgc3RhdHVzID8NCg0KPiANCj4gQUZBSUNULCB0aGVyZSBpcyBubyByZXN0cmljdGlvbiBv
biB3aGVuIHRoZSBydW5zdGF0ZSBoeXBlcmNhbGwgY2FuIGJlIGNhbGxlZC4gU28gdGhpcyBjYW4g
ZXZlbiBiZSBjYWxsZWQgYmVmb3JlIHRoZSB2Q1BVIGlzIGJyb3VnaHQgdXAuDQoNCkkgdW5kZXJz
dGFuZCB0aGUgcmVtYXJrIGJ1dCBpdCBzdGlsbCBmZWVscyB2ZXJ5IHdlaXJkIHRvIGFsbG93IGFu
IGludmFsaWQgYWRkcmVzcyBpbiBhbiBoeXBlcmNhbGwuDQpXb3VsZG7igJl0IHdlIGhhdmUgYSBs
b3Qgb2YgcG90ZW50aWFsIGlzc3VlcyBhY2NlcHRpbmcgYW4gYWRkcmVzcyB0aGF0IHdlIGNhbm5v
dCBjaGVjayA/DQoNCg0KPiANCj4gSSB3YXMgZ29pbmcgdG8gc3VnZ2VzdCB0byB1c2UgdGhlIGN1
cnJlbnQgdkNQVSBmb3IgdHJhbnNsYXRpbmcgdGhlIGFkZHJlc3MuIEhvd2V2ZXIsIGl0IHdvdWxk
IGJlIHJlYXNvbmFibGUgZm9yIGFuIE9TIHRvIHVzZSB0aGUgc2FtZSB2aXJ0dWFsIGFkZHJlc3Mg
Zm9yIGFsbCB0aGUgdkNQVXMgYXNzdW1pbmcgdGhlIHBhZ2UtdGFibGVzIGFyZSBkaWZmZXJlbnQg
cGVyIHZDUFUuDQo+IA0KPiBSZWNlbnQgTGludXggYXJlIHVzaW5nIGEgcGVyLWNwdSBhcmVhLCBz
byB0aGUgdmlydHVhbCBhZGRyZXNzIHNob3VsZCBiZSBkaWZmZXJlbnQgZm9yIGVhY2ggdkNQVS4g
QnV0IEkgZG9uJ3Qga25vdyBob3cgdGhlIG90aGVyIE9TZXMgd29ya3MuIFJvZ2VyIHNob3VsZCBi
ZSBhYmxlIHRvIGhlbHAgZm9yIEZyZWVCU0QgYXQgbGVhc3QuDQo+IA0KPiBJIGhhdmUgQ0NlZCBQ
YXVsIGZvciB0aGUgV2luZG93cyBkcml2ZXJzLg0KPiANCj4gSWYgd2UgZGVjaWRlIHRvIGludHJv
ZHVjZSBzb21lIHJlc3RyaWN0aW9uIHRoZW4gdGhleSBzaG91bGQgYmUgZXhwbGFpbmVkIGluIHRo
ZSBjb21taXQgbWVzc2FnZSBhbmQgYWxzbyBkb2N1bWVudGVkIGluIHRoZSBwdWJsaWMgaGVhZGVy
ICh3ZSBoYXZlIGJlZW4gcHJldHR5IGJhZCBhdCBkb2N1bWVudGluZyBjaGFuZ2UgaW4gdGhlIHBh
c3QhKS4NCg0KQWdyZWUNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

