Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09351A3A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTHg-000714-4t; Mon, 24 Jun 2019 18:01:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfTHe-00070z-Km
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:01:38 +0000
X-Inumbo-ID: 1b8f2146-96aa-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b8f2146-96aa-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 18:01:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NWmnsHNpKqb7UJbR0aoYgDSObe7MrrvVJprpbP/PSaVjKe9ILHxGLkJMrT0AihgWRS206sC/Qz
 jelUPnyl8yBO/aaCUO6LZlbNn54etZfEhLhlVDmv8YG4kAKf6NRCpFf0M0wa2H3xPcY5Zr7bDG
 nWIjQlvbYMwFlDI8q3wfbsMHzWrLyVO7Qz04AqjW8D80RPBQL0ERCjJLMajl2MpB3pHlvWpUjQ
 EXQHWp9KKpUb4dDTKd+bM6UETalQPRgmG3zw0IW+cSdvvSzfUa1iBm1jUqEAC+lpfO6fhpMLyD
 CEw=
X-SBRS: 2.7
X-MesageID: 2180712
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2180712"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2019 19:01:27 +0100
Message-ID: <20190624180128.5328-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] page-alloc: Clamp get_free_buddy() to online
 nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZC0+bm9kZV9hZmZpbml0eSBkZWZhdWx0cyB0byBOT0RFX01BU0tfQUxMIHdoaWNoIGhhcyBiaXRz
IHNldCBvdXRzaWRlIG9mCm5vZGVfb25saW5lX21hcC4gIFRoaXMgaW4gdHVybiBjYXVzZXMgdGhl
IGxvb3AgaW4gZ2V0X2ZyZWVfYnVkZHkoKSB0byB3YXN0ZQplZmZvcnQgaXRlcmF0aW5nIG92ZXIg
b2ZmbGluZSBub2Rlcy4KCkFsd2F5cyBjbGFtcCBkLT5ub2RlX2FmZmluaXR5IHRvIG5vZGVfb25s
aW5lX21hcCB3aGVuIGluIHVzZS4KClRoaXMgaW4gdHVybiBpbnZvbHZlcyBpbXBsZW1lbnRpbmcg
bm9kZXNfY29weSgpIHdoaWNoIHdhcyBwcmV2aW91c2x5IG1pc3NpbmcuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5j
b20+CgpUaGlzIHBhdGNoIGhpZGVzIHRoZSBpc3N1ZSBpZGVudGlmaWVkIGluIHRoZSAiVUJTQU4g
cmVwb3J0IGluIGZpbmRfbmV4dF9iaXQoKSIKc28gcHJvYmFibHkgZG9lc24ndCB3YW50IGFwcGx5
aW5nIHVudGlsIHRoYXQgaXMgcmVzb2x2ZWQuCgpBIGxvd2VyIG92ZXJoZWFkIG9wdGlvbiB3b3Vs
ZCBiZSB0byBkbzoKCm5vZGVzX2FuZChub2RlbWFzaywgbm9kZV9vbmxpbmVfbWFwLCBkID8gZC0+
bm9kZV9hZmZpbml0eSA6IG5vZGVfb25saW5lX21hcCk7Cgpob3dldmVyIHRoaXMgZG9lc24ndCB3
b3JrIGJlY2F1c2UgdGhlIG5vZGVzZXRfdCBBUEkgaGFzIGEgaGlkZGVuICYocGFyYW0pCnRocm91
Z2hvdXQgdGhlIEFQSS4gIEkndmUgZ290IGhhbGYgYSBtaW5kIHRvIHVuZG8gdGhpcyBub25zZW5z
ZSBhbmQgaGF2ZQpub2RlbWFza190IHdvcmsgaW4gZXhhY3RseSB0aGUgc2FtZSB3YXkgYXMgY3B1
bWFza190LgotLS0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgIHwgNyArKysrKystCiB4ZW4v
aW5jbHVkZS94ZW4vbm9kZW1hc2suaCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCmluZGV4IDc4MjVmZDhjNDIuLmNlYzFi
MTVkNWIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jCkBAIC04MTEsMTEgKzgxMSwxNiBAQCBzdGF0aWMgc3RydWN0IHBhZ2Vf
aW5mbyAqZ2V0X2ZyZWVfYnVkZHkodW5zaWduZWQgaW50IHpvbmVfbG8sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKIHsKICAg
ICBub2RlaWRfdCBmaXJzdF9ub2RlLCBub2RlID0gTUVNRl9nZXRfbm9kZShtZW1mbGFncyksIHJl
cV9ub2RlID0gbm9kZTsKLSAgICBub2RlbWFza190IG5vZGVtYXNrID0gZCA/IGQtPm5vZGVfYWZm
aW5pdHkgOiBub2RlX29ubGluZV9tYXA7CisgICAgbm9kZW1hc2tfdCBub2RlbWFzazsKICAgICB1
bnNpZ25lZCBpbnQgaiwgem9uZSwgbm9kZW1hc2tfcmV0cnkgPSAwOwogICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBnOwogICAgIGJvb2wgdXNlX3Vuc2NydWJiZWQgPSAobWVtZmxhZ3MgJiBNRU1GX25v
X3NjcnViKTsKIAorICAgIC8qIENsYW1wIG5vZGVtYXNrIHRvIG5vZGVfb25saW5lX21hcCBhbmQg
b3B0aW9uYWxseSBkLT5ub2RlX2FmZmluaXR5LiAqLworICAgIG5vZGVzX2NvcHkobm9kZW1hc2ss
IG5vZGVfb25saW5lX21hcCk7CisgICAgaWYgKCBkICkKKyAgICAgICAgbm9kZXNfYW5kKG5vZGVt
YXNrLCBub2RlbWFzaywgZC0+bm9kZV9hZmZpbml0eSk7CisKICAgICBpZiAoIG5vZGUgPT0gTlVN
QV9OT19OT0RFICkKICAgICB7CiAgICAgICAgIGlmICggZCAhPSBOVUxMICkKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgK
aW5kZXggZTI4NzM5OTM1Mi4uZTgzY2ZlMjQzOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L25vZGVtYXNrLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgKQEAgLTE4OSw2ICsx
ODksMTIgQEAgc3RhdGljIGlubGluZSBpbnQgX19ub2Rlc193ZWlnaHQoY29uc3Qgbm9kZW1hc2tf
dCAqc3JjcCwgaW50IG5iaXRzKQogCXJldHVybiBiaXRtYXBfd2VpZ2h0KHNyY3AtPmJpdHMsIG5i
aXRzKTsKIH0KIAorI2RlZmluZSBub2Rlc19jb3B5KGRzdCwgc3JjKSBfX25vZGVzX2NvcHkoJihk
c3QpLCAmKHNyYykpCitzdGF0aWMgaW5saW5lIHZvaWQgX19ub2Rlc19jb3B5KG5vZGVtYXNrX3Qg
KmRzdCwgbm9kZW1hc2tfdCAqc3JjKQoreworCXJldHVybiBiaXRtYXBfY29weShkc3QtPmJpdHMs
IHNyYy0+Yml0cywgTUFYX05VTU5PREVTKTsKK30KKwogI2RlZmluZSBub2Rlc19zaGlmdF9yaWdo
dChkc3QsIHNyYywgbikgXAogCQkJX19ub2Rlc19zaGlmdF9yaWdodCgmKGRzdCksICYoc3JjKSwg
KG4pLCBNQVhfTlVNTk9ERVMpCiBzdGF0aWMgaW5saW5lIHZvaWQgX19ub2Rlc19zaGlmdF9yaWdo
dChub2RlbWFza190ICpkc3RwLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
