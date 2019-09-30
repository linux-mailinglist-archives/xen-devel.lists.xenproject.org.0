Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E712EC1AE3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:23:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo8E-00021b-Mc; Mon, 30 Sep 2019 05:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEo8D-00020w-IR
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:21:57 +0000
X-Inumbo-ID: 3121f678-e342-11e9-96c8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3121f678-e342-11e9-96c8-12813bfff9fa;
 Mon, 30 Sep 2019 05:21:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C9A3B0CC;
 Mon, 30 Sep 2019 05:21:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 07:21:27 +0200
Message-Id: <20190930052135.11257-12-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190930052135.11257-1-jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 11/19] xen/sched: reject switching smt on/off
 with core scheduling active
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

V2hlbiBjb3JlIG9yIHNvY2tldCBzY2hlZHVsaW5nIGFyZSBhY3RpdmUgZW5hYmxpbmcgb3IgZGlz
YWJsaW5nIHNtdCBpcwpub3QgcG9zc2libGUgYXMgdGhhdCB3b3VsZCByZXF1aXJlIGEgbWFqb3Ig
aG9zdCByZWNvbmZpZ3VyYXRpb24uCgpBZGQgYSBib29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRj
aGluZyB3aGljaCB3aWxsIGJlIHNldCBmb3IgY29yZSBvcgpzb2NrZXQgc2NoZWR1bGluZy4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxk
ZmFnZ2lvbGlAc3VzZS5jb20+Ci0tLQpWMToKLSBuZXcgcGF0Y2gKVjI6Ci0gRUJVU1kgYXMgcmV0
dXJuIGNvZGUgKEphbiBCZXVsaWNoLCBEYXJpbyBGYWdnaW9saSkKLSBfX3JlYWRfbW9zdGx5IGZv
ciBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmcgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNo
L3g4Ni9zeXNjdGwuYyAgIHwgNSArKysrKwogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCAxICsK
IHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYyBiL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYwppbmRleCAzNzQyZWRlNjFiLi40YTc2ZjBmNDdmIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc3lzY3RsLmMKKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCkBAIC0yMDksNiAr
MjA5LDExIEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoCiAgICAgICAgICAgICAgICAgcmV0ID0gLUVP
UE5PVFNVUFA7CiAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICB9CisgICAgICAg
ICAgICBpZiAoIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZyApCisgICAgICAgICAgICB7Cisg
ICAgICAgICAgICAgICAgcmV0ID0gLUVCVVNZOworICAgICAgICAgICAgICAgIGJyZWFrOworICAg
ICAgICAgICAgfQogICAgICAgICAgICAgcGx1ZyA9IG9wID09IFhFTl9TWVNDVExfQ1BVX0hPVFBM
VUdfU01UX0VOQUJMRTsKICAgICAgICAgICAgIGZuID0gc210X3VwX2Rvd25faGVscGVyOwogICAg
ICAgICAgICAgaGNwdSA9IF9wKHBsdWcpOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDI0OWZmOGE4ODIuLjBkY2YwMDRkNzgg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKQEAgLTYzLDYgKzYzLDcgQEAgaW50ZWdlcl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3Vz
Iiwgc2NoZWRfcmF0ZWxpbWl0X3VzKTsKIAogLyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qg
c2NoZWRfdW5pdC4gKi8KIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBzY2hlZF9n
cmFudWxhcml0eSA9IDE7Citib29sIF9fcmVhZF9tb3N0bHkgc2NoZWRfZGlzYWJsZV9zbXRfc3dp
dGNoaW5nOwogY29uc3QgY3B1bWFza190ICpzY2hlZF9yZXNfbWFzayA9ICZjcHVtYXNrX2FsbDsK
IAogLyogQ29tbW9uIGxvY2sgZm9yIGZyZWUgY3B1cy4gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggZjk3MzAzNjY4
YS4uYWE4MjU3ZWRjOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKQEAgLTEwMzcsNiArMTAzNyw3IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBpc19pb21tdV9lbmFibGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB9CiAKIGV4
dGVybiBib29sIHNjaGVkX3NtdF9wb3dlcl9zYXZpbmdzOworZXh0ZXJuIGJvb2wgc2NoZWRfZGlz
YWJsZV9zbXRfc3dpdGNoaW5nOwogCiBleHRlcm4gZW51bSBjcHVmcmVxX2NvbnRyb2xsZXIgewog
ICAgIEZSRVFDVExfbm9uZSwgRlJFUUNUTF9kb20wX2tlcm5lbCwgRlJFUUNUTF94ZW4KLS0gCjIu
MTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
