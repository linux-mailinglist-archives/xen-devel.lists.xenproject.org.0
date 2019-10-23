Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E725E20FD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJog-0007Sv-Cs; Wed, 23 Oct 2019 16:48:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJof-0007SV-Er
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:57 +0000
X-Inumbo-ID: f8ad77c4-f5b4-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8ad77c4-f5b4-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hXr9w3jPULxpMPUxVm6mEQo/0Q3sw5db8ib06NgEAk=;
 b=YL8OmkPC3m7K2kymxmFfF09Gkngj5nRQ/tpW7cCRYutAjCL25zfq9c5n
 P2iGx6O3MULMC88VcivP00WCcUq1G5TGOuIASFo+a3ZM7JNMASThIsCTE
 ahevphjYwxlz39VNTbOGOP/pV7ug1FcsAjybhyX4Wkg88FmALirNTjS+w U=;
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
IronPort-SDR: D4hiskaVKU5bP9gLi3odpCa4mRDJUQhKZcyQbOMmbbFW5gSm++iSLlQ+YrZ9OHZ/nNl3GkO/W1
 25o2GVX7q+KVd8K4v23rW8OFdkRa559kDyIje4nIgRp0LlB4EztiXRfR2RPFS6J8KNVDYONr4a
 SO5wHKHkf+4itmWEZMz8JLlpEyOeudIhQEfEMEleKWiR4zUViRJ6MbdOcds7zdJ/HxpPWp7jLB
 5TVmvPPG7iZaylRPvi3LlOjbJZR6Kz4cnj7z21njn8Za2f5sbAwJQTUbS/hQsJEMkF6N7Pd+dS
 ck4=
X-SBRS: 2.7
X-MesageID: 7778032
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7778032"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:22 +0100
Message-ID: <20191023164837.2700240-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 08/23] xen,
 Kbuild: Change filechk_offsets
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbnMgd2lsbCBiZSB1c2UgbGF0ZXIgdG8gZ2VuZXJhdGUgYXNtLW9mZnNldHMu
aC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgotLS0KIHhlbi9zY3JpcHRzL01ha2VmaWxlLmxpYiB8IDE5ICsrKysrKysrLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmxpYiBiL3hlbi9zY3JpcHRzL01ha2VmaWxl
LmxpYgppbmRleCBlMDIyZjA1MzQ5NGUuLjE5NjQxZTgzNmRjMyAxMDA2NDQKLS0tIGEveGVuL3Nj
cmlwdHMvTWFrZWZpbGUubGliCisrKyBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmxpYgpAQCAtNDEz
LDI5ICs0MTMsMjYgQEAgcXVpZXRfY21kX3h6bWlzYyA9IFhaTUlTQyAgJEAKICMgQVNNIG9mZnNl
dHMKICMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKLSMgRGVmYXVsdCBzZWQgcmVnZXhwIC0gbXVsdGls
aW5lIGR1ZSB0byBzeW50YXggY29uc3RyYWludHMKKyMgRGVmYXVsdCBzZWQgcmVnZXhwCiAjCi0j
IFVzZSBbOnNwYWNlOl0gYmVjYXVzZSBMTFZNJ3MgaW50ZWdyYXRlZCBhc3NlbWJsZXIgaW5zZXJ0
cyA8dGFiPiBhcm91bmQKLSMgdGhlIC5hc2NpaSBkaXJlY3RpdmUgd2hlcmVhcyBHQ0Mga2VlcHMg
dGhlIDxzcGFjZT4gYXMtaXMuCiBkZWZpbmUgc2VkLW9mZnNldHMKLQknczpeW1s6c3BhY2U6XV0q
XC5hc2NpaVtbOnNwYWNlOl1dKiJcKC4qXCkiLio6XDE6OyBcCi0JL14tPi97czotPiNcKC4qXCk6
LyogXDEgKi86OyBcCi0JczpeLT5cKFteIF0qXCkgW1wkJCNdKlwoW14gXSpcKSBcKC4qXCk6I2Rl
ZmluZSBcMSBcMiAvKiBcMyAqLzo7IFwKLQlzOi0+Ojo7IHA7fScKKwknL15bXiNdLio9PT4ve3M6
Lio9PT4oLiopPD09Lio6XDE6OyBzOiBbXCQkI106IDo7IHA7fScKIGVuZGVmCiAKICMgVXNlIGZp
bGVjaGsgdG8gYXZvaWQgcmVidWlsZHMgd2hlbiBhIGhlYWRlciBjaGFuZ2VzLCBidXQgdGhlIHJl
c3VsdGluZyBmaWxlCiAjIGRvZXMgbm90CiBkZWZpbmUgZmlsZWNoa19vZmZzZXRzCi0JIGVjaG8g
IiNpZm5kZWYgJDIiOyBcCi0JIGVjaG8gIiNkZWZpbmUgJDIiOyBcCiAJIGVjaG8gIi8qIjsgXAog
CSBlY2hvICIgKiBETyBOT1QgTU9ESUZZLiI7IFwKIAkgZWNobyAiICoiOyBcCi0JIGVjaG8gIiAq
IFRoaXMgZmlsZSB3YXMgZ2VuZXJhdGVkIGJ5IEtidWlsZCI7IFwKKwkgZWNobyAiICogVGhpcyBm
aWxlIHdhcyBhdXRvLWdlbmVyYXRlZCBmcm9tICQ8IjsgXAorCSBlY2hvICIgKiI7IFwKIAkgZWNo
byAiICovIjsgXAogCSBlY2hvICIiOyBcCi0JIHNlZCAtbmUgJChzZWQtb2Zmc2V0cykgPCAkPDsg
XAorCSBlY2hvICIjaWZuZGVmICQyIjsgXAorCSBlY2hvICIjZGVmaW5lICQyIjsgXAorCSBlY2hv
ICIiOyBcCisJIHNlZCAtcm5lICQoc2VkLW9mZnNldHMpIDwgJDw7IFwKIAkgZWNobyAiIjsgXAog
CSBlY2hvICIjZW5kaWYiCiBlbmRlZgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
