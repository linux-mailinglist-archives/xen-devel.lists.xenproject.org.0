Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5971F49
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 20:28:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpzTn-0004xZ-5R; Tue, 23 Jul 2019 18:25:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpzTl-0004wz-Iy
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 18:25:37 +0000
X-Inumbo-ID: 42eb38d0-ad77-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42eb38d0-ad77-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 18:25:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 136E8AC93;
 Tue, 23 Jul 2019 18:25:34 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 20:25:28 +0200
Message-Id: <20190723182530.24087-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/2] xen: enhance temporary vcpu pinning
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgdHJ5aW5nIHRvIGhhbmRsZSB0ZW1wb3JhcnkgdmNwdSBwaW5uaW5ncyBpbiBhIHNhbmUg
d2F5IGluIG15CmNvcmUgc2NoZWR1bGluZyBzZXJpZXMgSSBmb3VuZCBhIG5pY2Ugd2F5IHRvIHNp
bXBsaWZ5IHRoZSB0ZW1wb3JhcnkKcGlubmluZyBjYXNlcy4KCkknbSBzZW5kaW5nIHRoZSB0d28g
cGF0Y2hlcyBpbmRlcGVuZGVudGx5IGZyb20gbXkgY29yZSBzY2hlZHVsaW5nCnNlcmllcyBhcyB0
aGV5IHNob3VsZCBiZSBjb25zaWRlcmVkIGV2ZW4gd2l0aG91dCBjb3JlIHNjaGVkdWxpbmcuCgpD
aGFuZ2VzIGluIFYyOgotIG9yaWdpbmFsIHBhdGNoIDEgZHJvcHBlZCwgYXMgYWxyZWFkeSBhcHBs
aWVkCi0gbmV3IHBhdGNoIDEgcmVtb3ZpbmcgZGVhZCBjb2RpbmcgYW5kIHVubmVlZGVkIHBpbm5p
bmcKLSBhZGRyZXNzZWQgdmFyaW91cyBjb21tZW50cyBpbiBwYXRjaCAyCgpKdWVyZ2VuIEdyb3Nz
ICgyKToKICB4ZW4veDg2OiBjbGVhbnVwIHVudXNlZCBOTUkvTUNFIGNvZGUKICB4ZW46IG1lcmdl
IHRlbXBvcmFyeSB2Y3B1IHBpbm5pbmcgc2NlbmFyaW9zCgogeGVuL2FyY2gveDg2L3B2L3RyYXBz
LmMgICAgICAgIHwgODggKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICAgfCAxMCArLS0tLQogeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgICAgICAgIHwgIDQgKy0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAg
ICB8ICAyICstCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICAgICAgfCA0NiArKysrKysrKysr
KysrKystLS0tLS0tCiB4ZW4vY29tbW9uL3dhaXQuYyAgICAgICAgICAgICAgfCAzMCArKysrKy0t
LS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi90cmFwcy5oIHwgIDggKystLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zb2Z0aXJxLmggIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
ICAgICAgICB8IDEwICsrLS0tCiA5IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDEy
OCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
