Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BAA9D22
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5nE3-0000aF-Sr; Thu, 05 Sep 2019 08:34:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5nE2-0000a9-9O
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:34:42 +0000
X-Inumbo-ID: 00a23f1e-cfb8-11e9-abc1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a23f1e-cfb8-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 08:34:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFC32AC93;
 Thu,  5 Sep 2019 08:34:39 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9deab964-2685-3c04-9e4c-e3df04885742@suse.com>
Date: Thu, 5 Sep 2019 10:34:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/shadow: fold p2m page accounting into
 sh_min_allocation()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0byBtYWtlIHRoZSBmdW5jdGlvbiBsaXZlIHVwIHRvIHRoZSBwcm9taXNlIGl0cyBu
YW1lIG1ha2VzLiBBbmQKaXQgc2ltcGxpZmllcyBhbGwgY2FsbGVycy4KClN1Z2dlc3RlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L21tL3No
YWRvdy9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCkBAIC0x
MjU2LDI5ICsxMjU2LDI2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2hfbWluX2FsbG9jYXRpb24o
Y28KICAgICAgKiB1cCBvZiBzbG90IHplcm8gYW5kIGFuIExBUElDIHBhZ2UpLCBwbHVzIG9uZSBm
b3IgSFZNJ3MgMS10by0xIHBhZ2V0YWJsZS4KICAgICAgKi8KICAgICByZXR1cm4gc2hhZG93X21p
bl9hY2NlcHRhYmxlX3BhZ2VzKGQpICsKLSAgICAgICAgICAgbWF4KGQtPnRvdF9wYWdlcyAvIDI1
NiwKLSAgICAgICAgICAgICAgIGlzX2h2bV9kb21haW4oZCkgPyBDT05GSUdfUEFHSU5HX0xFVkVM
UyArIDIgOiAwVSkgKwotICAgICAgICAgICBpc19odm1fZG9tYWluKGQpOworICAgICAgICAgICBt
YXgobWF4KGQtPnRvdF9wYWdlcyAvIDI1NiwKKyAgICAgICAgICAgICAgICAgICBpc19odm1fZG9t
YWluKGQpID8gQ09ORklHX1BBR0lOR19MRVZFTFMgKyAyIDogMFUpICsKKyAgICAgICAgICAgICAg
IGlzX2h2bV9kb21haW4oZCksCisgICAgICAgICAgICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cu
cDJtX3BhZ2VzKTsKIH0KIAogaW50IHNoYWRvd19zZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBpbnQgcGFnZXMsIGJvb2wgKnByZWVtcHRlZCkKIHsKICAgICBzdHJ1Y3Qg
cGFnZV9pbmZvICpzcDsKLSAgICB1bnNpZ25lZCBpbnQgbG93ZXJfYm91bmQ7CiAKICAgICBBU1NF
UlQocGFnaW5nX2xvY2tlZF9ieV9tZShkKSk7CiAKICAgICBpZiAoIHBhZ2VzID4gMCApCiAgICAg
ewogICAgICAgICAvKiBDaGVjayBmb3IgbWluaW11bSB2YWx1ZS4gKi8KLSAgICAgICAgaWYgKCBw
YWdlcyA8IGQtPmFyY2gucGFnaW5nLnNoYWRvdy5wMm1fcGFnZXMgKQotICAgICAgICAgICAgcGFn
ZXMgPSAwOwotICAgICAgICBlbHNlCi0gICAgICAgICAgICBwYWdlcyAtPSBkLT5hcmNoLnBhZ2lu
Zy5zaGFkb3cucDJtX3BhZ2VzOworICAgICAgICB1bnNpZ25lZCBpbnQgbG93ZXJfYm91bmQgPSBz
aF9taW5fYWxsb2NhdGlvbihkKTsKIAotICAgICAgICBsb3dlcl9ib3VuZCA9IHNoX21pbl9hbGxv
Y2F0aW9uKGQpOwogICAgICAgICBpZiAoIHBhZ2VzIDwgbG93ZXJfYm91bmQgKQogICAgICAgICAg
ICAgcGFnZXMgPSBsb3dlcl9ib3VuZDsKKyAgICAgICAgcGFnZXMgLT0gZC0+YXJjaC5wYWdpbmcu
c2hhZG93LnAybV9wYWdlczsKICAgICB9CiAKICAgICBTSEFET1dfUFJJTlRLKCJjdXJyZW50ICVp
IHRhcmdldCAlaVxuIiwKQEAgLTI2MDcsNyArMjYwNCw3IEBAIGludCBzaGFkb3dfZW5hYmxlKHN0
cnVjdCBkb21haW4gKmQsIHUzMgogCiAgICAgLyogSW5pdCB0aGUgc2hhZG93IG1lbW9yeSBhbGxv
Y2F0aW9uIGlmIHRoZSB1c2VyIGhhc24ndCBkb25lIHNvICovCiAgICAgb2xkX3BhZ2VzID0gZC0+
YXJjaC5wYWdpbmcuc2hhZG93LnRvdGFsX3BhZ2VzOwotICAgIGlmICggb2xkX3BhZ2VzIDwgc2hf
bWluX2FsbG9jYXRpb24oZCkgKyBkLT5hcmNoLnBhZ2luZy5zaGFkb3cucDJtX3BhZ2VzICkKKyAg
ICBpZiAoIG9sZF9wYWdlcyA8IHNoX21pbl9hbGxvY2F0aW9uKGQpICkKICAgICB7CiAgICAgICAg
IHBhZ2luZ19sb2NrKGQpOwogICAgICAgICBydiA9IHNoYWRvd19zZXRfYWxsb2NhdGlvbihkLCAx
MDI0LCBOVUxMKTsgLyogVXNlIGF0IGxlYXN0IDRNQiAqLwpAQCAtMjg2NCw4ICsyODYxLDcgQEAg
c3RhdGljIGludCBzaGFkb3dfb25lX2JpdF9lbmFibGUoc3RydWN0CiAKICAgICBtb2RlIHw9IFBH
X1NIX2VuYWJsZTsKIAotICAgIGlmICggZC0+YXJjaC5wYWdpbmcuc2hhZG93LnRvdGFsX3BhZ2Vz
IDwKLSAgICAgICAgIHNoX21pbl9hbGxvY2F0aW9uKGQpICsgZC0+YXJjaC5wYWdpbmcuc2hhZG93
LnAybV9wYWdlcyApCisgICAgaWYgKCBkLT5hcmNoLnBhZ2luZy5zaGFkb3cudG90YWxfcGFnZXMg
PCBzaF9taW5fYWxsb2NhdGlvbihkKSApCiAgICAgewogICAgICAgICAvKiBJbml0IHRoZSBzaGFk
b3cgbWVtb3J5IGFsbG9jYXRpb24gaWYgdGhlIHVzZXIgaGFzbid0IGRvbmUgc28gKi8KICAgICAg
ICAgaWYgKCBzaGFkb3dfc2V0X2FsbG9jYXRpb24oZCwgMSwgTlVMTCkgIT0gMCApCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
