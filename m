Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5E6E613
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSZi-0007hK-FX; Fri, 19 Jul 2019 13:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoSZg-0007hF-LE
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:05:24 +0000
X-Inumbo-ID: dd3932d8-aa25-11e9-803f-634ba29b2107
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd3932d8-aa25-11e9-803f-634ba29b2107;
 Fri, 19 Jul 2019 13:05:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 13:05:16 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 13:04:35 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 13:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TECMhisn+GoSxW4ozBpNhX025E/Z2tlBKHZOgZXBwdaCoPVb8ja4pTdCnE2kZ/SMi2qvgbpIrh4R4/Nx0dZnclsaviih7dncaBtaYmfbcMKebbN6Umwjn0yLAYCI9PV9DGnuSv7R9ILmL6NvbmOV3D4RqqxR1eraMmkaWVAdPNtxpbY8EC07XvdZjb1djvnauwrWYvJQP5afio03Bb8yqkfSZgmJvc8mkfCQwhuRrIX6SHhZateq+7RK8EBnjO8obQ5RoaThaCTcRXkm6jxoCJjkWy962FtB+J9boeQVazQBG4rhl4JIaVJPJjc3+TwHTVOdQrqpTNaTAxDnHmK7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi3gJ+74GwjpSLYyfcWIPx6lXUdIgjnrA8rUvP6wlj0=;
 b=Ls8kE6RDDowFv4JimBPbvdOgeYEi/fcQ/MYSpU7OGlDHZDj1KnSO++LwS12e9h9avrxJJNiLcDy/yuVNdLk4mXdKTTUgeP0smgE1dSJcc/wrPxIrcl5tuVLdoO3TKPSkwTGjvBLOjNFdqJKCBnKnw5QNS0ZISutXPDYGYKhEN05p/xxQTKlrRdKAHOIoNV216T9Bf41lsq4OWExnusEbxDIvpBrdBn+gJbtbP6/WFF1X/m2vtO+qP+IRM69lE3xwUNewPNhEXFWYpUH/TBK5W32pYpTmEBQ3/q2YfjOI3fSjxJUxVac02OcpU40DWd/0q7Ygvu7x0awJckku70dtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3098.namprd18.prod.outlook.com (10.255.76.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 13:04:34 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:04:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 00/13] x86: IRQ management adjustments
Thread-Index: AQHVO6eElQXdQCGj2E20gbuQ7Ha7M6bR5gi6gAAHqoA=
Date: Fri, 19 Jul 2019 13:04:34 +0000
Message-ID: <65a9dd40-5219-ec68-37be-e533f96829c7@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <2b43d005-9a97-0ffb-6687-f08f29796e0c@citrix.com>
In-Reply-To: <2b43d005-9a97-0ffb-6687-f08f29796e0c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0010.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e5afc05-6b07-4e4b-add4-08d70c49a564
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3098; 
x-ms-traffictypediagnostic: DM6PR18MB3098:
x-microsoft-antispam-prvs: <DM6PR18MB30989F7637968E192B2E36EFB3CB0@DM6PR18MB3098.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(76176011)(68736007)(6512007)(66066001)(2616005)(6436002)(99286004)(5660300002)(3846002)(71200400001)(229853002)(6116002)(316002)(25786009)(53936002)(7736002)(86362001)(31686004)(8936002)(305945005)(8676002)(81166006)(186003)(54906003)(66476007)(5024004)(66946007)(52116002)(36756003)(2906002)(6246003)(14444005)(6486002)(256004)(4326008)(66446008)(53546011)(81156014)(6506007)(446003)(26005)(478600001)(386003)(71190400001)(102836004)(80792005)(31696002)(486006)(14454004)(4744005)(476003)(64756008)(66556008)(11346002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3098;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x7EVSpUpshOa2wRiBF/jtJRdowWLpIbulZ6NUiME7DMwun/8DHE3m8xBr7fGlcULqL8AIhPMrMyZyc1/o6c6rjXEWN1MLxdIZDD4veQ0dgJMfIPPQbsszAGiGlrXOcnHhUJiYKQbVq4V0PlN1roQBoOaioM0XdgGOvFBFmWuFQHdIvfoMBDrDAE4XbeIwIicp09nullBxQEO+zOz7GskOd5eknOidAC729T2QMdSDzIdmJ/9oF6XCQnwnw5+Gr/3HYmMhnoEzxFb7u0eoC/JBWwqapZSroMJ0Z/KoFUywebk65g/5FV6IiEt80FPJSxsbAlzn43ZBPI49dbXduYtHHcnx45E5zuRnlaNhZWfZwvhzNVlctS6pWwO5wPSNVZ+OvtZq2IUoYzcRYJAddVyP5Qo3yRRLuQV82CfQILK++0=
Content-ID: <857EDCC7D21E7F478637B63B1E5ADCD3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5afc05-6b07-4e4b-add4-08d70c49a564
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:04:34.5138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3098
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 00/13] x86: IRQ management adjustments
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAwODoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBGb3IgdjQgc3BlY2lmaWMgaW5mb3JtYXRp
b24gcGxlYXNlIHNlZSB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzLg0KPj4NCj4+IEZ1bGwgc2V0IG9m
IHBhdGNoZXMgYXR0YWNoZWQgaGVyZSBkdWUgdG8gc3RpbGwgdW5yZXNvbHZlZCBlbWFpbA0KPj4g
aXNzdWVzIG92ZXIgaGVyZS4NCj4gDQo+IEluIGZ1dHVyZSwgY2FuIHlvdSBwbGVhc2UgbnVtYmVy
IHRoZSBwYXRjaGVzIGluIHRoZWlyIGNvcnJlY3Qgb3JkZXIuDQo+IA0KPiBUaGVyZSBpcyBubyBj
b3JyZWxhdGlvbiBiZXR3ZWVuIHRoZSBuYW1lcyBvZiB0aGUgcGF0Y2hlcywgYW5kIGVpdGhlciB0
aGUNCj4gY29tbWl0IHRpdGxlLCBvciB0aGUgb3JkZXIgaW4gd2hpY2ggdGhleSBzaG91bGQgYmUg
YXBwbGllZC4NCg0KSSdkIHNwZWNpZmljYWxseSBnb25lIGFuZCBzb3J0ZWQgdGhlIGF0dGFjaG1l
bnRzLCBhbmQgYXMgcGVyIHRoZQ0KbGlzdCBhcmNoaXZlcyB0aGlzIHNvcnRpbmcgaGFzIGluZGVl
ZCBiZWVuIHByZXNlcnZlZC4NCg0KPiBJJ20gY3VycmVudGx5IGhhdmluZyBhbiBleGNlZWRpbmds
eSAiZnVuIiB0aW1lIHRyeWluZyB0byB0dXJuIHRoaXMgYmFjaw0KPiBpbnRvIGEgZ2l0IHRyZWUu
wqAgKE5vIHBvaW50IHJlc2VuZGluZyB0aGlzIHNlcmllcywgYmVjYXVzZSBJJ3ZlIGRvbmUgaXQN
Cj4gbm93LikNCg0KSSdtIHNvcnJ5IGZvciB0aGlzLg0KDQo+IFAuUy4gT2YgY291cnNlLCBgZ2l0
IGZvcm1hdC1wYXRjaGAgaXMgdGhlIHJlY29tbWVuZGVkIHdheSB0byBkbyB0aGlzLA0KPiBidXQg
dGhlbiBhZ2Fpbiwgc28gaXMgYGdpdCBzZW5kLWVtYWlsYCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoN
ClN1cmUgLSBmb3IgcGVvcGxlIHVzaW5nIGdpdCBmb3IgdGhlaXIgZGV2ZWxvcG1lbnQgd29yay4g
SSBjYW4gb25seQ0Kc3RhdGUgYWdhaW4gdGhhdCBJJ20gaGFwcHkgd2l0aCBxdWlsdCBpbnN0ZWFk
Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
