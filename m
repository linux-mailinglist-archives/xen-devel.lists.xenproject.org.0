Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2BA24CD5E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 07:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8zsg-0007OT-KD; Fri, 21 Aug 2020 05:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=75zu=B7=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1k8zsf-0007N5-29
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 05:46:25 +0000
X-Inumbo-ID: d2d56e27-69f7-4cdc-9268-aacc009d7fdb
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d56e27-69f7-4cdc-9268-aacc009d7fdb;
 Fri, 21 Aug 2020 05:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByHW+tbO5O1mB4jJAHc/BbCyBMYxzNLs8D4Nouin0N0=;
 b=uYSZDAnPUk2LF7/EbQYK0pV8IT40siPzHrNvMQcJpvc9QepUhcR2X2NVuJGWsJAgmIi12kGUIoOp1kiOHGKUran8QkOGixVrYvEOA5csjMnEH6zjqZ0JFIjGFY2d+03QB2CgKLIIJo5R31u+GqESFZevGnp9wBtr8GHjzgimLLU=
Received: from DB6PR0802CA0033.eurprd08.prod.outlook.com (2603:10a6:4:a3::19)
 by AM0PR08MB5105.eurprd08.prod.outlook.com (2603:10a6:208:15b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 05:46:20 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3::4) by DB6PR0802CA0033.outlook.office365.com
 (2603:10a6:4:a3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Fri, 21 Aug 2020 05:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 05:46:20 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Fri, 21 Aug 2020 05:46:20 +0000
X-CR-MTA-TID: 64aa7808
Received: from 1f64c02ffd5f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35E197F3-F020-4B94-ABA6-4FB5EB363A22.1; 
 Fri, 21 Aug 2020 05:46:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f64c02ffd5f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Aug 2020 05:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuPWXe4lB7IE9pkFkuamv9n5TaMhD2R7muQ/R++QUi0moAXkmtYhW3FCd5LQor1+c3x9dW00SWdMH2bAhLBNZpH6hpyZq2vM92sQIk9wc6L5kjuF6MVSpIquiLzkM3AcymEcl6sWXOYp9Zcw4aLEZsatRikMoveLq1HxrNELUvYhd4jJk/UM5ECFYFhoksxlVBCHcjh09cu3qQpzfqZBVGz2UfL27xqjSWzRAY4KuX3qKmg1EQdHsyKvCyHbqGcttFHUtyS9piIUPt2nJBmZPuXDZQn7Q3c7Z3l0Jr26PlTzJA7mf961kCS8w0nanVtiigJLbkcYI44r9b5Uox6NFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByHW+tbO5O1mB4jJAHc/BbCyBMYxzNLs8D4Nouin0N0=;
 b=TQBMe0oxULVhYcXnb1lIKlj4NekpQE1nbCDe1KHN4guPZyCrzM4W4OFi2Y9Gx0Px6ieL2GOfQheQBsOLqixaocOk9xbe1tPeV8arqFASd5uwLJQrogpvE6Wlyv9KykXqrF6jb8pNhGu+zdSf/1sur8RVOGldN/dmdRX26gy5EUfsqCad5M2wYIPPl3ledsMAFhhhLxrNAPovnmrSL7XuY6hu0x4GWedUFJKjm6pumgNiwvsiJAbeXdqvYEhMmlWyvmxA2cKmuoc0utPVMRKZt/MgXXWSKzJimfy242ujJzUowzDBYEnZhBAsh8Ik22gTzuz6mpPtpxHJAqVqsbbndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByHW+tbO5O1mB4jJAHc/BbCyBMYxzNLs8D4Nouin0N0=;
 b=uYSZDAnPUk2LF7/EbQYK0pV8IT40siPzHrNvMQcJpvc9QepUhcR2X2NVuJGWsJAgmIi12kGUIoOp1kiOHGKUran8QkOGixVrYvEOA5csjMnEH6zjqZ0JFIjGFY2d+03QB2CgKLIIJo5R31u+GqESFZevGnp9wBtr8GHjzgimLLU=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM4PR08MB2628.eurprd08.prod.outlook.com (2603:10a6:205:c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 05:46:13 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::60e0:726f:fcef:2be6%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 05:46:13 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Steve Capper <Steve.Capper@arm.com>, Kaly Xin
 <Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Topic: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Index: AQHWdQ1DU6QzTrGCRkmVmocCo7wV0qk9oBCAgARr4uA=
Date: Fri, 21 Aug 2020 05:46:12 +0000
Message-ID: <AM0PR08MB3747C5FAB024A65020883D9A9E5B0@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <bc3088eb-bb21-bea2-7e24-3a335046525a@xen.org>
In-Reply-To: <bc3088eb-bb21-bea2-7e24-3a335046525a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: FD1628520FC7F540858C0B96BC63A227.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed189f8c-7cb1-481e-fa0f-08d8459587c4
x-ms-traffictypediagnostic: AM4PR08MB2628:|AM0PR08MB5105:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5105C04A54C10D354DE815369E5B0@AM0PR08MB5105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ykoOvz8KKHqVt8BAipmD/1K8h1ApzRED2zC19T1NjFEkceRfWGswZpvZANrJg0T/QPLvWB2OP/4XHXMeowVaTUc0o/dsWeOQga5uxfN9IIOTscVs2QraODqVhv7zdZAdpuiNcNKxLXNBlXg6XMJsFbfyozBTCTYZ5QdaJUpuWUD+Tm6eHk1S2/7C8nQtzKINj4sMccAkU5bOODETuxsYeThNqQGza32mT/UXllVZOYocmWZmflS7m1hFuwx5vvf+PbJSGEpPrbfSxzK4VE80QcJNHQm26MlfDRS40sLchjI2a6Ck54/46HKZkQLmVmeGOuG2WvtFjSRjQfUh0FLsgw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3747.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(6506007)(26005)(4326008)(316002)(71200400001)(33656002)(66556008)(66946007)(5660300002)(478600001)(66446008)(64756008)(76116006)(86362001)(53546011)(55016002)(83380400001)(8676002)(66476007)(2906002)(54906003)(8936002)(110136005)(9686003)(52536014)(186003)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Xv77of9FKqVIfQ0qbF/Cgo1B0F5amDzeygDSHwf8kJW1Q2pcOpO9hof6QSeWedtMo0ZsdfSO71Ur0SVHzW8c1VHi5Xnz+e0MHh3+t95XC6Zeim04nnCqHdI1LGvS8fNVrEsc1Yq6Py5ggqYyX2Sfl/mF4lpsPrj+K1gL95t7tUXWt7NuOmBApuyb7UL4iACxDrer9hdywQ3er2v4Y2HTz8i4pTdsQY09VDQjw3ZaIy/7gIE0X73/N1PA2e2tYeTs36l0KbGx7DEU2xIKAakgXHPORuL8kl+5IRrFHPbHzt8WTYbXh33E5/BfiQY3VLj0zlDWkoeN+v+Hi6kUTunrJ1XZNRwdwVyRR9VH765TTKOqCAgvIzDnOHkiuFHXLVAwLfKgs/9OriOrt3OOzT4al8c6rTr86RnvbBu5+pDpYNTWBREYA4uFflolnW3LuCuohhugUiA8Envs5YvUz4x+M28ol4K/8pdZ8L2fJHEToYKUf79/FMvdtluEzexnpm6CCYJKLe5mvgp2xm+fc5pmWJl6sv4xl+p+WWiBR9RcjDYPLHRrfwAG+roPTgAk4rosa+wrze/KDxB0hSy5gSYM5kuPmjkVpNVJcMxd9y1wJ/G3esUzvXf7mSJ97H0llSV7hMJnI0pRDrCKDUkF4wYxZw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2628
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 25e946e7-611a-4f89-9c20-08d84595836d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIXP2Zg/4LgZWsOJ9sVf0ndegk0SX/Gjs+pQRgDjpZU0XcuPkT+ZhJDGXAg3YCl0aSgCBsE1XdHT4Iuy/7KfluMEg8xdD8xu+TL3Yoopu+hWUxRncBozDH3tDWFFJuElxu+U+cZDCY+jHJ8qKcYAr2pe5mxogiLXOE5qzrsaj/SOVC6Vlr/m0PRFW4T2dtC3m5YsFylxeC/VdJy/Q72Pcau18RofotbPq7VWn3TywcRt8yrdMqS/FDfwPvavBIdsqSM/IVJqDZDHQnHElUFU+XBf1q9umHS7wEP0bd6GO9bu/vrOIAwXJdEHS3wsz0dS9pcpSX9OY9AGyqSrhus/uck86kpUzpUsVS77gWdghxAcXYtfLtJtIDCzsfF2kVfod6UOlvtOr7gutWa2Z5P6eg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(70206006)(5660300002)(8936002)(70586007)(7696005)(9686003)(6506007)(33656002)(55016002)(53546011)(81166007)(2906002)(186003)(47076004)(8676002)(82310400002)(356005)(110136005)(83380400001)(336012)(4326008)(54906003)(82740400003)(26005)(86362001)(52536014)(316002)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 05:46:20.3142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed189f8c-7cb1-481e-fa0f-08d8459587c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5105
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

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ45pyIMTjml6UgMTc6NTEN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBBbmRyZSBQcnp5d2Fy
YSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IFN0ZXZlIENhcHBlciA8U3RldmUuQ2FwcGVyQGFybS5jb20+Ow0K
PiBLYWx5IFhpbiA8S2FseS5YaW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVu
L2FybTogTWlzc2luZyBOMS9BNzYvQTc1IEZQIHJlZ2lzdGVycyBpbiB2Q1BVDQo+IGNvbnRleHQg
c3dpdGNoDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAxOC8wOC8yMDIwIDA0OjExLCBXZWkgQ2hl
biB3cm90ZToNCj4gPiBYZW4gaGFzIGNwdV9oYXNfZnAvY3B1X2hhc19zaW1kIHRvIGRldGVjdCB3
aGV0aGVyIHRoZSBDUFUgc3VwcG9ydHMNCj4gPiBGUC9TSU1EIG9yIG5vdC4gQnV0IGN1cnJlbnRs
eSwgdGhpcyB0d28gTUFDUk9zIG9ubHkgY29uc2lkZXIgdmFsdWUgMA0KPiANCj4gcy90aGlzL3Ro
ZXNlLw0KDQoNCkdvdCBpdA0KDQo+IA0KPiA+IG9mIElEX0FBNjRQRlIwX0VMMS5GUC9TSU1EIGFz
IEZQL1NJTUQgZmVhdHVyZXMgZW5hYmxlZC4gQnV0IGZvciBDUFVzDQo+ID4gdGhhdCBzdXBwb3J0
IEZQL1NJTUQgYW5kIGhhbGYtcHJlY2lzaW9uIGZsb2F0aW5nLXBvaW50IGZlYXR1cmVzLCB0aGUN
Cj4gPiBJRF9BQTY0UEZSMF9FTDEuRlAvU0lNRCBhcmUgMS4gRm9yIHRoZXNlIENQVXMsIHhlbiB3
aWxsIHRyZWF0IHRoZW0gYXMNCj4gPiBubyBGUC9TSU1EIHN1cHBvcnQuIEluIHRoaXMgY2FzZSwg
dGhlIHZmcF9zYXZlL3Jlc3RvcmVfc3RhdGUgd2lsbCBub3QNCj4gPiB0YWtlIGVmZmVjdC4NCj4g
Pg0KPiA+IFVuZm9ydHVuYXRlbHksIENvcnRleC1OMS9BNzYvQTc1IGFyZSB0aGUgQ1BVcyBzdXBw
b3J0IEZQL1NJTUQgYW5kDQo+ID4gaGFsZi1wcmVjaXNpb24gZmxvYXRpaW5nLXBvaW50Lg0KPiAN
Cj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoaXMgc2VudGVuY2UuIENvdWxkIHlvdSBj
bGFyaWZ5Pw0KPiANCg0KU29ycnkgYWJvdXQgbXkgIHVuY2xlYXIgZXhwcmVzcy4gRnJvbSB0aGUg
VFJNIGRvY3VtZW50cyAoQ29ydGV4LUE3NS9BNzYvTjEpLCBJIGZvdW5kDQp0aGVpciBJRF9BQTY0
UEZSMF9FTDEuRlAgYW5kIElEX0FBNjRQRlIwX0VMMS5TSU1EIGZpZWxkcyBhcmUgMHgxLiAgSXQn
cyBiZWNhdXNlIGV4Y2VwdA0KYmFzaWMgQWR2YW5jZWQgU0lNRC9GUCBzdXBwb3J0cywgdGhlc2Ug
Q1BVcyBhbHNvIHN1cHBvcnQgaGFsZi1wcmVjaXNpb24gZmxvYXRpbmctcG9pbnQNCmFyaXRobWV0
aWMuDQoNCj4gPiBUaGVpciBJRF9BQTY0UEZSMF9FTDEuRlAvU01JRCBhcmUgMQ0KPiA+IChzZWUg
QXJtIEFSTSBEREkwNDg3Ri5iLCBEMTMuMi42NCkuIEluIHRoaXMgY2FzZSwgb24gTjEvQTc2L0E3
NQ0KPiA+IHBsYXRmb3JtcywgWGVuIHdpbGwgYWx3YXlzIG1pc3MgdGhlIGZsb2F0IHBvaW50ZXIg
cmVnaXN0ZXJzIHNhdmUvcmVzdG9yZS4NCj4gDQo+IHMvZmxvYXQgcG9pbnRlci9mbG9hdGluZyBw
b2ludC8/DQo+IA0KDQpZZXMNCg0KPiA+IElmIGRpZmZlcmVudCB2Q1BVcyBhcmUgcnVubmluZyBv
biB0aGUgc2FtZSBwQ1BVLCB0aGUgZmxvYXQgcG9pbnRlcg0KPiANCj4gTGlrZXdpc2U/DQo+DQoN
ClllcywgSSB3aWxsIGZpeCB0aGVzZSB0eXBvcyBpbiBuZXh0IHZlcnNpb24uDQogDQo+ID4gcmVn
aXN0ZXJzIHdpbGwgYmUgY29ycnVwdGVkIHJhbmRvbWx5Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBm
aXhlcyBYZW4gb24gdGhlc2UgbmV3IGNvcmVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2Vp
IENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vaW5jbHVkZS9hc20t
YXJtL2NwdWZlYXR1cmUuaCB8IDQgKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2NwdWZlYXR1cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS0NCj4gYXJtL2NwdWZlYXR1
cmUuaA0KPiA+IGluZGV4IDY3NGJlYjAzNTMuLjU4ODA4OWU1YWUgMTAwNjQ0DQo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2NwdWZlYXR1cmUuaA0KPiA+IEBAIC0xMyw4ICsxMyw4IEBADQo+ID4gICAjZGVmaW5l
IGNwdV9oYXNfZWwyXzY0ICAgIChib290X2NwdV9mZWF0dXJlNjQoZWwyKSA+PSAxKQ0KPiA+ICAg
I2RlZmluZSBjcHVfaGFzX2VsM18zMiAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGVsMykgPT0gMikN
Cj4gPiAgICNkZWZpbmUgY3B1X2hhc19lbDNfNjQgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMp
ID49IDEpDQo+ID4gLSNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2
NChmcCkgPT0gMCkNCj4gPiAtI2RlZmluZSBjcHVfaGFzX3NpbWQgICAgICAoYm9vdF9jcHVfZmVh
dHVyZTY0KHNpbWQpID09IDApDQo+ID4gKyNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3Rf
Y3B1X2ZlYXR1cmU2NChmcCkgPD0gMSkNCj4gPiArI2RlZmluZSBjcHVfaGFzX3NpbWQgICAgICAo
Ym9vdF9jcHVfZmVhdHVyZTY0KHNpbWQpIDw9IDEpDQo+ID4gICAjZGVmaW5lIGNwdV9oYXNfZ2lj
djMgICAgIChib290X2NwdV9mZWF0dXJlNjQoZ2ljKSA9PSAxKQ0KPiA+ICAgI2VuZGlmDQo+ID4N
Cj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+ID4gSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRl
bnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUNCj4gY29uZmlkZW50aWFs
IGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50LA0KPiBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRv
IG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55DQo+IG90aGVyIHBlcnNvbiwgdXNlIGl0
IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55
DQo+IG1lZGl1bS4gVGhhbmsgeW91Lg0KPiANCj4gUGxlYXNlIGNvbmZpZ3VyZSB5b3VyIGUtbWFp
bCBjbGllbnQgdG8gcmVtb3ZlIHRoZSBkaXNjbGFpbWVyLg0KPiANCg0KVGhhbmtzIGZvciB0aGlz
IHJlbWluZGVyLiBJIGhhdmUgZG9uZS4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

