Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9651122F09
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:43:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihE1P-0004qC-CX; Tue, 17 Dec 2019 14:40:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gGJv=2H=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1ihE1N-0004q7-JW
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:40:22 +0000
X-Inumbo-ID: 256d94e6-20db-11ea-8ee4-12813bfff9fa
Received: from smtp48.i.mail.ru (unknown [94.100.177.108])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 256d94e6-20db-11ea-8ee4-12813bfff9fa;
 Tue, 17 Dec 2019 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To;
 bh=Ezu/tlOrynr9o40Vnr1xWJ3okOtG67tciuX2nvGQ7aI=; 
 b=PSmmBrGicyLMdqY0taprhjy1E4y8mFFGRVrsJJ/JG6Gp73rnX6YDFMrXDXiZ77zRArmooikf1SBgYflVMJta+smcPLmhTuFTZ7AS9QS287a2bIwo181KLftq/mupwJXaQuktssGjaHx1jsT9rgfaFLLeS/O1cBRtx0hWDu5ml1w=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1ihE1J-000839-SV; Tue, 17 Dec 2019 17:40:18 +0300
To: xen-devel@lists.xenproject.org
From: Sergey Kovalev <valor@list.ru>
Message-ID: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
Date: Tue, 17 Dec 2019 17:40:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Language: en-US
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=valor@list.ru
 smtp.mailfrom=valor@list.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 0A44E481635329DB0E1AA8A03B392317D32E5E48865217369ED6AD9D9C178FB002BCA6E8C095A180F688BCB05C26794DFEA1EC70493DFBE83A9A2DE1DB34AE400614095B8150E83EC63FDF66446D7034
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB7000F10A5755C8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376C2B935BE6E4DEC88638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC249BBE3BEF4F3202843A675A25909CE148FEAC6D349189B9389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947C735DFC8FA7AC12072D242C3BD2E3F4C64AD6D5ED66289B52E1A3F18E62937ED6A8C29749A63C2581725E5C173C3A84C34ECE56BB050D590FBA3038C0950A5D36B5C8C57E37DE458B5A02E28F51ECAD4422CA9DD8327EE4930A3850AC1BE2E735785E27087A8EDCB1528DEE012270D6E2731C566533BA786A40A5AABA2AD371193C9F3DD0FB1AF5EB82E77451A5C57BD33C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-Mailru-Sender: 9422C5FC7C00AE6974C3817D9F8DFD6248D869E97B77AB116C5D895E8BAE1BA36FA35EADE8FD784D625E4CECE70E6D50FB559BB5D741EB968B87F919F3BCAAF1715EC054F9A9AD9C0DA7A0AF5A3A8387
X-Mras: OK
Subject: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single step
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, valor@list.ru,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gYnJlYWsgcG9pbnQgZXZlbnQgZWlnaHQgY29udGV4dCBzd2l0Y2hlcyBvY2N1cmVzLgoKV2l0
aCBmYXN0IHNpbmdsZSBzdGVwIGl0IGlzIHBvc3NpYmxlIHRvIHNob3J0ZW4gcGF0aCBmb3IgdHdv
IGNvbnRleHQgc3dpdGNoZXMKYW5kIGdhaW4gMzUlIHNwZWFkLXVwLgoKV2FzIHRlc3RlZCBvbiBE
ZWJpYW4gYnJhbmNoIG9mIFhlbiA0LjEyLiBTZWUgYXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9za3Zs
L3hlbi90cmVlL2RlYmlhbi9rbm9ycmllLzQuMTIvZmFzdC1zaW5nbGVzdGVwCgpSZWJhc2VkIG9u
IG1hc3RlcjoKaHR0cHM6Ly9naXRodWIuY29tL3NrdmwveGVuL3RyZWUvZmFzdC1zaW5nbGVzdGVw
CgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS292YWxldiA8dmFsb3JAbGlzdC5ydT4KLS0tCiAgeGVu
L2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiAgeGVuL2FyY2gv
eDg2L2h2bS9tb25pdG9yLmMgICAgIHwgIDkgKysrKysrKysrCiAgeGVuL2FyY2gveDg2L3ZtX2V2
ZW50LmMgICAgICAgIHwgIDggKysrKysrLS0KICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0u
aCAgfCAgMSArCiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oIHwgIDQgKysrKwogIHhl
bi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oICB8IDEwICsrKysrKysrKysKICA2IGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggNDc1NzNm
NzFiOC4uNDk5OTU2OTUwMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC01MTI2LDYgKzUxMjYsMTggQEAgdm9pZCBodm1f
dG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IHZjcHUgKnYpCiAgICAgIHYtPmFyY2guaHZtLnNpbmds
ZV9zdGVwID0gIXYtPmFyY2guaHZtLnNpbmdsZV9zdGVwOwogIH0KCit2b2lkIGh2bV9mYXN0X3Np
bmdsZXN0ZXAoc3RydWN0IHZjcHUgKnYsIHVpbnQxNl90IHAybWlkeCkKK3sKKyAgICBBU1NFUlQo
YXRvbWljX3JlYWQoJnYtPnBhdXNlX2NvdW50KSk7CisKKyAgICBpZiAoICFodm1faXNfc2luZ2xl
c3RlcF9zdXBwb3J0ZWQoKSApCisgICAgICAgIHJldHVybjsKKworICAgIHYtPmFyY2guaHZtLnNp
bmdsZV9zdGVwID0gdHJ1ZTsKKyAgICB2LT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLmVuYWJs
ZWQgPSB0cnVlOworICAgIHYtPmFyY2guaHZtLmZhc3Rfc2luZ2xlX3N0ZXAucDJtaWR4ID0gcDJt
aWR4OworfQorCiAgLyoKICAgKiBTZWdtZW50IGNhY2hlcyBpbiBWTUNCL1ZNQ1MgYXJlIGluY29u
c2lzdGVudCBhYm91dCB3aGljaCBiaXRzIGFyZSBjaGVja2VkLAogICAqIGltcG9ydGFudCwgYW5k
IHByZXNlcnZlZCBhY3Jvc3Mgdm1lbnRyeS9leGl0LiAgQ29vayB0aGUgdmFsdWVzIHRvIG1ha2Ug
dGhlbQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9tb25pdG9yLmMgYi94ZW4vYXJjaC94
ODYvaHZtL21vbml0b3IuYwppbmRleCAxZjIzZmUyNWU4Li44YzA1ZTMzOTIyIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0
b3IuYwpAQCAtMjgsNiArMjgsNyBAQAogICNpbmNsdWRlIDxhc20vaHZtL21vbml0b3IuaD4KICAj
aW5jbHVkZSA8YXNtL2FsdHAybS5oPgogICNpbmNsdWRlIDxhc20vbW9uaXRvci5oPgorI2luY2x1
ZGUgPGFzbS9wMm0uaD4KICAjaW5jbHVkZSA8YXNtL3BhZ2luZy5oPgogICNpbmNsdWRlIDxhc20v
dm1fZXZlbnQuaD4KICAjaW5jbHVkZSA8cHVibGljL3ZtX2V2ZW50Lmg+CkBAIC0xNTksNiArMTYw
LDE0IEBAIGludCBodm1fbW9uaXRvcl9kZWJ1Zyh1bnNpZ25lZCBsb25nIHJpcCwgZW51bSBodm1f
bW9uaXRvcl9kZWJ1Z190eXBlIHR5cGUsCiAgICAgIGNhc2UgSFZNX01PTklUT1JfU0lOR0xFU1RF
UF9CUkVBS1BPSU5UOgogICAgICAgICAgaWYgKCAhYWQtPm1vbml0b3Iuc2luZ2xlc3RlcF9lbmFi
bGVkICkKICAgICAgICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgaWYgKGN1cnItPmFyY2guaHZt
LmZhc3Rfc2luZ2xlX3N0ZXAuZW5hYmxlZCkKKyAgICAgICAgeworICAgICAgICAgICAgcDJtX2Fs
dHAybV9jaGVjayhjdXJyLCBjdXJyLT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLnAybWlkeCk7
CisgICAgICAgICAgICBjdXJyLT5hcmNoLmh2bS5zaW5nbGVfc3RlcCA9IGZhbHNlOworICAgICAg
ICAgICAgY3Vyci0+YXJjaC5odm0uZmFzdF9zaW5nbGVfc3RlcC5lbmFibGVkID0gZmFsc2U7Cisg
ICAgICAgICAgICBjdXJyLT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLnAybWlkeCA9IDA7Cisg
ICAgICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgfQogICAgICAgICAgcmVxLnJlYXNvbiA9IFZN
X0VWRU5UX1JFQVNPTl9TSU5HTEVTVEVQOwogICAgICAgICAgcmVxLnUuc2luZ2xlc3RlcC5nZm4g
PSBnZm5fb2ZfcmlwKHJpcCk7CiAgICAgICAgICBzeW5jID0gdHJ1ZTsKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKaW5kZXggNTJj
MmE3MWZhMC4uMzg1MTE2YjVmMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMK
KysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKQEAgLTYxLDcgKzYxLDggQEAgdm9pZCB2bV9l
dmVudF9jbGVhbnVwX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKQogIHZvaWQgdm1fZXZlbnRfdG9n
Z2xlX3NpbmdsZXN0ZXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2bV9ldmVudF9yZXNwb25zZV90ICpyc3ApCiAgewot
ICAgIGlmICggIShyc3AtPmZsYWdzICYgVk1fRVZFTlRfRkxBR19UT0dHTEVfU0lOR0xFU1RFUCkg
KQorICAgIGlmICggIShyc3AtPmZsYWdzICYgVk1fRVZFTlRfRkxBR19UT0dHTEVfU0lOR0xFU1RF
UAorICAgICAgICAgfHwgcnNwLT5mbGFncyAmIFZNX0VWRU5UX0ZMQUdfRkFTVF9TSU5HTEVTVEVQ
KSApCiAgICAgICAgICByZXR1cm47CgogICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkKQEAg
LTY5LDcgKzcwLDEwIEBAIHZvaWQgdm1fZXZlbnRfdG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IHZjcHUgKnYsCgogICAgICBBU1NFUlQoYXRvbWljX3JlYWQoJnYtPnZt
X2V2ZW50X3BhdXNlX2NvdW50KSk7CgotICAgIGh2bV90b2dnbGVfc2luZ2xlc3RlcCh2KTsKKyAg
ICBpZiAocnNwLT5mbGFncyAmIFZNX0VWRU5UX0ZMQUdfVE9HR0xFX1NJTkdMRVNURVApCisgICAg
ICAgIGh2bV90b2dnbGVfc2luZ2xlc3RlcCh2KTsKKyAgICBlbHNlCisgICAgICAgIGh2bV9mYXN0
X3NpbmdsZXN0ZXAodiwgcnNwLT51LmZhc3Rfc2luZ2xlc3RlcC5wMm1pZHgpOwogIH0KCiAgdm9p
ZCB2bV9ldmVudF9yZWdpc3Rlcl93cml0ZV9yZXN1bWUoc3RydWN0IHZjcHUgKnYsIHZtX2V2ZW50
X3Jlc3BvbnNlX3QgKnJzcCkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2
bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKaW5kZXggMWQ3YjY2ZjkyNy4uMDk3
OTNjMTJlOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKQEAgLTMyMyw2ICszMjMsNyBAQCBpbnQgaHZt
X2RlYnVnX29wKHN0cnVjdCB2Y3B1ICp2LCBpbnQzMl90IG9wKTsKCiAgLyogQ2FsbGVyIHNob3Vs
ZCBwYXVzZSB2Y3B1IGJlZm9yZSBjYWxsaW5nIHRoaXMgZnVuY3Rpb24gKi8KICB2b2lkIGh2bV90
b2dnbGVfc2luZ2xlc3RlcChzdHJ1Y3QgdmNwdSAqdik7Cit2b2lkIGh2bV9mYXN0X3NpbmdsZXN0
ZXAoc3RydWN0IHZjcHUgKnYsIHVpbnQxNl90IHAybWlkeCk7CgogIGludCBodm1faGFwX25lc3Rl
ZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbnBmZWMgbnBmZWMpOwpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNw
dS5oCmluZGV4IDM4ZjVjMmJiOWIuLjhiODQ5NDExMTEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZjcHUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmgK
QEAgLTE3Miw2ICsxNzIsMTAgQEAgc3RydWN0IGh2bV92Y3B1IHsKICAgICAgYm9vbCAgICAgICAg
ICAgICAgICBmbGFnX2RyX2RpcnR5OwogICAgICBib29sICAgICAgICAgICAgICAgIGRlYnVnX3N0
YXRlX2xhdGNoOwogICAgICBib29sICAgICAgICAgICAgICAgIHNpbmdsZV9zdGVwOworICAgIHN0
cnVjdCB7CisgICAgICAgIGJvb2wgICAgIGVuYWJsZWQ7CisgICAgICAgIHVpbnQxNl90IHAybWlk
eDsKKyAgICB9IGZhc3Rfc2luZ2xlX3N0ZXA7CgogICAgICBzdHJ1Y3QgaHZtX3ZjcHVfYXNpZCBu
MWFzaWQ7CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAppbmRleCBhYTU0Yzg2MzI1Li5jYjU3N2E3YmE5IDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAorKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaApAQCAtMTEwLDYgKzExMCwxMSBAQAogICAqIGludGVycnVwdCBw
ZW5kaW5nIGFmdGVyIHJlc3VtaW5nIHRoZSBWQ1BVLgogICAqLwogICNkZWZpbmUgVk1fRVZFTlRf
RkxBR19HRVRfTkVYVF9JTlRFUlJVUFQgKDEgPDwgMTApCisvKgorICogRXhlY3V0ZSBmYXN0IHNp
bmdsZXN0ZXBwaW5nIG9uIHZtX2V2ZW50IHJlc3BvbnNlLgorICogUmVxdWlyZXMgdGhlIHZDUFUg
dG8gYmUgcGF1c2VkIGFscmVhZHkgKHN5bmNocm9ub3VzIGV2ZW50cyBvbmx5KS4KKyAqLworI2Rl
ZmluZSBWTV9FVkVOVF9GTEFHX0ZBU1RfU0lOR0xFU1RFUCAgKDEgPDwgMTEpCgogIC8qCiAgICog
UmVhc29ucyBmb3IgdGhlIHZtIGV2ZW50IHJlcXVlc3QKQEAgLTI3Niw2ICsyODEsMTAgQEAgc3Ry
dWN0IHZtX2V2ZW50X3NpbmdsZXN0ZXAgewogICAgICB1aW50NjRfdCBnZm47CiAgfTsKCitzdHJ1
Y3Qgdm1fZXZlbnRfZmFzdF9zaW5nbGVzdGVwIHsKKyAgICB1aW50MTZfdCBwMm1pZHg7Cit9Owor
CiAgc3RydWN0IHZtX2V2ZW50X2RlYnVnIHsKICAgICAgdWludDY0X3QgZ2ZuOwogICAgICB1aW50
MzJfdCBpbnNuX2xlbmd0aDsKQEAgLTM2Myw2ICszNzIsNyBAQCB0eXBlZGVmIHN0cnVjdCB2bV9l
dmVudF9zdCB7CiAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfbW92X3RvX21zciAgICAgICAgICAg
IG1vdl90b19tc3I7CiAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZGVzY19hY2Nlc3MgICAgICAg
ICAgIGRlc2NfYWNjZXNzOwogICAgICAgICAgc3RydWN0IHZtX2V2ZW50X3NpbmdsZXN0ZXAgICAg
ICAgICAgICBzaW5nbGVzdGVwOworICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZmFzdF9zaW5nbGVz
dGVwICAgICAgIGZhc3Rfc2luZ2xlc3RlcDsKICAgICAgICAgIHN0cnVjdCB2bV9ldmVudF9kZWJ1
ZyAgICAgICAgICAgICAgICAgc29mdHdhcmVfYnJlYWtwb2ludDsKICAgICAgICAgIHN0cnVjdCB2
bV9ldmVudF9kZWJ1ZyAgICAgICAgICAgICAgICAgZGVidWdfZXhjZXB0aW9uOwogICAgICAgICAg
c3RydWN0IHZtX2V2ZW50X2NwdWlkICAgICAgICAgICAgICAgICBjcHVpZDsKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
