Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71375C0A3A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 19:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDtrp-0008VV-9L; Fri, 27 Sep 2019 17:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDtro-0008VQ-Du
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 17:17:16 +0000
X-Inumbo-ID: a6a05538-e14a-11e9-97fb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id a6a05538-e14a-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569604636;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hgxUkzlTWKi3f1fMrkLHO6cYSebVCNHHfyGWNbD5S2g=;
 b=fAe9iGebloyJS4aeYwQ3d1n4ZzfCR9Fu3eAJouQP6q6+T0RQAyYM6rf/
 OLDPlszNVFr4Lz/C9MwhTdDto8x+1rQv7dFZ1yDdBdq+knfhl7y24x2t8
 RFv51iemjaZx1c8shmCrNurWRrTUBnazBY0cs2hqrE0JAzDbWLHCtCxzG 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8aXoAxvfBzQlTGoOsce651zcCwYNT0VnfKeuHZt3NpZ0jfi3vqTtGwpdv3WiuFIVDi2hruiuWw
 J/geEJCMcalBE2p1P07DnPJbkJFg4uQkllKUcLbDdFsPEANDC9m9o1VXQKSi0gxdZS2js3ZjEx
 kW9OP7/tXB3xdg8EDtG4ACU34R1euKBL9Xfwtt/gg/gV1yveFgIOB0A6s7wCHogWDXFw0KBYMo
 Y53BK4RHJhFgZD4iJ+RyA8tGr+uKZ8xESd4M/dkQ2+qBuOE5wB79ZZ67ZGnB6+v/oylNQOrw5P
 hu8=
X-SBRS: 2.7
X-MesageID: 6189371
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,556,1559534400"; 
   d="scan'208";a="6189371"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23950.17432.186593.462322@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 18:17:12 +0100
To: Olaf Hering <olaf@aepfle.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20190927161746.25902-1-olaf@aepfle.de>
References: <20190927161746.25902-1-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix crash in helper_done due to
 uninitialized data
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xhZiBIZXJpbmcgd3JpdGVzICgiW1BBVENIIHYxXSBsaWJ4bDogZml4IGNyYXNoIGluIGhlbHBl
cl9kb25lIGR1ZSB0byB1bmluaXRpYWxpemVkIGRhdGEiKToKPiBBIGNyYXNoIGluIGhlbHBlcl9k
b25lLCBjYWxsZWQgZnJvbSBsaWJ4bF9kb21haW5fc3VzcGVuZCwgd2FzIHJlcG9ydGVkLAo+IHRy
aWdnZXJlZCBieSAndmlyc2ggbWlncmF0ZSAtLWxpdmUgeGVuK3NzaDovL2hvc3QnOgouLi4KPiBU
aGlzIGlzIHRyaWdnZXJlZCBieSBhIGZhaWxlZCBwb2xsLCB0aGUgYWN0dWFsIGVycm9yIHdhczoK
PiAKPiBsaWJ4bF9hb3V0aWxzLmM6MzI4OmRhdGFjb3BpZXJfd3JpdGFibGU6IHVuZXhwZWN0ZWQg
cG9sbCBldmVudCAweDFjIG9uIGZkIDM3IChzaG91bGQgYmUgUE9MTE9VVCkgd3JpdGluZyBsaWJ4
YyBoZWFkZXIgZHVyaW5nIGNvcHkgb2Ygc2F2ZSB2MiBzdHJlYW0KPiAKPiBJbiB0aGlzIGNhc2Ug
cmV2ZW50cyBpbiBkYXRhY29waWVyX3dyaXRhYmxlIGlzIFBPTExIVVB8UE9MTEVSUnxQT0xMT1VU
LAo+IHdoaWNoIHRyaWdnZXJzIGRhdGFjb3BpZXJfY2FsbGJhY2suIEluIGhlbHBlcl9kb25lLAo+
IHNocy0+Y29tcGxldGlvbl9jYWxsYmFjayBpcyBzdGlsbCB6ZXJvLiBsaWJ4bF9feGNfZG9tYWlu
X3NhdmUgZmlsbHMKPiBkc3Muc3dzLnNocy4gQnV0IHRoYXQgZnVuY3Rpb24gaXMgb25seSBjYWxs
ZWQgYWZ0ZXIgc3RyZWFtX2hlYWRlcl9kb25lLgo+IEFueSBlcnJvciBiZWZvcmUgdGhhdCB3aWxs
IGxlYXZlIGRzcyBwYXJ0bHkgdW5pbml0aWFsaXplZC4KClRoYW5rcyBmb3IgdGhlIGRpYWdub3Np
cy4gIEFuZCBzb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2Ugb2YgdGhpcwpidWcuCgo+IEZpeCB0
aGlzIGNyYXNoIGJ5IGNoZWNraW5nIGlmIC0+Y29tcGxldGlvbl9jYWxsYmFjayBpcyB2YWxpZC4K
CkJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgZml4IGlzIHJpZ2h0LiAgVGhlIGJ1ZyBpcyB0aGF0Cmxp
YnhsX19zYXZlX2hlbHBlcl9hYm9ydCBpcyBjYWxsZWQgb24gYSBibGFuayBzaHMuICAoWW91IHNh
eQoidW5pbml0aWFsaXNlZCIgYnV0IGFjdHVhbGx5IHRoaXMgaXMgYWxsIHplcm9lZCBhdCBzb21l
IHBvaW50LCBzbyBpdAppdCdzIG5vdCByZWFkaW5nIHVuaW5pdGlhbGlzZWQgbWVtb3J5LikKCkkg
dGhpbmsgaXQgaXMgaW4gZmFjdCBhIGJ1ZyB0aGF0IHRoaXMgZXJyb3IgcGF0aAoKICAgIGlmICgh
c3RyZWFtLT5yYyAmJiByYykgewogICAgICAgIC8qIEZpcnN0IHJlcG9ydGVkIGZhaWx1cmUuIFRl
YXIgZXZlcnl0aGluZyBkb3duLiAqLwogICAgICAgIHN0cmVhbS0+cmMgPSByYzsKICAgICAgICBz
dHJlYW0tPnN5bmNfdGVhcmRvd24gPSB0cnVlOwoKICAgICAgICBsaWJ4bF9fc3RyZWFtX3JlYWRf
YWJvcnQoZWdjLCBzdHJlYW0sIHJjKTsKICAgICAgICBsaWJ4bF9fc2F2ZV9oZWxwZXJfYWJvcnQo
ZWdjLCAmc3RyZWFtLT5zaHMpOwogICAgICAgIGxpYnhsX19jb252ZXJzaW9uX2hlbHBlcl9hYm9y
dChlZ2MsICZzdHJlYW0tPmNocywgcmMpOwoKICAgICAgICBzdHJlYW0tPnN5bmNfdGVhcmRvd24g
PSBmYWxzZTsKICAgIH0KCmNhbGxzIGxpYnhsX19zYXZlX2hlbHBlcl9hYm9ydCB3aGVuIGl0IGhh
c24ndCBldmVyIGNhbGxlZCBhbnl0aGluZwpvdGhlciB0aGFuIGxpYnhsX19zYXZlX2hlbHBlcl9p
bml0LiAgQmVjYXVzZSBfYWJvcnQgbmF0dXJhbGx5IHdhbnRzIHRvCmNhbGwgdGhlIGZhaWx1cmUg
Y2FsbGJhY2suCgpJIHN1Z2dlc3QgdGhhdCB3ZSBhZGQgYSBjaGVjayBmb3IgX2ludXNlIHRvIHRo
aXMgYml0IG9mCmNoZWNrX2FsbF9maW5pc2hlZC4KClJvc3MgYW5kIEFuZHJldywgeW91IHdyb3Rl
IG11Y2ggb2YgdGhpcyBzdHJlYW0gcmVhZCBzdHVmZiwgd2hhdCBkbyB5b3UKdGhpbmsgPwoKUGFy
dCBvZiB0aGUgZGlmZmljdWx0eSBpcyB0aGF0IHRoZSBwb3NzaWJsZSBzdGF0ZXMgYW5kIHRyYW5z
aXRpb25zIG9mCmEgbGlieGxfX3NhdmVfaGVscGVyX3N0YXRlIGFyZSBub3QgZm9ybWF0bGx5IGRv
Y3VtZW50ZWQuICBUaGF0J3MgbXkKZmF1bHQgLSBzb3JyeS4KClRoYW5rcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
