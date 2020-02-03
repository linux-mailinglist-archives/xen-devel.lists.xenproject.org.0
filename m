Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91F150530
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:25:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZnW-0002Dv-JA; Mon, 03 Feb 2020 11:21:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6AKB=3X=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iyZnU-0002Dq-Os
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:21:44 +0000
X-Inumbo-ID: 5941a386-4677-11ea-8e4d-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5941a386-4677-11ea-8e4d-12813bfff9fa;
 Mon, 03 Feb 2020 11:21:41 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 18341B9F2C0E3571267B;
 Mon,  3 Feb 2020 19:21:39 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 3 Feb 2020
 19:21:32 +0800
From: Wei Xu <xuwei5@hisilicon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <5E38023B.8090306@hisilicon.com>
Date: Mon, 3 Feb 2020 19:21:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: [Xen-devel]  [PATCH v3] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 xuwei5@hisilicon.com, Shameerali Kolothum
 Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGFyc2UgdGhlIEFDUEkgU1BDUiB0YWJsZSBhbmQgaW5pdGlhbGl6ZSB0aGUgMTY1NTAgY29tcGF0
aWJsZSBzZXJpYWwgcG9ydApmb3IgQVJNIG9ubHkuIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQg
b25lIFVBUlQgb24gQVJNLiBTb21lIGZpZWxkcwp3aGljaCB3ZSBkbyBub3QgY2FyZSB5ZXQgb24g
QVJNIGFyZSBpZ25vcmVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29u
LmNvbT4KCi0tLQpDaGFuZ2VzIGluIHYzOgotIGFkZHJlc3MgdGhlIGNvZGUgc3R5bGUgY29tbWVu
dHMgZnJvbSBKYW4KLSB1c2UgY29udGFpbmVyX29mIHRvIGRvIGNhc3QKLSBsaXN0IGFsbCBmaWVs
ZHMgd2UgaWdub3JlZAotIGNoZWNrIHRoZSBjb25zb2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVk
IG9yIG5vdCBiZWZvcmUgaW5pdCB0aGUgdWFydAotIGluaXQgdGhlIHVhcnQgaW9fc2l6ZSBhbmQg
d2lkdGggdmlhIHNwY3ItPnNlcmlhbF9wb3J0CgpDaGFuZ2VzIGluIHYyOgotIGltcHJvdmUgY29t
bWl0IG1lc3NhZ2UKLSByZW1vdmUgdGhlIHNwY3IgaW5pdGlhbGl6YXRpb24KLSBhZGQgY29tbWVu
dHMgZm9yIHRoZSB1YXJ0IGluaXRpYWxpemF0aW9uIGFuZCBjb25maWd1cmF0aW9uCi0gYWRqdXN0
IHRoZSBjb2RlIHN0eWxlIGlzc3VlCi0gbGltaXQgdGhlIGNvZGUgb25seSBidWlsdCBvbiBBQ1BJ
IGFuZCBBUk0KLS0tCiB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyB8IDc1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgYi94
ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwppbmRleCBhYTg3YzU3Li43NDFiNTEwIDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYworKysgYi94ZW4vZHJpdmVycy9jaGFyL25z
MTY1NTAuYwpAQCAtMTYyMCw2ICsxNjIwLDgxIEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAi
TlMxNjU1MCBVQVJUIiwgREVWSUNFX1NFUklBTCkKIERUX0RFVklDRV9FTkQKCiAjZW5kaWYgLyog
SEFTX0RFVklDRV9UUkVFICovCisKKyNpZiBkZWZpbmVkKENPTkZJR19BQ1BJKSAmJiBkZWZpbmVk
KENPTkZJR19BUk0pCisjaW5jbHVkZSA8eGVuL2FjcGkuaD4KKworc3RhdGljIGludCBfX2luaXQg
bnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2b2lkICpkYXRhKQoreworICAgIHN0cnVjdCBh
Y3BpX3RhYmxlX2hlYWRlciAqdGFibGU7CisgICAgc3RydWN0IGFjcGlfdGFibGVfc3BjciAqc3Bj
cjsKKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7CisgICAgLyoKKyAgICAgKiBTYW1lIGFzIHRoZSBE
VCBwYXJ0LgorICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBBUk0gd2hpY2ggaGFwcGVu
IHRvIGJlIG5zMTY1NTBfY29tWzBdLgorICAgICAqLworICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0
ID0gJm5zMTY1NTBfY29tWzBdOworCisgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9T
SUdfU1BDUiwgMCwgJnRhYmxlKTsKKyAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKKyAg
ICB7CisgICAgICAgIHByaW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4i
KTsKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQorCisgICAgc3BjciA9IGNvbnRhaW5l
cl9vZih0YWJsZSwgc3RydWN0IGFjcGlfdGFibGVfc3BjciwgaGVhZGVyKTsKKworICAgIC8qCisg
ICAgICogVGhlIHNlcmlhbCBwb3J0IGFkZHJlc3MgbWF5IGJlIDAgZm9yIGV4YW1wbGUKKyAgICAg
KiBpZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KKyAgICAgKi8KKyAgICBp
ZiAoIHVubGlrZWx5KCFzcGNyLT5zZXJpYWxfcG9ydC5hZGRyZXNzKSApCisgICAgeworICAgICAg
ICBwcmludGsoIm5zMTY1NTA6IHRoZSBzZXJpYWwgcG9ydCBhZGRyZXNzIGlzIGludmFsaWRcbiIp
OworICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKKyAgICBuczE2NTUwX2luaXRfY29t
bW9uKHVhcnQpOworCisgICAgLyoKKyAgICAgKiBUaGUgYmF1ZCByYXRlIGlzIHByZS1jb25maWd1
cmVkIGJ5IHRoZSBmaXJtd2FyZS4KKyAgICAgKiBBbmQgY3VycmVudGx5IHRoZSBBQ1BJIHBhcnQg
aXMgb25seSB0YXJnZXRpbmcgQVJNIHNvIHRoZSBmb2xsb3dpbmcKKyAgICAgKiBmaWVsZHMgcGNf
aW50ZXJydXB0LCBwY2lfZGV2aWNlX2lkLCBwY2lfdmVuZG9yX2lkLCBwY2lfYnVzLCBwY2lfZGV2
aWNlLAorICAgICAqIHBjaV9mdW5jdGlvbiwgcGNpX2ZsYWdzLCBwY2lfc2VnbWVudCBhbmQgZmxv
d19jb250cm9sIHdoaWNoIHdlIGRvIG5vdAorICAgICAqIGNhcmUgeWV0IGFyZSBpZ25vcmVkLgor
ICAgICAqLworICAgIHVhcnQtPmJhdWQgPSBCQVVEX0FVVE87CisgICAgdWFydC0+ZGF0YV9iaXRz
ID0gODsKKyAgICB1YXJ0LT5wYXJpdHkgPSBzcGNyLT5wYXJpdHk7CisgICAgdWFydC0+c3RvcF9i
aXRzID0gc3Bjci0+c3RvcF9iaXRzOworICAgIHVhcnQtPmlvX2Jhc2UgPSBzcGNyLT5zZXJpYWxf
cG9ydC5hZGRyZXNzOworICAgIHVhcnQtPmlvX3NpemUgPSBzcGNyLT5zZXJpYWxfcG9ydC5iaXRf
d2lkdGg7CisgICAgdWFydC0+cmVnX3NoaWZ0ID0gc3Bjci0+c2VyaWFsX3BvcnQuYml0X29mZnNl
dDsKKyAgICB1YXJ0LT5yZWdfd2lkdGggPSBzcGNyLT5zZXJpYWxfcG9ydC5hY2Nlc3Nfd2lkdGg7
CisKKyAgICAvKiBUaGUgdHJpZ2dlci9wb2xhcml0eSBpbmZvcm1hdGlvbiBpcyBub3QgYXZhaWxh
YmxlIGluIHNwY3IuICovCisgICAgaXJxX3NldF90eXBlKHNwY3ItPmludGVycnVwdCwgSVJRX1RZ
UEVfTEVWRUxfSElHSCk7CisgICAgdWFydC0+aXJxID0gc3Bjci0+aW50ZXJydXB0OworCisgICAg
dWFydC0+dnVhcnQuYmFzZV9hZGRyID0gdWFydC0+aW9fYmFzZTsKKyAgICB1YXJ0LT52dWFydC5z
aXplID0gdWFydC0+aW9fc2l6ZTsKKyAgICB1YXJ0LT52dWFydC5kYXRhX29mZiA9IFVBUlRfVEhS
IDw8IHVhcnQtPnJlZ19zaGlmdDsKKyAgICB1YXJ0LT52dWFydC5zdGF0dXNfb2ZmID0gVUFSVF9M
U1IgPDwgdWFydC0+cmVnX3NoaWZ0OworICAgIHVhcnQtPnZ1YXJ0LnN0YXR1cyA9IFVBUlRfTFNS
X1RIUkUgfCBVQVJUX0xTUl9URU1UOworCisgICAgLyogUmVnaXN0ZXIgd2l0aCBnZW5lcmljIHNl
cmlhbCBkcml2ZXIuICovCisgICAgc2VyaWFsX3JlZ2lzdGVyX3VhcnQoU0VSSE5EX0RUVUFSVCwg
Jm5zMTY1NTBfZHJpdmVyLCB1YXJ0KTsKKworICAgIHJldHVybiAwOworfQorCitBQ1BJX0RFVklD
RV9TVEFSVChhbnMxNjU1MCwgIk5TMTY1NTAgVUFSVCIsIERFVklDRV9TRVJJQUwpCisgICAgLmNs
YXNzX3R5cGUgPSBBQ1BJX0RCRzJfMTY1NTBfQ09NUEFUSUJMRSwKKyAgICAuaW5pdCA9IG5zMTY1
NTBfYWNwaV91YXJ0X2luaXQsCitBQ1BJX0RFVklDRV9FTkQKKworI2VuZGlmIC8qIENPTkZJR19B
Q1BJICYmIENPTkZJR19BUk0gKi8KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6
IEMKLS0gCjIuOC4xCgoKLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
