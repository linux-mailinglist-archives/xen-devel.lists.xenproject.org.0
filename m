Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65E6BCA6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 14:56:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnjQI-0003nx-B3; Wed, 17 Jul 2019 12:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnjQH-0003ns-7j
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 12:52:41 +0000
X-Inumbo-ID: 75feceb0-a891-11e9-b039-a74e44beddb6
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75feceb0-a891-11e9-b039-a74e44beddb6;
 Wed, 17 Jul 2019 12:52:38 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 12:48:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 12:49:52 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 12:49:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmDms1uy3G3TEvMBbDw/d83a99FGJe4Nfyca36g1pihtttV3I+ttdIhdn9ZXXgaDHwxHKTle+4T17OlOFz+flgcAjyIk4QxRqgs1CdBi1KPYXH1eh3LOVzftp39DFo69TThMdYaGjPKoC0HUASM2t3tpb7eo5zUxBPsRK60spqmqr9/CVm2TAAzuNxMuXaxqOOLfazTWyEdqXJSaciTga09LrtmJ5e2bziCBtB1HpI/mdOch/pxxTW/l+B6hSUSbGoAljhWWFrM9aoZGLHcpFaU2jLD9qL5nZis7Mc7bDUwJdGoT10N1JtVnn30iHZ21BmAoX5+xcs3WIU5A5sCEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azA4yRd274fnGczU0bOqmU6PWpW/dur0908CSKnSlYc=;
 b=h873QasfawuL2fca0e/7yYFKOPUhOYVMdLjLAyOUeFVunMpt00LceEQ7lusBs2kdF2UOakMM0TLUmlxk3/auMN+TDQHL7sx4QtvtrnRg/szWBtr0+0d60vjQed2tFeQ+m6kakGiRLMkiBEuu8onuCU/pg2Yzj/FYqexHJJyNYSZGqpn7aZSZaP+H2xSnQpUGLShRzXPZEUXQly3MHNFu4rJASHyi0vW8N6AZiL5bjdHx6XPHguQS2MtOrkYAfgr6fXq7VDNFeXA/fJaGhyPcxYRGSd2mZERSHq4audZs1tRP0fGzZ9XJggAtxcmmQqouQpHDWSEyYCmK8G9urE0mDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2906.namprd18.prod.outlook.com (20.179.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 12:49:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 12:49:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVMZ95Pg5KTi9KKk6xsZ3jj2BciKbNYdpqgAE4SYCAABcgWoAAJ7cA
Date: Wed, 17 Jul 2019 12:49:49 +0000
Message-ID: <b53a0c6a-b24a-eea6-607d-18cc009dd8ee@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
 <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
 <97f3e531-6c25-b8fa-c1b0-b68a183365f0@suse.com>
 <20190717102658.psnrdlrjpb5kvm4e@Air-de-Roger.citrite.net>
In-Reply-To: <20190717102658.psnrdlrjpb5kvm4e@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0073.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::11) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5a4eacb-63d5-418a-0589-08d70ab54122
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2906; 
x-ms-traffictypediagnostic: DM6PR18MB2906:
x-microsoft-antispam-prvs: <DM6PR18MB290664B9A99B7A8F67821507B3C90@DM6PR18MB2906.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(3846002)(4326008)(6116002)(26005)(81156014)(14454004)(186003)(66556008)(305945005)(66476007)(2906002)(99286004)(66946007)(64756008)(7736002)(6512007)(8676002)(71190400001)(66446008)(81166006)(80792005)(76176011)(52116002)(478600001)(6246003)(6916009)(256004)(316002)(6486002)(86362001)(6436002)(66066001)(8936002)(5660300002)(71200400001)(53936002)(386003)(229853002)(53546011)(6506007)(54906003)(102836004)(476003)(2616005)(446003)(31686004)(36756003)(486006)(31696002)(11346002)(25786009)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2906;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZjaCMZnGPDUuNy3dPsnRm+OHOWWrELWZTqNSfaRY0xxT274cMRSPkE0yTVgbSDAqC9tBGmcc693giMJEBa8ePZp658IUhFGv8JZtWQhedeU6PJh3HCw52Zelk8Bjpzwr+ExxWYY22Q2JhlOnG8b/g+UP4DoAp5T4u2606LR96CpZMLyunIPjvemreOh/y9krop7T9ETkSGSPbtAFo/ELdWT1DacNO5Ektr6fxYlfoZgiGEI5cWMdrR4VBGOamytDM4EmTq1ccYpTGUfea+S+pzTIcUasoQX3AFgKwlJdnEKgubeICIPF7xprwCCcMuTvjflnqHKQ4rGd5ijYAXO1WI/+E/PtcnG0miltWjHnBDI00THlthmeRQuRiQDKpoP9MM/gil8e5Umapp7GsmaS3b8RT6jKDjCMN6umbtkt80U=
Content-ID: <C2FFFB48CDFFC341AD0DF3AAAEA140B5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a4eacb-63d5-418a-0589-08d70ab54122
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 12:49:49.6410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2906
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxMjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDE3LCAyMDE5IGF0IDA5OjA0OjU1QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMTYuMDcuMjAxOSAxNjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gT24gV2Vk
LCBKdWwgMDMsIDIwMTkgYXQgMDE6MDE6NDhQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMNCj4+Pj4gKysrIGIveGVuL2Fy
Y2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KPj4+PiBAQCAtMTEwLDYgKzExMCw4IEBAIGJvb2xlYW5f
cGFyYW0oImxhcGljX3RpbWVyX2MyX29rIiwgbG9jYWwNCj4+Pj4gICAgIA0KPj4+PiAgICAgc3Ry
dWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2VyICpfX3JlYWRfbW9zdGx5IHByb2Nlc3Nvcl9wb3dlcnNb
TlJfQ1BVU107DQo+Pj4+ICAgICANCj4+Pj4gK3N0YXRpYyBpbnQ4X3QgX19yZWFkX21vc3RseSB2
ZW5kb3Jfb3ZlcnJpZGU7DQo+Pj4NCj4+PiBBRkFJQ1QgZnJvbSB0aGUgY29kZSBiZWxvdyB0aGlz
IGlzIGEgdHJpLXN0YXRlICgtMSwgMCwgMSkuIENvdWxkIGl0DQo+Pj4gbWF5YmUgYmUgdHVybmVk
IGludG8gYW4gZW51bSB3aXRoIGRlZmluaXRpb25zIG9mIHRoZSBkaWZmZXJlbnQNCj4+PiBzdGF0
ZXM/DQo+Pj4NCj4+PiBJIHRoaW5rIGl0IHdvdWxkIG1ha2UgdGhlIHVzYWdlIGNsZWFyZXIuDQo+
Pg0KPj4gV2VsbCwgcGVyc29uYWxseSBJIHByZWZlciBkb2luZyBpdCB0aGlzIHdheSBmb3IgdHJp
c3RhdGVzLiBJJ2xsDQo+PiB3YWl0IHRvIHNlZSB3aGF0IG90aGVycyB0aGluay4NCj4gDQo+IEFj
aywgSSB0aGluayB0aGUgY29kZSBpcyBjb3JyZWN0IGhlbmNlOg0KPiANCj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpUaGFua3MuDQoNCj4g
QnV0IEkgcGVyc29uYWxseSB3b3VsZCBwcmVmZXIgYW4gZW51bSBvciBhdCBsZWFzdCBhIGRlc2Ny
aXB0aW9uIG9mDQo+IHRoZSBtZWFuaW5nIG9mIHRoZSB2YWx1ZXMgdmVuZG9yX292ZXJyaWRlIGNh
biB0YWtlLiBJTU8gaXQgd291bGQgaGVscA0KPiB1bmRlcnN0YW5kaW5nIHRoZSBjb2RlLCBzaW5j
ZSBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIGF0IGZpcnN0IHNpZ2h0Lg0KDQpJJ3ZlIGFkZGVkDQoN
Ci8qDQogICogVGhpcyBmaWVsZCBzdGFydHMgb3V0IGFzIHplcm8sIGFuZCBjYW4gYmUgc2V0IHRv
IC0xIGp1c3QgdG8gc2lnbmFsIGl0IGhhcw0KICAqIGJlZW4gc2V0IChhbmQgdGhhdCB2ZW5kb3Ig
c3BlY2lmaWMgbG9naWMgaGFzIGZhaWxlZCwgYW5kIHNob3VsZG4ndCBiZQ0KICAqIHRyaWVkIGFn
YWluKSwgb3IgdG8gKzEgdG8gaWdub3JlIERvbTAgc2lkZSB1cGxvYWRzIG9mIEMtc3RhdGUgQUNQ
SSBkYXRhLg0KICAqLw0KDQphaGVhZCBvZiB0aGUgZGVmaW5pdGlvbi4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
