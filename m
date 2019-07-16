Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2476ACFD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:43:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQW0-0003gA-7X; Tue, 16 Jul 2019 16:41:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQVy-0003fe-Jy
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:41:18 +0000
X-Inumbo-ID: 88071640-a7e8-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88071640-a7e8-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:41:17 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:41:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:41:00 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlnSBen0K4moKmNz4ej4gWr33vQPsDIYWDGefFzPghyrrcVhTfZ9hCZ5xaCk+LFidCpzcxhujpMMe4nQ2w9eLxq8z3EDRVXRc2u9sbtEkTbPUvfVfQn91bWzL5t0XLfmNCpc4OXNUqu94SNfxaEsuuwzm4OwrLtGFJifBgmbQWvnRDvA4sLA9miNh9Arbd2m9BLexGNUXYfa2QuLsBdFRXiAhg00R8Qax1dHMGOBtxHyVmOXQNSWIbSlwLAap2qbEjH6s+ztBmTrHl7afq5+MSskGEkwYb1cdHKE0K86Pzrtrr6io2jqaZcqOQT2ZtbxxQ6IJE/TdcG/7Ts4UTFRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa4iProVUTIMZDm9RNd8EedGMivZSaJ2SgRN3Q/rP0g=;
 b=dQrtD0UHcok05WHlGCeBUoNYFc30cdllZM4ShsPVJp4gdYoW47WwsyeattW0ABD9BEN5NraZDO4U6fNLLKqOtgPCCE/xnWZATcjgajV0conbMIBLSXw516GMOIpUQJ/8mQkvGZu8xIpexNOcEoxJVUdOfAVPV583LUd+HyiCpnMSUmuCs8EAlPFx9asJ5LIBhMM56LOCBoz6QdX2AN7Gihd43yom9GyKjQU7SLNQv3WuvTZhcT3oBW/ytN8v/CCtGikLkvmujqPN1zanqvl5HtVvvAdQmsaEgyxL9tLKsBLIVZ6J6Pe1ib+qYd/5CnWyNEpevA733Zg/y4kc/X/Mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:40:58 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:40:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH RFC v3 13/14] AMD/IOMMU: correct IRTE updating
Thread-Index: AQHVO/U+AyGNFXRfrkOVPYzWeacU2A==
Date: Tue, 16 Jul 2019 16:40:58 +0000
Message-ID: <9461810d-9538-ef84-005f-0398673577db@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c115ff-d90a-4d21-f1e8-08d70a0c6169
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB31642B1025E00E71F434D2A2B3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z7Cjsah7ihoYkw10R7XDndpAdl1OLrLoFsKY9/2kO3LhRGMDEaX+x0WTKCVFR2XQdqMBvB7fjomQ7YMckXtswB3VHJK5zMWCPrNojJBp37MB1+5ru+0xWVayVovnbcN3wwVELnxRr1DKA1LCZE6Hl0citC2UrkdJ0wOmSGkvKcYlRWSjn2vHuSrAVnwyyk6e13ocOKqmu31x5llHhv4G4OFGjrzrvWNJuBlD2UmcUsNeC8YpvBujd2U4IPgBggrPv1tPv5I9Eb+XiZIf+8vdkQPFoB4ooTLNok43W48fT45focsrwFoE1nIaR6orwSqiIi4zjhlPTjIPF0Spfgh0DODO/cRdzjf6mrW0TGlXKxF1tfPjSr/7Rd3uoFLAdPfPckZouWNlfFu/7yleHlGPulep+Hkd/d5pCeVtxNomHw8=
Content-ID: <824B74143555CA489C3963A1AF7A3429@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c115ff-d90a-4d21-f1e8-08d70a0c6169
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:40:58.7782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH RFC v3 13/14] AMD/IOMMU: correct IRTE updating
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rmx1c2hpbmcgZGlkbid0IGdldCBkb25lIGFsb25nIHRoZSBsaW5lcyBvZiB3aGF0IHRoZSBzcGVj
aWZpY2F0aW9uIHNheXMuDQpNYXJrIGVudHJpZXMgdG8gYmUgdXBkYXRlZCBhcyBub3QgcmVtYXBw
ZWQgKHdoaWNoIHdpbGwgcmVzdWx0IGluDQppbnRlcnJ1cHQgcmVxdWVzdHMgdG8gZ2V0IHRhcmdl
dCBhYm9ydGVkLCBidXQgdGhlIGludGVycnVwdHMgc2hvdWxkIGJlDQptYXNrZWQgYW55d2F5IGF0
IHRoYXQgcG9pbnQgaW4gdGltZSksIGlzc3VlIHRoZSBmbHVzaCwgYW5kIG9ubHkgdGhlbg0Kd3Jp
dGUgdGhlIG5ldyBlbnRyeS4NCg0KSW4gdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXNpX21z
ZygpIGFsc28gZm9sZCB0aGUgZHVwbGljYXRlIGluaXRpYWwNCmxvY2sgZGV0ZXJtaW5hdGlvbiBh
bmQgYWNxdWlyZSBpbnRvIGp1c3QgYSBzaW5nbGUgaW5zdGFuY2UuDQoNClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCi0tLQ0KUkZDOiBQdXR0aW5nIHRoZSBm
bHVzaCBpbnZvY2F0aW9ucyBpbiBsb29wcyBpc24ndCBvdmVybHkgbmljZSwgYnV0IEkNCiAgICAg
IGRvbid0IHRoaW5rIHRoaXMgY2FuIHJlYWxseSBiZSBhYnVzZWQsIHNpbmNlIGNhbGxlcnMgdXAg
dGhlIHN0YWNrDQogICAgICBob2xkIGZ1cnRoZXIgbG9ja3MuIE5ldmVydGhlbGVzcyBJJ2QgbGlr
ZSB0byBhc2sgZm9yIGJldHRlcg0KICAgICAgc3VnZ2VzdGlvbnMuDQotLS0NCnYzOiBSZW1vdmUg
c3RhbGUgcGFydHMgb2YgZGVzY3JpcHRpb24uIFJlLWJhc2UuDQp2MjogUGFydHMgbW9ycGhlZCBp
bnRvIGVhcmxpZXIgcGF0Y2guDQoNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdV9pbnRyLmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRy
LmMNCkBAIC0yMDcsOSArMjA3LDcgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2ludHJlbWFwX2VudHJ5
KGNvbnN0DQogICAgICAgICAgICAgIC52ZWN0b3IgPSB2ZWN0b3IsDQogICAgICAgICAgfTsNCiAg
DQotICAgICAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIxMjgtPnJhd1swXSkgPSAwOw0KLSAgICAg
ICAgLyogTG93IGhhbGYsIGluIHBhcnRpY3VsYXIgUmVtYXBFbiwgbmVlZHMgdG8gYmUgY2xlYXJl
ZCBmaXJzdC4gKi8NCi0gICAgICAgIGJhcnJpZXIoKTsNCisgICAgICAgIEFTU0VSVCghZW50cnku
cHRyMTI4LT5mdWxsLnJlbWFwX2VuKTsNCiAgICAgICAgICBlbnRyeS5wdHIxMjgtPnJhd1sxXSA9
DQogICAgICAgICAgICAgIGNvbnRhaW5lcl9vZigmZnVsbCwgdW5pb24gaXJ0ZTEyOCwgZnVsbCkt
PnJhd1sxXTsNCiAgICAgICAgICAvKiBIaWdoIGhhbGYgbmVlZHMgdG8gYmUgc2V0IGJlZm9yZSBs
b3cgb25lIChjb250YWluaW5nIFJlbWFwRW4pLiAqLw0KQEAgLTI4OCw2ICsyODYsMjAgQEAgc3Rh
dGljIGludCB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9pbw0KICAgICAgfQ0KICANCiAgICAg
IGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KGlvbW11LCByZXFfaWQsIG9mZnNldCk7DQorDQor
ICAgIC8qIFRoZSBSZW1hcEVuIGZpZWxkcyBtYXRjaCBmb3IgYWxsIGZvcm1hdHMuICovDQorICAg
IHdoaWxlICggaW9tbXUtPmVuYWJsZWQgJiYgZW50cnkucHRyMzItPmJhc2ljLnJlbWFwX2VuICkN
CisgICAgew0KKyAgICAgICAgZW50cnkucHRyMzItPmJhc2ljLnJlbWFwX2VuID0gZmFsc2U7DQor
ICAgICAgICBzcGluX3VubG9jayhsb2NrKTsNCisNCisgICAgICAgIHNwaW5fbG9jaygmaW9tbXUt
PmxvY2spOw0KKyAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2ludHJlbWFwKGlvbW11LCByZXFfaWQp
Ow0KKyAgICAgICAgc3Bpbl91bmxvY2soJmlvbW11LT5sb2NrKTsNCisNCisgICAgICAgIHNwaW5f
bG9jayhsb2NrKTsNCisgICAgfQ0KKw0KICAgICAgaWYgKCBmcmVzaCApDQogICAgICAgICAgLyog
bm90aGluZyAqLzsNCiAgICAgIGVsc2UgaWYgKCAhbG9fdXBkYXRlICkNCkBAIC0zMTcsMTMgKzMy
OSw2IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21faW8NCiAgDQogICAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzKTsNCiAgDQotICAgIGlmICggaW9t
bXUtPmVuYWJsZWQgJiYgIWZyZXNoICkNCi0gICAgew0KLSAgICAgICAgc3Bpbl9sb2NrX2lycXNh
dmUoJmlvbW11LT5sb2NrLCBmbGFncyk7DQotICAgICAgICBhbWRfaW9tbXVfZmx1c2hfaW50cmVt
YXAoaW9tbXUsIHJlcV9pZCk7DQotICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21t
dS0+bG9jaywgZmxhZ3MpOw0KLSAgICB9DQotDQogICAgICBzZXRfcnRlX2luZGV4KHJ0ZSwgb2Zm
c2V0KTsNCiAgDQogICAgICByZXR1cm4gMDsNCkBAIC01NzksMTkgKzU4NCwyNyBAQCBzdGF0aWMg
aW50IHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX21zDQogICAgICByZXFfaWQgPSBnZXRfZG1h
X3JlcXVlc3Rvcl9pZChpb21tdS0+c2VnLCBiZGYpOw0KICAgICAgYWxpYXNfaWQgPSBnZXRfaW50
cmVtYXBfcmVxdWVzdG9yX2lkKGlvbW11LT5zZWcsIGJkZik7DQogIA0KKyAgICBsb2NrID0gZ2V0
X2ludHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCisgICAgc3Bpbl9sb2NrX2lycXNh
dmUobG9jaywgZmxhZ3MpOw0KKw0KICAgICAgaWYgKCBtc2cgPT0gTlVMTCApDQogICAgICB7DQot
ICAgICAgICBsb2NrID0gZ2V0X2ludHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCi0g
ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKGxvY2ssIGZsYWdzKTsNCiAgICAgICAgICBmb3IgKCBp
ID0gMDsgaSA8IG5yOyArK2kgKQ0KICAgICAgICAgICAgICBmcmVlX2ludHJlbWFwX2VudHJ5KGlv
bW11LCByZXFfaWQsICpyZW1hcF9pbmRleCArIGkpOw0KICAgICAgICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUobG9jaywgZmxhZ3MpOw0KLSAgICAgICAgZ290byBkb25lOw0KLSAgICB9DQogIA0K
LSAgICBsb2NrID0gZ2V0X2ludHJlbWFwX2xvY2soaW9tbXUtPnNlZywgcmVxX2lkKTsNCisgICAg
ICAgIGlmICggaW9tbXUtPmVuYWJsZWQgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0KKyAgICAgICAgICAgIGFtZF9pb21t
dV9mbHVzaF9pbnRyZW1hcChpb21tdSwgcmVxX2lkKTsNCisgICAgICAgICAgICBpZiAoIGFsaWFz
X2lkICE9IHJlcV9pZCApDQorICAgICAgICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1h
cChpb21tdSwgYWxpYXNfaWQpOw0KKyAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7DQorICAgICAgICB9DQorDQorICAgICAgICByZXR1cm4gMDsN
CisgICAgfQ0KICANCi0gICAgc3Bpbl9sb2NrX2lycXNhdmUobG9jaywgZmxhZ3MpOw0KICAgICAg
ZGVzdF9tb2RlID0gKG1zZy0+YWRkcmVzc19sbyA+PiBNU0lfQUREUl9ERVNUTU9ERV9TSElGVCkg
JiAweDE7DQogICAgICBkZWxpdmVyeV9tb2RlID0gKG1zZy0+ZGF0YSA+PiBNU0lfREFUQV9ERUxJ
VkVSWV9NT0RFX1NISUZUKSAmIDB4MTsNCiAgICAgIHZlY3RvciA9IChtc2ctPmRhdGEgPj4gTVNJ
X0RBVEFfVkVDVE9SX1NISUZUKSAmIE1TSV9EQVRBX1ZFQ1RPUl9NQVNLOw0KQEAgLTYxNSw2ICs2
MjgsMjIgQEAgc3RhdGljIGludCB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9tcw0KICAgICAg
fQ0KICANCiAgICAgIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KGlvbW11LCByZXFfaWQsIG9m
ZnNldCk7DQorDQorICAgIC8qIFRoZSBSZW1hcEVuIGZpZWxkcyBtYXRjaCBmb3IgYWxsIGZvcm1h
dHMuICovDQorICAgIHdoaWxlICggaW9tbXUtPmVuYWJsZWQgJiYgZW50cnkucHRyMzItPmJhc2lj
LnJlbWFwX2VuICkNCisgICAgew0KKyAgICAgICAgZW50cnkucHRyMzItPmJhc2ljLnJlbWFwX2Vu
ID0gZmFsc2U7DQorICAgICAgICBzcGluX3VubG9jayhsb2NrKTsNCisNCisgICAgICAgIHNwaW5f
bG9jaygmaW9tbXUtPmxvY2spOw0KKyAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2ludHJlbWFwKGlv
bW11LCByZXFfaWQpOw0KKyAgICAgICAgaWYgKCBhbGlhc19pZCAhPSByZXFfaWQgKQ0KKyAgICAg
ICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChpb21tdSwgYWxpYXNfaWQpOw0KKyAgICAg
ICAgc3Bpbl91bmxvY2soJmlvbW11LT5sb2NrKTsNCisNCisgICAgICAgIHNwaW5fbG9jayhsb2Nr
KTsNCisgICAgfQ0KKw0KICAgICAgdXBkYXRlX2ludHJlbWFwX2VudHJ5KGlvbW11LCBlbnRyeSwg
dmVjdG9yLCBkZWxpdmVyeV9tb2RlLCBkZXN0X21vZGUsIGRlc3QpOw0KICAgICAgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncyk7DQogIA0KQEAgLTYzNCwxNiArNjYzLDYgQEAgc3Rh
dGljIGludCB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9tcw0KICAgICAgICAgICAgICAgICBn
ZXRfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKVthbGlhc19pZF0uaW50cmVtYXBfdGFibGUpOw0K
ICAgICAgfQ0KICANCi1kb25lOg0KLSAgICBpZiAoIGlvbW11LT5lbmFibGVkICkNCi0gICAgew0K
LSAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5sb2NrLCBmbGFncyk7DQotICAgICAg
ICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9tbXUsIHJlcV9pZCk7DQotICAgICAgICBpZiAo
IGFsaWFzX2lkICE9IHJlcV9pZCApDQotICAgICAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2ludHJl
bWFwKGlvbW11LCBhbGlhc19pZCk7DQotICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZp
b21tdS0+bG9jaywgZmxhZ3MpOw0KLSAgICB9DQotDQogICAgICByZXR1cm4gMDsNCiAgfQ0KICAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
