Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59116807F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:42:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Ti-00036m-UG; Fri, 21 Feb 2020 14:40:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TqQj=4J=amazon.com=prvs=31305ddda=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j59Th-00036c-Lm
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:40:29 +0000
X-Inumbo-ID: 1b154370-54b8-11ea-868e-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b154370-54b8-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582296030; x=1613832030;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6bNwR5zX1PoSvFtz4CiBLJ7Ky64LTGkOe9W7FqNAWMQ=;
 b=snM44KsKIhGw3iS7OOI3Mp8r7P5gNKvxGSLfL6EptiVtKFBUplcepsi6
 JHHy9lzJDJ8WLByWCgbCtcXx0tEmgx/9p/UsGgAgkuRu8szqNtco4DDiZ
 6UOKNKldzyM60pFVRAyInDvG5tDFrnIl9I6Kp4klTtl73nHKjDMaKAkOR U=;
IronPort-SDR: Bm+FipgHEcpszLKj4Y4eldLvzcYt+PGiBSDn3dLiL9azurwwn6wAJ57j++Xa0k3sfwP8kf0BHo
 dII+qA5O+aAw==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="18053946"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Feb 2020 14:40:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4FDB7A193C; Fri, 21 Feb 2020 14:40:16 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 14:40:15 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 14:40:14 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 21 Feb 2020 14:40:14 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "wl@xen.org" <wl@xen.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2] x86/domain_page: implement pure per-vCPU mapping
 infrastructure
Thread-Index: AQHV3R91Y+G0jACGEk2zD96+LQsgPqgln+yAgAARR4CAAALKAIAAG2sA
Date: Fri, 21 Feb 2020 14:40:14 +0000
Message-ID: <8a4e4fa48aafa565da6eb7f2905d0a21be65901c.camel@amazon.com>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <5a80693d-87e3-26a5-0c80-fba7d0212260@citrix.com>
In-Reply-To: <5a80693d-87e3-26a5-0c80-fba7d0212260@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.226]
Content-ID: <0888D226036B504E9779DFD0A80BF1BA@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAyLTIxIGF0IDEzOjAyICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAyMS8wMi8yMDIwIDEyOjUyLCBYaWEsIEhvbmd5YW4gd3JvdGU6DQo+ID4gT24gRnJpLCAy
MDIwLTAyLTIxIGF0IDExOjUwICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiA+ID4gR2l2ZW4gdGhh
dDoNCj4gPiA+IA0KPiA+ID4gMS4gbWFwY2FjaGVfZG9tYWluIGlzIG5vdyBhIHN0cnVjdHVyZSB3
aXRoIG9ubHkgb25lIG1lbWJlci4NCj4gPiA+IDIuIGVudHMgaXMgYSBjb25zdGFudCB0aHJvdWdo
b3V0IGRvbWFpbidzIGxpZmVjeWNsZS4NCj4gPiA+IA0KPiA+ID4gWW91IGNhbiByZXBsYWNlIG1h
cGNhY2hlX2RvbWFpbiB3aXRoIGEgYm9vbGVhbiAtLQ0KPiA+ID4gbWFwY2FjaGVfbWFwcGluZ19w
b3B1bGF0ZWQgKD8pIGluIGFyY2gucHYuDQo+ID4gPiANCj4gPiA+IElmIEknbSBub3QgbWlzdGFr
ZW4sIHRoZSBzaXplIG9mIHRoZSBtYXBwaW5nIGlzIGRlcml2ZWQgZnJvbSB0aGUNCj4gPiA+IHZj
cHUNCj4gPiA+IGJlaW5nIGluaXRpYWxpc2VkLCBzbyBhIGZ1cnRoZXIgaW1wcm92ZW1lbnQgaXMg
dG8gbGlmdCB0aGUNCj4gPiA+IG1hcHBpbmcNCj4gPiA+IGNyZWF0aW9uIG91dCBvZiBtYXBjYWNo
ZV92Y3B1X2luaXQuDQo+ID4gDQo+ID4gQnV0IHlvdSBjYW4ganVzdCBYRU5fRE9NQ1RMX21heF92
Y3B1cyBvbiBhIHJ1bm5pbmcgZG9tYWluIHRvDQo+ID4gaW5jcmVhc2UNCj4gPiBpdHMgbWF4X3Zj
cHVzIGNvdW50LCBzbyB0aGF0IGVudHMgaXMgbm90IGNvbnN0YW50Pw0KPiANCj4gVGhlIGNvbW1l
bnRzIHN1Z2dlc3QgdGhhdCwgYnV0IGl0IGhhcyBuZXZlciBiZWVuIGltcGxlbWVudGVkLCBhbmQg
SSdtDQo+IGluDQo+IHRoZSBwcm9jZXNzIG9mIHB1cmdpbmcgdGhlIGFiaWxpdHkuDQo+IA0KPiBB
bHJlYWR5IG5vdywgbWF4IGlzIHBhc3NlZCBpbnRvIGRvbWFpbl9jcmVhdGUsIGFuZCB0aGUNCj4g
WEVOX0RPTUNUTF9tYXhfdmNwdXMgY2FsbCBoYXMgdG8gZXhhY3RseSBtYXRjaCB3aGF0IHdhcyBw
YXNzZWQgdG8NCj4gY3JlYXRlLiAgQXMgc29vbiBhcyB0aGUge2RvbWFpbix2Y3B1fV9kZXN0cm95
KCkgZnVuY3Rpb25zIGJlY29tZQ0KPiBwcm9wZXJseSBpZGVtcG90ZW50IChzbyB3ZSBjYW4gdW53
aW5kIGZyb20gbWlkd2F5IHRocm91Z2ggYWZ0ZXIgYW4NCj4gLUVOT01FTS9ldGMpLCBYRU5fRE9N
Q1RMX21heF92Y3B1cyB3aWxsIGJlIGRyb3BwZWQgY29tcGxldGVseS4NCj4gDQo+IGQtPm1heF9j
cHVzIGlzIHNldCBlYXJseSBkdXJpbmcgY29uc3RydWN0aW9uLCBhbmQgcmVtYWlucyBjb25zdGFu
dA0KPiBmb3INCj4gdGhlIGxpZmV0aW1lIG9mIHRoZSBkb21haW4uDQoNClRoYW5rcyBmb3IgdGhl
IGNsYXJpZmljYXRpb24uIFRoaXMgc2ltcGxpZmllcyB0aGluZ3MgcXVpdGUgYSBiaXQuDQoNCkhv
bmd5YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
