Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F95D12C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 16:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiJN8-0004Wn-3R; Tue, 02 Jul 2019 14:03:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiJN6-0004Wi-LQ
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 14:03:00 +0000
X-Inumbo-ID: 18130890-9cd2-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18130890-9cd2-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 14:02:59 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 14:02:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 13:57:02 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 13:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=iPV0Q1A5bQM0cJ8tdcB5SMnMGB0JPQrXXj1Wnv6odSSXWqlX7bghvXZ8hMgZ/N2rHgszZ2ZutxPek2AsDHwyPxW6eFADMkTGRwA7nfTEMYxqAx8xJl/OhAZgWWU9gT1PNiOSu857PX4wub+8Wq86J7Z9oau8TEItOzx95CArQ8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJpdYOcElhjHVlzCkQd1Igdo5tWw6m0T+unSG0VPeAQ=;
 b=X90bCbwgPQSbWFFTdfNQJbg7JFZQQ0j3gTdL49Smmef4kPPz6JSC0TVtov1KO+tSrBqKIWdwNRe+30yFK15rRf/27L1d1wR3niBJDQ/4fNG28ftxtK+e6X2HWDm1bgvETfhm5earlRtX6wDYBkf0F9LJL/3ePEzPE9BszGvemKI=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3330.namprd18.prod.outlook.com (10.255.138.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 2 Jul 2019 13:56:59 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 13:56:59 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 04/10] AMD/IOMMU: use bit field for IRTE
Thread-Index: AQHVMNJcTg9MEvFh10irBTKBOm9ht6a3WlyA
Date: Tue, 2 Jul 2019 13:56:59 +0000
Message-ID: <15cd8e65-e4c2-7c28-c0bf-8a7701aae247@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DECD020000780023B984@prv1-mh.provo.novell.com>
 <cdf08c84-dbe8-7e2f-af6b-30e7a49acd72@citrix.com>
In-Reply-To: <cdf08c84-dbe8-7e2f-af6b-30e7a49acd72@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0110.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6464298-3551-45e3-a0d0-08d6fef526e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3330; 
x-ms-traffictypediagnostic: BY5PR18MB3330:
x-microsoft-antispam-prvs: <BY5PR18MB3330014CE22BE4AA6EC05430B3F80@BY5PR18MB3330.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(2906002)(66476007)(64756008)(71200400001)(66446008)(66556008)(71190400001)(31696002)(53936002)(3846002)(6116002)(72206003)(8936002)(4326008)(86362001)(6246003)(6512007)(66946007)(229853002)(73956011)(81156014)(54906003)(186003)(6436002)(26005)(36756003)(2616005)(53546011)(6506007)(386003)(476003)(446003)(11346002)(102836004)(486006)(5660300002)(7736002)(80792005)(14454004)(81166006)(478600001)(316002)(76176011)(52116002)(14444005)(256004)(31686004)(66066001)(25786009)(110136005)(305945005)(6486002)(8676002)(68736007)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3330;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WU4nnZ77a9S9+/oZIZvmZeiQUYbGyGicpziqaImdC2cGxmjBnSrpovjbJHTMJbsspBAOeQMHHckkwqykJvw/QkVrqopkYbqKG/d7RXEXCrqK7LlrRtaoSp1PCpfosVjrXyfZL3LGrXb748zjGeC5ViZnBUZNOFtIVCdNWCmozP7ToCT8iN2iirYhiO266ZmBwPCdtm96KkMRwnVMMufrBcwZqVc8NA5medCFVhCDfLTcbAZ0VbW1jWkaklTAOmsNBRHQkFXkrw/yemidW3zE3OorHtafG/j3TXO5e+iqhU3XuCJdoJ0bim1bXUssoZzzcCXsX/mv86AJXC3ysM7zAftWI/XpMZ0Fwty+90GARPqE+eLPV3y6avBYZ1OTmejCB67R2aV+f/jqBI66D77Uu+gLIvYtLcBc1XlMmgzHEhM=
Content-ID: <BD8A8621FEE87248831C939016F1DE30@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e6464298-3551-45e3-a0d0-08d6fef526e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 13:56:59.6089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3330
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 04/10] AMD/IOMMU: use bit field for IRTE
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNDozMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBBdCB0aGUgc2FtZSB0aW1lIHJlc3RyaWN0
IGl0cyBzY29wZSB0byBqdXN0IHRoZSBzaW5nbGUgc291cmNlIGZpbGUNCj4+IGFjdHVhbGx5IHVz
aW5nIGl0LCBhbmQgYWJzdHJhY3QgYWNjZXNzZXMgYnkgaW50cm9kdWNpbmcgYSB1bmlvbiBvZg0K
Pj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUgZW50cmllcyBpcyBub3Qg
dXNlZCB0byBtYWtlIGl0DQo+PiBpbXBvc3NpYmxlIHRvIFt3cm9uZ2x5LCBvbmNlIHRoZSAxMjgt
Yml0IGZvcm0gZ2V0cyBhZGRlZF0gcGVyZm9ybQ0KPj4gcG9pbnRlciBhcml0aG1ldGljIC8gYXJy
YXkgYWNjZXNzZXMgb24gZGVyaXZlZCB0eXBlcy4pDQo+Pg0KPj4gQWxzbyBtb3ZlIGF3YXkgZnJv
bSB1cGRhdGluZyB0aGUgZW50cmllcyBwaWVjZW1lYWw6IENvbnN0cnVjdCBhIGZ1bGwgbmV3DQo+
PiBlbnRyeSwgYW5kIHdyaXRlIGl0IG91dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiAtLS0NCj4+IHYyOiBuYW1lIHtnZXQsZnJlZX1f
aW50cmVtYXBfZW50cnkoKSdzIGxhc3QgcGFyYW1ldGVyICJpbmRleCIgaW5zdGVhZCBvZg0KPj4g
ICAgICAib2Zmc2V0Ii4gSW50cm9kdWNlIHVuaW9uIGlydGUzMi4NCj4+IC0tLQ0KPj4gSXQgd291
bGQgaGF2ZSBiZWVuIG5pY2UgdG8gdXNlIHdyaXRlX2F0b21pYygpIG9yIEFDQ0VTU19PTkNFKCkg
Zm9yIHRoZQ0KPj4gYWN0dWFsIHdyaXRlcywgYnV0IGJvdGggY2FzdCB0aGUgdmFsdWUgdG8gYSBz
Y2FsYXIgb25lLCB3aGljaCBkb2Vzbid0DQo+PiBzdWl0IHVzIGhlcmUgKGFuZCBJIGFsc28gZGlk
bid0IHdhbnQgdG8gbWFrZSB0aGUgY29tcG91bmQgdHlwZSBhIHVuaW9uDQo+PiB3aXRoIGEgcmF3
IG1lbWJlciBqdXN0IGZvciB0aGlzKS4NCj4gDQo+IFRoaXMgY29tbWVudCBpcyBzdGFsZS7CoCBI
b3dldmVyLCBJJ20gc3RpbGwgY29uZnVzZWQgYXMgdG8gd2hhdCB0aGUNCj4gcHJvYmxlbSB3aXRo
IHB1dHRpbmcgYSByYXcgaW4gdW5pb24gaXJ0ZV9iYXNpYyBpcy4NCg0KVGhhdCdsbCBhZ2FpbiBy
ZXF1aXJlIGFuIGludGVybWVkaWF0ZSAiZmxkcyIgKG9yIGhvd2V2ZXIgd2UgY2hvb3NlIHRvDQpu
YW1lIGl0KSB1bmlvbiBmaWVsZCBuYW1lIGZvciB0aGUgYml0ZmllbGQgc3RydWN0dXJlLCBvciBl
bHNlIG9uY2UNCmFnYWluIGluaXRpYWxpemVycyB3b24ndCB3b3JrIHdpdGggb2xkIGdjYy4NCg0K
PiBJbiBwYXJ0aWN1bGFyLCB0aGUgY29udGFpbmVyb2YoKSB1c2FnZSBpcyBjb21wbGljYXRlZCB0
byBmb2xsb3csIGFuZCBJDQo+IGRvbid0IHNlZSBpdCBhcyBiZWluZyBuZWNlc3NhcnkuDQoNCldl
bGwsIEkgY2FuIGRyb3AgaXQgaWYgd2UncmUgaGFwcHkgYWJvdXQgdGhlIGV4dHJhIGludGVybWVk
aWF0ZSBmaWVsZA0KbmFtZSAocGVyc29uYWxseSBJJ20gbm90LCBidXQgSSdkIGFjY2VwdCBpdCBp
ZiBpdCdzIGNvbnNpZGVyZWQgbGVzcyBiYWQNCnRoYW4gdGhlIGNvbnRhaW5lcm9mKCkgYXBwcm9h
Y2gpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
