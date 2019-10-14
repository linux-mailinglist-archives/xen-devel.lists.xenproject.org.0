Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3149D62EE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 14:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJzjX-0007hW-4O; Mon, 14 Oct 2019 12:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iJzjV-0007hR-Gv
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 12:45:53 +0000
X-Inumbo-ID: 8daef4b0-ee80-11e9-bbab-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8daef4b0-ee80-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571057153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aJ3UhVPVUTnTYVUetalYqX/ROe+PbkBYsZNLBWfnZes=;
 b=iAS3g1+YmojJWcrQITuqhSlEgYx6Yvl4l2WNgLJJpCEqoVj6pG/PCCdb
 arBPrt9B/onfckLYax7Z8qwLW7xhaFQVxZ1yQ3sHBUcRiUuOgqa3inw1Y
 Rj65+X7CnTrLNJQ11qOwBTB7yFW2ogbgpBKz675UFMKjkC4h7nU/LLDXL U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 63i2XW3u3PqL9oLuQWvh+hjhX5u+sHmwv1eRPjkGkoMdIiZKfFiGATiyJEr+HuN4lggu51TKit
 tzFpJE4YzglXQ1rZmc1frMJQs7S6FlgobZ08pVg+UXAlEh0k9TiULs8Rv0cOdzd8+vonaXafsz
 7Y343bqfK0LQ6G7+Agzxw2Fy6JmBL7fo8e350LTqMj5EDXRgFBAddzJYkiWijNEDObD2bh54EG
 KUFzFM9M8i8oQ0t1BgEYDhOegtr6ZXEZbmR0F8wsS1yDwn75o4tnalSngojfm/Rl3OIQJ6Si+E
 nD8=
X-SBRS: 2.7
X-MesageID: 6924615
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,295,1566878400"; 
   d="scan'208";a="6924615"
Date: Mon, 14 Oct 2019 13:45:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191014124548.GA5743@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011165549.21639-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 05/10] libxl: Move
 shadow_memkb and iommu_memkb defaulting into libxl
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTU6NDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGVmYXVsdGluZyBpcyBzdXBwb3NlZCB0byBiZSBkb25lIGJ5IGxpYnhsLiAgU28gdGhl
c2UgY2FsY3VsYXRpb25zCj4gc2hvdWxkIGJlIGhlcmUgaW4gbGlieGwuICBsaWJ4bF9fZG9tYWlu
X2NvbmZpZ19zZXRkZWZhdWx0IGhhcyBhbGwgdGhlCj4gbmVjZXNzYXJ5IGluZm9ybWF0aW9uIGlu
Y2x1ZGluZyB0aGUgdmFsdWVzIG9mIG1heF9tZW1rYiBhbmQgbWF4X3ZjcHVzLgo+IAo+IFRoZSBv
dmVyYWxsIGZ1bmN0aW9uYWwgZWZmZWN0IGRlcGVuZHMgb24gdGhlIGNhbGxlcjoKPiAKPiBGb3Ig
eGwsIG5vIGNoYW5nZS4gIFRoZSBjb2RlIG1vdmVzIGZyb20geGwgdG8gbGlieGwuCj4gCj4gRm9y
IGNhbGxlcnMgd2hvIHNldCBvbmUgb3IgYm90aCBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21lbWti
ICh3aGV0aGVyCj4gZnJvbSBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBvciBvdGhl
cndpc2UpIGJlZm9yZSBjYWxsaW5nCj4gbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IChhbnkgdmVy
c2lvbik6IHRoZSBuZXcgY29kZSB3aWxsIGxlYXZlIHRoZWlyCj4gc2V0dGluZyhzKSB1bmNoYW5n
ZWQuCj4gCj4gRm9yIGNhbGxlcnMgd2hvIGRvIG5vdCBjYWxsIGxpYnhsX2RvbWFpbl9uZWVkX21l
bW9yeSBhdCBhbGwsIGFuZCB3aG8KPiBmYWlsIHRvIHNldCBvbmUgb2YgdGhlc2UgbWVtb3J5IHZh
bHVlczogbm93IHRoZXkgYXJlIGJvdGggYXJlIHByb3Blcmx5Cj4gc2V0LiAgVGhlIHNoYWRvdyBh
bmQgaW9tbXUgbWVtb3J5IHRvIGJlIHByb3Blcmx5IGFjY291bnRlZCBmb3IgYXMKPiBpbnRlbmRl
ZC4KPiAKPiBGb3IgY2FsbGVycyB3aGljaCBjYWxsIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSBh
bmQgcmVxdWVzdCB0aGUKPiBjdXJyZW50IEFQSSAoNC4xMykgb3Igd2hpY2ggdHJhY2sgbGlieGws
IHRoZSBkZWZhdWx0IHZhbHVlcyBhcmUgYWxzbwo+IG5vdyByaWdodCBhbmQgZXZlcnl0aGluZyB3
b3JrcyBhcyBpbnRlbmRlZC4KPiAKPiBGb3IgY2FsbGVycyB3aGljaCBjYWxsIGxpYnhsX2RvbWFp
bl9uZWVkX21lbW9yeSwgYW5kIHJlcXVlc3QgYW4gb2xkCj4gcHJlLTQuMTMgbGlieGwgQVBJLCBh
bmQgd2hpY2ggbGVhdmUgb25lIG9mIHRoZXNlIG1lbWtiIHNldHRpbmdzIHVuc2V0LAo+IHdlIHRh
a2Ugc3BlY2lhbCBtZWFzdXJlcyB0byBwcmVzZXJ2ZSB0aGUgb2xkIGJlaGF2aW91ci4KPiAKPiBU
aGlzIG1lYW5zIHRoYXQgdGhleSBkb24ndCBnZXQgdGhlIGFkZGl0aW9uYWwgaW9tbXUgbWVtb3J5
IGFuZCBhcmUgYXQKPiByaXNrIG9mIHRoZSBkb21haW4gcnVubmluZyBvdXQgb2YgbWVtb3J5IGFz
IGEgcmVzdWx0IG9mIGY4OWY1NTU4MjdhNgo+ICJyZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25z
dHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMiLiAgQnV0IHRoaXMKPiBpcyBubyB3b3JzZSB0
aGFuIHRoZSBzdGF0ZSBqdXN0IGFmdGVyIGY4OWY1NTU4MjdhNiwgd2hpY2ggYWxyZWFkeQo+IGJy
b2tlIHN1Y2ggY2FsbGVycyBpbiB0aGF0IHdheS4gIFRoaXMgaXMgcGVyaGFwcyBqdXN0aWZpYWJs
ZSBiZWNhdXNlCj4gb2YgdGhlIEFQSSBzdGFiaWxpdHkgd2FybmluZyBuZXh0IHRvIGxpYnhsX2Rv
bWFpbl9uZWVkX21lbW9yeS4KPiAKPiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBkcm9wIHRo
ZSBzcGVjaWFsLWNhc2luZyBvZiB0aGVzZSBjYWxsZXJzLgo+IFRoYXQgd291bGQgY2F1c2UgYSBk
aXNjcmVwYW5jeSBiZXR3ZWVuIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSBhbmQKPiBsaWJ4bF9k
b21haW5fY3JlYXRlOiB0aGUgZm9ybWVyIHdvdWxkIG5vdCBpbmNsdWRlIHRoZSBpb21tdSBtZW1v
cnkgYW5kCj4gdGhlIGxhdHRlciB3b3VsZC4gIFRoYXQgc2VlbXMgd29yc2UsIGJ1dCBpdCdzIGRl
YmF0ZWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6IFJlcGxhY2UgX0Jvb2wgd2l0aCBib29sCj4gICAgIEZp
eCBsb2dpYyBzZW5zZSBpbiBva190b19kZWZhdWx0X21lbWtiX2luX2NyZWF0ZQoKUmV2aWV3ZWQt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
