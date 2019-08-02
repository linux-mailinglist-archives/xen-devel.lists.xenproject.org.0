Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EB7FCBE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 16:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htYra-0007Iq-Dx; Fri, 02 Aug 2019 14:48:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htYrY-0007If-L0
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 14:48:56 +0000
X-Inumbo-ID: a5d91d79-b534-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5d91d79-b534-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 14:48:55 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 14:48:53 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 14:44:05 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 14:44:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnLr8xEzZS2LsIlkxCEyeDfTqtFKUuXNkE9Nh8VNQLmXkcaDOKPTyR0/lxk9C85X5/uvJ+cSES1V9vCmQYmR8edKgOKYmX8Vx1NohefA+YzJyexxtR7ze4WE8Utb+3rdUhud5L3cEO8OKa9xqqkE8zudeobTj0IIK1es5ZbUYEzFo6YJLhN4i/1JtCcewH+RpVQB1RbcU+GvGWrvoyHM7TWbSh7GBdc+poxK7JhS4wkiWLkilViI8g3w123u52UyTffd2KEiCSCyMUZZW3hb5absrJ5ktQciJnzNkN88b5An7f55YDuCODzInptuIV/sjbD5WKhWcC/Zni/8hy5VIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urzbp8ybDTIqPAHpPgFzqz7hmKaO9QXrS6RXuoo6GOs=;
 b=kN55xmA0pXkeCfAQlPK1Y9XYORaw/BZpSQGh1GNhGkxNsV9QkWzW9Ynf78F7EzB+1h23Mynx/RtXyL1DvMSjvF7HRjxiYVeAurSwc5iWQ48pTHgVVxx9EreOq7+8NA7JxSaQ/Mql6v1i4yDRN5itzQYesi4Vb5a0cKlyqlBtUM8/Dc6esoGI2FoSv1ZgIF9QDWs03Jum3RnG/Fnoe8o9xktrnRIG67mSp5mFajVHmWvBjrbc2QT9F/vkzFEyGoYQoXAjCUzCmjXvkQ/12a1kpHwlWwM3q91m8kVG8hBV1/PeWDHyRhXAoC9ePXszp52ypMea9IwFr/vMqJZMXfVsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3098.namprd18.prod.outlook.com (10.255.76.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 14:44:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 14:44:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH] fix BUG in gnttab_unpopulate_status_frames()
Thread-Index: AQHVRvYU53mQ2TT1206aIElM8FExd6bn84QA
Date: Fri, 2 Aug 2019 14:44:03 +0000
Message-ID: <a1525160-a23d-59cb-74a1-ed3f70a535e6@suse.com>
References: <20190730164401.34097-1-paul.durrant@citrix.com>
In-Reply-To: <20190730164401.34097-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0169.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17f67d7c-fdcf-4abc-8b09-08d71757dd07
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3098; 
x-ms-traffictypediagnostic: DM6PR18MB3098:
x-microsoft-antispam-prvs: <DM6PR18MB3098631335A153AFC807B1A5B3D90@DM6PR18MB3098.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(189003)(199004)(102836004)(86362001)(186003)(25786009)(26005)(8936002)(66946007)(71200400001)(386003)(11346002)(66476007)(66556008)(5660300002)(64756008)(66446008)(6246003)(54906003)(7416002)(316002)(6486002)(36756003)(99286004)(52116002)(53546011)(71190400001)(14444005)(66066001)(31696002)(2906002)(4326008)(6916009)(478600001)(6512007)(305945005)(7736002)(6506007)(256004)(6116002)(53936002)(3846002)(76176011)(6436002)(14454004)(476003)(2616005)(31686004)(229853002)(68736007)(80792005)(486006)(446003)(81156014)(8676002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3098;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pzIe2A5LQ9DPkbOJCX/oqiNuywD5O2Q/uYtpGjBZK9lKbVpPUZXU/jhH/s7jQshc2vtcNfY8JfyaBMRqgZ93AsbO7ka+IYxIZZUGGx+Gi5QRez0eXSwuHqt8JQG2DesorSKxYj3PMAWlTfEfYJ2bs7RtxRLQzENdFXlCG4FKD23J+fOfaqOGtIwiWAGPTNMlav7mVBQr2R7y/ljuW8pOGXkAsxad5NeFOWAeuWvcsQuKxc9QfWheIVPRH23AiTHEZI7+Q1rk5o/rSlzrcUD8OV/QNw7Yc6YWynh+9Bh31dhRSz5yWMNymHh5cL6xpPNBPI9/6CB/5b7zFMIoBGfj0hN3OvGS6h2rjwlnon1698Op6oOyUncWHw6aEfGt4xdX5JBw1wGMsF/0Z4iRsT7JseYRUqfxEKkKMxb5CZj/sCs=
Content-ID: <8B3C8F28635C0E41B619171C858EBAA9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f67d7c-fdcf-4abc-8b09-08d71757dd07
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 14:44:03.6086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3098
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] fix BUG in gnttab_unpopulate_status_frames()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxODo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+IEBA
IC0xNjgyLDYgKzE2ODIsMTQgQEAgZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1lcyhzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZ3JhbnRfdGFibGUgKmd0KQ0KPiAgICAgICAgICAgc3RydWN0
IHBhZ2VfaW5mbyAqcGcgPSB2aXJ0X3RvX3BhZ2UoZ3QtPnN0YXR1c1tpXSk7DQo+ICAgICAgICAg
ICBnZm5fdCBnZm4gPSBnbnR0YWJfZ2V0X2ZyYW1lX2dmbihndCwgdHJ1ZSwgaSk7DQo+ICAgDQo+
ICsgICAgICAgIGlmICggIWdldF9wYWdlKHBnLCBkKSApDQo+ICsgICAgICAgIHsNCj4gKyAgICAg
ICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwNCj4gKyAgICAgICAgICAgICAgICAgICAgIkNvdWxk
IG5vdCBnZXQgYSByZWZlcmVuY2UgdG8gc3RhdHVzIGZyYW1lICV1XG4iLCBpKTsNCj4gKyAgICAg
ICAgICAgIGRvbWFpbl9jcmFzaChkKTsNCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiArICAgICAgICB9DQo+ICsNCj4gICAgICAgICAgIC8qDQo+ICAgICAgICAgICAgKiBGb3IgdHJh
bnNsYXRlZCBkb21haW5zLCByZWNvdmVyaW5nIGZyb20gZmFpbHVyZSBhZnRlciBwYXJ0aWFsDQo+
ICAgICAgICAgICAgKiBjaGFuZ2VzIHdlcmUgbWFkZSBpcyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4g
aXQgc2VlbXMgd29ydGgNCj4gQEAgLTE3MDgsNiArMTcxNiw3IEBAIGdudHRhYl91bnBvcHVsYXRl
X3N0YXR1c19mcmFtZXMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGdyYW50X3RhYmxlICpndCkN
Cj4gICANCj4gICAgICAgICAgIEJVR19PTihwYWdlX2dldF9vd25lcihwZykgIT0gZCk7DQo+ICAg
ICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYocGcpOw0KPiArICAgICAgICBwdXRfcGFnZShwZyk7
DQo+ICAgDQo+ICAgICAgICAgICBpZiAoIHBnLT5jb3VudF9pbmZvICYgflBHQ194ZW5faGVhcCAp
DQo+ICAgICAgICAgICB7DQo+IA0KDQpJIGRpc2xpa2UgdGhpcyBhcHByb2FjaCwgYW5kIG5vdCBj
aG9zaW5nIHRoZSBhbHRlcm5hdGl2ZSBvZiBleGNsdWRpbmcNCnhlbmhlYXAgcGFnZXMgaW4gdGhl
IGNoZWNrIGluIHB1dF9wYWdlX2FsbG9jX3JlZigpIChhcyBJIGhhZCByZWNvbW1lbmRlZA0KZWxz
ZXdoZXJlKSBzaG91bGQgYXQgbGVhc3QgYmUgZGlzY3Vzc2VkIGluIHRoZSBkZXNjcmlwdGlvbi4g
SXQgaXMgdGhlDQp2ZXJ5IG5hdHVyZSBvZiB4ZW5oZWFwIHBhZ2VzIHRoYXQgdGhleSB3b24ndCBn
ZXQgZnJlZWQsIGFuZCBoZW5jZSBkb24ndA0KbmVlZCB0aGlzIGV4dHJhIHJlZiB0byBiZSBoZWxk
IGZvciBjbGVhcmluZyBQR0NfYWxsb2NhdGVkLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
