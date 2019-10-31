Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70405EB00A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 13:21:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ9OQ-0006EA-8V; Thu, 31 Oct 2019 12:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KThf=YY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iQ9ON-0006E5-Rs
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 12:17:31 +0000
X-Inumbo-ID: 68cc5d08-fbd8-11e9-9540-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68cc5d08-fbd8-11e9-9540-12813bfff9fa;
 Thu, 31 Oct 2019 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572524251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r0sT7HPdF/WzdFKV28CDTGc+ITnNW4iu60pHK+4sJkE=;
 b=LQFpRY7x8qHmR6odK6qKj7Tz1GrDHTKY1dTahmNODUjaF7feRdE44GNj
 VmYHRTn0qbr8OvNe4w1o5PiQwFQI24ESGxPcwCBpHziQ2hk45YjkuEuhM
 v9NvbVTKlbI0Je77oLtvk8Cg2QYzBFX9L6oY7ZRUd/UuQKMUH9Jlb8RcY 4=;
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
IronPort-SDR: zzqy6fRnY7bm1txhI8+IUjaf1d6XavIjSoSx9TQv3pa03OAEeCfaWKDEkLPZTzZdZIkrBip+xd
 mOKx1/ytvuIrmqfxNKH8Ws79JP0GcvdYFse+JSeJtml7A1q0jHgJwbpI34J818Es7p3gKj7bcz
 +pZGRWv4r+mhbHN5VgsvlqqEBhynBGt1yMso+i+/trDzEPIwFKIu3KVNqEfG8bRffIrjekmz+k
 Veoqnjt1L/jyt2qJuFr14SwhilDHDLGWzhO6zFsYKQBi6Ilii1ubNaKCkKqmMiic5VREpX+Fdy
 vno=
X-SBRS: 2.7
X-MesageID: 7774296
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,250,1569297600"; 
   d="scan'208";a="7774296"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 31 Oct 2019 12:17:27 +0000
Message-ID: <20191031121727.287419-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13] libxl_pci: Don't hold QMP
 connection while waiting
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgc2VuZGluZyB0aGUgJ2RldmljZV9kZWwnIGNvbW1hbmQgZm9yIGEgUENJIHBhc3N0aHJv
dWdoIGRldmljZSwKd2Ugd2FpdCB1bnRpbCBRRU1VIGhhcyBlZmZlY3RpdmVseSBkZWxldGVkIHRo
ZSBkZXZpY2UsIHRoaXMgaW52b2x2ZXMKZXhlY3V0aW5nIG1vcmUgUU1QIGNvbW1hbmRzLiBXaGls
ZSB3YWl0aW5nLCBsaWJ4bCBob2xkIHRoZSBjb25uZWN0aW9uLgoKSXQgaXNuJ3QgbmVjZXNzYXJ5
IHRvIGhvbGQgdGhlIGNvbm5lY3Rpb24gYW5kIGl0IHByZXZlbnRzIG90aGVycyBmcm9tCm1ha2lu
ZyBwcm9ncmVzcywgc28gdGhpcyBwYXRjaCByZWxlYXNlcyB0aGUgUU1QIGNvbm5lY3Rpb24uCgpG
b3IgYmFja2dyb3VuZDoKICAgIGUuZy4sIHdoZW4gYSBndWVzdCBpcyBjcmVhdGVkIHdpdGggc2V2
ZXJhbCBwY2kgcGFzc3Rocm91Z2gKICAgIGF0dGFjaGVkLCBvbiBgeGwgZGVzdHJveWAgYWxsIHRo
ZSBkZXZpY2VzIG5lZWRzIHRvIGJlIGRldGFjaCwgYW5kCiAgICB0aGlzIGlzIHVzdWFsbHkgd2hh
dCBoYXBwZW5zOgoJLSAnZGV2aWNlX2RlbCcgY2FsbGVkIGZvciB0aGUgMXN0IHBjaSBkZXZpY2UK
CS0gJ3F1ZXJ5LXBjaScgY2hlY2tpbmcgaWYgcGNpIHN0aWxsIHRoZXJlLCBpdCBpcwoJLSB3YWl0
IDFzCgktICdxdWVyeS1wY2knIGNoZWNraW5nIGFnYWluLCBhbmQgaXQncyBnb25lCgktPiBub3cg
dGhlIHNhbWUgY2FuIGJlIGRvbmUgZm9yIHRoZSBzZWNvbmQgcGNpIGRldmljZSwgc28KCXBsZW50
eSBvZiB3YWl0aW5nIG9uIG90aGVycyB3aGVuIHBjaSBkZXRhY2ggY2FuIGJlIGRvbmUgaW4KCXBh
cmFsbGVsLgoKICAgIE9uIHNodXRkb3duLCBsaWJ4bCB1c3VhbGx5IGtlZXBzIHdhaXRpbmcgYmVj
YXVzZSBRRU1VIG5ldmVyCiAgICByZWxlYXNlcyB0aGUgZGV2aWNlIGJlY2F1c2UgdGhlIGd1ZXN0
IGtlcm5lbCBuZXZlciByZXNwb25kcyBRRU1VJ3MKICAgIHVucGx1ZyBxdWVyaWVzLiBTbyBkZXRh
Y2hpbmcgb2YgdGhlIDFzdCBkZXZpY2Ugd2FpdHMgdW50aWwgYQogICAgdGltZW91dCBzdG9wcyBp
dCwgYW5kIHNpbmNlIHRoZSBzYW1lIHRpbWVvdXQgaXMgc2V0dXAgYXQgdGhlIHNhbWUKICAgIHRp
bWUgZm9yIHRoZSBvdGhlciBkZXZpY2VzIHRvIGRldGFjaCwgdGhlICdkZXZpY2VfZGVsJyBjb21t
YW5kIGlzCiAgICBuZXZlciBzZW50IGZvciB0aG9zZS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhs
X3BjaS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKaW5k
ZXggYjU0NDRkMTU1MjNhLi4zMjYyYzI5NTJiYWEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC0yMDYxLDYgKzIwNjEs
OCBAQCBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3FtcF9xdWVyeV9jYihsaWJ4bF9fZWdjICplZ2Ms
CiAKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCisgICAgbGlieGxfX2V2X3FtcF9kaXNwb3NlKGdj
LCBxbXApOworCiAgICAgYXNrZWRfaWQgPSBHQ1NQUklOVEYoUENJX1BUX1FERVZfSUQsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5idXMsIHBjaWRldi0+ZGV2LCBwY2lkZXYtPmZ1
bmMpOwogCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
