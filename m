Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420657D688
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 09:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht5ho-0005aI-1V; Thu, 01 Aug 2019 07:40:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ht5hl-0005a2-SA
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 07:40:53 +0000
X-Inumbo-ID: a75d51e9-b42f-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a75d51e9-b42f-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 07:40:52 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  1 Aug 2019 07:40:41 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 1 Aug 2019 07:37:56 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 1 Aug 2019 07:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnvpV3Uugq7ufrS3wygRpZwf27LV8l+BNh7OB1pjBakEICY+UiaSOAfF74CInTwJIM9yPVy/NBToAG6Q6Bw3j8bUFnsdFxnsPtZLja0ievLzMiZuiPPM65F/zvTucy97H7tI9980Xb12CZZylnoau4Uj4eIDdzI9+3TQvXAQFa+ZmVmW6838eUdpEFhjWp0x5FIjivWBbDQuccZ/I4TQN4/BgFS2JI6vcjkk/robp+Gj54ak7yjLc7pB2mFwGPE8ZhTjsMn5w9Xz50nwmMsE4gvQKH+N4IUmiRd5SZtgGGnk+D3J1r/N4OGMdcUXCe0s40MOqQ5cv1O0l9oKr2BLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCEzmNZe2QF4zAX6QUHSYQ7hK5ERA5P/SCbhYZBhxjw=;
 b=gx8MGIY6CESVKxPfT4I2m+FIWEa9VtGSxxLx5DUD2QazTkuB3AggcISiKb+mkIhhZh0odZf61/zJgmD0yfbzNq/Lbx92yfDf2KO0VxQiotjhqmvxyHsmMv368J1Doy7O61Zq2qp+ByVwG2oiZ4eHk4rtNO2Vo7+AH8kXbVGwucAA4GTPZsa/ctx/VHhcQdOk0rDROm3OvwZgCE9sJFrFqZ5jPWO2LZbN01VCSWHqVTN5Mys8y8fVVCfmJIpXIMGobY6hGlZB/TN4rZnx69KZdSYyrULuRpb3Rh2bF6aXfEvf60olSgXN5hWy3vLv5uO4qZdpgqsUhNYmZG/BFZYn7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3332.namprd18.prod.outlook.com (10.255.136.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 1 Aug 2019 07:37:55 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 07:37:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAMhBoBgASM1gCAAAh2qIAAA3yAgANcJ+OAAQAfgA==
Date: Thu, 1 Aug 2019 07:37:55 +0000
Message-ID: <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
 <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
In-Reply-To: <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::15)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91d36ab6-58c2-4afa-e33a-08d716532afa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3332; 
x-ms-traffictypediagnostic: BY5PR18MB3332:
x-microsoft-antispam-prvs: <BY5PR18MB3332ED278005B01F058AC115B3DE0@BY5PR18MB3332.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(7416002)(102836004)(8936002)(316002)(386003)(229853002)(53546011)(6506007)(4326008)(6116002)(36756003)(76176011)(5660300002)(52116002)(186003)(66946007)(99286004)(26005)(66476007)(305945005)(64756008)(7736002)(31696002)(25786009)(86362001)(66556008)(71190400001)(66446008)(71200400001)(3846002)(256004)(81166006)(2906002)(14454004)(31686004)(6486002)(6436002)(68736007)(8676002)(81156014)(80792005)(6916009)(4744005)(53936002)(446003)(6512007)(478600001)(66066001)(6246003)(54906003)(11346002)(2616005)(476003)(486006)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3332;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3+G7NmvaNi0JrPY7OKynnxdrUXObVqzE9n8LzmEXaCz5DSsxKJ6YU4QCYZfuOVtuXosLb/JyiFrozm1uhbsVu6QaYEBR+IVUXZcYKE0xeG5UIj91qWr9bzDx2T3gU3uVwyAB47ZDM6ESN/vbPv2Pt0e8gICItxOxyFfPfHc/5ORC2XqBKNdYr/bNuYGsZbENUxWjOTbecVnYHqf4M3wsTYe5DUZdZwdJzO+RpBAiA8wTF9aUKUktXYtnD78FLgcmwVr8aQeHelH19vZ6lwF6HU6pI23QE8pIhF9XV2ud6PPyyCPmOimgq2EgCB3mTQWynx9CPTs4ZxMfKg7v89r3mcDyVKZrjxd9EctplWi1PZ5PixSNSKCIWyfrOJ+f6W09UDjNK64EGzxhxtlOm1aO///4aRuaeQsmn+4XnwqVjVk=
Content-ID: <E206F9E3522C6949877251518CB3A70B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d36ab6-58c2-4afa-e33a-08d716532afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 07:37:55.6775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3332
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDcuMjAxOSAxODoyMCwgVmlrdG9yIE1pdGluIHdyb3RlOg0KPiBIb3cgYWxsIHRob3Nl
IHByb2plY3RzIGxpdmUgd2l0aG91dCB0aGlzIGlzc3VlPw0KDQpQZXJoYXBzIHRoZXkgZG9uJ3Qg
Y2FyZT8gSSBkby4NCg0KPiBXaGF0IGlzIHRoZSByZWFzb24gbm90IHRvIGZpeCAnZGlmZiAtcCc/
IElzIGl0IG5vdCBwb3NzaWJsZSBhdCBhbGw/DQoNCkkgaGF2ZSBubyBpZGVhLCBidXQgSSBndWVz
cyB0aGVyZSdzIGEgcmVhc29uIGZvciBpdHMgY3VycmVudA0KYmVoYXZpb3IuDQoNCj4gQ291bGQg
eW91IHBsZWFzZSBzaGFyZSBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIGJhY2tncm91bmQgb2YgdGhl
IGlzc3VlDQo+IGFuZCBleGFtcGxlcz8NCg0KV2hhdCAoZnVydGhlcikgYmFja2dyb3VuZCBhbmQg
d2hhdCBraW5kIG9mIGV4YW1wbGVzIGFyZSB5b3UgYWZ0ZXI/DQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
