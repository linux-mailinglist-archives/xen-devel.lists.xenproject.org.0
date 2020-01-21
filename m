Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56E143ED7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itu4a-0008PZ-8L; Tue, 21 Jan 2020 14:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cram=3K=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itu4Y-0008KW-M9
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:00:02 +0000
X-Inumbo-ID: 4c48d60c-3c56-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c48d60c-3c56-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579615193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWPHd+gFksQ+RfViBKMLTOw1lLSHpXqkV5OJYt/ukw8=;
 b=AMrmuOQ+6iWFsPQhS7zjFKcU1i54HlQ6AHqjQZFhvWsc5dsD23ohwbRA
 JafJRJpv7HKg8Ow9eiAtwU922XESBbajUdvDEwJiEPPgzY2prQsUtP44Y
 tzdErCFi0hxmH8eSDkOBwUYL3pFYVikj2sSKznmYy4rjMup3D4kX+1AIT g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lDgqW8EO3HL3Hjktz3xwyd1Ybo+f7BEP5nKGLkVTp3m7rfR6QPJxVSwNWpbLNjlw00cNvT+b+a
 uytkCW4yQcQEULPXLuEy+xRx4yGbBDObyHJkmm8S/QIgFFxrxdjgMG5LPO5K2EfqEMTJHlTt4h
 KggGPmS0f5/fOoy7RJxlJgU0Mo9YkXzc32YvSPf0aIPT5PDbbJ4ZNoQAwc+Q1ctpWSWv33i28Z
 0hkC+qogf7XjyAUTzVzTWG5KjPKdCxi6A2zPhM8f809uffpYLU6JoKv4iZ1a6A4JU4HezB0VU/
 E3U=
X-SBRS: 2.7
X-MesageID: 11799415
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11799415"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 13:59:16 +0000
Message-ID: <20200121135916.1140483-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2.1 15/12] squash! xen/build: have the root
 Makefile generates the CFLAGS
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhFTl9CVUlMRF9FRkkgdGVzdHMgaW4gYXJjaC94ODYvTWFrZWZpbGUgd2FzIGZpbHRlcmlu
ZyBvdXQKQ0ZMQUdTLXksIGJ1dCBhY2NvcmRpbmcgdG8gZGQ0MDE3N2MxYmM4ICgieDg2LTY0L0VG
STogYWRkIENGTEFHUyB0bwpjaGVjayBjb21waWxlIiksIGl0IHdhcyBkb25lIHRvIGZpbHRlciBv
dXQgLU1GLiBYRU5fQ0ZMQUdTIGRvZXNuJ3QKaGF2ZSB0aG9zZSBmbGFncyBhbnltb3JlLCBzbyBu
byBmaWx0ZXJpbmcgaXMgbmVlZGVkLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L01ha2VmaWxlIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCmluZGV4
IDFlMDEzZWUzMTEzMS4uM2Y3NzAyZjQyYTlkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvTWFr
ZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCkBAIC0xNzEsNyArMTcxLDcgQEAgRUZJ
X0xERkxBR1MgKz0gLS1tYWpvci1vcy12ZXJzaW9uPTIgLS1taW5vci1vcy12ZXJzaW9uPTAKIEVG
SV9MREZMQUdTICs9IC0tbWFqb3Itc3Vic3lzdGVtLXZlcnNpb249MiAtLW1pbm9yLXN1YnN5c3Rl
bS12ZXJzaW9uPTAKIAogIyBDaGVjayBpZiB0aGUgY29tcGlsZXIgc3VwcG9ydHMgdGhlIE1TIEFC
SS4KLWV4cG9ydCBYRU5fQlVJTERfRUZJIDo9ICQoc2hlbGwgJChDQykgJChmaWx0ZXItb3V0ICQo
Q0ZMQUdTLXkpIC4lLmQsJChDRkxBR1MpKSAtYyBlZmkvY2hlY2suYyAtbyBlZmkvY2hlY2subyAy
Pi9kZXYvbnVsbCAmJiBlY2hvIHkpCitleHBvcnQgWEVOX0JVSUxEX0VGSSA6PSAkKHNoZWxsICQo
Q0MpICQoWEVOX0NGTEFHUykgLWMgZWZpL2NoZWNrLmMgLW8gZWZpL2NoZWNrLm8gMj4vZGV2L251
bGwgJiYgZWNobyB5KQogIyBDaGVjayBpZiB0aGUgbGlua2VyIHN1cHBvcnRzIFBFLgogWEVOX0JV
SUxEX1BFIDo9ICQoaWYgJChYRU5fQlVJTERfRUZJKSwkKHNoZWxsICQoTEQpIC1taTM4NnBlcCAt
LXN1YnN5c3RlbT0xMCAtbyBlZmkvY2hlY2suZWZpIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYm
IGVjaG8geSkpCiBhc2ZsYWdzLSQoWEVOX0JVSUxEX0VGSSkgKz0gLURYRU5fQlVJTERfRUZJCi0t
IApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
