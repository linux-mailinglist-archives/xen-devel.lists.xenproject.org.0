Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054E63F97
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 05:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl32a-0004Ug-FA; Wed, 10 Jul 2019 03:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hl32Y-0004Ub-Qi
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 03:13:06 +0000
X-Inumbo-ID: 982891a0-a2c0-11e9-b575-3f419922b844
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 982891a0-a2c0-11e9-b575-3f419922b844;
 Wed, 10 Jul 2019 03:13:05 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 03:12:53 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 03:12:36 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 03:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnmwa6darAWSaSE0RKsf4Jlc8askGW37Sfb2LfDfYgndbQmVA9meCIrhHkxc0r+MvZ4Yv6va49rR9uyHUezlLLcxCJUlICGr9wfDAz/d5UDJ6U/vTMWYOIGHDBjewSW9vAV9lYVVVGvff8HEs/b+omXQ2wkjYEVxPfRlmpBw/EQNuCksnhi51BtmIfYnj2lJRENqsSxwhdFl/gz0eQNakwGveijTOmZy3eAwjdTaEahOGO1yuo+acCwN0+EGbqlIdOUct4x/EkV1sCO/nKsyFS8Y5kH8fBPHH9MgyLhXtvmIzR8m18a3SP49b1JQcUmpvODuxHMY69yvwnu1ImZmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mzpc3/DpfRUvLJfY05gVEJbpX+PE7/hqYS/Vzq9ZLf8=;
 b=cxj/f9hEKxzBjaBLmNhDh++0hXAtuoCmwOhnTxviFCqVFl4EyfQPQXCSoiDHVjJJsUUNAnns/6V+3UZQZ11NuQbfZiDX+WUXQuD22vfaCk6+txy89rVzXi/YyRXoNTBYIYh+ewhVjM5AfPT/URPew34/Lsv3wjZFNXt0R65tsWiIKau8zgCXKV9Pn1K84aJheufika5e6XyrFX9i88vSszgw4WtORyh8o4fWz6kDNsD0s2A9f9udrHL/gqOlcIYWaGXK25bc6qlpAw87nHGZN7gjXQRbPOoe3ZDchfHygcYJHoI9CzGSIEfCPX3Qba0r55ZbKnljbdkTNSVFoszHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3289.namprd18.prod.outlook.com (10.255.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 03:12:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:12:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [Xen-devel] [PATCH L1TF MDS GT v1 3/3] common/grant_table:
 harden version dependent accesses
Thread-Index: AQHVNZSwqRIQi+rMn0iDaub9ZwgNrabDL3kA
Date: Wed, 10 Jul 2019 03:12:35 +0000
Message-ID: <dcdef572-0eb9-dcfd-b614-aa494cf4d4a6@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-4-git-send-email-nmanthey@amazon.de>
 <5CE6B5E50200007800231C66@prv1-mh.provo.novell.com>
 <f44e9114-96e8-bf8a-e66e-f6d8951080d5@amazon.de>
In-Reply-To: <f44e9114-96e8-bf8a-e66e-f6d8951080d5@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:610:4f::37) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de57bcfb-d817-4c6a-312f-08d704e47473
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3289; 
x-ms-traffictypediagnostic: DM6PR18MB3289:
x-microsoft-antispam-prvs: <DM6PR18MB328968B7EAC4765E53CA69AAB3F00@DM6PR18MB3289.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(189003)(199004)(486006)(26005)(256004)(14444005)(4326008)(6506007)(53546011)(386003)(76176011)(52116002)(3846002)(99286004)(2906002)(6486002)(229853002)(7416002)(8936002)(478600001)(102836004)(6116002)(66066001)(6246003)(6916009)(31686004)(186003)(25786009)(54906003)(6512007)(316002)(53936002)(68736007)(66446008)(66476007)(64756008)(14454004)(31696002)(86362001)(4744005)(81166006)(81156014)(66946007)(305945005)(7736002)(66556008)(8676002)(36756003)(5660300002)(80792005)(6436002)(71190400001)(476003)(71200400001)(2616005)(446003)(11346002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3289;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aPV7iHyZZF9dc6CnVlmQ4i4KXa/hi/AerNEkqCrBUTUd0WMYzCk8mPW8KW4Sn8zvWQjAMgpVR11G66fmwvB6EXI1+mqjqALGDfa7CMkBhijpc6pVsT+Fc/q1ssi1tFP7g/odIuoRuwD5bgiOZBBIxiFwampgoTiFB1tdK/b3eYApMWbWfyoIm4GfatSf2vsaPe7WgjdE8kps2QW3SSmUX+Hk+dn2zSqpa59YlQCUW8dJ2F8sTpxv1djUI5T+aGqs7qa3s0TSkCp5lxVQcmTKdTVcwcQg4A4KAKnIA7wuq5/2RMGepa/RO+8DYcTj+KWbe2KKZ+ojyp1zocHuEA0s0PleWQz22O6uRJXbkzUJFymviq2jTqvLR4sp2rimomZ/FJ4fHsgt48BmE3wAlomn0F/gfC8ofpw7DOpBZlf6qWU=
Content-ID: <F4B6D4023C6C1A4BAB9FF23A9205A055@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de57bcfb-d817-4c6a-312f-08d704e47473
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:12:35.0174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3289
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 3/3] common/grant_table:
 harden version dependent accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, "wipawel@amazon.de" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDcuMjAxOSAxNTo1MywgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBPbiA1LzIzLzE5
IDE3OjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8
bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToNCj4+PiAgICogZ250dGFiX3NldF92ZXJzaW9uOiBh
bGwgYWNjZXNzaWJsZSBkYXRhIGlzIGFsbG9jYXRlZCBmb3IgYm90aCB2ZXJzaW9ucw0KPj4gVGhp
cyBpcyBub3QgZW5vdWdoIGZvciBteSB0YXN0ZTogVGhlIHZlcnkgZmlyc3QgbG9vcCBpcyBzYWZl
IG9ubHkNCj4+IGJlY2F1c2UgbnJfZ3JhbnRfZW50cmllcygpIGlzLiBBbmQgc3BlY3VsYXRpbmcg
aW50bw0KPj4gZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1lcygpIGRvZXNuJ3QgbG9vayBz
YWZlIGF0IGFsbCwgYXMNCj4+IGd0LT5zdGF0dXNbaV0gbWF5IGJlIE5VTEwuDQo+IFNvLCB5b3Ug
YmFzaWNhbGx5IHdhbnQgdG8gc2VlIGEgYmxvY2tfc3BlY3VsYXRpb24oKSBhdCB0aGUgYmVnaW5u
aW5nIG9mDQo+IHRoZSBmdW5jdGlvbiBnbnR0YWJfcG9wdWxhdGVfc3RhdHVzX2ZyYW1lcyBhbmQN
Cj4gZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1lcz8gSSBkbyBub3QgY2xhaW0gdG8gcHJv
dGVjdCBhZ2FpbnN0DQo+IHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyB0aGF0IGFy
ZSBjYXVzZWQgYnkgdGhlIGZvciBsb29wIGluDQo+IGdudHRhYl9zZXRfdmVyc2lvbi4NCg0KVGhl
IHBvaW50IGlzbid0IHRoZSBsb29wLCBidXQgdGhlIGZhY3QgdGhhdCBieSBtaXMtc3BlY3VsYXRp
bmcgdGhyb3VnaA0KdGhlIHR3byBjb25kaXRpb25zIGJlZm9yZSB0aGUgZnVuY3Rpb24gY2FsbCBh
IE5VTEwgZ3QtPnN0YXR1c1swXSBtYXkNCmdldCBhY2Nlc3NlZCwgZW50aXJlbHkgaW5kZXBlbmRl
bnQgb2YgdGhpcyBiZWluZyBhIGxvb3Agb3IganVzdCBhDQpzaW5ndWxhciBhY2Nlc3MuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
