Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C800359866
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 12:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgo6D-0000aV-RS; Fri, 28 Jun 2019 10:27:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgo6C-0000Zx-5f
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 10:27:20 +0000
X-Inumbo-ID: 4baab2a2-998f-11e9-b7f3-9306b3668e1d
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4baab2a2-998f-11e9-b7f3-9306b3668e1d;
 Fri, 28 Jun 2019 10:27:15 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 28 Jun 2019 10:26:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 28 Jun 2019 10:26:16 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 10:26:15 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2522.namprd18.prod.outlook.com (20.179.105.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Fri, 28 Jun 2019 10:26:14 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf%4]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 10:26:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 0/5] xen/gnttab: XSA-295 followup
Thread-Index: AQHVLZvp7NJO1xtSNka53rmid4p7vA==
Date: Fri, 28 Jun 2019 10:26:14 +0000
Message-ID: <798b6bfa-d954-7cfd-345e-4bb5af369da2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:5::36)
 To DM6PR18MB3401.namprd18.prod.outlook.com (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9d82eb4-0fcc-49d5-a869-08d6fbb30c31
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2522; 
x-ms-traffictypediagnostic: DM6PR18MB2522:
x-microsoft-antispam-prvs: <DM6PR18MB25228286B9DDF9F4068AE915B3FC0@DM6PR18MB2522.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(2501003)(8936002)(25786009)(305945005)(71190400001)(71200400001)(7736002)(6916009)(86362001)(478600001)(14454004)(5660300002)(81166006)(8676002)(36756003)(558084003)(80792005)(256004)(31696002)(26005)(2351001)(2906002)(68736007)(81156014)(186003)(72206003)(6436002)(486006)(4326008)(54906003)(53936002)(476003)(102836004)(6512007)(6116002)(316002)(31686004)(99286004)(3846002)(386003)(53546011)(6486002)(5640700003)(66476007)(66556008)(6506007)(66446008)(229853002)(66066001)(73956011)(66946007)(6246003)(2616005)(52116002)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2522;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0NswgH6AzZGlmZBuvW1lV0k1g2smOS5bpx6FcQpnhLShbvWZB+kgK1u1XokD3Kopkzsxp+8PPabS6I2ZR05H0JpOZN9iNC0ALIZ6fLF0k+nls+w4Vn0wMNoQYD6+HXL/oBOyd6ATqtUUKuQznok0Pu/w23gQKthihfXRjix1P/PqwhZZANuh4nrAXH8FEf2DzyWvJuQ7AK3YS8QuuRZxl+akFRN1Gqi9oR7QbZe8ExR3jrKTqhd4eIGoyu0nmswtNlvtDOsaQWM+i3wn1y3fWAdyD2SuUFiUtN9eKLF83r30aXXy11gWsYqVZNNRJa7osot8/0Jk/ASv/lvQwpF75tEvif8jxyqiOPI1W5fppTNOh+aKzz4t9dUr98+ZagqBfroJYji9+cOm4pp46JEcVWO6MZDzqUYDX5QCBD9WErY=
Content-ID: <CA3F3BC8EA44244FBD11C051A51B43C7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d82eb4-0fcc-49d5-a869-08d6fbb30c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 10:26:14.4251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2522
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 0/5] xen/gnttab: XSA-295 followup
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDExOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+ICAgeGVuL2dudHRhYjogUmVkdWNlIGNvbXBsZXhpdHkgd2hlbiByZWFkaW5nIGdyYW50
X2VudHJ5X2hlYWRlcl90DQo+ICAgeGVuL2dudHRhYjogUmVkdWNlIGNvZGUgdm9sdW1lIHdoZW4g
dXNpbmcgdW5pb24gZ3JhbnRfY29tYm8NCj4uLi4NCj4gICB4ZW4vZ250dGFiOiBGb2xkIGFkamFj
ZW50IGNhbGxzIHRvIGdudHRhYl9jbGVhcl9mbGFncygpDQoNClRoZXNlIHRocmVlDQpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
