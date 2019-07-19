Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635716E267
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:24:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoO8y-0001b9-6n; Fri, 19 Jul 2019 08:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoO8w-0001b1-9P
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:21:30 +0000
X-Inumbo-ID: 31f2313a-a9fe-11e9-9d75-1f27088b8539
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31f2313a-a9fe-11e9-9d75-1f27088b8539;
 Fri, 19 Jul 2019 08:21:25 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 08:21:19 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 08:19:18 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 08:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElyR94bxoOJc80r/5AUNrBdQCYdTSi1EZS8/D+jF4av2jWFP8LIi+QkP8GnfG8m4v22FlY3gK5SNBnP7dbcklYRklZfnOSI1Osr/omXegnrkja/rU57NDeS2cA/TxjF6urjrxZ8Lc/2mxyjJHo7O8GRQ5UcNx5cOe5QCWRzge4N2q1+tJD9ZTS9lgVFQmxNsvzN00TtfYjY0zFAbHOPjwRVGgUuIDJVzpMrNMl/WKAeyYDkT5K4gbPMvjMCVgZzdl/kxszgZ01Gn4FPhdkbiOj1qSy0wneIRqQcyhIEeK5TulbQl8MZCyFz1sXWVikynfvaA1kvuKwJSvnezSYSIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBaveRQPwcNTfttfwxaNOvocKHbzOzNvlTPED4tXMnM=;
 b=XtnuQf+9VXAeu+dAbWw3Ru8mac8s9kJJn6S9AcOnRAArOi9UvCHLfUhOrR5YG+E9L/WyoN5AcqwipRDL0u6e1abMn+q9xc5Bv7ib9CtktmBmca9zzqLnDNIPWt6N11a6sWxI8+Ws0+MdBXH2/onBnyMQe9+TQs7PFuojPCp/jYgW//6mObj/w1Kw/JnEZvAhs37101VTRs8CWJtQyc+Yf5z+IO19Z2xYGJYz3wVrCNaSkjLRClFKfXANU25waqMdmqDKbXUcv2HCb0EkPUwB/B15pkm1kid7NkeqXUQ7qSXrQrwVegUW64pN1vQWSKwxKic07g+YFzHw1cqXkPmcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3068.namprd18.prod.outlook.com (20.179.48.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 08:19:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 08:19:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: printf formatter for pci_sbdf_t
Thread-Index: AQHVPKkbqe/gqkIsCkyMLC3anRUky6bPCrxPgAKRP4A=
Date: Fri, 19 Jul 2019 08:19:17 +0000
Message-ID: <d4236c4b-602f-734c-248c-30c26992b0d8@suse.com>
References: <20190717140810.a5a4bhmm7fb6oah5@Air-de-Roger.citrite.net>
 <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
In-Reply-To: <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:6:1::48)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a9a38fe-70f1-48fe-d63a-08d70c21ca9d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3068; 
x-ms-traffictypediagnostic: DM6PR18MB3068:
x-microsoft-antispam-prvs: <DM6PR18MB3068EC9A49D4AD1504BDE986B3CB0@DM6PR18MB3068.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(186003)(8936002)(110136005)(31686004)(53546011)(86362001)(6486002)(81166006)(6436002)(7736002)(99286004)(102836004)(81156014)(14444005)(64756008)(66446008)(66476007)(256004)(316002)(305945005)(6506007)(386003)(66556008)(66946007)(14454004)(71190400001)(71200400001)(80792005)(6116002)(3846002)(53936002)(36756003)(6512007)(6246003)(5660300002)(25786009)(66066001)(446003)(229853002)(76176011)(486006)(8676002)(52116002)(478600001)(68736007)(2616005)(11346002)(4326008)(31696002)(476003)(2906002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3068;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kYXz9EAb9x1p3y16XjxOEuy++hJY0DJVANYffSI6QjZ0pU0Oqt6RAv7xWrdls6JW+Ph9Bv6NkbVbtrS2iydwCSyYKgbWErIBOI+ONbLS8ffrje+uWX7jr76vIKZIcDEsxjtmMxk1jK6bZH/rBh3XZfkefrhbNOnaEMdBIhV4UVPQztd+dCKiJLHpGtBsCI1ShjJ8wiFuLh541n7JPsgELytTbXXwIazFoRoXcggSRwcw5G+GPiHbTxqx5G4nkqHCxFlBXDIAPoNxsvn3xKVrM30eUG1pPiJNJQr8HiFVrh6F72uKW7nMOs4jOCXlBlO7tnIIxidQlduIa/ze0PvIWLOkaE9G9fIHqCNEvnMW+Y0nDUCszGEU9cDoNjOwS3Aqz1g30teP8Y8Syu62L5aihDx2+YmxY9Iz/05xFqP5P3E=
Content-ID: <19B0325B09D3A54C9B9D950175D047C2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9a38fe-70f1-48fe-d63a-08d70c21ca9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 08:19:17.1628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3068
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] printf formatter for pci_sbdf_t
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxOTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAxNTowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IEhlbGxvLA0KPj4NCj4+IEFzIHBh
cnQgb2Ygc29tZSBQQ0kgcmVsYXRlZCBjbGVhbnVwIEknbSBkb2luZywgd2hpY2ggaW5jbHVkZXMN
Cj4+IGV4cGFuZGluZyB0aGUgdXNhZ2Ugb2YgcGNpX3NiZGZfdCwgSSdtIGFsc28gcGxhbm5pbmcg
dG8gYWRkIGEgY3VzdG9tDQo+PiBwcmludGYgZm9ybWF0dGVyIGZvciBwY2lfc2JkZl90IFswXSwg
c28gdGhhdCBhIFNCREYgY2FuIGJlIHByaW50ZWQNCj4+IHdpdGhvdXQgaGF2aW5nIHRvIHNwZWNp
ZnkgZm91ciBmb3JtYXR0ZXJzIChhbmQgcGFzcyBmb3VyIHBhcmFtZXRlcnMpDQo+PiBlYWNoIHRp
bWUgKCUwNHg6JTAyeDolMDJ4LiV1KS4NCj4+DQo+PiBUaGVyZSdzIGJlZW4gc29tZSBkZWJhdGUg
b24gdGhlIHByZXZpb3VzIHZlcnNpb24gYWJvdXQgd2hldGhlciB0aGUNCj4+IGZvcm1hdHRlciBz
aG91bGQgYmUgJXBwIG9yICVvcCwgYW5kIEkgd291bGQgbGlrZSB0byBzZXR0bGUgb24gb25lIG9m
DQo+PiB0aGVtIGJlZm9yZSBzZW5kaW5nIGEgbmV3IHZlcnNpb246DQo+IA0KPiBJIGFtIGZpcm1s
eSBvcHBvc2VkIHRvIG92ZXJsb2FkaW5nICVvLg0KDQpUaGVyZSdzIGFjdHVhbGx5IG9uZSBtb3Jl
IGFyZ3VtZW50IGFnYWluc3QgJXA6IFByZXZpb3VzbHkgeW91DQpkaWQgZXhwcmVzcyBhIGRlc2ly
ZSBmb3Igb3VyICVwIGV4dGVuc2lvbnMgdG8gc3RheSBzb21ld2hhdCBpbg0Kc3luYyB3aXRoIExp
bnV4J2VzLiBMaW51eCBpcyB1c2luZyBxdWl0ZSBhIGZldyBvZiB0aGUgYXZhaWxhYmxlDQpjaGFy
YWN0ZXJzIGFscmVhZHksIHNvIHRoZXJlJ3MgYW4gaW5jcmVhc2luZyByaXNrIG9mIGNvbmZsaWN0
cy4NClVzaW5nICVvIGhlcmUgd291bGQgcmlzayBhIGZ1dHVyZSBjb25mbGljdCBvbmx5IGlmIExp
bnV4DQpldmVudHVhbGx5IGRlY2lkZWQgdG8gYWxzbyBvdmVybG9hZCAlby4NCg0KQW5kIG9uZSBt
b3JlIHJlbWFyazogSWYgd2Ugd2VyZSB0byBpbnRyb2R1Y2UgYSBtb3JlIGdlbmVyaWMNCiJkZXZp
Y2UgaWRlbnRpZmllciIgZXh0ZW5zaW9uLCB0aGVuIEknZCBvYnZpb3VzbHkgYmUgZmluZSB3aXRo
DQp1c2luZyAlcC4gQWZ0ZXIgYWxsIHdlJ2QgdGhlbiB3YW50IHRvIHBhc3MgaW4gc3RydWN0IGRl
dmljZSAqLg0KSSdtIGFjdHVhbGx5IHN1cnByaXNlZCBMaW51eCBkb2Vzbid0IGFscmVhZHkgaGF2
ZSBzdWNoIGEgZ2VuZXJpYw0KZm9ybWF0dGVyLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
