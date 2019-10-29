Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C372E8C1C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:48:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPThu-00071N-3R; Tue, 29 Oct 2019 15:46:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPThs-00071I-KO
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:46:52 +0000
X-Inumbo-ID: 528e82db-fa63-11e9-9515-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528e82db-fa63-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364011;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=jm5zpkr1292wiChUyakpMuO0Z2zZLKDkH5exS7FmQVg=;
 b=RzCD/dEMvjYxZvRwlGFCk3HzAR85yeVTL25+iqf88q6R0nt9po3bPzu0
 DRuUzAIUKrIfmuAWAKbLHrNqOOttun+D4hDAmWklN9lCx5/xdUTkOSncU
 gwZtsRIOHCJua78NEfX+Ss9Z4FtWVc3Wl+UruUyu9OHJCbJqk9AKMqlnZ E=;
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
IronPort-SDR: p8Tf/k3dLPQ4m6LxxLFACbl+4EqeAbIAdXtGb0XF0RoFlLYBOipcFK3AVmLHv9iIEPcrHGEIrB
 nIbGqi9Q+pZQdzxrD5yH56+CYWTGMZ7Jj4O04s4ck5F2e9OXQJY1SredCsXB4SP6vngOiBdHdN
 N1CskoeUXaRfLx1DYRwy2XeUnhDJ2GIeBsWcIKWRrsVbgiHll2VTHnGYCOuU1bMZ28q/0p+zA6
 4lVbHsPFSHb3XEptvMnhBU7rm6yUHUpNGstYsOFnpKycOmO7Hb9S1lZaqY8M54hXd3rXxPtFbZ
 b2o=
X-SBRS: 2.7
X-MesageID: 7890280
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7890280"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.24295.523533.643279@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 15:46:47 +0000
To: Julien Grall <julien@xen.org>, Oleksandr Grytsov <al1img@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Oleksandr Grytsov
 <oleksandr_grytsov@epam.com>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "wl@xen.org" <wl@xen.org>
In-Reply-To: <23992.23483.357316.284205@mariner.uk.xensource.com>
References: <20191028182216.3882-1-al1img@gmail.com>
 <20191028182216.3882-2-al1img@gmail.com>
 <34a525d9-d9e2-b860-d238-7070670599a1@xen.org>
 <23992.23483.357316.284205@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/1] libxl/gentypes: add range init to
 array elements in json parsing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MSAxLzFdIGxpYnhs
L2dlbnR5cGVzOiBhZGQgcmFuZ2UgaW5pdCB0byBhcnJheSBlbGVtZW50cyBpbiBqc29uIHBhcnNp
bmciKToKPiBKdWxpZW4gR3JhbGwgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MSAx
LzFdIGxpYnhsL2dlbnR5cGVzOiBhZGQgcmFuZ2UgaW5pdCB0byBhcnJheSBlbGVtZW50cyBpbiBq
c29uIHBhcnNpbmciKToKPiA+IEkgYW0gYWxzbyBub3QgZW50aXJlbHkgc3VyZSB3aGV0aGVyIHdl
IHNob3VsZCBhbHNvIGNhdGVyIHRoZQo+ID4gdHkuaW5pdF92YWwgIT0gTm9uZSBhcyB3ZWxsIGhl
cmUuCj4gCj4gV2Ugc2hvdWxkLgo+IAo+IEkgaGF2ZSBhIHJldmlzZWQgcGF0Y2guICBJdCBtYWtl
cyBubyBkaWZmZXJlbmNlIHRvIHRoZSBDIG91dHB1dCwKPiBjb21wYXJlZCB0byBPbGVrc2FuZHIn
cyBwYXRjaC4gIEkgYXNzdW1lIHdlIGhhdmUgbm8gYXJyYXlzIG9mIHRoaW5ncwo+IHdpdGggYW4g
aW5pdF92YWwuLi4KCkkgZXhwZXJpbWVudGFsbHkgYWRkZWQgdGhpczoKCiAgbW9kaWZpZWQgICB0
b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKICBAQCAtNDYxLDYgKzQ2MSw3IEBAIGxpYnhsX3Zu
b2RlX2luZm8gPSBTdHJ1Y3QoInZub2RlX2luZm8iLCBbCiAgICAgICAoImRpc3RhbmNlcyIsIEFy
cmF5KHVpbnQzMiwgIm51bV9kaXN0YW5jZXMiKSksICMgZGlzdGFuY2VzIGZyb20gdGhpcyBub2Rl
IHRvIG90aGVyIG5vZGVzCiAgICAgICAoInBub2RlIiwgdWludDMyKSwgIyBwaHlzaWNhbCBub2Rl
IG9mIHRoaXMgbm9kZQogICAgICAgKCJ2Y3B1cyIsIGxpYnhsX2JpdG1hcCksICMgdmNwdXMgaW4g
dGhpcyBub2RlCiAgKyAgICAoInNwb3JrcyIsIEFycmF5KE1lbUtCLCAibnVtX3Nwb3JrcyIpKSwK
ICAgICAgIF0pCgogICBsaWJ4bF9naWNfdmVyc2lvbiA9IEVudW1lcmF0aW9uKCJnaWNfdmVyc2lv
biIsIFsKClRoaXMgZ2VuZXJhdGVzIGNvZGUgY29udGFpbmluZyB0aGlzLCB0byBkbyBqc29uIHBh
cnNpbmcgb2YgdGhlIHNwb3JrcwphcnJheToKCiAgQEAgLTEyNjU3LDYgKzEyNjU3LDcgQEAKICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgICAgIH0KICAgICAg
ICAgICAgICAgICAgIGZvciAoaT0wOyAodD1saWJ4bF9fanNvbl9hcnJheV9nZXQoeCxpKSk7IGkr
KykgewogICsgICAgICAgICAgICAgICAgICAgICAgICBwLT5zcG9ya3NbaV0gPSBMSUJYTF9NRU1L
Ql9ERUZBVUxUOwogICAgICAgICAgICAgICAgICAgICAgICAgICByYyA9IGxpYnhsX191aW50NjRf
cGFyc2VfanNvbihnYywgdCwgJnAtPnNwb3Jrc1tpXSk7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChyYykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwoKSGVy
ZSAiKyIgaXMgYSBsaW5lIHdoaWNoIGlzIG1pc3NpbmcgZnJvbSB0aGUgb3V0cHV0IG9mIE9sZWtz
YW5kcidzCnZlcnNpb24gYW5kIHByZXNlbnQgaW4gdGhlIG91dHB1dCBvZiBtaW5lLiAgSSB0aGlu
ayB0aGlzIG1lYW5zIEkgaGF2ZQpjb252aW5jZWQgbXlzZWxmIHRoYXQgd2UgY29ycmVjdGx5IGlk
ZW50aWZpZWQgYSBsYXRlbnQgYnVnIGhlcmUgYW5kCnRoYXQgSSBoYXZlIGZpeGVkIGl0LgoKSSB3
aWxsIHNlbmQgb3V0IGEgcmV2aXNlZCB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzIHNob3J0bHkuCgpJ
IHRoaW5rIGl0IGlzIGEgY2FuZGlkYXRlIGZvciA0LjEzLgoKVGhhbmtzLApJYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
