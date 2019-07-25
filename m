Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1074DBB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqcSX-0000Aw-UV; Thu, 25 Jul 2019 12:02:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqcSV-0000Aq-Vl
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:02:56 +0000
X-Inumbo-ID: 1fc8757a-aed4-11e9-bc0a-937200d97c00
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fc8757a-aed4-11e9-bc0a-937200d97c00;
 Thu, 25 Jul 2019 12:02:52 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 12:02:50 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 11:59:41 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 11:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtXPmbttLW0Qxye7sAv2jr/yd8HL+xNpLPCAmBpSPZBGxUM+C7zRKocAfAQLFRTkABgt/wphJTwb7DQASOi76WQdj9ezNEZZa5vcT0p3ctlpCfNZVTCZWctb72nhxm69GTLX9xUzJAP//vGUNVtAhbBXEG0EUnZgN+KI2OgG4gmmSFsa32MR4Qw9APD9j4PkDmXclpffHp6k9AOrvc767cQyJSsT7XLOnHuH73o/jxpueJCCDqEBzO7b9m9j05mf9OWYJ+FNrGMzWH+yQpr99QqIc5oK/SvJqpNmCywWtX7q7TUfcYf74wKukzVQmB8fuA7lo/QFKfjy0gjvLk7ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDh3WRpUJMZG4f0tUSsFRJmSsz7kj9tTf+z+iTFNHzY=;
 b=i6+/gEWmqoklbILFInqAja63SS6QUJ6YElNs5qdI2Hb/nPGTfEWQ+Wh1bZKvvXkEtL/cN/t+aYTjIYoohsfvH8q5I+7mmzXgwckXNbSu6qj2rfZM3Z4F8+W267O/RATBP6aZ2Pr+viSLt4HK8u8z775DkfX9yP6rAHZbM8T2fQVroPxWJStOrhDtWkObOi7KHevhFnQc1g+t5kpEEaRB0zPw2aJxVJusYeAj44m9CnLtw8dZzBbxWnyfwV07BNgPlW+BU39ynLPlSTY5ISOqlCt9XGXYJitGC6H5G51m+jgHq+vxHJnQdUNTnrTKIHJpuwcu1uKuccbk+05/SPHapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3378.namprd18.prod.outlook.com (10.255.139.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Thu, 25 Jul 2019 11:59:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 11:59:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 3/3] x86/dmi: Constify quirks data
Thread-Index: AQHVQkdJ4D6dRHL0Jkazew/ijLBoYqbbJWCAgAACvw+AABQlgA==
Date: Thu, 25 Jul 2019 11:59:40 +0000
Message-ID: <90335077-df80-39d1-39a8-4c140f825135@suse.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
 <20190724174256.5295-4-andrew.cooper3@citrix.com>
 <ebc911a1-dd18-9e22-6b7d-24401ead513d@suse.com>
 <ac7cc53b-c2cc-b85c-baf5-5d01e0391872@citrix.com>
In-Reply-To: <ac7cc53b-c2cc-b85c-baf5-5d01e0391872@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ef4b9ea-fdaa-44f2-f804-08d710f792a2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3378; 
x-ms-traffictypediagnostic: BY5PR18MB3378:
x-microsoft-antispam-prvs: <BY5PR18MB33784EAD5F6042C9088C876DB3C10@BY5PR18MB3378.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(6436002)(2906002)(3846002)(6116002)(86362001)(36756003)(478600001)(14454004)(31696002)(6916009)(31686004)(7736002)(305945005)(66946007)(229853002)(6486002)(66446008)(64756008)(66476007)(66556008)(4744005)(5660300002)(4326008)(26005)(6246003)(66066001)(25786009)(53936002)(68736007)(6512007)(71200400001)(71190400001)(2616005)(476003)(486006)(54906003)(11346002)(446003)(99286004)(80792005)(52116002)(14444005)(256004)(186003)(76176011)(102836004)(53546011)(386003)(6506007)(8936002)(8676002)(81156014)(81166006)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3378;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BsPIvogwlQUj11ZKZ6PpQBsr1jzT1ZHM7xV8rLcoWad7YoPma77/FjYnkCglbaY5O7mZCybdisPR0mWeEW0Elc+huQgPG7JCdYWvGZ99t5W5RepTH0QriKUbZ/Uk02l3fCGyjxZzxUJvDELxT6Dc72nUTHLB9+u4lXrPSjYEt1K8NbfMOebZ/WUDMxnaZdati256VxnPXazw3p1Nw+VGOfnLgczCsvChfS/as0QTzOUw+tP9/2YXhFL6PKU1l0L3ojxnVI5mW3PKLOy4/4MDKcI7dCptS84Eppd37j/Wk1lXUCdJ72t7jaqMIyZpFpXpIRoGR6qVqGrK/jIhLp4Hp98Hzl/UUJ37MedfspY661BAgH3T51jVAmfXv3iy55CQa4wSL1tT5kZPBpnNDWb0M8JrhdIFf28DuOsGU8QRJmI=
Content-ID: <F860F546B664C342891D3913C21BC580@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef4b9ea-fdaa-44f2-f804-08d710f792a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 11:59:40.4112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3378
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/3] x86/dmi: Constify quirks data
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxMjo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjUvMDcvMjAx
OSAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyNC4wNy4yMDE5IDE5OjQyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEFsbCBETUkgcXVpcmtzIHRhYmxlcyBhcmUgbXV0YWJsZSwg
YnV0IGFyZSBvbmx5IGV2ZXIgcmVhZC4NCj4+Pg0KPj4+IFVwZGF0ZSBkbWlfY2hlY2tfc3lzdGVt
KCkgYW5kIGRtaV9zeXN0ZW1faWQuY2FsbGJhY2sgdG8gcGFzcyBhIGNvbnN0IHBvaW50ZXIsDQo+
Pj4gYW5kIG1vdmUgYWxsIHF1aXJrcyB0YWJsZXMgaW50byBfX2luaXRjb25zdC4NCj4+IEkgdGhp
bmsgeW91IG5lZWQgdG8gdXNlIF9faW5pdGNvbnN0cmVsIHRocm91Z2hvdXQuDQo+IA0KPiBIbW0g
LSB3aGF0J3MgdGhlIHByYWN0aWNhbCBkaWZmZXJlbmNlP8KgIF9faW5pdGNvbnN0IGNlcnRhaW5s
eSBjb21waWxlcw0KPiBmaW5lIGZvciBtZS4NCj4gDQo+IChJJ3ZlIGdvdCBubyB2ZXN0ZWQgaW50
ZXJlc3QsIGJ1dCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSkNCg0KU29tZSBjb21waWxlciB2
ZXJzaW9ucyBkaXNsaWtlIG1peGluZyBvZiAuc2VjdGlvbiB3aXRoIHRoZQ0Kc2FtZSBuYW1lLCBi
dXQgZGlmZmVyZW50ICJ3cml0YWJsZSIgYXR0cmlidXRlcy4gV2hlbiBzdGF0aWMNCmluaXRpYWxp
emVycyBpbnZvbHZlIHJlbG9jYXRpb25zLCB0aGUgcmVzcGVjdGl2ZSBzZWN0aW9uDQpnZXRzIG1h
cmtlZCB3cml0YWJsZSBieSB0aGUgY29tcGlsZXIsIHdoZXJlYXMgd2hlbiB0aGV5DQpkb24ndCB0
aGUgc2VjdGlvbiB3b3VsZCByZW1haW4gcmVhZG9ubHkuIEhlbmNlIHRoaW5ncw0KZ2VuZXJhbGx5
IGJ1aWxkIGZpbmUgZWl0aGVyIHdheSBfdW50aWxfIGJvdGggYW4gaW5pdGNvbnN0DQppdGVtIHdp
dGggYW5kIG9uZSB3aXRob3V0IHJlbG9jYXRpb25zIGFwcGVhciBpbiB0aGUgc2FtZSBDVS4NCg0K
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
