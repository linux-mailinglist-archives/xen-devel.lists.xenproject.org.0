Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B47110131
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 16:26:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icA1L-0004fM-Ln; Tue, 03 Dec 2019 15:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icA1K-0004fH-F7
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 15:23:22 +0000
X-Inumbo-ID: d70cd938-15e0-11ea-81e1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d70cd938-15e0-11ea-81e1-12813bfff9fa;
 Tue, 03 Dec 2019 15:23:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEB79B9E9;
 Tue,  3 Dec 2019 15:23:20 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fad66ca6-255c-cdb1-df8b-d58e288e8483@suse.com>
Date: Tue, 3 Dec 2019 16:23:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129112851.19273-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] x86/smp: check APIC ID on AP bringup
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zbXBib290LmMKPiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gQEAgLTEz
MTcsNiArMTMxNywxMyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50IGNwdSkKPiAgICAgIGlm
ICggKGFwaWNpZCA9IHg4Nl9jcHVfdG9fYXBpY2lkW2NwdV0pID09IEJBRF9BUElDSUQgKQo+ICAg
ICAgICAgIHJldHVybiAtRU5PREVWOwo+ICAKPiArICAgIGlmICggKCF4MmFwaWNfZW5hYmxlZCB8
fCAhaW9tbXVfaW50cmVtYXApICYmIChhcGljaWQgPj4gOCkgKQo+ICsgICAgewo+ICsgICAgICAg
IHByaW50aygiUHJvY2Vzc29yIHdpdGggQVBJQyBJRCAldSBjYW5ub3QgYmUgb25saW5lZCBpbiB4
QVBJQyBtb2RlICIKPiArICAgICAgICAgICAgICAgIm9yIHdpdGhvdXQgaW50ZXJydXB0IHJlbWFw
cGluZ1xuIiwgYXBpY2lkKTsKClBsZWFzZSBsb2cgdGhlIEFQSUMgSUQgaW4gaGV4LCB0byBtYXRj
aCBob3cgaXQgZ2V0cyBsb2dnZWQgZS5nLgpieSB0aGUgQUNQSSB0YWJsZSBwYXJzaW5nIGNvZGUu
IEknZCBhbHNvIHByZWZlciBpZiB0aGUgbWVzc2FnZQpjb3VsZCBiZSBzaG9ydGVuZWQgYSBsaXR0
bGU6IEkgZG9uJ3QgdGhpbmsgdGhlICJvciIgaXMgbmVlZGVkLAoiUHJvY2Vzc29yIiBjb3VsZCBi
ZWNvbWUgIkNQVSIsIGFuZCBzbGlnaHQgcmUtd29yZGluZyBjb3VsZApzYXZlIGV2ZW4gYSBsaXR0
bGUgbW9yZTogIkNhbm5vdCBvbmxpbmUgQ1BVIHdpdGggQVBJQyBJRCAlI3ggaW4KeEFQSUMgbW9k
ZSB3L28gaW50ZXJydXB0IHJlbWFwcGluZyIuCgpUaGVuIGFnYWluIHRoaXMgaXNuJ3QgZnVsbHkg
Y29ycmVjdDogV2UgY291bGQgYnJpbmcgc3VjaCBhCkNQVSBvbmxpbmUgaW4geDJBUElDIG1vZGUg
YnV0IHdpdGhvdXQgaW50ZXJydXB0IHJlbWFwcGluZy4KVGhlcmUgd291bGQgYmUgYSByZXN0cmlj
dGlvbiBvbiB3aGljaCBDUFVzIHBoeXNpY2FsIGludGVycnVwdHMKY291bGQgYmUgZGVsaXZlcmVk
IHRvLiBTbyBwZXJoYXBzICJVbnN1cHBvcnRlZDogQVBJQyBJRCAlI3ggaW4KeEFQSUMgbW9kZSB3
L28gaW50ZXJydXB0IHJlbWFwcGluZyIgb3Igc29tZSBzdWNoPwoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
