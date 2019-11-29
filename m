Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B910D773
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:51:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahZs-0004Nb-RO; Fri, 29 Nov 2019 14:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahZr-0004NP-FD
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:48:59 +0000
X-Inumbo-ID: 5fc6c5d6-12b7-11ea-9db0-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fc6c5d6-12b7-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575038940;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=KgJRdaD5oqhyMXzajfzq0X9i5FUkFrwWTUzT2LDuJq4=;
 b=Ozkik0YYQm/bHuOjuIVliUk/kGB+rafWQ0EQbNWADhu4ICRQ1AvSCahc
 uP8a7uBweu7Tbp3yx4JtnOEErcIZ7YTZy9xF1e98gu7lKDbtXXcqa0vIF
 yjWzGH2cU9tBqxCkF5BU01bqaU9sAMuZGHX2cSQkg1WoUqZCLxXrVRQnK s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XbUjkMfqgpVtrK7gIeoCvgiTtpCNE6Ifv0RF+sJFf0TgcAqnG/fOjYeypKFJX2D3Y+tZN/UjSh
 +bDhOZuqccvlsvdLSRhUihk/XqknKUCHW4eGx+cvcA6tI3b9toNbIy0YnoUOBNw7EL4bkKnH4B
 tgAMbIQ40LPNhObZ1eBZxIuqJEXKlZ72I3utNI/6p1u/XozW7im6TK2pb06GIL620cDooUWpGt
 f9UVKiu4eGGctHSARmwp90QHgoMlaxX6HOxcCTdmvABHCscdMqf2851a0itKNjpStqxC0L6pV0
 hIc=
X-SBRS: 2.7
X-MesageID: 8994240
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8994240"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 14:48:54 +0000
Message-ID: <20191129144854.32514-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] README: Run untabify
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgd2VyZSBzb21lIGhhcmQgdGFicyBoZXJlLiAgUmVwbGFjZSB0aGVtIHdpdGggOCBzcGFj
ZXMuCgooSSBub3RpY2VkIHRoaXMgYmVjYXVzZSBteSByZWxlYXNlIHRlY2huaWNpYW4gd29yayBp
bnZvbHZlcwp1bnRhYmlmeWluZyB0aGlzIGZpbGUuKQoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogUkVBRE1FIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L1JFQURNRSBiL1JFQURNRQppbmRleCBlYWI2YmZlYThhLi45MmIxZGU5OTM4IDEwMDY0NAotLS0g
YS9SRUFETUUKKysrIGIvUkVBRE1FCkBAIC0xNTMsOCArMTUzLDggQEAgaW1wbGVtZW50YXRpb25z
IGNhbiBiZSBmb3VuZCBvbiB0aGUgd2lraSdzIHhlbnN0b3JlIHJlZmVyZW5jZSBndWlkZSBbMV0g
YW5kCiB0aGUgeGVuc3RvcmVkIFsyXSBwYWdlLiBZb3UgY2FuIGNob29zZSB3aGljaCB4ZW5zdG9y
ZSB5b3Ugd2FudCB0byBlbmFibGUgYXMKIGRlZmF1bHQgb24gYSBzeXN0ZW0gdGhyb3VnaCBjb25m
aWd1cmU6CiAKLQkuL2NvbmZpZ3VyZSAtLXdpdGgteGVuc3RvcmVkPXhlbnN0b3JlZAotCS4vY29u
ZmlndXJlIC0td2l0aC14ZW5zdG9yZWQ9b3hlbnN0b3JlZAorICAgICAgICAuL2NvbmZpZ3VyZSAt
LXdpdGgteGVuc3RvcmVkPXhlbnN0b3JlZAorICAgICAgICAuL2NvbmZpZ3VyZSAtLXdpdGgteGVu
c3RvcmVkPW94ZW5zdG9yZWQKIAogQnkgZGVmYXVsdCBveGVuc3RvcmVkIHdpbGwgYmUgdXNlZCBp
ZiB0aGUgb2NhbWwgZGV2ZWxvcG1lbnQgdG9vbHMgYXJlIGZvdW5kLgogSWYgeW91IGVuYWJsZSBv
eGVuc3RvcmVkIHRoZSB4ZW5zdG9yZWQgd2lsbCBzdGlsbCBiZSBidWlsdCBhbmQgaW5zdGFsbGVk
LAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
