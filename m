Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC33131262
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 13:57:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioRv2-0002U8-LK; Mon, 06 Jan 2020 12:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9szg=23=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ioRv1-0002Tz-4N
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 12:55:39 +0000
X-Inumbo-ID: b4bcd5a0-3083-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4bcd5a0-3083-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578315283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XO/Lv+VwztW6Jl3Jwu13BNLGXUN4Y8AJRtqHFGlw7/Q=;
 b=PmTUDh0FYbmLUVuz40yv6b7UGnohXjt/gAq8S4aApZxZhATd2zyQaZH0
 9+56xREBcpCmUtYrF6Br0e8hEYCiL1gMKyJ8jTrTlVXdk2KM/2v8HZwK4
 2dR3cPGhQBtf7nr18pZ9Js39lTtcVsueVQZZWftlFtCPQTJR+k+KTuT/a w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WIkaqULtgEdT14UO4Ok36Mu6qQ3Q+vfg8LcYIAfukAT7fkBJvZxvJHYMsyR3OUKanHBG3y+nSC
 z0HzoA051A81qBse7QjWU1A5R6NwjC/g9f5zPxbgiZ7fqeZCQqC+ol/540eTkJ5E/7Yv/2v/ng
 HaTfNAjMNJoF6PicSrAZQfe0ZRh//FI/LiX+Z0MUJyN3BZb30L2TSviQSfyc4NNofpi3diUWrX
 Q9xxka59vjxp9tilHYwYYN7P7woDQbBoMv+gjc3g6kH7x2lB0NYRdsEAz92RxBRFbuazvbQAyF
 xro=
X-SBRS: 2.7
X-MesageID: 10478794
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10478794"
From: Lars Kurth <lars.kurth@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Lars Kurth
 <lars.kurth@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 7/7] Added Resolving Disagreement
Thread-Index: AQHVv0fkp8rvvtfKW0O4fT+TCLnPlKfdNbkAgABb2wA=
Date: Mon, 6 Jan 2020 12:54:38 +0000
Message-ID: <3993E270-A44B-4131-9BD9-E3E58C51D8D3@citrix.com>
References: <cover.1577733361.git.lars.kurth@citrix.com>
 <1bf177593fcea64b0386a13cdabae24fb0d3cb96.1577733361.git.lars.kurth@citrix.com>
 <d7b5a168-f11f-32f4-08fc-3e4c2aeb70fa@suse.com>
In-Reply-To: <d7b5a168-f11f-32f4-08fc-3e4c2aeb70fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C20F8DB44DFB9748BACF33B524E695AA@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 7/7] Added Resolving Disagreement
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

DQoNCu+7v09uIDA2LzAxLzIwMjAsIDA3OjI1LCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+KyMjIElzc3VlOiBTbWFsbCBmdW5jdGlvbmFsIGlzc3Vlcw0K
ICAgID4rDQogICAgPitUaGUgbW9zdCBjb21tb24gYXJlYSBvZiBkaXNhZ3JlZW1lbnRzIHdoaWNo
IGhhcHBlbiBpbiBjb2RlIHJldmlld3MsIGFyZQ0KICAgID4rZGlmZmVyaW5nIG9waW5pb25zIG9u
IHdoZXRoZXIgc21hbGwgZnVuY3Rpb25hbCBpc3N1ZXMgaW4gYSBwYXRjaCBzZXJpZXMgaGF2ZSB0
bw0KICAgID4rYmUgcmVzb2x2ZWQgb3Igbm90IGJlZm9yZSB0aGUgY29kZSBpcyByZWFkeSB0byBi
ZSBzdWJtaXR0ZWQuIFN1Y2ggZGlzYWdyZWVtZW50cw0KICAgID4rYXJlIHR5cGljYWxseSBjYXVz
ZWQgYnkgZGlmZmVyZW50IGV4cGVjdGF0aW9ucyByZWxhdGVkIHRvIHRoZSBsZXZlbCBvZg0KICAg
ID4rcGVyZmVjdGlvbiBhIHBhdGNoIHNlcmllcyBuZWVkcyB0byBmdWxmaWwgYmVmb3JlIGl0IGNh
biBiZSBjb25zaWRlcmVkIHJlYWR5IHRvDQogICAgDQogICAgcy9mdWxmaWwvZnVsZmlsbC8NCiAg
ICANCiAgICA+K2JlIGNvbW1pdHRlZC4NCiAgICA+Kw0KICAgID4rVG8gZXhwbGFpbiB0aGlzIGJl
dHRlciwgSSBhbSBnb2luZyB0byB1c2UgdGhlIGFuYWxvZ3kgb2Ygc29tZSBidWlsZGluZyB3b3Jr
IHRoYXQNCiAgICA+K2hhcyBiZWVuIHBlcmZvcm1lZCBhdCB5b3VyIGhvdXNlLiBMZXQncyBzYXkg
dGhhdCB5b3UgaGF2ZSBhIG5ldyBiYXRocm9vbQ0KICAgID4raW5zdGFsbGVkLiBCZWZvcmUgcGF5
aW5nIHlvdXIgYnVpbGRlciB0aGUgbGFzdCBpbnN0YWxtZW50LCB5b3UgcGVyZm9ybSBhbg0KICAg
IA0KICAgIHMvaW5zdGFsbWVudC9pbnN0YWxsbWVudC8NCg0KSGkgSnVlcmdlbjogdGhhbmsgeW91
IGZvciBwb2ludGluZyBvdXQgdGhlIHJlbWFpbmluZyB0eXBvcy4gDQoNCkkgZml4ZWQgdGhlc2Ug
aW4gbXkgbG9jYWwgdHJlZSwgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZSB0d28gaW5zdGFuY2Vz
IGFib3ZlLg0KDQpUaGUgdHdvIGlzc3VlcyBhYm92ZSBjb21lIGRvd24gdG8gVVMgdnMgbm9uLVVT
IEVuZ2xpc2gNCg0KaHR0cHM6Ly9ncmFtbWFyaXN0LmNvbS9zcGVsbGluZy9mdWxmaWwtZnVsZmls
bC8NCmh0dHBzOi8vZ3JhbW1hcmlzdC5jb20vc3BlbGxpbmcvaW5zdGFsbG1lbnQtaW5zdGFsbWVu
dC8gDQoNCkkgZGlkbid0IHJlYWxseSByZXZpZXcgdGhlIGRvY3VtZW50IGZvciBjb25zaXN0ZW5j
eSB3aXRoIHJlc3BlY3QgdG8gYSBwYXJ0aWN1bGFyIHN0eWxlIG9mIEVuZ2xpc2ggc3BlbGxpbmcu
DQpJdCBkb2VzIHNlZW0gdGhvdWdoIHRoYXQgbm9ybWFsbHkgSSB1c2UgVVMgc3BlbGxpbmcgKGUu
Zy4gbWluaW1pemUpIG1vc3RseSBhbmQgb2YgY291cnNlIHRoZSBDb250cmlidXRvcg0KQ292ZW5h
bnQgaGFzIGJlZW4gd3JpdHRlbiBVUyBzcGVsbGluZy4gDQoNCkkgZG9uJ3QgaGF2ZSBhIHN0cm9u
ZyB2aWV3IGVpdGhlciB3YXkgYW5kIGNhbiBoYXZlIGEgZ28gYXQgbWFraW5nIGl0IGNvbnNpc3Rl
bnQgKGUuZy4gaW4gVVMgc3R5bGVzcGVsbGluZykNCg0KTGFycw0KDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
