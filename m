Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FE1312CC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 14:29:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioSOk-0005dr-Vo; Mon, 06 Jan 2020 13:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioSOj-0005d7-Nu
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 13:26:21 +0000
X-Inumbo-ID: 1e7763a8-3088-11ea-ab05-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e7763a8-3088-11ea-ab05-12813bfff9fa;
 Mon, 06 Jan 2020 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578317178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCyEfPOFjCrTqTXFF6h3hqdw8I3qGXNBZIcXHYkdNDI=;
 b=UOectS0Xp+IYNlT1Tul6uHCdDYQZYvXkuBT6xWnv9xR/t4frEnD6uBjS
 L2Ro3U6GVc8uxBkaHkX7308MhBqTOGaG9PixYLDkmwLEdEuNzzL7D2gwh
 qHQHS2Tay9xDWj9cC35F8uYyokeJeD7xBzWg2gpnCU9fAfyXl4BK08t1C c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w4PMUsjVeUZgZZSDGHgPR6TNw4Y1trp/iiNVVL1uGjcfspr1NTYazFS+7y4TtwUipyx8kwAbat
 2I38wUdFO6ekPKeUXgdABd9c9DV/MQ9r9LFBmHuhJuEtojGHEI+SCYmU/4MiNyiKNF/HujzRBE
 qV+BAK4fYAB3+qnSy28nPn5WTlmAc0NQQTUPqdCnYiuffgKdDkrQUAXDG5MPfG/s7odMjapeHw
 zyG8h0D/wVcDNcdhPQcsNzNDSz0SopmGzqrIfJtNAyKTB5nhYNSgXVjUyfTxnOvT0l6ypC0QC4
 IJQ=
X-SBRS: 2.7
X-MesageID: 10647200
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10647200"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 13:26:14 +0000
Message-ID: <20200106132614.25583-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/smpboot: Use printk_once() rather than
 opencoding it
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2hyaW5rIHRoZSB0ZXh0IHRvIGJlIGxlc3MgdmVyYm9zZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9zbXBib290
LmMgfCAxMyArKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCmluZGV4IGE3ZTcwMTMwOTcuLjdlMjk3MDQwODAgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpA
QCAtMTI5MSwxNCArMTI5MSwxMSBAQCBpbnQgY3B1X2FkZCh1aW50MzJfdCBhcGljX2lkLCB1aW50
MzJfdCBhY3BpX2lkLCB1aW50MzJfdCBweG0pCiAgICAgLyogUGh5c2ljYWxseSBhZGRlZCBDUFVz
IGRvIG5vdCBoYXZlIHN5bmNocm9uaXNlZCBUU0MuICovCiAgICAgaWYgKCBib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfVFNDX1JFTElBQkxFKSApCiAgICAgewotICAgICAgICBzdGF0aWMgYm9vbCBv
bmNlX29ubHk7Ci0KLSAgICAgICAgaWYgKCAhdGVzdF9hbmRfc2V0X2Jvb2wob25jZV9vbmx5KSAp
Ci0gICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcKLSAgICAgICAgICAgICAgICAgICAi
ICoqIE5ldyBwaHlzaWNhbCBDUFUgJXUgbWF5IGhhdmUgc2tld2VkIFRTQyBhbmQgaGVuY2UgIgot
ICAgICAgICAgICAgICAgICAgICJicmVhayBhc3N1bWVkIGNyb3NzLUNQVSBUU0MgY29oZXJlbmN5
LlxuIgotICAgICAgICAgICAgICAgICAgICIgKiogQ29uc2lkZXIgdXNpbmcgYm9vdCBwYXJhbWV0
ZXIgXCJ0c2M9c2tld2VkXCIgIgotICAgICAgICAgICAgICAgICAgICJ3aGljaCBmb3JjZXMgVFND
IGVtdWxhdGlvbiB3aGVyZSBhcHByb3ByaWF0ZS5cbiIsIGNwdSk7CisgICAgICAgIHByaW50a19v
bmNlKAorICAgICAgICAgICAgWEVOTE9HX1dBUk5JTkcKKyAgICAgICAgICAgICJOZXcgQ1BVICV1
IG1heSBoYXZlIHNrZXdlZCBUU0MgYW5kIGJyZWFrIGNyb3NzLUNQVSBUU0MgY29oZXJlbmN5XG4i
CisgICAgICAgICAgICAiQ29uc2lkZXIgdXNpbmcgXCJ0c2M9c2tld2VkXCIgdG8gZm9yY2UgZW11
bGF0aW9uIHdoZXJlIGFwcHJvcHJpYXRlXG4iLAorICAgICAgICAgICAgY3B1KTsKICAgICAgICAg
Y3B1bWFza19zZXRfY3B1KGNwdSwgJnRzY19zeW5jX2NwdV9tYXNrKTsKICAgICB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
