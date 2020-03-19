Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AC18BB99
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:50:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExOX-0005xZ-R0; Thu, 19 Mar 2020 15:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jExOV-0005xU-RX
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:47:39 +0000
X-Inumbo-ID: f5ef0e9a-69f8-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ef0e9a-69f8-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584632859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=huA7ye7Byt+bkdPqGYSAW64EFM5GUrq70d0goSQ3jJ0=;
 b=EULd/wrfZUvmFxS+49Z9PM8X7+ge/+TQzfpdt845Mru+ZUn1CZvm2OJC
 uw3kqX8I+p+j18ouXFA0qgd64CgzgCXTifVkakPCKTvdz+ms4PV6Uc3U8
 gqmhEX0wgatsLIbBv9ITRZ0ecPaMQf3Qx1wW0aeJpeJeWz2WihExnszy1 g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: weHwtQSLCgk6hmsAW75xtwqGl0qrtCS1zFesqgJPnV0djBCOFnfyFPClnl/CzXbwP2Fj26kuqi
 fvwKtRiQMEdfRGjHb+NbzSX11apK9TcQQj1CuG9IhRtnDE3awkqzCk9pKQBtFDPUc/emc2JOHO
 t8GwZT7KdgRf010gNNvKXm49ZIWONGSKxKwq0+PbwmQ9ndDFaTKfgGbSpXkyeRhqbA3joKBHIx
 b5Xj03PASYC+fOZGPyVoZPZ2oLb7u12SDtJGowlQrAOoQc65LzY2UBLM1jcSrUq9LCtzAwX2yg
 6ag=
X-SBRS: 2.7
X-MesageID: 14930043
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14930043"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 16:47:13 +0100
Message-ID: <20200319154716.34556-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/3] x86/guest: use assisted TLB flush in
 guest mode
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIGlzIHRoZSByZW1haW5pbmcgb2YgdGhlIGFzc2lzdGVkIFRMQiBmbHVzaCBz
ZXJpZXMuIFRoaXMgbGFzdCBzZXQgb2YKcGF0Y2hlcyBlbmFibGUgdGhlIHVzYWdlIG9mIHRoZSBY
ZW4gYXNzaXN0ZWQgZmx1c2ggd2hlbiBydW5uaW5nIG5lc3RlZApvbiBYZW4uCgpUaGFua3MsIFJv
Z2VyLgoKUm9nZXIgUGF1IE1vbm5lICgzKToKICB4ODYvdGxiOiBpbnRyb2R1Y2UgYSBmbHVzaCBI
Vk0gQVNJRHMgZmxhZwogIHg4Ni90bGI6IGFsbG93IGRpc2FibGluZyB0aGUgVExCIGNsb2NrCiAg
eDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggd2hlbiBhdmFpbGFibGUKCiB4
ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgMTQg
KysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgICAgIHwg
IDYgKysrKysrCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAgICAgICAgICB8ICA4ICsr
KystLS0tCiB4ZW4vYXJjaC94ODYvbW0vaGFwL25lc3RlZF9oYXAuYyAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgICAgICAgICAgICAgICB8ICAzICsrLQogeGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3No
YWRvdy9jb21tb24uYyAgICAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvaHZtLmMgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvbXVsdGkuYyAgICAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogeGVuL2FyY2gveDg2L3Nt
cC5jICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2ZsdXNodGxiLmggICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDE3ICsrKysrKysrKysrKysrKysrCiB4
ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICAgICAgICAgICAgICAgICB8ICAyICstCiAxNCBmaWxlcyBj
aGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
