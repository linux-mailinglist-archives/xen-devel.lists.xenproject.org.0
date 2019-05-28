Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3F2C3F5
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:09:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVYzH-0001vI-KT; Tue, 28 May 2019 10:05:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2UAK=T4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVYzF-0001vD-C6
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:05:41 +0000
X-Inumbo-ID: 256336f0-8130-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 256336f0-8130-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:05:39 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: E86VKVoS7uk8YE3Af8sPw279fIHN1G4PyLP67Wh8AWAjxHJfntUF38BCuEEOCkAA6/HYZL7OU1
 aEHSt40HnrY+nm5QNBxPBwkBnAaRJALcdwWTQiTbKA/feZywDb0UPO27F0EfWFpJl+kdh6w93D
 B+iniasD/1JxrecB2A6QN4Su6qYPiuiKXz+zQ7GCiiBdV1k+7KWUd3ei4GODwCGd1hz/XYQqUI
 UkviSzeqg+1cDbH9lDSbGNUgRhjt+RLqszlmtX0aIXyejj3hIZSsWwNU4WQcj03xZibPwD6owh
 ceA=
X-SBRS: 2.7
X-MesageID: 973064
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,521,1549947600"; 
   d="scan'208";a="973064"
Date: Tue, 28 May 2019 12:05:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190528100529.apc7rlpdzvgr3vzf@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
 <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
 <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/5] pci: switch pci_conf_{read/write} to
 use pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDI6NTE6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA1LjE5IGF0IDE4OjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MDE6MjNBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPj4g
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiA+PiA+IEBAIC01OCw2ICs1OCwxMSBAQCB0
eXBlZGVmIHVuaW9uIHsKPiA+PiA+ICAgICAgfTsKPiA+PiA+ICB9IHBjaV9zYmRmX3Q7Cj4gPj4g
PiAgCj4gPj4gPiArI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIsIGQsIGYpIFwKPiA+PiA+ICsgICAg
KChwY2lfc2JkZl90KSB7IC5zZWcgPSAocyksIC5idXMgPSAoYiksIC5kZXYgPSAoZCksIC5mdW5j
ID0gKGYpIH0pCj4gPj4gCj4gPj4gSSdkIHByZWZlciBpZiB0aGUgX1Qgc3VmZml4IGNvdWxkIGJl
IG9taXR0ZWQuIEFmYWljcyB0aGVyZSdzIG5vIHVzZSBvZiB0aGUKPiA+PiBleGlzdGluZyBQQ0lf
U0JERigpIGFueXdoZXJlIGluIHRoZSB0cmVlLCBzbyB0aGlzIHNob3VsZCBiZSBmaW5lLiBGb3IK
PiA+PiB0aGUgMm5kIG1hY3JvIGJlbG93IEkgY2FuJ3QgZWFzaWx5IHRlbGwgd2hldGhlciB0aGUg
ZmV3IGV4aXN0aW5nIHVzZWQKPiA+PiBoYXZlIGFsbCBkaXNhcHBlYXJlZCBieSBub3csIGJ1dCBp
dCBzZWVtcyBsaWtlbHkuCj4gPiAKPiA+IEkgY2FuIHNlZSBhYm91dCBkcm9wcGluZyB0aGUgX1Qg
c3VmZml4LCBidXQgSSB0aGluayB0aGVyZSdzIGxpa2VseQo+ID4gc29tZSBvdmVybGFwIGJldHdl
ZW4gdGhlIGludHJvZHVjdGlvbiBvZiBQQ0lfU0JERl9UIGFuZCB0aGUgbGFzdCB1c2VyCj4gPiBv
ZiB0aGUgY3VycmVudCBQQ0lfU0JERiBoZWxwZXJzLCBzbyBtYXliZSBpdCdzIGZpbmUgdG8gdXNl
IHRoZSBfVAo+ID4gc3VmZml4IGF0IGZpcnN0IGFuZCBoYXZlIG9uZSBmaW5hbCBwYXRjaCB0aGF0
IHJlbW92ZXMgaXQ/Cj4gCj4gVGhhdCB3b3VsZCBiZSBhbiBvcHRpb24gaWYgaXQgY2FuJ3QgYmUg
ZG9uZSBpbiBvbmUgZ28sIHN1cmUuCj4gCj4gPj4gQWxzbyBJJ20gYWZyYWlkIGluaXRpYWxpemVy
cyBvZiB0aGlzIGtpbmQgd2lsbCBicmVhayB0aGUgYnVpbGQgd2l0aCBvbGQgZ2NjLgo+ID4gCj4g
PiBJIHRob3VnaHQgd2UgZHJvcHBlZCBzdXBwb3J0IGZvciBzdWNoIG9sZCB2ZXJzaW9ucyBvZiBn
Y2MsIGlzIHRoYXQgbm90Cj4gPiB0aGUgY2FzZT8KPiAKPiBObyB5ZXQsIGFzIHBlciAuL1JFQURN
RS4KClJpZ2h0LCBzbyB0aGVuIEkgZ3Vlc3MgdGhlIG9ubHkgc29sdXRpb24gd291bGQgYmUgdG8g
dXNlIHNvbWV0aGluZwpsaWtlOgoKI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIsIGQsIGYpIFwKICAg
ICgocGNpX3NiZGZfdCkgeyAuc2JkZiA9IFBDSV9TQkRGKHMsYixkLGYpIH0pCgpBbmQgc2ltaWxh
cmx5IGZvciB0aGUgb3RoZXIgaW5pdGlhbGl6ZXJzLiBJIGd1ZXNzIHRoZW4geW91IHdvdWxkIGJl
CmZpbmUgd2l0aCB1c2luZyB0aGUgX1Qgc3VmZml4IGZvciB0aG9zZSBoZWxwZXJzIGFuZCBrZWVw
aW5nIHRoZQpjdXJyZW50IG9uZXMgYXMtaXM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
