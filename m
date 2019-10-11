Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1BD44D1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIxGV-0007tl-0v; Fri, 11 Oct 2019 15:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIxGT-0007tg-2V
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:55:37 +0000
X-Inumbo-ID: 90217ad0-ec3f-11e9-a531-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90217ad0-ec3f-11e9-a531-bc764e2007e4;
 Fri, 11 Oct 2019 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570809336;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=XgDTSAeGL9oebIdE3Cz8H5SnJvHWq6n3mbDTDwV9gaQ=;
 b=JBCER55ZCvv9MMZtEAXbdEU51hy3IcxchtqmWxMAaBnmf/4X30RAIank
 VOydX9qwyjHfRwP84zBBFuZbJof4OuRRrj2360XReBemvOxNZBkOobWy/
 UbrKmz74dZJjuDzhXZRETooa0SS/99m1bNwl6tOGNlmIi7AnaG23Szm4C 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4raULhrJIghXUYPU0ADMM+rGaWBcRdbUAauC0rTGVv4oBqpdZyJFYh8F5eJCC+JP2gqt9HT7Rl
 5PPGpIGkHFQizoeW5Zl2B/72he/i2dpx+PUn5rAftDkpB8MEj3A64y2D3I0DPYBYpBwO00goNX
 LtiDTo0AfKi3ne8aPyBE0EmQI9/Y7beoO6U7n3kQwooFln2N+yUoYbaw0wDLMb1LyAo5Pzds37
 wfZdXEisnWc3fhRrz+sdaICvR2cCEnHc/7kjKqvBlANc+Z9VPugQMybFWyWyNMZ04iJU2MXA3D
 mao=
X-SBRS: 2.7
X-MesageID: 7046128
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7046128"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.42484.127483.711098@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 16:55:32 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20191011153214.GL1389@Air-de-Roger.citrite.net>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-3-al1img@gmail.com>
 <23968.39583.655591.751635@mariner.uk.xensource.com>
 <20191011153214.GL1389@Air-de-Roger.citrite.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 2/2] libxl: add removing XS backend path
 for PV devices on domain destroy
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
 Oleksandr Grytsov <al1img@gmail.com>, Oleksandr
 Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjEgMi8yXSBsaWJ4bDogYWRkIHJl
bW92aW5nIFhTIGJhY2tlbmQgcGF0aCBmb3IgUFYgZGV2aWNlcyBvbiBkb21haW4gZGVzdHJveSIp
Ogo+IFdoZW4gdGhpcyBjb2RlIHdhcyBhZGRlZCAoZGV2ZCkgdGhvc2Ugd2hlcmUgdGhlIG9ubHkg
YmFja2VuZHMgaGFuZGxlZAo+IGJ5IGxpYnhsLiBWRElTUEwsIFZTTkQsIFZJTlBVVCBkaWRuJ3Qg
ZXhpc3QgYXQgdGhhdCBwb2ludCwgc28gSSB0aGluawo+IHRoZSBpc3N1ZSBpcyB0aGF0IHdoZW4g
c3VwcG9ydCBmb3IgdGhvc2Ugd2FzIGFkZGVkLCBpdCB3YXNuJ3QgcHJvcGVybHkKPiB3aXJlZCBp
bnRvIGRldmQuCj4gCj4gPiBJIHRoaW5rOgo+ID4gCj4gPiA+ICAgICAgc3dpdGNoKGRkZXYtPmRl
di0+YmFja2VuZF9raW5kKSB7Cj4gPiA+ICsgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVkRJ
U1BMOgo+ID4gPiArICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZTTkQ6Cj4gPiA+ICsgICAg
Y2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVklOUFVUOgo+ID4gPiAgICAgIGNhc2UgTElCWExfX0RF
VklDRV9LSU5EX1ZCRDoKPiA+ID4gICAgICBjYXNlIExJQlhMX19ERVZJQ0VfS0lORF9WSUY6Cj4g
PiAKPiA+IElmIHdlIGRvIHdhbnQgdGhpcyB0byBoYW5kbGUgKmFsbCoga2luZHMgb2YgZGV2aWNl
LCBtYXliZSBpdCBzaG91bGQKPiA+IGhhdmUgYSBmYWxsYmFjayB0aGF0IGFib3J0cywgb3Igc29t
ZXRoaW5nID8gIChJIGRvbid0IHRoaW5rIGl0IGlzCj4gPiBlYXN5IHRvIG1ha2UgaXQgYSBjb21w
aWxlIGVycm9yIHRvIGZvcmdldCB0byBhZGQgYW4gZW50cnkgaGVyZSBidXQgaWYKPiA+IHdlIGNv
dWxkIGRvIHRoYXQgaXQgd291bGQgcHJvYmFibHkgYmUgYmVzdC4pCj4gCj4gTWF5YmUgd2UgY291
bGQgaGF2ZSBzb21lIGdlbmVyaWMgaGFuZGxpbmcgZm9yIGV2ZXJ5dGhpbmcgIT0gcWRpc2s/CgpT
byBtYWtlIHRoYXQgdGhlICJkZWZhdWx0OiIgPyAgVGhhdCB3b3VsZCBiZSBmaW5lIGJ5IG1lLgoK
PiBJSVJDIHFkaXNrIG5lZWRzIHNwZWNpYWwgaGFuZGxpbmcgc28gdGhhdCBkZXZkIGNhbiBsYXVu
Y2ggYW5kIGRlc3Ryb3kKPiBhIFFFTVUgaW5zdGFuY2Ugd2hlbiByZXF1aXJlZCwgYnV0IG90aGVy
IGJhY2tlbmRzIHRoYXQgcnVuIGluIHRoZQo+IGtlcm5lbCBkb24ndCBuZWVkIHN1Y2ggaGFuZGxp
bmcgYW5kIGNvdWxkIG1heWJlIHNoYXJlIHRoZSBzYW1lIGdlbmVyaWMKPiBjb2RlIHBhdGguCgpS
aWdodC4KCj4gPiBBbGwgb2YgdGhhdCBhc3N1bWluZyB0aGF0IHRoZSBiYXNpYyBpZGVhIGlzIHJp
Z2h0LCB3aGljaCBJIHdvdWxkIGxpa2UKPiA+IFJvZ2VyJ3Mgb3BpbmlvbiBhYm91dC4KPiAKPiBM
b29raW5nIGF0IHRoZSBwYXRjaCBpdHNlbGYsIHlvdSBhbHNvIHNlZW0gdG8gYmUgZG9pbmcgc29t
ZSBjaGFuZ2VzCj4gcmVsYXRlZCB0byBudW1fdmJkcyBhbmQgbnVtX3ZpZnMsIGJ1dCB0aG9zZSBh
cmUgbm90IG1lbnRpb25lZCBpbiB0aGUKPiBjb21taXQgbWVzc2FnZSwgaXMgdGhhdCBhIHN0cmF5
IGNoYW5nZT8KCk5vLCBJIGRvbid0IHRoaW5rIHNvLiAgVGhvc2UgdmFyaWFibGVzIGp1c3QgdGVs
bCB1cyB3aGVuIHRoZSB0aGluZyBpcwp0b3JuIGRvd24gYnV0IE9sZWtzYW5kcidzIGNvZGUgaXMg
YWJsZSB0byB1c2UgdGhlIGRldmljZXMgc2xpc3QgaXRzZWxmCmZvciB0aGF0LiAgUGxlYXNlIGRv
IGNoZWNrIHRvIHNlZSBpZiB5b3UgYWdyZWUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
