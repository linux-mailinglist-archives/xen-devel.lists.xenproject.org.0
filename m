Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C781E1B498B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 18:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRHrf-0002pk-OB; Wed, 22 Apr 2020 16:04:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI87=6G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRHre-0002pf-Fd
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 16:04:42 +0000
X-Inumbo-ID: f914b7e4-84b2-11ea-92a6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f914b7e4-84b2-11ea-92a6-12813bfff9fa;
 Wed, 22 Apr 2020 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587571481;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=uo6cG7FvJcmGQBp58Ixw9BOK89YlsvpEaT1zEvp+qE8=;
 b=CDNT5tKFAvF10g4N7NZhdDjeEmWdjLOmNMAllGe3KFcHxyGIw+FbRVQg
 5zO8IuPFYZimQzXj+mNdSxXxzGUiymB2UCk3LFBfU7GYH02GvHI5G485W
 KB02RbPYw/VP75kVQjjLKErV7/lY9c2tObhOflh76BiGGYcA+XyKP6va/ U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UNylRPrAYfP3GfQSrhbLHR7RfLs8sVNQca8ZWW74vZSHRaQunXFZ9KQD06h2FWe2feNXNl9Qn3
 bNenCEKN216GJzlswJowevaxbHQlqCNYiQAUUkOQeX/C+okB149M7tYbIbmBvOjTuPvTXyhCrS
 iZ5pmG3pH3LfeaPQrIu4cXWBI5UVtjBjFWzWk4t2Akda6Kl49YDqQuY5mTWRaj+jzDJ1LraKn2
 JOvof84gqSQLwRrwHOK7vMqn0nUd0EwCvB9e1psBcx7Jq5uSNKwhf+EJDu3RuNc0faAi5WJ2v/
 d70=
X-SBRS: 2.7
X-MesageID: 16393313
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,303,1583211600"; d="scan'208,217";a="16393313"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Golang Xen packages and the golang packaging  system
Thread-Topic: Golang Xen packages and the golang packaging  system
Thread-Index: AQHWGL+4RaHBeS8dkEGvpDIRZjts4w==
Date: Wed, 22 Apr 2020 16:04:37 +0000
Message-ID: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <E64C3C6AA610FD48AC63071689994CE9@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U28gY3VycmVudGx5LCBvdXIgYnVpbGQgc3lzdGVtIHdpbGwgaW5zdGFsbCB0aGUgeGVubGlnaHQg
cGFja2FnZSBpbnRvICRQUkVGSVgvc2hhcmUvZ29jb2RlL3NyYy9nb2xhbmcueGVucHJvamVjdC5v
cmcveGVubGlnaHQuICBIb3dldmVyLCBpdCBhY3R1YWxseSB0YWtlcyBhIGJpdCBvZiB3cmVzdGxp
bmcgdG8gZ2V0IGdvbGFuZyB0byB1c2UgdGhpcyBsb2NhdGlvbiwgYW5kIG1ha2VzIGl0IGRpZmZp
Y3VsdCB0byB1c2Ugc2hhcmVkIGNvZGUuICBJdCB3b3VsZCBiZSBuaWNlIGlmIHBlb3BsZSBjb3Vs
ZCBzaW1wbHkgYWRkIGBnb2xhbmcueGVucHJvamVjdC5vcmcveGVubGlnaHRgIHRvIHRoZWlyIGRl
cGVuZGVuY2llcywgYW5kIGhhdmUgYGdvIGdldGAganVzdCBEVFJULg0KDQpUaGlzIGJhc2ljYWxs
eSBpbnZvbHZlcyB0d28gdGhpbmdzOg0KDQoxLiBDcmVhdGluZyBhIHB1YmxpY2x5LWFjY2Vzc2li
bGUgc3VpdGFibGUgZ2l0IHJlcG8gY29udGFpbmluZyB0aGUgZ29sYW5nIHBhY2thZ2UocykNCg0K
Mi4gQ2F1c2luZyBgY3VybCBnb2xhbmcueGVucHJvamVjdC5vcmcvJFBLR05BTUVgIHRvIHJldHVy
biBzb21lIEhUTUwgd2l0aCB0aGUgZm9sbG93aW5nIHJ1bmU6DQoNCjxtZXRhIG5hbWU9ImdvLWlt
cG9ydCIgY29udGVudD3igJxnb2xhbmcueGVucHJvamVjdC5vcmcgZ2l0ICRVUkzigJ0+DQoNCldo
ZXJlICRVUkwgcG9pbnRzIHRvIHRoZSB0cmVlIGZyb20gIzEuDQoNCldlIHNob3VsZCBwcm9iYWJs
eSBhbHNvIGhhdmUgc29tZSBtb3JlIGh1bWFuLWZyaWVuZGx5IGNvbnRlbnQgaW4gY2FzZSBzb21l
b25lIHdhbmRlcnMgdGhlcmUgd2l0aCBhIHdlYiBicm93c2VyLg0KDQrigJxTdWl0YWJsZSBnaXQg
dHJlZeKAnSBtZWFuczoNCi0gVGhhdCBpdCBjb250YWlucyBqdXN0IHRoZSBiaW5kaW5ncy4gIA0K
LSBBbnkg4oCYcmVsZWFzZWTigJkgWGVuIHZlcnNpb24gaGFzIGEgdGFnIG9mIHRoZSB2QS5CLkMg
Zm9ybWF0DQoNCkkgdGhpbmsgaWRlYWxseSB3ZeKAmWQgbGlrZSB0aGUg4oCYbWFzdGVy4oCZIGJy
YW5jaCBvZiB0aGlzIGdpdCB0cmVlIHRvIGNvbnRhaW4gdGhlIGJpbmRpbmdzIGZyb20gdGhlIHhl
bmJpdHMueGVucHJvamVjdC5vcmcveGVuLmdpdCBtYXN0ZXIgYnJhbmNoLCBidXQgdGhhdOKAmXMg
c29tZXdoYXQgbmVnb3RpYWJsZS4NCg0KU28gd2hhdCB3ZeKAmWQgbmVlZCB0byBkbyBpcyBoYXZl
IGEgcHJvY2VzcyAvIGhvb2sgc29tZXdoZXJlIHdoaWNoIHdvdWxkLCBvbiBwdXNoIHRvIHhlbmJp
dHMueGVucHJvamVjdC5vcmcveGVuLmdpdCDigJlzIG1hc3RlciBicmFuY2g6DQogLSBHZW5lcmF0
ZSB0aGUgYmluZGluZ3MgZnJvbSB0aGUgc291cmNlIGNvZGUNCiAtIENvcHkgdGhlc2UgYmluZGlu
Z3MgaW50byB0aGUgZ2l0IHJlcG8sIHJlcGxhY2luZyB0aGUgb2xkIGJpbmRpbmdzIGVudGlyZWx5
IChpLmUuLCBkZWxldGluZyBmaWxlcyB3aGljaCBkb27igJl0IGV4aXN0IGFueSBtb3JlLCBhZGRp
bmcgbmV3IGZpbGVzKQ0KIC0gUnVubmluZyDigJhnaXQgY29tbWl04oCZLCBwcm9iYWJseSB3aXRo
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBjb21taXQgZnJvbSB3aGljaCB0aGlzIGNvZGUgaGFzIGJl
ZW4gZ2VuZXJhdGVkDQogLSBDaGVjayB0byBzZWUgaWYgdGhlcmUgaXMgYSBuZXcgUkVMRUFTRS1Y
LlkuWiB0YWcgYW5kIGdlbmVyYXRlIGFuIGFwcHJvcHJpYXRlIHRhZw0KIC0gUHVzaCB0byB0aGUg
Z2l0IHJlcG8gaW4gc3RlcCAjMSBhYm92ZQ0KDQpUaGlzIHNjcmlwdCBzaG91bGQgbGl2ZSBpbiB4
ZW4uZ2l0IEkgZ3Vlc3MuDQoNCkkgZ3Vlc3MgbWF5YmUgaXQgd291bGQgbWFrZSBzZW5zZSB0byBo
YXZlIG9uZSBnaXQgdHJlZSBwZXIgcGFja2FnZSwgYW5kIHB1dCB0aGVtIGF0IHhlbmJpdHMueGVu
cHJvamVjdC5vcmcvZ29sYW5nLyRQS0dOQU1FPyAoZS5nLiwgeGVuYml0cy54ZW5wcm9qZWN0Lm9y
Zy9nb2xhbmcveGVubGlnaHQuZ2l0PykgIEF0IGFueSByYXRlLCBzb21ldGhpbmcgdGhhdCB3b3Vs
ZCBhbGxvdyB1cyB0byBsZXZlcmFnZSBvdXIgY3VycmVudCBnaXRodHRwIGluc3RhbmNlIG9uIHhl
bmJpdHMuDQoNCk9uZSBxdWVzdGlvbiBJIGhhdmUgZnJvbSB0aGUgYWJvdmUgaXMgaG93IHRoZSB4
ZW4uZ2l0IFJFTEVBU0UtWC5ZLlogc2hvdWxkIGNvcnJlc3BvbmQgdG8gdGhlIHZBLkIuQyBpbiB0
aGUgZ29sYW5nIHBhY2thZ2UgcmVwby4NCg0KVGhlIG9idmlvdXMgYW5zd2VyLCBvZiBjb3Vyc2Us
IGlzIChBLCBCLCBDKSA9IChYLCBZLCBaKTsgdGhhdCBpcywgeGVuLmdpdCB0YWcgUkVMRUFTRS00
LjE0LjAgc2hvdWxkIGNyZWF0ZSBhIGdvbGFuZyBwYWNrYWdlIHRhZyBvZiB2NC4xNC4wLg0KDQpU
aGUgaXNzdWUgd2l0aCB0aGlzIGlzIHRoYXQgZ29sYW5nIGFzc3VtZXMgeW914oCZcmUgdXNpbmcg
c2VtYW50aWMgdmVyc2lvbmluZzsgc28gYSBgZ28gZ2V0IC11YCB3b3VsZCBub3JtYWxseSBmZWVs
IGp1c3RpZmllZCBpbiB1cGdyYWRpbmcgZnJvbSB2NC4xNC54IHRvIHY0LjE1LnguDQoNCkEgY291
cGxlIG9mIHBvc3NpYmxlIHJlc3BvbnNlczoNCg0KMS4gRGVjbGFyZSB0aGF0IE9LLiAgVGhhdCB3
b3VsZCBtZWFuIG5vdCBvbmx5IHRoYXQgd2UgaGF2ZSB0byBoYXZlIHY0LjE1LnggYmUgY29tcGF0
aWJsZSB3aXRoIGdvbGFuZyBzb3VyY2UgY29kZSB3cml0dGVuIGFnYWluc3QgdjQuMTQ7IGl0IHdv
dWxkIGFsc28gbWVhbiB0aGF0IHY0LjE1LnggbmVlZHMgdG8gYmUgYWJsZSB0byAqY29tcGlsZSog
YWdhaW5zdCBsaWJ4bCB2ZXJzaW9uIDQuMTQuICBXaGljaCBtaWdodCBiZSBhIGdvb2QgaWRlYSwg
YnV0IHdl4oCZZCB3YW50IHRvIHRoaW5rIGNhcmVmdWxseSBiZWZvcmUgbWFraW5nIHRoYXQga2lu
ZCBvZiBjb21taXRtZW50Lg0KDQoyLiBEZWNsYXJlIHRoYXQgcGVvcGxlIG5lZWQgdG8gdXNlIGBn
byBnZXQgLXU9cGF0Y2hgIHdoZW4gdXBkYXRpbmcsIGFuZC9vciB1c2UgZ28ubW9kICZjIHRvIG1h
bnVhbGx5IHJlc3RyaWN0IHRoZSB2ZXJzaW9uIG9mIGdvIHRvIHVzZSB0byB0aGUgY3VycmVudGx5
LWluc3RhbGxlZCBYZW4gdmVyc2lvbg0KDQozLiBNYXAgKEEsIEIsIEMpID0gKFksIFosIDApLiAg
KGkuZS4sIFJFTEVBU0UtNC4xNC41IHdvdWxkIG1ha2UgdGFnIHYxNC41LjAgLikgIGBnbyBnZXRg
IHdvdWxkbuKAmXQgdXBkYXRlIGF1dG9tYXRpY2FsbHksIGJ1dCBpdCBtaWdodCBiZSBjb25mdXNp
bmcgd2hpY2ggdmVyc2lvbiAqc2hvdWxkKiBiZSB1c2VkOyBwYXJ0aWN1bGFybHkgaWYgd2UgZXZl
ciByb2xsIG92ZXIgYSBtYWpvciB2ZXJzaW9uIGZvciBYZW4uDQoNCkFueSBvdGhlciBwb3NzaWJp
bGl0aWVzPw0KDQpJIHRoaW5rIEnigJlkIHN0YXJ0IG91dCB3aXRoICMyLCBhbmQgdGhlbiBjb25z
aWRlciBtb3ZpbmcgdG8gIzEgYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLg0KDQpUaG91Z2h0
cz8NCg0KIC1HZW9yZ2UNCg0K

