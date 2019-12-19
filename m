Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58485125C2A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 08:45:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihqS1-0001Yj-IF; Thu, 19 Dec 2019 07:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihqS0-0001YU-9U
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 07:42:24 +0000
X-Inumbo-ID: 13f5ab46-2233-11ea-915c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13f5ab46-2233-11ea-915c-12813bfff9fa;
 Thu, 19 Dec 2019 07:42:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68465B280;
 Thu, 19 Dec 2019 07:42:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 19 Dec 2019 08:42:07 +0100
Message-Id: <20191219074209.17277-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/2] xen: make more debugger support code
 conditional
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBmb3IgZGVidWdnaW5nIHRoZSBoeXBlcnZpc29yIG9mIGd1ZXN0cyB2aWEgZ2RiL2dk
YnN4IHNob3VsZCBiZQpjb25maWd1cmFibGUuCgpDaGFuZ2VzIGluIFYzOgotIHJlbW92ZSBwb3Nz
aWJpbGl0eSB0byBhY2Nlc3MgaHlwZXJ2aXNvciBtZW1vcnkgdmlhIGdkYnN4IGRvbWN0bAotIGRl
ZmF1bHQgZ2Ric3ggc3VwcG9ydCB0byBvbgotIHNvbWUgY29kZSBtb3ZpbmcKCkNoYW5nZXMgaW4g
VjI6Ci0gc3BsaXQgc3VwcG9ydCBmb3IgZ2Ric3R1YiBhbmQgZ2Ric3ggKEFuZHJldyBDb29wZXIp
CgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ZW46IHB1dCBtb3JlIGNvZGUgdW5kZXIgQ09ORklHX0NS
QVNIX0RFQlVHCiAgeGVuOiBtYWtlIGdkYnN4IHN1cHBvcnQgY29uZmlndXJhYmxlCgogeGVuL0tj
b25maWcuZGVidWcgICAgICAgICAgICAgICB8ICA4ICsrKysrCiB4ZW4vYXJjaC94ODYvS2NvbmZp
ZyAgICAgICAgICAgIHwgIDEgLQogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC94ODYvZGVidWcuYyAgICAgICAgICAgIHwgNzggKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAg
ICAgfCAxMyArKysrKysrCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgIHwgIDQgKysr
CiB4ZW4vYXJjaC94ODYvaHZtL3ZteC9yZWFsbW9kZS5jIHwgIDEgKwogeGVuL2NvbW1vbi9LY29u
ZmlnICAgICAgICAgICAgICB8ICAzIC0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAg
IHwgMTQgLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZGVidWdnZXIuaCAgfCAzNCArKysr
KysrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgfCAgMSAtCiAx
MSBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAxMDEgZGVsZXRpb25zKC0pCgotLSAK
Mi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
