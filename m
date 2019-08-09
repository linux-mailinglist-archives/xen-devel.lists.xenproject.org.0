Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0B87899
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 13:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw33i-0006AR-I8; Fri, 09 Aug 2019 11:27:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iEig=WF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hw33g-0006AI-NM
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 11:27:44 +0000
X-Inumbo-ID: b3b6764f-ba98-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3b6764f-ba98-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 11:27:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xmYxCP8AFr/3Kmcu4c+liyR3uQCeuuNjgUSZMavau5sSD9csX2UBshL0EyS9DheJJp4hmZ4k2n
 4sxy0SRy9NBFq+GhAjgulxMe00HddU5vlpM8h+Nz3F4Zq2oS8kjo6zWygpyn3smmFCYUiMBRwQ
 O4sQfYppKw+dfPu2YIrPQ9T9ZTaXwCnjPOBzBEoByUdm1w+356urI5qlGuEl5rPpgCC52X7fgK
 JURyhV9sBSVhLfpXqK+X/Vt9fOUQIgGYzEubrLMGF8nw3WQpcEqVRKId9RDqgsvvwK2dZAm2yo
 6Ks=
X-SBRS: 2.7
X-MesageID: 4116399
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4116399"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23885.22669.521340.375590@mariner.uk.xensource.com>
Date: Fri, 9 Aug 2019 12:27:09 +0100
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <44b25042bb3d7fefe67ae68a9212d8384778ec42.camel@infradead.org>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <5aa0116479240e5c2751fbaa745a6071a98f9480.camel@infradead.org>
 <23882.61481.990906.474113@mariner.uk.xensource.com>
 <44b25042bb3d7fefe67ae68a9212d8384778ec42.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] tools/xenstore: Do not abort xenstore-ls
 if a node disappears while iterating
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGF2aWQgV29vZGhvdXNlIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjJdIHRvb2xzL3hlbnN0b3JlOiBE
byBub3QgYWJvcnQgeGVuc3RvcmUtbHMgaWYgYSBub2RlIGRpc2FwcGVhcnMgd2hpbGUgaXRlcmF0
aW5nIik6Cj4gT24gV2VkLCAyMDE5LTA4LTA3IGF0IDE2OjM3ICswMTAwLCBJYW4gSmFja3NvbiB3
cm90ZToKPiA+IFNvIHdpdGggYSBwZXJtaXNzaW9ucyBlcnJvciBzaWxlbnRseSBpZ25vcmVkLCB4
ZW5zdG9yZS1scyBtaWdodAo+ID4gc2lsZW50bHkgcHJvZHVjZSBwYXJ0aWFsIG91dHB1dC4KPiAK
PiBFdmVuIHdpdGhvdXQgdGhlIHJhY2UgY29uZGl0aW9uLCB3ZSBnZXQgcGFydGlhbCBvdXRwdXQu
IEluIHRoaXMgdGVzdAo+IGNhc2UsIG9ic2VydmUgdGhhdCBub2RlIGZvdXIgaXMgYWJzZW50IGZy
b20gd2hhdCBkb20yIHJlcG9ydHMsIGFuZCB3ZQo+IGdldCAqdHdvKiBlcnJvciBtZXNzYWdlcyBh
Ym91dCBub2RlIHRocmVlLgoKU29ycnksIHBlcmhhcHMgSSB3YXNuJ3QgY2xlYXIgZW5vdWdoLiAg
SSBhbSBwYXJ0aWN1bGFybHkgY29uY2VybmVkCmFib3V0IHRoZSByZWxhdGlvbnNoaXAgYmV0d2Vl
biBwb3NzaWJsZSBwYXJ0aWFsIG91dHB1dCwgYW5kIHRoZSBleGl0CnN0YXR1cy4KCj4gKGRvbTIp
ICMgeGVuc3RvcmUtbHMgLXAgL2xvY2FsL2RvbWFpbi8yL2Zvbwo+IG9uZSA9ICJvbmUiICAuIC4g
LiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAgKG4wLHIyKQo+IHR3
byA9ICJ0d28iICAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4gLiAuIC4g
LiAgKG4wLHIyKQo+IHRocmVlOgo+IHhlbnN0b3JlLWxzOiAKPiBjb3VsZCBub3QgYWNjZXNzIHBl
cm1pc3Npb25zIGZvciB0aHJlZTogUGVybWlzc2lvbiBkZW5pZWQKPiAKPiB4ZW5zdG9yZS1sczog
eHNfZGlyZWN0b3J5ICgvbG9jYWwvZG9tYWluLzIvZm9vL3RocmVlKTogUGVybWlzc2lvbiBkZW5p
ZWQKCkknbSBwcmV0dHkgc3VyZSB0aGF0IGhlcmUgeGVuc3RvcmUtbHMgZXhpdGVkIG5vbnplcm8u
Cgo+IFRoZSB0b29sIGFjdHVhbGx5IG1ha2VzIHRocmVlIGNhbGxzIGZvciBlYWNoIG5vZGUgaXQg
dG91Y2hlcy4gSWYgdGhlCj4geHNfcmVhZCgpIGZhaWxzLCBpdCBzaWxlbnRseSBwcmludHMgIjpc
biIgYW5kIGRvZXNuJ3QgcmVwb3J0IHRoZSBlcnJuby4KClRoYXQncyBmcmVha3kgYnV0IGF0IHRo
ZSB2ZXJ5IGxlYXN0IHdlIHNob3VsZG4ndCBtYWtlIGl0IHdvcnNlLgoKPiBJZiB0aGUgKG9wdGlv
bmFsKSB4c19nZXRfcGVybWlzc2lvbnMoKSBmYWlscywgaXQgKndhcm5zKiBidXQgY29udGludWVz
LAo+IGF0dGVtcHRpbmcgdG8gcmVjdXJzZSBpbnRvIHRoZSBub2RlIGluIHF1ZXN0aW9uLgoKUHJl
c3VtYWJseSBpdCBmYWlscyB0byBwcmludCBwZXJtaXNzaW9ucyBpbmZvcm1hdGlvbiwgdG9vLiAg
U28gc29tZQp0b29sIHdoaWNoIGlzICgxKSBjaGVja2luZyB0aGUgZXhpdCBzdGF0dXMgYW5kICgy
KSB1c2luZyB0aGUgb3V0cHV0CndpbGwgbm90IGJlIG1pc2xlZC4KCkkgdGhpbmsgaW4gYm90aCBv
ZiB0aGVzZSBjYXNlcyBpdCBleGl0cyB6ZXJvIChhc3N1bWluZyBub3RoaW5nIGVsc2UKZ29lcyB3
cm9uZykuCgo+IElmIHRoZSB4c19kaXJlY3RvcnkoKSBmYWlscywgaXQgYWJvcnRzIGFuZCBkb2Vz
bid0IGV2ZW4gY29udGludWUuCgpJbiB0aGlzIHNpdHVhdGlvbiBpdCBleGl0cyBub256ZXJvLiAg
UGFydGlhbCBvdXRwdXQgd2l0aCBhIG5vbnplcm8KZXhpdCBzdGF0dXMgaXMgbm90IGlkZWFsLCBi
dXQgaXQgaXMgbm90IGluY29ycmVjdC4gIE9taXR0ZWQgb3V0cHV0LAp3aXRoIGEgemVybyBleGl0
IHN0YXR1cywgaXMgYSBwb3RlbnRpYWwgZGF0YSBsb3NzIGJ1ZyBhbmQgbXVzdCBiZQphdm9pZGVk
LgoKKEFuZCBJIHRoaW5rIHRoaXMgaXMgdHJ1ZSBldmVuIGlmIHRoZXJlIGlzIGEgbWVzc2FnZSB0
byBzdGRlcnIuKQoKPiBXZWxsLi4uIGhlcmUncyBhbiBpbmNyZW1lbnRhbCBzdHJhdyBtYW4gcGF0
Y2ggYmFzZWQgb24gdGhlIGV4aXN0aW5nIHYyLAo+IHdoaWNoIHdpbGwgcHJpbnQgYW4gZXJyb3Ig
Zm9yIHRoZSAqZmlyc3QqIG9wZXJhdGlvbiB0aGF0IGZhaWxzLCBhbmQKPiBzaG91bGQgY29wZSB3
aXRoIHJhY2UgY29uZGl0aW9ucyB0b28uCgpDYW4geW91IGV4cGxhaW4gdG8gbWUgd2hhdCB5b3Vy
IG5lZWRzIGFyZSBmb3IgYWxsIHRoaXMgPyAgSSB3YW50CnhlbnN0b3JlLWxzIHRvIGJlIGFibGUg
dG8gZG8gd2hhdCB5b3Ugd2FudCwgYnV0IEkgZG9uJ3Qgd2FudCB0byBpbXBvc2UKYSBsb3Qgb2Yg
d29yayBvbiB5b3UuICBJIGFsc28gd2FudCB0aGUgY29ycmVjdG5lc3MgcHJvcGVydHkgSSBtZW50
aW9uCmFib3ZlLgoKTXkgdmlldyBvZiB0aGUgaWRlYWwgc2l0dWF0aW9uIHdvdWxkIGJlIGZvciB4
ZW5zdG9yZS1scyB0byBoYXZlCmRlZmluZWQgZXhpdCBzdGF0dXMgdmFsdWVzLCBsaWtlCgogIDAg
ICAgZXZlcnl0aGluZyB3ZW50IHdlbGwKICAxICAgIG5vdCB1c2VkLCByZXNlcnZlZCBiZWNhdXNl
IHNvbWUgcnVudGltZXMgZXRjLiBpbnZlbnQgMQogIDIgICAgcGVybWlzc2lvbnMgb2YgYXQgbGVh
c3Qgb25lIG5vZGUgY291bGQgbm90IGJlIHByaW50ZWQKICAzICAgIHZhbHVlIG9mIGF0IGxlYXN0
IG9uZSBub2RlIGNvdWxkIG5vdCBiZSBwcmludGVkCiAgNCAgICBjaGlsZHJlbiBvZiBhdCBsZWFz
dCBvbmUgbm9kZSBjb3VsZCBub3QgYmUgbGlzdGVkLAogICAgICAgIG5vZGVzIG1heSBiZSBtaXNz
aW5nCiAxMjcgICBjYXRhc3Ryb3BoZSwgYWxsIGJldHMgYXJlIG9mZgoKQW5kIG1heWJlIHNvbWUg
Y29tbWFuZCBsaW5lIG9wdGlvbnMgdG8gY29udHJvbCB3aGljaCBvZiB0aGVzZQpjb25kaXRpb25z
IHByaW50IGEgbWVzc2FnZSB0byBzdGRlcnIsIGFuZC9vciB0byB0dXJuIHNvbWUgb2YgdGhlbSBp
bnRvCjAgZm9yIHRoZSBjYWxsZXIncyBjb252ZW5pZW5jZS4KCkJ1dCB0aGlzIHdvdWxkIGludm9s
dmUgeGVuc3RvcmUtbHMgaGF2aW5nIGEgZ2xvYmFsIHZhcmlhYmxlIHdoZXJlIGl0CmFjY3VtdWxh
dGVzIHRoZSBlcnJvciBzdGF0dXMsIGFuZCBnb2luZyB0aHJvdWdoIHRoZSB3aG9sZSBwcm9ncmFt
IGFuZApmaXhpbmcgdGhlIGVycm9yIGhhbmRsaW5nICh3aGljaCBjdXJyZW50bHkgc2VlbXMgbm90
IHZlcnkgZ29vZCB0byBtZSkuCgpJZiB5b3Ugd2FudCB0byBkbyB0aGF0LCB0aGVuIGdyZWF0LCBs
ZXQgdXMgdGFsayBhYm91dCB0aGUgZGV0YWlscy4KCklmIHRoYXQncyB0b28gbXVjaCB3b3JrIHRo
ZW4gbWF5YmUgeW91IGNhbiBkbyBzb21ldGhpbmcgbm93IHdoaWNoIGF0CmxlYXN0IGdvZXMgaW4g
dGhlIHJpZ2h0IGRpcmVjdGlvbi4KCkRvZXMgdGhhdCBtYWtlIHNlbnNlID8KClRoYW5rcywKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
