Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EDD27CC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 13:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIWEl-0006xk-AL; Thu, 10 Oct 2019 11:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIWEj-0006xf-Oc
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:04:01 +0000
X-Inumbo-ID: a971c532-eb4d-11e9-80e3-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a971c532-eb4d-11e9-80e3-bc764e2007e4;
 Thu, 10 Oct 2019 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570705440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CfO47KUUvEJU05GSpAp+zIypgB82YwhG+trh80fzKyQ=;
 b=Ztjq+rCWYCtVNM2Ti9FJNi2LM1N1R3QpQViXtc39Xg3I7G+9Cf4iIvCV
 N4wIe2hH36dgRPVSGM4Zo04e1O7c42vJ23CpgV2fR5vfN/FdtVzsIN1ih
 BHqKY47SYJKh1ExZZqppfB1RqtPzNxCibakgGKx6NBhYQs/h6XwrlbRwS Y=;
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
IronPort-SDR: TBmCwFrhwFKWaNKsl+cD76EgKZMpmjN85lSLkYkiHIDHZfBOagv/fzwD5Y8Oidg22sDnXaIUEd
 B+OqDWnHE7RFkUnJlkNx8pvy711rh/dfSAWbEBsFzBwsvZ9ERH+9paHoV/aLvnuNAxSnwk901E
 hM043a0tQXW4v+hCpG0oeMMQRePmWweQyKJk99seCWSNTQ9d3j3no/Cv0n+6fMakBvl4LVMcw5
 87HuAKsAmCI4oRfUSNIrcwmhsB34HuKW5H7NjkDPJOGRqE44eM/aRTtjvoKTxGyCw0Wo857UvH
 yFw=
X-SBRS: 2.7
X-MesageID: 6705913
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,279,1566878400"; 
   d="scan'208";a="6705913"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 13:03:37 +0200
Message-ID: <20191010110339.6447-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] iommu: fixes for interrupt remapping
 enabling
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
Cc: Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIHR3byBmaXhlcyBmb3IgaXNzdWVz
IGZvdW5kIHdoZW4gZW5hYmxpbmcKaW50ZXJydXB0IHJlbWFwcGluZyBhbmQgdGhlIElPLUFQSUMg
YWxyZWFkeSBoYXMgdW5tYXNrZWQgcGlucy4gV2hpbGUgSSdtCm5vdCBhd2FyZSBvZiBhbnkgc3lz
dGVtIG1hbGZ1bmN0aW9uaW5nIChhcGFydCBmcm9tIHJlcG9ydGluZyBJT01NVQppbnRlcnJ1cHQg
cmVtYXBwaW5nIGZhdWx0cykgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhvc2Ug
aW4KNC4xMy4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIHgyQVBJQzog
dHJhbnNsYXRlIElPLUFQSUMgZW50cmllcyB3aGVuIGVuYWJsaW5nIHRoZSBJT01NVQogIGlvbW11
OiB0cmFuc2xhdGUgSU8tQVBJQyBwaW5zIHdoZW4gZW5hYmxpbmcgaW50ZXJydXB0IHJlbWFwcGlu
ZwoKIHhlbi9hcmNoL3g4Ni9hcGljLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsr
LQogeGVuL2FyY2gveDg2L2lvX2FwaWMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKy0K
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgICB8IDExICsrLQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYyAgICAgIHwgOTAgKy0tLS0t
LS0tLS0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAg
ICAgIHwgMzQgKysrKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1w
cm90by5oIHwgIDEgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb19hcGljLmggICAgICAgICAgICAg
ICAgIHwgIDMgKy0KIDcgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0
aW9ucygtKQoKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
