Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAD615BDB7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 12:36:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2CkC-0006Xb-38; Thu, 13 Feb 2020 11:33:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2CkA-0006XU-OI
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:33:18 +0000
X-Inumbo-ID: a1070064-4e54-11ea-bc8e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1070064-4e54-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581593598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f0i7TB3UZJwx/eyDuGora1qwgmdeB3oysqK5f0G475M=;
 b=MmHWoAXrCypjKInnie2ajtJiGuyxFrYxawNbudeis3oEt5LTqjRh//k8
 H8uS5ATcMZxhmWCkMXjzhxJi6mj2nhiD6qyQ+CUJ/GndgaYANsaADWcKy
 H9kcXKHXwnYTq/1IYKhIxlcITXpnqdPL6CHIvyKdpwzg+kkdNzVNqIphc E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ue6o12idE16AFHiBq8p8GfgI35TMs5LT6GfyQEXkzpR57+N9K+IC/VRxhQhFqBpoRmRRucLAa3
 bjLVAEMpLVEAX9gbptGfqJwwwGoI+fP2u1rDr9/DfRJJyNndeyim4GfrQQ6q5LVEbfy/tK/2pz
 8Y2W8VRfnniZTMLCtaHCzE+2s0dNfT2n3nLzUiFi1yp5cn+SGRJAes2Ck5JqrS+44b3JsIIdIw
 uacpnb5pgXNaTKPnpMD5eWHgj4r/ImI9O6OgGbG8M9fjWGMFLK0xN7AQA1RhmW/Tb9W/0xlJtx
 bIc=
X-SBRS: 2.7
X-MesageID: 12566477
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12566477"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 12:32:35 +0100
Message-ID: <20200213113237.58795-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] smp: convert cpu_add_remove_lock int a rw
 lock
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgbWFpbiBhaW0gb2YgdGhpcyBzZXJpZXMgaXMgdG8gcmVkdWNlIHRoZSBwcmVz
c3VyZSBhcm91bmQKY3B1X2FkZF9yZW1vdmVfbG9jayBieSBjb252ZXJ0aW5nIGl0IGludG8gYSBy
dyBsb2NrLiBNb3N0IHVzZXJzIG9mIHRoZQpsb2NrIHdhbnQgdG8gdGFrZSBpdCBpbiByZWFkIG1v
ZGUsIGFzIHRoZXkgb25seSBjYXJlIGFib3V0IHRoZSBtYXBzIG5vdApjaGFuZ2luZy4KClBhdGNo
ICMyIG1ha2VzIHRoZSB3cml0ZXJzIHRha2UgdGhlIGxvY2sgaW4gYmxvY2tpbmcgbW9kZSwgdGhp
cyBpcwptYWlubHkgZG9uZSB0byByZWR1Y2UgdGhlIGZhaWx1cmUgb2YgdGhlIENQVSBwbHVnL3Vu
cGx1ZyBvcGVyYXRpb25zLApzaW5jZSB0aGUgbG9jayBpcyBtb3JlIGNvbnRlbmRlZCBub3cgYW5k
IHRyeWxvY2sgY2FuIGVhc2lseSBmYWlsIGlmCnRoZXJlIGFyZSByZWFkZXJzLgoKVGhhbmtzLCBS
b2dlci4KClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgc21wOiBjb252ZXJ0IHRoZSBjcHUgbWFwcyBs
b2NrIGludG8gYSBydyBsb2NrCiAgc21wOiBjb252ZXJ0IGNwdV9ob3RwbHVnX2JlZ2luIGludG8g
YSBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uCgogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8ICAz
ICstLQogeGVuL2NvbW1vbi9jcHUuYyAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vY3B1LmggIHwgMTMgKysrLS0tLS0tLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
