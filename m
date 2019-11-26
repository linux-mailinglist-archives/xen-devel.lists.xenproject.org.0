Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFC10A349
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeX3-000343-32; Tue, 26 Nov 2019 17:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eTbR=ZS=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iZeX1-00033t-FP
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:21:43 +0000
X-Inumbo-ID: 369b4710-1071-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 369b4710-1071-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574788903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=urCYDev2kuPCakhd/wrgVSXZW15hpb6qRe0nuWrJDdg=;
 b=ZBq6ATXFBi3NLpZgm6efJmgvgpVBZFlY3Tnqv/OmXFBjNuesG60aLTUu
 51ofnsmioGTy1p0GIlX0Zxx9rm+j/OjzQuVrko8BGXLTV9KMou4ALkHmz
 7RbYWoYytynUbK+RlDLOmXF6K6gJuk42/5sh0pDgt6vB2AoLtsA6SfVZ1 o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HIqFmgd5yOACTdn5fdJ2df0lpOv6h8Y73YWbKq4E6LK93Edf55wFRD/ZAba0vLKivBXWSCuS2X
 K+0HhB8sCpCb4jDtdleHBXCFnUxpFE56UckXjiY7g/nYz4HIZmhk+kAjstiVnwfNZ3Cq4yOD19
 6z4tAd6pmComLG18u7Aoc8kiU1sDGSyiDsLmQ9mWNvcQxfxxmpwkZHdg8HHvWN8rYG31ZExaq9
 9UwIJLy6qKt04QcHZVBvU7Iwrix9bbgziXyL9v8N2mxZyAwh2VOVBmKzd0s7gQxOaYIVH9Dula
 zdQ=
X-SBRS: 2.7
X-MesageID: 8869052
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8869052"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: getting 4.12.2 ready
Thread-Index: AQHVo6KEpkbTH6JstEuggimH/CjUA6edP0yA
Date: Tue, 26 Nov 2019 17:21:38 +0000
Message-ID: <09127744-A657-477B-AFA6-07F5F7DC436B@citrix.com>
References: <cfc89f03-ba62-975e-afe2-2fb85fd5bb4c@suse.com>
In-Reply-To: <cfc89f03-ba62-975e-afe2-2fb85fd5bb4c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4300000ECD1DA24E8F5BD89436D6E22F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] getting 4.12.2 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI1LzExLzIwMTksIDA5OjEwLCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBBbGwsDQogICAgDQogICAgdGhlIDQuMTIuMiBzdGFibGUgcmVs
ZWFzZSBpcyBkdWUgaW4gYWJvdXQgMiB3ZWVrcyB0aW1lLiBQbGVhc2UgcG9pbnQNCiAgICBvdXQg
YmFja3BvcnRpbmcgY2FuZGlkYXRlcyB0aGF0IHlvdSBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVz
cGVjdGl2ZQ0KICAgIHN0YWJsZSB0cmVlcy4NCiAgICANCiAgICBKYW4NCiAgICANCg0KSGkgYWxs
OiANCg0KSSByYW4gdGhlIFhTQSBzY3JpcHRzIGFuZCBhbGwgaXMgZmluZS4gQnJlYVRoZSB0b29s
IGRvZXMgbm90IGFsd2F5cyB1bmRlcnN0YW5kIHRoZQ0KCXhzYTMwMy8qLnBhdGNoICAgICAgICAg
eGVuLXVuc3RhYmxlIC4uIFhlbiA0LjkNCm5vdGF0aW9uIGluIHhzYS5naXQsIHdoaWNoIGlzIG5v
dCB3ZWxsIGRlZmluZWQuIEJ1dCBpdCdzIHByb2JhYmx5IG5vdCB3b3J0aCB0cnlpbmcgdG8gZml4
IHRoaXMsIGFzIGEgbWFudWFsIGNoZWNrIHRha2VzIGxlc3MgdGhhbiBhIG1pbnV0ZQ0KDQpUb29s
IG91dHB1dCBpcyBiZWxvdw0KDQpYU0EgMjk2IDogU29tZSBwYXRjaGVzIG5vdCBhcHBsaWVkID0+
IGNoZWNrDQpBcHBsaWVkIA0KDQpYU0EgMjk3IDogTm8gcGF0Y2ggZm91bmQgPT4gY2hlY2sNCldh
cyBhcHBsaWVkIGluIFhlbiA0LjEyLjENCg0KWFNBIDI5OCA6IEFsbCBwYXRjaGVzIGZvdW5kIChu
byBuZWVkIHRvIGNoZWNrKQ0KWFNBIDI5OSA6IEFsbCBwYXRjaGVzIGZvdW5kIChubyBuZWVkIHRv
IGNoZWNrKQ0KDQpYU0EgMzAwIDogTm8gcGF0Y2ggZm91bmQgPT4gY2hlY2sNCkxpbnV4IG9ubHkN
Cg0KWFNBIDMwMSA6IEFsbCBwYXRjaGVzIGZvdW5kIChubyBuZWVkIHRvIGNoZWNrKQ0KDQpYU0Eg
MzAyIDogU29tZSBwYXRjaGVzIG5vdCBhcHBsaWVkID0+IGNoZWNrDQpBcHBsaWVkDQoNClhTQSAz
MDMgOiBTb21lIHBhdGNoZXMgbm90IGFwcGxpZWQgPT4gY2hlY2sNCkFwcGxpZWQNCg0KWFNBIDMw
NCA6IEFsbCBwYXRjaGVzIGZvdW5kIChubyBuZWVkIHRvIGNoZWNrKQ0KWFNBIDMwNSA6IEFsbCBw
YXRjaGVzIGZvdW5kIChubyBuZWVkIHRvIGNoZWNrKQ0KDQpSZWdhcmRzDQpMYXJzDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
