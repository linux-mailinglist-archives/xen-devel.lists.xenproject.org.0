Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57861D280D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 13:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIWhw-0001c9-O6; Thu, 10 Oct 2019 11:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIWhv-0001c4-8n
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:34:11 +0000
X-Inumbo-ID: de00d276-eb51-11e9-8c93-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de00d276-eb51-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570707245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uk1EFiqCia2dcWInsYPevxQS4AbbypvreIR7mJSnhAk=;
 b=AhzP8NkFdiFLyB48aL1WgBp4QHzArTw5F+xDlwV/dl17h0URy7D4D8/+
 w7VihAA6lEx8kkJtto93Aa9gXeeMxgEux6rAAtpOrZUIXHBKekt+pzKkh
 h296MusCFnswS7cpyyo+hCM2Vbp3JgWqsKzs7ZPbQtvHAPYQOCp66qRqy U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QYeFOWS/e/e++5DDAOpgvp9yoYvBMHr9LNKBokR3qnJa5QAn9e7smNdNmwguBSVxXhAxbN6wAt
 vy7YvaJRj0zdW81Ko+M9OjKaV2PCmckCGrNM/IavsARbBGYFoCiNwv5bQCpLj9eSK0xY5vuZfV
 5H/9zdOOqtWlkUJ5PGw6BlE2Kr1iGPEM91uTRnVV5nOEidspJ4JiaCZ8a6LoghL9SDE+XXFCs6
 NOkzidTsG7aTa5UThHvvvXYl0fkGnIOo/ccUTCvN0Q4Fhmd1zdireDFltlqNhvh+GZA9ETFgh4
 Mh8=
X-SBRS: 2.7
X-MesageID: 6973869
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6973869"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 13:33:44 +0200
Message-ID: <20191010113345.6867-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010113345.6867-1-roger.pau@citrix.com>
References: <20191010113345.6867-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries when
 enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIGVuYWJsZWQgYXMgcGFydCBvZiBlbmFibGluZyB4
MkFQSUMgdGhlCklPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0
aGUgbmV3IGZvcm1hdCBhbmQgYWRkZWQKdG8gdGhlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUu
CgpUaGlzIHByZXZlbnRzIElPTU1VIGludGVycnVwdCByZW1hcHBpbmcgZmF1bHRzIHdoZW4gYm9v
dGluZyBvbgpoYXJkd2FyZSB0aGF0IGhhcyB1bm1hc2tlZCBJTy1BUElDIHBpbnMuCgpSZXBvcnRl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gUmVt
b3ZlIHRoZSB1bm5lZWRlZCBpb21tdV9lbmFibGVkIGxvY2FsIHZhcmlhYmxlLgotLS0KIHhlbi9h
cmNoL3g4Ni9hcGljLmMgICAgICAgICAgIHwgOSArKysrKysrLS0KIHhlbi9hcmNoL3g4Ni9pb19h
cGljLmMgICAgICAgIHwgNSArKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb19hcGljLmggfCAz
ICsrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hcGljLmMgYi94ZW4vYXJjaC94ODYvYXBpYy5jCmlu
ZGV4IDZjZGI1MGNmNDEuLjg0MTVkOWY3ODcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwpAQCAtNTE1LDcgKzUxNSw3IEBAIHN0YXRpYyB2
b2lkIHJlc3VtZV94MmFwaWModm9pZCkKICAgICBpb21tdV9lbmFibGVfeDJhcGljKCk7CiAgICAg
X19lbmFibGVfeDJhcGljKCk7CiAKLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2Vu
dHJpZXMpOworICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcywgdHJ1ZSk7
CiAgICAgdW5tYXNrXzgyNTlBKCk7CiAKIG91dDoKQEAgLTk2MSw3ICs5NjEsMTIgQEAgdm9pZCBf
X2luaXQgeDJhcGljX2JzcF9zZXR1cCh2b2lkKQogICAgICAgICBwcmludGsoIlN3aXRjaGVkIHRv
IEFQSUMgZHJpdmVyICVzXG4iLCBnZW5hcGljLm5hbWUpOwogCiByZXN0b3JlX291dDoKLSAgICBy
ZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMpOworICAgIC8qCisgICAgICogTkI6
IGRvIG5vdCB1c2UgcmF3IG1vZGUgd2hlbiByZXN0b3JpbmcgZW50cmllcyBpZiB0aGUgaW9tbXUg
aGFzIGJlZW4KKyAgICAgKiBlbmFibGVkIGR1cmluZyB0aGUgcHJvY2VzcywgYmVjYXVzZSB0aGUg
ZW50cmllcyBuZWVkIHRvIGJlIHRyYW5zbGF0ZWQKKyAgICAgKiBhbmQgYWRkZWQgdG8gdGhlIHJl
bWFwcGluZyB0YWJsZSBpbiB0aGF0IGNhc2UuCisgICAgICovCisgICAgcmVzdG9yZV9JT19BUElD
X3NldHVwKGlvYXBpY19lbnRyaWVzLCAheDJhcGljX2VuYWJsZWQpOwogICAgIHVubWFza184MjU5
QSgpOwogCiBvdXQ6CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jIGIveGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYwppbmRleCA1ZDI1ODYyYmQ4Li4zN2VhYmMxNmM5IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKQEAg
LTM3OSw3ICszNzksOCBAQCB2b2lkIG1hc2tfSU9fQVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19y
b3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVzKQogLyoKICAqIFJlc3RvcmUgSU8gQVBJQyBlbnRy
aWVzIHdoaWNoIHdhcyBzYXZlZCBpbiBpb2FwaWNfZW50cmllcy4KICAqLwotaW50IHJlc3RvcmVf
SU9fQVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVz
KQoraW50IHJlc3RvcmVfSU9fQVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAq
KmlvYXBpY19lbnRyaWVzLAorICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJhdykKIHsK
ICAgICBpbnQgYXBpYywgcGluOwogCkBAIC0zOTQsNyArMzk1LDcgQEAgaW50IHJlc3RvcmVfSU9f
QVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVzKQog
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICAgICAgZm9yIChwaW4gPSAwOyBwaW4g
PCBucl9pb2FwaWNfZW50cmllc1thcGljXTsgcGluKyspCi0JICAgIGlvYXBpY193cml0ZV9lbnRy
eShhcGljLCBwaW4sIDEsIGlvYXBpY19lbnRyaWVzW2FwaWNdW3Bpbl0pOworCSAgICBpb2FwaWNf
d3JpdGVfZW50cnkoYXBpYywgcGluLCByYXcsIGlvYXBpY19lbnRyaWVzW2FwaWNdW3Bpbl0pOwog
ICAgIH0KIAogICAgIHJldHVybiAwOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9p
b19hcGljLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaAppbmRleCAwYjA0MWYwNTY1
Li45OTg5MDUxODZiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaApAQCAtMTk3LDcgKzE5Nyw4IEBAIGV4
dGVybiBzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmFsbG9jX2lvYXBpY19lbnRyaWVzKHZv
aWQpOwogZXh0ZXJuIHZvaWQgZnJlZV9pb2FwaWNfZW50cmllcyhzdHJ1Y3QgSU9fQVBJQ19yb3V0
ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVzKTsKIGV4dGVybiBpbnQgc2F2ZV9JT19BUElDX3NldHVw
KHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMpOwogZXh0ZXJuIHZv
aWQgbWFza19JT19BUElDX3NldHVwKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGlj
X2VudHJpZXMpOwotZXh0ZXJuIGludCByZXN0b3JlX0lPX0FQSUNfc2V0dXAoc3RydWN0IElPX0FQ
SUNfcm91dGVfZW50cnkgKippb2FwaWNfZW50cmllcyk7CitleHRlcm4gaW50IHJlc3RvcmVfSU9f
QVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVzLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCByYXcpOwogCiB1bnNpZ25lZCBo
aWdoZXN0X2dzaSh2b2lkKTsKIAotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
