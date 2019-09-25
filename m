Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236DBE144
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9BN-0006Jn-6a; Wed, 25 Sep 2019 15:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD9BL-0006JX-GV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:26:19 +0000
X-Inumbo-ID: d2125c82-dfa8-11e9-9637-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d2125c82-dfa8-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:26:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1863EAE89;
 Wed, 25 Sep 2019 15:26:18 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Message-ID: <3ce2aac4-de6c-7197-751d-34858305dfd9@suse.com>
Date: Wed, 25 Sep 2019 17:26:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 5/5] x86/HVM: cosmetics to hvm_set_cr3()
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
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsODwqkgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpBY2tlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCnYyOiBSZS1iYXNlIG92
ZXIgY2hhbmdlIGVhcmxpZXIgaW4gdGhlIHNlcmllcy4KCi0tLQogeGVuL2FyY2gveDg2L2h2bS9o
dm0uYyB8ICAgMzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgotLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTIzMDksMTAgKzIzMDks
OCBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAKIGludCBodm1f
c2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG5vZmx1c2gsIGJvb2wgbWF5X2RlZmVy
KQogewotICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKLSAgICBzdHJ1Y3QgZG9tYWluICpj
dXJyZCA9IHYtPmRvbWFpbjsKLSAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwotICAgIHVuc2ln
bmVkIGxvbmcgb2xkID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM107CisgICAgc3RydWN0IHZjcHUg
KmN1cnIgPSBjdXJyZW50OworICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3Vyci0+ZG9tYWlu
OwogCiAgICAgaWYgKCB2YWx1ZSA+PiBjdXJyZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRk
ciApCiAgICAgewpAQCAtMjMyNCwzNiArMjMyMiwzOCBAQCBpbnQgaHZtX3NldF9jcjModW5zaWdu
ZWQgbG9uZyB2YWx1ZSwgYm9vCiAgICAgaWYgKCBtYXlfZGVmZXIgJiYgdW5saWtlbHkoY3VycmQt
PmFyY2gubW9uaXRvci53cml0ZV9jdHJscmVnX2VuYWJsZWQgJgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1vbml0b3JfY3RybHJlZ19iaXRtYXNrKFZNX0VWRU5UX1g4Nl9DUjMpKSAp
CiAgICAgewotICAgICAgICBBU1NFUlQodi0+YXJjaC52bV9ldmVudCk7CisgICAgICAgIEFTU0VS
VChjdXJyLT5hcmNoLnZtX2V2ZW50KTsKIAotICAgICAgICBpZiAoIGh2bV9tb25pdG9yX2NyWChD
UjMsIHZhbHVlLCBvbGQpICkKKyAgICAgICAgaWYgKCBodm1fbW9uaXRvcl9jclgoQ1IzLCB2YWx1
ZSwgY3Vyci0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pICkKICAgICAgICAgewogICAgICAgICAgICAg
LyogVGhlIGFjdHVhbCB3cml0ZSB3aWxsIG9jY3VyIGluIGh2bV9kb19yZXN1bWUoKSwgaWYgcGVy
bWl0dGVkLiAqLwotICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5kb193
cml0ZS5jcjMgPSAxOwotICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5j
cjMgPSB2YWx1ZTsKLSAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuY3Iz
X25vZmx1c2ggPSBub2ZsdXNoOworICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9ldmVudC0+d3Jp
dGVfZGF0YS5kb193cml0ZS5jcjMgPSAxOworICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9ldmVu
dC0+d3JpdGVfZGF0YS5jcjMgPSB2YWx1ZTsKKyAgICAgICAgICAgIGN1cnItPmFyY2gudm1fZXZl
bnQtPndyaXRlX2RhdGEuY3IzX25vZmx1c2ggPSBub2ZsdXNoOwogCiAgICAgICAgICAgICByZXR1
cm4gWDg2RU1VTF9PS0FZOwogICAgICAgICB9CiAgICAgfQogCi0gICAgaWYgKCBodm1fcGFnaW5n
X2VuYWJsZWQodikgJiYgIXBhZ2luZ19tb2RlX2hhcChjdXJyZCkgJiYKLSAgICAgICAgICgodmFs
dWUgXiB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkgPj4gUEFHRV9TSElGVCkgKQorICAgIGlmICgg
aHZtX3BhZ2luZ19lbmFibGVkKGN1cnIpICYmICFwYWdpbmdfbW9kZV9oYXAoY3VycmQpICYmCisg
ICAgICAgICAoKHZhbHVlIF4gY3Vyci0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pID4+IFBBR0VfU0hJ
RlQpICkKICAgICB7CiAgICAgICAgIC8qIFNoYWRvdy1tb2RlIENSMyBjaGFuZ2UuIENoZWNrIFBE
QlIgYW5kIHVwZGF0ZSByZWZjb3VudHMuICovCisgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBh
Z2U7CisKICAgICAgICAgSFZNX0RCR19MT0coREJHX0xFVkVMX1ZNTVUsICJDUjMgdmFsdWUgPSAl
bHgiLCB2YWx1ZSk7CiAgICAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihjdXJyZCwgdmFs
dWUgPj4gUEFHRV9TSElGVCwgTlVMTCwgUDJNX0FMTE9DKTsKICAgICAgICAgaWYgKCAhcGFnZSAp
CiAgICAgICAgICAgICBnb3RvIGJhZF9jcjM7CiAKLSAgICAgICAgcHV0X3BhZ2UocGFnZXRhYmxl
X2dldF9wYWdlKHYtPmFyY2guZ3Vlc3RfdGFibGUpKTsKLSAgICAgICAgdi0+YXJjaC5ndWVzdF90
YWJsZSA9IHBhZ2V0YWJsZV9mcm9tX3BhZ2UocGFnZSk7CisgICAgICAgIHB1dF9wYWdlKHBhZ2V0
YWJsZV9nZXRfcGFnZShjdXJyLT5hcmNoLmd1ZXN0X3RhYmxlKSk7CisgICAgICAgIGN1cnItPmFy
Y2guZ3Vlc3RfdGFibGUgPSBwYWdldGFibGVfZnJvbV9wYWdlKHBhZ2UpOwogCiAgICAgICAgIEhW
TV9EQkdfTE9HKERCR19MRVZFTF9WTU1VLCAiVXBkYXRlIENSMyB2YWx1ZSA9ICVseCIsIHZhbHVl
KTsKICAgICB9CiAKLSAgICB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSA9IHZhbHVlOwotICAgIHBh
Z2luZ191cGRhdGVfY3IzKHYsIG5vZmx1c2gpOworICAgIGN1cnItPmFyY2guaHZtLmd1ZXN0X2Ny
WzNdID0gdmFsdWU7CisgICAgcGFnaW5nX3VwZGF0ZV9jcjMoY3Vyciwgbm9mbHVzaCk7CiAgICAg
cmV0dXJuIFg4NkVNVUxfT0tBWTsKIAogIGJhZF9jcjM6CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
