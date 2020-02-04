Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A585152218
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 22:52:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz64w-0000xl-KE; Tue, 04 Feb 2020 21:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz64v-0000xV-Jj
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 21:49:53 +0000
X-Inumbo-ID: 42a59160-4798-11ea-9026-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42a59160-4798-11ea-9026-12813bfff9fa;
 Tue, 04 Feb 2020 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580852988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=tSvnExCdFXARkrtaSkB6c/ckGLd1WaztgIQX2KGRvAw=;
 b=QpkrgyHdxCtKJ8h1yD9612pwMnpE5gR5ga0L95Xob56DuUskf5joN77c
 xeePPYgZTyeTUENa3oSXh5zrav+wyDs6I82FqPcbjEB5d5c1WCpWjBrtN
 KINVYwGKVEhdwTLgpW9oxOcoop/6AffD8NqwWSU+8zlb1xLxuHE5k6fps Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xHRvshM94kiPk2A4g4iQIs4HIZUOOMzy4aLRsi1QVBkD5y1oG3SIZkvl85CwchBuOL2/3Ou9g8
 2gc4yUtFi2ZZiCdglsVjFzyT/H/+x4dq9JR+kHddVlY8tF/T8jRtf77fH2JcZW3x/gjj57j9F5
 mF2B1rPdLDGcj2N6odBIfx15MV9ytKctO1xqldaV/kAVz52YmDRSj2h9v4QrSqUWs7KY4bXGeY
 ieyZxPF5fIfUquDmgtbiTZeGkYe+9gXTq5PfbpI6hAGqnxAENFhZNS++sXe2K1yx0cJaJ5PCKw
 gDw=
X-SBRS: 2.7
X-MesageID: 11944113
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="11944113"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 21:49:36 +0000
Message-ID: <1580852977-23866-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
References: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x86/shim: suspend and resume platform
 time correctly
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhcmx5IHRvIFMzLCBwbGF0Zm9ybSB0aW1lIG5lZWRzIHRvIGJlIHNhdmVkIG9uIGd1ZXN0
IHN1c3BlbmQKYW5kIHJlc3RvcmVkIG9uIHJlc3VtZSByZXNwZWN0aXZlbHkuIFRoaXMgc2hvdWxk
IGFjY291bnQgZm9yIGV4cGVjdGVkCmp1bXBzIGluIFBWIGNsb2NrIGNvdW50ZXIgdmFsdWUgYWZ0
ZXIgcmVzdW1lLiB0aW1lX3N1c3BlbmQvcmVzdW1lKCkKYXJlIHNhZmUgdG8gdXNlIGluIFBWSCBz
ZXR0aW5nIGFzIGlzIHNpbmNlIGFueSBleGlzdGluZyBvcGVyYXRpb25zCndpdGggUElUL0hQRVQg
dGhhdCB0aGV5IGRvIHdvdWxkIHNpbXBseSBiZSBpZ25vcmVkIGlmIFBJVC9IUEVUIGlzCm5vdCBw
cmVzZW50LgoKQWRkaXRpb25hbGx5LCBhZGQgcmVzdW1lIGNhbGxiYWNrIGZvciBYZW4gUFYgY2xv
Y2tzb3VyY2UgdG8gYXZvaWQKaXRzIGJyZWFrYWdlIG9uIG1pZ3JhdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9wdi9zaGltLmMgfCAgNyArKysrKystCiB4ZW4vYXJjaC94ODYvdGltZS5jICAgIHwg
MTIgKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNo
L3g4Ni9wdi9zaGltLmMKaW5kZXggN2E4OThmZC4uNmIyNmVhYSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3B2L3NoaW0uYworKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC0zMjUsOSAr
MzI1LDEzIEBAIGludCBwdl9zaGltX3NodXRkb3duKHVpbnQ4X3QgcmVhc29uKQogICAgICAgICBp
ZiAoIHYgIT0gY3VycmVudCApCiAgICAgICAgICAgICB2Y3B1X3BhdXNlX2J5X3N5c3RlbWNvbnRy
b2xsZXIodik7CiAKKyAgICAvKiBQcmVwYXJlIHRpbWVrZWVwaW5nIGNvZGUgdG8gc3VzcGVuZC4q
LworICAgIHRpbWVfc3VzcGVuZCgpOworCiAgICAgcmMgPSB4ZW5faHlwZXJjYWxsX3NodXRkb3du
KFNIVVRET1dOX3N1c3BlbmQpOwogICAgIGlmICggcmMgKQogICAgIHsKKyAgICAgICAgdGltZV9y
ZXN1bWUoKTsKICAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQogICAgICAgICAgICAgaWYg
KCB2ICE9IGN1cnJlbnQgKQogICAgICAgICAgICAgICAgIHZjcHVfdW5wYXVzZV9ieV9zeXN0ZW1j
b250cm9sbGVyKHYpOwpAQCAtMzM1LDggKzMzOSw5IEBAIGludCBwdl9zaGltX3NodXRkb3duKHVp
bnQ4X3QgcmVhc29uKQogICAgICAgICByZXR1cm4gcmM7CiAgICAgfQogCi0gICAgLyogUmVzdW1l
IHRoZSBzaGltIGl0c2VsZiBmaXJzdC4gKi8KKyAgICAvKiBSZXN1bWUgdGhlIHNoaW0gaXRzZWxm
IGFuZCB0aW1la2VlcGluZyBmaXJzdC4gKi8KICAgICBoeXBlcnZpc29yX3Jlc3VtZSgpOworICAg
IHRpbWVfcmVzdW1lKCk7CiAKICAgICAvKgogICAgICAqIEFUTSB0aGVyZSdzIG5vdGhpbmcgWGVu
IGNhbiBkbyBpZiB0aGUgY29uc29sZS9zdG9yZSBwZm4gY2hhbmdlcywKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IGY2YjI2ZjguLjdl
N2E2MmUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2
L3RpbWUuYwpAQCAtNTY1LDYgKzU2NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fdGltZXNv
dXJjZSBfX2luaXRkYXRhIHBsdF90c2MgPQogICoKICAqIFhlbiBjbG9jayBzb3VyY2UgaXMgYSB2
YXJpYW50IG9mIFRTQyBzb3VyY2UuCiAgKi8KK3N0YXRpYyB1aW50NjRfdCB4ZW5fdGltZXJfbGFz
dDsKIAogc3RhdGljIHVpbnQ2NF90IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KHZvaWQpCiB7CkBA
IC02MTAsNyArNjExLDYgQEAgc3RhdGljIHVpbnQ2NF90IHJlYWRfeGVuX3RpbWVyKHZvaWQpCiAg
ICAgdWludDMyX3QgdmVyc2lvbjsKICAgICB1aW50NjRfdCByZXQ7CiAgICAgdWludDY0X3QgbGFz
dDsKLSAgICBzdGF0aWMgdWludDY0X3QgbGFzdF92YWx1ZTsKIAogICAgIGRvIHsKICAgICAgICAg
dmVyc2lvbiA9IGluZm8tPnZlcnNpb24gJiB+MTsKQEAgLTYyNiwyMCArNjI2LDI2IEBAIHN0YXRp
YyB1aW50NjRfdCByZWFkX3hlbl90aW1lcih2b2lkKQogCiAgICAgLyogTWFpbnRhaW4gYSBtb25v
dG9uaWMgZ2xvYmFsIHZhbHVlICovCiAgICAgZG8gewotICAgICAgICBsYXN0ID0gcmVhZF9hdG9t
aWMoJmxhc3RfdmFsdWUpOworICAgICAgICBsYXN0ID0gcmVhZF9hdG9taWMoJnhlbl90aW1lcl9s
YXN0KTsKICAgICAgICAgaWYgKCByZXQgPCBsYXN0ICkKICAgICAgICAgICAgIHJldHVybiBsYXN0
OwotICAgIH0gd2hpbGUgKCB1bmxpa2VseShjbXB4Y2hnKCZsYXN0X3ZhbHVlLCBsYXN0LCByZXQp
ICE9IGxhc3QpICk7CisgICAgfSB3aGlsZSAoIHVubGlrZWx5KGNtcHhjaGcoJnhlbl90aW1lcl9s
YXN0LCBsYXN0LCByZXQpICE9IGxhc3QpICk7CiAKICAgICByZXR1cm4gcmV0OwogfQogCitzdGF0
aWMgdm9pZCByZXN1bWVfeGVuX3RpbWVyKHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlICpwdHMp
Cit7CisgICAgd3JpdGVfYXRvbWljKCZ4ZW5fdGltZXJfbGFzdCwgMCk7Cit9CisKIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSBfX2luaXRkYXRhIHBsdF94ZW5fdGltZXIgPQogewog
ICAgIC5pZCA9ICJ4ZW4iLAogICAgIC5uYW1lID0gIlhFTiBQViBDTE9DSyIsCiAgICAgLnJlYWRf
Y291bnRlciA9IHJlYWRfeGVuX3RpbWVyLAogICAgIC5pbml0ID0gaW5pdF94ZW5fdGltZXIsCisg
ICAgLnJlc3VtZSA9IHJlc3VtZV94ZW5fdGltZXIsCiAgICAgLmNvdW50ZXJfYml0cyA9IDYzLAog
fTsKICNlbmRpZgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
