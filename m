Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5712F7FE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:11:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inLk4-00072u-7C; Fri, 03 Jan 2020 12:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inLk2-00072p-R8
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:07:46 +0000
X-Inumbo-ID: a1f56766-2e21-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1f56766-2e21-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 12:07:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3044B016;
 Fri,  3 Jan 2020 12:07:36 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191224124453.47183-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
Date: Fri, 3 Jan 2020 13:08:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224124453.47183-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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

T24gMjQuMTIuMjAxOSAxMzo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0yMjcsMTQg
KzIzMyw0NyBAQCB2b2lkIGZsdXNoX2FyZWFfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNv
bnN0IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gICAgICBpZiAoIChmbGFncyAmIH5G
TFVTSF9PUkRFUl9NQVNLKSAmJgo+ICAgICAgICAgICAhY3B1bWFza19zdWJzZXQobWFzaywgY3B1
bWFza19vZihjcHUpKSApCj4gICAgICB7Cj4gKyAgICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZh
bHNlOwo+ICsKPiAgICAgICAgICBzcGluX2xvY2soJmZsdXNoX2xvY2spOwo+ICAgICAgICAgIGNw
dW1hc2tfYW5kKCZmbHVzaF9jcHVtYXNrLCBtYXNrLCAmY3B1X29ubGluZV9tYXApOwo+ICAgICAg
ICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZsdXNoX2NwdW1hc2spOwo+ICAgICAgICAgIGZs
dXNoX3ZhICAgICAgPSB2YTsKPiAgICAgICAgICBmbHVzaF9mbGFncyAgID0gZmxhZ3M7Cj4gLSAg
ICAgICAgc2VuZF9JUElfbWFzaygmZmx1c2hfY3B1bWFzaywgSU5WQUxJREFURV9UTEJfVkVDVE9S
KTsKPiArCj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBQcmV2ZW50IGFueSBDUFUgaG90e3Vu
fXBsdWcgd2hpbGUgc2VuZGluZyB0aGUgSVBJcyBpZiB3ZSBhcmUgdG8gdXNlCj4gKyAgICAgICAg
ICogYSBzaG9ydGhhbmQsIGFsc28gcmVmdXNlIHRvIHVzZSBhIHNob3J0aGFuZCBpZiBub3QgYWxs
IENQVXMgYXJlCj4gKyAgICAgICAgICogb25saW5lIG9yIGhhdmUgYmVlbiBwYXJrZWQuCj4gKyAg
ICAgICAgICovCj4gKyAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfc21wX2Jv
b3QgJiYgIWNwdV9vdmVyZmxvdyAmJgo+ICsgICAgICAgICAgICAgKGNwdXNfbG9ja2VkID0gZ2V0
X2NwdV9tYXBzKCkpICYmCj4gKyAgICAgICAgICAgICAocGFya19vZmZsaW5lX2NwdXMgfHwKCldo
eSBpcyBpdCByZWxldmFudCB3aGV0aGVyIHdlIHBhcmsgb2ZmbGluZSBDUFVzLCBvciB3aGV0aGVy
IHdlJ3ZlCmV2ZW4gYnJvdWdodCB1cCBhbGwgb2YgdGhlIG9uZXMgYSBzeXN0ZW0gaGFzPyBBbiBJ
UEksIGluIHBhcnRpY3VsYXIKYSBicm9hZGNhc3Qgb25lLCBzaG91bGRuJ3QgaGF2ZSBhbnkgaXNz
dWUgZ2V0dGluZyBkZWxpdmVyZWQgaWYgc29tZQpvZiB0aGUgbm9taW5hbCByZWNpcGllbnRzIGRv
bid0IGxpc3Rlbiwgc2hvdWxkIGl0PyAoVGhlIHVzZSBvZgpjcHVfb25saW5lX21hcCB0aGF0IHdh
cyBhbHJlYWR5IHRoZXJlIGFib3ZlIGlzIGEgc2lnbiAtIGJ1dCBub3QgYQpwcm9vZiwgYXMgaXQg
bWF5IGl0c2VsZiBiZSBidWdneSAtIHRoYXQgdGhlIHNldCBvZiBvbmxpbmUgQ1BVcwpmbHVjdHVh
dGluZyBiZWhpbmQgdGhpcyBmdW5jdGlvbidzIGJhY2sgb3VnaHQgdG8gbm90IGJlIGEgcHJvYmxl
bS4pCgpGdXJ0aGVyIGEgcXVlc3Rpb24gb24gbG9jayBuZXN0aW5nOiBTaW5jZSB0aGUgY29tbWl0
IG1lc3NhZ2UKZG9lc24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRpZCB5b3UgY2hl
Y2sgdGhlcmUgYXJlIG5vClRMQiBmbHVzaCBpbnZvY2F0aW9ucyB3aXRoIHRoZSBnZXRfY3B1X21h
cHMoKSBsb2NrIGhlbGQ/IEV2ZW4gaWYKeW91IGRpZCBhbmQgZXZlbiBpZiB0aGVyZSBhcmUgbm9u
ZSwgSSB0aGluayB0aGUgZnVuY3Rpb24gc2hvdWxkCnRoZW4gZ2V0IGEgY29tbWVudCBhdHRhY2hl
ZCB0byB0aGUgZWZmZWN0IG9mIHRoaXMgbG9jayBvcmRlcgppbnZlcnNpb24gcmlzay4gKEZvciBl
eGFtcGxlLCBpdCBpc24ndCBvYnZpb3VzIHRvIG1lIHRoYXQgbm8gdXNlcgpvZiBzdG9wX21hY2hp
bmUoKSB3b3VsZCBldmVyIHdhbnQgdG8gZG8gYW55IGtpbmQgb2YgVExCIGZsdXNoaW5nLikKCk92
ZXJhbGwgSSB3b25kZXIgd2hldGhlciB5b3VyIGdvYWwgY291bGRuJ3QgYmUgYWNoaWV2ZWQgd2l0
aG91dAp0aGUgZXh0cmEgbG9ja2luZyBhbmQgd2l0aG91dCB0aGUgc3BlY2lhbCBjb25kaXRpb25z
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
