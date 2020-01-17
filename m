Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55A140880
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:57:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGg-0004wJ-Hy; Fri, 17 Jan 2020 10:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGe-0004vf-LS
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:20 +0000
X-Inumbo-ID: b10dd35e-3917-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b10dd35e-3917-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bp6VeAtawBJ7+KlC2XEdokxk4K2nHX7ktie28XH2YH8=;
 b=TzdR+j1xBCYBH+P+UTqX3BvJxSldGklZhTtabq7IP4O4T50tciKSLGvU
 jAIRWALfCwjRg3qaBMKDqGTiJA6emr7uSAyDV0vfIMQ9jzEIXzRZJ6IhN
 BBinQo9vY8DfqKzkpwcTpJXMDUut270BKy2iUMH6vd0bAVa0yzVAOIeZo I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: itnPg+duLNhOj4iFx7kyj+aVvzuXCS7Z+mMrNKL6mx5Nv5J0aqUzFlcX3lcNvnC6wp7iTmmYbi
 Li7hMrcav0PrmCLA4mf3NMtYPFZlsQ5JSqrTIi3Bqf4GW406kuGqDlra1S2RvLTYJZrglJAdHT
 Klo1HRWk7QhcRqt5RhXSAk7DHTcfc7hUC+oJkAcF1YjU+gWeCyipVTnEt4xWY431NwNQ5lrcQN
 z4H02iyJ1rAU8DlsTH+uGpR59vxljkz5n7Qi2AleDJMKKlrRsz3TZLAOpVRsI/uYIa2LTVrDhc
 ILA=
X-SBRS: 2.7
X-MesageID: 11498515
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11498515"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:47 +0000
Message-ID: <20200117105358.607910-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 01/12] xen/build: Remove left over
 -DMAX_PHYS_IRQS
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KClRoZSB1c2Ug
b2YgTUFYX1BIWVNfSVJRUyBoYXZlIGJlZW4gcmVtb3ZlZCBpbiBjZjVlNmYyZDM0NDEgKCJ4ODY6
CmVsaW1pbmF0ZSBoYXJkLWNvZGVkIE5SX0lSUVMiKSwgc28gcmVtb3ZlIHRoZSBsZWZ0IG92ZXIg
Q0ZMQUdTLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5k
ZXggZmNkYWZkMDI5MzQyLi4yMmYyNWM1YjJiZTggMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5tawor
KysgYi94ZW4vUnVsZXMubWsKQEAgLTcxLDEwICs3MSw2IEBAIGlmbmVxICgkKENPTkZJR19DQ19J
U19DTEFORykseSkKIENGTEFHUyArPSAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZQogZW5kaWYK
IAotaWZuZXEgKCQobWF4X3BoeXNfaXJxcyksKQotQ0ZMQUdTLXkgICAgICAgICAgICAgICAgKz0g
LURNQVhfUEhZU19JUlFTPSQobWF4X3BoeXNfaXJxcykKLWVuZGlmCi0KIEFGTEFHUy15ICAgICAg
ICAgICAgICAgICs9IC1EX19BU1NFTUJMWV9fCiAKIEFMTF9PQkpTIDo9ICQoQUxMX09CSlMteSkK
LS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
