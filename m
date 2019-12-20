Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB41127BE2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIUw-0007Ar-6x; Fri, 20 Dec 2019 13:39:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIUv-0007Aa-0R
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:39:17 +0000
X-Inumbo-ID: 1d2801ae-232e-11ea-935b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d2801ae-232e-11ea-935b-12813bfff9fa;
 Fri, 20 Dec 2019 13:39:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0EBA8AED6;
 Fri, 20 Dec 2019 13:39:15 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Message-ID: <fcb92f27-bc40-a839-550a-c9a8671b95c8@suse.com>
Date: Fri, 20 Dec 2019 14:39:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/5] x86emul: introduce
 CASE_SIMD_PACKED_INT_VEX()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlcmUgYXJlIG1hbnkgQVZYeywyfSBpbnNucyBoYXZpbmcgbGVnYWN5IE1NWCBhbmQg
U0lNRApjb3VudGVycGFydHMsIGhhdmUgYSBtYWNybyBjb3ZlcmluZyBhbGwgdGhyZWUgaW4gb25l
IGdvLiBUaGlzIChpbW8pCmltcHJvdmVzIHJlYWRhYmlsaXR5IChzaW1wbHkgYnkgdGhlIHNocnVu
ayBudW1iZXIgb2YgbGluZXMpIGFuZCBoZWxwcwpwcmVwYXJlIGZvciBvcHRpb25hbGx5IGRpc2Fi
bGluZyBNTVggYW5kIFNJTUQgc3VwcG9ydCBpbiB0aGUgZW11bGF0b3IuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2
X2VtdWxhdGUuYwpAQCAtNjAwNiw2ICs2MDA2LDEwIEBAIHg4Nl9lbXVsYXRlKAogI2RlZmluZSBD
QVNFX1NJTURfUEFDS0VEX0lOVChwZngsIG9wYykgICAgICAgXAogICAgIGNhc2UgWDg2RU1VTF9P
UEMocGZ4LCBvcGMpOiAgICAgICAgICAgICAgXAogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYocGZ4
LCBvcGMpCisjZGVmaW5lIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWChwZngsIG9wYykgICBcCisg
ICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQocGZ4LCBvcGMpOiAgICAgICAgICBcCisgICAgY2FzZSBY
ODZFTVVMX09QQ19WRVhfNjYocGZ4LCBvcGMpCisKICNkZWZpbmUgQ0FTRV9TSU1EX1NJTkdMRV9G
UChraW5kLCBwZngsIG9wYykgIFwKICAgICBjYXNlIFg4NkVNVUxfT1BDIyNraW5kKHBmeCwgb3Bj
KTogICAgICAgIFwKICAgICBjYXNlIFg4NkVNVUxfT1BDIyNraW5kIyNfRjMocGZ4LCBvcGMpCkBA
IC02NzA2LDggKzY3MTAsOCBAQCB4ODZfZW11bGF0ZSgKIAogICAgIENBU0VfU0lNRF9QQUNLRURf
RlAoLCAweDBmLCAweDUwKTogICAgIC8qIG1vdm1za3B7cyxkfSB4bW0scmVnICovCiAgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUChfVkVYLCAweDBmLCAweDUwKTogLyogdm1vdm1za3B7cyxkfSB7eCx5
fW1tLHJlZyAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZDcpOiAgICAgIC8q
IHBtb3Ztc2tiIHsseH1tbSxyZWcgKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBm
LCAweGQ3KTogICAvKiB2cG1vdm1za2Ige3gseX1tbSxyZWcgKi8KKyAgICBDQVNFX1NJTURfUEFD
S0VEX0lOVF9WRVgoMHgwZiwgMHhkNyk6ICAvKiBwbW92bXNrYiB7LHh9bW0scmVnICovCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBtb3Ztc2tiIHt4LHl9
bW0scmVnICovCiAgICAgICAgIG9wYyA9IGluaXRfcHJlZml4ZXMoc3R1Yik7CiAgICAgICAgIG9w
Y1swXSA9IGI7CiAgICAgICAgIC8qIENvbnZlcnQgR1BSIGRlc3RpbmF0aW9uIHRvICVyQVguICov
CkBAIC02ODE3LDEyMiArNjgyMSwxMjIgQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIG9wX2J5dGVz
ID0gMTYgPDwgZXZleC5scjsKICAgICAgICAgZ290byBzaW1kX3ptbTsKIAotICAgIENBU0VfU0lN
RF9QQUNLRURfSU5UKDB4MGYsIDB4NjApOiAgICAvKiBwdW5wY2tsYncgeyx4fW1tL21lbSx7LHh9
bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDYwKTogLyogdnB1bnBj
a2xidyB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VE
X0lOVCgweDBmLCAweDYxKTogICAgLyogcHVucGNrbHdkIHsseH1tbS9tZW0seyx4fW1tICovCi0g
ICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHg2MSk6IC8qIHZwdW5wY2tsd2Qge3gs
eX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgw
ZiwgMHg2Mik6ICAgIC8qIHB1bnBja2xkcSB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2Ug
WDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4NjIpOiAvKiB2cHVucGNrbGRxIHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4Njgp
OiAgICAvKiBwdW5wY2toYncgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxf
T1BDX1ZFWF82NigweDBmLCAweDY4KTogLyogdnB1bnBja2hidyB7eCx5fW1tL21lbSx7eCx5fW1t
LHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweDY5KTogICAgLyog
cHVucGNraHdkIHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhf
NjYoMHgwZiwgMHg2OSk6IC8qIHZwdW5wY2tod2Qge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1t
ICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg2YSk6ICAgIC8qIHB1bnBja2hk
cSB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYs
IDB4NmEpOiAvKiB2cHVucGNraGRxIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAg
IENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweDYwKTogLyogcHVucGNrbGJ3IHsseH1t
bS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiB2cHVucGNrbGJ3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0Vf
U0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweDYxKTogLyogcHVucGNrbHdkIHsseH1tbS9tZW0s
eyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2
cHVucGNrbHdkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9Q
QUNLRURfSU5UX1ZFWCgweDBmLCAweDYyKTogLyogcHVucGNrbGRxIHsseH1tbS9tZW0seyx4fW1t
ICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHVucGNr
bGRxIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UX1ZFWCgweDBmLCAweDY4KTogLyogcHVucGNraGJ3IHsseH1tbS9tZW0seyx4fW1tICovCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHVucGNraGJ3IHt4
LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZF
WCgweDBmLCAweDY5KTogLyogcHVucGNraHdkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHVucGNraHdkIHt4LHl9bW0v
bWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBm
LCAweDZhKTogLyogcHVucGNraGRxIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHVucGNraGRxIHt4LHl9bW0vbWVtLHt4
LHl9bW0se3gseX1tbSAqLwogICAgICAgICBvcF9ieXRlcyA9IHZleC5wZnggPyAxNiA8PCB2ZXgu
bCA6IGIgJiA4ID8gOCA6IDQ7CiAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwotICAgIENBU0Vf
U0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4NjMpOiAgICAvKiBwYWNrc3NidyB7LHh9bW0vbWVtLHss
eH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4NjMpOiAvKiB2cGFj
a3NzYncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tF
RF9JTlQoMHgwZiwgMHg2NCk6ICAgIC8qIHBjbXBndGIgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAg
ICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDY0KTogLyogdnBjbXBndGIge3gseX1t
bS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwg
MHg2NSk6ICAgIC8qIHBjbXBndHcgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVN
VUxfT1BDX1ZFWF82NigweDBmLCAweDY1KTogLyogdnBjbXBndHcge3gseX1tbS9tZW0se3gseX1t
bSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg2Nik6ICAgIC8q
IHBjbXBndGQgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82
NigweDBmLCAweDY2KTogLyogdnBjbXBndGQge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICov
Ci0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg2Nyk6ICAgIC8qIHBhY2t1c2J3IHss
eH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHg2
Nyk6IC8qIHZwYWNrdXNidyB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNF
X1NJTURfUEFDS0VEX0lOVCgweDBmLCAweDZiKTogICAgLyogcGFja3Nzd2Qgeyx4fW1tL21lbSx7
LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDZiKTogLyogdnBh
Y2tzc3dkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UX1ZFWCgweDBmLCAweDYzKTogLyogcGFja3NzYncgeyx4fW1tL21lbSx7LHh9bW0gKi8K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwYWNrc3NidyB7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9W
RVgoMHgwZiwgMHg2NCk6IC8qIHBjbXBndGIgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwY21wZ3RiIHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAw
eDY1KTogLyogcGNtcGd0dyB7LHh9bW0vbWVtLHsseH1tbSAqLworICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBjbXBndHcge3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4NjYpOiAvKiBw
Y21wZ3RkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiB2cGNtcGd0ZCB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8K
KyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHg2Nyk6IC8qIHBhY2t1c2J3IHss
eH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiB2cGFja3VzYncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4NmIpOiAvKiBwYWNrc3N3ZCB7LHh9bW0vbWVt
LHsseH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
dnBhY2tzc3dkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1V
TF9PUENfNjYoMHgwZiwgMHg2Yyk6ICAgICAvKiBwdW5wY2tscWRxIHhtbS9tMTI4LHhtbSAqLwog
ICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4NmMpOiAvKiB2cHVucGNrbHFkcSB7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KICAgICBjYXNlIFg4NkVNVUxfT1BDXzY2KDB4
MGYsIDB4NmQpOiAgICAgLyogcHVucGNraHFkcSB4bW0vbTEyOCx4bW0gKi8KICAgICBjYXNlIFg4
NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDZkKTogLyogdnB1bnBja2hxZHEge3gseX1tbS9tZW0s
e3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg3NCk6
ICAgIC8qIHBjbXBlcWIgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BD
X1ZFWF82NigweDBmLCAweDc0KTogLyogdnBjbXBlcWIge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg3NSk6ICAgIC8qIHBjbXBl
cXcgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBm
LCAweDc1KTogLyogdnBjbXBlcXcge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAg
Q0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHg3Nik6ICAgIC8qIHBjbXBlcWQgeyx4fW1tL21l
bSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDc2KTogLyog
dnBjbXBlcWQge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BB
Q0tFRF9JTlQoMHgwZiwgMHhkMSk6ICAgIC8qIHBzcmx3IHsseH1tbS9tZW0seyx4fW1tICovCi0g
ICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkMSk6IC8qIHZwc3JsdyB4bW0vbTEy
OCx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGQy
KTogICAgLyogcHNybGQgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BD
X1ZFWF82NigweDBmLCAweGQyKTogLyogdnBzcmxkIHhtbS9tMTI4LHt4LHl9bW0se3gseX1tbSAq
LwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZDMpOiAgICAvKiBwc3JscSB7LHh9
bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZDMp
OiAvKiB2cHNybHEgeG1tL20xMjgse3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BB
Q0tFRF9JTlRfVkVYKDB4MGYsIDB4NzQpOiAvKiBwY21wZXFiIHsseH1tbS9tZW0seyx4fW1tICov
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGNtcGVxYiB7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9W
RVgoMHgwZiwgMHg3NSk6IC8qIHBjbXBlcXcgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwY21wZXF3IHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAw
eDc2KTogLyogcGNtcGVxZCB7LHh9bW0vbWVtLHsseH1tbSAqLworICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBjbXBlcWQge3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZDEpOiAvKiBw
c3JsdyB7LHh9bW0vbWVtLHsseH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLyogdnBzcmx3IHhtbS9tMTI4LHt4LHl9bW0se3gseX1tbSAqLworICAgIENB
U0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGQyKTogLyogcHNybGQgeyx4fW1tL21lbSx7
LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZw
c3JsZCB4bW0vbTEyOCx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lO
VF9WRVgoMHgwZiwgMHhkMyk6IC8qIHBzcmxxIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHNybHEgeG1tL20xMjgse3gs
eX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGQ0KTogICAg
IC8qIHBhZGRxIHhtbS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4
MGYsIDB4ZDQpOiAvKiB2cGFkZHEge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAg
Q0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhkNSk6ICAgIC8qIHBtdWxsdyB7LHh9bW0vbWVt
LHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZDUpOiAvKiB2
cG11bGx3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UKDB4MGYsIDB4ZDgpOiAgICAvKiBwc3VidXNiIHsseH1tbS9tZW0seyx4fW1tICovCi0g
ICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkOCk6IC8qIHZwc3VidXNiIHt4LHl9
bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYs
IDB4ZDkpOiAgICAvKiBwc3VidXN3IHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZF
TVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkOSk6IC8qIHZwc3VidXN3IHt4LHl9bW0vbWVtLHt4LHl9
bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGQ1KTog
LyogcG11bGx3IHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiB2cG11bGx3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAq
LworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGQ4KTogLyogcHN1YnVzYiB7
LHh9bW0vbWVtLHsseH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogdnBzdWJ1c2Ige3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZDkpOiAvKiBwc3VidXN3IHsseH1tbS9tZW0s
eyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2
cHN1YnVzdyB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KICAgICBjYXNlIFg4NkVNVUxf
T1BDXzY2KDB4MGYsIDB4ZGEpOiAgICAgLyogcG1pbnViIHhtbS9tMTI4LHhtbSAqLwogICAgIGNh
c2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZGEpOiAvKiB2cG1pbnViIHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZGIp
OiAgICAvKiBwYW5kIHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19W
RVhfNjYoMHgwZiwgMHhkYik6IC8qIHZwYW5kIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAq
LwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZGMpOiAgICAvKiBwYWRkdXNiIHss
eH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhk
Yyk6IC8qIHZwYWRkdXNiIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0Vf
U0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZGQpOiAgICAvKiBwYWRkdXN3IHsseH1tbS9tZW0seyx4
fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkZCk6IC8qIHZwYWRk
dXN3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UX1ZFWCgweDBmLCAweGRiKTogLyogcGFuZCB7LHh9bW0vbWVtLHsseH1tbSAqLworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBhbmQge3gseX1tbS9tZW0s
e3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4
ZGMpOiAvKiBwYWRkdXNiIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGFkZHVzYiB7eCx5fW1tL21lbSx7eCx5fW1tLHt4
LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhkZCk6IC8qIHBh
ZGR1c3cgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC8qIHZwYWRkdXN3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwog
ICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhkZSk6ICAgICAvKiBwbWF4dWIgeG1tL20x
MjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkZSk6IC8qIHZw
bWF4dWIge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tF
RF9JTlQoMHgwZiwgMHhkZik6ICAgIC8qIHBhbmRuIHsseH1tbS9tZW0seyx4fW1tICovCi0gICAg
Y2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhkZik6IC8qIHZwYW5kbiB7eCx5fW1tL21l
bSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwg
MHhkZik6IC8qIHBhbmRuIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGFuZG4ge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGUwKTogICAgIC8qIHBhdmdi
IHhtbS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZTAp
OiAvKiB2cGF2Z2Ige3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1E
X1BBQ0tFRF9JTlQoMHgwZiwgMHhlMSk6ICAgIC8qIHBzcmF3IHsseH1tbS9tZW0seyx4fW1tICov
Ci0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhlMSk6IC8qIHZwc3JhdyB4bW0v
bTEyOCx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAw
eGUyKTogICAgLyogcHNyYWQgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxf
T1BDX1ZFWF82NigweDBmLCAweGUyKTogLyogdnBzcmFkIHhtbS9tMTI4LHt4LHl9bW0se3gseX1t
bSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGUxKTogLyogcHNyYXcg
eyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIHZwc3JhdyB4bW0vbTEyOCx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJ
TURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhlMik6IC8qIHBzcmFkIHsseH1tbS9tZW0seyx4fW1t
ICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHNyYWQg
eG1tL20xMjgse3gseX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBm
LCAweGUzKTogICAgIC8qIHBhdmd3IHhtbS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9P
UENfVkVYXzY2KDB4MGYsIDB4ZTMpOiAvKiB2cGF2Z3cge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGU0KTogICAgIC8qIHBtdWxo
dXcgeG1tL20xMjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhl
NCk6IC8qIHZwbXVsaHV3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0Vf
U0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZTUpOiAgICAvKiBwbXVsaHcgeyx4fW1tL21lbSx7LHh9
bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGU1KTogLyogdnBtdWxo
dyB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lO
VCgweDBmLCAweGU4KTogICAgLyogcHN1YnNiIHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2Fz
ZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhlOCk6IC8qIHZwc3Vic2Ige3gseX1tbS9tZW0s
e3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhlOSk6
ICAgIC8qIHBzdWJzdyB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENf
VkVYXzY2KDB4MGYsIDB4ZTkpOiAvKiB2cHN1YnN3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1t
bSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGU1KTogLyogcG11bGh3
IHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiB2cG11bGh3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENB
U0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGU4KTogLyogcHN1YnNiIHsseH1tbS9tZW0s
eyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2
cHN1YnNiIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UX1ZFWCgweDBmLCAweGU5KTogLyogcHN1YnN3IHsseH1tbS9tZW0seyx4fW1tICovCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHN1YnN3IHt4LHl9
bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwg
MHhlYSk6ICAgICAvKiBwbWluc3cgeG1tL20xMjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZiwgMHhlYSk6IC8qIHZwbWluc3cge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhlYik6ICAgIC8qIHBvciB7
LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4
ZWIpOiAvKiB2cG9yIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lN
RF9QQUNLRURfSU5UKDB4MGYsIDB4ZWMpOiAgICAvKiBwYWRkc2Igeyx4fW1tL21lbSx7LHh9bW0g
Ki8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGVjKTogLyogdnBhZGRzYiB7
eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgw
eDBmLCAweGVkKTogICAgLyogcGFkZHN3IHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBY
ODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhlZCk6IC8qIHZwYWRkc3cge3gseX1tbS9tZW0se3gs
eX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZWIp
OiAvKiBwb3Igeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIHZwb3Ige3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisg
ICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZWMpOiAvKiBwYWRkc2Igeyx4fW1t
L21lbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIHZwYWRkc2Ige3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FTRV9TSU1E
X1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZWQpOiAvKiBwYWRkc3cgeyx4fW1tL21lbSx7LHh9bW0g
Ki8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwYWRkc3cg
e3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182Nigw
eDBmLCAweGVlKTogICAgIC8qIHBtYXhzdyB4bW0vbTEyOCx4bW0gKi8KICAgICBjYXNlIFg4NkVN
VUxfT1BDX1ZFWF82NigweDBmLCAweGVlKTogLyogdnBtYXhzdyB7eCx5fW1tL21lbSx7eCx5fW1t
LHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGVmKTogICAgLyog
cHhvciB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4
MGYsIDB4ZWYpOiAvKiB2cHhvciB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBD
QVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGYxKTogICAgLyogcHNsbHcgeyx4fW1tL21lbSx7
LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGYxKTogLyogdnBz
bGx3IHhtbS9tMTI4LHt4LHl9bW0se3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5U
KDB4MGYsIDB4ZjIpOiAgICAvKiBwc2xsZCB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2Ug
WDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjIpOiAvKiB2cHNsbGQgeG1tL20xMjgse3gseX1t
bSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhmMyk6ICAgIC8q
IHBzbGxxIHsseH1tbS9tZW0seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYo
MHgwZiwgMHhmMyk6IC8qIHZwc2xscSB4bW0vbTEyOCx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBD
QVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhlZik6IC8qIHB4b3Igeyx4fW1tL21lbSx7
LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZw
eG9yIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UX1ZFWCgweDBmLCAweGYxKTogLyogcHNsbHcgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwc2xsdyB4bW0vbTEyOCx7
eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhm
Mik6IC8qIHBzbGxkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAvKiB2cHNsbGQgeG1tL20xMjgse3gseX1tbSx7eCx5fW1tICov
CisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZjMpOiAvKiBwc2xscSB7LHh9
bW0vbWVtLHsseH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogdnBzbGxxIHhtbS9tMTI4LHt4LHl9bW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1V
TF9PUENfNjYoMHgwZiwgMHhmNCk6ICAgICAvKiBwbXVsdWRxIHhtbS9tMTI4LHhtbSAqLwogICAg
IGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5fW1t
L21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAw
eGY1KTogICAgLyogcG1hZGR3ZCB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1V
TF9PUENfVkVYXzY2KDB4MGYsIDB4ZjUpOiAvKiB2cG1hZGR3ZCB7eCx5fW1tL21lbSx7eCx5fW1t
LHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhmNSk6IC8q
IHBtYWRkd2Qgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIHZwbWFkZHdkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAq
LwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhmNik6ICAgICAvKiBwc2FkYncgeG1t
L20xMjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNik6IC8q
IHZwc2FkYncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1EX1BB
Q0tFRF9JTlQoMHgwZiwgMHhmOCk6ICAgIC8qIHBzdWJiIHsseH1tbS9tZW0seyx4fW1tICovCi0g
ICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmOCk6IC8qIHZwc3ViYiB7eCx5fW1t
L21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAw
eGY5KTogICAgLyogcHN1Yncgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVNVUxf
T1BDX1ZFWF82NigweDBmLCAweGY5KTogLyogdnBzdWJ3IHt4LHl9bW0vbWVtLHt4LHl9bW0se3gs
eX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZmEpOiAgICAvKiBwc3Vi
ZCB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYs
IDB4ZmEpOiAvKiB2cHN1YmQge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZjgpOiAvKiBwc3ViYiB7LHh9bW0vbWVtLHss
eH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBz
dWJiIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURf
SU5UX1ZFWCgweDBmLCAweGY5KTogLyogcHN1Yncgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwc3VidyB7eCx5fW1tL21l
bSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwg
MHhmYSk6IC8qIHBzdWJkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiB2cHN1YmQge3gseX1tbS9tZW0se3gseX1tbSx7eCx5
fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGZiKTogICAgIC8qIHBzdWJx
IHhtbS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZmIp
OiAvKiB2cHN1YnEge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCi0gICAgQ0FTRV9TSU1E
X1BBQ0tFRF9JTlQoMHgwZiwgMHhmYyk6ICAgIC8qIHBhZGRiIHsseH1tbS9tZW0seyx4fW1tICov
Ci0gICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmYyk6IC8qIHZwYWRkYiB7eCx5
fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBm
LCAweGZkKTogICAgLyogcGFkZHcgeyx4fW1tL21lbSx7LHh9bW0gKi8KLSAgICBjYXNlIFg4NkVN
VUxfT1BDX1ZFWF82NigweDBmLCAweGZkKTogLyogdnBhZGR3IHt4LHl9bW0vbWVtLHt4LHl9bW0s
e3gseX1tbSAqLwotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZmUpOiAgICAvKiBw
YWRkZCB7LHh9bW0vbWVtLHsseH1tbSAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4
MGYsIDB4ZmUpOiAvKiB2cGFkZGQge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCisgICAg
Q0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVYKDB4MGYsIDB4ZmMpOiAvKiBwYWRkYiB7LHh9bW0vbWVt
LHsseH1tbSAqLworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
dnBhZGRiIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UX1ZFWCgweDBmLCAweGZkKTogLyogcGFkZHcgeyx4fW1tL21lbSx7LHh9bW0gKi8KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwYWRkdyB7eCx5fW1t
L21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgw
ZiwgMHhmZSk6IC8qIHBhZGRkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2cGFkZGQge3gseX1tbS9tZW0se3gseX1tbSx7
eCx5fW1tICovCiAgICAgc2ltZF8wZl9pbnQ6CiAgICAgICAgIGlmICggdmV4Lm9wY3ggIT0gdmV4
X25vbmUgKQogICAgICAgICB7CkBAIC03MDczLDEwICs3MDc3LDEwIEBAIHg4Nl9lbXVsYXRlKAog
ICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIWV2ZXgudywgRVhDX1VEKTsKICAgICAgICAg
Z290byBhdng1MTJmX25vX3NhZTsKIAotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4
NmUpOiAgICAvKiBtb3Z7ZCxxfSByL20seyx4fW1tICovCi0gICAgY2FzZSBYODZFTVVMX09QQ19W
RVhfNjYoMHgwZiwgMHg2ZSk6IC8qIHZtb3Z7ZCxxfSByL20seG1tICovCi0gICAgQ0FTRV9TSU1E
X1BBQ0tFRF9JTlQoMHgwZiwgMHg3ZSk6ICAgIC8qIG1vdntkLHF9IHsseH1tbSxyL20gKi8KLSAg
ICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweDdlKTogLyogdm1vdntkLHF9IHhtbSxy
L20gKi8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHg2ZSk6IC8qIG1vdntk
LHF9IHIvbSx7LHh9bW0gKi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIHZtb3Z7ZCxxfSByL20seG1tICovCisgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlRfVkVY
KDB4MGYsIDB4N2UpOiAvKiBtb3Z7ZCxxfSB7LHh9bW0sci9tICovCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB2bW92e2QscX0geG1tLHIvbSAqLwogICAgICAg
ICBpZiAoIHZleC5vcGN4ICE9IHZleF9ub25lICkKICAgICAgICAgewogICAgICAgICAgICAgZ2Vu
ZXJhdGVfZXhjZXB0aW9uX2lmKHZleC5sIHx8IHZleC5yZWcgIT0gMHhmLCBFWENfVUQpOwpAQCAt
NzE5MSw4ICs3MTk1LDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIG9wX2J5dGVzID0gODsKICAg
ICAgICAgZ290byBzaW1kXzBmX2ludDsKIAotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYs
IDB4NzApOiAgICAvKiBwc2h1Znt3LGR9ICRpbW04LHsseH1tbS9tZW0seyx4fW1tICovCi0gICAg
Y2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHg3MCk6IC8qIHZwc2h1ZmQgJGltbTgse3gs
eX1tbS9tZW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAw
eDcwKTovKiBwc2h1Znt3LGR9ICRpbW04LHsseH1tbS9tZW0seyx4fW1tICovCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwc2h1ZmQgJGltbTgse3gseX1tbS9t
ZW0se3gseX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfRjMoMHgwZiwgMHg3MCk6ICAgICAv
KiBwc2h1Zmh3ICRpbW04LHhtbS9tMTI4LHhtbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVY
X0YzKDB4MGYsIDB4NzApOiAvKiB2cHNodWZodyAkaW1tOCx7eCx5fW1tL21lbSx7eCx5fW1tICov
CiAgICAgY2FzZSBYODZFTVVMX09QQ19GMigweDBmLCAweDcwKTogICAgIC8qIHBzaHVmbHcgJGlt
bTgseG1tL20xMjgseG1tICovCkBAIC04MTUyLDggKzgxNTYsOCBAQCB4ODZfZW11bGF0ZSgKICAg
ICAgICAgc2ZlbmNlID0gdHJ1ZTsKICAgICAgICAgYnJlYWs7CiAKLSAgICBDQVNFX1NJTURfUEFD
S0VEX0lOVCgweDBmLCAweGM0KTogICAgICAvKiBwaW5zcncgJGltbTgscjMyL20xNix7LHh9bW0g
Ki8KLSAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGM0KTogICAvKiB2cGluc3J3
ICRpbW04LHIzMi9tMTYseG1tLHhtbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgw
eDBmLCAweGM0KTogIC8qIHBpbnNydyAkaW1tOCxyMzIvbTE2LHsseH1tbSAqLworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHZwaW5zcncgJGltbTgscjMyL20x
Nix4bW0seG1tICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZih2ZXgubCwgRVhDX1VE
KTsKICAgICAgICAgbWVtY3B5KG1tdmFscCwgJnNyYy52YWwsIDIpOwogICAgICAgICBlYS50eXBl
ID0gT1BfTUVNOwpAQCAtODE3Niw4ICs4MTgwLDggQEAgeDg2X2VtdWxhdGUoCiAgICAgICAgIHN0
YXRlLT5zaW1kX3NpemUgPSBzaW1kX290aGVyOwogICAgICAgICBnb3RvIGF2eDUxMmZfaW1tOF9u
b19zYWU7CiAKLSAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGM1KTogICAgICAvKiBw
ZXh0cncgJGltbTgseyx4fW1tLHJlZyAqLwotICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4
MGYsIDB4YzUpOiAgIC8qIHZwZXh0cncgJGltbTgseG1tLHJlZyAqLworICAgIENBU0VfU0lNRF9Q
QUNLRURfSU5UX1ZFWCgweDBmLCAweGM1KTogIC8qIHBleHRydyAkaW1tOCx7LHh9bW0scmVnICov
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogdnBleHRydyAk
aW1tOCx4bW0scmVnICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZih2ZXgubCwgRVhD
X1VEKTsKICAgICAgICAgb3BjID0gaW5pdF9wcmVmaXhlcyhzdHViKTsKICAgICAgICAgb3BjWzBd
ID0gYjsKQEAgLTg0NjQsOCArODQ2OCw3IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBvcF9ieXRl
cyA9IDggPDwgKCEhKHZleC5wZnggJiBWRVhfUFJFRklYX0RPVUJMRV9NQVNLKSArIHZleC5sKTsK
ICAgICAgICAgZ290byBzaW1kXzBmX2N2dDsKIAotICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4
MGYsIDB4ZjcpOiAgICAvKiBtYXNrbW92e3EsZHF1fSB7LHh9bW0seyx4fW1tICovCi0gICAgY2Fz
ZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNyk6IC8qIHZtYXNrbW92ZHF1IHhtbSx4bW0g
Ki8KKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVF9WRVgoMHgwZiwgMHhmNyk6IC8qIHssdn1tYXNr
bW92e3EsZHF1fSB7LHh9bW0seyx4fW1tICovCiAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9p
ZihlYS50eXBlICE9IE9QX1JFRywgRVhDX1VEKTsKICAgICAgICAgaWYgKCB2ZXgub3BjeCAhPSB2
ZXhfbm9uZSApCiAgICAgICAgIHsKQEAgLTExMzMzLDggKzExMzM2LDggQEAgeDg2X2luc25faXNf
bWVtX2FjY2Vzcyhjb25zdCBzdHJ1Y3QgeDg2XwogICAgIGNhc2UgMHhhNCAuLi4gMHhhNzogLyog
TU9WUyAvIENNUFMgKi8KICAgICBjYXNlIDB4YWEgLi4uIDB4YWY6IC8qIFNUT1MgLyBMT0RTIC8g
U0NBUyAqLwogICAgIGNhc2UgMHhkNzogICAgICAgICAgLyogWExBVCAqLwotICAgIENBU0VfU0lN
RF9QQUNLRURfSU5UKDB4MGYsIDB4ZjcpOiAgICAvKiBNQVNLTU9We1EsRFFVfSAqLwotICAgIGNh
c2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjcpOiAvKiBWTUFTS01PVkRRVSAqLworICAg
IENBU0VfU0lNRF9QQUNLRURfSU5UX1ZFWCgweDBmLCAweGY3KTogLyogTUFTS01PVntRLERRVX0g
Ki8KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFZNQVNLTU9W
RFFVICovCiAgICAgICAgIHJldHVybiB0cnVlOwogCiAgICAgY2FzZSBYODZFTVVMX09QQygweDBm
LCAweDAxKToKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
