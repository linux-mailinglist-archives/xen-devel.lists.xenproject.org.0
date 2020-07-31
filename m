Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BBA23472A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VQY-0000Tg-HQ; Fri, 31 Jul 2020 13:50:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1VQW-0000Tb-GN
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:50:24 +0000
X-Inumbo-ID: c7841ab4-d334-11ea-abb6-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7841ab4-d334-11ea-abb6-12813bfff9fa;
 Fri, 31 Jul 2020 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaUnDIMDodH8Mw1jCxd8sOaB4OjY03ZR0m3EsXHBgI0=;
 b=90zmv/vDIpRnZ0wohcbhJsB/0ZyxYCSfHgDri3P8QtcXLGLW/gvL7eWWbThOm69ombJgqUD41tmDx+prNlkfQ6U6GrNK84Bj13t7qnHbCwyjNTdzIDwO6/VGJ6g/OhvRLWyQ3twv6cjOD1pVyiTaDKmVllosfLBZioY4ZfH/aWI=
Received: from DB8P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::15)
 by HE1PR0801MB1929.eurprd08.prod.outlook.com (2603:10a6:3:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 13:50:21 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::75) by DB8P191CA0005.outlook.office365.com
 (2603:10a6:10:130::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 13:50:20 +0000
Received: ("Tessian outbound 7de93d801f24:v62");
 Fri, 31 Jul 2020 13:50:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08b1964606a16d39
X-CR-MTA-TID: 64aa7808
Received: from bbd7f401b31f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C7B466D-6918-4F0A-9777-96C3FD26ED6B.1; 
 Fri, 31 Jul 2020 13:50:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbd7f401b31f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 13:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF9bHSA3aJkNCvabwZSY8W6UFRSvtISUmJ5dps0Nq8wOiGlEVtoJRM2WqZZ4Q3hWljhcXZXpe7EzXEkPSPYqGayQzOBL7MgnwvUvLfVnICJe/Nks0T6/IiM4ZJEXat3LvsOGIkpdvkh+uPOuvWfRJ59G2ypYmydjxhBETSUZ5IaniUQYKxvS3GrJ9L/HUzGld3tXVt2K7Hy/QcYs/BD8F8ukbPtBF6kb7GjP6gxnteauHL1n8ueseEaA/7s1aFPewdkoScb18kNcsQnQaDoqOPtpxnyYLqkaC72lHX2ExbPUdvQIeVSVU7jWGKSWOgFALvOdnEeovoVwHUpxmH3fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaUnDIMDodH8Mw1jCxd8sOaB4OjY03ZR0m3EsXHBgI0=;
 b=ER9C5CK48Gk0CJaCKpA/mJDVyH4FqwlKDak+Jti6YCOE3tzEtbcbJ6lCBa1gu7p6Tn53OOUmZLoK7mnN3HatAwr/RvSVCr5jZ7Tg9JKszlQ7I7NOzzz1U/j8w9B49BaUhj8u5zXsIC0eAgDTDB1zqW+bpjIet1M5JKouYxR7bTAkeRSxEWaSHQ/2kqX7Es1NlniQCt5ySrHX0VrJ2h1/co6H70Ajrid2sYJaFSq2whaTUmGkCm4eVQthIAIVPKfdu/PHfJ5SpQ99neafYPKM0G4plcFMyFqfkmMUFkbfCOF+xN220DlLVnEAajhPg+KyAM2uM1Z6DTCs57w93PRCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaUnDIMDodH8Mw1jCxd8sOaB4OjY03ZR0m3EsXHBgI0=;
 b=90zmv/vDIpRnZ0wohcbhJsB/0ZyxYCSfHgDri3P8QtcXLGLW/gvL7eWWbThOm69ombJgqUD41tmDx+prNlkfQ6U6GrNK84Bj13t7qnHbCwyjNTdzIDwO6/VGJ6g/OhvRLWyQ3twv6cjOD1pVyiTaDKmVllosfLBZioY4ZfH/aWI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 13:50:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:50:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: kernel-doc and xen.git
Thread-Topic: kernel-doc and xen.git
Thread-Index: AQHWZhCqcVqKiEQuVU6MZpfTy49dJakhtkiAgAAAnAA=
Date: Fri, 31 Jul 2020 13:50:12 +0000
Message-ID: <7C42E4DC-7887-43A9-8764-648AB8240548@arm.com>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <dc42ea91-a876-0f85-3d99-739d4990d3eb@citrix.com>
In-Reply-To: <dc42ea91-a876-0f85-3d99-739d4990d3eb@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2388126f-1db3-45f5-4ad9-08d83558aa9a
x-ms-traffictypediagnostic: DB7PR08MB3260:|HE1PR0801MB1929:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB19295C68E5414A83E78213259D4E0@HE1PR0801MB1929.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ueNbj//LyNMqvL4cu2V89IE/PJSCKoHkQZml2KWPucKxqVtWHSbADiWJqnWpsM/CkQ/Cp1JXn+Omx6ZgpGlrlUZ9Sq04sMwQLue06DD3zT0+GK72jDGgs8v1vxl0yPTtRrdeg2k4CgXCgBKENRm7xecJm6A+F/gT6uIg1JTSSTHnv99Dp25owfmztEdVZAAwvL5DcjIG3DwOxeMhaBI/oGVhsjo+wlHADK2aRvwriciGA72WN0cZHiM/yXHlLuodLS21oyhZYWo7V+nrMa7u6St8obf5uVruBbuu/96Ly8HTq7r4cgRgC6aRn/PmEYWqJAQPyNi60fuuNMRCHUJBCA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(66446008)(64756008)(8676002)(6486002)(66476007)(186003)(91956017)(26005)(2906002)(36756003)(66946007)(76116006)(66556008)(3480700007)(4326008)(6506007)(8936002)(316002)(5660300002)(86362001)(478600001)(33656002)(83380400001)(53546011)(6916009)(2616005)(54906003)(6512007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xs0rJ3a/d8kXUts4uAO78fk543AcpzKMvC0J2YYzUyh6mCrWhWXZhL8HTFi2U57TVR7T3wzFi+jNaS11EB/4lVmVaz5a0bI77KsBJyVSais1E+mFc/z6CH4ywQ1EHOP7ZCeUxjPYEbYfowEYIVqmcZCUlsmNPo6dCqFc9xs7yPSJlfGtdM/Os9UrNv6iKFh9+Iu2wB75T1D/FmEN+Uu1yHY91aDOwXn5DvokOPgG25+w7EOWEIYSHtvIlmTAg4XWsj98wt4c3zmM+KsuyxVJfk6knwv8DBvGEGca+IQmzJfFkHJG4jsVKrwK62YJ9ttPtzj8j3chze1tIqjTH5A0B+nQ9RNRLpaAvJff23DuBHredGnMtOZpTdRiNe8NnFKvkdgm/UIwXmSPeA6Kt851IVsXQ4P+M49NQVBvZIeSB84RgmPgaKTavG/Gantr/xUSBnwd7EkHWSUg1ztcsPHZNJ0kUVrBrdRXxawjPMrI6YT87D6Twq8WG5/u0fKzC0oJysjp1dr3ttaC4Iwp7lTeYSp+BLyIyI2LUa47+dXw+b+x5opHjMli5S6VMQm2ga2qFYm45B+LCOfRQOdZ9jraJtFWc/ooHSAG/Z+Dp6MeTn9uxHY3bzx6DVYyu9Zsxc0bJ2n9dhPIf3O7hv30OCRSRw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <090DB01F0F017E49980C659B35259B19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ec898d6e-cf68-4b30-235c-08d83558a5ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjAQlnY7cPdeagRHy8DLI9J/Q7bXImMrlY9XG0Xl8fKZIpbM1Z4UOHDpNuqBwkL1Txn7gO40d+9OBN3FaescnVnGRey3FEctrVS2yIQuzhZDN/bkiYvHABrp0pougVqreymGG5q+2KhGhmm66kye5ODRi8rYjkERuJrqmaJRvO1Up0AXPoYxnEMWfnxQh/gSVn2POwH6bkPKuwERjMx3aHAYsMsU8iat9UEFi6jwYbqgY2Q/o+oTBr5cd/cE39g01ssUvRQBh3gfx5pKcZgnIqfblz+7gAc+YUVmWAMrMDMJuUMInKsAezjFDkZTQLldJ+8WKYhsqRW5rr2Ndr74sa15c4jTDH9AxoCz38hF4YqPyBtbIRlVEaWPKQBpDssMFJyEf9i6S9RCyNF7rNIvkQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(36756003)(478600001)(8936002)(3480700007)(83380400001)(6512007)(8676002)(82310400002)(82740400003)(81166007)(4326008)(6862004)(356005)(47076004)(33656002)(2906002)(336012)(186003)(54906003)(6506007)(2616005)(26005)(316002)(5660300002)(53546011)(86362001)(70586007)(70206006)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:50:20.8497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2388126f-1db3-45f5-4ad9-08d83558aa9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1929
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMzEgSnVsIDIwMjAsIGF0IDE1OjQ4LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDMwLzA3LzIwMjAgMDI6MjcsIFN0ZWZh
bm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IEhpIGFsbCwNCj4+IA0KPj4gSSB3b3VsZCBsaWtlIHRv
IGFzayBmb3IgeW91ciBmZWVkYmFjayBvbiB0aGUgYWRvcHRpb24gb2YgdGhlIGtlcm5lbC1kb2MN
Cj4+IGZvcm1hdCBmb3IgaW4tY29kZSBjb21tZW50cy4NCj4+IA0KPj4gSW4gdGhlIEZ1U2EgU0lH
IHdlIGhhdmUgc3RhcnRlZCBsb29raW5nIGludG8gRnVTYSBkb2N1bWVudHMgZm9yIFhlbi4gT25l
DQo+PiBvZiB0aGUgdGhpbmdzIHdlIGFyZSBpbnZlc3RpZ2F0aW5nIGFyZSB3YXlzIHRvIGxpbmsg
dGhlc2UgZG9jdW1lbnRzIHRvDQo+PiBpbi1jb2RlIGNvbW1lbnRzIGluIHhlbi5naXQgYW5kIHZp
Y2UgdmVyc2EuDQo+PiANCj4+IEluIHRoaXMgY29udGV4dCwgQW5kcmV3IENvb3BlciBzdWdnZXN0
ZWQgdG8gaGF2ZSBhIGxvb2sgYXQgImtlcm5lbC1kb2MiDQo+PiBbMV0gZHVyaW5nIG9uZSBvZiB0
aGUgdmlydHVhbCBiZWVyIHNlc3Npb25zIGF0IHRoZSBsYXN0IFhlbiBTdW1taXQuDQo+PiANCj4+
IEkgZGlkIGdpdmUgYSBsb29rIGF0IGtlcm5lbC1kb2MgYW5kIGl0IGlzIHZlcnkgcHJvbWlzaW5n
LiBrZXJuZWwtZG9jIGlzDQo+PiBhIHNjcmlwdCB0aGF0IGNhbiBnZW5lcmF0ZSBuaWNlIHJzdCB0
ZXh0IGRvY3VtZW50cyBmcm9tIGluLWNvZGUNCj4+IGNvbW1lbnRzLiAoVGhlIGdlbmVyYXRlZCBy
c3QgZmlsZXMgY2FuIHRoZW4gYmUgdXNlZCBhcyBpbnB1dCBmb3Igc3BoaW54DQo+PiB0byBnZW5l
cmF0ZSBodG1sIGRvY3MuKSBUaGUgY29tbWVudCBzeW50YXggWzJdIGlzIHNpbXBsZSBhbmQgc2lt
aWxhciB0bw0KPj4gRG94eWdlbjoNCj4+IA0KPj4gICAgLyoqDQo+PiAgICAgKiBmdW5jdGlvbl9u
YW1lKCkgLSBCcmllZiBkZXNjcmlwdGlvbiBvZiBmdW5jdGlvbi4NCj4+ICAgICAqIEBhcmcxOiBE
ZXNjcmliZSB0aGUgZmlyc3QgYXJndW1lbnQuDQo+PiAgICAgKiBAYXJnMjogRGVzY3JpYmUgdGhl
IHNlY29uZCBhcmd1bWVudC4NCj4+ICAgICAqICAgICAgICBPbmUgY2FuIHByb3ZpZGUgbXVsdGlw
bGUgbGluZSBkZXNjcmlwdGlvbnMNCj4+ICAgICAqICAgICAgICBmb3IgYXJndW1lbnRzLg0KPj4g
ICAgICovDQo+PiANCj4+IGtlcm5lbC1kb2MgaXMgYWN0dWFsbHkgYmV0dGVyIHRoYW4gRG94eWdl
biBiZWNhdXNlIGl0IGlzIGEgbXVjaCBzaW1wbGVyDQo+PiB0b29sLCBvbmUgd2UgY291bGQgY3Vz
dG9taXplIHRvIG91ciBuZWVkcyBhbmQgd2l0aCBwcmVkaWN0YWJsZSBvdXRwdXQuDQo+PiBTcGVj
aWZpY2FsbHksIHdlIGNvdWxkIGFkZCB0aGUgdGFnZ2luZywgbnVtYmVyaW5nLCBhbmQgcmVmZXJl
bmNpbmcNCj4+IHJlcXVpcmVkIGJ5IEZ1U2EgcmVxdWlyZW1lbnQgZG9jdW1lbnRzLg0KPj4gDQo+
PiBJIHdvdWxkIGxpa2UgeW91ciBmZWVkYmFjayBvbiB3aGV0aGVyIGl0IHdvdWxkIGJlIGdvb2Qg
dG8gc3RhcnQNCj4+IGNvbnZlcnRpbmcgeGVuLmdpdCBpbi1jb2RlIGNvbW1lbnRzIHRvIHRoZSBr
ZXJuZWwtZG9jIGZvcm1hdCBzbyB0aGF0DQo+PiBwcm9wZXIgZG9jdW1lbnRzIGNhbiBiZSBnZW5l
cmF0ZWQgb3V0IG9mIHRoZW0uIE9uZSBkYXkgd2UgY291bGQgaW1wb3J0DQo+PiBrZXJuZWwtZG9j
IGludG8geGVuLmdpdC9zY3JpcHRzIGFuZCB1c2UgaXQgdG8gZ2VuZXJhdGUgYSBzZXQgb2YgaHRt
bA0KPj4gZG9jdW1lbnRzIHZpYSBzcGhpbnguDQo+PiANCj4+IEF0IGEgbWluaW11bSB3ZSdsbCBu
ZWVkIHRvIHN0YXJ0IHRoZSBpbi1jb2RlIGNvbW1lbnQgYmxvY2tzIHdpdGggdHdvDQo+PiBzdGFy
czoNCj4+IA0KPj4gICAgLyoqDQo+PiANCj4+IFRoZXJlIGNvdWxkIGJlIGFsc28gb3RoZXIgc21h
bGwgY2hhbmdlcyByZXF1aXJlZCB0byBtYWtlIHN1cmUgdGhlIG91dHB1dA0KPj4gaXMgYXBwcm9w
cmlhdGUuDQo+PiANCj4+IA0KPj4gRmVlZGJhY2sgaXMgd2VsY29tZSENCj4gDQo+IEkgdGhpbmsg
aXQgZ29lcyB3aXRob3V0IHNheWluZyB0aGF0IEknbSArMSB0byB0aGlzIGluIHByaW5jaXBsZS4N
Cj4gDQo+IFdlIGRlZmluaXRlbHkgaGF2ZSBzb21lIC8qKiBjb21tZW50cyBhbHJlYWR5LCBidXQg
SSBoYXZlIG5vIGlkZWEgaWYgdGhleQ0KPiBhcmUgdmFsaWQga2VybmVsLWRvYyBvciBub3QuICBJ
dCBzZWVtcyB0aGF0IHRoZSBrZXJuZWwtZG9jIGhhcyBzb21lDQo+IGFiaWxpdHkgdG8gcmVwb3J0
IHdhcm5pbmdzLCBzbyBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgd2hhdCB0aGF0DQo+
IHNwaXRzIG91dC4NCg0KRnJvbSBteSBmaXJzdCBjcmFzaCB0ZXN0LCBub3QgbXVjaCBpcyDigJxr
ZXJuZWwtZG9j4oCdIGZyaWVuZGx5IGJ1dCB0aGUgY29udGVudA0KaXMgdGhlcmUsIGl0IGlzIG9u
bHkgYSBtYXR0ZXIgb2YgZG9pbmcgc29tZSBmb3JtYXR0aW5nLg0KDQo+IA0KPiBJIGFsc28gdGhp
bmsgZ2V0dGluZyByaWQgb2Ygb3VyIGhvbWUtZ3Jvd24gc3ludGF4IGZvciB0aGUgcHVibGljIGhl
YWRlcnMNCj4gd2lsbCBiZSBtYWpvciBpbXByb3ZlbWVudC4gIFdlIGFjdHVhbGx5IGhhdmUgYSBy
ZWFzb25hYmxlIGFtb3VudCBvZg0KPiBhbmNpbGxhcnkgZG9jdW1lbnRhdGlvbg0KPiANCj4gQXMg
d2l0aCBldmVyeXRoaW5nIGVsc2UgaW4gdGhlIFNwaGlueCBkb2NzLCBJJ2QgcmVxdWVzdCB0aGF0
IHdlIGRvbid0DQo+IGp1c3QgYmxpbmRseSB0aHJvdyB0aGlzIGluIGFuZCBjYWxsIGl0IGRvbmUu
ICBXZSBuZWVkIHRvIGN1cmF0ZQ0KPiBhZGRpdGlvbnMgcHJvcGVybHkgdG8gYXZvaWQgdGhlIGRv
Y3MgdHVybmluZyBpbnRvIGEgbWVzcy4gIEknbSBoYXBweSB0bw0KPiBoZWxwIG91dCBpbiBteSBj
b3Bpb3VzIGZyZWUgdGltZS4NCg0KVGhhbmtzIDotKQ0KDQpCZXJ0cmFuZA0KDQo=

