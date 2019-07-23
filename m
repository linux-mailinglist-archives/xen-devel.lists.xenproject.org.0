Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E493D71639
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:37:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hps7F-0000ez-B9; Tue, 23 Jul 2019 10:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hps7E-0000eu-89
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:33:52 +0000
X-Inumbo-ID: 5a33fdce-ad35-11e9-8ac1-d7db68dec355
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a33fdce-ad35-11e9-8ac1-d7db68dec355;
 Tue, 23 Jul 2019 10:33:48 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 10:29:50 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 10:32:43 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 10:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSbFTCT3aAJZauD0sSZkKa1YoNeHzRp9VEDX9s3GYMoA/oNlvoH3KpxRRLtEdIHQ/JaCk9DahnRzlhM9uCJjJKUcmd28MF1Km11vqbYwH51A8f3umrwQuzrSm3p3VbTbOf9Yj1qoPEQE0or6r5zuxGPc1+Z7iWenXXR7d3aTjd1Yq6rX336JmEs6mN9nJZTYRHgIIXUBdaFv9nzLefVT+jFtc2bxCOTkrpXKtauuSb0dRVZwblHLxv7kjC+nY1vht5FWNAKsiLwEqkDFz19KlMCdWvKbDgWuGBrptJ94yT0IzqeFy4T2723wMCNXQVMgYkzdrET12/3+KFYy/oipHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdQAJpp88jHjSvv1oi3OtFPryh2h2/M7alVhgqXR3s4=;
 b=mHg73PV1oNT+I7BOl5F9eP+3w9GEmlA4zkmv9ZzT/cusDgm466cpAVF0henm3oAgO2LJqWmgXhiGBoEs0giWfmsGS0QUHJOQ2yCvRE95O+9d3w5LSkSrvPxwzrz0xTAJ182owgYUT0R4mTa2ChouFuDltE03/3CPgdU344hj2CSe2UMXKiPsHChrZQCV4gS80fFA2spvEbmu2AUgAJJ4dwW2CHTjpjS3sZRhey0zoIVYbhiflBXlMRHqNPCGdNJQnEsShkqmh7AzymrPKPqhdykCZYI7969hko5ZEoZZDN1R6JGPEyW5hBDND86d7+JcuPjprNL8DfoC9dZXMEUpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2937.namprd18.prod.outlook.com (20.179.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 10:32:41 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 10:32:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] x86/p2m: fix non-translated handling of iommu mappings
Thread-Index: AQHVQKK+PBtG5JCnKkORtVT7Y+EqTqbYApyA
Date: Tue, 23 Jul 2019 10:32:41 +0000
Message-ID: <379d08e8-9a22-7687-54a3-650f0baa72b5@suse.com>
References: <20190722153209.73107-1-roger.pau@citrix.com>
In-Reply-To: <20190722153209.73107-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::29)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4d24719-29bd-4d8b-3869-08d70f591761
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2937; 
x-ms-traffictypediagnostic: DM6PR18MB2937:
x-microsoft-antispam-prvs: <DM6PR18MB2937192211020D4796D80F1BB3C70@DM6PR18MB2937.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(189003)(199004)(66556008)(6512007)(66476007)(6436002)(66446008)(6506007)(64756008)(102836004)(66946007)(31686004)(5660300002)(186003)(2906002)(25786009)(229853002)(99286004)(76176011)(478600001)(6486002)(14454004)(80792005)(486006)(386003)(6246003)(4326008)(6916009)(53936002)(52116002)(8936002)(54906003)(6116002)(14444005)(31696002)(305945005)(256004)(36756003)(81156014)(8676002)(26005)(316002)(71190400001)(71200400001)(476003)(3846002)(2616005)(7736002)(86362001)(81166006)(446003)(11346002)(68736007)(66066001)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2937;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OAfxxOR4DHOvvdiOYEkfODKkocIezhV4Vf+FbrIDg6DgshzpHvCkPCiYVfi1BNf11b5QZxMr7RcEyxh4PiNPsvs4w/pCSIlHHG0QfbBB2LvV4nGv4mb5rlTVyOWZ0yhVZe3kTiInG7dwk9ITJEM867SEhT4lJqxYio+hXU9mwcaTV9PnjRgrprOvTpXuBkgj7I+mJFgFmjV1sfxAhKqpwf80g82GU3jK487DakCTdukQesifUps/Kjpo0CeTWVgsIiK5/b5HZ7wteUln0rTUrLJyAr2OiFPqjlVkPm8iTFQHC6HVztSfzI+qC9zS+k8RwnKEPg+im/6uy5mX9Dl98c+L26SXogISRtu9xxHKNR3MbaILsKdsQh0fNyAJk0OlRAUO5kfN3R7gbrj/0S59BC5HXGlUCZ4Aq8fLc8s+NOU=
Content-ID: <4277CBE3A785D046BBED4CAA5BF1913A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d24719-29bd-4d8b-3869-08d70f591761
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 10:32:41.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2937
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNzozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGUgY3VycmVu
dCB1c2FnZSBvZiBuZWVkX2lvbW11X3B0X3N5bmMgaW4gcDJtIGZvciBub24tdHJhbnNsYXRlZA0K
PiBndWVzdHMgaXMgd3JvbmcgYmVjYXVzZSBpdCBkb2Vzbid0IGNvcnJlY3RseSBoYW5kbGUgYSBy
ZWxheGVkIFBWDQo+IGhhcmR3YXJlIGRvbWFpbiwgdGhhdCBoYXMgbmVlZF9zeW5jIHNldCB0byBm
YWxzZSwgYnV0IHN0aWxsIG5lZWQNCj4gZW50cmllcyB0byBiZSBhZGRlZCBmcm9tIGNhbGxzIHRv
IHtzZXQvY2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeS4NCj4gDQo+IEFkanVzdCB0aGUgY29kZSBp
biBndWVzdF9waHlzbWFwX2FkZF9wYWdlIHRvIGFsc28gY2hlY2sgd2hldGhlciB0aGUNCj4gZG9t
YWluIGhhcyBhbiBpb21tdSBpbnN0ZWFkIG9mIHdoZXRoZXIgaXQgbmVlZHMgc3luY2luZyBvciBu
b3QgaW4NCj4gb3JkZXIgdG8gdGFrZSBhIHJlZmVyZW5jZSB0byBhIHBhZ2UgdG8gYmUgbWFwcGVk
Lg0KDQpXaHkgdGhpcyBzZWVtaW5nbHkgdW5yZWxhdGVkIGNoYW5nZT8gSSBhc2sgYmVjYXVzZSAu
Li4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jDQo+IEBAIC04MzYsNyArODM2LDcgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShz
dHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwNCj4gICAgICAgICAgICAqLw0K
PiAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsr
cGFnZSApDQo+ICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0
X3N5bmMoZCkgKQ0KPiArICAgICAgICAgICAgaWYgKCAhaGFzX2lvbW11X3B0KGQpICkNCj4gICAg
ICAgICAgICAgICAgICAgLyogbm90aGluZyAqLzsNCj4gICAgICAgICAgICAgICBlbHNlIGlmICgg
Z2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3BhZ2UpICkNCj4gICAgICAg
ICAgICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQoNCi4uLiB0aGlzIHBhcmFsbGVs
cyB0aGUgY29kZSBpbiBpb21tdV9od2RvbV9pbml0KCksIHdoaWNoIHNpbWlsYXJseQ0KdXNlcyBu
ZWVkX2lvbW11X3B0X3N5bmMoKSAoYW5kIGR1cmluZyB0aGUgcHJpb3IgZGlzY3Vzc2lvbiB5b3Ug
ZGlkDQphZ3JlZSB3aXRoIFBhdWwgdGhhdCBpdCBzaG91bGRuJ3QgYmUgY2hhbmdlZCkuIElPVyB0
aGUgcGF0Y2ggZm9yDQpub3cgY2FuIGhhdmUgbXkgUi1iIG9ubHkgd2l0aCB0aGlzIGNoYW5nZSBh
bmQgdGhlIHJlc3BlY3RpdmUgcGFydA0Kb2YgdGhlIGRlc2NyaXB0aW9uIGRyb3BwZWQuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
