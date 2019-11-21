Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497510506D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:24:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjaN-0004e3-RD; Thu, 21 Nov 2019 10:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXjaM-0004ds-BT
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:21:14 +0000
X-Inumbo-ID: a4677ac0-0c48-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4677ac0-0c48-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 10:21:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7DFCB26C;
 Thu, 21 Nov 2019 10:21:11 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <1574291155-26032-2-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
Date: Thu, 21 Nov 2019 11:21:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574291155-26032-2-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/2] microcode: reject late ucode loading
 if any core is parked
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAwMDowNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gSWYgYSBjb3JlIHdpdGggYWxs
IG9mIGl0cyB0aHJlYWQgYmVpbmcgcGFya2VkLCBsYXRlIHVjb2RlIGxvYWRpbmcKPiB3aGljaCBj
dXJyZW50bHkgb25seSBsb2FkcyB1Y29kZSBvbiBvbmxpbmUgdGhyZWFkcyB3b3VsZCBsZWFkIHRv
Cj4gZGlmZmVyaW5nIHVjb2RlIHJldmlzaW9ucyBpbiB0aGUgc3lzdGVtLiBJbiBnZW5lcmFsLCBr
ZWVwaW5nIHVjb2RlCj4gcmV2aXNpb24gY29uc2lzdGVudCB3b3VsZCBiZSBsZXNzIGVycm9yLXBy
b25lLiBUbyB0aGlzIGVuZCwgaWYgdGhlcmUKPiBpcyBhIHBhcmtlZCB0aHJlYWQgZG9lc24ndCBo
YXZlIGFuIG9ubGluZSBzaWJsaW5nIHRocmVhZCwgbGF0ZSB1Y29kZQo+IGxvYWRpbmcgaXMgcmVq
ZWN0ZWQuCgpJJ20gY29uZnVzZWQuIEkgdGhvdWdodCB3ZSBoYWQgYWdyZWVkIHRoYXQgdGhlIGxv
bmcgdGVybSBzb2x1dGlvbgp3b3VsZCBiZSB0byBicmllZmx5IGJyaW5nIG9ubGluZSBhIHRocmVh
ZCBvZiBjb3JlcyB3aXRoIGFsbCB0aGVpcgp0aHJlYWRzIHBhcmtlZC4gV2hhdCB5b3UgZG8gaGVy
ZSB3YXMgbWVhbnQgdG8gYmUgYSB0ZW1wb3Jhcnkgc3RlcApvbmx5IGZvciA0LjEzLCBmb3Igd2hp
Y2ggaXQgaXMgdG9vIGxhdGUgbm93ICh1bmxlc3MgSsO8cmdlbgppbmRpY2F0ZXMgb3RoZXJ3aXNl
KS4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS5jCj4gQEAgLTU4NCw2ICs1ODQsNTEgQEAgc3RhdGljIGludCBkb19taWNyb2Nv
ZGVfdXBkYXRlKHZvaWQgKnBhdGNoKQo+ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3Rh
dGljIHVuc2lnbmVkIGludCB1bmlxdWVfY29yZV9pZCh1bnNpZ25lZCBpbnQgY3B1LCB1bnNpZ25l
ZCBpbnQgc29ja2V0X3NoaWZ0KQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgY29yZV9pZCA9IGNw
dV90b19jdShjcHUpOwo+ICsKPiArICAgIGlmICggY29yZV9pZCA9PSBJTlZBTElEX0NVSUQgKQo+
ICsgICAgICAgIGNvcmVfaWQgPSBjcHVfdG9fY29yZShjcHUpOwo+ICsKPiArICAgIHJldHVybiAo
Y3B1X3RvX3NvY2tldChjcHUpIDw8IHNvY2tldF9zaGlmdCkgKyBjb3JlX2lkOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgaW50IGhhc19wYXJrZWRfY29yZSh2b2lkKQo+ICt7Cj4gKyAgICBpbnQgcmV0Owo+
ICsgICAgdW5zaWduZWQgaW50IGNwdSwgbWF4X2JpdHMsIGNvcmVfd2lkdGg7Cj4gKyAgICB1bnNp
Z25lZCBpbnQgbWF4X3NvY2tldHMgPSAxLCBtYXhfY29yZXMgPSAxOwo+ICsgICAgdW5zaWduZWQg
bG9uZyAqYml0bWFwOwo+ICsKPiArICAgIGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICkKPiArICAg
ICAgICByZXR1cm4gMDsKPiArCj4gKyAgICBmb3JfZWFjaF9wYXJrZWRfY3B1KGNwdSkKPiArICAg
IHsKPiArICAgICAgICAvKiBOb3RlIHRoYXQgY3B1X3RvX3NvY2tldCgpIGdldCBhbiBJRCBzdGFy
dGluZyBmcm9tIDAuICovCj4gKyAgICAgICAgbWF4X3NvY2tldHMgPSBtYXgobWF4X3NvY2tldHMs
IGNwdV90b19zb2NrZXQoY3B1KSArIDEpOwo+ICsgICAgICAgIG1heF9jb3JlcyA9IG1heChtYXhf
Y29yZXMsIGNwdV9kYXRhW2NwdV0ueDg2X21heF9jb3Jlcyk7Cj4gKyAgICB9Cj4gKwo+ICsgICAg
Y29yZV93aWR0aCA9IGZscyhtYXhfY29yZXMpOwo+ICsgICAgbWF4X2JpdHMgPSBtYXhfc29ja2V0
cyA8PCBjb3JlX3dpZHRoOwoKSXNuJ3QgdGhpcyBvZmYgYnkgb25lPyBJZiBtYXhfY29yZXMgaXMg
MSwgeW91IGRvbid0IG5lZWQgdG8gc2hpZnQKbWF4X3NvY2tldHMgKG9yIHRoZSBjcHVfdG9fc29j
a2V0KCkgdmFsdWUgaW4gdW5pcXVlX2NvcmVfaWQoKSkgYXQKYWxsLCBmb3IgZXhhbXBsZS4KCldp
dGggdGhpcyBpbiBtaW5kLCBpbnN0ZWFkIG9mIHRoZSBwYXJrX29mZmxpbmVfY3B1cyBjaGVjayBh
dCB0aGUKdG9wIG9mIHRoZSBmdW5jdGlvbiwgd291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBjaGVj
ayBoZXJlIHdoZXRoZXIKbWF4X3NvY2tldHMgYW5kIG1heF9jb3JlcyBhcmUgYm90aCBzdGlsbCAx
LCBpbiB3aGljaCBjYXNlIGF0CmxlYXN0IG9uZSB0aHJlYWQgb2YgdGhlIG9ubHkgY29yZSBvZiB0
aGUgb25seSBzb2NrZXQgaW4gdGhlIHN5c3RlbQppcyBvYnZpb3VzbHkgc3RpbGwgb25saW5lICh0
aGUgb25lIHdlJ3JlIHJ1bm5pbmcgb24pPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
