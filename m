Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CC112FEB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:24:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXOR-0006qY-5E; Wed, 04 Dec 2019 16:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icXOP-0006qG-RM
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:20:45 +0000
X-Inumbo-ID: 05dce66e-16b2-11ea-a0d2-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05dce66e-16b2-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575476445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a3VbCfnmF7tpj2vAyuyl6JFYJVMSgRm44pU8P/N40ZM=;
 b=SPPWUkKi48vySeIiQieUf5AYsjgiE8hpl2BVi/EntYujdZgLvxW/+WmL
 7f5lXX6qgjC+DF0PCrMaFnuapvUOFmUuLikaRCaAem9WGsSBcutPfvBZ1
 jVD/RNc8Oa5qrbcuhVXnfwmQv7dmSYHmDLGVVPZ+KNVkDE3ouL/yqb6lH A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DiTWPkgppH4Ncg4m7tBrUmjWkmgJQ8GZG5ChhVNrQRR00qkdsmLWmhlh4D0jRysgVsBI8IYbf0
 iQXsLP0DMnxFjEUaWE70D6Baq7DRp+W8wvu45kTGCseiOoQxAwBfE+C2uWWmULEqM0lTRp6zb1
 yRPbySQfqIv5zEpW7YfOkxEMP4S0SRIUoBrz3acpnqU9TW7ADN45ukJf04GTU4OWYvy4uUhnt4
 hcDPw6ba6Y7QxTcqnr57I6v7baHEOgRwL4A8vD+J0RxslVMoVNPtTGlDvqAbE8vSuYZptuFRAU
 dVE=
X-SBRS: 2.7
X-MesageID: 9607271
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9607271"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:20:22 +0100
Message-ID: <20191204162025.37510-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204162025.37510-1-roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] x86/ioapic: only use dest32 with x2apic
 and interrupt remapping enabled
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIElPLUFQSUMgY29kZSBhc3N1bWVzIHRoYXQgeDJhcGljIGJlaW5nIGVuYWJsZWQgYWxzbyBp
bXBsaWVzCmludGVycnVwdCByZW1hcHBpbmcgYmVpbmcgZW5hYmxlZCwgYW5kIGhlbmNlIHdpbGwg
dXNlIHRoZSAzMmJpdApkZXN0aW5hdGlvbiBmaWVsZCBpbiB0aGUgSU8tQVBJQyBlbnRyeS4KClRo
aXMgaXMgc2FmZSBub3csIGJ1dCB0aGVyZSdzIG5vIHJlYXNvbiB0byBub3QgZW5hYmxlIHgyQVBJ
QyBldmVuCndpdGhvdXQgaW50ZXJydXB0IHJlbWFwcGluZywgYW5kIGhlbmNlIHRoZSBJTy1BUElD
IGNvZGUgbmVlZHMgdG8gdXNlCnRoZSAzMiBiaXQgZGVzdGluYXRpb24gZmllbGQgb25seSB3aGVu
IGJvdGggaW50ZXJydXB0IHJlbWFwcGluZyBhbmQKeDJBUElDIGFyZSBlbmFibGVkLgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgogLSBGaXggc2V0X2lvYXBpY19hZmZpbml0eV9pcnEuCi0tLQogeGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9p
b19hcGljLmMgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCmluZGV4IDk3Y2IyZDE1NGEuLjYyMzhk
ZjQ5NGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKKysrIGIveGVuL2FyY2gv
eDg2L2lvX2FwaWMuYwpAQCAtNTYyLDcgKzU2Miw3IEBAIHNldF9pb2FwaWNfYWZmaW5pdHlfaXJx
KHN0cnVjdCBpcnFfZGVzYyAqZGVzYywgY29uc3QgY3B1bWFza190ICptYXNrKQogCiAgICAgZGVz
dCA9IHNldF9kZXNjX2FmZmluaXR5KGRlc2MsIG1hc2spOwogICAgIGlmIChkZXN0ICE9IEJBRF9B
UElDSUQpIHsKLSAgICAgICAgaWYgKCAheDJhcGljX2VuYWJsZWQgKQorICAgICAgICBpZiAoICFp
b21tdV9pbnRyZW1hcCB8fCAheDJhcGljX2VuYWJsZWQgKQogICAgICAgICAgICAgZGVzdCA9IFNF
VF9BUElDX0xPR0lDQUxfSUQoZGVzdCk7CiAgICAgICAgIGVudHJ5ID0gaXJxXzJfcGluICsgaXJx
OwogICAgICAgICBmb3IgKDs7KSB7CkBAIC05NjQsNyArOTY0LDcgQEAgc3RhdGljIGh3X2lycV9j
b250cm9sbGVyIGlvYXBpY19lZGdlX3R5cGU7CiAjZGVmaW5lIElPQVBJQ19MRVZFTAkxCiAKICNk
ZWZpbmUgU0VUX0RFU1QoZW50LCBtb2RlLCB2YWwpIGRvIHsgXAotICAgIGlmICh4MmFwaWNfZW5h
YmxlZCkgXAorICAgIGlmICh4MmFwaWNfZW5hYmxlZCAmJiBpb21tdV9pbnRyZW1hcCkgXAogICAg
ICAgICAoZW50KS5kZXN0LmRlc3QzMiA9ICh2YWwpOyBcCiAgICAgZWxzZSBcCiAgICAgICAgIChl
bnQpLmRlc3QubW9kZS5tb2RlIyNfZGVzdCA9ICh2YWwpOyBcCkBAIC0xMTk0LDE0ICsxMTk0LDE0
IEBAIHN0YXRpYyB2b2lkIC8qX19pbml0Ki8gX19wcmludF9JT19BUElDKGJvb2wgYm9vdCkKIAlw
cmludGsoS0VSTl9ERUJVRyAiLi4uLiBJUlEgcmVkaXJlY3Rpb24gdGFibGU6XG4iKTsKIAogCXBy
aW50ayhLRVJOX0RFQlVHICIgTlIgJXMgTXNrIFRyZyBJUlIgUG9sIFN0YXQgRHN0TSBEZWxNIFZl
Y1xuIiwKLSAgICAgICAgICAgICAgIHgyYXBpY19lbmFibGVkID8gIiBEZXN0SUQiIDogIkRzdCIp
OworICAgICAgICAgICAgICAgKHgyYXBpY19lbmFibGVkICYmIGlvbW11X2ludHJlbWFwKSA/ICIg
RGVzdElEIiA6ICJEc3QiKTsKIAogCWZvciAoaSA9IDA7IGkgPD0gcmVnXzAxLmJpdHMuZW50cmll
czsgaSsrKSB7CiAgICAgICAgICAgICBzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSBlbnRyeTsK
IAogICAgICAgICAgICAgZW50cnkgPSBpb2FwaWNfcmVhZF9lbnRyeShhcGljLCBpLCAwKTsKIAot
ICAgICAgICAgICAgaWYgKCB4MmFwaWNfZW5hYmxlZCApCisgICAgICAgICAgICBpZiAoIHgyYXBp
Y19lbmFibGVkICYmIGlvbW11X2ludHJlbWFwICkKICAgICAgICAgICAgICAgICBwcmludGsoS0VS
Tl9ERUJVRyAiICUwMnggJTA4eCIsIGksIGVudHJ5LmRlc3QuZGVzdDMyKTsKICAgICAgICAgICAg
IGVsc2UKICAgICAgICAgICAgICAgICBwcmludGsoS0VSTl9ERUJVRyAiICUwMnggICUwMnggIiwg
aSwKQEAgLTI1MDQsOSArMjUwNCw5IEBAIHZvaWQgZHVtcF9pb2FwaWNfaXJxX2luZm8odm9pZCkK
ICAgICAgICAgICAgICAgICAgICBydGUuZGVzdF9tb2RlID8gJ0wnIDogJ1AnLAogICAgICAgICAg
ICAgICAgICAgIHJ0ZS5kZWxpdmVyeV9zdGF0dXMsIHJ0ZS5wb2xhcml0eSwgcnRlLmlyciwKICAg
ICAgICAgICAgICAgICAgICBydGUudHJpZ2dlciA/ICdMJyA6ICdFJywgcnRlLm1hc2ssCi0gICAg
ICAgICAgICAgICAgICAgeDJhcGljX2VuYWJsZWQgPyA4IDogMiwKLSAgICAgICAgICAgICAgICAg
ICB4MmFwaWNfZW5hYmxlZCA/IHJ0ZS5kZXN0LmRlc3QzMgotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDogcnRlLmRlc3QubG9naWNhbC5sb2dpY2FsX2Rlc3QpOworICAgICAgICAg
ICAgICAgICAgICh4MmFwaWNfZW5hYmxlZCAmJiBpb21tdV9pbnRyZW1hcCkgPyA4IDogMiwKKyAg
ICAgICAgICAgICAgICAgICAoeDJhcGljX2VuYWJsZWQgJiYgaW9tbXVfaW50cmVtYXApID8KKyAg
ICAgICAgICAgICAgICAgICAgICAgcnRlLmRlc3QuZGVzdDMyIDogcnRlLmRlc3QubG9naWNhbC5s
b2dpY2FsX2Rlc3QpOwogCiAgICAgICAgICAgICBpZiAoIGVudHJ5LT5uZXh0ID09IDAgKQogICAg
ICAgICAgICAgICAgIGJyZWFrOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
