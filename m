Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE6D77346
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 23:11:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr7Sd-0001Q0-JO; Fri, 26 Jul 2019 21:09:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr7Sb-0001PS-Am
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 21:09:05 +0000
X-Inumbo-ID: 986305bf-afe9-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 986305bf-afe9-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 21:09:03 +0000 (UTC)
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
IronPort-SDR: zwKslFG2EdEUqzyWij6KVeiYP5ezuy/yAY3JQcfE4WtBaj/gT4c+KB8fzv66ohQVmZ41VUPm7M
 3mjlq6anmRu2nG5amdnGK0MDE589Y/OmK451810YwEDt6+VHvT19owB8H8oqQO2jVXxG0K/QUs
 uY70vZ4VC/qMhCQ3p7p0CcziPVb8Q2G851TPuvXkQ5qVHVyvqKoBFPyJSNyPXqbLonpda5b3g0
 SBX7thd9k0dEodgoQEHAxY2ukyfe2klWg7DRKHtIQ5kWXsbNmxCXdKe+X/8lzPkNskgFyZDu02
 OLM=
X-SBRS: 2.7
X-MesageID: 3534956
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3534956"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 22:08:50 +0100
Message-ID: <20190726210854.6408-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] xen/percpu: Cleanup
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhbGwgY2xlYW51cCB3aGljaCBJIGdvdCB0YW5nbGVkIGluIGFzIHBhcnQgb2YgdGhl
IFRTUyB4cHRpIHYyIGZpeCwKYmVmb3JlIGRlY2lkaW5nIHRoYXQgdGhpcyBpcyBmYXIgdG9vIGlu
dmFzaXZlIHRvIGJhY2twb3J0LCB3aGVyZWFzIHRoZSBUU1MgZml4Cml0c2VsZiByZWFsbHkgZG9l
cyB3YW50IGJhY2twb3J0aW5nLgoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb246CiAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMTkwNzI2MjAzMjIyLjQ4MzMtMS1hbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tL1QvI3QKCmJ1dCBpcyBub3QgaW50ZW5kZWQgZm9yIGJhY2twb3J0IHRv
IHByZXZpb3VzIHZlcnNpb25zIG9mIFhlbi4KCkFuZHJldyBDb29wZXIgKDQpOgogIGFybS9wZXJj
cHU6IE1vdmUge2dldCxzZXR9X3Byb2Nlc3Nvcl9pZCgpIGludG8gc21wLmgKICB4ZW4vcGVyY3B1
OiBEcm9wIHVudXNlZCB4ZW4vcGVyY3B1LmggaW5jbHVkZXMKICB4ZW4vcGVyY3B1OiBEcm9wIHVu
dXNlZCBhc20vcGVyY3B1LmggaW5jbHVkZXMKICB4ZW4vcGVyY3B1OiBNYWtlIERFQ0xBUkVfUEVS
X0NQVSgpIGFuZCBfX0RFRklORV9QRVJfQ1BVKCkgY29tbW9uCgogeGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUyAgICAgICAgICAgICAgIHwgIDEgLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9jcHVm
cmVxLmMgIHwgIDEgLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9wb3dlcm5vdy5jIHwgIDEg
LQogeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmggICAgICAgIHwgIDMgKystCiB4ZW4vYXJj
aC94ODYvY3Jhc2guYyAgICAgICAgICAgICAgICAgfCAgMSAtCiB4ZW4vYXJjaC94ODYveGVuLmxk
cy5TICAgICAgICAgICAgICAgfCAgMSAtCiB4ZW4vY29tbW9uL2NvcmVfcGFya2luZy5jICAgICAg
ICAgICAgfCAgMiArLQogeGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMgICAgICAgIHwgIDIg
Ky0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGVyY3B1LmggICAgICAgICB8IDExIC0tLS0tLS0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL3NtcC5oICAgICAgICAgICAgfCAgOCArKysrKysrKwogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaCAgICAgIHwgIDEgLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9jcHVpZC5oICAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaTM4Ny5o
ICAgICAgICAgICB8ICAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaXJxLmggICAgICAgICAgICB8
ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L3BlcmNwdS5oICAgICAgICAgfCAgNSAtLS0tLQog
eGVuL2luY2x1ZGUveGVuL2tleGVjLmggICAgICAgICAgICAgIHwgIDEgLQogeGVuL2luY2x1ZGUv
eGVuL211bHRpY2FsbC5oICAgICAgICAgIHwgIDEgLQogeGVuL2luY2x1ZGUveGVuL3BlcmNwdS5o
ICAgICAgICAgICAgIHwgIDYgKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCAgICAg
ICAgICAgfCAgMSAtCiB4ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmggICAgICAgICAgICAgfCAgMSAr
CiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCAgICAgICAgICAgfCAgMSAtCiB4ZW4veHNtL2Zs
YXNrL2luY2x1ZGUvYXZjLmggICAgICAgICAgfCAgMyArKy0KIDIyIGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
