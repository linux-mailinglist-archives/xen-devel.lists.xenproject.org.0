Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96558714F4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 11:23:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpqyl-0003qt-V4; Tue, 23 Jul 2019 09:21:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpqyk-0003qe-Ic
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 09:21:02 +0000
X-Inumbo-ID: 2f652970-ad2b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f652970-ad2b-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 09:21:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59BD0AD7F;
 Tue, 23 Jul 2019 09:20:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 11:20:54 +0200
Message-Id: <20190723092056.15045-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] xen: fix/enhance temporary vcpu pinning
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgdHJ5aW5nIHRvIGhhbmRsZSB0ZW1wb3JhcnkgdmNwdSBwaW5uaW5ncyBpbiBhIHNhbmUg
d2F5IGluIG15CmNvcmUgc2NoZWR1bGluZyBzZXJpZXMgSSBzdHVtYmxlZCBvdmVyIGEgYnVnIGFu
ZCBmb3VuZCBhIG5pY2Ugd2F5IHRvCnNpbXBsaWZ5IHRoZSB0ZW1wb3JhcnkgcGlubmluZyBjYXNl
cy4KCkknbSBzZW5kaW5nIHRoZSB0d28gcGF0Y2hlcyBpbmRlcGVuZGVudGx5IGZyb20gbXkgY29y
ZSBzY2hlZHVsaW5nCnNlcmllcyBhcyB0aGV5IHNob3VsZCBiZSBjb25zaWRlcmVkIGV2ZW4gd2l0
aG91dCBjb3JlIHNjaGVkdWxpbmcuCgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ZW4vc2NoZWQ6IGZp
eCBsb2NraW5nIGluIHJlc3RvcmVfdmNwdV9hZmZpbml0eSgpCiAgeGVuOiBtZXJnZSB0ZW1wb3Jh
cnkgdmNwdSBwaW5uaW5nIHNjZW5hcmlvcwoKIHhlbi9hcmNoL3g4Ni9wdi90cmFwcy5jIHwgMjAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgIHwgIDggKystLS0t
LS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgIHwgIDQgKy0tLQogeGVuL2NvbW1vbi9zY2hlZHVs
ZS5jICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4v
Y29tbW9uL3dhaXQuYyAgICAgICB8IDI2ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCB8ICA4ICsrKysrLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDQ1IGlu
c2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
