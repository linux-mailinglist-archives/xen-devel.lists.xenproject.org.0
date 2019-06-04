Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24C34E22
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCjI-0004W0-0v; Tue, 04 Jun 2019 16:56:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYCjG-0004Vv-FX
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:56:06 +0000
X-Inumbo-ID: a3de413d-86e9-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a3de413d-86e9-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:56:05 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 7bca0JSlxGlb8TWG7XCtLpN2bRXkNg47znt0rXPaf4XemLFPNKF/Qpofk/yJIyuu6cFHbJEbLS
 aUclF/RueV58EKkAte6JjLCba/AZtXf+rrNIy084iFKgXEHNe/xqP0f6HW+f8v+feNov31uB4r
 l3aohHKGl9Kc4VyaWJRJkxPLnCewzTND4G3jV3kRGu+Nf0D1BQYq3sFX0fioNYHSNZV+TSQmDi
 VNljsubolvdVSudAc+4cLLEEabOIYt6Q3TXGkrd+kvruW0dtJJu6rd8WXMeaTvyDoFeM108Wob
 sZU=
X-SBRS: 2.7
X-MesageID: 1310611
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1310611"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.41603.907662.892014@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 17:55:31 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-4-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-4-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 3/9] libxl_internal: Split out userdata lock
 function
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDMvOV0gbGlieGxfaW50ZXJuYWw6IFNwbGl0
IG91dCB1c2VyZGF0YSBsb2NrIGZ1bmN0aW9uIik6Cj4gV2UgYXJlIGdvaW5nIHRvIGNyZWF0ZSBh
IG5ldyBsb2NrIGFuZCB3YW50IHRvIHJldXNlIHRoZSBzYW1lIG1hY2hpbmVyeS4KPiBBbHNvLCBo
aWRlIHRoZSBkZXRhaWwgb2Ygc3RydWN0IGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jayBhcyB0
aGlzIGlzCj4gb25seSB1c2VmdWwgYXMgYSBwb2ludGVyIGJ5IHRoZSByZXN0IG9mIGxpYnhsLgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgdG9vbHMvbGlieGwvbGli
eGxfaW50ZXJuYWwuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDUgKy0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
Ywo+IGluZGV4IGY0OTJkYWU1ZmYuLmZhMGJiYzM5NjAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMK
PiBAQCAtMzk3LDIxICszOTcsMjYgQEAgaW50IGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lvbl9y
dW5uaW5nKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKQo+ICAgICAgcmV0dXJuIHZhbHVl
Owo+ICB9Cj4gIAo+ICt0eXBlZGVmIHN0cnVjdCB7Cj4gKyAgICBsaWJ4bF9fY2FyZWZkICpjYXJl
ZmQ7Cj4gKyAgICBjaGFyICpwYXRoOyAvKiBwYXRoIG9mIHRoZSBsb2NrIGZpbGUgaXRzZWxmICov
Cj4gK30gbGlieGxfX2dlbmVyaWNfbG9jazsKPiArc3RhdGljIHZvaWQgbGlieGxfX3VubG9ja19n
ZW5lcmljKGxpYnhsX19nZW5lcmljX2xvY2sgKiBjb25zdCBsb2NrKTsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KU3B1cmlvdXMgc3Bh
Y2UuICAoTWFueSBsYXRlciBvY2N1cnJlbmNlcywgdG9vLikKCj4gK3N0YXRpYyBpbnQgbGlieGxf
X2xvY2tfZ2VuZXJpYyhsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9kb21pZCBkb21pZCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19nZW5lcmljX2xvY2sgKiBjb25zdCBsb2Nr
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbG9ja19uYW1l
KQo+ICB7Ci4uLgo+IC0gICAgaWYgKGxvY2spIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRh
KGxvY2spOwo+IC0gICAgcmV0dXJuIE5VTEw7Cj4gKyAgICBpZiAobG9jaykgbGlieGxfX3VubG9j
a19nZW5lcmljKGxvY2spOwoKSSB0aGluayB0aGUgaW50ZXJmYWNlIHRvIGxpYnhsX19sb2NrX2dl
bmVyaWMgaW1wbGllcyAhIWxvY2ssIHNvIHRoZXJlCmlzIG5vIG5lZWQgdG8gdGVzdCBpdCBoZXJl
LgoKSSBmaW5kIHRoZSBsZWdhbCBzdGF0ZXMgb2YgYSBsaWJ4bF9fZ2VuZXJpY19sb2NrIGEgYml0
IGNvbmZ1c2luZy4KSXQncyBvbmx5IGFuIGludGVybmFsIHN0cnVjdCBoZXJlLCBidXQgSSB0aGlu
ayB3ZSBuZWVkIGVpdGhlciBtb3JlCmZvcmdpdmluZyBydWxlcywgb3IgZXhwbGljaXQgY29tbWVu
dGFyeS4KCkFzIGl0IGlzLCB0aGUgaW1wbGVtZW50YXRpb24gb2YgbGlieGxfX2xvY2tfZ2VuZXJp
YyBhc3N1bWVzIHRoYXQgb24KZW50cnkgbG9jay0+Y2FyZWZkIGFuZCBsb2NrLT5wYXRoIGFyZSBi
b3RoIE5VTEwsIGFuZCB0aGVyZSBpcyBubwpmdW5jdGlvbiB0byBjcmVhdGUgc3VjaCBhIHNpdHVh
dGlvbi4gIFdlJ3JlIHJlbHlpbmcgb24gdGhlIGNhbGxlcnMnCm1lbXNldHMuCgo+IC12b2lkIGxp
YnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRhKGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jayAq
bG9jaykKPiArc3RhdGljIHZvaWQgbGlieGxfX3VubG9ja19nZW5lcmljKGxpYnhsX19nZW5lcmlj
X2xvY2sgKiBjb25zdCBsb2NrKQo+ICB7Cj4gICAgICAvKiBJdCdzIGltcG9ydGFudCB0byB1bmxp
bmsgdGhlIGZpbGUgYmVmb3JlIGNsb3NpbmcgZmQgdG8gYXZvaWQKPiAgICAgICAqIHRoZSBmb2xs
b3dpbmcgcmFjZSAoaWYgY2xvc2UgYmVmb3JlIHVubGluayk6Cj4gQEAgLTQ5MCw2ICs0OTUsMzMg
QEAgdm9pZCBsaWJ4bF9fdW5sb2NrX2RvbWFpbl91c2VyZGF0YShsaWJ4bF9fZG9tYWluX3VzZXJk
YXRhX2xvY2sgKmxvY2spCj4gICAgICBpZiAobG9jay0+cGF0aCkgdW5saW5rKGxvY2stPnBhdGgp
Owo+ICAgICAgaWYgKGxvY2stPmNhcmVmZCkgbGlieGxfX2NhcmVmZF9jbG9zZShsb2NrLT5jYXJl
ZmQpOwoKQW5kIHRoaXMgbGVhdmVzIGxvY2stPnBhdGggYW5kIGxvY2stPmNhcmVmZCBjb250YWlu
aW5nIGludmFsaWQKdmFsdWVzLiAgSGF6YXJkb3VzIQoKSG93IGFib3V0IHVzaW5nIGZvcm1hbCBz
dGF0ZSBhbm5vdGF0aW9ucyA/CgooSSB0aGluaywgaGF2aW5nIGxvb2tlZCBhdCB0aGUgb25lIGNh
bGwgc2l0ZSwgdGhhdCB3aXRoIHRoZSBjdXJyZW50CmNhbGxlcnMgYWxsIGZvbGxvdyB0aGUgdW53
cml0dGVuIHJ1bGVzLikKCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
