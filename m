Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC9221DF0
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 21:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRi4B-0007oa-I8; Fri, 17 May 2019 18:58:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRi49-0007oL-87
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 18:58:49 +0000
X-Inumbo-ID: cd449b03-78d5-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd449b03-78d5-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 18:58:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: BkFvctGDsgioZArEuPsMUYGPOJnx3ptqu0twBV7Fy1bgboxEbUsE9NG6yakNvL1/b2xtWsH/yq
 zzAZg9k+DISox4Iz5IQSwhfSuWaG87NWitil4PaZEZ1lla9dvfyA2Nhyx4nSyKMT7/i5r2bba0
 AvfqjbKfc3UoZuhJGhRYScgZjzl2lUfmbVSGzRLSV+C0E40OVq9n/tAxqRN71tIDcXrQ7TmYcH
 gmCWRwYrXWnDMUMGXzf78BVbrARf8c8BGrZSJWA/req7XIDHuhTTcyR/m8m7dGYqUE+kbLhtX7
 BFc=
X-SBRS: 2.7
X-MesageID: 593810
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,481,1549947600"; 
   d="scan'208";a="593810"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 19:58:43 +0100
Message-ID: <1558119524-318-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/lib: Introduce printk_once() and
 replace some opencoded examples
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVmbG93IHRoZSBaeW5xTVAgbWVzc2FnZSBmb3IgZ3JlcGFiaWxpdHksIGFuZCBmaXggdGhlIG9t
aXNzaW9uIG9mIGEgbmV3bGluZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgICAgICAgICAgICAgICB8IDE4ICsrLS0tLS0t
LS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMgfCAgOSAr
Ky0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgICAgICAgICAgICAgICAgIHwgMTEgKysr
KysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIGIveGVuL2FyY2gvYXJt
L2NwdWVycmF0YS5jCmluZGV4IDQ0MzFiMjQuLjg5MDQ5MzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9jcHVlcnJhdGEuYworKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKQEAgLTMzNiwx
OCArMzM2LDExIEBAIHN0YXRpYyBib29sIGhhc19zc2JkX21pdGlnYXRpb24oY29uc3Qgc3RydWN0
IGFybV9jcHVfY2FwYWJpbGl0aWVzICplbnRyeSkKICAgICBzd2l0Y2ggKCBzc2JkX3N0YXRlICkK
ICAgICB7CiAgICAgY2FzZSBBUk1fU1NCRF9GT1JDRV9ESVNBQkxFOgotICAgIHsKLSAgICAgICAg
c3RhdGljIGJvb2wgb25jZSA9IHRydWU7Ci0KLSAgICAgICAgaWYgKCBvbmNlICkKLSAgICAgICAg
ICAgIHByaW50aygiJXMgZGlzYWJsZWQgZnJvbSBjb21tYW5kLWxpbmVcbiIsIGVudHJ5LT5kZXNj
KTsKLSAgICAgICAgb25jZSA9IGZhbHNlOworICAgICAgICBwcmludGtfb25jZSgiJXMgZGlzYWJs
ZWQgZnJvbSBjb21tYW5kLWxpbmVcbiIsIGVudHJ5LT5kZXNjKTsKIAogICAgICAgICBhcm1fc21j
Y2NfMV8xX3NtYyhBUk1fU01DQ0NfQVJDSF9XT1JLQVJPVU5EXzJfRklELCAwLCBOVUxMKTsKICAg
ICAgICAgcmVxdWlyZWQgPSBmYWxzZTsKLQogICAgICAgICBicmVhazsKLSAgICB9CiAKICAgICBj
YXNlIEFSTV9TU0JEX1JVTlRJTUU6CiAgICAgICAgIGlmICggcmVxdWlyZWQgKQpAQCAtMzU5LDE4
ICszNTIsMTEgQEAgc3RhdGljIGJvb2wgaGFzX3NzYmRfbWl0aWdhdGlvbihjb25zdCBzdHJ1Y3Qg
YXJtX2NwdV9jYXBhYmlsaXRpZXMgKmVudHJ5KQogICAgICAgICBicmVhazsKIAogICAgIGNhc2Ug
QVJNX1NTQkRfRk9SQ0VfRU5BQkxFOgotICAgIHsKLSAgICAgICAgc3RhdGljIGJvb2wgb25jZSA9
IHRydWU7Ci0KLSAgICAgICAgaWYgKCBvbmNlICkKLSAgICAgICAgICAgIHByaW50aygiJXMgZm9y
Y2VkIGZyb20gY29tbWFuZC1saW5lXG4iLCBlbnRyeS0+ZGVzYyk7Ci0gICAgICAgIG9uY2UgPSBm
YWxzZTsKKyAgICAgICAgcHJpbnRrX29uY2UoIiVzIGZvcmNlZCBmcm9tIGNvbW1hbmQtbGluZVxu
IiwgZW50cnktPmRlc2MpOwogCiAgICAgICAgIGFybV9zbWNjY18xXzFfc21jKEFSTV9TTUNDQ19B
UkNIX1dPUktBUk9VTkRfMl9GSUQsIDEsIE5VTEwpOwogICAgICAgICByZXF1aXJlZCA9IHRydWU7
Ci0KICAgICAgICAgYnJlYWs7Ci0gICAgfQogCiAgICAgZGVmYXVsdDoKICAgICAgICAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlu
eC16eW5xbXAuYyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jCmluZGV4
IDA4ZTNlMTEuLjMwNjBkNzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGls
aW54LXp5bnFtcC5jCisrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5j
CkBAIC0zNSwxNCArMzUsOSBAQCBzdGF0aWMgYm9vbCB6eW5xbXBfc21jKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQogICAgICAqLwogICAgIGlmICggIWNwdXNfaGF2ZV9jb25zdF9jYXAoQVJN
X1NNQ0NDXzFfMSkgKQogICAgIHsKLSAgICAgICAgc3RhdGljIGJvb2wgb25jZSA9IHRydWU7Cisg
ICAgICAgIHByaW50a19vbmNlKFhFTkxPR19XQVJOSU5HCisgICAgICAgICAgICAgICAgICAgICJa
eW5xTVAgZmlybXdhcmUgRXJyb3I6IG5vIFNNQ0NDIDEuMSBzdXBwb3J0LiBEaXNhYmxpbmcgZmly
bXdhcmUgY2FsbHNcbiIpOwogCi0gICAgICAgIGlmICggb25jZSApCi0gICAgICAgIHsKLSAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiWnlucU1QIGZpcm13YXJlIEVycm9yOiBubyBT
TUNDQyAxLjEgIgotICAgICAgICAgICAgICAgICAgICJzdXBwb3J0LiBEaXNhYmxpbmcgZmlybXdh
cmUgY2FsbHMuIik7Ci0gICAgICAgICAgICBvbmNlID0gZmFsc2U7Ci0gICAgICAgIH0KICAgICAg
ICAgcmV0dXJuIGZhbHNlOwogICAgIH0KICAgICByZXR1cm4genlucW1wX2VlbWkocmVncyk7CmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgK
aW5kZXggOTFlZDU2Yy4uY2UyMzFjNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaApAQCAtMTA1LDYgKzEwNSwxNyBAQCBkZWJ1Z3Ry
YWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikge30KICNkZWZpbmUgX3AoX3gpICgodm9p
ZCAqKSh1bnNpZ25lZCBsb25nKShfeCkpCiBleHRlcm4gdm9pZCBwcmludGsoY29uc3QgY2hhciAq
Zm9ybWF0LCAuLi4pCiAgICAgX19hdHRyaWJ1dGVfXyAoKGZvcm1hdCAocHJpbnRmLCAxLCAyKSkp
OworCisjZGVmaW5lIHByaW50a19vbmNlKGZtdCwgYXJncy4uLikgICAgICAgICAgICAgICBcCiso
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgc3Rh
dGljIGJvb2wgX19yZWFkX21vc3RseSBvbmNlXzsgICAgICAgICAgICBcCisgICAgaWYgKCB1bmxp
a2VseSghb25jZV8pICkgICAgICAgICAgICAgICAgICAgICBcCisgICAgeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIG9uY2VfID0gdHJ1ZTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIHByaW50ayhmbXQsICMjIGFyZ3MpOyAg
ICAgICAgICAgICAgICAgICBcCisgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCit9KQorCiBleHRlcm4gdm9pZCBndWVzdF9wcmludGsoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pCiAgICAgX19hdHRyaWJ1dGVfXyAo
KGZvcm1hdCAocHJpbnRmLCAyLCAzKSkpOwogZXh0ZXJuIHZvaWQgbm9yZXR1cm4gcGFuaWMoY29u
c3QgY2hhciAqZm9ybWF0LCAuLi4pCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
