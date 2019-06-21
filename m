Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E826C4E3C1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFyQ-0007a7-07; Fri, 21 Jun 2019 09:36:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heFyO-0007a1-Jb
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:36:44 +0000
X-Inumbo-ID: 140a513a-9408-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 140a513a-9408-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:36:43 +0000 (UTC)
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
IronPort-SDR: Y7FeIurlf15qw0Ia1pHHjzjTXIsasIpDGJu0MNQKjoHHCAMNILfp3hXYkv6t2+Oz6BwBPmxZsP
 pZqRjImdz8rL0VuJdMSJiNEaa4XogI0eizNryq3Ve40gtAiyFHV5N+uLBVSd6BIFh4RWWcJar+
 /E8xB56tcpT+fEY2KG1O7tQVGtkug8JlWgUwTY/uXieJsijYpcPzl3BCaZlj6ua00A1txPfwcF
 1EUe/8uVkHvvUeZGRvyGmoT7ejy+MwxrvygjUGIxznRHO0jbMcZdr/qS+UN3sU6sFVoGiQwW1R
 AR4=
X-SBRS: 2.7
X-MesageID: 2060656
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,399,1557201600"; 
   d="scan'208";a="2060656"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 10:36:33 +0100
Message-ID: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] xen/gnttab: XSA-295 followup
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgY2FtZSBvdXQgb2Ygb2JzZXJ2YXRpb25zIGR1cmluZyB0aGUgZGV2ZWxvcG1l
bnQgb2YgWFNBLTI5NS4KCkl0IGhhcyBiZWVuIHRlc3RlZCBvbiB4ODYsIGJ1dCBvbmx5IGNvbXBp
bGUgdGVzdGVkIG9uIGFybS4gIEl0IGNhbiBiZSBvYnRhaW5lZAppbiBnaXQgZm9ybSBmcm9tOgoK
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvYW5kcmV3Y29vcC94ZW4u
Z2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3hlbi1ncmFudC1zdGF0dXMKCkFuZHJldyBDb29w
ZXIgKDUpOgogIHhlbi9nbnR0YWI6IFJlZHVjZSBjb21wbGV4aXR5IHdoZW4gcmVhZGluZyBncmFu
dF9lbnRyeV9oZWFkZXJfdAogIHhlbi9nbnR0YWI6IFJlZHVjZSBjb2RlIHZvbHVtZSB3aGVuIHVz
aW5nIHVuaW9uIGdyYW50X2NvbWJvCiAgYXJtL2dudHRhYjogSW1wbGVtZW50IHN0dWIgaGVscGVy
cyBhcyBzdGF0aWMgaW5saW5lcwogIHhlbi9nbnR0YWI6IFJlZmFjdG9yIGdudHRhYl9jbGVhcl9m
bGFnKCkgdG8gYmUgZ250dGFiX2NsZWFyX2ZsYWdzKCkKICB4ZW4vZ250dGFiOiBGb2xkIGFkamFj
ZW50IGNhbGxzIHRvIGdudHRhYl9jbGVhcl9mbGFncygpCgogeGVuL2FyY2gvYXJtL21tLmMgICAg
ICAgICAgICAgICAgIHwgIDE2IC0tLS0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyAgICAgICAg
ICB8IDE2MCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1
ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oIHwgIDE3ICsrKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
Z3JhbnRfdGFibGUuaCB8ICAxMSArLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMo
KyksIDEwMCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
