Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811117098B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:26:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73Co-0003vO-Jx; Wed, 26 Feb 2020 20:22:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73Cn-0003uh-0T
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:53 +0000
X-Inumbo-ID: b595a90b-58d5-11ea-94dc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b595a90b-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R21aiCvpBVK8pX/VEYsT9FBNc3fKBXVbw2HxNXegm9s=;
 b=BkkWXvQ4lBYMX2LFu1t4yxtDBy16z9rtJOPU01plyDqcTkGV7Dnxf9dE
 9tJzP8fURf7yqSAqwx2btg16GSgHOoUcqHPZ1C8WM3gzXBlUhLibEomTm
 SDuWYoIc6z5NUCZew5uczjvQGP6iw6NmL3oz55JeUcnaGRlp7+cvSseRW c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gpR4kjurA5/tCzcdJ25V1t4YJUtWNdApY3/+bNFx4N1VayTDkMm439E3667pVIj9L9eJiTj64o
 xuHahg3BA7lFa9s5c7+HQdUG09yOh6KX7XzO0DgqEErJ46eq6kDlk9Asas6QMtlQgiZ3HG6tog
 kF9lR5rWTWvkl74bGk3PpRFDINLvmxmup9Yi5/cYAKKElbwT/wjQb+MWr9P0avGVWDU3R/GEto
 MYmNjFp44hxMYYZ6YVyUvzm2y11F4lBuYMtVwKIMiCLe5ILxZXSXoLP5S3DjxiZqovJjrSHJyi
 zPo=
X-SBRS: 2.7
X-MesageID: 13496576
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496576"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:19 +0000
Message-ID: <20200226202221.6555-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 08/10] x86/cpuid: Introduce and use default
 CPUID policies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIG5vdywgdGhlIGRlZmF1bHQgYW5kIG1heCBwb2xpY2llcyByZW1haW4gaWRlbnRpY2FsLCBi
dXQgdGhpcyB3aWxsIGNoYW5nZQppbiB0aGUgZnV0dXJlLiAgV3JpdGUgY2FsY3VsYXRlX3twdixo
dm19X2RlZl9wb2xpY3koKSBpbiBhIHdheSB3aGljaCB3aWxsIGNvcGUKd2l0aCBzaW1wbGUgZmVh
dHVyZSBkaWZmZXJlbmNlcyBmb3Igbm93LgoKVXBkYXRlIFhFTl9TWVNDVExfZ2V0X2NwdV9wb2xp
Y3kgYW5kIGluaXRfZG9tYWluX2NwdWlkX3BvbGljeSgpIHRvIHVzZSB0aGUKZGVmYXVsdCBwb2xp
Y2llcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9jcHVpZC5jICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQogeGVuL2FyY2gveDg2L3N5c2N0bC5jICAgICAg
IHwgIDQgKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZC5oIHwgIDMgKystCiAzIGZpbGVz
IGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2NwdWlkLmMgYi94ZW4vYXJjaC94ODYvY3B1aWQuYwppbmRleCBjZDlhMDIx
NDNjLi42ZTAxMzk0ZmQyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1aWQuYworKysgYi94
ZW4vYXJjaC94ODYvY3B1aWQuYwpAQCAtMTgsNiArMTgsOSBAQCBjb25zdCB1aW50MzJfdCBzcGVj
aWFsX2ZlYXR1cmVzW10gPSBJTklUX1NQRUNJQUxfRkVBVFVSRVM7CiBzdGF0aWMgY29uc3QgdWlu
dDMyX3QgcHZfbWF4X2ZlYXR1cmVtYXNrW10gPSBJTklUX1BWX01BWF9GRUFUVVJFUzsKIHN0YXRp
YyBjb25zdCB1aW50MzJfdCBodm1fc2hhZG93X21heF9mZWF0dXJlbWFza1tdID0gSU5JVF9IVk1f
U0hBRE9XX01BWF9GRUFUVVJFUzsKIHN0YXRpYyBjb25zdCB1aW50MzJfdCBodm1faGFwX21heF9m
ZWF0dXJlbWFza1tdID0gSU5JVF9IVk1fSEFQX01BWF9GRUFUVVJFUzsKK3N0YXRpYyBjb25zdCB1
aW50MzJfdCBwdl9kZWZfZmVhdHVyZW1hc2tbXSA9IElOSVRfUFZfREVGX0ZFQVRVUkVTOworc3Rh
dGljIGNvbnN0IHVpbnQzMl90IGh2bV9zaGFkb3dfZGVmX2ZlYXR1cmVtYXNrW10gPSBJTklUX0hW
TV9TSEFET1dfREVGX0ZFQVRVUkVTOworc3RhdGljIGNvbnN0IHVpbnQzMl90IGh2bV9oYXBfZGVm
X2ZlYXR1cmVtYXNrW10gPSBJTklUX0hWTV9IQVBfREVGX0ZFQVRVUkVTOwogc3RhdGljIGNvbnN0
IHVpbnQzMl90IGRlZXBfZmVhdHVyZXNbXSA9IElOSVRfREVFUF9GRUFUVVJFUzsKIAogc3RhdGlj
IGludCBfX2luaXQgcGFyc2VfeGVuX2NwdWlkKGNvbnN0IGNoYXIgKnMpCkBAIC05OSw5ICsxMDIs
MTEgQEAgc3RydWN0IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5ICAgICByYXdfY3B1aWRfcG9s
aWN5LAogICAgICAgICAgICAgICAgICAgICBfX3JlYWRfbW9zdGx5ICAgIGhvc3RfY3B1aWRfcG9s
aWN5OwogI2lmZGVmIENPTkZJR19QVgogc3RydWN0IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5
ICBwdl9tYXhfY3B1aWRfcG9saWN5Oworc3RydWN0IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5
ICBwdl9kZWZfY3B1aWRfcG9saWN5OwogI2VuZGlmCiAjaWZkZWYgQ09ORklHX0hWTQogc3RydWN0
IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5IGh2bV9tYXhfY3B1aWRfcG9saWN5Oworc3RydWN0
IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5IGh2bV9kZWZfY3B1aWRfcG9saWN5OwogI2VuZGlm
CiAKIHN0YXRpYyB2b2lkIHNhbml0aXNlX2ZlYXR1cmVzZXQodWludDMyX3QgKmZzKQpAQCAtMzgx
LDYgKzM4NiwyMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX3B2X21heF9wb2xpY3ko
dm9pZCkKICAgICBwLT5leHRkLnJhd1sweGFdID0gRU1QVFlfTEVBRjsgLyogTm8gU1ZNIGZvciBQ
ViBndWVzdHMuICovCiB9CiAKK3N0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcHZfZGVmX3Bv
bGljeSh2b2lkKQoreworICAgIHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSAmcHZfZGVmX2NwdWlk
X3BvbGljeTsKKyAgICB1aW50MzJfdCBwdl9mZWF0dXJlc2V0W0ZTQ0FQSU5UU107CisgICAgdW5z
aWduZWQgaW50IGk7CisKKyAgICAqcCA9IHB2X21heF9jcHVpZF9wb2xpY3k7CisgICAgY3B1aWRf
cG9saWN5X3RvX2ZlYXR1cmVzZXQocCwgcHZfZmVhdHVyZXNldCk7CisKKyAgICBmb3IgKCBpID0g
MDsgaSA8IEFSUkFZX1NJWkUocHZfZmVhdHVyZXNldCk7ICsraSApCisgICAgICAgIHB2X2ZlYXR1
cmVzZXRbaV0gJj0gcHZfZGVmX2ZlYXR1cmVtYXNrW2ldOworCisgICAgc2FuaXRpc2VfZmVhdHVy
ZXNldChwdl9mZWF0dXJlc2V0KTsKKyAgICBjcHVpZF9mZWF0dXJlc2V0X3RvX3BvbGljeShwdl9m
ZWF0dXJlc2V0LCBwKTsKKyAgICByZWNhbGN1bGF0ZV94c3RhdGUocCk7Cit9CisKIHN0YXRpYyB2
b2lkIF9faW5pdCBjYWxjdWxhdGVfaHZtX21heF9wb2xpY3kodm9pZCkKIHsKICAgICBzdHJ1Y3Qg
Y3B1aWRfcG9saWN5ICpwID0gJmh2bV9tYXhfY3B1aWRfcG9saWN5OwpAQCAtNDQwLDE2ICs0NjIs
NDUgQEAgc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9odm1fbWF4X3BvbGljeSh2b2lkKQog
ICAgIHJlY2FsY3VsYXRlX3hzdGF0ZShwKTsKIH0KIAorc3RhdGljIHZvaWQgX19pbml0IGNhbGN1
bGF0ZV9odm1fZGVmX3BvbGljeSh2b2lkKQoreworICAgIHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAg
PSAmaHZtX2RlZl9jcHVpZF9wb2xpY3k7CisgICAgdWludDMyX3QgaHZtX2ZlYXR1cmVzZXRbRlND
QVBJTlRTXTsKKyAgICB1bnNpZ25lZCBpbnQgaTsKKyAgICBjb25zdCB1aW50MzJfdCAqaHZtX2Zl
YXR1cmVtYXNrOworCisgICAgKnAgPSBodm1fbWF4X2NwdWlkX3BvbGljeTsKKyAgICBjcHVpZF9w
b2xpY3lfdG9fZmVhdHVyZXNldChwLCBodm1fZmVhdHVyZXNldCk7CisKKyAgICBodm1fZmVhdHVy
ZW1hc2sgPSBodm1faGFwX3N1cHBvcnRlZCgpID8KKyAgICAgICAgaHZtX2hhcF9kZWZfZmVhdHVy
ZW1hc2sgOiBodm1fc2hhZG93X2RlZl9mZWF0dXJlbWFzazsKKworICAgIGZvciAoIGkgPSAwOyBp
IDwgQVJSQVlfU0laRShodm1fZmVhdHVyZXNldCk7ICsraSApCisgICAgICAgIGh2bV9mZWF0dXJl
c2V0W2ldICY9IGh2bV9mZWF0dXJlbWFza1tpXTsKKworICAgIGd1ZXN0X2NvbW1vbl9mZWF0dXJl
X2FkanVzdG1lbnRzKGh2bV9mZWF0dXJlc2V0KTsKKworICAgIHNhbml0aXNlX2ZlYXR1cmVzZXQo
aHZtX2ZlYXR1cmVzZXQpOworICAgIGNwdWlkX2ZlYXR1cmVzZXRfdG9fcG9saWN5KGh2bV9mZWF0
dXJlc2V0LCBwKTsKKyAgICByZWNhbGN1bGF0ZV94c3RhdGUocCk7Cit9CisKIHZvaWQgX19pbml0
IGluaXRfZ3Vlc3RfY3B1aWQodm9pZCkKIHsKICAgICBjYWxjdWxhdGVfcmF3X3BvbGljeSgpOwog
ICAgIGNhbGN1bGF0ZV9ob3N0X3BvbGljeSgpOwogCiAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJ
R19QVikgKQorICAgIHsKICAgICAgICAgY2FsY3VsYXRlX3B2X21heF9wb2xpY3koKTsKKyAgICAg
ICAgY2FsY3VsYXRlX3B2X2RlZl9wb2xpY3koKTsKKyAgICB9CiAKICAgICBpZiAoIGh2bV9lbmFi
bGVkICkKKyAgICB7CiAgICAgICAgIGNhbGN1bGF0ZV9odm1fbWF4X3BvbGljeSgpOworICAgICAg
ICBjYWxjdWxhdGVfaHZtX2RlZl9wb2xpY3koKTsKKyAgICB9CiB9CiAKIGJvb2wgcmVjaGVja19j
cHVfZmVhdHVyZXModW5zaWduZWQgaW50IGNwdSkKQEAgLTYyNSw4ICs2NzYsOCBAQCB2b2lkIHJl
Y2FsY3VsYXRlX2NwdWlkX3BvbGljeShzdHJ1Y3QgZG9tYWluICpkKQogaW50IGluaXRfZG9tYWlu
X2NwdWlkX3BvbGljeShzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0cnVjdCBjcHVpZF9wb2xp
Y3kgKnAgPSBpc19wdl9kb21haW4oZCkKLSAgICAgICAgPyAoSVNfRU5BQkxFRChDT05GSUdfUFYp
ICA/ICAmcHZfbWF4X2NwdWlkX3BvbGljeSA6IE5VTEwpCi0gICAgICAgIDogKElTX0VOQUJMRUQo
Q09ORklHX0hWTSkgPyAmaHZtX21heF9jcHVpZF9wb2xpY3kgOiBOVUxMKTsKKyAgICAgICAgPyAo
SVNfRU5BQkxFRChDT05GSUdfUFYpICA/ICAmcHZfZGVmX2NwdWlkX3BvbGljeSA6IE5VTEwpCisg
ICAgICAgIDogKElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyAmaHZtX2RlZl9jcHVpZF9wb2xpY3kg
OiBOVUxMKTsKIAogICAgIGlmICggIXAgKQogICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwppbmRleCBjYWQ3NTM0MzczLi5iNzk0
OGYyNjYzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKKysrIGIveGVuL2FyY2gv
eDg2L3N5c2N0bC5jCkBAIC00OCw3ICs0OCw3IEBAIGNvbnN0IHN0cnVjdCBjcHVfcG9saWN5IHN5
c3RlbV9wb2xpY2llc1s2XSA9IHsKICAgICAgICAgJnB2X21heF9tc3JfcG9saWN5LAogICAgIH0s
CiAgICAgWyBYRU5fU1lTQ1RMX2NwdV9wb2xpY3lfcHZfZGVmYXVsdCBdID0gewotICAgICAgICAm
cHZfbWF4X2NwdWlkX3BvbGljeSwKKyAgICAgICAgJnB2X2RlZl9jcHVpZF9wb2xpY3ksCiAgICAg
ICAgICZwdl9kZWZfbXNyX3BvbGljeSwKICAgICB9LAogI2VuZGlmCkBAIC01OCw3ICs1OCw3IEBA
IGNvbnN0IHN0cnVjdCBjcHVfcG9saWN5IHN5c3RlbV9wb2xpY2llc1s2XSA9IHsKICAgICAgICAg
Jmh2bV9tYXhfbXNyX3BvbGljeSwKICAgICB9LAogICAgIFsgWEVOX1NZU0NUTF9jcHVfcG9saWN5
X2h2bV9kZWZhdWx0IF0gPSB7Ci0gICAgICAgICZodm1fbWF4X2NwdWlkX3BvbGljeSwKKyAgICAg
ICAgJmh2bV9kZWZfY3B1aWRfcG9saWN5LAogICAgICAgICAmaHZtX2RlZl9tc3JfcG9saWN5LAog
ICAgIH0sCiAjZW5kaWYKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWQuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWQuaAppbmRleCAxYjAwZTgzMmQ2Li43YmFmNmM5NjI4
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9jcHVpZC5oCkBAIC00OSw3ICs0OSw4IEBAIERFQ0xBUkVfUEVSX0NQVShzdHJ1
Y3QgY3B1aWRtYXNrcywgY3B1aWRtYXNrcyk7CiBleHRlcm4gc3RydWN0IGNwdWlkbWFza3MgY3B1
aWRtYXNrX2RlZmF1bHRzOwogCiBleHRlcm4gc3RydWN0IGNwdWlkX3BvbGljeSByYXdfY3B1aWRf
cG9saWN5LCBob3N0X2NwdWlkX3BvbGljeSwKLSAgICBwdl9tYXhfY3B1aWRfcG9saWN5LCBodm1f
bWF4X2NwdWlkX3BvbGljeTsKKyAgICBwdl9tYXhfY3B1aWRfcG9saWN5LCBwdl9kZWZfY3B1aWRf
cG9saWN5LAorICAgIGh2bV9tYXhfY3B1aWRfcG9saWN5LCBodm1fZGVmX2NwdWlkX3BvbGljeTsK
IAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBjcHVfcG9saWN5IHN5c3RlbV9wb2xpY2llc1tdOwogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
