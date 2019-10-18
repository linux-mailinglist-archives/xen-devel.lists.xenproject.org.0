Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587BDC820
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLTqQ-00052M-SN; Fri, 18 Oct 2019 15:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLTqP-000526-IF
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:07:09 +0000
X-Inumbo-ID: eed63808-f1b8-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eed63808-f1b8-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571411219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Zzusm/RjFNRE7hHrONeMgqDs0JYfYY3tV4/RvhfMiVc=;
 b=UGLDPniQuTjYCN1iibkp8ipvqCs17BVLowxiwGT11SjccioYbHopZUDS
 o1n4B0ilgVLhr+w6eaVmzyfxdop8ayff/TICDJXg6QKIOhs2+8BszFIG3
 4P0u5v5tYIpBp8DanucP/b+0VikkNCzQ8g4tA8Jn7fxOUaF29J2F5yEs/ U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XrvMVtRnUbF3txWp1cpUK2Q6KHLXScoJihn/xwTqegoeOPFCQP5x518GKAwYDQ/do9kBmFfb4g
 1+YprCKyCp+Qsdk/v87lA0KSiD85jAvum5/XudwPzik/FQvg/nkMG0EnKNHHPaxSZfYxJSQtk7
 txnOmNdTFreAaBONosfhIFkSl5Xr46C2aS4wkV0RGR2y/dyvW+oZp6AObOMY83rU9EwYOxcHBi
 pI0cFbZLuVB2JCG9BJnZikVjgMY2ghJ24djEqDRDXe8TJpKA2TKSf92uwdghzuQMU+RfdV249M
 tuc=
X-SBRS: 2.7
X-MesageID: 7434354
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7434354"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 18 Oct 2019 16:06:45 +0100
Message-ID: <20191018150653.24862-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v5 02/10] xl: Pass
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
Cc: Paul Durrant <pdurrant@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
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
