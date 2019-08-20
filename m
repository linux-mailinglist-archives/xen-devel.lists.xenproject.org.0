Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181D95F8F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 15:11:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03te-0002JN-Os; Tue, 20 Aug 2019 13:09:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUBi=WQ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i03tc-0002JG-Ev
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 13:09:56 +0000
X-Inumbo-ID: cd0cd880-c34b-11e9-8bf7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd0cd880-c34b-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566306594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1yX9yGpMYJQqXqLw+U1n899zDxfL2tvcr5ckLbOucUc=;
 b=IetKvIAsUoMuyA9d4PXHGpEludHKxb7F8DE0rbJNYA+N5/3uok4npWz+
 LpOW5DZb27kmviprUZG3JzGh07k8gM+ljq2UxjQU5DtBoGMhP5SKTf92a
 BedalH21U+9YMEbZqYqH7cn8/wmJDdAmPui9Fs4GJSrD5+zvNWwjUjH9t U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CDvCOxymEVbvxWxHZmVmPefH8KmAWBjxE8+MS3ElXq3+C/S8mT3ZmwJ1zDD8NSkTPKc8m41W/U
 RAYPhebesgC+bDLhp5owiCtDWEloCttXZBnftUQ3vj3yFKPacmrKI4HERZw/KKrUwo5WRUE7Sq
 t/0PiplMXAorKEcdviQGqhhtuKF+z3l6eS+BQIQnzA0fDy7ZUbbvex70vMMdnJ6FSwTih28hm9
 DaLBwfPlNJy5TELV7CUado0TWnzRMMSfiTiUjvZmG/G8NreytL42yZGpEmvc+M1ykdGIumjypm
 wwQ=
X-SBRS: 2.7
X-MesageID: 4650790
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4650790"
From: Christian Lindig <christian.lindig@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Thread-Topic: [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn rebind
 function from cxenstored
Thread-Index: AQHVVr5MK6au/yYrc0WquZUXd0SG76cDkYSAgAAoOACAABgFAIAACWmAgAAG6gA=
Date: Tue, 20 Aug 2019 13:09:51 +0000
Message-ID: <C366A9DF-95EE-4262-BBC6-A1F61077CE28@citrix.com>
References: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
 <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
 <d61c8e5e-eb9b-755f-0917-b4d009c64d74@citrix.com>
 <9324516A-66F9-47FC-AD8F-BF44059D29B2@citrix.com>
 <52ddaa4f-bc1a-43b2-a995-b9e7cae3044f@citrix.com>
In-Reply-To: <52ddaa4f-bc1a-43b2-a995-b9e7cae3044f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <EC169D259004FF4D8D0AFD5A850B3307@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjAgQXVnIDIwMTksIGF0IDEzOjQ1LCBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6
aGluaW5AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBjb24gaXMgcGFzc2VkIGludG8gdGhhdCBm
dW5jdGlvbiBmcm9tIHhlbnN0b3JlZC5tbCB3aGVyZSBpdCdzIGV4dHJhY3RlZA0KPiBmcm9tIHRo
ZSBzYW1lIGhhc2h0YWJsZSAoQ29ubmVjdGlvbnMpIHNvIGl0J3MgYWN0dWFsbHkgdGhlIGV4YWN0
bHkgc2FtZQ0KPiBvYmplY3QuIA0KDQpUaGlzIGNvbWVzIGRvd24gdG8gd2hhdCBzZW1hbnRpY3Mg
eW91IHdhbnQuIEl0IGlzIHVuZm9ydHVuYXRlIHRoYXQgQ29ubmVjdGlvbi50IGlzIG5vdCBhYnN0
cmFjdCBhbmQgaXRzIGVxdWFsaXR5IG5vdCB3ZWxsIGRlZmluZWQuIFVzaW5nICE9IG5vdyByZWxp
ZXMgb24gdGhlIGZhY3QgdGhhdCB5b3Ugb25seSBjb21wYXJlIHZhbHVlcyBzdG9yZWQgaW4gdGhl
IHNhbWUgaGFzaCB0YWJsZS4NCg0K4oCUIEMNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcg
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
