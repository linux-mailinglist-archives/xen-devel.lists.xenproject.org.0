Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCE181D1E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 17:03:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3nT-0003un-0i; Wed, 11 Mar 2020 16:01:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC3nR-0003uY-OS
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 16:01:25 +0000
X-Inumbo-ID: 898dff7f-63b1-11ea-b005-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 898dff7f-63b1-11ea-b005-12813bfff9fa;
 Wed, 11 Mar 2020 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583942477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXj3Sg58k1dbq4RYpSwPSqB6XQpy8HDs2UZyvePsqoI=;
 b=Hg1Lml/vMWKSciUHj3KCdRJJpja/67Be8TGg6J30twudluOqLO6mhJel
 Bq0D/JoBURc5NdxQ+W49di9NsnfSq8R6wCDACzPJbnpNENtbH94bK858z
 MW5MjYK/GskS6ehxVdhkb87zuY7gktYH43/GsNfuCxMZNBKPt3ZEv1g12 c=;
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
IronPort-SDR: fbxbYaBJAlRzSISA2K/E6fEFhJDWeiU8HGCMVkIBSz8nkhjhjbKolEHyfVnpYywr98KshL9hTk
 7J/Nk3uwit4PfIAOFnF7pQXhN20f/BtGX1L/WxO5eaEkP9o45+rM1PDDtaoxi4ydXe3x8b69Z2
 3iiS4HmoSEnHS4pGqKLMypJtgSul8+Bwcr4NMPXwzEGS+10eOMjA9oQqVXzm1sT1w9VvitHf+U
 kewvpjAnX9lOeegqHps4IsiC4H2k5fzUUxKdrj31bRpKuixl0bzdncyuGzoCpU3yYbrqaPcSWO
 0vc=
X-SBRS: 2.7
X-MesageID: 13761931
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13761931"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:00:20 +0100
Message-ID: <20200311160021.6075-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311160021.6075-1-roger.pau@citrix.com>
References: <20200311160021.6075-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v4 3/3] make-flight: add dom0 PVH test
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
ZXRjaCxwdXJwb3NlLXRlc3QsaHZtLWFtZCxpb21tdQordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZo
LXhsLWludGVsIGFsbF9ob3N0ZmxhZ3MgICAgICAgYXJjaC1hbWQ2NCxhcmNoLXhlbi1hbWQ2NCxz
dWl0ZS1zdHJldGNoLHB1cnBvc2UtdGVzdCxodm0taW50ZWwsaW9tbXUKK3Rlc3QtYW1kNjQtYW1k
NjQtZG9tMHB2aC14bC1hbWQgICBhcmNoICAgICAgICAgICAgICAgIGFtZDY0Cit0ZXN0LWFtZDY0
LWFtZDY0LWRvbTBwdmgteGwtaW50ZWwgYXJjaCAgICAgICAgICAgICAgICBhbWQ2NAordGVzdC1h
bWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFtZCAgIGJ1aWxkam9iICAgICAgICAgICAgYnVpbGQtYW1k
NjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBidWlsZGpvYiAgICAgICAgICAg
IGJ1aWxkLWFtZDY0Cit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAgZGViaWFuX2Fy
Y2ggICAgICAgICBhbWQ2NAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGRlYmlh
bl9hcmNoICAgICAgICAgYW1kNjQKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQgICBk
ZWJpYW5fa2VybmtpbmQgICAgIHB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50
ZWwgZGViaWFuX2tlcm5raW5kICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhs
LWFtZCAgIGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2NC1kb20w
cHZoLXhsLWludGVsIGRlYmlhbl9zdWl0ZSAgICAgICAgc3RyZXRjaAordGVzdC1hbWQ2NC1hbWQ2
NC1kb20wcHZoLXhsLWFtZCAgIGtlcm5idWlsZGpvYiAgICAgICAgYnVpbGQtYW1kNjQtcHZvcHMK
K3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1pbnRlbCBrZXJuYnVpbGRqb2IgICAgICAgIGJ1
aWxkLWFtZDY0LXB2b3BzCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtYW1kICAga2Vybmtp
bmQgICAgICAgICAgICBwdm9wcwordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWludGVsIGtl
cm5raW5kICAgICAgICAgICAgcHZvcHMKK3Rlc3QtYW1kNjQtYW1kNjQtZG9tMHB2aC14bC1hbWQg
ICB0b29sc3RhY2sgICAgICAgICAgIHhsCit0ZXN0LWFtZDY0LWFtZDY0LWRvbTBwdmgteGwtaW50
ZWwgdG9vbHN0YWNrICAgICAgICAgICB4bAordGVzdC1hbWQ2NC1hbWQ2NC1kb20wcHZoLXhsLWFt
ZCAgIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQordGVzdC1hbWQ2NC1hbWQ2
NC1kb20wcHZoLXhsLWludGVsIHhlbl9ib290X2FwcGVuZCAgICAgZG9tMD1wdmgsdmVyYm9zZQoK
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBSZXF1ZXN0IGhvc3RzIHdpdGggaW9tbXUgZmxhZy4KLS0t
CiBtYWtlLWZsaWdodCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxp
Z2h0CmluZGV4IGIwODQzMWRjLi40OGYxNjRjYyAxMDA3NTUKLS0tIGEvbWFrZS1mbGlnaHQKKysr
IGIvbWFrZS1mbGlnaHQKQEAgLTc1Myw2ICs3NTMsMTYgQEAgdGVzdF9tYXRyaXhfZG9fb25lICgp
IHsKICAgKikgICAgICAgICAgICAgICAgdGVzdF9zaGltPXkgOzsKICAgZXNhYwogCisgICMgUFZI
IGRvbTAgdGVzdHMgZm9yIHZlcnNpb25zID49IDQuMTMgb25seQorICBjYXNlICIkeGVuYnJhbmNo
IiBpbgorICB4ZW4tMy4qLXRlc3RpbmcpICB0ZXN0X2RvbTBwdmg9biA7OworICB4ZW4tNC4/LXRl
c3RpbmcpICB0ZXN0X2RvbTBwdmg9biA7OworICB4ZW4tNC4xMC10ZXN0aW5nKSB0ZXN0X2RvbTBw
dmg9biA7OworICB4ZW4tNC4xMS10ZXN0aW5nKSB0ZXN0X2RvbTBwdmg9biA7OworICB4ZW4tNC4x
Mi10ZXN0aW5nKSB0ZXN0X2RvbTBwdmg9biA7OworICAqKSAgICAgICAgICAgICAgICB0ZXN0X2Rv
bTBwdmg9eSA7OworICBlc2FjCisKICAgIyB4ZW5kIFBWIGd1ZXN0IHRlc3Qgb24geDg2IG9ubHkK
ICAgaWYgWyB4JHRlc3RfeGVuZCA9IHh5IC1hIFwoICRkb20wYXJjaCA9ICJpMzg2IiAtbyAkZG9t
MGFyY2ggPSAiYW1kNjQiIFwpIF07IHRoZW4KICAgICBqb2JfY3JlYXRlX3Rlc3QgdGVzdC0keGVu
YXJjaCRrZXJuLSRkb20wYXJjaC1wdiB0ZXN0LWRlYmlhbiB4ZW5kIFwKQEAgLTg2MSw2ICs4NzEs
MjAgQEAgdGVzdF9tYXRyaXhfZG9fb25lICgpIHsKIAogICBmaQogCisgIGlmIFsgeCR0ZXN0X2Rv
bTBwdmggPSB4eSAtYSAkeGVuYXJjaCA9IGFtZDY0IC1hICRkb20wYXJjaCA9IGFtZDY0IF07IHRo
ZW4KKworICAgIGZvciBjcHV2ZW5kb3IgaW4gYW1kIGludGVsOyBkbworCisgICAgICBqb2JfY3Jl
YXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRrZXJuLSRkb20wYXJjaC1kb20wcHZoLXhsLSRjcHV2ZW5k
b3IgXAorICAgICAgICAgICAgICAgIHRlc3QtZGViaWFuIHhsICR4ZW5hcmNoICRkb20wYXJjaCAk
ZGViaWFuX3J1bnZhcnMgXAorICAgICAgICAgICAgICAgIGFsbF9ob3N0ZmxhZ3M9JG1vc3RfaG9z
dGZsYWdzLGh2bS0kY3B1dmVuZG9yLGlvbW11IFwKKyAgICAgICAgICAgICAgICB4ZW5fYm9vdF9h
cHBlbmQ9J2RvbTA9cHZoLHZlcmJvc2UnCisKKyAgICBkb25lCisKKyAgZmkKKworCiAgIGlmIFsg
eCR0ZXN0X3NoaW0gPSB4eSAtYSAkeGVuYXJjaCA9IGFtZDY0IF07IHRoZW4KIAogICAgIGpvYl9j
cmVhdGVfdGVzdCB0ZXN0LSR4ZW5hcmNoJGtlcm4tJGRvbTBhcmNoLXhsLXB2c2hpbSBcCi0tIAoy
LjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
