Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51519421C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:54:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTsR-0003d7-Gs; Thu, 26 Mar 2020 14:52:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CXkV=5L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jHTsP-0003cw-Uz
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:52:57 +0000
X-Inumbo-ID: 7429d8f8-6f71-11ea-8803-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7429d8f8-6f71-11ea-8803-12813bfff9fa;
 Thu, 26 Mar 2020 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585234366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tNpdNsBpqlLds0cZXTGt3nv3wpQ8WrBb+u6K7XhV200=;
 b=BEShOwVYx5D3b26XH9LVBabmsnIbkKSjcwiS5jdtgEwyVo9z3TY1nM2k
 HvVHBKOP4cuLERG6w+1G0ThHaOjlsFeZNloKH7NG2ewVstnU/rjIELheG
 skNInyi9Py3n4cvRgN8IauzW0R5+do2itAQwu6++AkHFwcalU2ZxI8Z7V w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zn4522qkI9rtC6d06jDVQznptuD+421RoUO9VSYmHS+IHdJJhqDaiek0/hqVuHnteg1F9DxCcF
 u0kg/OJd/HX6/jHWrhdGqVAYEKoGsAMaFzOA0yBtkLXvK3FzjhwHO34Le+5AD7vJzjQHmNTXRl
 gXg2etjSbu9SZXubugXDtdt3yeqBj65HKrqUti2Y82Bs/XgpyaZqG6VSMgf+Va7+7+6xFH94aD
 qXl1thduLETwaoEjmK0hIe1QPrEQeZUWjnHJiZxb7Pa1B2ijrm+VEAUxLs5M3/RMVCzHCNsHQn
 Y2Y=
X-SBRS: 2.7
X-MesageID: 15098819
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15098819"
From: George Dunlap <George.Dunlap@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] Moving Forward on XenSummit
Thread-Index: AQHWAgZNdIJaxTkc7UCnbKgZmU5atqhYGu6AgALMqQA=
Date: Thu, 26 Mar 2020 14:52:42 +0000
Message-ID: <C84C88F3-8ED2-47C6-AB4C-DA5AF1DDEB4E@citrix.com>
References: <E8383000-6BA6-46A2-AD3C-0B6607CB8107@citrix.com>
 <38EF1238-32C2-462E-B548-EE1C3A8E7460@gmail.com>
In-Reply-To: <38EF1238-32C2-462E-B548-EE1C3A8E7460@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <40BE33B4019FE84ABE06EFDADA66C9B0@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] Moving Forward on XenSummit
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
 xen-devel <xen-devel@lists.xenproject.org>,
 "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE1hciAyNCwgMjAyMCwgYXQgODowNyBQTSwgUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNYXIgMjQsIDIwMjAsIGF0IDE0OjAzLCBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4gDQo+PiDvu79JIHdh
bnRlZCB0byBsZXQgZXZlcnlvbmUga25vdyB0aGF0IHRoZSBYZW5Qcm9qZWN0IGlzIG1vdmluZyBm
b3J3YXJkIHdpdGggcGxhbnMgdG8gaG9sZCBYZW5TdW1taXQgdGhpcyB5ZWFyLCBvbmUgd2F5IG9y
IGFub3RoZXIuDQo+PiANCj4+IFRoZXJlIGFyZSB0d28gYmFzaWMgYXBwcm9hY2hlcyB0aGUgQWR2
aXNvcnkgQm9hcmQgaGFzIGJlZW4gY29uc2lkZXJpbmc6ICBQb3N0cG9uaW5nIHRoZSBldmVuIHVu
dGlsIGxhdGVyIGluIHRoZSB5ZWFyLCBvciBob2xkaW5nIGEgdmlydHVhbCBldmVudCBkdXJpbmcg
dGhlIHNhbWUgdGltZWZyYW1lLiAgQWRkaXRpb25hbGx5LCBpZiB3ZSBob2xkIGEgdmlydHVhbCBl
dmVudCBkdXJpbmcgdGhlIHNhbWUgdGltZWZyYW1lLCB0aGUgQm9hcmQgd2FudHMgdG8ga2VlcCB0
aGUgb3B0aW9uIG9wZW4gb2YgaGF2aW5nIGEgc21hbGxlciwgaW4tcGVyc29uIGV2ZW50IGxhdGVy
IGluIHRoZSB5ZWFyLCBpZiBjaXJjdW1zdGFuY2VzIHBlcm1pdC4NCj4gDQo+IER1ZSB0byB2YXJp
YXRpb24gaW4gc2NvcGUvdGltaW5nIG9mIGdlbyBhbmQgY29tcGFueSByZXN0cmljdGlvbnMgb24g
dHJhdmVsLCBjb3VsZCBzb21lIHNwZWFrZXJzIHByZXNlbnQgcmVtb3RlbHkgZm9yIHRoZSBpbi1w
ZXJzb24gZXZlbnQ/ICANCj4gDQo+IENvdWxkIHRoZSBYZW4gU3VtbWl0IENGUCBiZSByZS1vcGVu
ZWQgZm9yIHRob3NlIHdobyBjYW4gcHJlc2VudCB2aXJ0dWFsbHksIHdobyBtYXkgbm90IGhhdmUg
c3VibWl0dGVkIGR1ZSB0byB0cmF2ZWwgcmVzdHJpY3Rpb25zPw0KDQpIZXkgUmljaCwNCg0KVGhh
bmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gIE9wZW5pbmcgdXAgdGhlIENGUCwgcmVkb2luZyB0aGUg
c2NoZWR1bGUsIGFuZCBzbyBvbiBpcyBhIHJlYXNvbmFibGUgYW1vdW50IG9mIGV4dHJhIHdvcmsg
Zm9yIHRoZSBMRiBwZW9wbGUgdG8gZG8gKGl04oCZcyBxdWl0ZSBhIGJpdCBvZiBtYWNoaW5lcnkp
OyBhbmQgaXQgd291bGRu4oCZdCByZWFsbHkgbWFrZSBzZW5zZSB0byBvcGVuIHVwIHRoZSBhY3R1
YWwgQ0ZQIHVudGlsIHdlIGtub3cgdGhhdCBpdOKAmXMgZ29pbmcgdG8gYWN0dWFsbHkgYmUgYSB2
aXJ0dWFsIGV2ZW50IHJhdGhlciB0aGFuIGEgcGh5c2ljYWwgb25lLiANCg0KSSB0aGluayBhIGJl
dHRlciBvcHRpb24gd291bGQgYmUgdG8gdGVsbCBwZW9wbGUgdG8gc3VibWl0IHRhbGtzIGFzIGRl
c2lnbiBzZXNzaW9ucywgb25jZSB0aGUgZGVzaWduIHNlc3Npb24gd2Vic2l0ZSBpcyB1cCwgcGVy
aGFwcyBtYXJrZWQgd2l0aCBbVEFMS10gaW4gdGhlIHRpdGxlIG9yIHNvbWV0aGluZy4gIFRoZW4g
YSB3ZWVrIGJlZm9yZWhhbmQgd2UgY2FuIGNvbnNpZGVyIHdoZXRoZXIgaXTigJlzIHdvcnRoIG1v
dmluZyBzb21lIG9mIHRoZSBbVEFMS10gc2xvdHMgdG8gYSDigJxwbGVuYXJ5LXNlc3Npb27igJ0g
c3BlY2lmaWMgdGltZSwgb3IganVzdCBsZWF2aW5nIHRoZW0gdG8gYmUgc2NoZWR1bGVkIHdpdGgg
dGhlIHJlc3Qgb2YgdGhlIGRlc2lnbiBzZXNzaW9ucy4NCg0KRG9lcyB0aGF0IHNvdW5kIHJlYXNv
bmFibGU/DQoNCiAtR2Vvcmdl

