Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA116FF4E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:50:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6w67-0002Lw-2Z; Wed, 26 Feb 2020 12:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6w65-0002Kx-Hf
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:47:29 +0000
X-Inumbo-ID: 1ad9e654-5896-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ad9e654-5896-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 12:47:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18E77B018;
 Wed, 26 Feb 2020 12:47:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 13:47:03 +0100
Message-Id: <20200226124705.29212-11-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200226124705.29212-1-jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 10/12] tools/libxl: use libxenhypfs for
 setting xen runtime parameters
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
Cc: Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiB4Y19zZXRfcGFyYW1ldGVycygpIHVzZSB4ZW5oeXBmc193cml0ZSgpIGZvciBz
ZXR0aW5nCnBhcmFtZXRlcnMgb2YgdGhlIGh5cGVydmlzb3IuCgpTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpWNjoKLSBuZXcgcGF0Y2gKLS0tCiB0b29s
cy9SdWxlcy5tayAgICAgICAgICAgICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL01ha2VmaWxlICAg
ICAgICAgfCAgMyArKy0KIHRvb2xzL2xpYnhsL2xpYnhsLmMgICAgICAgICAgfCA1MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogdG9vbHMvbGlieGwvbGlieGxf
aW50ZXJuYWwuaCB8ICAxICsKIHRvb2xzL2xpYnhsL3hlbmxpZ2h0LnBjLmluICAgfCAgMiArLQog
dG9vbHMveGwveGxfbWlzYy5jICAgICAgICAgICB8ICAxIC0KIDYgZmlsZXMgY2hhbmdlZCwgNTIg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvUnVsZXMu
bWsgYi90b29scy9SdWxlcy5tawppbmRleCBhMDQ2OTdhMzNjLi40YjNmY2VmOTBiIDEwMDY0NAot
LS0gYS90b29scy9SdWxlcy5taworKysgYi90b29scy9SdWxlcy5tawpAQCAtMTgwLDcgKzE4MCw3
IEBAIENGTEFHUyArPSAtTzIgLWZvbWl0LWZyYW1lLXBvaW50ZXIKIGVuZGlmCiAKIENGTEFHU19s
aWJ4ZW5saWdodCA9IC1JJChYRU5fWEVOTElHSFQpICQoQ0ZMQUdTX2xpYnhlbmN0cmwpICQoQ0ZM
QUdTX3hlbmluY2x1ZGUpCi1TSERFUFNfbGlieGVubGlnaHQgPSAkKFNITElCX2xpYnhlbmN0cmwp
ICQoU0hMSUJfbGlieGVuc3RvcmUpCitTSERFUFNfbGlieGVubGlnaHQgPSAkKFNITElCX2xpYnhl
bmN0cmwpICQoU0hMSUJfbGlieGVuc3RvcmUpICQoU0hMSUJfbGlieGVuaHlwZnMpCiBMRExJQlNf
bGlieGVubGlnaHQgPSAkKFNIREVQU19saWJ4ZW5saWdodCkgJChYRU5fWEVOTElHSFQpL2xpYnhl
bmxpZ2h0JChsaWJleHRlbnNpb24pCiBTSExJQl9saWJ4ZW5saWdodCAgPSAkKFNIREVQU19saWJ4
ZW5saWdodCkgLVdsLC1ycGF0aC1saW5rPSQoWEVOX1hFTkxJR0hUKQogCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9NYWtlZmlsZSBiL3Rvb2xzL2xpYnhsL01ha2VmaWxlCmluZGV4IDY5ZmNmMjE1
NzcuLmE4OWViYWIwYjQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL01ha2VmaWxlCisrKyBiL3Rv
b2xzL2xpYnhsL01ha2VmaWxlCkBAIC0yMCw3ICsyMCw3IEBAIExJQlVVSURfTElCUyArPSAtbHV1
aWQKIGVuZGlmCiAKIExJQlhMX0xJQlMgPQotTElCWExfTElCUyA9ICQoTERMSUJTX2xpYnhlbnRv
b2xsb2cpICQoTERMSUJTX2xpYnhlbmV2dGNobikgJChMRExJQlNfbGlieGVuY3RybCkgJChMRExJ
QlNfbGlieGVuZ3Vlc3QpICQoTERMSUJTX2xpYnhlbnN0b3JlKSAkKExETElCU19saWJ4ZW50b29s
Y29yZSkgJChQVFlGVU5DU19MSUJTKSAkKExJQlVVSURfTElCUykKK0xJQlhMX0xJQlMgPSAkKExE
TElCU19saWJ4ZW50b29sbG9nKSAkKExETElCU19saWJ4ZW5ldnRjaG4pICQoTERMSUJTX2xpYnhl
bmN0cmwpICQoTERMSUJTX2xpYnhlbmd1ZXN0KSAkKExETElCU19saWJ4ZW5oeXBmcykgJChMRExJ
QlNfbGlieGVuc3RvcmUpICQoTERMSUJTX2xpYnhlbnRvb2xjb3JlKSAkKFBUWUZVTkNTX0xJQlMp
ICQoTElCVVVJRF9MSUJTKQogaWZlcSAoJChDT05GSUdfTElCTkwpLHkpCiBMSUJYTF9MSUJTICs9
ICQoTElCTkwzX0xJQlMpCiBlbmRpZgpAQCAtMzMsNiArMzMsNyBAQCBDRkxBR1NfTElCWEwgKz0g
JChDRkxBR1NfbGlieGVudG9vbGNvcmUpCiBDRkxBR1NfTElCWEwgKz0gJChDRkxBR1NfbGlieGVu
ZXZ0Y2huKQogQ0ZMQUdTX0xJQlhMICs9ICQoQ0ZMQUdTX2xpYnhlbmN0cmwpCiBDRkxBR1NfTElC
WEwgKz0gJChDRkxBR1NfbGlieGVuZ3Vlc3QpCitDRkxBR1NfTElCWEwgKz0gJChDRkxBR1NfbGli
eGVuaHlwZnMpCiBDRkxBR1NfTElCWEwgKz0gJChDRkxBR1NfbGlieGVuc3RvcmUpCiBpZmVxICgk
KENPTkZJR19MSUJOTCkseSkKIENGTEFHU19MSUJYTCArPSAkKExJQk5MM19DRkxBR1MpCmRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5jIGIvdG9vbHMvbGlieGwvbGlieGwuYwppbmRleCBm
NjBmZDNlNGZkLi42MjFhY2M4OGYzIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bC5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmMKQEAgLTY2MywxNSArNjYzLDU2IEBAIGludCBsaWJ4bF9z
ZXRfcGFyYW1ldGVycyhsaWJ4bF9jdHggKmN0eCwgY2hhciAqcGFyYW1zKQogewogICAgIGludCBy
ZXQ7CiAgICAgR0NfSU5JVChjdHgpOworICAgIGNoYXIgKnBhciwgKnZhbCwgKmVuZCwgKnBhdGg7
CisgICAgeGVuaHlwZnNfaGFuZGxlICpoeXBmczsKIAotICAgIHJldCA9IHhjX3NldF9wYXJhbWV0
ZXJzKGN0eC0+eGNoLCBwYXJhbXMpOwotICAgIGlmIChyZXQgPCAwKSB7Ci0gICAgICAgIExPR0VW
KEVSUk9SLCByZXQsICJzZXR0aW5nIHBhcmFtZXRlcnMiKTsKLSAgICAgICAgR0NfRlJFRTsKLSAg
ICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7CisgICAgaHlwZnMgPSB4ZW5oeXBmc19vcGVuKGN0eC0+
bGcsIDApOworICAgIGlmICghaHlwZnMpIHsKKyAgICAgICAgTE9HRShFUlJPUiwgIm9wZW5pbmcg
WGVuIGh5cGZzIik7CisgICAgICAgIHJldCA9IEVSUk9SX0ZBSUw7CisgICAgICAgIGdvdG8gb3V0
OwogICAgIH0KKworICAgIHdoaWxlIChpc2JsYW5rKCpwYXJhbXMpKQorICAgICAgICBwYXJhbXMr
KzsKKworICAgIGZvciAocGFyID0gcGFyYW1zOyAqcGFyOyBwYXIgPSBlbmQpIHsKKyAgICAgICAg
ZW5kID0gc3RyY2hyKHBhciwgJyAnKTsKKyAgICAgICAgaWYgKCFlbmQpCisgICAgICAgICAgICBl
bmQgPSBwYXIgKyBzdHJsZW4ocGFyKTsKKworICAgICAgICB2YWwgPSBzdHJjaHIocGFyLCAnPScp
OworICAgICAgICBpZiAodmFsID4gZW5kKQorICAgICAgICAgICAgdmFsID0gTlVMTDsKKyAgICAg
ICAgaWYgKCF2YWwgJiYgIXN0cm5jbXAocGFyLCAibm8iLCAyKSkgeworICAgICAgICAgICAgcGF0
aCA9IGxpYnhsX19zcHJpbnRmKGdjLCAiL3BhcmFtcy8lcyIsIHBhciArIDIpOworICAgICAgICAg
ICAgcGF0aFtlbmQgLSBwYXIgLSAyICsgOF0gPSAwOworICAgICAgICAgICAgdmFsID0gIm5vIjsK
KyAgICAgICAgICAgIHBhciArPSAyOworICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgcGF0
aCA9IGxpYnhsX19zcHJpbnRmKGdjLCAiL3BhcmFtcy8lcyIsIHBhcik7CisgICAgICAgICAgICBw
YXRoW3ZhbCAtIHBhciArIDhdID0gMDsKKyAgICAgICAgICAgIHZhbCA9IGxpYnhsX19zdHJuZHVw
KGdjLCB2YWwgKyAxLCBlbmQgLSB2YWwgLSAxKTsKKyAgICAgICAgfQorCisJTE9HKERFQlVHLCAi
c2V0dGluZyBub2RlIFwiJXNcIiB0byB2YWx1ZSBcIiVzXCIiLCBwYXRoLCB2YWwpOworICAgICAg
ICByZXQgPSB4ZW5oeXBmc193cml0ZShoeXBmcywgcGF0aCwgdmFsKTsKKyAgICAgICAgaWYgKHJl
dCA8IDApIHsKKyAgICAgICAgICAgIExPR0UoRVJST1IsICJzZXR0aW5nIHBhcmFtZXRlcnMiKTsK
KyAgICAgICAgICAgIHJldCA9IEVSUk9SX0ZBSUw7CisgICAgICAgICAgICBnb3RvIG91dDsKKyAg
ICAgICAgfQorCisgICAgICAgIHdoaWxlIChpc2JsYW5rKCplbmQpKQorICAgICAgICAgICAgZW5k
Kys7CisgICAgfQorCisgICAgcmV0ID0gMDsKKworb3V0OgorICAgIHhlbmh5cGZzX2Nsb3NlKGh5
cGZzKTsKICAgICBHQ19GUkVFOwotICAgIHJldHVybiAwOworICAgIHJldHVybiByZXQ7CiB9CiAK
IHN0YXRpYyBpbnQgZmRfc2V0X2ZsYWdzKGxpYnhsX2N0eCAqY3R4LCBpbnQgZmQsCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50
ZXJuYWwuaAppbmRleCA0M2U1ODg1ZDFlLi5kOTcwZTkxY2EwIDEwMDY0NAotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgK
QEAgLTU2LDYgKzU2LDcgQEAKICNkZWZpbmUgWENfV0FOVF9DT01QQVRfTUFQX0ZPUkVJR05fQVBJ
CiAjaW5jbHVkZSA8eGVuY3RybC5oPgogI2luY2x1ZGUgPHhlbmd1ZXN0Lmg+CisjaW5jbHVkZSA8
eGVuaHlwZnMuaD4KICNpbmNsdWRlIDx4Y19kb20uaD4KIAogI2luY2x1ZGUgPHhlbi10b29scy9s
aWJzLmg+CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC94ZW5saWdodC5wYy5pbiBiL3Rvb2xzL2xp
YnhsL3hlbmxpZ2h0LnBjLmluCmluZGV4IGMwZjc2OWZkMjAuLjZiMzUxYmEwOTYgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL3hlbmxpZ2h0LnBjLmluCisrKyBiL3Rvb2xzL2xpYnhsL3hlbmxpZ2h0
LnBjLmluCkBAIC05LDQgKzksNCBAQCBEZXNjcmlwdGlvbjogVGhlIFhlbmxpZ2h0IGxpYnJhcnkg
Zm9yIFhlbiBoeXBlcnZpc29yCiBWZXJzaW9uOiBAQHZlcnNpb25AQAogQ2ZsYWdzOiAtSSR7aW5j
bHVkZWRpcn0KIExpYnM6IEBAbGlic2ZsYWdAQCR7bGliZGlyfSAtbHhlbmxpZ2h0Ci1SZXF1aXJl
cy5wcml2YXRlOiB4ZW50b29sbG9nLHhlbmV2dGNobix4ZW5jb250cm9sLHhlbmd1ZXN0LHhlbnN0
b3JlCitSZXF1aXJlcy5wcml2YXRlOiB4ZW50b29sbG9nLHhlbmV2dGNobix4ZW5jb250cm9sLHhl
bmd1ZXN0LHhlbnN0b3JlLHhlbmh5cGZzCmRpZmYgLS1naXQgYS90b29scy94bC94bF9taXNjLmMg
Yi90b29scy94bC94bF9taXNjLmMKaW5kZXggMjBlZDYwNWY0Zi4uMDhmMGZiNmRjOSAxMDA2NDQK
LS0tIGEvdG9vbHMveGwveGxfbWlzYy5jCisrKyBiL3Rvb2xzL3hsL3hsX21pc2MuYwpAQCAtMTY4
LDcgKzE2OCw2IEBAIGludCBtYWluX3NldF9wYXJhbWV0ZXJzKGludCBhcmdjLCBjaGFyICoqYXJn
dikKIAogICAgIGlmIChsaWJ4bF9zZXRfcGFyYW1ldGVycyhjdHgsIHBhcmFtcykpIHsKICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJjYW5ub3Qgc2V0IHBhcmFtZXRlcnM6ICVzXG4iLCBwYXJhbXMp
OwotICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIlVzZSBcInhsIGRtZXNnXCIgdG8gbG9vayBmb3Ig
cG9zc2libGUgcmVhc29uLlxuIik7CiAgICAgICAgIHJldHVybiBFWElUX0ZBSUxVUkU7CiAgICAg
fQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
