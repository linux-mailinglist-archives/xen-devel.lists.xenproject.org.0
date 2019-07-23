Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F186715FB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:25:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hprwQ-0008Mw-7y; Tue, 23 Jul 2019 10:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hprwN-0008Mq-WB
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:22:40 +0000
X-Inumbo-ID: c88ebb12-ad33-11e9-bd23-97e90606a1cf
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c88ebb12-ad33-11e9-bd23-97e90606a1cf;
 Tue, 23 Jul 2019 10:22:34 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 10:22:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 10:20:19 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 10:20:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EARUC5hnrjZ444HrBOIaZ+AEFjcyDMedENtkp0/AKuM16hQOIs/tTTdxGJZJyji/BIIkMHQjKTBU9YbHv/dNbdIC8F/ftLydrgK+hpalGh0GPjQED6gVWrac6fc+5EP+GUpS9MsTF9wJqFGdp1M0ge5zzadw+UEU6QO3eGkDzZr8NkjyCttB7O6/08AcnasAN4adoDFcOpCJISmGzmliibgXyuV3O0cr45xqQZ99fpM11u4ZK+FBpx+3qUcZA8vSUbUqVd4xD5e3zOwopM9Vs5TDOYpFpoduNLKOfkz+6SCbs5jC+fNbdfk/EYLXPU7iXdo8GQr324LAYj5XzwkHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Puc+BB9+L5scjoiEQJ8G+emEg+3w8tCoSU60k2tdBNI=;
 b=a6IHX5LFM34ZJ5U+fl+Z61zfl9KvOoQ21vOIJ49i8zZYs/t7bM89senJTTMMLamQsWCpLkg0bDXItgHAp5vFzINZ355D707wo7JfiD8JUWP2ewp4ziIbjkaYyV3dg+9L2636k1YE0+aWcvBvAGjrvz5GwTzaCB1enUguDdkxaMbj6VowrjZtgCYixMv59ovr7W5LCny7r3dUWmLf49deditGM+8ytHrEQChOelFOUH9bqlaw4biCIHz5TPHApQTSbxRuYOEwodCi7fiLhrqVHZTn7MSTpu0DOgV/10P22a8ez73W/vW5WjvhQBbn2E+ixmoJFdsXH3LVIh533Y5JjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2828.namprd18.prod.outlook.com (20.179.51.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 10:20:18 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 10:20:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v4 4/6] pci: switch pci_conf_write8 to use pci_sbdf_t
Thread-Index: AQHVPjtmZETMCEDH8kuQA6LtQzu9zqbYA/GA
Date: Tue, 23 Jul 2019 10:20:18 +0000
Message-ID: <b466f9ff-eff8-5314-5d17-3e66b9abe83a@suse.com>
References: <20190719140724.69596-1-roger.pau@citrix.com>
 <20190719140724.69596-5-roger.pau@citrix.com>
In-Reply-To: <20190719140724.69596-5-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:8::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55c1bb61-6b77-44b5-ea1f-08d70f575c95
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2828; 
x-ms-traffictypediagnostic: DM6PR18MB2828:
x-microsoft-antispam-prvs: <DM6PR18MB2828A05F993F981F7EC85BD1B3C70@DM6PR18MB2828.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(66556008)(25786009)(66946007)(66476007)(66446008)(64756008)(5660300002)(6486002)(558084003)(6246003)(486006)(26005)(76176011)(53546011)(102836004)(6436002)(81156014)(186003)(31696002)(4326008)(229853002)(81166006)(53936002)(6512007)(8936002)(256004)(478600001)(71190400001)(71200400001)(316002)(68736007)(8676002)(3846002)(80792005)(2906002)(6916009)(54906003)(14454004)(36756003)(66066001)(86362001)(6116002)(386003)(31686004)(6506007)(2616005)(476003)(446003)(11346002)(7736002)(52116002)(7416002)(305945005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2828;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: llS38Eyb6lTPg67hLsh8rK8YSymkcJ2YnTVSdWHIxNy3d8BoqzJIuxANBqZa2f5NOEZx4woLeduZ4QppUXXUnfSJFw6SNxMQC73mhdZq8f/NWFEyM+T/f7Z9PvOp/rLvX3PM0XYzCKfkGiOKNrnuNWzfN+zs1OsjvEgZYTN5EowRd8FardHl+wlxcQAiJlMylwYK5T1JfSy4K41PgzW5rCz1sqi1XBoC9dsivmEt+10tnbrAXvtD10toSnLJzaY8VEG2wDo4+uySglIr6Rzb5VOvlK8XjcjjS+KIDF3T99prGpNwHMSuay/8qnqrVNnmx1DTP4tcx805WjSHZeSxOoxgTuU75M2Yc6MrSP5DtRYPcmnU0ZyBkhTRpCAqvw+uggB6DFuttB1AZdVRCrTbSuM3QL4sGBSa8S9mFpszL3U=
Content-ID: <8E5058582127AC4DB880920DB39A99ED@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c1bb61-6b77-44b5-ea1f-08d70f575c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 10:20:18.7124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2828
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 4/6] pci: switch pci_conf_write8 to use
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNjowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGlzIHJlZHVj
ZXMgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXJzIG9mIHRoZSBmdW5jdGlvbiB0byB0d28sIGFuZA0K
PiBzaW1wbGlmaWVzIHNvbWUgb2YgdGhlIGNhbGxpbmcgc2l0ZXMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
