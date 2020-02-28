Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808FE1736D4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:10:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eRD-0006Q8-MT; Fri, 28 Feb 2020 12:08:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7eRB-0006Py-S3
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:08:13 +0000
X-Inumbo-ID: fda53cdb-5a22-11ea-990d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fda53cdb-5a22-11ea-990d-12813bfff9fa;
 Fri, 28 Feb 2020 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582891693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ru5pqIHAfaojmC/jhdqPS7S/d05egcOiYFLd1m6XaNg=;
 b=goRjsb4McvbKVjg1muPqCHWPFjYL4a5y0BPnZEwG/RDOkIbfrLF7Wv7O
 Qr2ETMLhvjF+O7a0/Aqn9hNAb2UR+QoWiM+Mb2R/1nb4fpNhkXDhvpw7V
 nzSWEv12BxN57P61bW0By4UZO+mV45Os0qUwXJI5qP+oRKi6hxwWFrUyx s=;
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
IronPort-SDR: T3cSu+rA8IIn3pHrG9Hir13DhfZjon5lDDbwiQN3iMeKZpdFX0BOSck3u41DWiv9jdpgYQczhI
 PDCNrZ+GzcY3EwwTqT0jfWZDEuqumL0BaO0C1wHMIPp/XDEV4BNOZmnV0JSDjZ8pge0r3XSuPp
 9BItQ3EALemDGhIKql2ch+sKSls43pnhOXla/4NiE/1OBCIxFuUWT/6rcH3Pr0nVPeAXHsj10D
 bk3tu4wXrIK9Z0y9MmXAzvTaRwweoO5mmQ2JntrTHbXGpO2BG3YXVhmu5a0Ut/ExY4QxNwrS1i
 EfI=
X-SBRS: 2.7
X-MesageID: 13144972
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13144972"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:07:51 +0100
Message-ID: <20200228120753.38036-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/2] x86: scratch cpumask fixes/improvement
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

SGVsbG8sCgpGb2xsb3dpbmcgc2VyaWVzIGNvbnRhaW4geWV0IG9uZSBtb3JlIGJ1Z2ZpeCB0aGF0
IHJlbW92ZXMgdGhlIHVzYWdlIG9mCnRoZSBzY3JhdGNoIGNwdW1hc2sgaW4gc2VuZF9JUElfbWFz
ayBhbmQgdGhlIGludHJvZHVjdGlvbiBvZiBhY2Nlc3NvcnMKdG8gZ2V0L3B1dCB0aGUgcGVyLUNQ
VSBzY3JhdGNoIGNwdW1hc2sgaW4gb3JkZXIgdG8gcHJldmVudCBzdWNoIGlzc3Vlcwpmb3JtIGhh
cHBlbmluZyBpbiB0aGUgZnV0dXJlLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAo
Mik6CiAgeDg2L3NtcDogdXNlIGEgZGVkaWNhdGVkIENQVSBtYXNrIGluIHNlbmRfSVBJX21hc2sK
ICB4ODY6IGFkZCBhY2Nlc3NvcnMgZm9yIHNjcmF0Y2ggY3B1IG1hc2sKCiB4ZW4vYXJjaC94ODYv
aW9fYXBpYy5jICAgIHwgIDYgKysrKy0tCiB4ZW4vYXJjaC94ODYvaXJxLmMgICAgICAgIHwgMTQg
KysrKysrKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgfCAzOSArKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAg
fCAgNCArKystCiB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrKystCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgIHwgMTAgKysrKysrKystLQog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaCB8IDE1ICsrKysrKysrKysrKysrKwogNyBmaWxlcyBj
aGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
