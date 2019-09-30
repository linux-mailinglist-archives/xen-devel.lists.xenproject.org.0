Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E740FC1CA4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:15:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqmx-0001zO-Ri; Mon, 30 Sep 2019 08:12:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEqmv-0001zJ-Q5
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:12:09 +0000
X-Inumbo-ID: fee54aa8-e359-11e9-96cb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id fee54aa8-e359-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 08:12:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65EB0AE55;
 Mon, 30 Sep 2019 08:12:07 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
 <1569506015-26938-8-git-send-email-chao.gao@intel.com>
 <8c00cb17-60bb-1580-320a-e94e52da74d2@suse.com>
 <20190930064323.GA10598@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdbfa079-e3df-b085-c75c-b916bb5add29@suse.com>
Date: Mon, 30 Sep 2019 10:12:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930064323.GA10598@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 7/7] microcode: reject late ucode
 loading if any core is parked
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAwODo0MywgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjcsIDIw
MTkgYXQgMDE6MTk6MTZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoYXQgSSBjb250
aW51ZSB0byBiZSB1bmNvbnZpbmNlZCBvZiBpcyBmb3IgdGhlIGNob3NlbiBhcHByb2FjaAo+PiB0
byBiZSBiZXR0ZXIgdGhhbiBicmllZmx5IHVucGFya2luZyBhIHRocmVhZCBvbiBlYWNoIGNvcmUs
IGFzCj4+IHByZXZpb3VzbHkgc3VnZ2VzdGVkLgo+IAo+IEl0IGlzbid0IHNvIGVhc3kgdG8gZ28g
dGhlIHNhbWUgd2F5IGFzIHNldF9jeF9wbWluZm8oKS4KPiAKPiAxLiBOTUkgaGFuZGxlciBvbiBw
YXJrZWQgdGhyZWFkcyBpcyBjaGFuZ2VkIHRvIGEgbm9wLiBUbyBsb2FkIHVjb2RlIGluCj4gTk1J
IGhhbmRsZXIsIHdlIGhhdmUgdG8gc3dpdGNoIGJhY2sgdG8gbm9ybWFsIE5NSSBoYW5kbGVyIGlu
Cj4gZGVmYXVsdF9pZGxlKCkuIEJ1dCBpdCBjb25mbGljdHMgd2l0aCB3aGF0IHRoZSBjb21tZW50
cyBpbiBwbGF5X2RlYWQoKQo+IGltcGxpZXM6IGl0IGlzIG5vdCBzYWZlIHRvIGNhbGwgbm9ybWFs
IE5NSSBoYW5kbGVyIGFmdGVyCj4gY3B1X2V4aXRfY2xlYXIoKS4KClJpZ2h0IC0gcG9pbnRpbmcg
YXQgdGhlIEN4IGhhbmRsaW5nIGZvciByZWZlcmVuY2Ugd2FzIHBlcmhhcHMgbm90CnRoZSBiZXN0
IGNob2ljZS4gSGVyZSB3ZSdkIG5lZWQgdG8gdHJ1bHkgb25saW5lIGEgY29yZSwgcmVtZW1iZXJp
bmcKdG8gb2ZmbGluZSBpdCBhZ2FpbiByaWdodCBhZnRlciB0aGUgdWNvZGUgdXBkYXRlLgoKPiAy
LiBBIHByZWNvbmRpdGlvbiBvZiB1bnBhcmtpbmcgYSB0aHJlYWQgb24gZWFjaCBjb3JlLCB3ZSBu
ZWVkIHRvIGZpbmQKPiBvdXQgZXhhY3RseSBhbGwgcGFya2VkIGNvcmVzIGFuZCB3YWtlIHVwIG9u
ZSB0aHJlYWQgb2YgZWFjaCBvZiB0aGVtLgo+IFRoZW4gaW4gdGhlb3J5LCB3aGF0IHRoaXMgcGF0
Y2ggZG9lcyBpcyBvbmx5IHBhcnQgb2YgdW5wYXJraW5nIGEgdGhyZWFkCj4gb24gZWFjaCBjb3Jl
LgoKUG9zc2libHksIGJ1dCB5b3UndmUgc3VnZ2VzdGVkIGEgcG9zc2libHkgYmV0dGVyIGFsdGVy
bmF0aXZlIGZ1cnRoZXIKZG93bi4KCj4+IG1heSBub3QgYmUgYW4gYWN0dWFsIHByb2JsZW0uIEJ1
dCBpdCB3YW50cyBtZW50aW9uaW5nIGluIGEgY29kZQo+PiBjb21tZW50LCBJIHRoaW5rLiBQbHVz
IGF0IHRoZSB2ZXJ5IGxlYXN0IHlvdSBkZXBlbmQgb24gdGhlIHVzZWQKPj4gY3B1X2RhdGFbXSBm
aWVsZHMgdG8gbm90IGNvbnRhaW4gdW5kdWx5IGxhcmdlIHZhbHVlcyAoYW5kIGhlbmNlCj4+IHlv
dSBlLmcuIGRlcGVuZCBvbiBjcHVfZGF0YVtdIG5vdCBnYWluaW5nIGFuIGluaXRpYWxpemVyLAo+
PiBzZXR0aW5nIHRoZSB0aHJlZSBmaWVsZHMgb2YgaW50ZXJlc3QgdG8gdGhlaXIgSU5WQUxJRF8q
IHZhbHVlcywKPj4gYXMgY3VycmVudGx5IGRvbmUgYnkgaWRlbnRpZnlfY3B1KCkpLgo+IAo+IENh
biB3ZSBza2lwIHRob3NlIHRocmVhZHMgd2hvc2Ugc29ja2V0IElEIGlzIGludmFsaWQgYW5kIGlu
aXRpYWxpemUKPiB0aGUgdGhyZWUgZmllbGRzIGluIGNwdV9hZGQoKT8KCldoYXQgd291bGQgeW91
IGluaXRpYWxpemUgdGhlbSB0byBpbiBjcHVfYWRkKCk/IFlvdSBkb24ndCBrbm93CnRoZWlyIHZh
bHVlcyB5ZXQsIGRvIHlvdT8KCj4gT3IgbWFpbnRhaW4gYSBiaXRtYXAgZm9yIHBhcmtlZCB0aHJl
YWRzIHRvIGhlbHAgZGlzdGluZ3Vpc2ggdGhlbSBmcm9tCj4gcmVhbCBvZmZsaW5lZCB0aHJlYWRz
LCBhbmQgZ28gdGhyb3VnaCBwYXJrZWQgdGhyZWFkcyBoZXJlPwoKSSB0aGluayB0aGlzIGlzIHRo
ZSBiZXR0ZXIgYXBwcm9hY2ggaW4gdGhlIGxvbmcgcnVuLiBJJ3ZlIGJlZW4gYXQKbGVhc3QgY29u
c2lkZXJpbmcgYWRkaXRpb24gb2Ygc3VjaCBhIGJpdG1hcCBmb3Igb3RoZXIgcmVhc29ucyBhcyB3
ZWxsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
