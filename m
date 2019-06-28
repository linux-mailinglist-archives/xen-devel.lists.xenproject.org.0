Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69147597D2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 11:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgnOH-0005ah-7l; Fri, 28 Jun 2019 09:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgnOF-0005ac-6n
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 09:41:55 +0000
X-Inumbo-ID: f4e7d59a-9988-11e9-9046-33d7aa485c5a
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4e7d59a-9988-11e9-9046-33d7aa485c5a;
 Fri, 28 Jun 2019 09:41:52 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 28 Jun 2019 09:41:51 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 28 Jun 2019 09:41:01 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 09:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=SyupBKu4k8X/bY5yd9krM5bGnnKrbnyxYpisMx7Zg/33bhrtkO81o2/0jHRMFuxir0+OnVB3zF7mXz7pBJp8xFM9xBqVL/DAJbRv8GzJ6Ww8jDzfe+E3uc/KG1pxbnQ+N55KdiVtAIOyWD4Mk3MB5k3GMe0Z74DG9qMen1D/ZCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68CRjKdiYfq+GiFi+wBZle1oJ+fOmjRau5kZEcs1l1Q=;
 b=ABQfo7a3R/e99Smgc6dgSKNBHno4bjn3kIj7uQwksvskic5VHNoRmj1Ya+UtGnLpQ3zRhf6nLlAFl7TvPkYB4GIKIXg4zHpK2sYu0mO4qJeLnUwo09V2M8qfuRmeRc71mFsSkr2zQNZrtR1AwxEMBNF5PwcH0j1WTokrkOI99Gg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3307.namprd18.prod.outlook.com (10.255.173.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 09:41:00 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf%4]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 09:41:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/5] kconfig: don't pass ARCH and SRCARCH on the sub-make
 call
Thread-Index: AQHVLZWXFWhgsYUSz0udk4VmViOJeQ==
Date: Fri, 28 Jun 2019 09:40:59 +0000
Message-ID: <8ad6ec1d-cfb5-bc9a-7d4c-716952fbf73f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f26e525-a93b-4a3a-4428-08d6fbacba41
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3307; 
x-ms-traffictypediagnostic: DM6PR18MB3307:
x-microsoft-antispam-prvs: <DM6PR18MB33074E34365F456FC6C40F3CB3FC0@DM6PR18MB3307.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(6436002)(99286004)(66066001)(31696002)(386003)(53936002)(6506007)(36756003)(53546011)(256004)(6246003)(6512007)(5660300002)(68736007)(8676002)(81156014)(81166006)(52116002)(186003)(102836004)(71200400001)(86362001)(71190400001)(26005)(316002)(54906003)(6116002)(72206003)(31686004)(229853002)(6916009)(25786009)(64756008)(305945005)(80792005)(66446008)(2616005)(7416002)(66556008)(6486002)(476003)(7736002)(14454004)(8936002)(486006)(66946007)(4326008)(3846002)(66476007)(73956011)(478600001)(558084003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3307;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ml8Lhi/lQPZuIXLNXKDAe5XTMpjtQUqQ8SffYrZDMTzRZvROPYamUQluObomQ1aAQRt2yZ/PfvuZtZ3TqarweWvd5eHxJHMergWCPHEjlnpPUZjQaFJmCR6LgTiX5Uuw0+X3NtR2jwGDmK8O7I3DjwmijWvi1nvXk1/3CkdviO+4gh9HPbqb94FPIKmWJ6BE6gJ7WlSTStvCH7HhT7KIGIwDYmaToIzDnC3wdP9LzRRugeeKa/+LCzQMMhkod+dvBK0mB6UtsB47TK7I9JtpHWkUHA/erN59WlWJZ7lVORVN9YyQy4qGNEL27YwGx9AHjLyqfkO2Eqmsklh+/cq1KdWyz0xcf/MHax2qDMvP8LnEpL9d7cSr41MBqZd/wAvtVXY8y5mpol5x2Sw9JbhSXF79Kk8W3sCLKua416wWXF0=
Content-ID: <9DF40BF27B55F548882DFB187ED1F92B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f26e525-a93b-4a3a-4428-08d6fbacba41
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 09:41:00.1277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3307
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/5] kconfig: don't pass ARCH and SRCARCH on
 the sub-make call
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ID4+PiBPbiAyNi4wNi4xOSBhdCAxNTo1NSwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToN
CiA+IGFuZCBpbnN0ZWFkIGV4cG9ydCB0aGVtIGZyb20gdGhlIHRvcC1sZXZlbCBYZW4gbWFrZWZp
bGUuDQoNCldvdWxkIGJlIGhlbHBmdWwgdG8ga25vdyB3aGF0IHByb2JsZW0gdGhpcyBzb2x2ZXMu
IEFkZGluZw0KInJhbmRvbSIgZXhwb3J0cyBfY2FuXyBoYXZlIHVuZGVzaXJhYmxlIHNpZGUgZWZm
ZWN0cywgc28gd2UNCnNob3VsZG4ndCBtYWtlIHN1Y2ggYSBjaGFuZ2Ugd2l0aG91dCByZWFzb24u
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
