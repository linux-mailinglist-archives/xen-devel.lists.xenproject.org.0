Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79E162608
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:24:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41se-0006hQ-7Q; Tue, 18 Feb 2020 12:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j41sc-0006h9-R6
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:21:34 +0000
X-Inumbo-ID: 29ec8956-5249-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29ec8956-5249-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 12:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49E18B366;
 Tue, 18 Feb 2020 12:21:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Feb 2020 13:21:10 +0100
Message-Id: <20200218122114.17596-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with core
 scheduling
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIFJDVSBoYW5kbGluZyBpbiBYZW4gaXMgYWZmZWN0aW5nIHNjaGVkdWxpbmcgaW4g
c2V2ZXJhbCB3YXlzLgpJdCBpcyByYWlzaW5nIHNjaGVkIHNvZnRpcnFzIHdpdGhvdXQgYW55IHJl
YWwgbmVlZCBhbmQgaXQgcmVxdWlyZXMKdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNo
IGludGVyYWN0cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KClRoaXMgc21hbGwgc2VyaWVz
IHJlcGFpcnMgdGhvc2UgaXNzdWVzLgoKQWRkaXRpb25hbGx5IHNvbWUgQVNTRVJUKClzIGFyZSBh
ZGRlZCBmb3IgdmVyaWZpY2F0aW9uIG9mIHNhbmUgcmN1CmhhbmRsaW5nLiBJbiBvcmRlciB0byBh
dm9pZCB0aG9zZSB0cmlnZ2VyaW5nIHJpZ2h0IGF3YXkgdGhlIG9idmlvdXMKdmlvbGF0aW9ucyBh
cmUgZml4ZWQuCgpDaGFuZ2VzIGluIFYyOgotIHVzZSBnZXRfY3B1X21hcHMoKSBpbiByY3VfYmFy
cmllcigpIGhhbmRsaW5nCi0gYXZvaWQgcmVjdXJzaW9uIGluIHJjdV9iYXJyaWVyKCkgaGFuZGxp
bmcKLSBuZXcgcGF0Y2hlcyAzIGFuZCA0CgpKdWVyZ2VuIEdyb3NzICg0KToKICB4ZW4vcmN1OiB1
c2UgcmN1IHNvZnRpcnEgZm9yIGZvcmNpbmcgcXVpZXNjZW50IHN0YXRlCiAgeGVuL3JjdTogZG9u
J3QgdXNlIHN0b3BfbWFjaGluZV9ydW4oKSBmb3IgcmN1X2JhcnJpZXIoKQogIHhlbjogYWRkIHBy
b2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19ub3JjdSgpIGZvciBrZXloYW5kbGVycwogIHhlbi9yY3U6
IGFkZCBhc3NlcnRpb25zIHRvIGRlYnVnIGJ1aWxkCgogeGVuL2FyY2gveDg2L21tL3AybS1lcHQu
YyAgICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbnVtYS5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0KIHhlbi9jb21tb24va2V5aGFuZGxlci5jICAgICAgICAg
ICAgICAgICAgICAgfCAgNiArLQogeGVuL2NvbW1vbi9tdWx0aWNhbGwuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIHhlbi9jb21tb24vcmN1cGRhdGUuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCA5NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogeGVuL2NvbW1vbi9zb2Z0aXJx
LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKystLQogeGVuL2NvbW1vbi93YWl0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9wY2lfYW1kX2lvbW11LmMgfCAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMgICAgICAgICB8ICAyICstCiB4ZW4vZHJpdmVycy92cGNpL21zaS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKy0KIHhlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oICAgICAgICAg
ICAgICAgICAgfCAyMyArKysrKy0tCiB4ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oICAgICAgICAg
ICAgICAgICAgIHwgIDIgKwogMTIgZmlsZXMgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKyksIDQ0
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
