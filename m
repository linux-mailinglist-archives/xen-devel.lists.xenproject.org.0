Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4E18F414
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 13:09:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGLqw-0001GS-VS; Mon, 23 Mar 2020 12:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGLqv-0001GN-2L
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 12:06:45 +0000
X-Inumbo-ID: c2a4d521-6cfe-11ea-82c0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2a4d521-6cfe-11ea-82c0-12813bfff9fa;
 Mon, 23 Mar 2020 12:06:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BEB8AEF7;
 Mon, 23 Mar 2020 12:06:42 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75c077bc-ecf3-45fe-1a71-0804fe6aaaf4@suse.com>
Date: Mon, 23 Mar 2020 13:06:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] libx86/CPUID: fix (not just) leaf 7 processing
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

Rm9yIG9uZSwgc3VibGVhdmVzIHdpdGhpbiB0aGUgcmVzcGVjdGl2ZSB1bmlvbiBzaG91bGRuJ3Qg
bGl2ZSBpbgpzZXBhcmF0ZSBzdWItc3RydWN0dXJlcy4gQW5kIHRoZW4geDg2X2NwdWlkX3BvbGlj
eV9maWxsX25hdGl2ZSgpIHNob3VsZCwKYXMgaXQgZGlkIG9yaWdpbmFsbHksIGl0ZXJhdGUgb3Zl
ciBhbGwgc3VibGVhdmVzIGhlcmUgYXMgd2VsbCBhcyBvdmVyCmFsbCBtYWluIGxlYXZlcy4gU3dp
dGNoIHRvIHVzaW5nIGEgIjw9IE1JTigpIi1iYXNlZCBhcHByb2FjaCBzaW1pbGFyIHRvCnRoYXQg
dXNlZCBpbiB4ODZfY3B1aWRfY29weV90b19idWZmZXIoKS4gQWxzbyBmb2xsb3cgdGhpcyBmb3Ig
dGhlCmV4dGVuZGVkIG1haW4gbGVhdmVzIHRoZW4uCgpGaXhlczogMWJkMmI3NTA1MzdiICgibGli
eDg2OiBGaXggMzJiaXQgc3R1YmRvbSBidWlsZCBvZiB4ODZfY3B1aWRfcG9saWN5X2ZpbGxfbmF0
aXZlKCkiKQpGaXhlczogOTdlNGViZGNkNzY1ICgieDg2L0NQVUlEOiBzdXBwb3J0IGxlYWYgNyBz
dWJsZWFmIDEgLyBBVlg1MTJfQkYxNiIpClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaApAQCAtMTgxLDggKzE4MSw3IEBAIHN0
cnVjdCBjcHVpZF9wb2xpY3kKICAgICAgICAgICAgICAgICB1aW50MzJfdCBfN2QwOwogICAgICAg
ICAgICAgICAgIHN0cnVjdCB7IERFQ0xfQklURklFTEQoN2QwKTsgfTsKICAgICAgICAgICAgIH07
Ci0gICAgICAgIH07Ci0gICAgICAgIHN0cnVjdCB7CisKICAgICAgICAgICAgIC8qIFN1YmxlYWYg
MS4gKi8KICAgICAgICAgICAgIHVuaW9uIHsKICAgICAgICAgICAgICAgICB1aW50MzJfdCBfN2Ex
OwotLS0gYS94ZW4vbGliL3g4Ni9jcHVpZC5jCisrKyBiL3hlbi9saWIveDg2L2NwdWlkLmMKQEAg
LTcxLDggKzcxLDggQEAgdm9pZCB4ODZfY3B1aWRfcG9saWN5X2ZpbGxfbmF0aXZlKHN0cnVjdAog
ICAgIHVuc2lnbmVkIGludCBpOwogCiAgICAgY3B1aWRfbGVhZigwLCAmcC0+YmFzaWMucmF3WzBd
KTsKLSAgICBmb3IgKCBpID0gMTsgaSA8IG1pbl90KHVuc2lnbmVkIGludCwgQVJSQVlfU0laRShw
LT5iYXNpYy5yYXcpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgcC0+YmFzaWMubWF4X2xl
YWYpOyArK2kgKQorICAgIGZvciAoIGkgPSAxOyBpIDw9IE1JTihwLT5iYXNpYy5tYXhfbGVhZiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShwLT5iYXNpYy5yYXcpIC0gMSk7
ICsraSApCiAgICAgewogICAgICAgICBzd2l0Y2ggKCBpICkKICAgICAgICAgewpAQCAtMTE2LDgg
KzExNiw4IEBAIHZvaWQgeDg2X2NwdWlkX3BvbGljeV9maWxsX25hdGl2ZShzdHJ1Y3QKICAgICB7
CiAgICAgICAgIGNwdWlkX2NvdW50X2xlYWYoNywgMCwgJnAtPmZlYXQucmF3WzBdKTsKIAotICAg
ICAgICBmb3IgKCBpID0gMTsgaSA8IG1pbl90KHVuc2lnbmVkIGludCwgQVJSQVlfU0laRShwLT5m
ZWF0LnJhdyksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcC0+ZmVhdC5tYXhfc3Vi
bGVhZik7ICsraSApCisgICAgICAgIGZvciAoIGkgPSAxOyBpIDw9IE1JTihwLT5mZWF0Lm1heF9z
dWJsZWFmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShwLT5mZWF0
LnJhdykgLSAxKTsgKytpICkKICAgICAgICAgICAgIGNwdWlkX2NvdW50X2xlYWYoNywgaSwgJnAt
PmZlYXQucmF3W2ldKTsKICAgICB9CiAKQEAgLTE3Miw4ICsxNzIsOCBAQCB2b2lkIHg4Nl9jcHVp
ZF9wb2xpY3lfZmlsbF9uYXRpdmUoc3RydWN0CiAKICAgICAvKiBFeHRlbmRlZCBsZWF2ZXMuICov
CiAgICAgY3B1aWRfbGVhZigweDgwMDAwMDAwLCAmcC0+ZXh0ZC5yYXdbMF0pOwotICAgIGZvciAo
IGkgPSAxOyBpIDwgbWluX3QodW5zaWduZWQgaW50LCBBUlJBWV9TSVpFKHAtPmV4dGQucmF3KSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgIHAtPmV4dGQubWF4X2xlYWYgKyAxIC0gMHg4MDAw
MDAwMCk7ICsraSApCisgICAgZm9yICggaSA9IDE7IGkgPD0gTUlOKHAtPmV4dGQubWF4X2xlYWYg
JiAweGZmZmZVLAorICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHAtPmV4dGQu
cmF3KSAtIDEpOyArK2kgKQogICAgICAgICBjcHVpZF9sZWFmKDB4ODAwMDAwMDAgKyBpLCAmcC0+
ZXh0ZC5yYXdbaV0pOwogCiAgICAgeDg2X2NwdWlkX3BvbGljeV9yZWNhbGNfc3ludGgocCk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
