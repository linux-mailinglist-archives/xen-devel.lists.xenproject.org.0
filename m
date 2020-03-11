Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD5181FBA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:42:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC5Ju-0004aN-6p; Wed, 11 Mar 2020 17:39:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC5Js-0004aI-BD
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:39:00 +0000
X-Inumbo-ID: 3065752c-63bf-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3065752c-63bf-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583948340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/gfVNm/dGM5NqnLCGHiOMi9IcsN5AMJLtli4TN+1zFc=;
 b=CP+wHKngtT0t3KEC/QXMYaspj2rm2AYHw39Nn3ay6DoilTDNul0x2rEG
 t94z/ylLSC1t8ketJs9uEBAdj2KelN2WZ7AD4obdnH6raubY0Bx5FA/Ay
 LX2z6cuorxqD7QfzZ6WpE/zGnO3YkjKoF5gUDggjq6vqPC+j/kmjPttZn I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aHxOljKhE8nOdw23L5CJMy3UiHt/Q1LMa4EDj2w3bvD9ndOcnM4RgltZpr5PjspGM9BZ9Eb+9+
 PvZiORsW0drkozGRTkLSpBTpZYlmrvA/78lnlL5UmzyXhT9JyqeJ1+d/qFZ8hMtdK7oxnmwy7y
 fVBtHo79rNVdbHtFNMoSh+KhcrvPu4q+JVL590hvqW1Z92v3hB4bSTYsMI3ls+nBnRAh2/5dcr
 S/E2WQIe9Lvy7Ua/R1kHm/zAKDDGAHlsYQIhrT7KZWoj6OtPJIdZTxVrhAlfddFMC0x5Famo/E
 cGk=
X-SBRS: 2.7
X-MesageID: 13795429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13795429"
Date: Wed, 11 Mar 2020 17:38:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200311173854.GK2152@perard.uk.xensource.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <7720f54e-7ef7-9dae-dfdb-38b89a0892a6@xen.org>
 <20200311152613.GJ2152@perard.uk.xensource.com>
 <a3bf47e1-2abb-f663-8f38-70c70d9c6114@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3bf47e1-2abb-f663-8f38-70c70d9c6114@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDU6MjE6MjRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDExLzAzLzIwMjAgMTU6MjYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gT24g
V2VkLCBNYXIgMTEsIDIwMjAgYXQgMDI6MTg6MjBQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+ID4gPiA+ICtjb25maWcgRUFSTFlfVUFSVF9CQVNFX0FERFJFU1MKPiA+ID4gPiArCWRlcGVu
ZHMgb24gRUFSTFlfUFJJTlRLCj4gPiA+ID4gKwloZXggIkVhcmx5IHByaW50aywgcGh5c2ljYWwg
YmFzZSBhZGRyZXNzIG9mIGRlYnVnIFVBUlQiCj4gPiA+ID4gKwlkZWZhdWx0IDB4ODdlMDI0MDAw
MDAwIGlmIEVBUkxZX1BSSU5US19USFVOREVSWAo+ID4gPiAKPiA+ID4gWW91IGFyZSBhbGxvd2lu
ZyBFQVJMWV9QUklOVEtfVEhVTkRFUlggdG8gYmUgc2VsZWN0ZWQgb24gQXJtMzIgcGxhdGZvcm0g
YnV0Cj4gPiA+IHRoZSBhZGRyZXNzIGlzIGFib3ZlIDRHLiBJIHN1c3BlY3QgdGhpcyB3b3VsZCBi
cmVhayByYW5kY29uZmlnIGJ1aWxkLgo+ID4gCj4gPiBnY2MgZG9lc24ndCBzZWVtcyB0byBjb21w
bGFpbiA6LSkuCj4gCj4gSSB3YXMgZXhwZWN0aW5nIEdBUyB0byB0aHJvdyBhbiBlcnJvciBiZWNh
dXNlIHRoZSA2NC1iaXQgdmFsdWUgZG9lcyBub3QgZml0Cj4gaW4gYSAzMi1iaXQgcmVnaXN0ZXIu
IEJ1dC4uLiBpdCBsb29rcyBsaWtlIEdBUyB3aWxsIHNpbGVudGx5IHRydW5jYXRlIHRoZQo+IHZh
bHVlIHRvIDB4MjQwMDAwMDAgOiguCj4gCQo+ID4gKEkgbWVhbiAiYXJtLW5vbmUtZWFiaS1nY2Mg
KEFyY2ggUmVwb3NpdG9yeSkgOS4yLjAiKQo+ID4gCj4gPiBCdXQgSSBjYW4gaGF2ZSB0aHVuZGVy
eCBkZXBlbmRzIG9uIGFybV82NC4KPiBJcyB0aGVyZSBhIHdheSB0byBjb25zdHJhaW5zdCB0aGUg
YWRkcmVzcyBpbiBLY29uZmlnPwoKVGhlcmUgaXMhIEkgY2FuIGFkZCAicmFuZ2UgMHgwIDB4ZmZm
ZmZmZmYgaWYgQVJNXzMyIi4KQnV0IEtjb25maWcgZG9lc24ndCBzYXkgYW55dGhpbmcgaWYgYSBk
ZWZhdWx0IHZhbHVlIGlzIHRvbyBoaWdoLCBhbmQKc2lsZW50bHkgc2V0IHRoZSB2YWx1ZSB0byB0
aGUgbWF4aW11bS4KU3RpbGwsIGl0J3MgYmV0dGVyLiBJIGp1c3QgbmVlZCB0byBhZGQgZGVwZW5k
cyBvbiBBUk1fNjQgZm9yIHRodW5kZXJ4LAphbmQgdGhhdCBzaG91bGQgYmUgZmluZS4KQW5kIHRo
YXQgcHJldmVudCB1c2VycyBmcm9tIHNldHRpbmcgYSB0b28gaGlnaHQgdmFsdWUsIGFzIGtjb25m
aWcgd2lsbApub3QgYWNjZXB0IGEgdmFsdWUgb3V0c2lkZSB0aGUgcmFuZ2UuCgpUaGFua3MsCgot
LSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
