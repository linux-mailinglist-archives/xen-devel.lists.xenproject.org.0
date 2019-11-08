Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C498FF4F72
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 16:25:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT675-0006CM-Qy; Fri, 08 Nov 2019 15:23:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT674-0006C8-PO
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 15:23:50 +0000
X-Inumbo-ID: c39a000a-023b-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c39a000a-023b-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 15:23:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B2A0AC44;
 Fri,  8 Nov 2019 15:23:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
Message-ID: <5e833675-602c-7aa6-4fb7-34814355b844@suse.com>
Date: Fri, 8 Nov 2019 16:24:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 2/3] x86: explicitly disallow guest access to
 PPIN
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

VG8gZnVsZmlsbCB0aGUgInByb3RlY3RlZCIgaW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVh
bCBoYXJkd2FyZQp2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lz
dGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBVc2UgImNwIiBjb25zaXN0ZW50bHkuIFJlLWJhc2Uu
CgotLS0gYS94ZW4vYXJjaC94ODYvbXNyLmMKKysrIGIveGVuL2FyY2gveDg2L21zci5jCkBAIC0x
MzUsNiArMTM1LDggQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdAog
ICAgIGNhc2UgTVNSX1RTWF9GT1JDRV9BQk9SVDoKICAgICBjYXNlIE1TUl9BTUQ2NF9MV1BfQ0ZH
OgogICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9DQkFERFI6CisgICAgY2FzZSBNU1JfUFBJTjoKKyAg
ICBjYXNlIE1TUl9BTURfUFBJTjoKICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAq
LwogICAgICAgICBnb3RvIGdwX2ZhdWx0OwogCkBAIC0yMzcsNiArMjM5LDE4IEBAIGludCBndWVz
dF9yZG1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQVJSQVlfU0laRShtc3JzLT5kcl9tYXNrKSldOwogICAgICAgICBicmVhazsK
IAorICAgIGNhc2UgTVNSX1BQSU5fQ1RMOgorICAgICAgICBpZiAoIGNwLT54ODZfdmVuZG9yICE9
IFg4Nl9WRU5ET1JfSU5URUwgKQorICAgICAgICAgICAgZ290byBncF9mYXVsdDsKKyAgICAgICAg
KnZhbCA9IFBQSU5fTE9DS09VVDsKKyAgICAgICAgYnJlYWs7CisKKyAgICBjYXNlIE1TUl9BTURf
UFBJTl9DVEw6CisgICAgICAgIGlmICggIWNwLT5leHRkLmFtZF9wcGluICkKKyAgICAgICAgICAg
IGdvdG8gZ3BfZmF1bHQ7CisgICAgICAgICp2YWwgPSBQUElOX0xPQ0tPVVQ7CisgICAgICAgIGJy
ZWFrOworCiAgICAgICAgIC8qCiAgICAgICAgICAqIFRPRE86IEltcGxlbWVudCB3aGVuIHdlIGhh
dmUgYmV0dGVyIHRvcG9sb2d5IHJlcHJlc2VudGF0aW9uLgogICAgIGNhc2UgTVNSX0lOVEVMX0NP
UkVfVEhSRUFEX0NPVU5UOgpAQCAtMjczLDEwICsyODcsMTQgQEAgaW50IGd1ZXN0X3dybXNyKHN0
cnVjdCB2Y3B1ICp2LCB1aW50MzJfdAogICAgIGNhc2UgTVNSX0lOVEVMX0NPUkVfVEhSRUFEX0NP
VU5UOgogICAgIGNhc2UgTVNSX0lOVEVMX1BMQVRGT1JNX0lORk86CiAgICAgY2FzZSBNU1JfQVJD
SF9DQVBBQklMSVRJRVM6CisgICAgY2FzZSBNU1JfUFBJTjoKKyAgICBjYXNlIE1TUl9BTURfUFBJ
TjoKICAgICAgICAgLyogUmVhZC1vbmx5ICovCiAgICAgY2FzZSBNU1JfVFNYX0ZPUkNFX0FCT1JU
OgogICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9DRkc6CiAgICAgY2FzZSBNU1JfQU1ENjRfTFdQX0NC
QUREUjoKKyAgICBjYXNlIE1TUl9QUElOX0NUTDoKKyAgICBjYXNlIE1TUl9BTURfUFBJTl9DVEw6
CiAgICAgICAgIC8qIE5vdCBvZmZlcmVkIHRvIGd1ZXN0cy4gKi8KICAgICAgICAgZ290byBncF9m
YXVsdDsKIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
