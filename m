Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43233140D11
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:51:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSv5-0003tc-NZ; Fri, 17 Jan 2020 14:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSv3-0003sU-Li
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:48:17 +0000
X-Inumbo-ID: 51da2e66-3938-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51da2e66-3938-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ehb6stxvbNhpUuCuKM15JHs7fCQj6gxrVHBJLsJGads=;
 b=f/7+cEfH9j+lnPHkIlPpbkl/7v/zuSCC4TVt4+XUHiMdm47aY834fx1k
 qj/Vwf1XfJf+YI0Wrs58N1OyEqYLnevmaOXjAW9S1yhRiPiDAWRYTal2V
 lzYUtQ4bj42woKBb6kocgN62s5fNWZht47Y71imMQc8FazvsWz7gSjx9Q A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6NzVWMXM4KgZWHcWzI+h7u1nYo7I53PI6aPvvcIKk7DjCXsMkP6Dkc55va1OjWIs04bVcaIyb4
 EDDGDhgFZkuuKo6+VvlbuC+JcO0YDnMEsTjxppGEaGrCqDleKZAW4YFg/qgd5bASgz7RfoNaa+
 JZdxWrEoJoWV+FG9dGWq8eFeRnV8HgkX9U1N5EY9WKoHKHr/KSYmzW5BTOLsaCc3zmCg/qOzjy
 gexa9rJON6t4k12gjcQENTchbSvX86jWFdPOZi1JoOMNj4CzdNpvl5S51TM2cpYVCvXL2ql/A/
 1Bc=
X-SBRS: 2.7
X-MesageID: 11507691
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11507691"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:22 +0000
Message-ID: <20200117144726.582-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/10] libxl: event: Fix hang when mixing
 blocking and eventy calls
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhlIGFwcGxpY2F0aW9uIGNhbGxzIGxpYnhsIHdpdGggYW9faG93PT0wIGFuZCBhbHNvIG1h
a2VzIGNhbGxzCmxpa2UgX29jY3VycmVkLCBsaWJ4bCB3aWxsIHNvbWV0aW1lcyBnZXQgc3R1Y2su
CgpUaGUgYnVnIGhhcHBlbnMgYXMgZm9sbG93cyAoZm9yIGV4YW1wbGUpOgoKICBUaHJlYWQgQQog
ICAgICAgbGlieGxfZG9fdGhpbmcoLGFvX2hvdz09MCkKICAgICAgIGxpYnhsX2RvX3RoaW5nIHN0
YXJ0cywgc2V0cyB1cCBzb21lIGNhbGxiYWNrcwogICAgICAgbGlieGxfZG9fdGhpbmcgZXhpdCBw
YXRoIGNhbGxzIEFPX0lOUFJPR1JFU1MKICAgICAgIGxpYnhsX19hb19pbnByb2dyZXNzIGdvZXMg
aW50byBldmVudCBsb29wCiAgICAgICBldmVudGxvb3BfaXRlcmF0aW9uIHNsZWVwcyBvbjoKICAg
ICAgICAgIC0gZG9fdGhpbmcncyBjdXJyZW50IGZkIHNldAogICAgICAgICAgLSBzaWdjaGxkIHBp
cGUgaWYgYXBwbGljYWJsZQogICAgICAgICAgLSBpdHMgcG9sbGVyCgogIFRocmVhZCBCCiAgICAg
ICBsaWJ4bF9zb21ldGhpbmdfb2NjdXJyZWQKICAgICAgIHRoZSBzb21ldGhpbmcgaXMgdG8gZG8g
d2l0aCBkb190aGluZywgYWJvdmUKICAgICAgIGRvX3RoaW5nX25leHRfY2FsbGJhY2sgZG9lcyBz
b21lIG1vcmUgd29yawogICAgICAgZG9fdGhpbmdfbmV4dF9jYWxsYmFjayBiZWNvbWVzIGludGVy
ZXN0ZWQgaW4gZmQgTgogICAgICAgdGhyZWFkIEIgcmV0dXJucyB0byBhcHBsaWNhdGlvbgoKTm90
ZSB0aGF0IG5vdGhpbmcgd2FrZXMgdXAgdGhyZWFkIEEuICBBIGlzIG5vdCBsaXN0ZW5pbmcgb24g
ZmQgTi4gIFNvCmRvX3RoaW5nXyogd2lsbCBub3Qgc3BvdCB3aGVuIGZkIE4gc2lnbmFscy4gIGRv
X3RoaW5nIHdpbGwgbm90IG1ha2UKZnVydGhlciB0aW1lbHkgcHJvZ3Jlc3MuICBJZiB0aGVyZSBp
cyBubyB0aW1lb3V0IHRocmVhZCBBIHdpbGwgbmV2ZXIKd2FrZSB1cC4KClRoZSBwcm9ibGVtIGhl
cmUgb2NjdXJzIGJlY2F1c2UgdGhyZWFkIEEgaXMgd2FpdGluZyBvbiBhbiBvdXQgb2YgZGF0ZQpv
c2V2ZW50IHNldC4KClRoZXJlIGlzIGFsc28gdGhlIHBvc3NpYmlsaXR5IHRoYXQgYSB0aHJlYWQg
bWlnaHQgYmxvY2sgd2FpdGluZyBmb3IKbGlieGwgb3NldmVudHMgYnV0IG91dHNpZGUgbGlieGws
IGVnIGlmIHRoZSBhcHBsaWNhdGlvbiB1c2VkCmxpYnhsX29zZXZlbnRfYmVmb3JlcG9sbC4gIFdl
IHdpbGwgZGVhbCB3aXRoIHRoYXQgaW4gYSBtb21lbnQuCgpTZWUgdGhlIGJpZyBjb21tZW50IGlu
IGxpYnhsX2V2ZW50LmMgZm9yIGEgZmFpcmx5IGZvcm1hbCBjb3JyZWN0bmVzcwphcmd1bWVudC4K
ClRoaXMgZGVwZW5kcyBvbiBsaWJ4bF9fZWdjX2FvX2NsZWFudXBfMV9iYXRvbiBiZWluZyBjYWxs
ZWQgZXZlcnl3aGVyZQphbiBlZ2Mgb3IgYW8gaXMgZGlzcG9zZWQgb2YuICBGaXJzdGx5IGVnY3M6
IGluIHRoaXMgcGF0Y2ggd2UgcmVuYW1lCmxpYnhsX19lZ2NfY2xlYW51cCwgd2hpY2ggbWVhbnMg
d2UgY2F0Y2ggYWxsIHRoZSBkaXNwb3NhbCBzaXRlcy4KU2Vjb25kbHkgYW9zOiB0aGVzZSBhcmUg
ZGlzcG9zZWQgb2YgYnkgKGkpIEFPX0NSRUFURV9GQUlMCihpaSkgYW9fX2lucHJvZ3Jlc3MgYW5k
IChpaWkpIGFuIGV2ZW50IHdoaWNoIGNvbXBsZXRlcyB0aGUgYW8gbGF0ZXIuCihpKSBhbmQgKGlp
KSB3ZSBoYW5kbGUgYnkgYWRkaW5nIHRoZSBjYWxsIHRvIF9iYXRvbi4gIEluIHRoZSBjYXNlIG9m
CihpaWkpIGFueSBzdWNoIGZ1bmN0aW9uIG11c3QgYmUgYW4gZXZlbnQtZ2VuZXJhdGluZyBmdW5j
dGlvbiBzbyBpdCBoYXMKYW4gZWdjIHRvbywgc28gaXQgd2lsbCBwYXNzIG9uIHRoZSBiYXRvbiB3
aGVuIHRoZSBlZ2MgaXMgZGlzcG9zZWQuCgpSZXBvcnRlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KVGVzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Ci0tLQp2MjogQ2FsbCBsaWJ4bF9fZWdjX2FvX2NsZWFudXBfMV9iYXRvbiAo
cmVuYW1lZCBmcm9tIF9fZWdjX2NsZWFudXApIG9uCiAgICBhbGwgZXhpdHMgZnJvbSBhb19pbnBy
b2dyZXNzLCBldmVuIHJlcXVlc3RzIGZvciBhc3luYyBwcm9jZXNzaW5nLgogICAgRml4ZXMgYSBy
ZW1haW5pbmcgaW5zdGFuY2Ugb2YgdGhpcyBidWcgKCEpCiAgICBUaGlzIGludm9sdmVzIGRpc3Bv
c2luZyBvZiBhby0+cG9sbGVyIHNvbWV3aGF0IGVhcmxpZXIuCgp2MjogTmV3IGNvcnJlY3RuZXNz
IGFyZ3VtZW50cyBpbiBsaWJ4bF9ldmVudC5jIGNvbW1lbnQgYW5kCiAgICBpbiBjb21taXQgbWVz
c2FnZS4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgIHwgMTc4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmggfCAgMzMgKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTk0IGluc2VydGlvbnMoKyks
IDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMg
Yi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4IDI2OGE1ZGExMjAuLmI1MGQ0ZTUwNzQg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZXZlbnQuYwpAQCAtMzcsNiArMzcsMTQwIEBAIHN0YXRpYyB2b2lkIGFvX19jaGVja19k
ZXN0cm95KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9fYW8gKmFvKTsKIAogCiAvKgorICogb3NldmVu
dCB1cGRhdGUgYmF0b24gaGFuZGxpbmcKKyAqCisgKiBXZSBuZWVkIHRoZSBmb2xsb3dpbmcgcHJv
cGVydHkgKHRoZSAidW5zdGFsZSBsaXZlbmVzcyBwcm9wZXJ0eSIpOgorICoKKyAqIFdoZW5ldmVy
IGFueSB0aHJlYWQgaXMgYmxvY2tpbmcgaW4gdGhlIGxpYnhsIGV2ZW50IGxvb3BbMV0sIGF0Cisg
KiBsZWFzdCBvbmUgdGhyZWFkIG11c3QgYmUgdXNpbmcgYW4gdXAgdG8gZGF0ZSBvc2V2ZW50IHNl
dC4gIEl0IGlzIE9LCisgKiBmb3IgYWxsIGJ1dCBvbmUgdGhyZWFkcyB0byBoYXZlIHN0YWxlIGV2
ZW50IHNldHMsIGJlY2F1c2Ugc28gbG9uZworICogYXMgb25lIHdhaXRpbmcgdGhyZWFkIGhhcyB0
aGUgcmlnaHQgZXZlbnQgc2V0LCBhbnkgYWN0dWFsbHkKKyAqIGludGVyZXN0aW5nIGV2ZW50IHdp
bGwsIGlmIG5vdGhpbmcgZWxzZSwgd2FrZSB0aGF0ICJyaWdodCIgdGhyZWFkCisgKiB1cC4gIEl0
IHdpbGwgdGhlbiBtYWtlIHNvbWUgcHJvZ3Jlc3MgYW5kL29yLCBpZiBpdCBleGl0cywgZW5zdXJl
CisgKiB0aGF0IHNvbWUgb3RoZXIgdGhyZWFkIGJlY29tZXMgdGhlICJyaWdodCIgdGhyZWFkLgor
ICoKKyAqIFsxXSBUT0RPOiBSaWdodCBub3cgd2UgYXJlIGNvbnNpZGVyaW5nIG9ubHkgdGhlIGxp
YnhsIGV2ZW50IGxvb3AuCisgKiBXZSBuZWVkIHRvIGNvbnNpZGVyIGFwcGxpY2F0aW9uIGV2ZW50
IGxvb3Agb3V0c2lkZSBsaWJ4bCB0b28uCisgKgorICogQXJndW1lbnQgdGhhdCBvdXIgYXBwcm9h
Y2ggaXMgc291bmQ6CisgKgorICogVGhlIGlzc3VlIHdlIGFyZSBjb25jZXJuZWQgYWJvdXQgaXMg
bGlieGwgc2xlZXBpbmcgb24gYW4gb3V0IG9mCisgKiBkYXRlIGZkIHNldCwgb3IgdG9vIGxvbmcg
YSB0aW1lb3V0LCBzbyB0aGF0IGl0IGRvZXNuJ3QgbWFrZQorICogcHJvZ3Jlc3MuICBJZiB0aGUg
cHJvcGVydHkgYWJvdmUgaXMgc2F0aXNmaWVkLCB0aGVuIGlmIGFueSB0aHJlYWQKKyAqIGlzIHdh
aXRpbmcgaW4gbGlieGwgYXQgbGVhc3Qgb25lIHN1Y2ggdGhyZWFkIHdpbGwgYmUgd2FpdGluZyBv
biBhCisgKiBzdWZmaWNpZW50IG9zZXZlbnQgc2V0LCBzbyBhbnkgcmVsZXZhbnQgb3NldmVudCB3
aWxsIHdha2UgdXAgYQorICogbGlieGwgdGhyZWFkIHdoaWNoIHdpbGwgZWl0aGVyIGhhbmRsZSB0
aGUgZXZlbnQsIG9yIGFycmFuZ2UgdGhhdCBhdAorICogbGVhc3Qgb25lIG90aGVyIGxpYnhsIHRo
cmVhZCBoYXMgdGhlIHJpZ2h0IHNldC4KKyAqCisgKiBUaGVyZSBhcmUgdHdvIGNhbGxzIHRvIHBv
bGwgaW4gbGlieGw6IG9uZSBpcyB0aGUgZmQgcmVjaGVjaywgd2hpY2gKKyAqIGlzIG5vdCBibG9j
a2luZy4gIFRoZXJlIGlzIG9ubHkgdGhlIG9uZSBibG9ja2luZyBjYWxsLCBpbgorICogZXZlbnRs
b29wX2l0ZXJhdGlvbi4gIHBvbGwgcnVucyB3aXRoIHRoZSBjdHggdW5sb2NrZWQsIHNvIG9zZXZl
bnRzCisgKiBtaWdodCBiZSBhZGRlZCBhZnRlciBpdCB1bmxvY2tzIHRoZSBjdHggLSB0aGF0IGlz
IHdoYXQgd2UgYXJlCisgKiB3b3JyaWVkIGFib3V0LgorICoKKyAqIFRvIGRlbW9uc3RyYXRlIHRo
YXQgdGhlIHVuc3RhbGUgbGl2ZW5lc3MgcHJvcGVydHkgaXMgc2F0aXNmaWVkOgorICoKKyAqIFdl
IGRlZmluZSBhIGJhdG9uIGhvbGRlciBhcyBmb2xsb3dzOiBhIGxpYnhsIHRocmVhZCBpcyBhIGJh
dG9uCisgKiBob2xkZXIgaWYKKyAqICAgKGEpIGl0IGhhcyBhbiBlZ2Mgb3IgYW4gYW8gYW5kIGhv
bGRzIHRoZSBjdHggbG9jaywgb3IKKyAqICAgKGIpIGl0IGhhcyBhbiBhY3RpdmUgbm9uLWFwcCBw
b2xsZXIgYW5kIG5vIG9zZXZlbnRzIGhhdmUgYmVlbgorICogICAgICAgYWRkZWQgc2luY2UgaXQg
cmVsZWFzZWQgdGhlIGxvY2ssIG9yCisgKiAgIChjKSBpdCBoYXMgYW4gYWN0aXZlIG5vbi1hcHAg
cG9sbGVyIHdoaWNoIGhhcyBiZWVuIHdva2VuCisgKiAgICAgICAoYnkgd3JpdGluZyB0byBpdHMg
cGlwZSksIHNvIGl0IHdpbGwgbm90IHNsZWVwCisgKiBXZSB3aWxsIG1haW50YWluIHRoZSBpbnZh
cmlhbnQgKHRoZSAiYmF0b24gaW52YXJpYW50IikgdGhhdAorICogd2hlbmV2ZXIgdGhlcmUgaXMg
YW55IGFjdGl2ZSBwb2xsZXIsIHRoZXJlIGlzIGF0IGxlYXN0CisgKiBvbmUgYmF0b24gaG9sZGVy
LiAgKCJub24tYXBwIiBtZWFucyBzaW1wbHkgIm5vdCBwb2xsZXJfYXBwIi4pCisgKgorICogTm8g
dGhyZWFkIG91dHNpZGUgbGlieGwgY2FuIGhhdmUgYW4gYWN0aXZlIG5vbi1hcHAgcG9sbGVyOiBw
b2xsZXJzCisgKiBhcmUgcHV0IG9uIHRoZSBhY3RpdmUgbGlzdCBieSBwb2xsZXJfZ2V0IHdoaWNo
IGlzIGNhbGxlZCBpbiB0aHJlZQorICogcGxhY2VzOiBsaWJ4bF9ldmVudF93YWl0LCB3aGljaCBw
dXRzIGl0IGJlZm9yZSByZXR1cm5pbmc7CisgKiBsaWJ4bF9fYW9fY3JlYXRlIGJ1dCBvbmx5IGlu
IHRoZSBzeW5jaHJvbm91cyBjYXNlLCBpbiB3aGljaCBjYXNlCisgKiB0aGUgcG9sbGVyIGlzIHB1
dCBiZWZvcmUgcmV0dXJuaW5nOyBhbmQgdGhlIHBvbGxlcl9hcHAsIGR1cmluZworICogaW5pdGlh
bGlzYXRpb24uCisgKgorICogU28gYW55IHRpbWUgd2hlbiBhbGwgbGlieGwgdGhyZWFkcyBhcmUg
YmxvY2tpbmcgKGFuZCB0aGVyZWZvcmUgZG8KKyAqIG5vdCBoYXZlIHRoZSBjdHggbG9jayksIHRo
ZSBub24tYXBwIGFjdGl2ZSBwb2xsZXJzIGJlbG9uZyB0byB0aG9zZQorICogdGhyZWFkcy4gIElm
IGF0IGxlYXN0IG9uZSBpcyBhIGJhdG9uIGhvbGRlciAodGhlIGludmFyaWFudCksIHRoYXQKKyAq
IHRocmVhZCBoYXMgYSBnb29kIGVub3VnaCBldmVudCBzZXQuCisgKgorICogTm93IHdlIHdpbGwg
ZGVtb25zdHJhdGUgdGhhdCB0aGUgImJhdG9uIGludmFyaWFudCIgaXMgbWFpbnRhaW5lZDoKKyAq
CisgKiBUaGUgcnVsZSBpcyB0aGF0IGFueSB0aHJlYWQgd2hpY2ggbWlnaHQgYmUgdGhlIGJhdG9u
IGhvbGRlciBpcworICogcmVzcG9uc2libGUgZm9yIGNoZWNraW5nIHRoYXQgdGhlcmUgY29udGlu
dWVzIHRvIGJlIGEgYmF0b24gaG9sZGVyCisgKiBhcyBuZWVkZWQuCisgKgorICogRmlyc3RseSwg
Y29uc2lkZXIgdGhlIGNhc2Ugd2hlbiB0aGUgYmF0b24gaG9sZGVycyAoYikgY2Vhc2UgdG8gYmUK
KyAqIGJhdG9uIGhvbGRlcnMgYmVjYXVzZSBvc2V2ZW50cyBhcmUgYWRkZWQuCisgKgorICogVGhl
cmUgYXJlIG9ubHkgdHdvIGtpbmRzIG9mIG9zZXZlbnRzOiB0aW1lb3V0cyBhbmQgZmRzLiAgRXZl
cnkKKyAqIG90aGVyIGludGVybmFsIGV2ZW50IHNvdXJjZSByZWR1Y2VzIHRvIG9uZSBvZiB0aGVz
ZSBldmVudHVhbGx5LgorICogQm90aCBvZiB0aGVzZSBjYXNlcyBhcmUgaGFuZGxlZCAoaW4gdGhl
IGNhc2Ugb2YgZmQgZXZlbnRzLCBhZGQgYW5kCisgKiBtb2RpZnksIHNlcGFyYXRlbHkpLCBjYWxs
aW5nIHBvbGxlcnNfbm90ZV9vc2V2ZW50X2FkZGVkLgorICoKKyAqIFRoaXMgd2Fsa3MgdGhlIHBv
bGxlcl9hY3RpdmUgbGlzdCwgbWFya2luZyB0aGUgYWN0aXZlIHBvbGxlcnMKKyAqIG9zZXZlbnRz
X2FkZGVkPTEuICBTdWNoIGEgcG9sbGVyIGNhbm5vdCBiZSB0aGUgYmF0b24gaG9sZGVyLiAgQnV0
CisgKiBwb2xsZXJzX25vdGVfb3NldmVudF9hZGRlZCBpcyBjYWxsZWQgb25seSBmcm9tIGV2Xyog
ZnVuY3Rpb25zLAorICogd2hpY2ggYXJlIG9ubHkgY2FsbGVkIGZyb20gZXZlbnQtY2hhaW4gbGli
eGwgY29kZTogaWUsIGNvZGUgd2l0aCBhbgorICogYW8gb3IgYW4gZWdjLiAgU28gYXQgdGhpcyBw
b2ludCB3ZSBhcmUgYSBiYXRvbiBob2xkZXIsIGFuZCB0aGVyZSBpcworICogc3RpbGwgYSBiYXRv
biBob2xkZXIuCisgKgorICogU2Vjb25kbHksIGNvbnNpZGVyIHRoZSBjYXNlIHdoZXJlIGJhdG9u
IGhvbGRlcnMgKGEpIGNlYXNlIHRvIGJlCisgKiBiYXR0b24gaG9sZGVycyBiZWNhdXNlIHRoZXkg
ZGlzcG9zZSBvZiB0aGVpciBlZ2Mgb3IgYW8uICBXZSBjYWxsCisgKiBsaWJ4bF9fZWdjX2FvX2Ns
ZWFudXBfMV9iYXRvbiBvbiBldmVyeSBleGl0IHBhdGguICBXZSBhcnJhbmdlIHRoYXQKKyAqIGV2
ZXJ5dGhpbmcgdGhhdCBkaXNwb3NlcyBvZiBhbiBlZ2Mgb3IgYW4gYW8gY2hlY2tzIHRoYXQgdGhl
cmUgaXMgYQorICogbmV3IGJhdG9uIGhvbGRlciBieSBjYWxsaW5nIGxpYnhsX19lZ2NfYW9fY2xl
YW51cF8xX2JhdG9uLgorICoKKyAqIFRoaXMgZnVuY3Rpb24gaGFuZGxlcyB0aGUgaW52YXJpYW50
IGV4cGxpY2l0bHk6IGlmIHdlIGhhdmUgYW55CisgKiBub24tYXBwIGFjdGl2ZSBwb2xsZXJzIGl0
IGxvb2tzIGZvciBvbmUgd2hpY2ggaXMgdXAgdG8gZGF0ZSAoYmF0b24KKyAqIGhvbGRlciBjYXRl
Z29yeSAoYikpLCBhbmQgZmFpbGluZyB0aGF0IGl0IHBpY2tzIGEgdmljdGltIHRvIHR1cm4KKyAq
IGludG8gdGhlIGJhdG9uIGhvbGRlciBjYXRlZ29yeSAoYykgYnkgd2FraW5nIGl0IHVwLiAgKENv
cnJlY3RuZXNzCisgKiBkZXBlbmRzIG9uIHRoaXMgZnVuY3Rpb24gbm90IHNwb3R0aW5nIGl0cyBv
d24gdGhyZWFkIGFzIHRoZQorICogYmF0b24taG9sZGVyLCBzaW5jZSBpdCBpcyBvbiBpdHMgd2F5
IHRvIG5vdCBiZWluZyB0aGUgYmF0b24taG9sZGVyLAorICogc28gaXQgbXVzdCBiZSBjYWxsZWQg
YWZ0ZXIgdGhlIHBvbGxlciBoYXMgYmVlbiBwdXQgYmFjay4pCisgKgorICogVGhpcmRseSwgd2Ug
bXVzdCBjb25zaWRlciB0aGUgY2FzZSAoYykuICBBIHRocmVhZCBpbiBjYXRlZ29yeSAoYykKKyAq
IHdpbGwgcmVlbnRlciBsaWJ4bCB3aGVuIGl0IGdhaW5zIHRoZSBsb2NrIGFuZCBuZWNlc3Nhcmls
eSB0aGVuCisgKiBiZWNvbWVzIGEgYmF0b24gaG9sZGVyIGluIGNhdGVnb3J5IChhKS4KKyAqCisg
KiBTbyB0aGUgImJhdG9uIGludmFyaWFudCIgaXMgbWFpbnRhaW5lZC4gIFFFRC4KKyAqLworc3Rh
dGljIHZvaWQgcG9sbGVyc19ub3RlX29zZXZlbnRfYWRkZWQobGlieGxfY3R4ICpjdHgpIHsKKyAg
ICBsaWJ4bF9fcG9sbGVyICpwb2xsZXI7CisgICAgTElCWExfTElTVF9GT1JFQUNIKHBvbGxlciwg
JmN0eC0+cG9sbGVyc19hY3RpdmUsIGFjdGl2ZV9lbnRyeSkKKyAgICAgICAgcG9sbGVyLT5vc2V2
ZW50c19hZGRlZCA9IDE7Cit9CisKK3ZvaWQgbGlieGxfX2VnY19hb19jbGVhbnVwXzFfYmF0b24o
bGlieGxfX2djICpnYykKKyAgICAvKiBBbnkgcG9sbGVyIHdlIGhhZCBtdXN0IGhhdmUgYmVlbiBg
cHV0JyBhbHJlYWR5LiAqLworeworICAgIGxpYnhsX19wb2xsZXIgKnNlYXJjaCwgKndha2U9MDsK
KworICAgIExJQlhMX0xJU1RfRk9SRUFDSChzZWFyY2gsICZDVFgtPnBvbGxlcnNfYWN0aXZlLCBh
Y3RpdmVfZW50cnkpIHsKKyAgICAgICAgaWYgKHNlYXJjaCA9PSBDVFgtPnBvbGxlcl9hcHApCisg
ICAgICAgICAgICAvKiBUaGlzIG9uZSBpcyBzcGVjaWFsLiAgV2UgY2FuJ3QgZ2l2ZSBpdCB0aGUg
YmF0b24uICovCisgICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgaWYgKCFzZWFyY2gtPm9z
ZXZlbnRzX2FkZGVkKQorICAgICAgICAgICAgLyogVGhpcyBwb2xsZXIgaXMgdXAgdG8gZGF0ZSBh
bmQgd2lsbCB3YWtlIHVwIGFzIG5lZWRlZC4gKi8KKyAgICAgICAgICAgIHJldHVybjsKKyAgICAg
ICAgaWYgKCF3YWtlKQorICAgICAgICAgICAgd2FrZSA9IHNlYXJjaDsKKyAgICB9CisKKyAgICBp
ZiAoIXdha2UpCisgICAgICAgIC8qIG5vLW9uZSBpbiBsaWJ4bCB3YWl0aW5nIGZvciBhbnkgZXZl
bnRzICovCisgICAgICAgIHJldHVybjsKKworICAgIGxpYnhsX19wb2xsZXJfd2FrZXVwKGdjLCB3
YWtlKTsKKworICAgIHdha2UtPm9zZXZlbnRzX2FkZGVkID0gMDsKKyAgICAvKiBUaGlzIHNlcnZl
cyB0byBtYWtlIF8xX2JhdG9uIGlkZW1wb3RlbnQuICBJdCBpcyBPSyBldmVuIHRob3VnaAorICAg
ICAqIHRoYXQgcG9sbGVyIG1heSBjdXJyZW50bHkgYmUgc2xlZXBpbmcgb24gb25seSBvbGQgb3Nl
dmVudHMsCisgICAgICogYmVjYXVzZSBpdCBpcyBnb2luZyB0byB3YWtlIHVwIGJlY2F1c2Ugd2Un
dmUganVzdCBwcm9kZGVkIGl0LAorICAgICAqIGFuZCBpdCBwaWNrIHVwIG5ldyBvc2V2ZW50cyBv
biBpdHMgbmV4dCBpdGVyYXRpb24gKG9yIHBhc3MKKyAgICAgKiBvbiB0aGUgYmF0b24pLiAqLwor
fQorCisvKgogICogVGhlIGNvdW50ZXIgb3NldmVudF9pbl9ob29rIGlzIHVzZWQgdG8gZW5zdXJl
IHRoYXQgdGhlIGFwcGxpY2F0aW9uCiAgKiBob25vdXJzIHRoZSByZWVudHJhbmN5IHJlc3RyaWN0
aW9uIGRvY3VtZW50ZWQgaW4gbGlieGxfZXZlbnQuaC4KICAqCkBAIC0xOTQsNiArMzI4LDcgQEAg
aW50IGxpYnhsX19ldl9mZF9yZWdpc3RlcihsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fZXZfZmQgKmV2
LAogICAgIGV2LT5mdW5jID0gZnVuYzsKIAogICAgIExJQlhMX0xJU1RfSU5TRVJUX0hFQUQoJkNU
WC0+ZWZkcywgZXYsIGVudHJ5KTsKKyAgICBwb2xsZXJzX25vdGVfb3NldmVudF9hZGRlZChDVFgp
OwogCiAgICAgcmMgPSAwOwogCkBAIC0yMTQsNiArMzQ5LDggQEAgaW50IGxpYnhsX19ldl9mZF9t
b2RpZnkobGlieGxfX2djICpnYywgbGlieGxfX2V2X2ZkICpldiwgc2hvcnQgZXZlbnRzKQogICAg
IHJjID0gT1NFVkVOVF9IT09LKGZkLG1vZGlmeSwgbm9vcCwgZXYtPmZkLCAmZXYtPm5leHVzLT5m
b3JfYXBwX3JlZywgZXZlbnRzKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCisgICAgaWYgKChl
dmVudHMgJiB+ZXYtPmV2ZW50cykpCisgICAgICAgIHBvbGxlcnNfbm90ZV9vc2V2ZW50X2FkZGVk
KENUWCk7CiAgICAgZXYtPmV2ZW50cyA9IGV2ZW50czsKIAogICAgIHJjID0gMDsKQEAgLTMxNSw2
ICs0NTIsNyBAQCBzdGF0aWMgaW50IHRpbWVfcmVnaXN0ZXJfZmluaXRlKGxpYnhsX19nYyAqZ2Ms
IGxpYnhsX19ldl90aW1lICpldiwKICAgICBMSUJYTF9UQUlMUV9JTlNFUlRfU09SVEVEKCZDVFgt
PmV0aW1lcywgZW50cnksIGV2LCBldnNlYXJjaCwgLyplbXB0eSovLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGltZXJjbXAoJmV2LT5hYnMsICZldnNlYXJjaC0+YWJzLCA+KSk7CiAK
KyAgICBwb2xsZXJzX25vdGVfb3NldmVudF9hZGRlZChDVFgpOwogICAgIHJldHVybiAwOwogfQog
CkBAIC0xMTIxLDYgKzEyNTksNyBAQCBzdGF0aWMgaW50IGJlZm9yZXBvbGxfaW50ZXJuYWwobGli
eGxfX2djICpnYywgbGlieGxfX3BvbGxlciAqcG9sbGVyLAogICAgICpuZmRzX2lvID0gdXNlZDsK
IAogICAgIHBvbGxlci0+ZmRzX2RlcmVnaXN0ZXJlZCA9IDA7CisgICAgcG9sbGVyLT5vc2V2ZW50
c19hZGRlZCA9IDA7CiAKICAgICBsaWJ4bF9fZXZfdGltZSAqZXRpbWUgPSBMSUJYTF9UQUlMUV9G
SVJTVCgmQ1RYLT5ldGltZXMpOwogICAgIGlmIChldGltZSkgewpAQCAtMTQ0Miw3ICsxNTgxLDcg
QEAgc3RhdGljIHZvaWQgZWdjX3J1bl9jYWxsYmFja3MobGlieGxfX2VnYyAqZWdjKQogICAgIH0K
IH0KIAotdm9pZCBsaWJ4bF9fZWdjX2NsZWFudXAobGlieGxfX2VnYyAqZWdjKQordm9pZCBsaWJ4
bF9fZWdjX2NsZWFudXBfMl91bF9jYl9nYyhsaWJ4bF9fZWdjICplZ2MpCiB7CiAgICAgRUdDX0dD
OwogICAgIGVnY19ydW5fY2FsbGJhY2tzKGVnYyk7CkBAIC0xNzUyLDEzICsxODkxLDE1IEBAIGlu
dCBsaWJ4bF9ldmVudF93YWl0KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9ldmVudCAqKmV2ZW50X3Is
CiAgICAgICAgIHJjID0gZXZlbnRsb29wX2l0ZXJhdGlvbihlZ2MsIHBvbGxlcik7CiAgICAgICAg
IGlmIChyYykgZ290byBvdXQ7CiAKLSAgICAgICAgLyogd2UgdW5sb2NrIGFuZCBjbGVhbnVwIHRo
ZSBlZ2MgZWFjaCB0aW1lIHdlIGdvIHRocm91Z2ggdGhpcyBsb29wLAotICAgICAgICAgKiBzbyB0
aGF0IChhKSB3ZSBkb24ndCBhY2N1bXVsYXRlIGdhcmJhZ2UgYW5kIChiKSBhbnkgZXZlbnRzCi0g
ICAgICAgICAqIHdoaWNoIGFyZSB0byBiZSBkaXNwYXRjaGVkIGJ5IGNhbGxiYWNrIGFyZSBhY3R1
YWxseSBkZWxpdmVyZWQKLSAgICAgICAgICogaW4gYSB0aW1lbHkgZmFzaGlvbi4KKyAgICAgICAg
Lyogd2UgdW5sb2NrIGFuZCBjbGVhbnVwIHRoZSBlZ2MgZWFjaCB0aW1lIHdlIGdvIHRocm91Z2gg
dGhpcworICAgICAgICAgKiBsb29wLCBzbyB0aGF0IChhKSB3ZSBkb24ndCBhY2N1bXVsYXRlIGdh
cmJhZ2UgYW5kIChiKSBhbnkKKyAgICAgICAgICogZXZlbnRzIHdoaWNoIGFyZSB0byBiZSBkaXNw
YXRjaGVkIGJ5IGNhbGxiYWNrIGFyZSBhY3R1YWxseQorICAgICAgICAgKiBkZWxpdmVyZWQgaW4g
YSB0aW1lbHkgZmFzaGlvbi4gIF8xX2JhdG9uIHdpbGwgYmUKKyAgICAgICAgICogY2FsbGVkIHRv
IHBhc3MgdGhlIGJhdG9uIGlmZiB3ZSBhY3R1YWxseSBsZWF2ZTsgb3RoZXJ3aXNlCisgICAgICAg
ICAqIHdlIGFyZSBzdGlsbCBjYXJyeWluZyBpdC4KICAgICAgICAgICovCiAgICAgICAgIENUWF9V
TkxPQ0s7Ci0gICAgICAgIGxpYnhsX19lZ2NfY2xlYW51cChlZ2MpOworICAgICAgICBsaWJ4bF9f
ZWdjX2NsZWFudXBfMl91bF9jYl9nYyhlZ2MpOwogICAgICAgICBDVFhfTE9DSzsKICAgICB9CiAK
QEAgLTIwMzEsMTQgKzIxNzIsMjQgQEAgaW50IGxpYnhsX19hb19pbnByb2dyZXNzKGxpYnhsX19h
byAqYW8sCiAgICAgICAgICAgICAgICAgICogc3luY2hyb25vdXMgY2FuY2VsbGF0aW9uIGFiaWxp
dHkuICovCiAgICAgICAgICAgICB9CiAKKyAgICAgICAgICAgIC8qIFRoZSBjYWxsIHRvIGVnYy4u
MV9iYXRvbiBpcyBiZWxvdywgb25seSBpZiB3ZSBhcmUgbGVhdmluZy4gKi8KICAgICAgICAgICAg
IENUWF9VTkxPQ0s7Ci0gICAgICAgICAgICBsaWJ4bF9fZWdjX2NsZWFudXAoJmVnYyk7CisgICAg
ICAgICAgICBsaWJ4bF9fZWdjX2NsZWFudXBfMl91bF9jYl9nYygmZWdjKTsKICAgICAgICAgICAg
IENUWF9MT0NLOwogICAgICAgICB9CisKKyAgICAgICAgLyogRGlzcG9zZSBvZiB0aGlzIGVhcmx5
IHNvIGxpYnhsX19lZ2NfYW9fY2xlYW51cF8xX2JhdG9uCisgICAgICAgICAqIGRvZXNuJ3QgbWlz
dGFrZSB1cyBmb3IgYSBiYXRvbi1ob2xkZXIuICBOby1vbmUgbXVjaCBpcworICAgICAgICAgKiBn
b2luZyB0byBsb29rIGF0IHRoaXMgYW8gbm93IHNvIHNldHRpbmcgdGhpcyB0byAwIGlzIGZpbmUu
CisgICAgICAgICAqIFdlIGNhbid0IGNhbGwgX2JhdG9uIGJlbG93IF9sZWF2ZSBiZWNhdXNlIF9s
ZWF2ZSBkZXN0cm95cworICAgICAgICAgKiBvdXIgZ2MsIHdoaWNoIF9iYXRvbiBuZWVkcy4gKi8K
KyAgICAgICAgbGlieGxfX3BvbGxlcl9wdXQoQ1RYLCBhby0+cG9sbGVyKTsKKyAgICAgICAgYW8t
PnBvbGxlciA9IDA7CiAgICAgfSBlbHNlIHsKICAgICAgICAgcmMgPSAwOwogICAgIH0KIAorICAg
IGxpYnhsX19lZ2NfYW9fY2xlYW51cF8xX2JhdG9uKGdjKTsKICAgICBhby0+aW5faW5pdGlhdG9y
ID0gMDsKICAgICBhb19fbWFuaXBfbGVhdmUoQ1RYLCBhbyk7CiAKQEAgLTIwNTEsNiArMjIwMiw5
IEBAIGludCBsaWJ4bF9fYW9faW5wcm9ncmVzcyhsaWJ4bF9fYW8gKmFvLAogc3RhdGljIGludCBh
b19fYWJvcnQobGlieGxfY3R4ICpjdHgsIGxpYnhsX19hbyAqcGFyZW50KQogLyogVGVtcG9yYXJp
bHkgdW5sb2NrcyBjdHgsIHdoaWNoIG11c3QgYmUgbG9ja2VkIGV4YWN0bHkgb25jZSBvbiBlbnRy
eS4gKi8KIHsKKyAgICBsaWJ4bF9fZWdjIGVnYzsKKyAgICBMSUJYTF9JTklUX0VHQyhlZ2MsY3R4
KTsKKwogICAgIGludCByYzsKICAgICBhb19fbWFuaXBfZW50ZXIocGFyZW50KTsKIApAQCAtMjA3
MSw5ICsyMjI1LDYgQEAgc3RhdGljIGludCBhb19fYWJvcnQobGlieGxfY3R4ICpjdHgsIGxpYnhs
X19hbyAqcGFyZW50KQogCiAgICAgLyogV2Uga2VlcCBjYWxsaW5nIGFib3J0IGhvb2tzIHVudGls
IHRoZXJlIGFyZSBub25lIGxlZnQgKi8KICAgICB3aGlsZSAoIUxJQlhMX0xJU1RfRU1QVFkoJnBh
cmVudC0+YWJvcnRhYmxlcykpIHsKLSAgICAgICAgbGlieGxfX2VnYyBlZ2M7Ci0gICAgICAgIExJ
QlhMX0lOSVRfRUdDKGVnYyxjdHgpOwotCiAgICAgICAgIGFzc2VydCghcGFyZW50LT5jb21wbGV0
ZSk7CiAKICAgICAgICAgbGlieGxfX2FvX2Fib3J0YWJsZSAqYWJydCA9IExJQlhMX0xJU1RfRklS
U1QoJnBhcmVudC0+YWJvcnRhYmxlcyk7CkBAIC0yMDg2LDE1ICsyMjM3LDIwIEBAIHN0YXRpYyBp
bnQgYW9fX2Fib3J0KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9fYW8gKnBhcmVudCkKICAgICAgICAg
ICAgICAgICAgICAiYW8gJXA6IGFicnQ9JXA6IGFib3J0aW5nIiwgcGFyZW50LCBhYnJ0LT5hbyk7
CiAgICAgICAgIGFicnQtPmNhbGxiYWNrKCZlZ2MsIGFicnQsIEVSUk9SX0FCT1JURUQpOwogCisg
ICAgICAgIC8qIFRoZSBjYWxsIHRvIGVnYy4uMV9iYXRvbiBpcyBpbiB0aGUgb3V0IGJsb2NrIGJl
bG93LiAqLwogICAgICAgICBsaWJ4bF9fY3R4X3VubG9jayhjdHgpOwotICAgICAgICBsaWJ4bF9f
ZWdjX2NsZWFudXAoJmVnYyk7CisgICAgICAgIGxpYnhsX19lZ2NfY2xlYW51cF8yX3VsX2NiX2dj
KCZlZ2MpOwogICAgICAgICBsaWJ4bF9fY3R4X2xvY2soY3R4KTsKICAgICB9CiAKICAgICByYyA9
IDA7CiAKICBvdXQ6CisgICAgbGlieGxfX2VnY19hb19jbGVhbnVwXzFfYmF0b24oJmVnYy5nYyk7
CiAgICAgYW9fX21hbmlwX2xlYXZlKGN0eCwgcGFyZW50KTsKKyAgICAvKiBUaGUgY2FsbCB0byBl
Z2MuLjJfdWxfY2JfZ2MgaXMgYWJvdmUuICBUaGlzIGlzIHN1ZmZpY2llbnQKKyAgICAgKiBiZWNh
dXNlIG9ubHkgY29kZSBpbnNpZGUgdGhlIGxvb3AgYWRkcyBhbnl0aGluZyB0byB0aGUgZWdjLCBh
bmQKKyAgICAgKiB3ZSBlbnN1cmVzIHRoYXQgdGhlIGVnYyBpcyBjbGVhbiB3aGVuIHdlIGxlYXZl
IHRoZSBsb29wLiAqLwogICAgIHJldHVybiByYzsKIH0KIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXgg
YjY4YWIyMThiNi4uZWVjNGJmNzY3ZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50
ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC02MzQsOSArNjM0
LDIzIEBAIHN0cnVjdCBsaWJ4bF9fcG9sbGVyIHsKICAgICAgKiBldmVudCBpcyBkZXJlZ2lzdGVy
ZWQsIHdlIHNldCB0aGUgZmRzX2RlcmVnaXN0ZXJlZCBvZiBhbGwgbm9uLWlkbGUKICAgICAgKiBw
b2xsZXJzLiAgU28gYWZ0ZXJwb2xsIGNhbiB0ZWxsIHdoZXRoZXIgYW55IFBPTExOVkFMIGlzCiAg
ICAgICogcGxhdXNpYmx5IGR1ZSB0byBhbiBmZCBiZWluZyBjbG9zZWQgYW5kIHJlb3BlbmVkLgor
ICAgICAqCisgICAgICogQWRkaXRpb25hbGx5LCB3ZSByZWNvcmQgd2hldGhlciBhbnkgZmQgb3Ig
dGltZSBldmVudCBzb3VyY2VzCisgICAgICogaGF2ZSBiZWVuIHJlZ2lzdGVyZWQuICBUaGlzIGlz
IG5lY2Vzc2FyeSBiZWNhdXNlIHNvbWV0aW1lcyB3ZQorICAgICAqIG5lZWQgdG8gd2FrZSB1cCB0
aGUgb25seSBsaWJ4bCB0aHJlYWQgc3R1Y2sgaW4KKyAgICAgKiBldmVudGxvb3BfaXRlcmF0aW9u
IHNvIHRoYXQgaXQgd2lsbCBwaWNrIHVwIG5ldyBmZHMgb3IgZWFybGllcgorICAgICAqIHRpbWVv
dXRzLiAgb3NldmVudHNfYWRkZWQgaXMgY2xlYXJlZCBieSBiZWZvcmVwb2xsLCBhbmQgc2V0IGJ5
CisgICAgICogZmQgb3IgdGltZW91dCBldmVudCByZWdpc3RyYXRpb24uICBXaGVuIHdlIGFyZSBh
Ym91dCB0byBsZWF2ZQorICAgICAqIGxpYnhsIChzdHJpY3RseSwgd2hlbiB3ZSBhcmUgYWJvdXQg
dG8gZ2l2ZSB1cCBhbiBlZ2MpLCB3ZSBjaGVjaworICAgICAqIHdoZXRoZXIgdGhlcmUgYXJlIGFu
eSBwb2xsZXJzLiAgSWYgdGhlcmUgYXJlLCB0aGVuIGF0IGxlYXN0IG9uZQorICAgICAqIG9mIHRo
ZW0gbXVzdCBoYXZlIG9zZXZlbnRzX2FkZGVkIGNsZWFyLiAgSWYgbm90LCB3ZSB3YWtlIHVwIHRo
ZQorICAgICAqIGZpcnN0IG9uZSBvbiB0aGUgbGlzdC4gIEFueSBlbnRyeSBvbiBwb2xsZXJzX2Fj
dGl2ZSBjb25zdGl0dXRlcworICAgICAqIGEgcHJvbWlzZSB0byBhbHNvIG1ha2UgdGhpcyBjaGVj
aywgc28gdGhlIGJhdG9uIHdpbGwgbmV2ZXIgYmUKKyAgICAgKiBkcm9wcGVkLgogICAgICAqLwog
ICAgIExJQlhMX0xJU1RfRU5UUlkobGlieGxfX3BvbGxlcikgYWN0aXZlX2VudHJ5OwogICAgIGJv
b2wgZmRzX2RlcmVnaXN0ZXJlZDsKKyAgICBib29sIG9zZXZlbnRzX2FkZGVkOwogfTsKIAogc3Ry
dWN0IGxpYnhsX19nYyB7CkBAIC0yMzUwLDcgKzIzNjQsMTAgQEAgX2hpZGRlbiBsaWJ4bF9kZXZp
Y2VfbW9kZWxfdmVyc2lvbiBsaWJ4bF9fZGVmYXVsdF9kZXZpY2VfbW9kZWwobGlieGxfX2djICpn
Yyk7CiAgICAgICAgIExJQlhMX1NUQUlMUV9JTklUKCYoZWdjKS5ldl9pbW1lZGlhdGVzKTsgICAg
ICAgIFwKICAgICB9IHdoaWxlKDApCiAKLV9oaWRkZW4gdm9pZCBsaWJ4bF9fZWdjX2NsZWFudXAo
bGlieGxfX2VnYyAqZWdjKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9fZWdjX2FvX2NsZWFudXBfMV9i
YXRvbihsaWJ4bF9fZ2MgKmdjKTsKKyAgLyogUGFzc2VzIHRoZSBiYXRvbiBmb3IgYWRkZWQgb3Nl
dmVudHMuICBTZWUgY29tbWVudCBmb3IKKyAgICogb3NldmVudHNfYWRkZWQgaW4gc3RydWN0IGxp
YnhsX19wb2xsZXIuICovCitfaGlkZGVuIHZvaWQgbGlieGxfX2VnY19jbGVhbnVwXzJfdWxfY2Jf
Z2MobGlieGxfX2VnYyAqZWdjKTsKICAgLyogRnJlZXMgbWVtb3J5IGFsbG9jYXRlZCB3aXRoaW4g
dGhpcyBlZ2MncyBnYywgYW5kIGFuZCByZXBvcnQgYWxsCiAgICAqIG9jY3VycmVkIGV2ZW50cyB2
aWEgY2FsbGJhY2ssIGlmIGFwcGxpY2FibGUuICBNYXkgcmVlbnRlciB0aGUKICAgICogYXBwbGlj
YXRpb247IHNlZSByZXN0cmljdGlvbnMgYWJvdmUuICBUaGUgY3R4IG11c3QgYmUgVU5MT0NLRUQu
ICovCkBAIC0yMzYxLDkgKzIzNzgsMTEgQEAgX2hpZGRlbiB2b2lkIGxpYnhsX19lZ2NfY2xlYW51
cChsaWJ4bF9fZWdjICplZ2MpOwogICAgIGxpYnhsX19lZ2MgZWdjWzFdOyBMSUJYTF9JTklUX0VH
QyhlZ2NbMF0sY3R4KTsgICAgICBcCiAgICAgRUdDX0dDCiAKLSNkZWZpbmUgRUdDX0ZSRUUgICAg
ICAgICAgIGxpYnhsX19lZ2NfY2xlYW51cChlZ2MpCi0KLSNkZWZpbmUgQ1RYX1VOTE9DS19FR0Nf
RlJFRSAgZG97IENUWF9VTkxPQ0s7IEVHQ19GUkVFOyB9d2hpbGUoMCkKKyNkZWZpbmUgQ1RYX1VO
TE9DS19FR0NfRlJFRSAgZG97ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBsaWJ4
bF9fZWdjX2FvX2NsZWFudXBfMV9iYXRvbigmZWdjLT5nYyk7ICAgICAgICBcCisgICAgICAgIENU
WF9VTkxPQ0s7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAg
bGlieGxfX2VnY19jbGVhbnVwXzJfdWxfY2JfZ2MoZWdjKTsgICAgICAgICAgICAgXAorICAgIH13
aGlsZSgwKQogCiAKIC8qCkBAIC0yNDY4LDggKzI0ODcsOSBAQCBfaGlkZGVuIHZvaWQgbGlieGxf
X2VnY19jbGVhbnVwKGxpYnhsX19lZ2MgKmVnYyk7CiAKICNkZWZpbmUgQU9fSU5QUk9HUkVTUyAo
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIGxpYnhs
X2N0eCAqYW9fX2N0eCA9IGxpYnhsX19nY19vd25lcigmYW8tPmdjKTsgICAgICAgICAgXAorICAg
ICAgICAvKiBfX2FvX2lucHJvZ3Jlc3Mgd2lsbCBkbyBlZ2MuLjFfYmF0b24gaWYgbmVlZGVkICov
CVwKICAgICAgICAgQ1RYX1VOTE9DSzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCi0gICAgICAgIEVHQ19GUkVFOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBsaWJ4bF9fZWdjX2NsZWFudXBfMl91bF9j
Yl9nYyhlZ2MpOyAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgQ1RYX0xPQ0s7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIGludCBh
b19fcmMgPSBsaWJ4bF9fYW9faW5wcm9ncmVzcyhhbywgICAgICAgICAgICAgICAgICAgXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fRklMRV9fLCBfX0xJTkVfXywgX19mdW5jX18p
OyAgIFwKQEAgLTI0ODEsOCArMjUwMSw5IEBAIF9oaWRkZW4gdm9pZCBsaWJ4bF9fZWdjX2NsZWFu
dXAobGlieGxfX2VnYyAqZWdjKTsKICAgICAgICAgbGlieGxfY3R4ICphb19fY3R4ID0gbGlieGxf
X2djX293bmVyKCZhby0+Z2MpOyAgICAgICAgICBcCiAgICAgICAgIGFzc2VydChyYyk7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICBsaWJ4bF9f
YW9fY3JlYXRlX2ZhaWwoYW8pOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAg
ICAgbGlieGxfX2VnY19hb19jbGVhbnVwXzFfYmF0b24oJmVnYy0+Z2MpOyAgICAgICAgICAgICAg
ICBcCiAgICAgICAgIGxpYnhsX19jdHhfdW5sb2NrKGFvX19jdHgpOyAvKiBnYyBpcyBub3cgaW52
YWxpZCAqLyAgICAgXAotICAgICAgICBFR0NfRlJFRTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgbGlieGxfX2VnY19jbGVhbnVwXzJfdWxf
Y2JfZ2MoZWdjKTsgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIChyYyk7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIH0pCiAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
