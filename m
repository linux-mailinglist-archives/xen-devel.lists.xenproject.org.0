Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B0926B9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:30:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzicf-0007Hi-Ut; Mon, 19 Aug 2019 14:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzice-0007Hd-C4
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 14:27:00 +0000
X-Inumbo-ID: 66f5bce2-c28d-11e9-aee9-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 66f5bce2-c28d-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 14:26:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4429028;
 Mon, 19 Aug 2019 07:26:58 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 093FB3F718;
 Mon, 19 Aug 2019 07:26:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 15:26:49 +0100
Message-Id: <20190819142651.11058-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v4 0/2] More typesafe conversion of common
 interface
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
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Brian Woods <brian.woods@amd.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhlIGZpcnN0IHBhdGNoIHdhcyBvcmlnaW5hbGx5IHNlbmQgYXMgcGFydCBvZiB0
aGUgc2VyaWVzICJ4ZW4vYXJtOiBBZGQKeGVudHJhY2Ugc3VwcG9ydCIgWzFdLiBBcyBhbGwgdGhl
IHdvcmsgYnV0IHRoaXMgcGF0Y2ggd2FzIG1lcmdlZCB0aGUKc2VyaWVzIGlzIG5vdyByZW5hbWVk
LgoKVGhlcmUgYXJlIGFuIGFkZGl0aW9uYWwgcGF0Y2ggZm9yIHN3aXRjaGluZyBtYXBfdmNwdV9p
bmZvIHRvIHVzZQp0eXBlc2FmZSBnZm4uCgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW4u
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNnMDIxMzMuaHRtbAoKSnVsaWVu
IEdyYWxsICgyKToKICB4ZW46IFN3aXRjaCBwYXJhbWV0ZXIgaW4gZ2V0X3BhZ2VfZnJvbV9nZm4g
dG8gdXNlIHR5cGVzYWZlIGdmbgogIHhlbi9kb21haW46IFVzZSB0eXBlc2FmZSBnZm4gaW4gbWFw
X3ZjcHVfaW5mbwoKIHhlbi9hcmNoL2FybS9ndWVzdGNvcHkuYyAgICAgICAgICAgICB8ICAyICst
CiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gv
eDg2L2NwdS92cG11LmMgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9kb21jdGwu
YyAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogeGVuL2FyY2gveDg2L2h2bS9kbS5jICAgICAg
ICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vZG9tYWluLmMgICAgICAgICAgICB8
ICA2ICsrKystLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgIHwgIDkgKysr
KystLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgICAgfCAgOCArKysrLS0t
LQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jIHwgMTYgKysrKysrKystLS0t
LS0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICAgICAgIHwgIDQgKystLQogeGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4v
YXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKy0tLS0t
LS0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4v
YXJjaC94ODYvbW0vc2hhZG93L2h2bS5jICAgICAgICAgfCAgNiArKystLS0KIHhlbi9hcmNoL3g4
Ni9waHlzZGV2LmMgICAgICAgICAgICAgICB8ICAzICsrLQogeGVuL2FyY2gveDg2L3B2L2Rlc2Ny
aXB0b3ItdGFibGVzLmMgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5j
ICAgICAgIHwgIDYgKysrLS0tCiB4ZW4vYXJjaC94ODYvcHYvbW0uYyAgICAgICAgICAgICAgICAg
fCAgMiArLQogeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgIHwgMTEgKysrKysr
LS0tLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIHhl
bi9jb21tb24vZXZlbnRfZmlmby5jICAgICAgICAgICAgICB8IDEyICsrKysrKy0tLS0tLQogeGVu
L2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogeGVuL2luY2x1ZGUv
YXNtLWFybS9wMm0uaCAgICAgICAgICAgIHwgIDYgKysrLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2
L3AybS5oICAgICAgICAgICAgfCAxNiArKysrKysrKysrKystLS0tCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvdmNwdS5oICAgICAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oICAg
ICAgICAgICAgIHwgIDIgKy0KIDI2IGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDc4
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
