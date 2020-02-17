Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02EB161A16
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lMq-0000eb-Pv; Mon, 17 Feb 2020 18:43:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lMp-0000eT-94
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:39 +0000
X-Inumbo-ID: 672916a2-51b5-11ea-8038-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 672916a2-51b5-11ea-8038-12813bfff9fa;
 Mon, 17 Feb 2020 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvSnCknfcw7YwjGcS2Fu6izRD7hCBJjuL0aQoYB/Cq0=;
 b=JWbJCZkTAoYjqxnx+iCBVXM2L8NMxO8ZwzCEXr2nWn4P5++bIS4tje56
 iI8tbKDSvfayrQOG1wPiV+pxJRhQAXWrbc447izXE0BnVRwIIBTBZSYHn
 oRK4g1/zdzgP3ArfdDVPiDRlasoNwz4yaZEqFayr5gguXRZQmUGwy44MK 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yg13t0l5wLPmiFeYL3AQZb3ZEgw0q1lgLQjYqKL3aU/E5J0IoWpVEaP2ZNzYkmyewUozvcurf+
 VzHTCsZf+9pFtKhgS30BcdKZxXI1kxRreChDXt1gg/AiamkC+XjPyAoDOQGtTsd5P7nkttU8nM
 TEvIrEWM0YM9tkvpV3wqlKDMJOWboAlLGdkeX0+38q3uYPG24NzNwlx76qIFovtftepMEa7jHV
 0uTuoxVK/uxM3EtKxwbTLp+BmQP4t2rRBPLEonR+4HpjPKXmAc6oLv+B24QRHCYqVM2B/mW0G7
 pXY=
X-SBRS: 2.7
X-MesageID: 12569856
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12569856"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:20 +0100
Message-ID: <20200217184324.73762-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/6] x86: introduce a nmi_count tracking
 variable
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

VGhpcyBpcyBtb2RlbGVkIGFmdGVyIHRoZSBpcnFfY291bnQgdmFyaWFibGUsIGFuZCBpcyB1c2Vk
IHRvIGFjY291bnQKZm9yIGFsbCB0aGUgTk1JcyBoYW5kbGVkIGJ5IHRoZSBzeXN0ZW0uCgpUaGlz
IHdpbGwgYWxsb3cgdG8gcmVwdXJwb3NlIHRoZSBubWlfY291bnQoKSBoZWxwZXIgc28gaXQgY2Fu
IGJlIHVzZWQKaW4gYSBzaW1pbGFyIG1hbm5lciBhcyBsb2NhbF9pcnFfY291bnQoKTogYWNjb3Vu
dCBmb3IgdGhlIE5NSXMKY3VycmVudGx5IGluIHNlcnZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbm1p
LmMgICAgICAgIHwgMTEgKysrKystLS0tLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgfCAg
NCArKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L25taS5oIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbm1pLmMgYi94ZW4vYXJjaC94ODYvbm1pLmMKaW5kZXggYTVjNmJkZDBjZS4uZTI4NmNl
ZWI0MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L25taS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9u
bWkuYwpAQCAtMTUxLDE1ICsxNTEsMTQgQEAgaW50IG5taV9hY3RpdmU7CiAKIHN0YXRpYyB2b2lk
IF9faW5pdCB3YWl0X2Zvcl9ubWlzKHZvaWQgKnApCiB7Ci0gICAgdW5zaWduZWQgaW50IGNwdSA9
IHNtcF9wcm9jZXNzb3JfaWQoKTsKLSAgICB1bnNpZ25lZCBpbnQgc3RhcnRfY291bnQgPSBubWlf
Y291bnQoY3B1KTsKKyAgICB1bnNpZ25lZCBpbnQgc3RhcnRfY291bnQgPSB0aGlzX2NwdShubWlf
Y291bnQpOwogICAgIHVuc2lnbmVkIGxvbmcgdGlja3MgPSAxMCAqIDEwMDAgKiBjcHVfa2h6IC8g
bm1pX2h6OwogICAgIHVuc2lnbmVkIGxvbmcgcywgZTsKIAogICAgIHMgPSByZHRzYygpOwogICAg
IGRvIHsKICAgICAgICAgY3B1X3JlbGF4KCk7Ci0gICAgICAgIGlmICggbm1pX2NvdW50KGNwdSkg
Pj0gc3RhcnRfY291bnQgKyAyICkKKyAgICAgICAgaWYgKCB0aGlzX2NwdShubWlfY291bnQpID49
IHN0YXJ0X2NvdW50ICsgMiApCiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgZSA9IHJkdHNj
KCk7CiAgICAgfSB3aGlsZSggZSAtIHMgPCB0aWNrcyApOwpAQCAtMTc3LDcgKzE3Niw3IEBAIHZv
aWQgX19pbml0IGNoZWNrX25taV93YXRjaGRvZyh2b2lkKQogICAgIHByaW50aygiVGVzdGluZyBO
TUkgd2F0Y2hkb2cgb24gYWxsIENQVXM6Iik7CiAKICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICgg
Y3B1ICkKLSAgICAgICAgcHJldl9ubWlfY291bnRbY3B1XSA9IG5taV9jb3VudChjcHUpOworICAg
ICAgICBwcmV2X25taV9jb3VudFtjcHVdID0gcGVyX2NwdShubWlfY291bnQsIGNwdSk7CiAKICAg
ICAvKgogICAgICAqIFdhaXQgYXQgbW9zdCAxMCB0aWNrcyBmb3IgMiB3YXRjaGRvZyBOTUlzIG9u
IGVhY2ggQ1BVLgpAQCAtMTg4LDcgKzE4Nyw3IEBAIHZvaWQgX19pbml0IGNoZWNrX25taV93YXRj
aGRvZyh2b2lkKQogCiAgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGNwdSApCiAgICAgewotICAg
ICAgICBpZiAoIG5taV9jb3VudChjcHUpIC0gcHJldl9ubWlfY291bnRbY3B1XSA8IDIgKQorICAg
ICAgICBpZiAoIHBlcl9jcHUobm1pX2NvdW50LCBjcHUpIC0gcHJldl9ubWlfY291bnRbY3B1XSA8
IDIgKQogICAgICAgICB7CiAgICAgICAgICAgICBwcmludGsoIiAlZCIsIGNwdSk7CiAgICAgICAg
ICAgICBvayA9IGZhbHNlOwpAQCAtNTkzLDcgKzU5Miw3IEBAIHN0YXRpYyB2b2lkIGRvX25taV9z
dGF0cyh1bnNpZ25lZCBjaGFyIGtleSkKIAogICAgIHByaW50aygiQ1BVXHROTUlcbiIpOwogICAg
IGZvcl9lYWNoX29ubGluZV9jcHUgKCBpICkKLSAgICAgICAgcHJpbnRrKCIlM2RcdCUzZFxuIiwg
aSwgbm1pX2NvdW50KGkpKTsKKyAgICAgICAgcHJpbnRrKCIlM2RcdCUzdVxuIiwgaSwgcGVyX2Nw
dShubWlfY291bnQsIGkpKTsKIAogICAgIGlmICggKChkID0gaGFyZHdhcmVfZG9tYWluKSA9PSBO
VUxMKSB8fCAoZC0+dmNwdSA9PSBOVUxMKSB8fAogICAgICAgICAgKCh2ID0gZC0+dmNwdVswXSkg
PT0gTlVMTCkgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RyYXBzLmMgYi94ZW4vYXJjaC94
ODYvdHJhcHMuYwppbmRleCA1NjA2N2Y4NWQxLi4zZGJjNjZiYjY0IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwpAQCAtMTY4MywxMyAr
MTY4MywxNSBAQCBzdGF0aWMgaW50IGR1bW15X25taV9jYWxsYmFjayhjb25zdCBzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncywgaW50IGNwdSkKIAogc3RhdGljIG5taV9jYWxsYmFja190ICpubWlf
Y2FsbGJhY2sgPSBkdW1teV9ubWlfY2FsbGJhY2s7CiAKK0RFRklORV9QRVJfQ1BVKHVuc2lnbmVk
IGludCwgbm1pX2NvdW50KTsKKwogdm9pZCBkb19ubWkoY29uc3Qgc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MpCiB7CiAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsK
ICAgICB1bnNpZ25lZCBjaGFyIHJlYXNvbiA9IDA7CiAgICAgYm9vbCBoYW5kbGVfdW5rbm93biA9
IGZhbHNlOwogCi0gICAgKytubWlfY291bnQoY3B1KTsKKyAgICB0aGlzX2NwdShubWlfY291bnQp
Kys7CiAKICAgICBpZiAoIG5taV9jYWxsYmFjayhyZWdzLCBjcHUpICkKICAgICAgICAgcmV0dXJu
OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ubWkuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbm1pLmgKaW5kZXggZjlkZmNhNmFmYi4uYTI4OGYwMmE1MCAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ubWkuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L25taS5oCkBA
IC0zMSw1ICszMSw3IEBAIG5taV9jYWxsYmFja190ICpzZXRfbm1pX2NhbGxiYWNrKG5taV9jYWxs
YmFja190ICpjYWxsYmFjayk7CiAgKiBSZW1vdmUgdGhlIGhhbmRsZXIgcHJldmlvdXNseSBzZXQu
CiAgKi8KIHZvaWQgdW5zZXRfbm1pX2NhbGxiYWNrKHZvaWQpOworCitERUNMQVJFX1BFUl9DUFUo
dW5zaWduZWQgaW50LCBubWlfY291bnQpOwogIAogI2VuZGlmIC8qIEFTTV9OTUlfSCAqLwotLSAK
Mi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
