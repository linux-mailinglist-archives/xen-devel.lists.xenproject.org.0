Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B698C12656E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 16:10:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihxOY-00018K-Uv; Thu, 19 Dec 2019 15:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4R/5=2J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ihxOY-00018F-0b
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 15:07:18 +0000
X-Inumbo-ID: 39e8487a-2271-11ea-a1e1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39e8487a-2271-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576768029;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kJeDxEYieMj+hUWBuSLeTrobcBnPGZu82j8lYUiTVO4=;
 b=FxYxJCTF3zoVR15W2vBoaF9/B45b1Ccs0RXkW8T8xXFBfsVOqo0eu/kB
 lPVZJNn6OkpBYBtRvjset6HSW/aL+DOYuO5LOhCOTbiH/K7mm2Y4abWEc
 mcVRTesaLSnUIDBPAmAmONQxbDPChK2J6AiFVn0ibSqEdlSGhTKWi0m2D k=;
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
IronPort-SDR: M6C/y11W5arRSLVvIF9m2aLbbYv/f6JF11ZaAYcqFt74lE8zEr6D4Fk2oLMqlW+dF1JrrZ9Sk/
 PLTMpCTccEzV/QsDmMqXGtHH1wa1h3Vxab7f0a9VadYdfShBYVRrz/nGMa8z85IDfjHAkJ7ZTq
 ISONOQJDCb84HU+zApXaPjKxlz38IISl3Ml0zptRa1NHztrzTqLNzaQVxQSSw33n91KSSrHzaC
 FeVBKoVfefNIoNpCgAseo5Rwe/HcWmecK+916XfNnLq+FU6owoNYLr5HtCAZYCJr+g7rY+cjDA
 5nA=
X-SBRS: 2.7
X-MesageID: 9951515
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; 
   d="scan'208";a="9951515"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 15:07:05 +0000
Message-ID: <20191219150705.32107-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-xen-install: Drop gdb= parameter
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBoYXMgYmVlbiB0aGVyZSBmb3JldmVyIGFuZCBJIGRvdWJ0IGFueW9uZSBoYXMgZXZlciB1
c2VkIGl0LgoKQW5kcmV3IENvb3BlciB0ZWxscyBtZSB0aGF0IGl0IG5lZWRzIGFuIEwgb3IgSCBz
dWZmaXggc28gcHJvYmFibHkKZG9lc24ndCB3b3JrLiAgUmVjZW50IGNoYW5nZXMgdG8gbW9yZSBj
b25zcGljdW91c2x5IHJlcG9ydCBjb21tYW5kCmxpbmUgcGFyc2luZyBmYWlsdXJlcyBoaWdobGln
aHRlZCB0aGlzIGlzc3VlLgoKU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiB0cy14ZW4taW5zdGFsbCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1pbnN0
YWxsIGIvdHMteGVuLWluc3RhbGwKaW5kZXggMTU0Zjc4YzcuLmQ4ZTlkN2U2IDEwMDc1NQotLS0g
YS90cy14ZW4taW5zdGFsbAorKysgYi90cy14ZW4taW5zdGFsbApAQCAtMTk3LDcgKzE5Nyw3IEBA
IHN1YiBzZXR1cGJvb3QgKCkgewogCQkJCTogJ2NvbTEnKTsKIAogICAgIGlmICggJGNvbnMgZXEg
ImNvbTEiICkgewotCSR4ZW5ob3B0IC49ICIgY29tMT0kY3tCYXVkfSw4bjEgY29uc29sZT1jb20x
LHZnYSBnZGI9Y29tMSI7CisJJHhlbmhvcHQgLj0gIiBjb20xPSRje0JhdWR9LDhuMSBjb25zb2xl
PWNvbTEsdmdhIjsKICAgICB9IGVsc2lmICggJGNvbnMgZXEgImR0dWFydCIgKSB7CiAJJHhlbmhv
cHQgLj0gIiBjb25zb2xlPWR0dWFydCI7CiAJbXkgJGR0dWFydD0gZ2V0X2hvc3RfcHJvcGVydHko
JGhvLCAnWGVuRFRVQVJUUGF0aCcsIHVuZGVmKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
