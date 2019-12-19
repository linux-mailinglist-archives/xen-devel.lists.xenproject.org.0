Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CF126896
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 19:00:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii03g-00088I-Hl; Thu, 19 Dec 2019 17:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4R/5=2J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ii03f-00087v-5h
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:57:55 +0000
X-Inumbo-ID: 0ff846e2-2289-11ea-a914-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ff846e2-2289-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576778266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=o90HAn+Vvas9v3Q8cxO9FOOoxfoBAGSC6iLa+g1P+8U=;
 b=S6U7tQpjmcNQSPkVUVvwkxscLuCr5SNNIBceyRJPmuUwnxnPYxRnDqqC
 RG18Xw02vP6rae0ekJHu6JBHGmS3KQe3GJPJD9j7VA3dUGSBypdXA0IpD
 YKqLcrzUXxBKD/h5B9rmYHVhH1VMr4BbO0dg12LD5kD1r2HX2oaPpvSxS w=;
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
IronPort-SDR: 0gh0pB5qcxTry4EDWSlWuS2JLg3z30oplT/L9LTiSOz77m3Fra0g+ANEA8CrzgbrfK5/P+8iJ3
 2h8H1OcBgYujT/XpDqlqnrH74ixE9EoUnr6svdZR70dnixQ/aZgZ/rINH3PypIAes1fEHU48G5
 /Ap0uytxEiWwoGVaGAXeotMTpxCcE5/3y5CkK9SQsbynXM46SQCl+GGldAr9jAdlXfd8o6Qd44
 D37vGxOCVO35JiNPDphZMiiU2QkxZW91qnhxKaNa48NL05TJZGHGiBZxDqruY7DWNkeVtjTQUV
 6Ig=
X-SBRS: 2.7
X-MesageID: 10367706
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; d="scan'208";a="10367706"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 17:57:30 +0000
Message-ID: <20191219175730.12484-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191219175730.12484-1-ian.jackson@eu.citrix.com>
References: <20191219175730.12484-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/3] microcode: Install Debian microcode
 packages and add ucode=scan
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIG5vIGxvbmdlciB1c2luZyB0aGUgZnJvemVuLWluLWFtYmVyIG1pY3JvY29kZSBmcm9t
IDIwMTUuICBOb3cKd2UgdXNlIGN1cnJlbnQgbWljcm9jb2RlIGZyb20gRGViaWFuIChvciBob3Bl
ZnVsbHkgaW4gZnV0dXJlIHZpYSBvdGhlcgpkaXN0cm9zKS4KCkVtcGlyaWNhbGx5IHRoaXMgZml4
ZXMgdGhlIFhTQS0zMDggdGVzdCBvbiByaW1hdmExLCB3aGljaCB3YXMgZmFpbGluZwphbmQgcHJv
ZHVjaW5nIHZlcnkgc3RyYW5nZSBzeW1wdG9tcy4KCkNDOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCA2ICsrKysrKwogdHMteGVu
LWluc3RhbGwgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS90cy1ob3N0LWluc3RhbGwgYi90cy1ob3N0LWluc3RhbGwKaW5kZXggNGJmYTJmNWUu
LjdhNzJhODY3IDEwMDc1NQotLS0gYS90cy1ob3N0LWluc3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0
YWxsCkBAIC0xMzksNiArMTM5LDEyIEBAIEVORAogICAgIHRhcmdldF9jbWRfcm9vdCgkaG8sICJj
aG1vZCAyNzc1IC9yb290Iik7CiAKICAgICB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sIHF3
KGVkKSk7CisgICAgaWYgKCRoby0+e0FyY2h9ID1+IG0vXig/OmkzODZ8YW1kNjQpJC8pIHsKKwkj
IFdlIGRvbid0IG5lY2Vzc2FyaWx5IGtub3cgdGhlIENQVSB2ZW5kb3IsIGJ1dCB0aGUgRGViaWFu
CisJIyBwYWNrYWdlZCBtaWNyb2NvZGUgZG9lc24ndCBtaW5kIHVzIGluc3RhbGxpbmcgYm90aC4K
Kwl0YXJnZXRfaW5zdGFsbF9wYWNrYWdlc19ub25mcmVlX25vbmNvbmN1cnJlbnQoJGhvLAorICAg
ICAgICAgICAgcXcoYW1kNjQtbWljcm9jb2RlIGludGVsLW1pY3JvY29kZSkpOworICAgIH0KIAog
ICAgIG15ICRudHBzZXJ2ZXIgPSBnZXRfdGFyZ2V0X3Byb3BlcnR5KCRobywgJ050cFNlcnZlcicp
OwogICAgIGlmICgkbnRwc2VydmVyKSB7CmRpZmYgLS1naXQgYS90cy14ZW4taW5zdGFsbCBiL3Rz
LXhlbi1pbnN0YWxsCmluZGV4IDkxMTNmMzE4Li4wOGI0ZWEyMyAxMDA3NTUKLS0tIGEvdHMteGVu
LWluc3RhbGwKKysrIGIvdHMteGVuLWluc3RhbGwKQEAgLTIwOSw2ICsyMDksOCBAQCBzdWIgc2V0
dXBib290ICgpIHsKICAgICAgICAgbXkgJG1lbSA9ICRyeydkb20wX21lbSd9IC8vIDUxMjsKICAg
ICAgICAgJHhlbmhvcHQgLj0gIiBkb20wX21lbT0ke21lbX1NLG1heDoke21lbX1NIjsKICAgICB9
CisgICAgJHhlbmhvcHQgLj0gIiB1Y29kZT1zY2FuIjsKKwogICAgIG15ICRhcHBlbmQ9ICRye3hl
bl9ib290X2FwcGVuZH07CiAgICAgJHhlbmhvcHQgLj0gIiAkYXBwZW5kIiBpZiBkZWZpbmVkICRh
cHBlbmQ7CiAgICAgJGFwcGVuZCA9IGdldF9ob3N0X3Byb3BlcnR5KCRobywgJ3hlbi1jb21tYW5k
bGluZS1hcHBlbmQnLCB1bmRlZik7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
