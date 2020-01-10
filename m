Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44C13725D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwmE-00005P-GX; Fri, 10 Jan 2020 16:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vEkf=27=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipwmD-000056-Nz
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:04:45 +0000
X-Inumbo-ID: e380fd98-33c2-11ea-a985-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e380fd98-33c2-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578672273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HSVWQWUuSbIKADLhBHupdJ3JAQZlKjh+SU49yxI7Ww=;
 b=OgzQ8rDXLh60DHnanX8IVrY5WuoKx4BNX0rDwqSSg5d30aF6C1669iWn
 vb9rNaGNeZnvV0CYvpRT1Co6iHRcliOhtE9M5l5y18gSifrYD8eenbV2D
 v4NXjjxKYvLTsQlTRUd9h9pPJX9xhT7mt6ee8Eb7y1A28Evhondsrhn8U Y=;
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
IronPort-SDR: w7RoXuVrBZXc2YFnqn8ZI0/rjEGB/aWaX6YqivnJRgVoHFNiwhLaeOBYcQyLJjRKAaIQhaIcWo
 /vrUlbIHG+sde9QXHXoh7AuTHqEzZdosE4WmFaMQbx0YNPaavhHxddbs1zX6LJd+0yb3aVC1yH
 vsSnUrHGE0X8qWdqxikHNGgvOnQScVO111YR9Vfepm5mZkKNk+O//aL/DKa6gyefY3x9KfO5uA
 mtpmNgbKy3PyyWMlCFlbnUKjDhLc2Et4Am8brncTEQ5Mj29n6IKWS490PIbqbxSzxVU0Nv8PZv
 tvM=
X-SBRS: 2.7
X-MesageID: 10736127
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10736127"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 17:04:04 +0100
Message-ID: <20200110160404.15573-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110160404.15573-1-roger.pau@citrix.com>
References: <20200110160404.15573-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/3] x86/tlb: use Xen L0 assisted TLB flush
 when available
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

VXNlIFhlbidzIEwwIEhWTU9QX2ZsdXNoX3RsYnMgaHlwZXJjYWxsIGluIG9yZGVyIHRvIHBlcmZv
cm0gZmx1c2hlcy4KVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFuY2Ugb2YgVExC
IGZsdXNoZXMgd2hlbiBydW5uaW5nCndpdGggYSBoaWdoIGFtb3VudCBvZiB2Q1BVcyBhcyBhIFhl
biBndWVzdCwgYW5kIGlzIHNwZWNpYWxseSBpbXBvcnRhbnQKd2hlbiBydW5uaW5nIGluIHNoaW0g
bW9kZS4KClRoZSBmb2xsb3dpbmcgZmlndXJlcyBhcmUgZnJvbSBhIFBWIGd1ZXN0IHJ1bm5pbmcg
YG1ha2UgLWozMiB4ZW5gIGluCnNoaW0gbW9kZSB3aXRoIDMyIHZDUFVzLgoKVXNpbmcgeDJBUElD
IGFuZCBBTExCVVQgc2hvcnRoYW5kOgpyZWFsCTRtMzUuOTczcwp1c2VyCTRtMzUuMTEwcwpzeXMJ
MzZtMjQuMTE3cwoKVXNpbmcgTDAgYXNzaXN0ZWQgZmx1c2g6CnJlYWwgICAgMW0xNC4yMDZzCnVz
ZXIgICAgNG0zMS44MzVzCnN5cyAgICAgNW00NS4wMTNzCgpUaGUgaW1wbGVtZW50YXRpb24gYWRk
cyBhIG5ldyBob29rIHRvIGh5cGVydmlzb3Jfb3BzIHNvIG90aGVyCmVubGlnaHRlbm1lbnRzIGNh
biBhbHNvIGltcGxlbWVudCBzdWNoIGFzc2lzdGVkIGZsdXNoIGp1c3QgYnkgZmlsbGluZwp0aGUg
aG9vay4gTm90ZSB0aGF0IHRoZSBYZW4gaW1wbGVtZW50YXRpb24gY29tcGxldGVseSBpZ25vcmVz
IHRoZQpkaXJ0eSBDUFUgbWFzayBhbmQgdGhlIGxpbmVhciBhZGRyZXNzIHBhc3NlZCBpbiwgYW5k
IGFsd2F5cyBwZXJmb3JtcyBhCmdsb2JhbCBUTEIgZmx1c2ggb24gYWxsIHZDUFVzLgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgogLSBBZGQgYSBMMCBhc3Npc3RlZCBob29rIHRvIGh5cGVydmlzb3Igb3Bz
LgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgIDkgKysrKysr
KysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8ICA2ICsrKysrKwog
eGVuL2FyY2gveDg2L3NtcC5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKIHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIHwgMTMgKysrKysrKysrKysrKwogNCBm
aWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5k
ZXggNGYyN2I5ODc0MC4uYzc5M2JhNTFjMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydmlzb3IuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC0x
OCw2ICsxOCw3IEBACiAgKgogICogQ29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KICAqLwor
I2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KICNpbmNsdWRl
IDx4ZW4vdHlwZXMuaD4KIApAQCAtNjQsNiArNjUsMTQgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3Vt
ZSh2b2lkKQogICAgICAgICBvcHMtPnJlc3VtZSgpOwogfQogCitpbnQgaHlwZXJ2aXNvcl9mbHVz
aF90bGIoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSkKK3sKKyAgICBpZiAo
IG9wcyAmJiBvcHMtPmZsdXNoX3RsYiApCisgICAgICAgIHJldHVybiBvcHMtPmZsdXNoX3RsYiht
YXNrLCB2YSk7CisKKyAgICByZXR1cm4gLUVOT1NZUzsKK30KKwogLyoKICAqIExvY2FsIHZhcmlh
YmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IDZkYmM1Zjk1M2YuLjQ3YWY3
NzNhY2EgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwpAQCAtMzEwLDExICszMTAsMTcgQEAgc3RhdGljIHZv
aWQgcmVzdW1lKHZvaWQpCiAgICAgICAgIHB2X2NvbnNvbGVfaW5pdCgpOwogfQogCitzdGF0aWMg
aW50IGZsdXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhKQorewor
ICAgIHJldHVybiB4ZW5faHlwZXJjYWxsX2h2bV9vcChIVk1PUF9mbHVzaF90bGJzLCBOVUxMKTsK
K30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiAgICAgLm5h
bWUgPSAiWGVuIiwKICAgICAuc2V0dXAgPSBzZXR1cCwKICAgICAuYXBfc2V0dXAgPSBhcF9zZXR1
cCwKICAgICAucmVzdW1lID0gcmVzdW1lLAorICAgIC5mbHVzaF90bGIgPSBmbHVzaF90bGIsCiB9
OwogCiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCB4Z19wcm9iZSh2b2lkKQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gveDg2L3NtcC5jCmluZGV4
IDY1MTBkZDg0YWIuLmIzY2IxYmE5MGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYwor
KysgYi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTE1LDYgKzE1LDcgQEAKICNpbmNsdWRlIDx4ZW4v
cGVyZmMuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KICNpbmNsdWRlIDxhc20vY3VycmVu
dC5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgogI2luY2x1ZGUgPGFzbS9zbXAuaD4KICNpbmNs
dWRlIDxhc20vbWMxNDY4MThydGMuaD4KICNpbmNsdWRlIDxhc20vZmx1c2h0bGIuaD4KQEAgLTI2
Miw2ICsyNjMsMTEgQEAgdm9pZCBmbHVzaF9hcmVhX21hc2soY29uc3QgY3B1bWFza190ICptYXNr
LCBjb25zdCB2b2lkICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQogICAgIGlmICggKGZsYWdzICYg
fkZMVVNIX09SREVSX01BU0spICYmCiAgICAgICAgICAhY3B1bWFza19zdWJzZXQobWFzaywgY3B1
bWFza19vZihjcHUpKSApCiAgICAgeworICAgICAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAm
JgorICAgICAgICAgICAgICEoZmxhZ3MgJiB+KEZMVVNIX1RMQiB8IEZMVVNIX1RMQl9HTE9CQUwg
fCBGTFVTSF9WQV9WQUxJRCkpICYmCisgICAgICAgICAgICAgIWh5cGVydmlzb3JfZmx1c2hfdGxi
KG1hc2ssIHZhKSApCisgICAgICAgICAgICByZXR1cm47CisKICAgICAgICAgc3Bpbl9sb2NrKCZm
bHVzaF9sb2NrKTsKICAgICAgICAgY3B1bWFza19hbmQoJmZsdXNoX2NwdW1hc2ssIG1hc2ssICZj
cHVfb25saW5lX21hcCk7CiAgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZsdXNoX2Nw
dW1hc2spOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29y
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAppbmRleCAzOTJmNGI5
MGFlLi5iN2YxOTY5Nzk2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaApA
QCAtMjgsNiArMjgsOCBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgIHZvaWQgKCphcF9z
ZXR1cCkodm9pZCk7CiAgICAgLyogUmVzdW1lIGZyb20gc3VzcGVuc2lvbiAqLwogICAgIHZvaWQg
KCpyZXN1bWUpKHZvaWQpOworICAgIC8qIEwwIGFzc2lzdGVkIFRMQiBmbHVzaCAqLworICAgIGlu
dCAoKmZsdXNoX3RsYikoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSk7CiB9
OwogCiAjaWZkZWYgQ09ORklHX0dVRVNUCkBAIC0zNiw5ICszOCwxNiBAQCBjb25zdCBjaGFyICpo
eXBlcnZpc29yX3Byb2JlKHZvaWQpOwogdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwogdm9p
ZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpOwogdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lk
KTsKKy8qCisgKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2guCisgKiBtYXNrOiBjcHVtYXNrIG9mIHRo
ZSBkaXJ0eSB2Q1BVcyB0aGF0IHNob3VsZCBiZSBmbHVzaGVkLgorICogdmE6IGxpbmVhciBhZGRy
ZXNzIHRvIGZsdXNoLCBvciBOVUxMIGZvciBnbG9iYWwgZmx1c2hlcy4KKyAqLworaW50IGh5cGVy
dmlzb3JfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEpOwog
CiAjZWxzZQogCisjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KICNpbmNsdWRlIDx4ZW4vbGliLmg+
CiAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CiAKQEAgLTQ2LDYgKzU1LDEwIEBAIHN0YXRpYyBpbmxp
bmUgY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKSB7IHJldHVybiBOVUxMOyB9CiBz
dGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNI
QUJMRSgpOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9y
ZXN1bWUodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQorc3RhdGljIGlubGluZSBpbnQg
aHlwZXJ2aXNvcl9mbHVzaF90bGIoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2
YSkKK3sKKyAgICByZXR1cm4gLUVOT1NZUzsKK30KIAogI2VuZGlmICAvKiBDT05GSUdfR1VFU1Qg
Ki8KIAotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
