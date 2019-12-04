Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5D112FF9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:25:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXOW-0006sV-R8; Wed, 04 Dec 2019 16:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icXOV-0006s1-4u
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:20:51 +0000
X-Inumbo-ID: 08ef6ff3-16b2-11ea-8206-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08ef6ff3-16b2-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575476451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=80NBp/22T/CAr+4PPAbMOKrqqzLlXhTyFbDherA9Olo=;
 b=PQGZsW9bXnhdsa/DeprYU7x7pcqbUKQ2HJs9xtmPyeqTFe7mkNKxrBO0
 phxrEUCDGTBHh6QfCbEBoqQQydnrHl70ujqlP6v1S8gKe4thRsqai5t6d
 a1vxsqIh2ocfMWksip3VchSKa/DfD7BCxsNONkGurU7v6hHgaj6hKbl9d 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SY9ZnMe4o8+zOGEwLQAliZ60XRsR9Gb/WXmtgdJNxGcHwFeuBOoohiCHDKx/PUOLK1yjNtjzB/
 2fUj1hHmyTNTcXDm8eoHqHYsN/hT6DAPFPN0w1xLz7qQfwXD6TgzcXXqEgV8xHhk0qifXyvFJ2
 HlIIQcigKfTJUAIAAqJJE4lxZ561VHOAOW1cULB1x4iKZ3AynO0lAMTkFsiZIh92//IRdoksuZ
 AwlVAQgAMbW0lnuu3CvEUv+9wkRIG3XcKYi73wOCvJDBKfalx/vyDPSvTRcGKmt3v44hU+CZHX
 5yU=
X-SBRS: 2.7
X-MesageID: 9200817
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9200817"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:20:24 +0100
Message-ID: <20191204162025.37510-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204162025.37510-1-roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] x86/smp: check APIC ID on AP bringup
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hlY2sgdGhhdCB0aGUgcHJvY2Vzc29yIHRvIGJlIHdva2VuIHVwIEFQSUMgSUQgaXMgYWRkcmVz
c2FibGUgaW4gdGhlCmN1cnJlbnQgQVBJQyBtb2RlLgoKTm90ZSB0aGF0IGluIHByYWN0aWNlIHN5
c3RlbXMgd2l0aCBBUElDIElEcyA+IDI1NSBzaG91bGQgYWxyZWFkeSBoYXZlCngyQVBJQyBlbmFi
bGVkIGJ5IHRoZSBmaXJtd2FyZSwgYW5kIGhlbmNlIHRoaXMgaXMgbW9zdGx5IGEgc2FmZXR5CmJl
bHQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFJld29yZCBlcnJvciBtZXNzYWdlLgotLS0KIHhl
bi9hcmNoL3g4Ni9zbXBib290LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwppbmRleCBmYTY5MWI2YmEwLi44Y2JiNzE3M2E0IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTEz
MTcsNiArMTMxNywxMyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50IGNwdSkKICAgICBpZiAo
IChhcGljaWQgPSB4ODZfY3B1X3RvX2FwaWNpZFtjcHVdKSA9PSBCQURfQVBJQ0lEICkKICAgICAg
ICAgcmV0dXJuIC1FTk9ERVY7CiAKKyAgICBpZiAoICgheDJhcGljX2VuYWJsZWQgfHwgIWlvbW11
X2ludHJlbWFwKSAmJiAoYXBpY2lkID4+IDgpICkKKyAgICB7CisgICAgICAgIHByaW50aygiVW5z
dXBwb3J0ZWQ6IEFQSUMgSUQgJSN4IGluIHhBUElDIG1vZGUgdy9vIGludGVycnVwdCByZW1hcHBp
bmciLAorICAgICAgICAgICAgICAgYXBpY2lkKTsKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cisg
ICAgfQorCiAgICAgaWYgKCAocmV0ID0gZG9fYm9vdF9jcHUoYXBpY2lkLCBjcHUpKSAhPSAwICkK
ICAgICAgICAgcmV0dXJuIHJldDsKIAotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
