Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E0124EDE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 18:13:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihcpe-0001yM-1T; Wed, 18 Dec 2019 17:09:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0dd+=2I=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ihcpc-0001xw-Ht
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 17:09:52 +0000
X-Inumbo-ID: 27033462-21b9-11ea-90ce-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27033462-21b9-11ea-90ce-12813bfff9fa;
 Wed, 18 Dec 2019 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576688971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jNIhcddd0bO+CkEmQ6ulaol2vyUiU1n94IYXvS0vGEA=;
 b=Y6LEnMtaPNVgHt2wHw8C7N2ssbHxYzVGTjVaRHIbUH/RBbqtTBJmqh99
 aOLlVsKquJfHlwyStGK9U50UFmoWOwUy8TTDuu6JZhrtGLEO39xnwQnZn
 FCSVQYfluX7WqHnRqPE+97/X9G/LB6HtbZPqyuP54YQyowt/8dU7O3Nc1 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VsBcbBGGXCbAcN2P6qWVIJ3tssSaSQxWYfS2rGPd3+6nXdTMKzl72JL+BwHeBfpWRmU4Iq6VAQ
 e+xyMcNtP4677dVMvGNhV7ItJ2FllUAzFO5rn5duovyfuRoFeBlPVDhU5MJds/4w4+5hgRxi68
 SjWwNAS06b8pkGsdiwx3DJRFqHZssEayecxtuhtJhKTvyMUtiIBSgBIoGHRj/LhOx7NiBWR1e2
 m/WuEpQur9ANBZdRMUg/HYBijNIU7+S6yI67gSAfhWTZt2LOKeRYEDTRxI6t/TOvZL7sXEA9Ei
 htM=
X-SBRS: 2.7
X-MesageID: 10034170
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,330,1571716800"; d="scan'208";a="10034170"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien@xen.org>, Lars Kurth <lars.kurth@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 5/7] Add Code Review Guide
Thread-Index: AQHVsTE52Xd4Fx4F50OKdcHmKTc7r6e/7A8AgAAseIA=
Date: Wed, 18 Dec 2019 17:09:00 +0000
Message-ID: <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
In-Reply-To: <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <CDD65A22DD84BD4AADD36D863835D909@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE4LzEyLzIwMTksIDE0OjI5LCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KDQogICAgSGkgTGFycywNCiAgICANCiAgICBPbiAxMi8xMi8yMDE5IDIxOjE0
LCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgID4gKyMjIyBXb3JrZmxvdyBmcm9tIGFuIEF1dGhvcidz
IFBlcnNwZWN0aXZlDQogICAgPiArDQogICAgPiArV2hlbiBjb2RlIGF1dGhvcnMgcmVjZWl2ZSBm
ZWVkYmFjayBvbiB0aGVpciBwYXRjaGVzLCB0aGV5IHR5cGljYWxseSBmaXJzdCB0cnkNCiAgICA+
ICt0byBjbGFyaWZ5IGZlZWRiYWNrIHRoZXkgZG8gbm90IHVuZGVyc3RhbmQuIEZvciBzbWFsbGVy
IHBhdGNoZXMgb3IgcGF0Y2ggc2VyaWVzDQogICAgPiAraXQgbWFrZXMgc2Vuc2UgdG8gd2FpdCB1
bnRpbCByZWNlaXZpbmcgZmVlZGJhY2sgb24gdGhlIGVudGlyZSBzZXJpZXMgYmVmb3JlDQogICAg
PiArc2VuZGluZyBvdXQgYSBuZXcgdmVyc2lvbiBhZGRyZXNzaW5nIHRoZSBjaGFuZ2VzLiBGb3Ig
bGFyZ2VyIHNlcmllcywgaXQgbWF5DQogICAgPiArbWFrZSBzZW5zZSB0byBzZW5kIG91dCBhIG5l
dyByZXZpc2lvbiBlYXJsaWVyLg0KICAgID4gKw0KICAgID4gK0FzIGEgcmV2aWV3ZXIsIHlvdSBu
ZWVkIHNvbWUgc3lzdGVtIHRoYXQgaGU7cHMgZW5zdXJlIHRoYXQgeW91IGFkZHJlc3MgYWxsDQog
ICAgDQogICAgSnVzdCBhIHNtYWxsIHR5cG86IEkgdGhpbmsgeW91IG1lYW50ICJoZWxwcyIgcmF0
aGVyIHRoYW4gImhlO3BzIi4NCiAgICANCiAgICBDaGVlcnMsDQogICAgDQpUaGFuayB5b3U6IGZp
eGVkIGluIG15IHdvcmtpbmcgY29weS4NCg0KT25lIHRoaW5nIHdoaWNoIG9jY3VycmVkIHRvIG1l
IGZvciByZXZpZXdzIGxpa2UgdGhlc2UsIHdoZXJlIHRoZXJlIGlzIG5vIEFDSydzIG9yIFJldmll
d2VkLWJ5J3MgaXMgdGhhdCBJIGRvbid0IGFjdHVhbGx5IGtub3cgd2hldGhlciB5b3UgYXMgcmV2
aWV3ZXIgaXMgb3RoZXJ3aXNlIGhhcHB5IHdpdGggdGhlIHJlbWFpbmRlciBvZiBwYXRjaC4NCk5v
cm1hbGx5IHRoZSBBQ0tlZC1ieSBvciBSZXZpZXdlZC1ieSBpcyBhIHNpZ25hbCB0aGF0IGl0IGlz
DQoNCkkgYW0gYXNzdW1pbmcgaXQgaXMsIGJ1dCBJIHRoaW5rIGl0IG1heSBiZSB3b3J0aHdoaWxl
IHBvaW50aW5nIHRoaXMgb3V0IGluIHRoZSBkb2N1bWVudCwgdGhhdCB1bmxlc3Mgc3RhdGVkIG90
aGVyd2lzZSwgdGhlIHJldmlld2VyIGlzIGhhcHB5IHdpdGggdGhlIHBhdGNoDQoNClJlZ2FyZHMN
CkxhcnMgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
