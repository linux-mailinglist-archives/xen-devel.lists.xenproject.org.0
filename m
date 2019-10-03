Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072CECA1B1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 17:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG3Rt-0005lQ-Kw; Thu, 03 Oct 2019 15:55:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QmOq=X4=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iG3Rr-0005lK-DD
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 15:55:23 +0000
X-Inumbo-ID: 34851230-e5f6-11e9-8c93-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34851230-e5f6-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 15:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXjCh3uZvs3pn/0syWxD12mg49eQyJlXjMSwEaFeU71AzYZfdRRvxjKvT53N2O4LvwxDBedtdOAwyVF7ehqva4FF8ypEpFg/RM1Z7HFwQl9fLMX4SCHuYOp6jdwQCOAbIULHVFAtZ4OmWGzy9WpLhpURFXMt85OQK/PzI8mWxHH2RxgyRit2fIcdFRrPfU6tZvD2dt5W2VTR4TTpYJm50kccKDy7nnqWG8F/DNph2iSx+Q3QItXbzhC9CM2nU/diMH+jhETySW9u/abXUITcjnCSc+6rLMirzElhFys8Cnz5sNt3vfDsirReTs1QcP9u9cM3//13WX2ZGzc1INnFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08XURqfyXEwngDhELxA22iBwNb/txZlMHO6WLu+uEDA=;
 b=RWyW+l5OIaAMXYSUCDuFwRNiUOAsWrcvQuehjzxQviHvilzTy0y919uDzp9GPDSfde0yBSUJ09N1uwJ3p7XGc4/avE5EY0zLHlTdZ+7ekpHrHmtmTrBdEvmiZ7fNTBS8VMyyh7151ry9fyN9gKUnAEFOG9RBzW6PMHdhEpfU8wiyCjykuWI4ywr4ivJQWEtvMUa1k4jJ+skS7N5prdhjxiki6EbqG89bFfik4zYOqBIqSYtouFS9pRKf2t0BVPScVhRky+uwkjd5IK+9gtT4DIVKWpC4k2Q06vaERGjuF2DVLgHPf7c9K0CVXIDe1LhnKoqoHm4+vCC8bkxgGlXT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08XURqfyXEwngDhELxA22iBwNb/txZlMHO6WLu+uEDA=;
 b=db9OocLVM/IjP4b7Zh4VXt+edGQHyoR1Yw0NKrhgQS9hwpglsjcuAvkhDNFGfTcvW+Bv1g+sXAjRnMKiOGLwPIasaB2kdvgtE+nYvbiq5xLoL+4qzsHvrtARjU9X6ogNMgK91ISNVDqd8JU7wSP4dnf65KcIS1yK1khDIP6vn/o=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3922.eurprd03.prod.outlook.com (52.135.145.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 15:55:20 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::b084:971d:9e32:1b61]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::b084:971d:9e32:1b61%4]) with mapi id 15.20.2305.017; Thu, 3 Oct 2019
 15:55:20 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH for-4.13 v2 2/2] docs: Replace all instance of ARM by Arm
Thread-Index: AQHVcuVPY9Nw118P80OwH+dGnLK0cqdGlRSAgACBmoCAAglwgA==
Date: Thu, 3 Oct 2019 15:55:20 +0000
Message-ID: <87pnjd4ye0.fsf@epam.com>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011757190.2943@sstabellini-ThinkPad-T480s>
 <5e058d03-d854-efe6-56d2-ca99852a8397@arm.com>
In-Reply-To: <5e058d03-d854-efe6-56d2-ca99852a8397@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08165c01-703a-4ff8-3e03-08d7481a1807
x-ms-traffictypediagnostic: AM0PR03MB3922:|AM0PR03MB3922:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3922701CFA9C5589A0B551D0E69F0@AM0PR03MB3922.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(189003)(186003)(102836004)(7416002)(55236004)(6116002)(99286004)(53546011)(316002)(66476007)(6506007)(64756008)(66556008)(76116006)(66946007)(256004)(26005)(5660300002)(3846002)(25786009)(446003)(11346002)(8936002)(2616005)(476003)(71190400001)(7736002)(76176011)(66446008)(54906003)(305945005)(8676002)(81156014)(81166006)(71200400001)(2906002)(486006)(4326008)(6246003)(6916009)(80792005)(6486002)(86362001)(14454004)(66066001)(6436002)(36756003)(6512007)(478600001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3922;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6aNW41NFS9XeUdZV0EpwUwUf8exwkptf8HadKDFADkDexl3Ci20p/zBhSRTBu3AeeK8VKXercEUReVfoZ6bS88bOWmCgQ37xkKLgm5CIKJXN0jSfVbrgy0pWsINmDbP+7OvBRKFtvDzpXOMDZ8v+xIs8YY3Rw6b643vbpBTDOGS+XwtXAU8aRH5fFW/ZsHyQ+BhgmMsoCWEPaC30bJa70i8MiDnYo+OusJXWmrD5nvKwJ/slw+gcB4miJ7+KRC4yoj8U9Rrjs0Uti0nrhIUP0H9bWdlepNwe2EO0gzUyy/fS1eO5qhfMkcT50c1WWAdeJctsNSL/vAxA+0if4A2U9CNDSsHy7R+9xu6zndRQCyEqGvU9gN0GwwF0hnteKuBQiVCsUnQYwu8SKQN65Z2sCvFTqi+EzjMoIT08tWM6cj8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08165c01-703a-4ff8-3e03-08d7481a1807
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 15:55:20.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dilfSHoKOCMNDdCxioCros1z6Hhid6IbDJO/xTpv9gbkEBsKsjdiPTy3jXA7bY5LB1XQgjVj0jN+8p29QAG0zcRuqqSRA7kJQlTcviUhio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3922
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] docs: Replace all instance
 of ARM by Arm
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFN0ZWZhbm8sCj4KPiBPbiAx
MC8yLzE5IDI6MDUgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAyNCBT
ZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gVGhlIGRvY3VtZW50YXRpb24gaXMgdXNp
bmcgYSBtaXggb2YgQVJNIChvbGQpIGFuZCBBcm0gKG5ldykuIFRvIHN0YXkKPj4+IGNvbnNpc3Rl
bnQsIHVzZSBvbmx5IHRoZSBuZXcgbmFtZS4KPj4KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gs
IGl0IG11c3QgaGF2ZSBiZWVuICJub3QgZnVuIiB0byB3cml0ZSB0aGlzCj4+IHBhdGNoLgo+Pgo+
PiBIb3dldmVyLCBsZXQgbWUgc3VnZ2VzdCBhIHJhZGljYWwgbWF5YmUgY29udHJvdmVyc2lhbCBp
ZGVhLiBXaGF0IGFib3V0Cj4+IGtlZXBpbmcgIkFSTSIgaW5zdGVhZCBvZiBzd2l0Y2hpbmc/IFRo
ZXJlIGFyZSBzZXZlcmFsIGFkdmFudGFnZXM6IGl0IGlzCj4+IGVhc2llciB0byBncmVwLCBubyBu
ZWVkIHRvIHdvcnJ5IGFib3V0IGNhc2Utc2Vuc2l0aXZpdHkuIEl0IGlzIHdoYXQKPj4gcGVvcGxl
IGFyZSB1c2VkIHRvLCBhbmQgd2hhdCBzdGlsbCB1c2UgKGluIG15IGV4cGVyaWVuY2UgYXQgY29u
ZmVyZW5jZQo+PiBhbmQgYXQgd29yay4pIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaWdub3JlIEFy
bSdzIG1hcmtldGluZyBhbmQga2VlcCB0aGUKPj4gb2xkICJBUk0iIG5vbWVuY2xhdHVyZT8KPgo+
IFByZXR0eSBtdWNoIGFsbCB0aGUgbmV3IGRvY3VtZW50YXRpb24gb24gQXJtIHdlYnNpdGUgYXJl
IG5vdyB1c2luZyBBcm0KPiAodGhlIHNwZWMgaXMgbm93IGNhbGxlZCBBcm0gQXJtKS4KVGhpcyBj
b25mdXNlcyBtZSwgYmVjYXVzZSBJIGJlbGlldmVkIHRoYXQgc2Vjb25kICJBcm0iIHN0YW5kcyBm
b3IKQXJjaGl0ZWN0dXJlIFJlZmVyZW5jZSBNYW51YWwuCgo+Pgo+PiBJZiBub3QsIEknZCBzdWdn
ZXN0IHRvIGFsc28gcmVwbGFjZSAiYXJtIiB3aXRoICJBcm0iIHNvIHRoYXQgYXQgbGVhc3QKPj4g
d2l0aCBoYXZlIGNvbnNpc3RlbnQgY2FzZXMgZXZlcnl3aGVyZS4gQnV0IHRoZW4gdGhlIHBhdGhu
YW1lcyB3b3VsZAo+PiByZW1haW4geGVuL2FyY2gvYXJtLCBsZWFkaW5nIHRvIHNlbnRlbmNlcyBz
dWNoIGFzOgo+Pgo+PiAgIChub24tekltYWdlKSIgcHJvdG9jb2wgZGVzY3JpYmVkIGluIGFybS9C
b290aW5nLgo+PiAgICAgIFRoZXJlIGFyZSBubyBleGNlcHRpb24gb24gNjQtYml0IEFybS4KPj4K
Pj4gV2l0aCAiYXJtIiBhbmQgIkFSTSIgdGhlIGRpc3RpbmN0aW9uIHdhcyBjbGVhciBiZXR3ZWVu
IHBhdGhuYW1lcyBhbmQKPj4gdGV4dCAoYXQgbGVhc3QgdG8gbWUuKSBXaXRoICJhcm0iIGFuZCAi
QXJtIiwgSSBrbm93IGl0IGlzIHNpbGx5IGJ1dCBpdAo+PiBraW5kIG9mIGJvdGhlcnMgbWUgOi0p
Cj4KPiBIb3cgZG8geW91IGRlYWwgd2l0aCBYaWxpbnggdGhlbj8gOykKPgo+Pgo+PiBJIGFtIG5v
dCBnb2luZyB0byBpbnNpc3Qgb24gdGhpcyBvbmUgdGhvdWdoLgo+Cj4gVGhpcyBpcyBxdWl0ZSBz
aW1pbGFyIHRvIGEgY29tcGFueSByZW5hbWluZyBpdHNlbGYgKG9yIGdvdCBhY3F1aXJlZAo+IGFu
ZCB0aGUgbmFtZSBjb21wbGV0ZWx5IGRpc2FwcGVhcikgYnV0IGluIGEgbGVzcyByYWRpY2FsIHdh
eS4gV291bGQKPiB5b3Ugc3RpbGwga2VlcCB0aGUgb2xkIG5hbWUgY29tcGFueSBpbiB5b3VyIGRv
Y3VtZW50YXRpb24gYW5kL29yCj4gbWl4aW5nIHRoZSBib3RoPwpCVFcsIHRoaXMgaWYgd2hhdCBo
YXBwZW5lZCB3aXRoIEZyZWVzY2FsZS9OWFAuIExpbnV4IGFuZCBVLUJvb3Qgc3RpbGwKdXNlICJm
cmVlc2NhbGUiIGV2ZW4gZm9yIGkuTVg4IGNoaXBzLgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0
IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
