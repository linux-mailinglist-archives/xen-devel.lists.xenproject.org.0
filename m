Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E5175C93
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8lj1-0003CS-Cb; Mon, 02 Mar 2020 14:07:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8lj0-0003CJ-Kh
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:07:14 +0000
X-Inumbo-ID: 1db3fff2-5c8f-11ea-b122-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1db3fff2-5c8f-11ea-b122-bc764e2007e4;
 Mon, 02 Mar 2020 14:07:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6186CB2B2
 for <xen-devel@lists.xenproject.org>; Mon,  2 Mar 2020 14:07:13 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9687cc05-d3f5-c139-bbc4-a3eb05afdbea@suse.com>
Message-ID: <adaffda1-006b-4e84-62e0-a679adece844@suse.com>
Date: Mon, 2 Mar 2020 15:07:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9687cc05-d3f5-c139-bbc4-a3eb05afdbea@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] x86/mce: fix logic and comments around
 MSR_PPIN_CTL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPgoKVGhlcmUgYXJlIHR3byBpbXBs
ZW1lbnRlZCBiaXRzIGluIHRoZSBQUElOX0NUTCBNU1I6CgpCaXQwOiBMb2NrT3V0IChSL1dPKQog
ICAgICBTZXQgMSB0byBwcmV2ZW50IGZ1cnRoZXIgd3JpdGVzIHRvIE1TUl9QUElOX0NUTC4KCkJp
dCAxOiBFbmFibGVfUFBJTiAoUi9XKQogICAgICAgSWYgMSwgZW5hYmxlcyBNU1JfUFBJTiB0byBi
ZSBhY2Nlc3NpYmxlIHVzaW5nIFJETVNSLgogICAgICAgSWYgMCwgYW4gYXR0ZW1wdCB0byByZWFk
IE1TUl9QUElOIHdpbGwgY2F1c2UgI0dQLgoKU28gdGhlcmUgYXJlIGZvdXIgZGVmaW5lZCB2YWx1
ZXM6CgkwOiBQUElOIGlzIGRpc2FibGVkLCBQUElOX0NUTCBtYXkgYmUgdXBkYXRlZAoJMTogUFBJ
TiBpcyBkaXNhYmxlZC4gUFBJTl9DVEwgaXMgbG9ja2VkIGFnYWluc3QgdXBkYXRlcwoJMjogUFBJ
TiBpcyBlbmFibGVkLiBQUElOX0NUTCBtYXkgYmUgdXBkYXRlZAoJMzogUFBJTiBpcyBlbmFibGVk
LiBQUElOX0NUTCBpcyBsb2NrZWQgYWdhaW5zdCB1cGRhdGVzCgpDb2RlIHdvdWxkIG9ubHkgZW5h
YmxlIHRoZSBYODZfRkVBVFVSRV9JTlRFTF9QUElOIGZlYXR1cmUgZm9yIGNhc2UgIjIiLgpXaGVu
IGl0IHNob3VsZCBoYXZlIGRvbmUgc28gZm9yIGJvdGggY2FzZSAiMiIgYW5kIGNhc2UgIjMiLgoK
Rml4IHRoZSBmaW5hbCB0ZXN0IHRvIGp1c3QgY2hlY2sgZm9yIHRoZSBlbmFibGUgYml0LgpBbHNv
IGZpeCBzb21lIG9mIHRoZSBvdGhlciBjb21tZW50cyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVk
LW9mZi1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPgpbTGludXggY29tbWl0ID8/
P10KCk9uZSBvZiB0aGUgYWRqdXN0ZWQgY29tbWVudHMgZG9lc24ndCBleGlzdCBpbiBvdXIgY29k
ZSwgYW5kIEkgZGlzYWdyZWUKd2l0aCB0aGUgYWRqdXN0bWVudCB0byB0aGUgb3RoZXIgb25lIGFu
ZCBpdHMgYXNzb2NpYXRlIGNvZGUgY2hhbmdlOiBJCmRvbid0IHRoaW5rIHRoZXJlJ3MgYSBwb2lu
dCB0cnlpbmcgdG8gZW5hYmxlIFBQSU4gaWYgdGhlIGxvY2tlZCBiaXQgaXMKc2V0LiBIZW5jZSBp
dCdzIGp1c3QgdGhlIG1haW4gY29kZSBjaGFuZ2UgdGhhdCBnZXRzIHB1bGxlZCBpbiwgcGx1cyBp
dApnZXRzIGNsb25lZCB0byB0aGUgQU1EIHNpZGUuCgpSZXF1ZXN0ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCk5vdGU6IElmIGF2YWlsYWJsZSBieSB0aGUgdGltZSBv
ZiBjb21taXR0aW5nIEkgbWVhbiB0byBpbnNlcnQgdGhlIExpbnV4CiAgICAgIGNvbW1pdCBoYXNo
LgoKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlX2ludGVsLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2NwdS9tY2hlY2svbWNlX2ludGVsLmMKQEAgLTg4NSw3ICs4ODUsNyBAQCBzdGF0aWMg
dm9pZCBpbnRlbF9pbml0X3BwaW4oY29uc3Qgc3RydWN0CiAgICAgICAgICAgICByZG1zcl9zYWZl
KE1TUl9QUElOX0NUTCwgdmFsKTsKICAgICAgICAgfQogCi0gICAgICAgIGlmICggKHZhbCAmIChQ
UElOX0VOQUJMRSB8IFBQSU5fTE9DS09VVCkpICE9IFBQSU5fRU5BQkxFICkKKyAgICAgICAgaWYg
KCAhKHZhbCAmIFBQSU5fRU5BQkxFKSApCiAgICAgICAgICAgICBwcGluX21zciA9IDA7CiAgICAg
ICAgIGVsc2UgaWYgKCBjID09ICZib290X2NwdV9kYXRhICkKICAgICAgICAgICAgIHBwaW5fbXNy
ID0gTVNSX1BQSU47Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZV9hbWQuYworKysg
Yi94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2VfYW1kLmMKQEAgLTMyOSw3ICszMjksNyBAQCBh
bWRfbWNoZWNrX2luaXQoc3RydWN0IGNwdWluZm9feDg2ICpjaSkKICAgICAgICAgICAgIHJkbXNy
bChNU1JfQU1EX1BQSU5fQ1RMLCB2YWwpOwogICAgICAgICB9CiAKLSAgICAgICAgaWYgKCAodmFs
ICYgKFBQSU5fRU5BQkxFIHwgUFBJTl9MT0NLT1VUKSkgIT0gUFBJTl9FTkFCTEUgKQorICAgICAg
ICBpZiAoICEodmFsICYgUFBJTl9FTkFCTEUpICkKICAgICAgICAgICAgIHBwaW5fbXNyID0gMDsK
ICAgICAgICAgZWxzZSBpZiAoIGNpID09ICZib290X2NwdV9kYXRhICkKICAgICAgICAgICAgIHBw
aW5fbXNyID0gTVNSX0FNRF9QUElOOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
