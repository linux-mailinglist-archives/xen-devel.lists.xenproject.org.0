Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B957638A8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 17:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hks33-0003fn-FK; Tue, 09 Jul 2019 15:28:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVIN=VG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hks31-0003fi-SV
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 15:28:51 +0000
X-Inumbo-ID: 405d19dd-a25e-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 405d19dd-a25e-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 15:28:50 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8tOUEySPkzuvd2SsCg164Rbw+qtRDdPhqnLS1LM7MrHa/w3wCxgcyjPqlQSohI1E90Ctl217PL
 yslKgzI1Azg07iroHFrDs8ifmqXqjvHAlszzYNq1w65/afVb91etEuS8Al6fLYFFQRIJJGgBjP
 DxNlFH4KWThiLpQ0Uo+QtO1IjO2NGeSMR5fwpJ7O33f8URjZeY21XFlKeVclKUnh6yzgNgbkE1
 p1tkGVSVfOBHCaR88JT9HPpbm102yreQIdyG0yIS2NtJabvI6UrM5WlAQMPS3BAAXsF1Qzjv+s
 bkQ=
X-SBRS: 2.7
X-MesageID: 2778687
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,470,1557201600"; 
   d="scan'208";a="2778687"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 9 Jul 2019 16:28:43 +0100
Message-ID: <20190709152845.18217-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RFC 0/2] tools/xenstored: Reduce the useage of
 unstable interface
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuc3RvcmVkIGlzIGN1cnJlbnRseSBsaW5rZWQgYWdhaW5zdCBsaWJ4YywgYW5kIHVzZXMgdW5z
dGFibGUgaW50ZXJmYWNlcyBmb3IKZXhhY3RseSB0d28gdGhpbmdzOgoKIDEpIEZvcmVpZ24gbWFw
cGluZyBieSBNRk4KIDIpIHhjX2RvbV9nZXRpbmZvKCksIGJ1dCBvbmx5IGZvciBzaHV0ZG93biBp
bmZvcm1hdGlvbgoKVGhpcyBzZXJpZXMgYWRkcmVzc2VzIGlzc3VlIDEuICBJc3N1ZSAyIGlzIHN0
aWxsIG9wZW4sIGFuZCBjYW4gdGFrZSBhZHZhbnRhZ2UKb2YgbG9hZHMgb2YgdXMgYmVpbmcgY28t
bG9jYXRlZCBpbiBDaGljYWdvIGF0IHRoZSBtb21lbnQuCgpBbmRyZXcgQ29vcGVyICgyKToKICB0
b29scy94ZW5zdG9yZWQ6IE1ha2UgZ250dGFiIGludGVyZmFjZSBtYW5kYXRvcnkKICB0b29scy94
ZW5zdG9yZWQ6IERyb3AgbWFwcGluZyBvZiB0aGUgcmluZyB2aWEgZm9yZWlnbiBtYXAKCiB0b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCAyOCArKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
CgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
