Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C584ECF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:34:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMyM-0000yT-Bm; Wed, 07 Aug 2019 14:31:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvMyK-0000y5-Tj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:31:24 +0000
X-Inumbo-ID: 078bee50-b920-11e9-b7f8-5ba9b72e5674
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 078bee50-b920-11e9-b7f8-5ba9b72e5674;
 Wed, 07 Aug 2019 14:31:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84D6EB034;
 Wed,  7 Aug 2019 14:31:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 16:31:17 +0200
Message-Id: <20190807143119.8360-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190807143119.8360-1-jgross@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG option
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBlbmFibGluZyBzcGlubG9jayBkZWJ1Z2dpbmcgZm9yIGRlYnVnIGJ1aWxkcyBv
bmx5IGFkZCBhCmRlZGljYXRlZCBLY29uZmlnIG9wdGlvbiBmb3IgdGhhdCBwdXJwb3NlIHdoaWNo
IGRlZmF1bHRzIHRvIERFQlVHLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgotLS0KIHhlbi9LY29uZmlnLmRlYnVnICAgICAgICAgIHwgNyArKysrKysrCiB4
ZW4vY29tbW9uL3NwaW5sb2NrLmMgICAgICB8IDQgKystLQogeGVuL2luY2x1ZGUveGVuL3NwaW5s
b2NrLmggfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4vS2NvbmZpZy5kZWJ1
ZwppbmRleCBlMTBlMzE0ZTI1Li41ZGIzZTdlYzI1IDEwMDY0NAotLS0gYS94ZW4vS2NvbmZpZy5k
ZWJ1ZworKysgYi94ZW4vS2NvbmZpZy5kZWJ1ZwpAQCAtNDQsNiArNDQsMTMgQEAgY29uZmlnIENP
VkVSQUdFCiAKIAkgIElmIHVuc3VyZSwgc2F5IE4gaGVyZS4KIAorY29uZmlnIFNQSU5MT0NLX0RF
QlVHCisJYm9vbCAiU3BpbmxvY2sgZGVidWdnaW5nIgorCWRlZmF1bHQgREVCVUcKKwktLS1oZWxw
LS0tCisJICBFbmFibGUgZGVidWdnaW5nIGZlYXR1cmVzIG9mIHNwaW5sb2NrIGhhbmRsaW5nLiAg
U29tZSBhZGRpdGlvbmFsCisgICAgICAgICAgY2hlY2tzIHdpbGwgYmUgcGVyZm9ybWVkIHdoZW4g
YWNxdWlyaW5nIGFuZCByZWxlYXNpbmcgbG9ja3MuCisKIGNvbmZpZyBMT0NLX1BST0ZJTEUKIAli
b29sICJMb2NrIFByb2ZpbGluZyIKIAktLS1oZWxwLS0tCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggNGU2ODFjYzY1MS4uMTYz
NTZlYzliNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21t
b24vc3BpbmxvY2suYwpAQCAtOSw3ICs5LDcgQEAKICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+
CiAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgogCi0jaWZuZGVmIE5ERUJVRworI2lmZGVmIENPTkZJ
R19TUElOTE9DS19ERUJVRwogCiBzdGF0aWMgYXRvbWljX3Qgc3Bpbl9kZWJ1ZyBfX3JlYWRfbW9z
dGx5ID0gQVRPTUlDX0lOSVQoMCk7CiAKQEAgLTk3LDcgKzk3LDcgQEAgdm9pZCBzcGluX2RlYnVn
X2Rpc2FibGUodm9pZCkKICAgICBhdG9taWNfZGVjKCZzcGluX2RlYnVnKTsKIH0KIAotI2Vsc2Ug
LyogZGVmaW5lZChOREVCVUcpICovCisjZWxzZSAvKiBDT05GSUdfU1BJTkxPQ0tfREVCVUcgKi8K
IAogI2RlZmluZSBjaGVja19sb2NrKGwpICgodm9pZCkwKQogI2RlZmluZSBjaGVja19iYXJyaWVy
KGwpICgodm9pZCkwKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggYi94
ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRleCBiNDg4MWFkNDMzLi5lMzQ1OGYxMGRkIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vc3BpbmxvY2suaApAQCAtNiw3ICs2LDcgQEAKICNpbmNsdWRlIDxhc20vdHlwZXMuaD4KICNp
bmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKLSNpZm5kZWYgTkRFQlVHCisjaWZkZWYgQ09ORklHX1NQ
SU5MT0NLX0RFQlVHCiB1bmlvbiBsb2NrX2RlYnVnIHsKICAgICB1bnNpZ25lZCBzaG9ydCB2YWw7
CiAgICAgc3RydWN0IHsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
