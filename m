Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E072D91
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:29:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFQJ-00029p-Gm; Wed, 24 Jul 2019 11:27:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqFQI-00029O-7Y
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:27:06 +0000
X-Inumbo-ID: f5daed48-ae05-11e9-8dc0-33e8eeb9d186
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5daed48-ae05-11e9-8dc0-33e8eeb9d186;
 Wed, 24 Jul 2019 11:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E971AAECB;
 Wed, 24 Jul 2019 11:27:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2019 13:26:56 +0200
Message-Id: <20190724112658.31495-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/2] xen: enhance temporary vcpu pinning
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
bmcKLSBhZGRyZXNzZWQgdmFyaW91cyBjb21tZW50cyBpbiBwYXRjaCAyCgpDaGFuZ2VzIGluIFYz
OgotIG1pbm9yIGNvbW1lbnRzIGFkZHJlc3NlZAoKSnVlcmdlbiBHcm9zcyAoMik6CiAgeGVuL3g4
NjogY2xlYW51cCB1bnVzZWQgTk1JL01DRSBjb2RlCiAgeGVuOiBtZXJnZSB0ZW1wb3JhcnkgdmNw
dSBwaW5uaW5nIHNjZW5hcmlvcwoKIHhlbi9hcmNoL3g4Ni9wdi90cmFwcy5jICAgICAgICB8IDkz
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2
L3RyYXBzLmMgICAgICAgICAgIHwgMTAgKy0tLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAg
ICAgICB8ICA0ICstCiB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgfCAgMiArLQogeGVu
L2NvbW1vbi9zY2hlZHVsZS5jICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKy0tLS0tLS0K
IHhlbi9jb21tb24vd2FpdC5jICAgICAgICAgICAgICB8IDMwICsrKysrLS0tLS0tLS0tCiB4ZW4v
aW5jbHVkZS9hc20teDg2L3B2L3RyYXBzLmggfCAgNiArLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
c29mdGlycS5oICB8ICAyICstCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgfCAxMCAr
Ky0tLQogOSBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAxMjkgZGVsZXRpb25zKC0p
CgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
