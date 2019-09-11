Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0ADAF5B2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 08:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7vz8-0003cn-LI; Wed, 11 Sep 2019 06:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7vz6-0003ci-T9
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 06:20:08 +0000
X-Inumbo-ID: 3214b538-d45c-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3214b538-d45c-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 06:20:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD84EAF3F;
 Wed, 11 Sep 2019 06:20:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 08:19:56 +0200
Message-Id: <20190911062001.25931-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gdGhlIDIwMTkgWGVuIGRldmVsb3BlciBzdW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0
IHRoZSBYZW4KaHlwZXJ2aXNvciBzaG91bGQgZ2FpbiBzdXBwb3J0IGZvciBhIGhpZXJhcmNoaWNh
bCBuYW1lLXZhbHVlIHN0b3JlCnNpbWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgoK
VGhpcyBpcyBhIGZpcnN0IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgaWRlYSBhZGRpbmcgdGhlIGJh
c2ljCmZ1bmN0aW9uYWxpdHkgdG8gaHlwZXJ2aXNvciBhbmQgdG9vbHMgc2lkZS4gVGhlIGludGVy
ZmFjZSB0byBhbnkKdXNlciBwcm9ncmFtIG1ha2luZyB1c2Ugb2YgdGhhdCAieGVuLXN5c2ZzIiBp
cyBhIG5ldyBsaWJyYXJ5CiJsaWJ4ZW5mcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCgpUaGVy
ZSBhcmUgc3RpbGwgc29tZSBwZW5kaW5nIHF1ZXN0aW9ucywgdGhvc2UgYXJlOgoKLSBhY2Nlc3Mg
cmlnaHRzOgogICsgc2hvdWxkIHdlIGFsbG93IGFjY2VzcyB0byBkb20wIG9ubHksIG9yIHRvIGFs
bCBkb21haW5zLCBvciBzaG91bGQKICAgIHRoYXQgYmUgcG9zc2libGUgdG8gc2V0IHBlciBlbnRy
eT8KICArIGhvdyB0byBpbnRlZ3JhdGUgd2l0aCB4c20/Ci0gZHluYW1pY2FsIGVudHJpZXM6CiAg
KyBkbyB3ZSB3YW50IHN1cHBvcnQgZm9yIGUuZy4gcGVyLWRvbWFpbiBhbmQvb3IgcGVyLWNwdXBv
b2wgZW50cmllcz8KICArIGRvIHdlIHdhbnQgc3VwcG9ydCBmb3IgZGVidWcgYWlkcyAobG9jay1w
cm9maWxpbmcsIGRlYnVndHJhY2UgLi4pPwotIHdyaXRlIGFjY2VzczoKICArIHJ1bnRpbWUgcGFy
YW1ldGVycz8KICArIGRlYnVnZ2luZyBhaWRzPwoKSSBoYXZlIGFkZGVkIGEgc2ltcGxlIGV4YW1w
bGUgaW4gdGhlIGxhc3QgcGF0Y2ggb2YgdGhlIHNlcmllcyBieQpzdXBwb3J0aW5nIGFjY2VzcyB0
byB0aGUgLmNvbmZpZyBmaWxlIHVzZWQgZm9yIGJ1aWxkaW5nIHRoZSBoeXBlcnZpc29yLgoKSnVl
cmdlbiBHcm9zcyAoNSk6CiAgZG9jczogYWRkIGZlYXR1cmUgZG9jdW1lbnQgZm9yIFhlbiBoeXBl
cnZpc29yIHN5c2ZzLWxpa2Ugc3VwcG9ydAogIHhlbjogYWRkIGJhc2ljIGh5cGVydmlzb3IgZmls
ZXN5c3RlbSBzdXBwb3J0CiAgbGliczogYWRkIGxpYnhlbmZzCiAgdG9vbHM6IGFkZCB4ZW5mcyB0
b29sCiAgeGVuOiBhZGQgL2J1aWxkaW5mby9jb25maWcgZW50cnkgdG8gaHlwZXJ2aXNvciBmaWxl
c3lzdGVtCgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGRvY3Mv
ZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYyB8IDExMCArKysrKysrKysrKysrKysKIHRvb2xz
L1J1bGVzLm1rICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiB0b29scy9saWJzL01ha2VmaWxl
ICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvbGlicy9mcy9NYWtlZmlsZSAgICAgICAgICAg
IHwgIDE0ICsrCiB0b29scy9saWJzL2ZzL2NvcmUuYyAgICAgICAgICAgICAgfCAxOTggKysrKysr
KysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2xpYnMvZnMvaW5jbHVkZS94ZW5mcy5oICAgICB8
ICA1NyArKysrKysrKwogdG9vbHMvbGlicy9mcy9saWJ4ZW5mcy5tYXAgICAgICAgIHwgICA4ICsr
CiB0b29scy9saWJzL2ZzL3hlbmZzLnBjLmluICAgICAgICAgfCAgMTAgKysKIHRvb2xzL21pc2Mv
TWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgNiArCiB0b29scy9taXNjL3hlbmZzLmMgICAgICAg
ICAgICAgICAgfCAxMDIgKysrKysrKysrKysrKysKIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAg
ICAgICAgICB8ICAgMSArCiB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jICAgICAgfCAgIDEg
KwogeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL3g4
Ni9wdi9oeXBlcmNhbGwuYyAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAg
ICAgICAgICAgfCAgIDcgKwogeGVuL2NvbW1vbi9maWxlc3lzdGVtLmMgICAgICAgICAgIHwgMjg3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvZXJybm8uaCAgICAgICAgfCAgIDEgKwogeGVuL2luY2x1ZGUvcHVibGljL2ZpbGVzeXN0ZW0u
aCAgIHwgIDk4ICsrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgICAg
ICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZmlsZXN5c3RlbS5oICAgICAgfCAgMzQgKysrKysK
IHhlbi9pbmNsdWRlL3hlbi9oeXBlcmNhbGwuaCAgICAgICB8ICAgOCArKwogeGVuL2luY2x1ZGUv
eGVuL2tlcm5lbC5oICAgICAgICAgIHwgICAyICsKIHhlbi90b29scy9NYWtlZmlsZSAgICAgICAg
ICAgICAgICB8ICAgOSArLQogeGVuL3Rvb2xzL2JpbjJjLmMgICAgICAgICAgICAgICAgIHwgIDI4
ICsrKysKIDI1IGZpbGVzIGNoYW5nZWQsIDk5MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvZnMvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29scy9saWJzL2ZzL2NvcmUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMv
ZnMvaW5jbHVkZS94ZW5mcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy9mcy9saWJ4
ZW5mcy5tYXAKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2ZzL3hlbmZzLnBjLmluCiBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbWlzYy94ZW5mcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2NvbW1vbi9maWxlc3lzdGVtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9w
dWJsaWMvZmlsZXN5c3RlbS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUveGVuL2Zp
bGVzeXN0ZW0uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi90b29scy9iaW4yYy5jCgotLSAKMi4x
Ni40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
