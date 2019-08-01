Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199107DF86
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 17:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htDMo-0003UG-RO; Thu, 01 Aug 2019 15:51:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htDMn-0003UB-AQ
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 15:51:45 +0000
X-Inumbo-ID: 41159998-b474-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 41159998-b474-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 15:51:44 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  1 Aug 2019 15:51:37 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 1 Aug 2019 15:46:40 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 1 Aug 2019 15:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcqjLpfg2yycQiPX+EYF+jc8zcn40TqZD/LZ7uSyPNbMR94MI7uV9VLHFDYuzROpYdgOnDayArnQWG/cDwGY8m89/3dr+KHNbUaBgKNpX8ib43h/Fm58FKqHJc7FNcGz9juFpnY7QL4PmKwn+dbrLDbf0HKpxNT9qCEW2bxGLNp4ZWNHEtNUedhgRg3TSW2/tth5PLX4UVNpHpXNqfv2A3t9Z7tWsNcxq1Hjrm1/pWtsnG7fBxOC600cpIkfFW1MI7AuAtXskxd5420xPYvlcNnTfg3a54WuPHPXgKvONKbv1hQf7ZUpQNSLZWgyEUSqyCE+Uik2UGZ6I+hfgtHYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRLPRf71FyrSPuhygtv08waS438C13BDw4DnxcGUQng=;
 b=OnGY9pmQ8oZLmI8YObk+BkJ7l358Vha6921GjODGYI1jnSpDCHod3Tun0+P6kebY1xEH+zrQyJsLVE+oWhEub1VFzgskS3p4bJjlVOsv8v10OyWTD/uroXeh1GZJkpTqavA/yBz/Uv0T9yZ4l+6n6QqIMHDCjhgo8jiwUiYXHo4udJI4N0MNUzqb38cV+G/dmDg6FXkx5dkHcCYQL6EBFFr8jyuUuSlLJFwtsAB1UrJBOczA3QOnayi3o85J2mWkczCeX8g5ssoOCnI2o/eQIEhGHDaCFsVmJFKTS8D6a6CTe5+Sy1hZorGiS1iEw3fTpuO+YK9u9qeG6LSgR2pkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3313.namprd18.prod.outlook.com (10.255.137.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 15:46:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 15:46:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Oleksandr <olekstysh@gmail.com>
Thread-Topic: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
Thread-Index: AQHVSHMGyAlemcbWoE2ESYTmEuHFv6bmVsbbgAAEHCWAAACGAIAABgBkgAAOSoA=
Date: Thu, 1 Aug 2019 15:46:39 +0000
Message-ID: <3c42f553-7030-2dd4-cb85-319bd81495ff@suse.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
 <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
 <5e9ddd34-30d4-118a-ed76-89a11e3c7adf@gmail.com>
In-Reply-To: <5e9ddd34-30d4-118a-ed76-89a11e3c7adf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4665c990-646d-4762-b49a-08d716977144
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3313; 
x-ms-traffictypediagnostic: BY5PR18MB3313:
x-microsoft-antispam-prvs: <BY5PR18MB331358D1B8BF6496BB8D3917B3DE0@BY5PR18MB3313.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(189003)(199004)(31696002)(71200400001)(71190400001)(6246003)(2906002)(76176011)(6116002)(3846002)(99286004)(36756003)(52116002)(80792005)(8676002)(68736007)(81156014)(305945005)(4326008)(86362001)(7736002)(53936002)(81166006)(6512007)(66476007)(31686004)(64756008)(66446008)(66556008)(6436002)(66946007)(6486002)(229853002)(4744005)(54906003)(25786009)(316002)(8936002)(1411001)(486006)(478600001)(5660300002)(26005)(2616005)(11346002)(14454004)(14444005)(256004)(476003)(446003)(186003)(6506007)(53546011)(102836004)(66066001)(386003)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3313;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dOLGT3RVF8wlmxXkRZY/3dKjL39OI4j0AQz0OCAgX/tpL4H7NiuOLndpV7Q0iEDirYDFxNcAFsqWw2daQwUP04p7QDFlddlfYGwdBDzGMObA7oIzBLhYPHKM5RXvomPDUBs9Z0t92EnSraQdHiZbjZfBemXBznL/q0Xh5/cM54ZQw4mo4N/18pmz651fIqx1CVPL7aCvG6rVT6YBlNx4MVtbHkyNxkiPY1ioNJnRcKAt/AnhYc6BJQd5oo3GkVRr8dL+wt6yZRhY82V0zOFwlS1NKs7M2TjchD9B6p05XFCh/74TM2QEzyQvaPypmsGQnIrsYhT88vNE4NneSaaIyA970VHWdB74KOgptIJB7Ut2XHmSYup0qYN+rkPB9dGf0T4DbYiKrPisFwOingSs9Ks/uWHvsxNFgumoI14DNwM=
Content-ID: <BF67DB73D28D0D44882DBE625CEFF542@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4665c990-646d-4762-b49a-08d716977144
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:46:39.4164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3313
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxNjo1NCwgT2xla3NhbmRyIHdyb3RlOg0KPiBPbiAwMS4wOC4xOSAxNzoz
NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMS4wOC4yMDE5IDE2OjMxLCBPbGVrc2FuZHIg
d3JvdGU6DQo+Pj4gwqAgwqBUaGlzIGlzIG5lZWRlZCBmb3IgdGhlIHVwY29taW5nIFYyIG9mIHRo
ZSBJUE1NVSBkcml2ZXIgKEFSTSkgWzFdIHdoaWNoIG1heSByZXF1ZXN0DQo+Pj4gwqAgwqBkZWZl
cnJlZCBwcm9iaW5nIChyZXR1cm5zIC1FUFJPQkVfREVGRVIpIGRlcGVuZGluZyBvbiB3aGF0IGRl
dmljZSB3aWxsIGJlIHByb2JlZCB0aGUgZmlyc3QNCj4+PiDCoCDCoChSb290IGRldmljZSBtdXN0
IGJlIHJlZ2lzdGVyZWQgYmVmb3JlIENhY2hlIGRldmljZXMuIElmIG5vdCB0aGUgY2FzZSwNCj4+
PiDCoCDCoGRyaXZlciB3aWxsIGRlbnkgZnVydGhlciBDYWNoZSBkZXZpY2UgcHJvYmVzIHVudGls
IFJvb3QgZGV2aWNlIGlzIHJlZ2lzdGVyZWQpLg0KPj4+DQo+Pj4gQXMgd2UgY2FuJ3QgZ3VhcmFu
dGVlIGEgZml4ZWQgcHJlLWRlZmluZWQgb3JkZXIgZm9yIHRoZSBkZXZpY2Ugbm9kZXMgaW4gRFQs
IHdlIG5lZWQgdG8gYmUgcmVhZHkgZm9yIHRoZSBzaXR1YXRpb24gd2hlcmUgZGV2aWNlcyBiZWlu
ZyBwcm9iZWQNCj4+PiBpbiAiYW55IiBvcmRlci4gU28sIGZyYW1ld29yayAoZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vaW9tbXUuYykgd2lsbCBiZSBtb2RpZmllZCBhIGJpdCB0byBiZSBhYmxlIHRv
IGhhbmRsZSAtRVBST0JFX0RFRkVSIHJldHVybmluZyBieSBkcml2ZXIuDQo+PiBJJ20gc3VyZSB0
aGlzIGNhbiBiZSBoYWQgd2l0aG91dCBpbnRyb2R1Y2luZyBhIG5ldyBlcnJvciBjb2RlLg0KPiAN
Cj4gQnkgcmV1c2luZyBleGlzdGluZyBvbmUgKEVBR0FJTiBjb21lcyB0byBtaW5kKT8NCg0KRm9y
IGV4YW1wbGUuIE9yIGJ5IHVzaW5nIHNvbWUgcG9zaXRpdmUgdmFsdWUgaW5zdGVhZCBvZiB0aGUg
KG5lZ2F0aXZlKQ0KZXJybm8uaCBvbmVzLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
