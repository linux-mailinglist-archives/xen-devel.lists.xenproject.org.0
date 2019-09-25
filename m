Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2046BE137
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD98u-0005sc-Pu; Wed, 25 Sep 2019 15:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD98t-0005sH-2p
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:23:47 +0000
X-Inumbo-ID: 76e7ada9-dfa8-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 76e7ada9-dfa8-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:23:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B62BBACAA;
 Wed, 25 Sep 2019 15:23:45 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Message-ID: <74eb1e77-7445-92fa-25b1-ece1d6699eb9@suse.com>
Date: Wed, 25 Sep 2019 17:23:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 2/5] x86/mm: honor opt_pcid also for 32-bit
 PV domains
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

SSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdAozMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVn
YXJkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgotLS0KIHhl
bi9hcmNoL3g4Ni9wdi9kb21haW4uYyB8ICAgMjEgKysrKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tLSBhL3hlbi9h
cmNoL3g4Ni9wdi9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKQEAgLTE4
MCw3ICsxODAsMjQgQEAgaW50IHN3aXRjaF9jb21wYXQoc3RydWN0IGRvbWFpbiAqZCkKICAgICBk
LT5hcmNoLng4N19maXBfd2lkdGggPSA0OwogCiAgICAgZC0+YXJjaC5wdi54cHRpID0gZmFsc2U7
Ci0gICAgZC0+YXJjaC5wdi5wY2lkID0gZmFsc2U7CisKKyAgICBpZiAoIHVzZV9pbnZwY2lkICYm
IGNwdV9oYXNfcGNpZCApCisgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNFKG9wdF9wY2lkKSAp
CisgICAgICAgIHsKKyAgICAgICAgY2FzZSBQQ0lEX09GRjoKKyAgICAgICAgY2FzZSBQQ0lEX1hQ
VEk6CisgICAgICAgICAgICBkLT5hcmNoLnB2LnBjaWQgPSBmYWxzZTsKKyAgICAgICAgICAgIGJy
ZWFrOworCisgICAgICAgIGNhc2UgUENJRF9BTEw6CisgICAgICAgIGNhc2UgUENJRF9OT1hQVEk6
CisgICAgICAgICAgICBkLT5hcmNoLnB2LnBjaWQgPSB0cnVlOworICAgICAgICAgICAgYnJlYWs7
CisKKyAgICAgICAgZGVmYXVsdDoKKyAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwor
ICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KIAogICAgIHJldHVybiAwOwogCkBAIC0zMjQs
NyArMzQxLDcgQEAgaW50IHB2X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKgogICAg
ICAgICBvcHRfeHB0aV9kb211ID0gMjsKICAgICB9CiAKLSAgICBpZiAoICFpc19wdl8zMmJpdF9k
b21haW4oZCkgJiYgdXNlX2ludnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICBpZiAoIHVzZV9p
bnZwY2lkICYmIGNwdV9oYXNfcGNpZCApCiAgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNFKG9w
dF9wY2lkKSApCiAgICAgICAgIHsKICAgICAgICAgY2FzZSBQQ0lEX09GRjoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
