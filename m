Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193C14027D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 04:48:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isIZ2-00015a-Iz; Fri, 17 Jan 2020 03:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1vaW=3G=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1isIZ0-00015V-Gs
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 03:44:50 +0000
X-Inumbo-ID: af6708f4-38db-11ea-b89f-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af6708f4-38db-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 03:44:39 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 057E82E1E6815E486D0C;
 Fri, 17 Jan 2020 11:44:37 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 11:44:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
To: <julien@xen.org>, <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "Ian Jackson" <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>, Wei Liu <wl@xen.org>,
 <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 11:40:58 +0800
Message-ID: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Subject: [Xen-devel]  [PATCH] ns16550: Add ACPI support
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
Cc: prime.zeng@hisilicon.com, shameerali.kolothum.thodi@huawei.com,
 xuwei5@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGFyc2UgdGhlIEFDUEkgU1BDUiB0YWJsZSBhbmQgaW5pdGlhbGl6ZSB0aGUgMTY1NTAgY29tcGF0
aWJsZQpzZXJpYWwgcG9ydC4KClNpZ25lZC1vZmYtYnk6IFdlaSBYdSA8eHV3ZWk1QGhpc2lsaWNv
bi5jb20+Ci0tLQogeGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgfCA1NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVu
L2RyaXZlcnMvY2hhci9uczE2NTUwLmMKaW5kZXggYWE4N2M1Ny4uZWIzMjg5MSAxMDA2NDQKLS0t
IGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2
NTUwLmMKQEAgLTE2MjAsNiArMTYyMCw2MSBAQCBEVF9ERVZJQ0VfU1RBUlQobnMxNjU1MCwgIk5T
MTY1NTAgVUFSVCIsIERFVklDRV9TRVJJQUwpCiBEVF9ERVZJQ0VfRU5ECiAKICNlbmRpZiAvKiBI
QVNfREVWSUNFX1RSRUUgKi8KKworI2lmZGVmIENPTkZJR19BQ1BJCisjaW5jbHVkZSA8eGVuL2Fj
cGkuaD4KKworc3RhdGljIGludCBfX2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2
b2lkICpkYXRhKQoreworICAgIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IgKnNwY3IgPSBOVUxMOwor
ICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKKyAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFydDsKKworICAg
IHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1IsIDAsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqKikmc3Bjcik7CisKKyAg
ICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKKyAgICB7CisgICAgICAgIHByaW50aygibnMx
NjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7CisgICAgfQorCisgICAgdWFydCA9ICZuczE2NTUwX2NvbVswXTsKKworICAgIG5zMTY1NTBf
aW5pdF9jb21tb24odWFydCk7CisKKyAgICB1YXJ0LT5iYXVkICAgICAgPSBCQVVEX0FVVE87Cisg
ICAgdWFydC0+ZGF0YV9iaXRzID0gODsKKyAgICB1YXJ0LT5wYXJpdHkgICAgPSBzcGNyLT5wYXJp
dHk7CisgICAgdWFydC0+c3RvcF9iaXRzID0gc3Bjci0+c3RvcF9iaXRzOworICAgIHVhcnQtPmlv
X2Jhc2UgPSBzcGNyLT5zZXJpYWxfcG9ydC5hZGRyZXNzOworICAgIHVhcnQtPmlvX3NpemUgPSA4
OworICAgIHVhcnQtPnJlZ19zaGlmdCA9IHNwY3ItPnNlcmlhbF9wb3J0LmJpdF9vZmZzZXQ7Cisg
ICAgdWFydC0+cmVnX3dpZHRoID0gMTsKKworICAgIC8qIHRyaWdnZXIvcG9sYXJpdHkgaW5mb3Jt
YXRpb24gaXMgbm90IGF2YWlsYWJsZSBpbiBzcGNyICovCisgICAgaXJxX3NldF90eXBlKHNwY3It
PmludGVycnVwdCwgSVJRX1RZUEVfTEVWRUxfSElHSCk7CisgICAgdWFydC0+aXJxID0gc3Bjci0+
aW50ZXJydXB0OworCisgICAgdWFydC0+dnVhcnQuYmFzZV9hZGRyID0gdWFydC0+aW9fYmFzZTsK
KyAgICB1YXJ0LT52dWFydC5zaXplID0gdWFydC0+aW9fc2l6ZTsKKyAgICB1YXJ0LT52dWFydC5k
YXRhX29mZiA9IFVBUlRfVEhSIDw8IHVhcnQtPnJlZ19zaGlmdDsKKyAgICB1YXJ0LT52dWFydC5z
dGF0dXNfb2ZmID0gVUFSVF9MU1IgPDwgdWFydC0+cmVnX3NoaWZ0OworICAgIHVhcnQtPnZ1YXJ0
LnN0YXR1cyA9IFVBUlRfTFNSX1RIUkUgfCBVQVJUX0xTUl9URU1UOworCisgICAgLyogIFJlZ2lz
dGVyIHdpdGggZ2VuZXJpYyBzZXJpYWwgZHJpdmVyLiAqLworICAgIHNlcmlhbF9yZWdpc3Rlcl91
YXJ0KHVhcnQgLSBuczE2NTUwX2NvbSwgJm5zMTY1NTBfZHJpdmVyLCB1YXJ0KTsKKworICAgIHJl
dHVybiAwOworfQorCitBQ1BJX0RFVklDRV9TVEFSVChhbnMxNjU1MCwgIk5TMTY1NTAgVUFSVCIs
IERFVklDRV9TRVJJQUwpCisgICAgLmNsYXNzX3R5cGUgPSBBQ1BJX0RCRzJfMTY1NTBfQ09NUEFU
SUJMRSwKKyAgICAuaW5pdCA9IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQsCitBQ1BJX0RFVklDRV9F
TkQKKworI2VuZGlmIC8qIENPTkZJR19BQ1BJICovCisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6
CiAgKiBtb2RlOiBDCi0tIAoyLjguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
