Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168A8426C7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2mf-0008K5-9R; Wed, 12 Jun 2019 12:55:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7kto=UL=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hb2md-0008Jo-FP
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:55:19 +0000
X-Inumbo-ID: 51d77a8c-8d11-11e9-b073-37f1934053dc
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51d77a8c-8d11-11e9-b073-37f1934053dc;
 Wed, 12 Jun 2019 12:55:16 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id x5CCshb6055005;
 Wed, 12 Jun 2019 20:54:43 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id x5CCsCUk066856;
 Wed, 12 Jun 2019 20:54:13 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from pw-vbox.hygon.cn (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 12 Jun
 2019 20:54:38 +0800
From: Pu Wen <puwen@hygon.cn>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Jun 2019 20:54:25 +0800
Message-ID: <86038466e1e7a77449230f97e19e9c3f436fd029.1560342915.git.puwen@hygon.cn>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x5CCshb6055005
X-DNSRBL: 
Subject: [Xen-devel] [PATCH v6] x86/pv: Add Hygon Dhyana support to emulate
 MSRs access
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
Cc: Pu Wen <puwen@hygon.cn>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEh5Z29uIERoeWFuYSBDUFUgc3VwcG9ydHMgbG90cyBvZiBNU1JzKHN1Y2ggYXMgcGVyZiBl
dmVudCBzZWxlY3QgYW5kCmNvdW50ZXIgTVNScywgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBNU1Is
IE1NSU8gY29uZmlndXJhdGlvbiBiYXNlIGFkZHJlc3MKTVNSLCBNUEVSRi9BUEVSRiBNU1JzKSBh
cyBBTUQgQ1BVIGRvZXMsIHNvIGFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydCB0byB0aGUKUFYgZW11
bGF0aW9uIGluZnJhc3RydWN0dXJlIGJ5IHVzaW5nIHRoZSBjb2RlIHBhdGggb2YgQU1ELgoKW1Jl
YmFzZSBvdmVyIDBjZDA3NDE0ICJ4ODYvY3B1OiBSZW51bWJlciBYODZfVkVORE9SXyogdG8gZm9y
bSBhIGJpdG1hcCJdCgpTaWduZWQtb2ZmLWJ5OiBQdSBXZW4gPHB1d2VuQGh5Z29uLmNuPgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9w
di9lbXVsLXByaXYtb3AuYyB8IDEyICsrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYv
ZW11bC1wcml2LW9wLmMgYi94ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKaW5kZXggYjIw
ZDc5Yy4uMmQ1YzgyZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwpAQCAtOTEzLDcgKzkxMyw4IEBA
IHN0YXRpYyBpbnQgcmVhZF9tc3IodW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgKnZhbCwKICAg
ICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwogICAgIGNhc2UgTVNSX0FNRF9GQU0xNUhfRVZO
VFNFTDAgLi4uIE1TUl9BTURfRkFNMTVIX1BFUkZDVFI1OgogICAgIGNhc2UgTVNSX0s3X0VWTlRT
RUwwIC4uLiBNU1JfSzdfUEVSRkNUUjM6Ci0gICAgICAgICAgICBpZiAoIHZwbXVfbXNyIHx8IChi
b290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQpICkKKyAgICAgICAgICAg
IGlmICggdnBtdV9tc3IgfHwgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSkg
KQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIGlmICggdnBtdV9kb19yZG1zcihyZWcs
IHZhbCkgKQogICAgICAgICAgICAgICAgICAgICBicmVhazsKQEAgLTk5NSw3ICs5OTYsOCBAQCBz
dGF0aWMgaW50IHdyaXRlX21zcih1bnNpZ25lZCBpbnQgcmVnLCB1aW50NjRfdCB2YWwsCiAgICAg
Y2FzZSBNU1JfSzhfUFNUQVRFNjoKICAgICBjYXNlIE1TUl9LOF9QU1RBVEU3OgogICAgIGNhc2Ug
TVNSX0s4X0hXQ1I6Ci0gICAgICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICE9IFg4
Nl9WRU5ET1JfQU1EICkKKyAgICAgICAgaWYgKCAhKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAm
CisgICAgICAgICAgICAgICAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSkgKQog
ICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGlmICggbGlrZWx5KCFpc19jcHVmcmVxX2NvbnRy
b2xsZXIoY3VycmQpKSB8fAogICAgICAgICAgICAgIHdybXNyX3NhZmUocmVnLCB2YWwpID09IDAg
KQpAQCAtMTA0NCw3ICsxMDQ2LDggQEAgc3RhdGljIGludCB3cml0ZV9tc3IodW5zaWduZWQgaW50
IHJlZywgdWludDY0X3QgdmFsLAogCiAgICAgY2FzZSBNU1JfSUEzMl9NUEVSRjoKICAgICBjYXNl
IE1TUl9JQTMyX0FQRVJGOgotICAgICAgICBpZiAoICEoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICYgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0FNRCkpICkKKyAgICAgICAgaWYgKCAh
KGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmCisgICAgICAgICAgICAgICAoWDg2X1ZFTkRPUl9J
TlRFTCB8IFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRPUl9IWUdPTikpICkKICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICBpZiAoIGxpa2VseSghaXNfY3B1ZnJlcV9jb250cm9sbGVyKGN1cnJk
KSkgfHwKICAgICAgICAgICAgICB3cm1zcl9zYWZlKHJlZywgdmFsKSA9PSAwICkKQEAgLTEwNzYs
NyArMTA3OSw4IEBAIHN0YXRpYyBpbnQgd3JpdGVfbXNyKHVuc2lnbmVkIGludCByZWcsIHVpbnQ2
NF90IHZhbCwKICAgICAgICAgICAgIHZwbXVfbXNyID0gdHJ1ZTsKICAgICBjYXNlIE1TUl9BTURf
RkFNMTVIX0VWTlRTRUwwIC4uLiBNU1JfQU1EX0ZBTTE1SF9QRVJGQ1RSNToKICAgICBjYXNlIE1T
Ul9LN19FVk5UU0VMMCAuLi4gTVNSX0s3X1BFUkZDVFIzOgotICAgICAgICAgICAgaWYgKCB2cG11
X21zciB8fCAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EKSApCisg
ICAgICAgICAgICBpZiAoIHZwbXVfbXNyIHx8IChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRP
Ul9IWUdPTikpICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBpZiAoICh2cG11X21v
ZGUgJiBYRU5QTVVfTU9ERV9BTEwpICYmCiAgICAgICAgICAgICAgICAgICAgICAhaXNfaGFyZHdh
cmVfZG9tYWluKGN1cnJkKSApCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
