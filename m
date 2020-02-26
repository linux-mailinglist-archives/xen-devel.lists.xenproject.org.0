Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF4316FDEF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:37:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxV-0001LW-37; Wed, 26 Feb 2020 11:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6uxU-0001L3-08
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:32 +0000
X-Inumbo-ID: e4282dfa-588b-11ea-93fd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4282dfa-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G7TB6wcfMvzkfAjy1ejkIUlbKPndov+7d0e9ADpLygw=;
 b=JxjT0ty9I/8iRWGqDYsplp7UboniMO+jrXuqcqs/Gs3nClBrknVG4/md
 419BsHwJisQWpY9iqAWfyF8YBarNa59dpjYNSBe7DFOvkiTO1+2niHdsj
 cApyhlVU8jkzql0l3iAUssRcYkAVaDU2LCCDlaGZg/HSHmYtCHYL28tg2 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sQCJ+08jvqwUF96dnpGR8FxM9pamWJyC4jZ47EKb1imeNKa3ppYi4N7/dL5WB6dFwgKiKE4fEE
 pftJ32FPPRcfFG46dMMRs9oaYqJy7DWOCzMo5r7e+p6tzkdZiC9Xf5/nUAuvLNWj5j0ztinaQm
 iO9AJ6IGn83j9KW49elEwVjTlBwhK0LqAYpnepS8UNbNGMnXjYQip6ryz7mT7h4aBKLEsmhXyW
 cZ7kQ7ibnyo/HtmazXBMNUz1z+9/Ikar8xC+DGsPysV7xrA0lQGgZwEwwj7Vol2jvBXtv5j48Z
 Wgw=
X-SBRS: 2.7
X-MesageID: 13038216
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13038216"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:36 +0000
Message-ID: <20200226113355.2532224-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 04/23] xen/build: remove use of AFLAGS-y
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
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIHNpbXBseSBhZGQgZGlyZWN0bHkgdG8gQUZMQUdTLgoKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoK
ICAgIC0gbmV3IHBhdGNoCgogeGVuL1J1bGVzLm1rIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5t
ayBiL3hlbi9SdWxlcy5tawppbmRleCBjMjEyMDMzNTFhOWYuLjE1NDI2OWJmZDk2YyAxMDA2NDQK
LS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9SdWxlcy5tawpAQCAtNzEsNyArNzEsNyBAQCBp
Zm5lcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkpCiBDRkxBR1MgKz0gLVdhLC0tc3RyaXAtbG9j
YWwtYWJzb2x1dGUKIGVuZGlmCiAKLUFGTEFHUy15ICAgICAgICAgICAgICAgICs9IC1EX19BU1NF
TUJMWV9fCitBRkxBR1MgKz0gLURfX0FTU0VNQkxZX18KIAogQUxMX09CSlMgOj0gJChBTExfT0JK
Uy15KQogCkBAIC04NSw3ICs4NSw3IEBAIENGTEFHUyArPSAkKEVYVFJBX0NGTEFHU19YRU5fQ09S
RSkKICMgTW9zdCBDRkxBR1MgYXJlIHNhZmUgZm9yIGFzc2VtYmx5IGZpbGVzOgogIyAgLXN0ZD1n
bnV7ODksOTl9IGdldHMgY29uZnVzZWQgYnkgIy1wcmVmaXhlZCBlbmQtb2YtbGluZSBjb21tZW50
cwogIyAgLWZsdG8gbWFrZXMgbm8gc2Vuc2UgYW5kIGFubm95cyBjbGFuZwotQUZMQUdTICs9ICQo
QUZMQUdTLXkpICQoZmlsdGVyLW91dCAtc3RkPWdudSUgLWZsdG8sJChDRkxBR1MpKQorQUZMQUdT
ICs9ICQoZmlsdGVyLW91dCAtc3RkPWdudSUgLWZsdG8sJChDRkxBR1MpKQogCiAjIExERkxBR1Mg
YXJlIG9ubHkgcGFzc2VkIGRpcmVjdGx5IHRvICQoTEQpCiBMREZMQUdTICs9ICQoTERGTEFHU19E
SVJFQ1QpCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
