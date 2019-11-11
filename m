Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F7F7702
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:48:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAxM-0003JO-D4; Mon, 11 Nov 2019 14:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAxK-0003JG-Lj
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:46:14 +0000
X-Inumbo-ID: 0221e128-0492-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0221e128-0492-11ea-b678-bc764e2007e4;
 Mon, 11 Nov 2019 14:46:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E088B02E;
 Mon, 11 Nov 2019 14:46:13 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Message-ID: <c1f58da4-0a05-5f77-13bd-a421582675d0@suse.com>
Date: Mon, 11 Nov 2019 15:46:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/3] xen/mcelog: add PPIN to record when
 available
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0byBhdWdtZW50IGNvbW1pdCAzZjVhNzg5NmE1ICgieDg2L21jZTogSW5jbHVkZSB0
aGUgUFBJTiBpbiBNQ0UKcmVjb3JkcyB3aGVuIGF2YWlsYWJsZSIpLgoKSSdtIGFsc28gYWRkaW5n
ICJzeW5kIiBhbmQgImlwaWQiIGZpZWxkcyB0byBzdHJ1Y3QgeGVuX21jZSwgaW4gYW4KYXR0ZW1w
dCB0byBrZWVwIGZpZWxkIG9mZnNldHMgaW4gc3luYyB3aXRoIHN0cnVjdCBtY2UuIFRoZXNlIHR3
byBmaWVsZHMKd29uJ3QgZ2V0IHBvcHVsYXRlZCBmb3Igbm93LCB0aG91Z2guCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9tc3ItaW5kZXguaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXgu
aApAQCAtMzkzLDYgKzM5Myw4IEBACiAjZGVmaW5lIE1TUl9BTURfUFNUQVRFX0RFRl9CQVNFCQkw
eGMwMDEwMDY0CiAjZGVmaW5lIE1TUl9BTUQ2NF9PU1ZXX0lEX0xFTkdUSAkweGMwMDEwMTQwCiAj
ZGVmaW5lIE1TUl9BTUQ2NF9PU1ZXX1NUQVRVUwkJMHhjMDAxMDE0MQorI2RlZmluZSBNU1JfQU1E
X1BQSU5fQ1RMCQkweGMwMDEwMmYwCisjZGVmaW5lIE1TUl9BTURfUFBJTgkJCTB4YzAwMTAyZjEK
ICNkZWZpbmUgTVNSX0FNRDY0X0xTX0NGRwkJMHhjMDAxMTAyMAogI2RlZmluZSBNU1JfQU1ENjRf
RENfQ0ZHCQkweGMwMDExMDIyCiAjZGVmaW5lIE1TUl9BTUQ2NF9CVV9DRkcyCQkweGMwMDExMDJh
Ci0tLSBhL2RyaXZlcnMveGVuL21jZWxvZy5jCisrKyBiL2RyaXZlcnMveGVuL21jZWxvZy5jCkBA
IC0yNTMsNiArMjUzLDExIEBAIHN0YXRpYyBpbnQgY29udmVydF9sb2coc3RydWN0IG1jX2luZm8g
Km0KIAkJY2FzZSBNU1JfSUEzMl9NQ0dfQ0FQOgogCQkJbS5tY2djYXAgPSBnX3BoeXNpbmZvW2ld
Lm1jX21zcnZhbHVlc1tqXS52YWx1ZTsKIAkJCWJyZWFrOworCisJCWNhc2UgTVNSX1BQSU46CisJ
CWNhc2UgTVNSX0FNRF9QUElOOgorCQkJbS5wcGluID0gZ19waHlzaW5mb1tpXS5tY19tc3J2YWx1
ZXNbal0udmFsdWU7CisJCQlicmVhazsKIAkJfQogCiAJbWljID0gTlVMTDsKLS0tIGEvaW5jbHVk
ZS94ZW4vaW50ZXJmYWNlL3hlbi1tY2EuaAorKysgYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVu
LW1jYS5oCkBAIC0zMzIsNyArMzMyLDExIEBAIHN0cnVjdCB4ZW5fbWMgewogfTsKIERFRklORV9H
VUVTVF9IQU5ETEVfU1RSVUNUKHhlbl9tYyk7CiAKLS8qIEZpZWxkcyBhcmUgemVybyB3aGVuIG5v
dCBhdmFpbGFibGUgKi8KKy8qCisgKiBGaWVsZHMgYXJlIHplcm8gd2hlbiBub3QgYXZhaWxhYmxl
LiBBbHNvLCB0aGlzIHN0cnVjdCBpcyBzaGFyZWQgd2l0aAorICogdXNlcnNwYWNlIG1jZWxvZyBh
bmQgdGh1cyBtdXN0IGtlZXAgZXhpc3RpbmcgZmllbGRzIGF0IGN1cnJlbnQgb2Zmc2V0cy4KKyAq
IE9ubHkgYWRkIG5ldyBmaWVsZHMgdG8gdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlCisgKi8KIHN0
cnVjdCB4ZW5fbWNlIHsKIAlfX3U2NCBzdGF0dXM7CiAJX191NjQgbWlzYzsKQEAgLTM1Myw2ICsz
NTcsOSBAQCBzdHJ1Y3QgeGVuX21jZSB7CiAJX191MzIgc29ja2V0aWQ7CS8qIENQVSBzb2NrZXQg
SUQgKi8KIAlfX3UzMiBhcGljaWQ7CS8qIENQVSBpbml0aWFsIGFwaWMgSUQgKi8KIAlfX3U2NCBt
Y2djYXA7CS8qIE1DR0NBUCBNU1I6IG1hY2hpbmUgY2hlY2sgY2FwYWJpbGl0aWVzIG9mIENQVSAq
LworCV9fdTY0IHN5bmQ7CS8qIE1DQV9TWU5EIE1TUjogb25seSB2YWxpZCBvbiBTTUNBIHN5c3Rl
bXMgKi8KKwlfX3U2NCBpcGlkOwkvKiBNQ0FfSVBJRCBNU1I6IG9ubHkgdmFsaWQgb24gU01DQSBz
eXN0ZW1zICovCisJX191NjQgcHBpbjsJLyogUHJvdGVjdGVkIFByb2Nlc3NvciBJbnZlbnRvcnkg
TnVtYmVyICovCiB9OwogCiAvKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
