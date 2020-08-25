Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88125173F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:16:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWwB-00008G-GO; Tue, 25 Aug 2020 11:16:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAWw9-00008A-O6
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:16:21 +0000
X-Inumbo-ID: 3a7db89e-0027-43ba-be74-f3f5bda1b53e
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a7db89e-0027-43ba-be74-f3f5bda1b53e;
 Tue, 25 Aug 2020 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTBs61AnAJhDzqEvRijL0/9s4kVpWkbiSyo/R9l6UPE=;
 b=AJEinyuVYxj04Nw32FGGl1eLI/f0yms3IbDWUJ1wRGn/72FkMFXXVumUqqdYIRn+qoniZYiRlIw/Mw0Zz21MOha+zXywegbN8I0oGZ38pfiiQeO2DS3Vw9CK6gCMzBG4UA3SVFkfl+hnzFHVEsXLEZOgz3VNXQzRIX8eYF09K94=
Received: from MR2P264CA0101.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::17)
 by AM0PR08MB5266.eurprd08.prod.outlook.com (2603:10a6:208:162::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 11:16:18 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::10) by MR2P264CA0101.outlook.office365.com
 (2603:10a6:500:33::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Tue, 25 Aug 2020 11:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 11:16:17 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Tue, 25 Aug 2020 11:16:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e54c326dd023911
X-CR-MTA-TID: 64aa7808
Received: from f2890b6b69d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9FB45AA-DAA1-4473-BB05-7D012612D557.1; 
 Tue, 25 Aug 2020 11:16:12 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2890b6b69d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 11:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coO6rKEXjNheMUE7/om55UKwrmOuMPOwfjGCskaLUIVNp9jm27ij/DuKBcUIb2H60XcsH1crtbdsIPH3MA0V8R87lmSw+uhDIYSFKm4vzJIoGWvNox08bbgk8IQOmi5OFpGt9ospv+CJ/gHsPomYzB4Daawd3ANUo3B1MFNqDejKlQMvnaeH8As3fPTThX2JEnXnK2noibruim4fHwJRSb3IBL8sqUKq9jKm4iSvSONwL6wyo/0UbFj1GM/BnJk+MWHLDqJ2KPfm4spSX5Dac0TlmKHiDbtOdeA9vXaflWuclkpCIu644ylTE24gZoP6cz2Qms9CjyAewIhONsJ+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTBs61AnAJhDzqEvRijL0/9s4kVpWkbiSyo/R9l6UPE=;
 b=O+xSyoJ25atU6CaCQxCO5/z/93HzS7LNkJA8VJyWjtwzLs9PWHd7Nq6Z/BFf2aBXAUkOzMYvNXfYNHnqKm/uO+tmuApU5LQ+Y0+FE6OmHuPe4dSBIjLyWX8+EgFtW4hikGofNnqt8J9Sz9Ofkb8l0szDRj36L+TGsKzu8O8c6WZKIVwMVC+EnUh3ltvLgev2fmmCYZOYbHI8doQqNenc/u2JRTOhDxicyMMdnyT9MnixXcJVq4bTlA6NC7iq4BSlKHhICR4ol/e/8kYzKTRX8RySp/2/RC6q66Xb90xVneA0MWhTYo4+PVYMrEmDeuZX18Cqom00PQIBZD49nk2SWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTBs61AnAJhDzqEvRijL0/9s4kVpWkbiSyo/R9l6UPE=;
 b=AJEinyuVYxj04Nw32FGGl1eLI/f0yms3IbDWUJ1wRGn/72FkMFXXVumUqqdYIRn+qoniZYiRlIw/Mw0Zz21MOha+zXywegbN8I0oGZ38pfiiQeO2DS3Vw9CK6gCMzBG4UA3SVFkfl+hnzFHVEsXLEZOgz3VNXQzRIX8eYF09K94=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4677.eurprd08.prod.outlook.com (2603:10a6:10:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 25 Aug
 2020 11:16:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 11:16:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
Subject: Re: Kconfig vs tool chain capabilities
Thread-Topic: Kconfig vs tool chain capabilities
Thread-Index: AQHWeqm1rojPQ5A/KUSCBM6rLJEMwalIaPuAgAAF9YCAAAK5gIAAAUmAgAAFm4CAAAsfgIAAEPWAgAAH04CAAA2vAIAAAswA
Date: Tue, 25 Aug 2020 11:16:09 +0000
Message-ID: <4B1178DC-47E6-46E8-A791-2E12F8CA5F5B@arm.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
 <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
 <cf7e8e5f-de4b-3046-8ffc-7ae4502d06c9@suse.com>
 <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
 <B6E80F54-20D1-4ABF-AA19-8B3D0566DA7B@arm.com>
 <7075bb73-4682-4d17-97ab-3b04e245795a@suse.com>
In-Reply-To: <7075bb73-4682-4d17-97ab-3b04e245795a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a064b5c3-2ec9-490b-1eae-08d848e849b0
x-ms-traffictypediagnostic: DBBPR08MB4677:|AM0PR08MB5266:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5266A00AC54F2079350796C89D570@AM0PR08MB5266.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fQgG03zHu7veGaTQEtppmuNbtPj6iviGKfR1nNv2a/Cs18FiNHtL3Qok+Q2GDXBmpMmUT00R2qksSUQwqmcUSDbWDUzTJkANh+hQ/1LVha3xXEEIWkckiBPv2O4yzRZwpToRj2tXNBUQGosOXZ9xrXs07Am40XXeWF7fWWB3HzXfI32idXs9EGHX6CnHpz3efraUiQZqTlH4gnsCFfHE5dUNViVvvYSqIftkp6banhk+vOfxUFcqr3fCSvrbyC9wtYVQxpy0U8wLL4T2x53APO+wvwyf0xRzwKB+G/jGxf4vj+KAHakXEik1ptyAC267F8NPwhbJnCVrtNAjhymVpUa4y+9aU9PxXRUF0Ubi0wWMCAFOBrGEYQLRhppu7zek
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(91956017)(6916009)(6512007)(66556008)(66446008)(64756008)(66476007)(2616005)(66946007)(76116006)(53546011)(6506007)(316002)(186003)(8676002)(54906003)(26005)(33656002)(8936002)(5660300002)(83380400001)(86362001)(2906002)(4326008)(66574015)(36756003)(71200400001)(478600001)(6486002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KmyJmjgVl22zBmRM6VYZ2JKWJnUpC3A+oIjazGAXY2pUl4gNppqfCi3sDwoW96QZ69ZqQh9LwdKLFr+cfG45FYenlhEt0lW7fkuf6SlvB2tzbW8CvrnxUddJXQGL6gYe5etJNnTMNiUzyDChlEM5rYy/rE3Qy0a0P7QDauKMiWixouQmW754ScI4pvBLRXGBht27/xl2Sp/FqR9IWcHjSxeyUI/Homk1moe560gcD7Tr5MxTIg/G7zaDo6PjRhbtCAluCzhD4OAXIMUkFWivwtGT+/s1hMgWl+QP4CiCS8VzGr4l5VvxRtPMrlf2i7hpIhcx/FDi+vN8JijBLql+AnDVUrPhAKel5kMovnOD4d51wSZFlXQSgXBlp7zi5ySj6EK2mMiX8yBdgG8b2ojkmmhBB2YCe7UPza/fFRSg+UccpnXneRJnUT9A0NmFB1fwfViXuvgXTIVJpk/rPnSRPDmpfHKW4g/D1wC9eRN0QDsTVBAgox+jmtGUSkMobw77d3tmYjhJhnebC10B5BpS9rA67HWmDbWChky3c0a4l1qKRKUOOha7tP0Nhr/xmSPh6s8xaejBtY0ZaqIIi8jielMdsTyc7+jgEOVoO4D9XECkgKuCeOfkEa+Y6yTY4IoyyRYi+QUUYcHyrls51RSk7A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE6867E7CB991641A06D173388D4732D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4677
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e3f178b5-b381-406f-581b-08d848e844a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uS8RYzxvt9ioMB9IYUBEp9OuKOrJ/HJ0RxWCQ6HgPEq05KU5AYB1j112L2/OYPVNqze2M4PbF6S9nMj6fgeEZCMS+HS8qvdE5lxgE94OtCO1wB2XcF9hfRnLDOHW4fdnetwtzylqZ1CWZOjiZkfYqL8UIsE0veChtJJB0fxb4w+aksHbNw/fXODcgHku55Pnub78SSo0Z8GZ3v9zGVVUkuZicr0Q/97AqOEqpqO6whnZlFbMX1BIsS6jDaeL442ikrg5L8pUcj41fzGD8tUo/NIqdNd2d5rSnkc66Gf/aVyUy+uuJ2kZ2s3z8l8uXO//g4ZA7Nnfod131DJn/Xd6gGnS/x51PtaRQzD5AQ8ZFXe0UxTkkMObYgwS6Rz0qZL6LQht8DuV9HP5vXssjAMvnHMkayxYifwM61hrEuPD6Bw=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(82310400002)(53546011)(8936002)(6506007)(36906005)(316002)(6512007)(70206006)(8676002)(2906002)(66574015)(83380400001)(336012)(54906003)(70586007)(2616005)(478600001)(356005)(47076004)(6486002)(4326008)(86362001)(36756003)(82740400003)(26005)(33656002)(5660300002)(186003)(6862004)(81166007)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 11:16:17.7324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a064b5c3-2ec9-490b-1eae-08d848e849b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5266
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjA2LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAgMTI6MTcsIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEwOjQ5LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDI1LjA4LjIwIDEwOjQ4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4gT24gMjUuMDguMjAyMCAxMDowOCwgSsO8cmdlbiBHcm/DnyB3cm90
ZToNCj4+Pj4+IE9uIDI1LjA4LjIwIDA5OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBP
biAyNS4wOC4yMDIwIDA5OjQzLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+Pj4+PiBPbiAyNS4w
OC4yMCAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+PiBPbiAyNS4wOC4yMDIwIDA5
OjEyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+Pj4+Pj4+IEkgdGhpbmsgYm90aCBwcm9ibGVt
cyBjYW4gYmUgc29sdmVkIGF0IHRoZSBzYW1lIHRpbWUgdmlhIHRoZSBmb2xsb3dpbmcNCj4+Pj4+
Pj4+PiBhcHByb2FjaDoNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAtIGNvbGxlY3QgdGhlIGRhdGEg
d2hpY2ggaXMgcmVmbGVjdGVkIGluIHRvZGF5J3MgQ09ORklHXyB2YXJpYWJsZXMgaW4gYQ0KPj4+
Pj4+Pj4+ICAgICAgc2luZ2xlIHNjcmlwdCBhbmQgc3RvcmUgaXQgaW4gYSBmaWxlLCBlLmcgaW4g
YSBmb3JtYXQgbGlrZToNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAgICAgIENDX0lTX0dDQyB5DQo+
Pj4+Pj4+Pj4gICAgICBHQ0NfVkVSU0lPTiA3MDUwMA0KPj4+Pj4+Pj4+ICAgICAgQ0xBTkdfVkVS
U0lPTiAwDQo+Pj4+Pj4+Pj4gICAgICBDQ19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUgeQ0KPj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+IC0gY2hlY2sgdGhlIHRvb2wgZGF0YSBhdCBlYWNoIGJ1aWxkIHRv
IG1hdGNoIHRoZSBjb250ZW50cyBvZiB0aGF0IGZpbGUNCj4+Pj4+Pj4+PiAgICAgIGFuZCBlaXRo
ZXIgZmFpbCB0aGUgYnVpbGQgb3IgdXBkYXRlIHRoZSBmaWxlIGFuZCByZXJ1biBrY29uZmlnIGlm
IHRoZXkNCj4+Pj4+Pj4+PiAgICAgIGRvbid0IG1hdGNoIChJIHRoaW5rIGZhaWxpbmcgdGhlIGJ1
aWxkIGFuZCByZXF1aXJpbmcgdG8gcnVuIGENCj4+Pj4+Pj4+PiAgICAgICJtYWtlIGNvbmZpZyIg
d291bGQgYmUgdGhlIGJldHRlciBhcHByb2FjaCkNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAtIGZp
bGwgdGhlIENPTkZJR18gdmFyaWFibGUgY29udGVudHMgZnJvbSB0aGF0IGZpbGUgaW4ga2NvbmZp
ZyBpbnN0ZWFkDQo+Pj4+Pj4+Pj4gICAgICBvZiBpc3N1aW5nIHRoZSBzaW5nbGUgc2hlbGwgY29t
bWFuZHMNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gV2hpbGUgSSBhZ3JlZSB0aGlzIGlzIGEgcG9zc2li
bGUgbW9kZWwgdG8gdXNlIChidXQgc3RpbGwgbm90IHRoZQ0KPj4+Pj4+Pj4gb25lIHdlJ3ZlIGlu
aGVyaXRlZCBmcm9tIExpbnV4KSwgSSBmYWlsIHRvIHNlZSBob3cgdGhpcyBhZGRyZXNzZXMNCj4+
Pj4+Pj4+IG15ICJkZXZlbG9wZXJzIHNob3VsZCBiZSBhd2FyZSBvZiB3aGF0IHRoZXkgZG8gKG5v
dCkgYnVpbGQgYW5kDQo+Pj4+Pj4+PiB0ZXN0IiBjb25jZXJuOiBUaGVyZSdkIHN0aWxsIGJlIGRl
cGVuZGVuY2llcyBvZiBLY29uZmlnIG9wdGlvbnMNCj4+Pj4+Pj4+IG9uIHRoZSB0b29sIGNoYWlu
IGNhcGFiaWxpdGllcywgYW5kIHRoZWlyIHByb21wdHMgdGhlcmVmb3JlIHdvdWxkDQo+Pj4+Pj4+
PiBzdGlsbCBiZSBpbnZpc2libGUgd2l0aG91dCB0aGUgdG9vbCBjaGFpbiBoYXZpbmcgdGhlIG5l
ZWRlZA0KPj4+Pj4+Pj4gY2FwYWJpbGl0aWVzLiBJT1cgSSBvbmx5IHNlZSB0aGlzIHRvIGFkZHJl
c3MgMiksIGJ1dCBub3QgMSkuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBTb3JyeSwgSSBmYWlsIHRvIHNl
ZSBhIHByb2JsZW0gaGVyZS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFdoYXQgc2Vuc2UgZG9lcyBpdCBt
YWtlIHRvIGJlIGFibGUgdG8gY29uZmlndXJlIGFuIG9wdGlvbiB3aGljaCB0aGUNCj4+Pj4+Pj4g
dG9vbHMgZG9uJ3Qgc3VwcG9ydD8NCj4+Pj4+PiANCj4+Pj4+PiBUYWtlIENFVCBhcyBhbiBleGFt
cGxlIChjaG9zZW4gYmVjYXVzZSB0aGF0J3MgdGhlIG9uZSB3aGljaA0KPj4+Pj4+IGFscmVhZHkg
dXNlcyB0aGUgS2NvbmZpZyBhcHByb2FjaCwgZGVzcGl0ZSBteSBkaXNhZ3JlZW1lbnQpOiBJdCdz
DQo+Pj4+Pj4gcXVpdGUgcmVsZXZhbnQgdG8ga25vdyB3aGV0aGVyIHlvdSdyZSB0ZXN0aW5nIFhl
biB3aXRoIGl0IGVuYWJsZWQsDQo+Pj4+Pj4gb3Igd2l0aCBpdCBkaXNhYmxlZCAoYW5kIGhlbmNl
IHlvdSBwb3RlbnRpYWxseSBtaXNzaW5nIGNoYW5nZXMgeW91DQo+Pj4+Pj4gbmVlZCB0byBtYWtl
IHRvIHJlbGV2YW50IGNvZGUgcG9ydGlvbnMpLg0KPj4+Pj4gDQo+Pj4+PiBDb3JyZWN0IG1lIGlm
IEknbSB3cm9uZywgYnV0IGFzc3VtaW5nIG15IHN1Z2dlc3RlZCBjaGFuZ2VzIGJlaW5nIG1hZGUs
DQo+Pj4+PiB3b3VsZG4ndCBhIC5jb25maWcgZmlsZSBzZXR1cCBvbmNlIHdpdGggQ0VUIGVuYWJs
ZWQgKGFuZCBJIGFzc3VtZSB5b3UnZA0KPj4+Pj4gdHJ5IHRvIGVuYWJsZSBDRVQgb24gcHVycG9z
ZSB3aGVuIHRyeWluZyB0byB0ZXN0IENFVCBhbmQgeW91J2QgcmVhbGl6ZQ0KPj4+Pj4gbm90IGJl
aW5nIGFibGUgdG8gZG8gc28gaW4gY2FzZSB5b3VyIHRvb2xzIGRvbid0IHN1cHBvcnQgQ0VUKSBl
bnN1cmUNCj4+Pj4+IHlvdSdkIG5ldmVyIGJlZW4gaGl0IGJ5IHN1cnByaXNlIHdoZW4gc29tZSB0
b29sIHVwZGF0ZXMgd291bGQgcmVtb3ZlDQo+Pj4+PiBDRVQgc3VwcG9ydD8NCj4+Pj4gUHJvYmFi
bHksIGJ1dCB0aGF0J3Mgbm90IG15IHBvaW50LiBXaXRoIGEgQ0VULWluY2FwYWJsZSB0b29sIGNo
YWluDQo+Pj4+IHlvdSdyZSBub3QgcHJvbXB0ZWQgd2hldGhlciB0byBlbmFibGUgQ0VUIGluIHRo
ZSBmaXJzdCBwbGFjZSwgd2hlbg0KPj4+PiBjcmVhdGluZyB0aGUgaW5pdGlhbCAuY29uZmlnLiBJ
dCBpcyB0aGlzIHVuYXdhcmVuZXNzIG9mIGEgY3J1Y2lhbA0KPj4+PiBwYXJ0IG9mIGNvZGUgbm90
IGdldHRpbmcgYnVpbHQgYW5kIHRlc3RlZCAoYW5kIGxpa2VseSB1bmtub3dpbmdseSkNCj4+Pj4g
dGhhdCBJIGRpc2xpa2UuIEluIGZhY3QsIGFmdGVyIEFuZHJldydzIHBhdGNoZXMgaGFkIGdvbmUg
aW4sIGl0DQo+Pj4+IGhhZCB0YWtlbiBtZSBhIHdoaWxlIHRvIHJlYWxpemUgdGhhdCBpbiBjZXJ0
YWluIG9mIG15IGJ1aWxkcyBJIGRvbid0DQo+Pj4+IGhhdmUgQ0VUIGVuYWJsZWQgKGRlc3BpdGUg
bWUgaGF2aW5nIGRvbmUgbm90aGluZyB0byBkaXNhYmxlIGl0KSwgYW5kDQo+Pj4+IGhlbmNlIHRo
b3NlIGJ1aWxkcyB3b3JraW5nIGZpbmUgYXJlIG1lYW5pbmdsZXNzIGZvciBhbnkgY2hhbmdlcw0K
Pj4+PiBhZmZlY3RpbmcgQ0VUIGNvZGUgaW4gYW55IHdheS4NCj4+PiANCj4+PiBZZXMsIHRoaXMg
aXMgdGhlIHJlc3VsdCBvZiBsZXR0aW5nIHNvbWUgb3B0aW9ucyBkZXBlbmQgb24gb3RoZXJzLg0K
Pj4+IA0KPj4+IFRoaXMgaXMgd2hhdCBJIG1lYW50IHJlZ2FyZGluZyB0aGUgYXJjaGl0ZWN0dXJl
OiB0aGVyZSBhcmUgZS5nLiBtdWx0aXBsZQ0KPj4+IHNvdXJjZSBmaWxlcyBpbiBkcml2ZXJzL2No
YXIvIGJlaW5nIGJ1aWx0IG9ubHkgZm9yIEFSTSBvciBYODYsIGluIHNwaXRlDQo+Pj4gb2YgYmVp
bmcgbG9jYXRlZCBvdXRzaWRlIGFyY2gvLiBBbmQgeWV0IHlvdSBkb24ndCBzZWUgdGhpcyBhcyBh
IHByb2JsZW0sDQo+Pj4gZXZlbiBpZiB5b3UgYXJlIG5vdCBhYmxlIHRvIHNlbGVjdCB0aG9zZSBk
cml2ZXJzIHRvIGJlIGJ1aWx0IHdoZW4gdXNpbmcNCj4+PiAidGhlIG90aGVyIiBhcmNoLiBUaGV5
IGFyZSBzaWxlbnRseSBkaXNhYmxlZC4gSnVzdCBsaWtlIENFVCBpbiBjYXNlIG9mDQo+Pj4gYW4g
aW5jYXBhYmxlIHRvb2wgY2hhaW4uDQo+Pj4gDQo+Pj4gU28gSU1PIGVpdGhlciB3ZSBiYW4gImRl
cGVuZHMgb24iIGZyb20gb3VyIEtjb25maWcgZmlsZXMgKG5vLCBJIGRvbid0DQo+Pj4gd2FudCB0
byBkbyB0aGF0KSwgb3Igd2UgdXNlIGl0IGFzIGRlc2lnbmVkIGFuZCBtYWtlIGl0IGFzIHVzZXIg
ZnJpZW5kbHkNCj4+PiBhcyBwb3NzaWJsZS4gSW4gY2FzZSB3ZSBhcyBkZXZlbG9wZXJzIGhhdmUg
YSBzcGVjaWFsIHRlc3QgY2FzZSB0aGVuIHdlDQo+Pj4gbmVlZCB0byBjaGVjayB0aGUgLmNvbmZp
ZyB3aGV0aGVyIHRoZSBkZXNpcmVkIHNldHRpbmdzIGFyZSByZWFsbHkNCj4+PiBwcmVzZW50LiBI
YXZpbmcgdGhvc2Ugc2V0dGluZ3MgZGVwZW5kaW5nIG9uIHRvb2wgY2FwYWJpbGl0aWVzIGluIGEN
Cj4+PiBzcGVjaWZpYyBmaWxlIHdpbGwgbWFrZSB0aGlzIGNoZWNrIG11Y2ggZWFzaWVyLg0KPj4+
IA0KPj4+IEFuZCBCVFcsIEkgY2FuJ3Qgc2VlIGhvdyBzZXR0aW5nIHRoZSB0b2xscycgY2FwYWJp
bGl0aWVzIGZyb20gZS5nLg0KPj4+IGFyY2gveDg2L1J1bGVzLm1rIGlzIGJldHRlciBpbiBhbnkg
d2F5IChzZWUgaG93IENPTkZJR19JTkRJUkVDVF9USFVOSw0KPj4+IGdvdCBpdHMgdmFsdWUgaW4g
b2xkZXIgWGVuIHZlcnNpb25zIGxpa2UgNC4xMikuDQo+Pj4gDQo+Pj4gV2UgY2FuJ3QgaGF2ZSBl
dmVyeXRoaW5nIGFuZCBJIGJlbGlldmUgYXV0b21hdGljYWxseSBkaXNhYmxpbmcgZmVhdHVyZXMN
Cj4+PiB3aGljaCBjYW4ndCB3b3JrIHdpdGggdGhlIGN1cnJlbnQgdG9vbHMgaXMgYSBzYW5lIGRl
Y2lzaW9uLiBEb2luZyB0aGlzDQo+Pj4gdmlhIEtjb25maWcgaXMgdGhlIGJldHRlciBhcHByb2Fj
aCBjb21wYXJlZCB0byBNYWtlZmlsZSBzbmlwbGV0cyBJTU8uDQo+PiBUaGF0IHNvdW5kcyBsaWtl
IGEgbmljZSBmZWF0dXJlIHRvIGhhdmUgc29tZSBjb21waWxlciBvciB0b29scyBvcHRpb25zIHRo
YXQNCj4+IGNhbiBiZSBzZWxlY3RlZCBvciBhY3RpdmF0ZWQgaW4gS2NvbmZpZy4gVGhlcmUgYXJl
IHNvbWUgY29tcGlsZXIgb3B0aW9ucw0KPj4gbWFuZGF0b3J5IHRvIGhhbmRsZSBzb21lIGVycmF0
YXMgb3IgWFNBIHRoYXQgb25lIG1pZ2h0IHdhbnQgdG8gZXhwbGljaXRlbHkNCj4+IHNlbGVjdC4N
Cj4+IEkgYW0gYml0IHVuc3VyZSBhYm91dCB0aGUgcGFydCB3aGVyZSBzb21lIGtjb25maWcgb3B0
aW9ucyB3b3VsZCBvbmx5DQo+PiBiZSBhdmFpbGFibGUgb3Igbm90IGRlcGVuZGluZyBvbiBzb21l
IHRlc3RzIHdpdGggdGhlIGNvbXBpbGVyIGJlaW5nIGRvaW5nDQo+PiBwcmlvciB0byBvcGVuaW5n
IHRoZSBlZGl0b3IuIEkgd291bGQgZ3Vlc3MgdGhlIG1lbnVjb25maWcgcHJvY2VzcyB3b3VsZA0K
Pj4gaGF2ZSB0byBmaXJzdCBydW4gc29tZSB0ZXN0cyBhbmQgdGhlbiBnZW5lcmF0ZWQgc29tZSBI
QVNfIGNvbmZpZ3VyYXRpb24NCj4+IG9wdGlvbnMgZGVwZW5kaW5nIG9uIHRoZSByZXN1bHQgb2Yg
dGhlIHRlc3RzLg0KPj4gRGlkIGkgZ290IHRoZSBpZGVhIHJpZ2h0IGhlcmUgPw0KPj4gSXMgdGhp
cyBzb21ldGhpbmcgc29tZWJvZHkgdHJpZWQgdG8gZG8gPw0KPj4gQXMgYSB1c2VyIEkgd291bGQg
bW9yZSBleHBlY3QgdGhhdCB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCB0ZWxsIG1lIHRoYXQgbXkN
Cj4+IGNvbmZpZ3VyYXRpb24gaXMgaW52YWxpZCBiZWNhdXNlIGkgc2VsZWN0ZWQgc29tZXRoaW5n
IHRoYXQgaXMgbm90IHN1cHBvcnRlZA0KPj4gYnkgbXkgY29tcGlsZXIuIEkgbWlnaHQgaGF2ZSB0
aGUgY2hhbmNlIHRvIGp1c3QgZml4IG15IGJ1aWxkIHRvIHVzZSB0aGUgcmlnaHQNCj4+IGNvbXBp
bGVyIChsaWtlIGJ5IG1pc3Rha2UgdXNpbmcgeDg2IHRvb2xjaGFpbiB0byBjb21waWxlIGZvciBh
cm0pLg0KPj4gV2Ugc2hvdWxkIGFsc28gYmUgY2FyZWZ1bCBub3QgdG8gc2lsZW50bHkgaWdub3Jl
IHNvbWUgY29uZmlndXJhdGlvbiBvcHRpb24gaWYNCj4+IG9uZSBpcyBjaGFuZ2luZyB0aGUgY29t
cGlsZXIgYW5kIHRoZSBuZXcgb25lIGRvZXMgbm90IHN1cHBvcnQgYW4gb3B0aW9uLg0KPj4gQSB1
c2VyIHdvdWxkIGhhdmUgaGlzIGNvbmZpZ3VyYXRpb24gYW5kIGNvbXBpbGUgdXNpbmcgaXQgd2l0
aG91dA0KPj4gcGFzc2luZyB0aHJvdWdoIHRoZSBlZGl0b3IgaW50ZXJmYWNlIGFuZCBtaWdodCBu
ZWVkIHRvIGJlIGF3YXJlIHRoYXQgYSBwYXJ0DQo+PiBvZiBoaXMgY29uZmlndXJhdGlvbiBpcyBu
b3QgdmFsaWQgYW55bW9yZSBiZWNhdXNlIHRoZSB0b29scyBoZSBpcyB1c2luZyBjaGFuZ2VkLg0K
Pj4gVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBvY2N1ciBhIGxvdCB3aGVuIHVzaW5nIGEg
ZGlzdHJpYnV0aW9uIHRvb2xjaGFpbi4NCj4+IEFsc28gdGhlcmUgYXJlIHNvbWUgY29tcGlsZXIg
b3B0aW9uIGNoYW5naW5nIHNvIGkgd291bGQgbW9yZSB0aGluayB0aGF0DQo+PiB0aGVyZSBzaG91
bGQgYmUgZ2VuZXJpYyBjb25maWd1cmF0aW9uIG9wdGlvbnMgc28gdGhhdCBpbiB0aGUgbWFrZWZp
bGVzIHdlDQo+PiBjb3VsZCBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byBhZGQgZGlmZmVyZW50IGNv
bXBpbGVyIG9wdGlvbnMgZm9yIGRpZmZlcmVudA0KPj4gdG9vbGNoYWlucyBkZXBlbmRpbmcgb24g
dGhlIHZlcnNpb24gb3IgdGhlIHR5cGUgb2YgdGhlIHRvb2xjaGFpbi4NCj4+IFRvIGJlIGNsZWFy
IGkgd291bGQgc2VlIHNvbWV0aGluZyBsaWtlOg0KPj4gaW4ga2NvbmZpZzoNCj4+IENPTVBJTEVS
X09QVElPTl9YWFgNCj4+IAlib29sIOKAnGFjdGl2YXRlIFhYWCBjb21waWxlciBmbGFnDQo+PiBp
biBNYWtlZmlsZToNCj4+IGlmZXEgKCQoQ09ORklHX0NPTVBJTEVSX09QVElPTl9YWFgpLCB0cnVl
KQ0KPj4gdGVzdF9jb21waWxlcl9jeHg6DQo+PiAJJChDQykgLXh4eCBkdW1teS5jIC1vIGR1bW15
IHx8ICQoZXJyb3IgWW91ciBjb21waWxlciBkb2VzIG5vdCBzdXBwb3J0IC14eHgpDQo+PiBjYy1m
bGFncyArPSAteHh4DQo+PiBlbmRpZg0KPj4gVGhlIHN5bnRheCBpcyB3cm9uZyBoZXJlIGJ1dCB5
b3UgZ2V0IHRoZSBpZGVhIDotKQ0KPiANCj4gQWgsIG9rYXksIHRoaXMgaXMgYW5vdGhlciBhcHBy
b2FjaCwgd2hpY2ggbWlnaHQgYmUgZXZlbiBtb3JlIGZsZXhpYmxlLg0KPiBJdCB3b3VsZCBhbGxv
dyB0byBjb250cm9sIGNvbXBpbGVyIGZsYWdzIGluc3RlYWQgb2YgbW9yZSBoaWdoIGxldmVsDQo+
IGZlYXR1cmVzLg0KDQpXZSBtaWdodCBoYXZlIGJvdGgsIHRoaXMgd291bGQgYWxzbyBhbGxvdyB0
byBoYXZlIG1vcmUgaGlnaCBsZXZlbCBmZWF0dXJlcyB3aGljaCBhcmUNCmRvaW5nIGJvdGggYWRk
aW5nIGNvbXBpbGVyIGZsYWdzIGFuZCBvdGhlciBzdHVmZiwNCg0KPiANCj4gSW4gY2FzZSB3ZSB3
YW50IHRvIGdvIHRoYXQgcm91dGUgd2Ugc2hvdWxkIGRlZmF1bHQgQ09NUElMRVJfT1BUSU9OX1hY
WA0KPiB0byB0aGUgY3VycmVudCB0b29sIGNhcGFiaWxpdGllcyBpbiBvcmRlciB0byBhdm9pZCBs
b25nZXIgdHJ5LWFuZC1lcnJvcg0KPiBsb29wcy4NCg0KSSBhbSBub3QgcXVpdGUgc3VyZSBob3cg
eW91IHdhbnQgdG8gYWNoaWV2ZSB0aGlzIGNsZWFubHkuDQpPbmUgc29sdXRpb24gd291bGQgYmUg
dG8gdGVzdCB0aGUgY29tcGlsZXIgYW5kIGdlbmVyYXRlIGEga2NvbmZpZyB3aGljaCB3b3VsZCBo
YXZlIHN0dWZmIGxpa2U6DQoNCkhBU19DT01QSUxFUl9PUFRJT05fWFhYDQoJYm9vbA0KCWRlZmF1
bHQgeQ0KCWhlbHANCiAgICAgICAgICAgQ29tcGlsZXIgb3B0aW9uIHN1cHBvcnRlZCBieSB5b3Vy
IGdjYw0KDQpIQVNfQ09NUElMRVJfT1BUSU9OX1lZWQ0KCWJvb2wNCglkZWZhdWx0IHkgaWYgRVhQ
RVJUDQoJZGVmYXVsdCBuDQoJICAgQ29tcGlsZXIgb3B0aW9uIG5vdCBzdXBwb3J0ZWQgYnkgeW91
ciBnY2MNCgkgICBTZWxlY3QgRVhQRVJUIHRvIG92ZXJ3cml0ZQ0KDQpJIGFtIHN1Z2dlc3Rpbmcg
dGhlIHNlY29uZCBvbmUgc28gdGhhdCBzb21lb25lIGNvdWxkIGZvcmNlIGFuIG9wdGlvbiBpZiBu
ZWVkZWQuDQoNClRoZSBzY3JpcHQgb3IgbWFrZWZpbGUgdG8gZ2VuZXJhdGUgdGhpcyBtaWdodCBi
ZSBjb21wbGV4IG9yIGxvbmcuDQpNYXliZSB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHRoZSB0b3Ag
bGV2ZWwgY29uZmlndXJlIGNvdWxkIGdlbmVyYXRlID8NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0K

