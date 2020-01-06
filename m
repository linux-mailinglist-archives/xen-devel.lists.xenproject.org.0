Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940721314F2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:36:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUP6-0001aE-IH; Mon, 06 Jan 2020 15:34:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioUP4-0001a0-NQ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:34:50 +0000
X-Inumbo-ID: 0e9a40ba-309a-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e9a40ba-309a-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 15:34:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60AE7ADBB;
 Mon,  6 Jan 2020 15:34:41 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Message-ID: <01b3307a-a9cf-fb7b-a011-ded5753d74f3@suse.com>
Date: Mon, 6 Jan 2020 16:35:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 3/3] x86/mm: re-order a few conditionals
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

aXNfe2h2bSxwdn1fKigpIGNhbiBiZSBleHBlbnNpdmUgbm93LCBzbyB3aGVyZSBwb3NzaWJsZSBl
dmFsdWF0ZSBjaGVhcGVyCmNvbmRpdGlvbnMgZmlyc3QuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3LgotLS0KSSBjb3VsZG4ndCByZWFs
bHkgZGVjaWRlIHdoZXRoZXIgdG8gZHJvcCB0aGUgdHdvIGludm9sdmVkIHVubGlrZWx5KCkuCgot
LS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMTU4OCw3
ICsxNTg4LDcgQEAgc3RhdGljIGludCBwcm9tb3RlX2wzX3RhYmxlKHN0cnVjdCBwYWdlXwogCiAg
ICAgICAgIGlmICggaSA+IHBhZ2UtPm5yX3ZhbGlkYXRlZF9wdGVzICYmIGh5cGVyY2FsbF9wcmVl
bXB0X2NoZWNrKCkgKQogICAgICAgICAgICAgcmMgPSAtRUlOVFI7Ci0gICAgICAgIGVsc2UgaWYg
KCBpc19wdl8zMmJpdF9kb21haW4oZCkgJiYgKGkgPT0gMykgKQorICAgICAgICBlbHNlIGlmICgg
aSA9PSAzICYmIGlzX3B2XzMyYml0X2RvbWFpbihkKSApCiAgICAgICAgIHsKICAgICAgICAgICAg
IGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZSkgJiBfUEFHRV9QUkVTRU5UKSB8fAogICAgICAgICAg
ICAgICAgICAobDNlX2dldF9mbGFncyhsM2UpICYgbDNfZGlzYWxsb3dfbWFzayhkKSkgKQpAQCAt
MjMxMCw3ICsyMzEwLDcgQEAgc3RhdGljIGludCBtb2RfbDNfZW50cnkobDNfcGdlbnRyeV90ICpw
bAogICAgICAqIERpc2FsbG93IHVwZGF0ZXMgdG8gZmluYWwgTDMgc2xvdC4gSXQgY29udGFpbnMg
WGVuIG1hcHBpbmdzLCBhbmQgaXQKICAgICAgKiB3b3VsZCBiZSBhIHBhaW4gdG8gZW5zdXJlIHRo
ZXkgcmVtYWluIGNvbnRpbnVvdXNseSB2YWxpZCB0aHJvdWdob3V0LgogICAgICAqLwotICAgIGlm
ICggaXNfcHZfMzJiaXRfZG9tYWluKGQpICYmIChwZ2VudHJ5X3B0cl90b19zbG90KHBsM2UpID49
IDMpICkKKyAgICBpZiAoIHBnZW50cnlfcHRyX3RvX3Nsb3QocGwzZSkgPj0gMyAmJiBpc19wdl8z
MmJpdF9kb21haW4oZCkgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIG9sM2UgPSBs
M2VfYWNjZXNzX29uY2UoKnBsM2UpOwpAQCAtMjQ3MCw3ICsyNDcwLDcgQEAgc3RhdGljIGludCBj
bGVhbnVwX3BhZ2VfbWFwcGluZ3Moc3RydWN0CiAgICAgewogICAgICAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gcGFnZV9nZXRfb3duZXIocGFnZSk7CiAKLSAgICAgICAgaWYgKCBkICYmIGlzX3B2X2Rv
bWFpbihkKSAmJiB1bmxpa2VseShuZWVkX2lvbW11X3B0X3N5bmMoZCkpICkKKyAgICAgICAgaWYg
KCBkICYmIHVubGlrZWx5KG5lZWRfaW9tbXVfcHRfc3luYyhkKSkgJiYgaXNfcHZfZG9tYWluKGQp
ICkKICAgICAgICAgewogICAgICAgICAgICAgaW50IHJjMiA9IGlvbW11X2xlZ2FjeV91bm1hcChk
LCBfZGZuKG1mbiksIFBBR0VfT1JERVJfNEspOwogCkBAIC0yOTg0LDcgKzI5ODQsNyBAQCBzdGF0
aWMgaW50IF9nZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2luCiAgICAgICAgIC8qIFNwZWNpYWwg
cGFnZXMgc2hvdWxkIG5vdCBiZSBhY2Nlc3NpYmxlIGZyb20gZGV2aWNlcy4gKi8KICAgICAgICAg
c3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwogCi0gICAgICAgIGlmICgg
ZCAmJiBpc19wdl9kb21haW4oZCkgJiYgdW5saWtlbHkobmVlZF9pb21tdV9wdF9zeW5jKGQpKSAp
CisgICAgICAgIGlmICggZCAmJiB1bmxpa2VseShuZWVkX2lvbW11X3B0X3N5bmMoZCkpICYmIGlz
X3B2X2RvbWFpbihkKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIG1mbl90IG1mbiA9IHBhZ2Vf
dG9fbWZuKHBhZ2UpOwogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
