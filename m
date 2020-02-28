Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B0173433
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:37:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7c1w-0000bp-EF; Fri, 28 Feb 2020 09:34:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7c1v-0000bk-LK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:33:59 +0000
X-Inumbo-ID: 71eb72d2-5a0d-11ea-b7e8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71eb72d2-5a0d-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582882438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6l5KOEOMEfd/dm+k2HigR4acxynGYI4BQOTLwjxMXPc=;
 b=N9QreNJo/Mf+krNMhgpIh+PqYwTFsp2n+tZnuAhgAhUgELpkCevKir98
 7/+BHRie/c83JZH6cH3e1HazQCwv99qqZfE41rEHL2cfxj8B2/3xBu4N0
 bLJ79RmF4fyE9TCkhENugnpxjNym8sjTJyNDSFfrjCKLwo/p2sf9105ot Y=;
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
IronPort-SDR: LbMV5aDsfDCCazj8tWHRvy/7g8xc4I+pHU4Axquw/iUywe8PgdF5AI4xBQEeCghjZxjhJ3IlAa
 6J2hLPjKahNKWvwELxzKbEwrZIuKt7rMJYUiW6LZyIsUu+Ms97xlWMcg5y01EgWFLTfMv6OnaG
 MA5rS03dD393ENvmXi2cBxYXVLHqnZXToflERfes7NnjBZ0AdMqR22kE73gU4H4bQYAUhr17C4
 uVHh02Lq8I8YrYgbOZV6yFZ24sMt7qZE1hsHNd/11Tsua/7AaJlh1EUuUoZ+zNuae9m+ojDnA5
 SeE=
X-SBRS: 2.7
X-MesageID: 13588525
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,495,1574139600"; d="scan'208";a="13588525"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 10:33:32 +0100
Message-ID: <20200228093334.36586-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/2] x86: scratch cpumask fixes/improvement
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
KysrKysrKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAg
fCAgNCArKystCiB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICB8IDEwICsrKysrKysrLS0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvc21wLmggfCAxNCArKysrKysrKysrKysrKwogNyBmaWxlcyBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
