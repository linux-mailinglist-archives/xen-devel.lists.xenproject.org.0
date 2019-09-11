Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B8B0002
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84VB-0002fl-Mj; Wed, 11 Sep 2019 15:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84VA-0002fT-5t
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:25:48 +0000
X-Inumbo-ID: 6d993254-d4a8-11e9-83d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d993254-d4a8-11e9-83d9-12813bfff9fa;
 Wed, 11 Sep 2019 15:25:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3F59AB87;
 Wed, 11 Sep 2019 15:25:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <abbff654-cc50-9b43-6e1c-ff1fb0154ddd@suse.com>
Date: Wed, 11 Sep 2019 17:25:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 7/9] x86/HVM: cosmetics to hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWxpbWluYXRlIHRoZSBub3QgcmVhbGx5IHVzZWZ1bCBsb2NhbCB2YXJpYWJsZSAib2xkIi4gUmVk
dWNlIHRoZSBzY29wZQpvZiAicGFnZSIuIFJlbmFtZSB0aGUgbGF0Y2hlZCAiY3VycmVudCIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTIyOTYs
MTAgKzIyOTYsOCBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAK
IGludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG5vZmx1c2gsIGJvb2wg
bWF5X2RlZmVyKQogewotICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKLSAgICBzdHJ1Y3Qg
ZG9tYWluICpjdXJyZCA9IHYtPmRvbWFpbjsKLSAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwot
ICAgIHVuc2lnbmVkIGxvbmcgb2xkID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM107CisgICAgc3Ry
dWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50OworICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3Vy
ci0+ZG9tYWluOwogCiAgICAgaWYgKCB2YWx1ZSAmIH4oKDFVTCA8PCBjdXJyZC0+YXJjaC5jcHVp
ZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAxKSApCiAgICAgewpAQCAtMjMxMiwzNiArMjMxMCwzOCBA
QCBpbnQgaHZtX3NldF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAgICAgaWYgKCBtYXlf
ZGVmZXIgJiYgdW5saWtlbHkoY3VycmQtPmFyY2gubW9uaXRvci53cml0ZV9jdHJscmVnX2VuYWJs
ZWQgJgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1vbml0b3JfY3RybHJlZ19iaXRt
YXNrKFZNX0VWRU5UX1g4Nl9DUjMpKSApCiAgICAgewotICAgICAgICBBU1NFUlQodi0+YXJjaC52
bV9ldmVudCk7CisgICAgICAgIEFTU0VSVChjdXJyLT5hcmNoLnZtX2V2ZW50KTsKIAotICAgICAg
ICBpZiAoIGh2bV9tb25pdG9yX2NyWChDUjMsIHZhbHVlLCBvbGQpICkKKyAgICAgICAgaWYgKCBo
dm1fbW9uaXRvcl9jclgoQ1IzLCB2YWx1ZSwgY3Vyci0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pICkK
ICAgICAgICAgewogICAgICAgICAgICAgLyogVGhlIGFjdHVhbCB3cml0ZSB3aWxsIG9jY3VyIGlu
IGh2bV9kb19yZXN1bWUoKSwgaWYgcGVybWl0dGVkLiAqLwotICAgICAgICAgICAgdi0+YXJjaC52
bV9ldmVudC0+d3JpdGVfZGF0YS5kb193cml0ZS5jcjMgPSAxOwotICAgICAgICAgICAgdi0+YXJj
aC52bV9ldmVudC0+d3JpdGVfZGF0YS5jcjMgPSB2YWx1ZTsKLSAgICAgICAgICAgIHYtPmFyY2gu
dm1fZXZlbnQtPndyaXRlX2RhdGEuY3IzX25vZmx1c2ggPSBub2ZsdXNoOworICAgICAgICAgICAg
Y3Vyci0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5kb193cml0ZS5jcjMgPSAxOworICAgICAg
ICAgICAgY3Vyci0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5jcjMgPSB2YWx1ZTsKKyAgICAg
ICAgICAgIGN1cnItPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuY3IzX25vZmx1c2ggPSBub2Zs
dXNoOwogCiAgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwogICAgICAgICB9CiAgICAg
fQogCi0gICAgaWYgKCBodm1fcGFnaW5nX2VuYWJsZWQodikgJiYgIXBhZ2luZ19tb2RlX2hhcChj
dXJyZCkgJiYKLSAgICAgICAgICgodmFsdWUgXiB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkgPj4g
UEFHRV9TSElGVCkgKQorICAgIGlmICggaHZtX3BhZ2luZ19lbmFibGVkKGN1cnIpICYmICFwYWdp
bmdfbW9kZV9oYXAoY3VycmQpICYmCisgICAgICAgICAoKHZhbHVlIF4gY3Vyci0+YXJjaC5odm0u
Z3Vlc3RfY3JbM10pID4+IFBBR0VfU0hJRlQpICkKICAgICB7CiAgICAgICAgIC8qIFNoYWRvdy1t
b2RlIENSMyBjaGFuZ2UuIENoZWNrIFBEQlIgYW5kIHVwZGF0ZSByZWZjb3VudHMuICovCisgICAg
ICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7CisKICAgICAgICAgSFZNX0RCR19MT0coREJHX0xF
VkVMX1ZNTVUsICJDUjMgdmFsdWUgPSAlbHgiLCB2YWx1ZSk7CiAgICAgICAgIHBhZ2UgPSBnZXRf
cGFnZV9mcm9tX2dmbihjdXJyZCwgdmFsdWUgPj4gUEFHRV9TSElGVCwgTlVMTCwgUDJNX0FMTE9D
KTsKICAgICAgICAgaWYgKCAhcGFnZSApCiAgICAgICAgICAgICBnb3RvIGJhZF9jcjM7CiAKLSAg
ICAgICAgcHV0X3BhZ2UocGFnZXRhYmxlX2dldF9wYWdlKHYtPmFyY2guZ3Vlc3RfdGFibGUpKTsK
LSAgICAgICAgdi0+YXJjaC5ndWVzdF90YWJsZSA9IHBhZ2V0YWJsZV9mcm9tX3BhZ2UocGFnZSk7
CisgICAgICAgIHB1dF9wYWdlKHBhZ2V0YWJsZV9nZXRfcGFnZShjdXJyLT5hcmNoLmd1ZXN0X3Rh
YmxlKSk7CisgICAgICAgIGN1cnItPmFyY2guZ3Vlc3RfdGFibGUgPSBwYWdldGFibGVfZnJvbV9w
YWdlKHBhZ2UpOwogCiAgICAgICAgIEhWTV9EQkdfTE9HKERCR19MRVZFTF9WTU1VLCAiVXBkYXRl
IENSMyB2YWx1ZSA9ICVseCIsIHZhbHVlKTsKICAgICB9CiAKLSAgICB2LT5hcmNoLmh2bS5ndWVz
dF9jclszXSA9IHZhbHVlOwotICAgIHBhZ2luZ191cGRhdGVfY3IzKHYsIG5vZmx1c2gpOworICAg
IGN1cnItPmFyY2guaHZtLmd1ZXN0X2NyWzNdID0gdmFsdWU7CisgICAgcGFnaW5nX3VwZGF0ZV9j
cjMoY3Vyciwgbm9mbHVzaCk7CiAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKIAogIGJhZF9jcjM6
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
