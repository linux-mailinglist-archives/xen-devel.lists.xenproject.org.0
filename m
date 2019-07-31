Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DE7BBB5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:32:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsjyI-0003wG-Cq; Wed, 31 Jul 2019 08:28:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsjyG-0003wB-Fd
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:28:28 +0000
X-Inumbo-ID: 2578dee0-b36d-11e9-8d04-7f396aa82190
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2578dee0-b36d-11e9-8d04-7f396aa82190;
 Wed, 31 Jul 2019 08:28:27 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 08:28:17 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:11:07 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvRsbqhXAeBEMOpo2eVAeL7nzZ2Du1zVVMEBQDuQEl6Vlkm7GkbcrsdEzbQs7V7RlruM1cqx19M+e4PqxOaqE5UGga9CoLea4TFwdcu0IU/liiszJdQeqRcK+/8FVn0KHOCNKCwtp0O6U/PxUibV8FMImPqw5JC+FQsmXmuSCe5wO6q8tc3h7emNy861VF9ejUQP8K9UfmvRSmacqnjUsxpYPeqTDZ/kRDLnSc6ZmWfXfC7Dq73mXNCEE6uewlQkfGZuWys3Sy0ixVbLO8Je+sEcdrX2pUL1jtU6IwchuG7bPoj1jFQZCWztPp8iHWmZcLGIjCJWIMtufixT6ihg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxMIhRZu/6FC5yiR3HF5MkYdAza+FZxLnpsid04O4z8=;
 b=PefbSFzatBJlhfpRnYR1KSG4Ll4jPSHTHaNTk5MyFKavXh+MOgeAwxvZOmWxTexVlBMTZaGV5Rqf9qzUmdvrdNEqeGE179babQvvRzq5QDqaDdXDJ9ULEUddVql5EcWvKH9GqdzUsGH+YxPceM1czpRy1bay33omZvCcu8zrVxQbpL0AjIQIH5uOGpZKxSZvvu1ZNvogA+q7/CjoWO/2lZq//+u1UzzDMOQqLEBAHq1HbvDFOGU67vGyef7HQCV0zFEu8gBSzel5gXkw+9gwh6Lby9ztd2KY1z5zkyJGj5de6XF348qEATyclr1XUipkWLnzwmK8sQUztkxIejcscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2538.namprd18.prod.outlook.com (20.179.105.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 08:11:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:11:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
Thread-Index: AQHVQoNqxP3NLSDaSUO4Yjwj1hPOv6bjWDkAgAAJNRmAAIXmyIAAgpwA
Date: Wed, 31 Jul 2019 08:11:06 +0000
Message-ID: <82c8247b-8793-e08b-979f-26dac70631a0@suse.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
 <5e1fadcd-e383-3142-e39b-56bae19c87fb@citrix.com>
 <eb67ee53b467f292a3f8986b6fc77d23c3d1727f.camel@suse.com>
In-Reply-To: <eb67ee53b467f292a3f8986b6fc77d23c3d1727f.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0019.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::29) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6ff8172-d490-490a-a491-08d7158ea30c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2538; 
x-ms-traffictypediagnostic: DM6PR18MB2538:
x-microsoft-antispam-prvs: <DM6PR18MB25382C11A50412D88C5D9845B3DF0@DM6PR18MB2538.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(189003)(199004)(71200400001)(71190400001)(6436002)(4744005)(81156014)(37006003)(31696002)(81166006)(53936002)(8676002)(36756003)(6486002)(186003)(66446008)(64756008)(66476007)(5660300002)(2616005)(476003)(256004)(31686004)(478600001)(446003)(11346002)(486006)(229853002)(66556008)(99286004)(66946007)(8936002)(2906002)(6246003)(316002)(53546011)(80792005)(6506007)(386003)(26005)(6862004)(6512007)(76176011)(3846002)(6116002)(14454004)(66066001)(25786009)(54906003)(7736002)(68736007)(305945005)(86362001)(102836004)(6636002)(52116002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2538;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XVyvxsz/Lw5mipfZ4zhU65A8OrfG2gDhDU90OMo4IQMs7ZqefZCcxE/KIAESSzH26TbkktyQBaoLbFqnuYTWJrjVTmzA46+3BHFTG/NDvPlrAVvMqQIKTzDaUS3cz+bWZx1xwLSRqkLNvI1C4sviEgUEzl066rxFren9xCzRmVB5cOHhh52PvU4pPc1seKGcNLWfmccrXY7dAvr8C5LVo7TR4XUyW+HjswgDuZgKz9H/qzVd4wiib4ntoRgVnlMWRUtmImMqsVNtRa/c7EwpE/lP+DP+KcT92PXO+L9XtoKQQZsWSbX98NArCE6JVJhB50QcSmzc+wC3hcxi0fsAM4Mjgsw2+CSPnMTs6kNpK7UPr7ybw+7b5E6u/WLa5P40eIyUbPQsZOYSe3aijeFozrcUvK8CDacX/y8rLcJRl5c=
Content-ID: <35AE083AE254B247BCFE529B2C8BEC1E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff8172-d490-490a-a491-08d7158ea30c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 08:11:06.2457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2538
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDcuMjAxOSAwMjoyMiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+IEphbidzIGV4YW1w
bGUgYWJvdmUsIHNlZW0gdG8gY29tcGlsZSAqKndpdGhvdXQgYW55IHdhcm5pbmdzKiogZm9yIG1l
IGFzDQo+IHdlbGwuIElmIEkgYWRkIGEgbWFpbigpLCBJIGNhbiBldmVuIGdldCB0aGUgY29kZSBh
Ym92ZSB0byBwcmludCB0aGUNCj4gY29udGVudCBvZiB0aGUgYXJyYXkuDQo+IA0KPiBBbmQgeWV0
LCBidWlsZGluZyB0aGUgdG9vbHMgd2l0aG91dCBhIHBhdGNoIGxpa2UgQ2hyaXN0b3BlcidzIG9u
ZQ0KPiAod2hpY2ggd2FzIGFsc28gd2hhdCBJIHdhcyB1c2luZyBsb2NhbGx5LCBhbmQgcmFpc2Vk
IHRvIEFuZHkpLCBJIGdldDoNCg0KU3VyZSAtIEknbSBhd2FyZSB0aGF0IHdlJ3JlIHVzaW5nIGEg
KHBvdGVudGlhbGx5IGhlYXZpbHkpIHBhdGNoZWQgZ2NjLg0KSGVuY2UgbXkgcXVlc3Rpb24gdG8g
Q2hyaXN0b3BoZXIgd2hldGhlciBoZSdzIHVzaW5nIGEgcGxhaW4gb25lLg0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
