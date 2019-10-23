Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D9E1BB6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFV-0005tb-Vg; Wed, 23 Oct 2019 13:00:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFT-0005tP-Ty
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:23 +0000
X-Inumbo-ID: 129cbdaf-f595-11e9-947c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 129cbdaf-f595-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Zzusm/RjFNRE7hHrONeMgqDs0JYfYY3tV4/RvhfMiVc=;
 b=fM5O45k7aTEED5rzXamwk3GY5OUACc5GbOpaQPow/ZuYBs0C6wbvDmke
 SdaIoeYlJB3fwVDOrCF/gRjtA8R65tAmhZjcyqOJVTEHOE/8E5KSystx2
 JMnbLfTfEZUCSFbLjZAE7ouXnJmU7RHOh1rK/RO0ZtSlxQ3yUTxv11jTE o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X/4Gn0cguiAyVNNvqcMzR1m1/kqMUq4+80mkVvFKG5NXM/O0ej4IK+9ZpLb67Jrd0U1rreD4zh
 Uj/viI6PQykq4pwA5wVtcHvk2OSs5clE6HKU1AN2yt9fITE6A+/8yz705DqlrLqbD+JypeDd1v
 H/aqR5CfcyNrq2kUpTuDaWGsOGUDNSUBNMZrcdHuvz7J8ZTEQ0eaXqL0YONKuLzNAzzvdCFmuc
 gNpJ8UivpgZNIYoSv9TkzFyZNIQjglQWB/0YjDqwDcI7a2FZ5xpUWA/1t/79qAWuy27C+CAdNk
 o+k=
X-SBRS: 2.7
X-MesageID: 7317937
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7317937"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:04 +0100
Message-ID: <20191023130013.32382-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 02/11] xl: Pass
 libxl_domain_config to freemem(), instead of b_info
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIGNoYW5nZSB0aGUgbGlieGwgQVBJIGluIGEgbW9tZW50IGFuZCB0aGlz
IGNoYW5nZSB3aWxsCm1ha2UgaXQgc2ltcGxlci4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMveGwveGxfdm1jb250cm9sLmMg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy94bC94bF92bWNvbnRyb2wuYyBiL3Rvb2xzL3hsL3hsX3Zt
Y29udHJvbC5jCmluZGV4IGIyMDU4MmUxNWIuLmQzM2M2YjM4YzkgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3hsL3hsX3ZtY29udHJvbC5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZtY29udHJvbC5jCkBAIC0zMTQs
NyArMzE0LDcgQEAgc3RhdGljIGludCBkb21haW5fd2FpdF9ldmVudCh1aW50MzJfdCBkb21pZCwg
bGlieGxfZXZlbnQgKipldmVudF9yKQogICogUmV0dXJucyB0cnVlIGluIGNhc2UgdGhlcmUgaXMg
YWxyZWFkeSwgb3Igd2UgbWFuYWdlIHRvIGZyZWUgaXQsIGVub3VnaAogICogbWVtb3J5LCBidXQg
YWxzbyBpZiBhdXRvYmFsbG9vbiBpcyBmYWxzZS4KICAqLwotc3RhdGljIGJvb2wgZnJlZW1lbSh1
aW50MzJfdCBkb21pZCwgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mbykKK3N0YXRpYyBi
b29sIGZyZWVtZW0odWludDMyX3QgZG9taWQsIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmln
KQogewogICAgIGludCByYywgcmV0cmllcyA9IDM7CiAgICAgdWludDY0X3QgbmVlZF9tZW1rYiwg
ZnJlZV9tZW1rYjsKQEAgLTMyMiw3ICszMjIsNyBAQCBzdGF0aWMgYm9vbCBmcmVlbWVtKHVpbnQz
Ml90IGRvbWlkLCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqYl9pbmZvKQogICAgIGlmICghYXV0
b2JhbGxvb24pCiAgICAgICAgIHJldHVybiB0cnVlOwogCi0gICAgcmMgPSBsaWJ4bF9kb21haW5f
bmVlZF9tZW1vcnkoY3R4LCBiX2luZm8sICZuZWVkX21lbWtiKTsKKyAgICByYyA9IGxpYnhsX2Rv
bWFpbl9uZWVkX21lbW9yeShjdHgsICZkX2NvbmZpZy0+Yl9pbmZvLCAmbmVlZF9tZW1rYik7CiAg
ICAgaWYgKHJjIDwgMCkKICAgICAgICAgcmV0dXJuIGZhbHNlOwogCkBAIC04NzksNyArODc5LDcg
QEAgc3RhcnQ6CiAgICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogCiAgICAgaWYgKGRvbWlkX3NvZnRf
cmVzZXQgPT0gSU5WQUxJRF9ET01JRCkgewotICAgICAgICBpZiAoIWZyZWVtZW0oZG9taWQsICZk
X2NvbmZpZy5iX2luZm8pKSB7CisgICAgICAgIGlmICghZnJlZW1lbShkb21pZCwgJmRfY29uZmln
KSkgewogICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gZnJlZSBtZW1vcnkg
Zm9yIHRoZSBkb21haW5cbiIpOwogICAgICAgICAgICAgcmV0ID0gRVJST1JfRkFJTDsKICAgICAg
ICAgICAgIGdvdG8gZXJyb3Jfb3V0OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
