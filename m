Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D869AC01A4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDm7R-0005Kl-My; Fri, 27 Sep 2019 09:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDm7Q-0005K5-DF
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:00:52 +0000
X-Inumbo-ID: 4e199112-e105-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4e199112-e105-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 09:00:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5656AFA9;
 Fri, 27 Sep 2019 09:00:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:00:42 +0200
Message-Id: <20190927090048.28872-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v1 0/6] Add hypervisor sysfs-like support
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
ZmFjZSB0byBhbnkKdXNlciBwcm9ncmFtIG1ha2luZyB1c2Ugb2YgdGhhdCAieGVuLWh5cGZzIiBp
cyBhIG5ldyBsaWJyYXJ5CiJsaWJ4ZW5oeXBmcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCgpD
aGFuZ2VzIGluIFYxOgotIHJlbmFtZWQgeGVuZnMgLT54ZW5oeXBmcwotIGFkZGVkIHdyaXRhYmxl
IGVudHJpZXMgc3VwcG9ydCBhdCB0aGUgaW50ZXJmYWNlIGxldmVsIGFuZCBpbiB0aGUKICB4ZW5o
eXBmcyB0b29sCi0gYWRkZWQgcnVudGltZSBwYXJhbWV0ZXIgcmVhZCBhY2Nlc3MgKGludGVnZXIg
dHlwZSBvbmx5IGZvciBub3cpCi0gYWRkZWQgZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYyBm
b3IgcGF0aCBkZXNjcmlwdGlvbnMKCkp1ZXJnZW4gR3Jvc3MgKDYpOgogIGRvY3M6IGFkZCBmZWF0
dXJlIGRvY3VtZW50IGZvciBYZW4gaHlwZXJ2aXNvciBzeXNmcy1saWtlIHN1cHBvcnQKICB4ZW46
IGFkZCBiYXNpYyBoeXBlcnZpc29yIGZpbGVzeXN0ZW0gc3VwcG9ydAogIGxpYnM6IGFkZCBsaWJ4
ZW5oeXBmcwogIHRvb2xzOiBhZGQgeGVuZnMgdG9vbAogIHhlbjogYWRkIC9idWlsZGluZm8vY29u
ZmlnIGVudHJ5IHRvIGh5cGVydmlzb3IgZmlsZXN5c3RlbQogIHhlbjogYWRkIHJ1bnRpbWUgcGFy
YW1ldGVyIHJlYWRpbmcgc3VwcG9ydCB0byBoeXBmcwoKIC5naXRpZ25vcmUgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAzICsKIGRvY3MvZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYyAg
IHwgMTE5ICsrKysrKysrKysrKysKIGRvY3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MgICAgICAg
IHwgIDcwICsrKysrKysrCiB0b29scy9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICB8ICAg
NiArCiB0b29scy9saWJzL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArCiB0b29scy9s
aWJzL2h5cGZzL01ha2VmaWxlICAgICAgICAgICB8ICAxNCArKwogdG9vbHMvbGlicy9oeXBmcy9j
b3JlLmMgICAgICAgICAgICAgfCAyNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29s
cy9saWJzL2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaCB8ICA2MCArKysrKysrCiB0b29scy9saWJz
L2h5cGZzL2xpYnhlbmh5cGZzLm1hcCAgICB8ICAgOSArCiB0b29scy9saWJzL2h5cGZzL3hlbmh5
cGZzLnBjLmluICAgICB8ICAxMCArKwogdG9vbHMvbWlzYy9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgfCAgIDYgKwogdG9vbHMvbWlzYy94ZW5oeXBmcy5jICAgICAgICAgICAgICAgfCAxMjAgKysr
KysrKysrKysrKwogeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgICAgfCAgIDEgKwog
eGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gveDg2
L2h5cGVyY2FsbC5jICAgICAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gveDg2L3B2L2h5cGVyY2Fs
bC5jICAgICAgICAgfCAgIDEgKwogeGVuL2NvbW1vbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAgMTAgKysKIHhlbi9jb21tb24vaHlwZnMuYyAgICAgICAgICAgICAgICAgIHwgMzMxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAg
ICAgICAgICAgICAgfCAgMjcgKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZXJybm8uaCAgICAgICAg
ICB8ICAgMSArCiB4ZW4vaW5jbHVkZS9wdWJsaWMvaHlwZnMuaCAgICAgICAgICB8IDEyMyArKysr
KysrKysrKysrKwogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICAgICAgICAgICAgfCAgIDEgKwog
eGVuL2luY2x1ZGUveGVuL2h5cGVyY2FsbC5oICAgICAgICAgfCAgIDggKwogeGVuL2luY2x1ZGUv
eGVuL2h5cGZzLmggICAgICAgICAgICAgfCAgNDAgKysrKysKIHhlbi9pbmNsdWRlL3hlbi9rZXJu
ZWwuaCAgICAgICAgICAgIHwgICAyICsKIHhlbi90b29scy9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgIHwgICA5ICstCiB4ZW4vdG9vbHMvYmluMmMuYyAgICAgICAgICAgICAgICAgICB8ICAyOCAr
KysKIDI3IGZpbGVzIGNoYW5nZWQsIDEyNTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2ZlYXR1cmVzL2h5cGVydmlzb3Jmcy5wYW5kb2MKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvbGlicy9oeXBmcy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL2xpYnMvaHlwZnMvY29yZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy9oeXBm
cy9pbmNsdWRlL3hlbmh5cGZzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2h5cGZz
L2xpYnhlbmh5cGZzLm1hcAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvaHlwZnMveGVu
aHlwZnMucGMuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9taXNjL3hlbmh5cGZzLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL2h5cGZzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vaW5jbHVkZS9wdWJsaWMvaHlwZnMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRl
L3hlbi9oeXBmcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rvb2xzL2JpbjJjLmMKCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
