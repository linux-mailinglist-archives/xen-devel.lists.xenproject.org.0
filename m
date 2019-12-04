Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3C112FE9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:24:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXOW-0006sK-GC; Wed, 04 Dec 2019 16:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icXOU-0006rs-Qj
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:20:50 +0000
X-Inumbo-ID: 080175d6-16b2-11ea-99dd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 080175d6-16b2-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575476449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8K929pLKGjsKHWuZReFQyGG9sX73qV7AkheF8i5ZCQo=;
 b=BGaY7g5QnRSOjNcMnFz0tAKXKt6nQMhfH1W1W2h6Eiaa9mm46dgLtZ86
 InFFUB1TKs0ycnxHr4GoWXubGiQDbhyQfbSqVCvUoowLwSh3ATCwTXjKC
 WR6vlJk+DFRF+7l5BhsCIwLMFAAlKnnxV0BFuJvs/0pTVG7TX7yo4tzJR 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7UcfKnWASAzwB9/pYSSpoZO1tznWUGYz+WeZuoViguPoOqnSbC36nZzsOLtI7TOS21vC70lc4A
 dG8Enu4LGmkVUF/qMl/EPA44fYz6lkbHG8yIlXpN87E2IsYnjbBswjaUlrEe/j/FO74YbOsXkY
 FNBZluS0O8QvVgKTBbFqnBrzXnQZ/6/DHudja3KAFTh4BABpUVDBXgmSgxyutxEayWqJBLnQgu
 sSzVJO40m9Esi0aQWiAZVQDCULB8BDmWIX+Ih0JYpx/WXfwOo8HJzWhzYMwJ5vwnfVgHpqsn48
 UJI=
X-SBRS: 2.7
X-MesageID: 9323386
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9323386"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:20:23 +0100
Message-ID: <20191204162025.37510-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204162025.37510-1-roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/4] x86/apic: force phys mode if interrupt
 remapping is disabled
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2x1c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1
cHBvcnQsIHNpbmNlCnRoZSB0b3AgMTZiaXRzIG9mIHRoZSBBUElDIElEIGFyZSBmaWxsZWQgd2l0
aCB0aGUgY2x1c3RlciBJRCwgYW5kCmhlbmNlIG9uIHN5c3RlbXMgd2hlcmUgdGhlIHBoeXNpY2Fs
IElEIGlzIHN0aWxsIHNtYWxsZXIgdGhhbiAyNTUgdGhlCmNsdXN0ZXIgSUQgaXMgbm90LiBGb3Jj
ZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubwppbnRlcnJ1cHQgcmVt
YXBwaW5nIHN1cHBvcnQuCgpOb3RlIHRoYXQgdGhpcyByZXF1aXJlcyBhIGZ1cnRoZXIgcGF0Y2gg
aW4gb3JkZXIgdG8gZW5hYmxlIHgyQVBJQwp3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmcgc3Vw
cG9ydC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gVXBkYXRlIGNvbW1hbmQgbGluZSBkb2MuCiAt
IEZpeCBsb2dpYyB0byBzZXQgeDJhcGljX3BoeXMgaWYgdXNlciBoYXMgc3BlY2lmaWVkIGEgdmFs
dWUuCiAtIEZvcmNlIHBoeXMgbW9kZSBpZiBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQu
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgotLS0KIGRvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8ICAzICsrLQogeGVuL2FyY2gveDg2L2dlbmFwaWMv
eDJhcGljLmMgICAgIHwgMTggKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
CmluZGV4IDg5MWQyZDQzOWYuLmQ5NDk1ZWY2YjkgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5k
b2MKQEAgLTIzMDMsNyArMjMwMyw4IEBAIFBlcm1pdCB1c2Ugb2YgeDJhcGljIHNldHVwIGZvciBT
TVAgZW52aXJvbm1lbnRzLgogIyMjIHgyYXBpY19waHlzICh4ODYpCiA+IGA9IDxib29sZWFuPmAK
IAotPiBEZWZhdWx0OiBgdHJ1ZWAgaWYgKipGQURUKiogbWFuZGF0ZXMgcGh5c2ljYWwgbW9kZSwg
YGZhbHNlYCBvdGhlcndpc2UuCis+IERlZmF1bHQ6IGB0cnVlYCBpZiAqKkZBRFQqKiBtYW5kYXRl
cyBwaHlzaWNhbCBtb2RlIG9yIGlmIGludGVycnVwdCByZW1hcHBpbmcKKz4gICAgICAgICAgaXMg
bm90IGF2YWlsYWJsZSwgYGZhbHNlYCBvdGhlcndpc2UuCiAKIEluIHRoZSBjYXNlIHRoYXQgeDJh
cGljIGlzIGluIHVzZSwgdGhpcyBvcHRpb24gc3dpdGNoZXMgYmV0d2VlbiBwaHlzaWNhbCBhbmQK
IGNsdXN0ZXJlZCBtb2RlLiAgVGhlIGRlZmF1bHQsIGdpdmVuIG5vIGhpbnQgZnJvbSB0aGUgKipG
QURUKiosIGlzIGNsdXN0ZXIKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBp
Yy5jIGIveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKaW5kZXggZDVhMTdmMTBkNS4uNzli
NmMwNzMyOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKKysrIGIv
eGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKQEAgLTIyNiw3ICsyMjYsMjMgQEAgYm9vbGVh
bl9wYXJhbSgieDJhcGljX3BoeXMiLCB4MmFwaWNfcGh5cyk7CiBjb25zdCBzdHJ1Y3QgZ2VuYXBp
YyAqX19pbml0IGFwaWNfeDJhcGljX3Byb2JlKHZvaWQpCiB7CiAgICAgaWYgKCB4MmFwaWNfcGh5
cyA8IDAgKQotICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlfZ2JsX0ZBRFQuZmxhZ3MgJiBB
Q1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7CisgICAgeworICAgICAgICBpZiAoICFpb21tdV9pbnRy
ZW1hcCApCisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICogRm9yY2UgcGh5c2ljYWwgbW9k
ZSBpZiB0aGVyZSdzIG5vIGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydDoKKyAgICAgICAgICAg
ICAqIHRoZSBJRCBpbiBjbHVzdGVyZWQgbW9kZSByZXF1aXJlcyBhIDMyIGJpdCBkZXN0aW5hdGlv
biBmaWVsZCBkdWUKKyAgICAgICAgICAgICAqIHRvIHRoZSB1c2FnZSBvZiB0aGUgaGlnaCAxNiBi
aXRzIHRvIHN0b3JlIHRoZSBjbHVzdGVyIElELgorICAgICAgICAgICAgICovCisgICAgICAgICAg
ICB4MmFwaWNfcGh5cyA9IHRydWU7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHgyYXBpY19w
aHlzID0gISEoYWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FMKTsK
KyAgICB9CisgICAgZWxzZSBpZiAoICF4MmFwaWNfcGh5cyAmJiAhaW9tbXVfaW50cmVtYXAgKQor
ICAgIHsKKyAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2RlIGlzIG5v
dCBzdXBwb3J0ZWQgd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nXG4iCisgICAgICAgICAgICAg
ICAieDJBUElDOiBmb3JjaW5nIHBoeXMgbW9kZVxuIik7CisgICAgICAgIHgyYXBpY19waHlzID0g
dHJ1ZTsKKyAgICB9CiAKICAgICBpZiAoIHgyYXBpY19waHlzICkKICAgICAgICAgcmV0dXJuICZh
cGljX3gyYXBpY19waHlzOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
