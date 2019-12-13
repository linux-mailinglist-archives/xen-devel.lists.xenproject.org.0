Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0B11E64F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:20:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmgZ-00016d-Mw; Fri, 13 Dec 2019 15:16:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifmgY-00016Y-Pu
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:16:54 +0000
X-Inumbo-ID: 97d8de3c-1dbb-11ea-8f32-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97d8de3c-1dbb-11ea-8f32-12813bfff9fa;
 Fri, 13 Dec 2019 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576250214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/sJfm+JZ+KLFW0dHcJI2+MeAAgEj9C7AsAtR8mM++pc=;
 b=Jj7AF3yNbQoV/RGq5+oyTX72zf94bTu+0JHrb5/OsVo0eGXnaLPGARiq
 gMIJCFoqaSM0Pao9mgTNAYrGqcXT5edtcUeWf/WkLL3auIt6zL3ZZnwGY
 jup6ibfmnYt3IzrwvQe4O/JZEtLJ6SISorxXvA/b+0PNDCfyiHXx0Vj+/ M=;
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
IronPort-SDR: bzvu39V5OuPxGp8XJQI15ppFx2yVzB8CVQz7TjOsr3SWJdKtLtwr1YID+3AL/8ta6wLVrHtUZ7
 i/+2ZwNiDYLwbn0Jw8yEbn2iw2NEVw8CNXeyeAUuUwlv6/i6KWdHb1/6mfc1mdCrSAR5ewasVy
 86Ee5/pkkoDvhfTQL6PXtBkfDhAb+DhPEgS30nmq+bJj2I1I4YHdhtMfb8ZVgZZoOb6ghAwbGO
 uq+8UtT8LOXl2E5MNRH4Ofce61clLJgOlEyOPJOHmewQT9UjvYGKbtwPfk4CbGyVwZI6YLiwQZ
 Ygg=
X-SBRS: 2.7
X-MesageID: 9654152
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9654152"
Date: Fri, 13 Dec 2019 15:16:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191213151650.GK1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-3-anthony.perard@citrix.com>
 <f0cdbeb2-2e31-7b93-ad5e-c408f8ec5145@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0cdbeb2-2e31-7b93-ad5e-c408f8ec5145@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 2/8] Config.mk: Remove stray comment
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDY6MzI6MjdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMi8yMDE5IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IFRo
aXMgY29tbWVudCBpc24ndCBhYm91dCBDT05GSUdfVEVTVFMsIGJ1dCBhYm91dCBTRUFCSU9TX0RJ
UiB0aGF0IGhhcwo+ID4gYmVlbiByZW1vdmVkLgo+ID4KPiA+IE9yaWdpbmFsbHksIHRoZSBjb21t
ZW50IHdhcyBhZGRlZCBieSA1ZjgyZDA4NThkZTEgKCJ0b29sczogc3VwcG9ydAo+ID4gU2VhQklP
Uy4gVXNlIGJ5IGRlZmF1bHQgd2hlbiB1cHN0cmVhbSBxZW11IGlzIGNvbmZpZ3VyZWQuIiksIHRo
ZW4KPiA+IGxhdGVyIHRoZSBTRUFCSU9TX0RJUiB3YXMgcmVtb3ZlZCBieSAxNGVlM2MwNWYzZWYg
KCJDbG9uZSBhbmQgYnVpbGQKPiA+IFNlYWJpb3MgYnkgZGVmYXVsdCIpIGJ1dCB0aGF0IGNvbW1l
bnQgYWJvdXQgdGhlIHBhaW4gd2FzIGxlZnQgYmVoaW5kLgo+ID4gVGhlIGNvbW1pdCB0aGF0IG1h
ZGUgQ09ORklHX1RFU1RTIHBhaW5mdWwgd2FzIDg1ODk2YTdjNGRjNyAoImJ1aWxkOgo+ID4gYWRk
IGF1dG9jb25mIHRvIHJlcGxhY2UgY3VzdG9tIGNoZWNrcyBpbiB0b29scy9jaGVjayIpLgo+ID4K
PiA+IExldCB0aGUgY29tbWVudCByZXN0LCBldmVudCBpZiBDT05GSUdfVEVTVFM9eSBjYW4gYmUg
cGFpbmZ1bC4gSXQncwo+ID4gZW5hYmxlZCBieSBkZWZhdWx0IGFueXdheSBhbmQgZG9lc24ndCBj
YXVzZSBwYWluIGZvciBtb3N0Cj4gPiBjb25maWd1cmF0aW9uLgo+IAo+IERvIHlvdSBtZWFuICJy
ZXN0LCBldmVuIGlmIj/CoCBFdmVuIGlmIHNvLCBJJ20gYWZyYWlkIEkgc3RpbGwgY2FuJ3QgcGFy
c2UKPiB0aGlzIHBhcmFncmFwaC4KClRoYXQgbGFzdCBwYXJhZ3JhcGggY291bGQgYmUgcmVtb3Zl
IEkgdGhpbmsuIEl0IGlzIG1vc3RseSBwcm9zZSB3aGljaApkb2Vzbid0IGFkZCBtdWNoIGluZm9y
bWF0aW9uLiBTb21lIHBlb3BsZSBtYXkgdW5kZXJzdGFuZCB0aGUgcmVmZXJlbmNlLgoKV2hlbiB3
cml0aW5nIHRoYXQgbGFzdCBwYXJhZ3JhcGgsIEkgaGFkIHRoYXQgaW4gbWluZDoKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTExL21zZzAx
NDEwLmh0bWwKCkkgdGhvdWdoIHRoYXQgd2FzIGFtdXNpbmcsIHRoZSB3YXkgdGhlIGNvbW1lbnQg
d2FzIGxlZnQgYmVoaW5kIGFuZApzdGFydGVkIHRvIGJlIHVuZGVyc3Rvb2QgYXMgYSBjb21tZW50
IGZvciBzb21ldGhpbmcgZWxzZS4KCjotKQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
