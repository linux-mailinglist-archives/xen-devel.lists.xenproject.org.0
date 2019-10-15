Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B023D7383
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 12:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKCs-0006TA-Hu; Tue, 15 Oct 2019 10:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIpv=YI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iKKCr-0006T5-NS
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 10:37:33 +0000
X-Inumbo-ID: caf0438a-ef37-11e9-9391-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caf0438a-ef37-11e9-9391-12813bfff9fa;
 Tue, 15 Oct 2019 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571135853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jiEZ2nUDkYInOaDz0U9pA+I27n4w/GRu992LAN8GgL4=;
 b=F/DNR8VYRleIgcfa4pvvUColae77bmHn+dEPEitlAt8o4U6/Ax5VpFSw
 49Yel8p3KqhUVypAJRqu9RVaaL8eszcPSa1KpwOp0rReMBvUKRjyppHiR
 aKADPVWuiHdQttDIOnOcAokrIZQbN8rEx1hpa+YbtYoF3FqbUwNF2c05c c=;
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
IronPort-SDR: HpiIXsdrpU1xMvNYOxI6Sb2nlEaLgwV/ZWgUQE3gxP0PSIt73EDV3gsQDujVGyiGh9QAJVJJwE
 m+vKzeRl2uj5GP1WbDKD+IqGDUZIJfDjPZbQ0nVHpwpI977GwuArJOmyUy5hEbnybYKha8RCag
 9qzV9HaDi2qkptsWE0MoUSTmiM0EGVhZ0h0kM1a/Tu02RijTe6LQxZrtA4tjeB9J2u6RNffRSU
 7fuM2CeRKV6NDQAmjIf1ikKdt52I6+BlOqz2z0X0uDAmObw9XCeLUOYXpmfXh14Rim7kwJ4kIJ
 Kig=
X-SBRS: 2.7
X-MesageID: 6973335
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,299,1566878400"; 
   d="scan'208";a="6973335"
Date: Tue, 15 Oct 2019 11:37:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191015103729.GD1138@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-2-ian.jackson@eu.citrix.com>
 <20191014165026.GC5743@perard.uk.xensource.com>
 <23972.43431.117479.182683@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23972.43431.117479.182683@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDY6MDA6MjNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0gg
Zm9yLTQuMTMgdjMgMDUvMTBdIGxpYnhsOiBNb3ZlIHNoYWRvd19tZW1rYiBhbmQgaW9tbXVfbWVt
a2IgZGVmYXVsdGluZyBpbnRvIGxpYnhsIik6Cj4gPiBTbyBtYXliZSBsaWJ4bF9fZG9tYWluX2J1
aWxkX2luZm9fc2V0ZGVmYXVsdCgpIHNob3VsZCBhbHNvIHNldCBhIHZhbHVlCj4gPiB0byBpb21t
dV9tZW1rYiBhcyBpdCBkb2VzIGZvciBzaGFkb3dfbWVta2I/IEF0IGxlYXN0LCBzZXQgaW9tbXVf
bWVta2I9MAo+ID4gaWYgc3RpbGwgdGhlIGRlZmF1bHQuCj4gCj4gSSB0aGluaywgdGhpcy4KPiAK
PiBJYW4uCj4gCj4gRnJvbSAzNzlkOGViNjlmNzEzY2NjZjdlYWNiNGMyYTYzZjRmNWZlOTQ0MjU1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgo+IERhdGU6IE1vbiwgMTQgT2N0IDIwMTkgMTc6NTk6MDAgKzAxMDAK
PiBTdWJqZWN0OiBbUEFUQ0hdIHNxdWFzaCEgbGlieGw6IE1vdmUgc2hhZG93X21lbWtiIGFuZCBp
b21tdV9tZW1rYiBkZWZhdWx0aW5nCj4gIGludG8gbGlieGwKPiAKPiAtLS0KPiB2NDogUHJvdmlk
ZSBhIGZhbGxiYWNrIGRlZmF1bHQgZm9yIGlvbW11X21lbWtiIHRvbywgZm9yIG9sZCBjYWxsZXJz
Lgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyB8IDQgKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBpbmRleCA3NDIzYmVk
ZjdkLi5iMzk1MWEyNDIzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
Cj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtMjI5LDYgKzIyOSwxMCBA
QCBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywK
PiAgICAgIGxpYnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoZ2MsIGJfaW5m
byk7Cj4gICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+ZG1fcmVzdHJpY3Qs
IGZhbHNlKTsKPiAgCj4gKyAgICBpZiAoYl9pbmZvLT5pb21tdV9tZW1rYiA9PSBMSUJYTF9NRU1L
Ql9ERUZBVUxUKQo+ICsgICAgICAgIC8qIE5vcm1hbGx5IGRlZmF1bHRlZCBpbiBsaWJ4bF9fZG9t
YWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQgKi8KPiArICAgICAgICBiX2luZm8tPmlvbW11X21l
bWtiID0gMDsKPiArCj4gICAgICBzd2l0Y2ggKGJfaW5mby0+dHlwZSkgewo+ICAgICAgY2FzZSBM
SUJYTF9ET01BSU5fVFlQRV9IVk06Cj4gICAgICAgICAgaWYgKGJfaW5mby0+c2hhZG93X21lbWti
ID09IExJQlhMX01FTUtCX0RFRkFVTFQpCgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
