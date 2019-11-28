Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D510C93E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:08:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaJVe-00066C-DV; Thu, 28 Nov 2019 13:07:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aQmR=ZU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iaJVc-000660-Sh
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:07:00 +0000
X-Inumbo-ID: e9523f67-11df-11ea-a3d2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9523f67-11df-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574946399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SLRRkcq0NsgessIStO64x11cu8dqcIdXEeovuA1RDA0=;
 b=H6zqWgRpjAC76IDOR8mwrKKD4BasGRWgoEl311Can3weGb5o/n4s7tWn
 sEvQW7aPGk8TLcUDD4Rk2ljNSOHKph8KaG1peaCEswL0/cKLe+o4JavLy
 7JoI+Ip5hjloTl8drlhZCdTrD1ZkNQJEGqxZa7Pq7rbNLXZ0t2iQfy9gy Y=;
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
IronPort-SDR: XP56NDIBQS8bELwL2rG9J+C46g6OsrvGTd1pnaUqd8AapGyMf0aoGJoLsFzDdu5CZfNTairVta
 mylRfJ6pH5ydKGbbUN7JkVRtBgpNh1kZFlNeA2GqjBk0yH/+y6stMCDMyFD2rsTunLRb8gAD09
 cteGN5ePDf0n1wxklLl9Wd9I5j4XjoVqwWd6GFR0eH5peyTtz8XnIR9qMurdzMe6DaJItLDO6u
 0Zz/Yl0gRWQV90Jdtg/wdFvTps3nsLtbVajEtigI1cYDNAE+Xv1sZ6dkogxC1Vcm+rNsxGkfh1
 X4k=
X-SBRS: 2.7
X-MesageID: 8946827
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8946827"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
Thread-Index: AQHVdKIj+bIBaPEUGUyD9FYiIrE4J6egEqKAgACbQgD//8zPgA==
Date: Thu, 28 Nov 2019 13:06:34 +0000
Message-ID: <2200B0A8-0EDE-4843-A5D3-A84F2D01333D@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
 <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
In-Reply-To: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BD3716ADA3EFA34E9ED0997E4D9F1FCB@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI4LzExLzIwMTksIDA0OjA5LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAyOC4xMS4yMDE5IDAxOjU0LCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6DQogICAgPiBPbiBUaHUsIDI2IFNlcCAyMDE5LCBMYXJzIEt1cnRoIHdyb3RlOg0K
ICAgID4+IEZyb206IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICA+Pg0K
ICAgID4+IFRoaXMgZG9jdW1lbnQgaGlnaGxpZ2h0cyB3aGF0IHJldmlld2VycyBzdWNoIGFzIG1h
aW50YWluZXJzIGFuZCBjb21taXR0ZXJzIGxvb2sNCiAgICA+PiBmb3Igd2hlbiByZXZpZXdpbmcg
Y29kZS4gSXQgc2V0cyBleHBlY3RhdGlvbnMgZm9yIGNvZGUgYXV0aG9ycyBhbmQgcHJvdmlkZXMN
CiAgICA+PiBhIGZyYW1ld29yayBmb3IgY29kZSByZXZpZXdlcnMuDQogICAgPiANCiAgICA+IEkg
dGhpbmsgdGhlIGRvY3VtZW50IGlzIG1pc3NpbmcgYSBjb3VwbGUgb2YgdGhpbmdzOg0KICAgID4g
DQogICAgPiAtIGEgc2ltcGxlIG9uZSBsaW5lIHN0YXRlbWVudCB0aGF0IHBvc3NpYmx5IHRoZSBt
b3N0IGltcG9ydGFudCB0aGluZyBpbg0KICAgID4gICBhIGNvZGUgcmV2aWV3IGlzIHRvIGluZGVu
dGlmeSBhbnkgYnVncyBpbiB0aGUgY29kZQ0KICAgID4gDQogICAgPiAtIGFuIGV4cGxhbmF0aW9u
IHRoYXQgcmVxdWVzdHMgZm9yIG1ham9yIGNoYW5nZXMgdG8gdGhlIHNlcmllcyBzaG91bGQgYmUN
CiAgICA+ICAgbWFkZSBlYXJseSBvbiAoaS5lLiBsZXQncyBub3QgY2hhbmdlIHRoZSBhcmNoaXRl
Y3R1cmUgb2YgYSBmZWF0dXJlIGF0DQogICAgPiAgIHY5IGlmIHBvc3NpYmxlKSBJIGFsc28gbWFk
ZSB0aGlzIGNvbW1lbnQgaW4gcmVwbHkgdG8gcGF0Y2ggIzUuIEknbGwNCiAgICA+ICAgbGV0IHlv
dSBkZWNpZGUgd2hlcmUgaXMgdGhlIGJlc3QgcGxhY2UgZm9yIGl0Lg0KICAgIA0KICAgIFRoaXMg
bmVlZHMgYmFsYW5jaW5nLiBQZW9wbGUgY3J1Y2lhbCB0byB0aGUgZXZhbHVhdGlvbiBvZiBhIG5l
dw0KICAgIGZlYXR1cmUgYW5kIGl0cyBpbXBsZW1lbnRhdGlvbiBzaW1wbHkgbWF5IG5vdCBoYXZl
IHRoZSB0aW1lIHRvDQogICAgcmVwbHkgcHJpb3IgdG8gdjkuIFdlJ3ZlIGhhZCBzaXR1YXRpb25z
IHdoZXJlIHBlb3BsZSBwb3N0ZWQgbmV3DQogICAgcmV2aXNpb25zIGV2ZXJ5IG90aGVyIGRheSwg
c29tZXRpbWVzIGV2ZW4gbW9yZSB0aGFuIG9uZSBwZXIgZGF5Lg0KDQpJIGNhbiBjZXJ0YWlubHkg
YWRkIHNvbWV0aGluZyBvbiB0aGUgdGltaW5nICwgYWxvbmcgdGhlIGxpbmVzIG9mDQoqIEZvciBj
b21wbGV4IHNlcmllcywgY29uc2lkZXIgdGhlIHRpbWUgaXQgdGFrZXMgdG8gZG8gcmV2aWV3cyAo
bWF5YmUgd2l0aCBhIGd1aWRlIG9mIExPQyBwZXIgaG91cikgYW5kIGdpdmUgcmV2aWV3ZXJzIGVu
b3VnaCB0aW1lIHRvDQoqIEZvciBzZXJpZXMgd2l0aCBkZXNpZ24gaXNzdWVzIG9yIGxhcmdlIHF1
ZXN0aW9ucywgdHJ5IGFuZCBoaWdobGlnaHQgdGhlIGtleSBvcGVuIGlzc3VlcyBpbiBjb3ZlciBs
ZXR0ZXJzIGNsZWFybHkgYW5kIHNvbGljaXQgZmVlZGJhY2sgZnJvbSBrZXkgbWFpbnRhaW5lcnMg
d2hvIGNhbiBjb21tZW50IG9uIHRoZSBvcGVuIGlzc3VlLiBUaGUgaWRlYSBpcyB0byBzYXZlIGJv
dGggdGhlIGNvbnRyaWJ1dG9yIGFuZCB0aGUgcmV2aWV3ZXJzIHRpbWUgYnkgZm9jdXNzaW5nIG9u
IHdoYXQgbmVlZHMgdG8gYmUgcmVzb2x2ZWQgDQoqIERvbuKAmXQgcmVwb3N0IGEgc2VyaWVzLCB1
bmxlc3MgYWxsIHJldmlldyBjb21tZW50cyBhcmUgYWRkcmVzc2VkIG9yIHRoZSByZXZpZXdlcnMg
YXNrZWQgeW91IHRvIGRvIHNvLiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgaXMgdGhhdCB0aGlzIGlz
IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGggdGhlICJsZXQncyBmb2N1cyBvbiB0aGUgY29yZSBp
c3N1ZXMgYW5kIG5vdCBnZXQgZGlzdHJhY3RlZCBieSBkZXRhaWxzIGVhcmx5IG9uIGluIGEgcmV2
aWV3IGN5Y2xlIi4gSW4gb3RoZXIgd29yZHMsIHRoaXMgY2FuIG9ubHkgd29yaywgaWYgcmV2aWV3
ZXJzIGZvY3VzIG9uIG1ham9yIGlzc3VlcyBpbiBlYXJseSByZXZpZXdzIG9ubHkgYW5kIGRvIG5v
dCBmb2N1cyBvbiBzdHlsZSwgY29kaW5nIHN0YW5kYXJkcywgZXRjLiBBcyBzb29uIGFzIGEgcmV2
aWV3ZXIgY29tZXMgYmFjayB3aXRoIGRldGFpbGVkIGZlZWRiYWNrLCB0aGUgY29udHJpYnV0b3Ig
d2lsbCBmZWVsIG9ibGlnZWQgdG8gZml4IHRoZXNlLiBUaGlzIGNyZWF0ZXMgYSBtb3RpdmF0aW9u
IHRvIHdhbnQgdG8gcGxlYXNlIHRoZSByZXZpZXdlciBzZW5kIG91dCBuZXcgdmVyc2lvbnMgb2Yg
c2VyaWVzIGZpeGluZyBjb3NtZXRpYyBpc3N1ZXMgd2l0aG91dCBhZGRyZXNzaW5nIHRoZSBzdWJz
dGFudGlhbCBpc3N1ZXMsIGxlYWRpbmcgdG8gd2hhdCBKYW4gZGVzY3JpYmVzLiBJIGFtIGxvb2tp
bmcgZm9yIG9waW5pb25zIGhlcmUuICANCiAgICANCiAgICBBcyBpbmRpY2F0ZWQgaW4gc2V2ZXJh
bCBvdGhlciBjb250ZXh0cyBiZWZvcmUgLSBpbW8gcGVvcGxlIG5vdA0KICAgIGhlbHBpbmcgdG8g
c2hvdWxkZXIgdGhlIHJldmlldyBsb2FkIHNob3VsZCBhbHNvIG5vdCBoYXZlIHRoZQ0KICAgIGV4
cGVjdGF0aW9uIHRoYXQgdGhlaXIgKGxhcmdlKSBjb250cmlidXRpb25zIHdpbGwgYmUgbG9va2Vk
IGF0DQogICAgaW4gZHVlIGNvdXJzZS4gDQogICAgDQpJIGNhbiBhZGQgc29tZXRoaW5nIHRvIHRo
aXMgZWZmZWN0LiAgDQoNCkxhcnMNCiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
