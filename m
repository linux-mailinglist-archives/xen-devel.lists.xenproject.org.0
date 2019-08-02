Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88977F7B0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:00:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htX6b-0005rB-Rz; Fri, 02 Aug 2019 12:56:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htX6Z-0005r1-OZ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:56:19 +0000
X-Inumbo-ID: ea4222ce-b524-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea4222ce-b524-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 12:56:18 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 12:56:11 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 12:52:40 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 12:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpWKgu6SLCoXsKj/6Q3h2ZNpOBzuvC8III2WMw3GZEv7oQrRGEoQVZcJ1EwumMSkoqMx1M5St1b3QpRF11U9gsNNSuUqblHZBrG6ozbrAMNZWS14AiQq3IJf/AryorPqoAna9nPOdfrrOz1x0fv3fr6Bw042c/lSmeEeA1b2PAxXpOzZ8gW2fvJvrCrwuZ7TyjSzL2POms4DxQItdWhoxeJ94y+NEEsKmW+EciK4LAAKa5Ym4RfaJ7H0OVmViTC8sknGDVvyJuq1vBVlzTTBAfdaP7AQeoqZsUuDTVfFg7dMDmqgeYbzjpa1c5Vie3T3SKrjmjtpeI5P2gcEAWwcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMLLW/8ZrrUv5Q5gNwDBj3eFC4ehe0IoJhVTa+WHD+Y=;
 b=Nl9ng/QRPxwTBPEsFB2Fygd2qibdCmT/quP1//epxCQ5hxWMs93YfUYRrby+SH5ux22l5cS0Hyo5p9YabJEgvWp7etpmbikLjx7NAWeA4CGzFRMz6AwyYN+0+KfESRaZaCPuFFaCa98BzSyq3IxBy8jVtrbmEpcOSOVsLw03HVoRNB9wnnNa5QyUMStbYTcfzM7IVnRGB+WfXcn9IxxqNGMO+mk6fR0ihhsjukJ5lZiT77JD4IlRHRnmo4NBzJpW0Xmw9BggpTSSEzKgHVY3XPCI/j3VzFyhBsCs+QRFn0jgtpddUg6I6SXGDO+q+qIehqEI5W2p6GR/6945+TrEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2908.namprd18.prod.outlook.com (20.179.50.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 2 Aug 2019 12:52:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 12:52:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Lars Kurth <lars.kurth@citrix.com>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Oqbn0AoA
Date: Fri, 2 Aug 2019 12:52:38 +0000
Message-ID: <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
In-Reply-To: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0055.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87161ab7-4e26-4197-4055-08d717484c79
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2908; 
x-ms-traffictypediagnostic: DM6PR18MB2908:
x-microsoft-antispam-prvs: <DM6PR18MB29081DD71803D51613A2203AB3D90@DM6PR18MB2908.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(189003)(199004)(486006)(99286004)(476003)(53936002)(2616005)(446003)(11346002)(26005)(256004)(66946007)(186003)(6246003)(102836004)(36756003)(6436002)(6512007)(68736007)(386003)(6506007)(53546011)(2906002)(52116002)(14454004)(478600001)(316002)(76176011)(6486002)(4326008)(8676002)(7736002)(54906003)(6916009)(81156014)(3846002)(229853002)(31696002)(6116002)(25786009)(71190400001)(66556008)(86362001)(64756008)(558084003)(66476007)(71200400001)(66446008)(80792005)(66066001)(5660300002)(81166006)(31686004)(305945005)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2908;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cf2qu2G0hweD//MU6+t+QGdSC9GnTLA9mv7gLeH5cgOK2IBCi3je47rn9f+QZPUYqY1skMaF/B3LmpESovj+RlqxPORCQaKWhvWX8HzQSstXpZvSCfSNTeyRA2QWp6wFOa0L7Z7R0ybKhhNYC1U8ps29KyJRXMn6ZtpyvAKorHdQkb5ajMuFLgT3XtwCjuysMx1faWibaDrPg65N79gicD+FIYZlA0z/skm/zwe8IS9wJR/nKVpvm8I6M0TcsLhz/z8UhM2IFWalLQTQW04q4M9SyO0CSRhl9rqhYf1/qJa6yn2QTlfLKPzMYZP7XRQ3BGBIryLzBorn2BHP1zJchDA6gtx/Z1KG+KVVkfPBmWV0I+2BdfOollm4Tj92azb3lrtz1Yyz2AYty95pCphM8GNnrmYg5aIrzqkeZ2WW1fI=
Content-ID: <B43E733ECDFD1C4FB3DF672EBFB795BC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87161ab7-4e26-4197-4055-08d717484c79
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 12:52:38.7331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2908
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
 "committers@xenproject.org" <committers@xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxMzoxNCwgTGFycyBLdXJ0aCB3cm90ZToNCj4+IDEuNS40IFNlbmRpbmcg
UGF0Y2hlcyBNYW51YWxseQ0KPiBUaGlzIHNob3VsZCBiZSByZW1vdmVkIG9yIHN0YXRlIE5PVCBU
TyBETyB0aGlzDQoNClBsZWFzZSBkb24ndC4gSSdtIG5vdCBtZWFuaW5nIHRvIHN0YXJ0IHVzaW5n
IGdpdCBmb3IgcGF0Y2ggc3VibWlzc2lvbg0KYW55IHRpbWUgc29vbiAoaWYgZXZlciksIGFuZCBJ
IGRvbid0IHNlZSB3aHkgdGhpcyBzaG91bGQgYmUgYQ0KcmVxdWlyZW1lbnQuDQoNCkphbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
