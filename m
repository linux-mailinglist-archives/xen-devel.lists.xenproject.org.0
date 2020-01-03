Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B312F893
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:58:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMU4-00039V-57; Fri, 03 Jan 2020 12:55:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inMU2-00039Q-2O
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:55:18 +0000
X-Inumbo-ID: 45413d72-2e28-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45413d72-2e28-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 12:55:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1533EAE7F;
 Fri,  3 Jan 2020 12:55:08 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
Date: Fri, 3 Jan 2020 13:55:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200103123409.GM11756@Air-de-Roger>
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

T24gMDMuMDEuMjAyMCAxMzozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEph
biAwMywgMjAyMCBhdCAwMTowODoyMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjQuMTIuMjAxOSAxMzo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBGdXJ0aGVyIGEgcXVl
c3Rpb24gb24gbG9jayBuZXN0aW5nOiBTaW5jZSB0aGUgY29tbWl0IG1lc3NhZ2UKPj4gZG9lc24n
dCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRpZCB5b3UgY2hlY2sgdGhlcmUgYXJlIG5v
Cj4+IFRMQiBmbHVzaCBpbnZvY2F0aW9ucyB3aXRoIHRoZSBnZXRfY3B1X21hcHMoKSBsb2NrIGhl
bGQ/Cj4gCj4gVGhlIENQVSBtYXBzIGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBzbyBpdCBzaG91
bGQgYmUgZmluZSB0byBhdHRlbXB0Cj4gYSBUTEIgZmx1c2ggd2l0aCB0aGUgbG9jayBhbHJlYWR5
IGhlbGQuCgpXaGVuIGFscmVhZHkgaGVsZCBieSB0aGUgc2FtZSBDUFUgLSBzdXJlLiBJdCBiZWlu
ZyBhIHJlY3Vyc2l2ZQpvbmUgKHdoaWNoIEkgcGFpZCBhdHRlbnRpb24gdG8gd2hlbiB3cml0aW5n
IG15IGVhcmxpZXIgcmVwbHkpCmRvZXNuJ3QgbWFrZSBpdCAodG9nZXRoZXIgd2l0aCBhbnkgb3Ro
ZXIgb25lKSBpbW11bmUgYWdhaW5zdApBQkJBIGRlYWRsb2NrcywgdGhvdWdoLgoKPj4gRXZlbiBp
Zgo+PiB5b3UgZGlkIGFuZCBldmVuIGlmIHRoZXJlIGFyZSBub25lLCBJIHRoaW5rIHRoZSBmdW5j
dGlvbiBzaG91bGQKPj4gdGhlbiBnZXQgYSBjb21tZW50IGF0dGFjaGVkIHRvIHRoZSBlZmZlY3Qg
b2YgdGhpcyBsb2NrIG9yZGVyCj4+IGludmVyc2lvbiByaXNrLiAoRm9yIGV4YW1wbGUsIGl0IGlz
bid0IG9idmlvdXMgdG8gbWUgdGhhdCBubyB1c2VyCj4+IG9mIHN0b3BfbWFjaGluZSgpIHdvdWxk
IGV2ZXIgd2FudCB0byBkbyBhbnkga2luZCBvZiBUTEIgZmx1c2hpbmcuKQo+Pgo+PiBPdmVyYWxs
IEkgd29uZGVyIHdoZXRoZXIgeW91ciBnb2FsIGNvdWxkbid0IGJlIGFjaGlldmVkIHdpdGhvdXQK
Pj4gdGhlIGV4dHJhIGxvY2tpbmcgYW5kIHdpdGhvdXQgdGhlIHNwZWNpYWwgY29uZGl0aW9ucy4K
PiAKPiBIbSwgdGhpcyBzbyBmYXIgaGFzIHdvcmtlZCBmaW5lIG9uIGFsbCB0aGUgYm94ZXMgdGhh
dCBJJ3ZlIHRyaWVkLgo+IEknbSBoYXBweSB0byBjaGFuZ2UgaXQgdG8gYSBzaW1wbGVyIGFwcHJv
YWNoLCBidXQgSSB0aGluayB0aGUKPiBjb25kaXRpb25zIGFuZCBsb2NraW5nIGFyZSByZXF1aXJl
ZCBmb3IgdGhpcyB0byB3b3JrIGNvcnJlY3RseS4KCldoaWNoIG1pZ2h0IHRoZW4gaW5kaWNhdGUg
c2FpZCBwcmUtZXhpc3RpbmcgdXNlIG9mIGNwdV9vbmxpbmVfbWFwCnRvIGJlIGEgKGxhdGVudD8p
IHByb2JsZW0uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
