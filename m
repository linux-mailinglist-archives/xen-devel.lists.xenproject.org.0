Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944412A2F2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijlyF-0000CQ-40; Tue, 24 Dec 2019 15:19:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijlyE-0000CL-5l
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:19:38 +0000
X-Inumbo-ID: cbed502f-2660-11ea-97e5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbed502f-2660-11ea-97e5-12813bfff9fa;
 Tue, 24 Dec 2019 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577200777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fPpMSPzxyVkKbCFSG1R5MyiMP9tqAycTXJrpvGvGSlI=;
 b=U6VLFYXNuXNtl7Jhaf8NOSy5/RlNFjqEDpwM+Zgi+xm+hIiCLZMLGbwf
 OGGPGzZMCFhXOQz+CrnCglbWj+3HXssKa184ZXnrnffKRSdssnfpDWHLu
 KzcL/I1BnYlkatjOsB6RaBKu32cDnVXYUzSGX9r4MLPZ/rOa2LMIquuUv 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OOslYa7pxoydrUt/Q4YtFqhJaRggNJ6FNmOzZrUdl1l1wPm6GIy24TQ9FVVza4eMvFvvu+CAUT
 v3O4Fo24QPgps+mMUtcX6FlcaILyWG1MLosA2cs++5kt/QIaW6AnW+tAB+VNXn0KVCXrnZRojO
 qeeNalRPxkMdnvt4v4iFyXDs1iOm3rCqGFTAIawGYjzM19bAh5ef14yyKg2LP2dfh9hmujAiYE
 h3RZAPaYuv0DYnbq8vQpDvIIdcObyBiRBToD2WhiI3xM9KWbqF+MfvWjvUXHggwZsyMTvRFSt2
 1zs=
X-SBRS: 2.7
X-MesageID: 10482744
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10482744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:20 +0000
Message-ID: <20191224151932.6304-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/12] Support CPUID/MSR data in migration
 streams
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYW4gZWFybHkgY2hyaXN0bWFzIHByZXNlbnQsIGhlcmUgaXMgdGhlIHB1bWJpbmcgd29yayB0
byBpbmNsdWRlIENQVUlEL01TUgpkYXRhIGluIG1pZ3JhdGlvbiBzdHJlYW1zLgoKRm9yIGJpc2Vj
dGFiaWxpdHkgcmVhc29ucywgdGhpcyBpcyBhIGxhcmdlIGFtb3VudCBvZiBwbHVtYmluZyB3aXRo
IG5vIG92ZXJhbGwKY2hhbmdlIGluIGJlaGF2aW91ci4gIFN3aXRjaGluZyB0byB1c2UgdGhlIENQ
VUlEL01TUiBkYXRhIGluIHRoZSBzdHJlYW0gaXMKZ29pbmcgdG8gcmVxdWlyZSBzb21lIGNhcmVm
dWwgY29vcmRpbmF0ZWQgY2hhbmdlcyB3aXRoIGxpYnhsLCB3aGljaCBJIGhhdmVuJ3QKcXVpdGUg
bWFuYWdlZCB0byBnZXQgd29ya2luZyB5ZXQuCgpIb3dldmVyLCB0aGlzIHN1YnNldCBvZiB0aGUg
d29yayBpcyBub3cgaW4gYSBwb3NpdGlvbiB0byByZXZpZXcuCgoKVGhlIGZpcnN0IDYgcGF0Y2hl
cyBhcmUgdmFyaW91cyBiaXRzIG9mIGNsZWFudXAuICBQYXRjaGVzIDctOSBpbnRyb2R1Y2UKTWln
cmF0aW9uIHYzIGFuZCB0aGUgU1RBVElDX0RBVEFfRU5EIHJlY29yZC4gIFBhdGNoZXMgMTAtMTIg
aW50cm9kdWNlIHRoZQpYODZfe0NQVUlELE1TUn1fUE9MSUNZIHJlY29yZHMuCgp+QW5kcmV3CgpB
bmRyZXcgQ29vcGVyICgxMik6CiAgbGlieGMvc2F2ZTogU2hyaW5rIGNvZGUgdm9sdW1lIHdoZXJl
IHBvc3NpYmxlCiAgbGlieGMvcmVzdG9yZTogSW50cm9kdWNlIGZ1bmN0aW9uYWxpdHkgdG8gc2lt
cGxpZnkgYmxvYiBoYW5kbGluZwogIGxpYnhjL21pZ3JhdGlvbjogUmF0aW9uYWxpc2UgdGhlICdj
aGVja3BvaW50ZWQnIGZpZWxkIHRvICdzdHJlYW1fdHlwZScKICBsaWJ4Yy9taWdyYXRpb246IEFk
anVzdCBsYXlvdXQgb2Ygc3RydWN0IHhjX3NyX2NvbnRleHQKICB0b29scy9taWdyYXRpb246IERy
b3AgSUhEUl9WRVJTSU9OIGNvbnN0YW50IGZyb20gbGlieGMgYW5kIHB5dGhvbgogIGRvY3MvbWln
cmF0aW9uIFNwZWNpZnkgbWlncmF0aW9uIHYzIGFuZCBTVEFUSUNfREFUQV9FTkQKICBweXRob24v
bWlncmF0aW9uOiBVcGRhdGUgdmFsaWRhdGlvbiBsb2dpYyB0byB1bmRlcnN0YW5kIGEgdjMgc3Ry
ZWFtCiAgbGlieGMvcmVzdG9yZTogU3VwcG9ydCB2MyBzdHJlYW1zLCBhbmQgY29wZSB3aXRoIHYy
IGNvbXBhdGliaWx0eQogIGxpYnhjL3NhdmU6IFdyaXRlIGEgdjMgc3RyZWFtCiAgZG9jcy9taWdy
YXRpb246IFNwZWNpZnkgWDg2X3tDUFVJRCxNU1J9X1BPTElDWSByZWNvcmRzCiAgbGlieGMvcmVz
dG9yZTogSGFuZGxlIFg4Nl97Q1BVSUQsTVNSfV9EQVRBIHJlY29yZHMKICBsaWJ4Yy9zYXZlOiBX
cml0ZSBYODZfe0NQVUlELE1TUn1fREFUQSByZWNvcmRzCgogZG9jcy9zcGVjcy9saWJ4Yy1taWdy
YXRpb24tc3RyZWFtLnBhbmRvYyAgIHwgIDgxICsrKysrKystCiB0b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmd1ZXN0LmggICAgICAgICAgICAgfCAgMTUgKy0KIHRvb2xzL2xpYnhjL3hjX25vbWlncmF0
ZS5jICAgICAgICAgICAgICAgICB8ICAgNCArLQogdG9vbHMvbGlieGMveGNfc3JfY29tbW9uLmMg
ICAgICAgICAgICAgICAgIHwgICAzICsKIHRvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbi5oICAgICAg
ICAgICAgICAgICB8IDIwNSArKysrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4Yy94Y19zcl9j
b21tb25feDg2LmMgICAgICAgICAgICAgfCAgOTcgKysrKysrKysrCiB0b29scy9saWJ4Yy94Y19z
cl9jb21tb25feDg2LmggICAgICAgICAgICAgfCAgMjUgKysrCiB0b29scy9saWJ4Yy94Y19zcl9j
b21tb25feDg2X3B2LmMgICAgICAgICAgfCAgNTAgKystLS0KIHRvb2xzL2xpYnhjL3hjX3NyX2Nv
bW1vbl94ODZfcHYuaCAgICAgICAgICB8ICAgNCArLQogdG9vbHMvbGlieGMveGNfc3JfcmVzdG9y
ZS5jICAgICAgICAgICAgICAgIHwgIDgyICsrKysrKy0tCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0
b3JlX3g4Nl9odm0uYyAgICAgICAgfCAgMzUgKystLQogdG9vbHMvbGlieGMveGNfc3JfcmVzdG9y
ZV94ODZfcHYuYyAgICAgICAgIHwgMzE2ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiB0
b29scy9saWJ4Yy94Y19zcl9zYXZlLmMgICAgICAgICAgICAgICAgICAgfCAgNjUgKysrLS0tCiB0
b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9odm0uYyAgICAgICAgICAgfCAgMzEgKy0tCiB0b29s
cy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9wdi5jICAgICAgICAgICAgfCAyMjUgKysrKysrKysrLS0t
LS0tLS0tLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3N0cmVhbV9mb3JtYXQuaCAgICAgICAgICB8ICAg
NCArLQogdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9oZWxwZXIuYyAgICAgICAgICAgIHwgICA0ICst
CiB0b29scy9weXRob24vc2NyaXB0cy9jb252ZXJ0LWxlZ2FjeS1zdHJlYW0gfCAgMTMgKy0KIHRv
b2xzL3B5dGhvbi9zY3JpcHRzL3ZlcmlmeS1zdHJlYW0tdjIgICAgICB8ICAgMiArLQogdG9vbHMv
cHl0aG9uL3hlbi9taWdyYXRpb24vbGlieGMucHkgICAgICAgIHwgIDc0ICsrKysrKy0KIDIwIGZp
bGVzIGNoYW5nZWQsIDg1NCBpbnNlcnRpb25zKCspLCA0ODEgZGVsZXRpb25zKC0pCgotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
