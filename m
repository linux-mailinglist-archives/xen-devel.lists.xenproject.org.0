Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709E1314EF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:36:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUOF-0001RF-CD; Mon, 06 Jan 2020 15:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioUOD-0001RA-CZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:33:57 +0000
X-Inumbo-ID: eea9d860-3099-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea9d860-3099-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 15:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6D56AD0F;
 Mon,  6 Jan 2020 15:33:47 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Message-ID: <3bd38586-d76b-2ce5-a8bb-0777b30d5b61@suse.com>
Date: Mon, 6 Jan 2020 16:34:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/3] x86/mm: mod_l<N>_entry() have no need to
 use __copy_from_user()
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

bW9kX2wxX2VudHJ5KCkncyBuZWVkIHRvIGRvIHNvIHdlbnQgYXdheSB3aXRoIGNvbW1pdCAyZDA1
NTdjNWNiICgieDg2OgpGb2xkIHBhZ2VfaW5mbyBsb2NrIGludG8gdHlwZV9pbmZvIiksIGFuZCB0
aGUgb3RoZXIgdGhyZWUgbmV2ZXIgaGFkIHN1Y2gKYSBuZWVkLCBhdCBsZWFzdCBnb2luZyBiYWNr
IGFzIGZhciBhcyAzLjIuMC4gUmVwbGFjZSB0aGUgdXNlcyBieSBuZXdseQppbnRyb2R1Y2VkIGw8
Tj5lX2FjY2Vzc19vbmNlKCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Ci0tLQp2MjogVXNlIEFDQ0VTU19PTkNFKCkgY2xvbmVzLgoKLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTIxMjQsMTMgKzIxMjQsMTAg
QEAgc3RhdGljIGludCBtb2RfbDFfZW50cnkobDFfcGdlbnRyeV90ICpwbAogICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHZjcHUgKnB0X3ZjcHUsIHN0cnVjdCBkb21haW4gKnBnX2RvbSkK
IHsKICAgICBib29sIHByZXNlcnZlX2FkID0gKGNtZCA9PSBNTVVfUFRfVVBEQVRFX1BSRVNFUlZF
X0FEKTsKLSAgICBsMV9wZ2VudHJ5X3Qgb2wxZTsKKyAgICBsMV9wZ2VudHJ5X3Qgb2wxZSA9IGwx
ZV9hY2Nlc3Nfb25jZSgqcGwxZSk7CiAgICAgc3RydWN0IGRvbWFpbiAqcHRfZG9tID0gcHRfdmNw
dS0+ZG9tYWluOwogICAgIGludCByYyA9IDA7CiAKLSAgICBpZiAoIHVubGlrZWx5KF9fY29weV9m
cm9tX3VzZXIoJm9sMWUsIHBsMWUsIHNpemVvZihvbDFlKSkgIT0gMCkgKQotICAgICAgICByZXR1
cm4gLUVGQVVMVDsKLQogICAgIEFTU0VSVCghcGFnaW5nX21vZGVfcmVmY291bnRzKHB0X2RvbSkp
OwogCiAgICAgaWYgKCBsMWVfZ2V0X2ZsYWdzKG5sMWUpICYgX1BBR0VfUFJFU0VOVCApCkBAIC0y
MjQ4LDggKzIyNDUsNyBAQCBzdGF0aWMgaW50IG1vZF9sMl9lbnRyeShsMl9wZ2VudHJ5X3QgKnBs
CiAgICAgICAgIHJldHVybiAtRVBFUk07CiAgICAgfQogCi0gICAgaWYgKCB1bmxpa2VseShfX2Nv
cHlfZnJvbV91c2VyKCZvbDJlLCBwbDJlLCBzaXplb2Yob2wyZSkpICE9IDApICkKLSAgICAgICAg
cmV0dXJuIC1FRkFVTFQ7CisgICAgb2wyZSA9IGwyZV9hY2Nlc3Nfb25jZSgqcGwyZSk7CiAKICAg
ICBpZiAoIGwyZV9nZXRfZmxhZ3MobmwyZSkgJiBfUEFHRV9QUkVTRU5UICkKICAgICB7CkBAIC0y
MzExLDggKzIzMDcsNyBAQCBzdGF0aWMgaW50IG1vZF9sM19lbnRyeShsM19wZ2VudHJ5X3QgKnBs
CiAgICAgaWYgKCBpc19wdl8zMmJpdF9kb21haW4oZCkgJiYgKHBnZW50cnlfcHRyX3RvX3Nsb3Qo
cGwzZSkgPj0gMykgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAgIGlmICggdW5saWtl
bHkoX19jb3B5X2Zyb21fdXNlcigmb2wzZSwgcGwzZSwgc2l6ZW9mKG9sM2UpKSAhPSAwKSApCi0g
ICAgICAgIHJldHVybiAtRUZBVUxUOworICAgIG9sM2UgPSBsM2VfYWNjZXNzX29uY2UoKnBsM2Up
OwogCiAgICAgaWYgKCBsM2VfZ2V0X2ZsYWdzKG5sM2UpICYgX1BBR0VfUFJFU0VOVCApCiAgICAg
ewpAQCAtMjM3OCw4ICsyMzczLDcgQEAgc3RhdGljIGludCBtb2RfbDRfZW50cnkobDRfcGdlbnRy
eV90ICpwbAogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKLSAgICBpZiAoIHVubGlr
ZWx5KF9fY29weV9mcm9tX3VzZXIoJm9sNGUsIHBsNGUsIHNpemVvZihvbDRlKSkgIT0gMCkgKQot
ICAgICAgICByZXR1cm4gLUVGQVVMVDsKKyAgICBvbDRlID0gbDRlX2FjY2Vzc19vbmNlKCpwbDRl
KTsKIAogICAgIGlmICggbDRlX2dldF9mbGFncyhubDRlKSAmIF9QQUdFX1BSRVNFTlQgKQogICAg
IHsKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9wYWdlLmgKQEAgLTU1LDYgKzU1LDE2IEBACiAjZGVmaW5lIGw0ZV93cml0ZShsNGVwLCBs
NGUpIFwKICAgICBwdGVfd3JpdGUoJmw0ZV9nZXRfaW50cHRlKCoobDRlcCkpLCBsNGVfZ2V0X2lu
dHB0ZShsNGUpKQogCisvKiBUeXBlLWNvcnJlY3QgQUNDRVNTX09OQ0UoKSB3cmFwcGVycyBmb3Ig
UFRFIGFjY2Vzc2VzLiAqLworI2RlZmluZSBsMWVfYWNjZXNzX29uY2UobDFlKSAoKmNvbnRhaW5l
cl9vZigmQUNDRVNTX09OQ0UobDFlX2dldF9pbnRwdGUobDFlKSksIFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9sYXRpbGUgbDFfcGdlbnRyeV90LCBsMSkp
CisjZGVmaW5lIGwyZV9hY2Nlc3Nfb25jZShsMmUpICgqY29udGFpbmVyX29mKCZBQ0NFU1NfT05D
RShsMmVfZ2V0X2ludHB0ZShsMmUpKSwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2xhdGlsZSBsMl9wZ2VudHJ5X3QsIGwyKSkKKyNkZWZpbmUgbDNlX2Fj
Y2Vzc19vbmNlKGwzZSkgKCpjb250YWluZXJfb2YoJkFDQ0VTU19PTkNFKGwzZV9nZXRfaW50cHRl
KGwzZSkpLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
bGF0aWxlIGwzX3BnZW50cnlfdCwgbDMpKQorI2RlZmluZSBsNGVfYWNjZXNzX29uY2UobDRlKSAo
KmNvbnRhaW5lcl9vZigmQUNDRVNTX09OQ0UobDRlX2dldF9pbnRwdGUobDRlKSksIFwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9sYXRpbGUgbDRfcGdlbnRy
eV90LCBsNCkpCisKIC8qIEdldCBkaXJlY3QgaW50ZWdlciByZXByZXNlbnRhdGlvbiBvZiBhIHB0
ZSdzIGNvbnRlbnRzIChpbnRwdGVfdCkuICovCiAjZGVmaW5lIGwxZV9nZXRfaW50cHRlKHgpICAg
ICAgICAgICgoeCkubDEpCiAjZGVmaW5lIGwyZV9nZXRfaW50cHRlKHgpICAgICAgICAgICgoeCku
bDIpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
