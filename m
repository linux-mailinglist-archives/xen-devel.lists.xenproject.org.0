Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BDA17FF81
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:50:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBfEK-0005Fw-EK; Tue, 10 Mar 2020 13:47:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+PCK=43=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jBfEI-0005FZ-Dl
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:47:30 +0000
X-Inumbo-ID: adaa0146-62d5-11ea-b34e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adaa0146-62d5-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583848047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FJEFd/BJynCS7r9APmpkey4LpaB99BGtNqePZ3wuyKs=;
 b=RnCbWuhkcDNMYJZkmKNmb01hVipLRDKNTxXhaI4AQV/0c0QnnauOdDq/
 CCeoRiU4I4f3wN9G3CQQWp+tbAsyuU4oeD7cbUBQFK34vLGyC5ewFH9p4
 Iew38NAPyh+H9rdJ6QWi+8MlupoxMzuUAPp9T1JtfMttA1ibGG+WpUbbs s=;
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
IronPort-SDR: owuskKC4s/NXDh29op0OxSJWddBRE4R/2ev0RL0IpA06Jf8aUV+tuHVHsgB3ltRtUNBuFBKA3O
 pmGA53zBkkkwEGMvd3q1b9nhCbH+R/vYHesjFcH+YfsLBFT6sE49WyiAOh3joju3D9bcmApZ8f
 jsiR3dGE9Rl8C9GbuKVElKKIOjtqfbDW4X9M57OW0eSjkfeKeqjvqfn331p40V7/O1yY6K9JAy
 FiHdNBP5tVFDJ44Cku0rlhJVCZWNoM7M9S4ONU5idQ6UZC8hK9GdtEoHS59vDyo0PMS3x6Pr7l
 Un4=
X-SBRS: 2.7
X-MesageID: 14323082
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="14323082"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 14:46:35 +0100
Message-ID: <20200310134635.99810-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200310134635.99810-1-roger.pau@citrix.com>
References: <20200310134635.99810-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v2 2/2] make-flight: add dom0 PVH test
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgZG9tMCBQVkggdGVzdCwgdGhlIHRlc3QgdG8gYmUgcnVuIGlzIGxhdW5jaGluZyBhIFBW
IGd1ZXN0Cih0ZXN0LWRlYmlhbikuIE5vdGUgdGhlIFBWSCBkb20wIHRlc3RzIGFyZSBvbmx5IGVu
YWJsZWQgZm9yIFhlbiA+PQo0LjEzLgoKVGhlIHJ1bnZhciBkaWZmZXJlbmNlIGlzOgoKK3Rlc3Qt
YW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9kaV92ZXJzaW9uIDIwMjAtMDIt
MTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxfaG9zdF9kaV92ZXJzaW9u
IDIwMjAtMDItMTAKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBhbGxfaG9zdF9z
dWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBhbGxf
aG9zdF9zdWl0ZSAgICAgIHN0cmV0Y2gKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQg
ICBhbGxfaG9zdGZsYWdzICAgICAgIGFyY2gtYW1kNjQsYXJjaC14ZW4tYW1kNjQsc3VpdGUtc3Ry
ZXRjaCxwdXJwb3NlLXRlc3QsaHZtLWFtZAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWlu
dGVsIGFsbF9ob3N0ZmxhZ3MgICAgICAgYXJjaC1hbWQ2NCxhcmNoLXhlbi1hbWQ2NCxzdWl0ZS1z
dHJldGNoLHB1cnBvc2UtdGVzdCxodm0taW50ZWwKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14
bC1hbWQgICBhcmNoICAgICAgICAgICAgICAgIGFtZDY0Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBw
dmgteGwtaW50ZWwgYXJjaCAgICAgICAgICAgICAgICBhbWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1k
b20wcHZoLXhsLWFtZCAgIGJ1aWxkam9iICAgICAgICAgICAgYnVpbGQtYW1kNjQKK3Rlc3QtYW1k
NjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBidWlsZGpvYiAgICAgICAgICAgIGJ1aWxkLWFtZDY0
Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAgZGViaWFuX2FyY2ggICAgICAgICBh
bWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGRlYmlhbl9hcmNoICAgICAg
ICAgYW1kNjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBkZWJpYW5fa2Vybmtp
bmQgICAgIHB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgZGViaWFuX2tl
cm5raW5kICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIGRlYmlh
bl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVs
IGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWFtZCAgIGtlcm5idWlsZGpvYiAgICAgICAgYnVpbGQtYW1kNjQtcHZvcHMKK3Rlc3QtYW1kNjQt
YW1kNjQtZG9tMHB2aC14bC1pbnRlbCBrZXJuYnVpbGRqb2IgICAgICAgIGJ1aWxkLWFtZDY0LXB2
b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAga2VybmtpbmQgICAgICAgICAg
ICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGtlcm5raW5kICAgICAg
ICAgICAgcHZvcHMKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICB0b29sc3RhY2sg
ICAgICAgICAgIHhsCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgdG9vbHN0YWNr
ICAgICAgICAgICB4bAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIHhlbl9ib290
X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWludGVsIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQoKU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogbWFrZS1mbGln
aHQgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbWFrZS1mbGlnaHQgYi9tYWtlLWZsaWdodAppbmRleCBi
MDg0MzFkYy4uNDhmMTY0Y2MgMTAwNzU1Ci0tLSBhL21ha2UtZmxpZ2h0CisrKyBiL21ha2UtZmxp
Z2h0CkBAIC03NTMsNiArNzUzLDE2IEBAIHRlc3RfbWF0cml4X2RvX29uZSAoKSB7CiAgICopICAg
ICAgICAgICAgICAgIHRlc3Rfc2hpbT15IDs7CiAgIGVzYWMKIAorICAjIFBWSCBkb20wIHRlc3Rz
IGZvciB2ZXJzaW9ucyA+PSA0LjEzIG9ubHkKKyAgY2FzZSAiJHhlbmJyYW5jaCIgaW4KKyAgeGVu
LTMuKi10ZXN0aW5nKSAgdGVzdF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuPy10ZXN0aW5nKSAgdGVz
dF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuMTAtdGVzdGluZykgdGVzdF9kb20wcHZoPW4gOzsKKyAg
eGVuLTQuMTEtdGVzdGluZykgdGVzdF9kb20wcHZoPW4gOzsKKyAgeGVuLTQuMTItdGVzdGluZykg
dGVzdF9kb20wcHZoPW4gOzsKKyAgKikgICAgICAgICAgICAgICAgdGVzdF9kb20wcHZoPXkgOzsK
KyAgZXNhYworCiAgICMgeGVuZCBQViBndWVzdCB0ZXN0IG9uIHg4NiBvbmx5CiAgIGlmIFsgeCR0
ZXN0X3hlbmQgPSB4eSAtYSBcKCAkZG9tMGFyY2ggPSAiaTM4NiIgLW8gJGRvbTBhcmNoID0gImFt
ZDY0IiBcKSBdOyB0aGVuCiAgICAgam9iX2NyZWF0ZV90ZXN0IHRlc3QtJHhlbmFyY2gka2Vybi0k
ZG9tMGFyY2gtcHYgdGVzdC1kZWJpYW4geGVuZCBcCkBAIC04NjEsNiArODcxLDIwIEBAIHRlc3Rf
bWF0cml4X2RvX29uZSAoKSB7CiAKICAgZmkKIAorICBpZiBbIHgkdGVzdF9kb20wcHZoID0geHkg
LWEgJHhlbmFyY2ggPSBhbWQ2NCAtYSAkZG9tMGFyY2ggPSBhbWQ2NCBdOyB0aGVuCisKKyAgICBm
b3IgY3B1dmVuZG9yIGluIGFtZCBpbnRlbDsgZG8KKworICAgICAgam9iX2NyZWF0ZV90ZXN0IHRl
c3QtJHhlbmFyY2gka2Vybi0kZG9tMGFyY2gtZG9tMHB2aC14bC0kY3B1dmVuZG9yIFwKKyAgICAg
ICAgICAgICAgICB0ZXN0LWRlYmlhbiB4bCAkeGVuYXJjaCAkZG9tMGFyY2ggJGRlYmlhbl9ydW52
YXJzIFwKKyAgICAgICAgICAgICAgICBhbGxfaG9zdGZsYWdzPSRtb3N0X2hvc3RmbGFncyxodm0t
JGNwdXZlbmRvcixpb21tdSBcCisgICAgICAgICAgICAgICAgeGVuX2Jvb3RfYXBwZW5kPSdkb20w
PXB2aCx2ZXJib3NlJworCisgICAgZG9uZQorCisgIGZpCisKKwogICBpZiBbIHgkdGVzdF9zaGlt
ID0geHkgLWEgJHhlbmFyY2ggPSBhbWQ2NCBdOyB0aGVuCiAKICAgICBqb2JfY3JlYXRlX3Rlc3Qg
dGVzdC0keGVuYXJjaCRrZXJuLSRkb20wYXJjaC14bC1wdnNoaW0gXAotLSAKMi4yNS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
