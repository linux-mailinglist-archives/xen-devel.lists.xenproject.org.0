Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A97166CE6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 03:27:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4xy2-0002Sc-52; Fri, 21 Feb 2020 02:23:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gAq2=4J=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j4xy1-0002SW-1F
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 02:23:01 +0000
X-Inumbo-ID: 10f3c20c-5451-11ea-aa99-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10f3c20c-5451-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 02:22:56 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1F52AEF3A4E48F9BA922;
 Fri, 21 Feb 2020 10:22:53 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 21 Feb 2020
 10:22:45 +0800
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E4F3EF4.4050701@hisilicon.com>
Date: Fri, 21 Feb 2020 10:22:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: [Xen-devel]  [PATCH v4] ns16550: Add ACPI support for ARM only
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
 Thodi <shameerali.kolothum.thodi@huawei.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGFyc2UgdGhlIEFDUEkgU1BDUiB0YWJsZSBhbmQgaW5pdGlhbGl6ZSB0aGUgMTY1NTAgY29tcGF0
aWJsZSBzZXJpYWwgcG9ydApmb3IgQVJNIG9ubHkuIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQg
b25lIFVBUlQgb24gQVJNLiBTb21lIGZpZWxkcwp3aGljaCB3ZSBkbyBub3QgY2FyZSB5ZXQgb24g
QVJNIGFyZSBpZ25vcmVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29u
LmNvbT4KCi0tLQpDaGFuZ2VzIGluIHY0OgotIGNoYW5nZSB0aGUgcHJpbnQgd2hlbiB0aGUgc2Vy
aWFsIHBvcnQgYWRkcmVzcyBpcyAwCi0gY2hlY2sgdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3Mgc3Bh
Y2UgaWQgYmVmb3JlIGluaXRpYWxpemluZwotIGNoYW5nZSB0aGUgY29tbWVudCBmb3IgdGhlIGln
bm9yZWQgUENJZSBmaWVsZHMKCkNoYW5nZXMgaW4gdjM6Ci0gYWRkcmVzcyB0aGUgY29kZSBzdHls
ZSBjb21tZW50cyBmcm9tIEphbgotIHVzZSBjb250YWluZXJfb2YgdG8gZG8gY2FzdAotIGxpc3Qg
YWxsIGZpZWxkcyB3ZSBpZ25vcmVkCi0gY2hlY2sgdGhlIGNvbnNvbGUgcmVkaXJlY3Rpb24gaXMg
ZGlzYWJsZWQgb3Igbm90IGJlZm9yZSBpbml0IHRoZSB1YXJ0Ci0gaW5pdCB0aGUgdWFydCBpb19z
aXplIGFuZCB3aWR0aCB2aWEgc3Bjci0+c2VyaWFsX3BvcnQKCkNoYW5nZXMgaW4gdjI6Ci0gaW1w
cm92ZSBjb21taXQgbWVzc2FnZQotIHJlbW92ZSB0aGUgc3BjciBpbml0aWFsaXphdGlvbgotIGFk
ZCBjb21tZW50cyBmb3IgdGhlIHVhcnQgaW5pdGlhbGl6YXRpb24gYW5kIGNvbmZpZ3VyYXRpb24K
LSBhZGp1c3QgdGhlIGNvZGUgc3R5bGUgaXNzdWUKLSBsaW1pdCB0aGUgY29kZSBvbmx5IGJ1aWx0
IG9uIEFDUEkgYW5kIEFSTQotLS0KIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIHwgNzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDc5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1
NTAuYyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCmluZGV4IGFhODdjNTcuLmRjOGFjNGMg
MTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCisrKyBiL3hlbi9kcml2ZXJz
L2NoYXIvbnMxNjU1MC5jCkBAIC0xNjIwLDYgKzE2MjAsODUgQEAgRFRfREVWSUNFX1NUQVJUKG5z
MTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQogRFRfREVWSUNFX0VORAoKICNl
bmRpZiAvKiBIQVNfREVWSUNFX1RSRUUgKi8KKworI2lmIGRlZmluZWQoQ09ORklHX0FDUEkpICYm
IGRlZmluZWQoQ09ORklHX0FSTSkKKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPgorCitzdGF0aWMgaW50
IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCit7CisgICAg
c3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZTsKKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9z
cGNyICpzcGNyOworICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKKyAgICAvKgorICAgICAqIFNhbWUg
YXMgdGhlIERUIHBhcnQuCisgICAgICogT25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTSB3aGlj
aCBoYXBwZW4gdG8gYmUgbnMxNjU1MF9jb21bMF0uCisgICAgICovCisgICAgc3RydWN0IG5zMTY1
NTAgKnVhcnQgPSAmbnMxNjU1MF9jb21bMF07CisKKyAgICBzdGF0dXMgPSBhY3BpX2dldF90YWJs
ZShBQ1BJX1NJR19TUENSLCAwLCAmdGFibGUpOworICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1
cykgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQgdG8gZ2V0IFNQQ1Ig
dGFibGVcbiIpOworICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKKyAgICBzcGNyID0g
Y29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyLCBoZWFkZXIpOworCisg
ICAgLyoKKyAgICAgKiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBs
ZQorICAgICAqIGlmIHRoZSBjb25zb2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVkLgorICAgICAq
LworICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3MpICkKKyAgICB7
CisgICAgICAgIHByaW50aygibnMxNjU1MDogQ29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxl
ZFxuIik7CisgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgIH0KKworICAgIGlmICggdW5saWtl
bHkoc3Bjci0+c2VyaWFsX3BvcnQuc3BhY2VfaWQgIT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01F
TU9SWSkgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBBZGRyZXNzIHNwYWNlIHR5
cGUgaXMgbm90IG1taW9cbiIpOworICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKKyAg
ICBuczE2NTUwX2luaXRfY29tbW9uKHVhcnQpOworCisgICAgLyoKKyAgICAgKiBUaGUgYmF1ZCBy
YXRlIGlzIHByZS1jb25maWd1cmVkIGJ5IHRoZSBmaXJtd2FyZS4KKyAgICAgKiBBbmQgY3VycmVu
dGx5IHRoZSBBQ1BJIHBhcnQgaXMgb25seSB0YXJnZXRpbmcgQVJNIHNvIHRoZSBmbG93X2NvbnRy
b2wKKyAgICAgKiBmaWVsZCBhbmQgYWxsIFBDSSByZWxhdGVkIG9uZXMgd2hpY2ggd2UgZG8gbm90
IGNhcmUgeWV0IGFyZSBpZ25vcmVkLgorICAgICAqLworICAgIHVhcnQtPmJhdWQgPSBCQVVEX0FV
VE87CisgICAgdWFydC0+ZGF0YV9iaXRzID0gODsKKyAgICB1YXJ0LT5wYXJpdHkgPSBzcGNyLT5w
YXJpdHk7CisgICAgdWFydC0+c3RvcF9iaXRzID0gc3Bjci0+c3RvcF9iaXRzOworICAgIHVhcnQt
PmlvX2Jhc2UgPSBzcGNyLT5zZXJpYWxfcG9ydC5hZGRyZXNzOworICAgIHVhcnQtPmlvX3NpemUg
PSBzcGNyLT5zZXJpYWxfcG9ydC5iaXRfd2lkdGg7CisgICAgdWFydC0+cmVnX3NoaWZ0ID0gc3Bj
ci0+c2VyaWFsX3BvcnQuYml0X29mZnNldDsKKyAgICB1YXJ0LT5yZWdfd2lkdGggPSBzcGNyLT5z
ZXJpYWxfcG9ydC5hY2Nlc3Nfd2lkdGg7CisKKyAgICAvKiBUaGUgdHJpZ2dlci9wb2xhcml0eSBp
bmZvcm1hdGlvbiBpcyBub3QgYXZhaWxhYmxlIGluIHNwY3IuICovCisgICAgaXJxX3NldF90eXBl
KHNwY3ItPmludGVycnVwdCwgSVJRX1RZUEVfTEVWRUxfSElHSCk7CisgICAgdWFydC0+aXJxID0g
c3Bjci0+aW50ZXJydXB0OworCisgICAgdWFydC0+dnVhcnQuYmFzZV9hZGRyID0gdWFydC0+aW9f
YmFzZTsKKyAgICB1YXJ0LT52dWFydC5zaXplID0gdWFydC0+aW9fc2l6ZTsKKyAgICB1YXJ0LT52
dWFydC5kYXRhX29mZiA9IFVBUlRfVEhSIDw8IHVhcnQtPnJlZ19zaGlmdDsKKyAgICB1YXJ0LT52
dWFydC5zdGF0dXNfb2ZmID0gVUFSVF9MU1IgPDwgdWFydC0+cmVnX3NoaWZ0OworICAgIHVhcnQt
PnZ1YXJ0LnN0YXR1cyA9IFVBUlRfTFNSX1RIUkUgfCBVQVJUX0xTUl9URU1UOworCisgICAgLyog
UmVnaXN0ZXIgd2l0aCBnZW5lcmljIHNlcmlhbCBkcml2ZXIuICovCisgICAgc2VyaWFsX3JlZ2lz
dGVyX3VhcnQoU0VSSE5EX0RUVUFSVCwgJm5zMTY1NTBfZHJpdmVyLCB1YXJ0KTsKKworICAgIHJl
dHVybiAwOworfQorCitBQ1BJX0RFVklDRV9TVEFSVChhbnMxNjU1MCwgIk5TMTY1NTAgVUFSVCIs
IERFVklDRV9TRVJJQUwpCisgICAgLmNsYXNzX3R5cGUgPSBBQ1BJX0RCRzJfMTY1NTBfQ09NUEFU
SUJMRSwKKyAgICAuaW5pdCA9IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQsCitBQ1BJX0RFVklDRV9F
TkQKKworI2VuZGlmIC8qIENPTkZJR19BQ1BJICYmIENPTkZJR19BUk0gKi8KKwogLyoKICAqIExv
Y2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKLS0gCjIuOC4xCgoKLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
