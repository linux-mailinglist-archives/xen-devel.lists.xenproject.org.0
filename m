Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F47608D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 10:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqvMA-00041i-4U; Fri, 26 Jul 2019 08:13:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqvM8-00041d-G4
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 08:13:36 +0000
X-Inumbo-ID: 40d3f6e6-af7d-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 40d3f6e6-af7d-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 08:13:35 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 08:13:27 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 08:07:45 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 08:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7N53m8if5+my6mBWpGZXBMZOJGnACoXrqxzCl/PJ/dAH48h2/TBkxZiJLWYcL51v9HzQ311IVDNrfZgRp3vEg/ih45P9Yeg2dgRKbWOoJNxPw9IlnkiAoxzjLwFJcJLXgf+4Yk1LkdO2C7fLFgcW+n8vbFPylk+8BZjMnvguD5Ii5XhKa2YE/iKE/Sj4jExO8wuUDHibx94h6kDj0/JSEc5fzlQQQeXKj11IuHi/HPRU+RVbQE+nkAfWsQQgKJS3qAkmj4MtttiE1CTOBem6VXiw9sv7ogMNk/l3peCFchVV2f4pfY/f4PBjH1pymw0WxDnnYjk5z2kQpT7wXWc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfTO1/2QE6YgyVDmbpz78Uj765LbOH5gLCdnuK16v3o=;
 b=lebywylPb1SEBFks/kIVkm5p2J6Uni7rTTespgUwJyfMptzFj0x0CQJFMMPGLUFSUgmFQCSU4RFrLAqWW/vTb7a+UftuHMZlEkIUwCG0Hk9yDL2ignYqdbG7UC2JeEQbBTuD0CJkQNclehhODh+3WleyCp2mGcI6cuLcLnCDlTgqN8PmaQgvcYkGqbUBs7+nlyt0KReEGoiePx7fFC+5QxbEdX2BHZu7vHqSgQ8wFx+vjV0ZQEN+uJAqTBgRgOMe4Cc3reLSqb6QDd7KJtmJUfpYBFamxy1TTyaUSjhhMh2+VJOhTBpTUa7nnUDFERTDK9gZmzG7FDkPFfJhsOWs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3202.namprd18.prod.outlook.com (10.255.138.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 08:07:44 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 08:07:44 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
Thread-Index: AQHVQvAnStELfYzLTUe5XGe/bWPdiabbss8KgADZsIA=
Date: Fri, 26 Jul 2019 08:07:44 +0000
Message-ID: <db0037e0-5d0c-e211-7425-029b38dd9a81@suse.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
 <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
In-Reply-To: <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0022.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::32) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ca1a6ef-adcc-4575-2970-08d711a056cd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3202; 
x-ms-traffictypediagnostic: BY5PR18MB3202:
x-microsoft-antispam-prvs: <BY5PR18MB32029164FF941D6CABDD4B19B3C00@BY5PR18MB3202.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(189003)(199004)(66066001)(4744005)(31686004)(486006)(66556008)(64756008)(6916009)(52116002)(53546011)(99286004)(31696002)(386003)(6486002)(66946007)(71200400001)(80792005)(6512007)(76176011)(66446008)(71190400001)(478600001)(66476007)(6436002)(11346002)(26005)(6506007)(102836004)(7416002)(81166006)(6116002)(8936002)(54906003)(305945005)(256004)(6246003)(14444005)(25786009)(68736007)(229853002)(2906002)(3846002)(81156014)(5660300002)(4326008)(316002)(186003)(446003)(14454004)(2616005)(476003)(53936002)(7736002)(36756003)(1411001)(86362001)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3202;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qPKLhrR13n8rACBos+eZnRZO7hn++fH0uDaJGr4BXMLohEaNPqE9b7OMjcfpRZImkyohMMBpUP5aazd+yJHmifzbfujaVi9X2RlnhAT666dTKn0OnfojYbp5rfVYqKgw64qDaB5aRYsMx0QlCfZjvRFEqJb8N+s2/s1FqZGYToQmxg6nq1htJpjMvXD+nOz03F6lwkCsxh7DRe001KYIqNarWNKvYHfAuMSXxQ/Ulwm7p/k7lVIaH8XYPAnFF56q45dgV75eu10oIS/8V/rTgmsEuWwOPmywgoS0ipSp+ZgkkJK0kpdRcVguNbh34qTJ9M4Qi/GgIDa9cPjunGSMXhuk+7SMu1sEbUU3WOLx5jbFjpLSeRXJMnwUHXGm/HYsFoOdQtOWfrlbRrmSY41NNQMj7CEJbiQTJoJIROrk+EA=
Content-ID: <587A46F12565F94AA31ECBE4A0670830@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca1a6ef-adcc-4575-2970-08d711a056cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 08:07:44.6868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3202
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?Windows-1252?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>, Lars
 Kurth <lars.kurth.xen@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Shane
 Wang <shane.wang@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAyMTowOCwgUmljaCBQZXJzYXVkIHdyb3RlOgo+IFNpbmNlIHdlIGhhdmUg
YXQgbGVhc3Qgb25lIEludGVsIG1haW50YWluZXIsIEx1a2FzeiwgdGhlIGZlYXR1cmUgbmVlZCBu
b3QgYmUKPiBvcnBoYW5lZC4gIElmIFNoYXduIGlzIG5vdCByZXNwb25kaW5nIHRvIHRoZSByZXF1
ZXN0IHRvIGNvbmZpcm0gTHVrYXN6IGFzCj4gbWFpbnRhaW5lciwgdGhlIFhlbiBjb21tdW5pdHkg
aGFzIG11bHRpcGxlIGNvbW11bmljYXRpb24gY2hhbm5lbHMgd2l0aCBJbnRlbC4KPiBQcmFnbWF0
aWNhbGx5LCBhIHJldmlldyBvZiB0aGUgdGJvb3QtZGV2ZWwgYXJjaGl2ZXMgc2hvd3MgdGhhdCBM
dWthc3ogaXMKPiB3b3JraW5nIG9uIHRib290IGRldmVsb3BtZW50LgoKT24gdG9wIG9mIHdoYXQg
b3RoZXJzIGhhdmUgYWxyZWFkeSBzYWlkIGluIHJlc3BvbnNlIEknZCBsaWtlIHRvIGFsc28KcG9p
bnQgb3V0IHRoYXQgaXQgaXMgdGhlIHBhdGNoIHN1Ym1pdHRlcidzIHJlc3BvbnNpYmlsaXR5IHRv
IGNoYXNlCm1pc3NpbmcgYWNrLXMuIEx1a2FzeiBhbmQgU2hhbmUgd29ya2luZyBmb3IgdGhlIHNh
bWUgY29tcGFueSBzaG91bGQKaGF2ZSBwcm92aWRlZCBldmVuIGJldHRlciBtZWFucyB0byBkbyBz
byB0aGFuICJ0aGUgWGVuIGNvbW11bml0eQpoYXZpbmcgbXVsdGlwbGUgY29tbXVuaWNhdGlvbiBj
aGFubmVscyB3aXRoIEludGVsIi4KCkluZGVwZW5kZW50IG9mIHRoYXQsIGFuZCBzb21ld2hhdCBp
biBjb25mbGljdCB3aXRoIFJvZ2VyJ3MgZWFybGllcgpyZXBseSwgdGhpcyBtb2RlbCBvZiBpbnN0
YWxsaW5nIG1haW50YWluZXJzIGRvZXNuJ3QgcmVhbGx5IGZpdCB3ZWxsCndpdGggb3V0IGdlbmVy
YWwgIm1lcml0b2NyYWN5IiB2aWV3OiBCZWZvcmUgbWFraW5nIGFueW9uZSBtYWludGFpbmVyCm9m
IGFueXRoaW5nLCB0aGV5IHNob3VsZCBoYXZlIGRlbW9uc3RyYXRlZCB0aGVpciBpbnRlcmVzdCBh
bmQgKFhlbgpzaWRlKSBrbm93bGVkZ2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
