Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC72C474
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZRB-0006uV-TM; Tue, 28 May 2019 10:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQH-0004yt-30
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:37 +0000
X-Inumbo-ID: 08adfb80-8134-11e9-914a-c75b1fe74b72
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08adfb80-8134-11e9-914a-c75b1fe74b72;
 Tue, 28 May 2019 10:33:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 498ECB052;
 Tue, 28 May 2019 10:33:29 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:33:02 +0200
Message-Id: <20190528103313.1343-50-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 49/60] xen/sched: reject switching smt on/off
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
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYxOiBuZXcg
cGF0Y2gKLS0tCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICB8IDMgKystCiB4ZW4vY29tbW9uL3Nj
aGVkdWxlLmMgICB8IDEgKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsKIDMgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IDNmMDZmZWNi
ZDguLjAzNGQ3OGZlNjcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94
ZW4vYXJjaC94ODYvc3lzY3RsLmMKQEAgLTIwMCw3ICsyMDAsOCBAQCBsb25nIGFyY2hfZG9fc3lz
Y3RsKAogCiAgICAgICAgIGNhc2UgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRU5BQkxFOgog
ICAgICAgICBjYXNlIFhFTl9TWVNDVExfQ1BVX0hPVFBMVUdfU01UX0RJU0FCTEU6Ci0gICAgICAg
ICAgICBpZiAoICFjcHVfaGFzX2h0dCB8fCBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGluZ3Mg
PCAyICkKKyAgICAgICAgICAgIGlmICggIWNwdV9oYXNfaHR0IHx8IGJvb3RfY3B1X2RhdGEueDg2
X251bV9zaWJsaW5ncyA8IDIgfHwKKyAgICAgICAgICAgICAgICAgc2NoZWRfZGlzYWJsZV9zbXRf
c3dpdGNoaW5nICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9U
U1VQUDsKICAgICAgICAgICAgICAgICBicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCAzYzg1ODYxYjE1Li44NjA3MjYy
YTcxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jCkBAIC01Nyw2ICs1Nyw3IEBAIGludGVnZXJfcGFyYW0oInNjaGVkX3JhdGVsaW1p
dF91cyIsIHNjaGVkX3JhdGVsaW1pdF91cyk7CiAKIC8qIE51bWJlciBvZiB2Y3B1cyBwZXIgc3Ry
dWN0IHNjaGVkX3VuaXQuICovCiBzdGF0aWMgdW5zaWduZWQgaW50IHNjaGVkX2dyYW51bGFyaXR5
ID0gMTsKK2Jvb2wgc2NoZWRfZGlzYWJsZV9zbXRfc3dpdGNoaW5nOwogY29uc3QgY3B1bWFza190
ICpzY2hlZF9yZXNfbWFzayA9ICZjcHVtYXNrX2FsbDsKIAogLyogVmFyaW91cyB0aW1lciBoYW5k
bGVycy4gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1
ZGUveGVuL3NjaGVkLmgKaW5kZXggYjY0OTZmNTdmNi4uN2RjNjNjNDQ5YiAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKQEAg
LTEwMjAsNiArMTAyMCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc192Y3B1X29ubGluZShjb25z
dCBzdHJ1Y3QgdmNwdSAqdikKIH0KIAogZXh0ZXJuIGJvb2wgc2NoZWRfc210X3Bvd2VyX3Nhdmlu
Z3M7CitleHRlcm4gYm9vbCBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmc7CiAKIGV4dGVybiBl
bnVtIGNwdWZyZXFfY29udHJvbGxlciB7CiAgICAgRlJFUUNUTF9ub25lLCBGUkVRQ1RMX2RvbTBf
a2VybmVsLCBGUkVRQ1RMX3hlbgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
