Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9663D165960
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:38:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hJp-0005Or-JV; Thu, 20 Feb 2020 08:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4hJo-0005Om-Rh
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:36:24 +0000
X-Inumbo-ID: 13a535c0-53bc-11ea-84e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13a535c0-53bc-11ea-84e8-12813bfff9fa;
 Thu, 20 Feb 2020 08:36:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 627A8AC8F;
 Thu, 20 Feb 2020 08:36:23 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
 <8abb37bc-e1e8-d9ab-d66e-4c0e9c8f4da3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb1ec887-0b04-20e4-20f4-e45b1e8aa8a3@suse.com>
Date: Thu, 20 Feb 2020 09:36:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8abb37bc-e1e8-d9ab-d66e-4c0e9c8f4da3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAwOToyNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMC4wMi4yMCAw
OToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToKPj4+IE1vc3QgdXNlcnMgb2YgdGhlIGNwdSBtYXBzIGp1c3QgY2FyZSBh
Ym91dCB0aGUgbWFwcyBub3QgY2hhbmdpbmcgd2hpbGUKPj4+IHRoZSBsb2NrIGlzIGJlaW5nIGhl
bGQsIGJ1dCBkb24ndCBhY3R1YWxseSBtb2RpZnkgdGhlIG1hcHMuCj4+Pgo+Pj4gQ29udmVydCB0
aGUgbG9jayBpbnRvIGEgcncgbG9jaywgYW5kIHRha2UgdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGlu
Cj4+PiBnZXRfY3B1X21hcHMgYW5kIGluIHdyaXRlIG1vZGUgaW4gY3B1X2hvdHBsdWdfYmVnaW4u
IFRoaXMgd2lsbCBsb3dlcgo+Pj4gdGhlIGNvbnRlbnRpb24gYXJvdW5kIHRoZSBsb2NrLCBzaW5j
ZSBwbHVnIGFuZCB1bnBsdWcgb3BlcmF0aW9ucyB0aGF0Cj4+PiB0YWtlIHRoZSBsb2NrIGluIHdy
aXRlIG1vZGUgYXJlIG5vdCB0aGF0IGNvbW1vbi4KPj4+Cj4+PiBOb3RlIHRoYXQgdGhlIHJlYWQg
bG9jayBjYW4gYmUgdGFrZW4gcmVjdXJzaXZlbHkgKGFzIGl0J3MgYSBzaGFyZWQKPj4+IGxvY2sp
LCBhbmQgaGVuY2Ugd2lsbCBrZWVwIHRoZSBzYW1lIGJlaGF2aW9yIGFzIHRoZSBwcmV2aW91c2x5
IHVzZWQKPj4+IHJlY3Vyc2l2ZSBsb2NrLiBBcyBmb3IgdGhlIHdyaXRlIGxvY2ssIGl0J3Mgb25s
eSB1c2VkIGJ5IENQVQo+Pj4gcGx1Zy91bnBsdWcgb3BlcmF0aW9ucywgYW5kIHRoZSBsb2NrIGlz
IG5ldmVyIHRha2VuIHJlY3Vyc2l2ZWx5IGluCj4+PiB0aGF0IGNhc2UuCj4+Pgo+Pj4gV2hpbGUg
dGhlcmUgYWxzbyBjaGFuZ2UgZ2V0X2NwdV9tYXBzIHJldHVybiB0eXBlIHRvIGJvb2wuCj4+Pgo+
Pj4gUmVwb3J0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+PiBTdWdnZXN0
ZWQtYWxzby1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IEknbSBh
ZnJhaWQgSSBjYW4ndCBzZWUgaG93IG9mZmxpbmluZyBhIENQVSB3b3VsZCBub3cgd29yay4KPj4g
Q29uZGVuc2VkIHRvIGp1c3QgdGhlIHJlbGV2YW50IGNhbGxzLCB0aGUgc2VxdWVuY2UgZnJvbQo+
PiBjcHVfZG93bigpIGlzCj4+Cj4+IGNwdV9ob3RwbHVnX2JlZ2luKCkgKGkuZS4gbG9jayB0YWtl
biBpbiB3cml0ZSBtb2RlKQo+PiBzdG9wX21hY2hpbmVfcnVuKCkKPj4gLT4gZ2V0X2NwdV9tYXBz
KCkgKGxvY2sgdW5hdmFpbGFibGUgdG8gcmVhZGVycykKPiAKPiBJJ3ZlIGFscmVhZHkgcG9pbnRl
ZCB0aGF0IG91dCBpbiBhbm90aGVyIHRocmVhZC4gOi0pCgpPaCwgSSBkaWRuJ3QgcmVjYWxsLiBP
ciBlbHNlIEkgd291bGRuJ3QgaGF2ZSBjb21taXR0ZWQgdGhlCnBhdGNoIGluIHRoZSBmaXJzdCBw
bGFjZS4KCj4+IE90aGVyIHRoYW4gcmVjdXJzaXZlIHNwaW4gbG9ja3MsIHJ3IGxvY2tzIGRvbid0
IGN1cnJlbnRseQo+PiBoYXZlIGEgY29uY2VwdCBvZiBwZXJtaXR0aW5nIGluIGEgcmVhZGVyIHdo
ZW4gdGhpcyBDUFUKPj4gYWxyZWFkeSBob2xkcyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlLiBIZW5j
ZSBJIGNhbid0IHNlZQo+PiBob3cgdGhlIGdldF9jcHVfbWFwcygpIGFib3ZlIHdvdWxkIG5vdyBl
dmVyIHN1Y2NlZWQuIEFtIEkKPj4gbWlzc2luZyBhbnl0aGluZywgb3IgZG9lcyB0aGUgcGF0Y2gg
bmVlZCByZXZlcnRpbmcgdW50aWwKPj4gdGhlIHJlYWRfdHJ5bG9jaygpIGdvdCBlbmhhbmNlZCB0
byBjb3BlIHdpdGggdGhpcz8KPiAKPiBJIHRoaW5rIHRoaXMgY2FuIGJlIGhhbmRsZWQgbG9jYWxs
eSBpbiBnZXRfY3B1X21hcHMoKSBhbmQKPiBjcHVfaG90cGx1Z19iZWdpbigpIHdpdGggdGhlIHVz
ZSBvZiBhIHZhcmlhYmxlIGhvbGRpbmcgdGhlIGNwdSAob3IKPiBOUl9DUFVTKSBvZiB0aGUgY3B1
IGhvbGRpbmcgdGhlIHdyaXRlIGxvY2suIGdldF9jcHVfbWFwcygpIGNhbiBqdXN0Cj4gc3VjY2Vl
ZCBpbiBjYXNlIHRoaXMgdmFyaWFibGUgY29udGFpbnMgc21wX3Byb2Nlc3Nvcl9pZCgpLgoKSXQg
Y291bGQsIHllcy4gQnV0IHRoaXMgaXMgYSBnZW5lcmFsIHNob3J0Y29taW5nIG9mIG91ciBydwps
b2NrIGltcGxlbWVudGF0aW9uIChhbmQgaW1vIGEgdHJhcCB3YWl0aW5nIGZvciBvdGhlcnMgdG8K
ZmFsbCBpbnRvIGFzIHdlbGwpLCBhbmQgaGVuY2UgSSB0aGluayBpdCB3b3VsZCBiZXR0ZXIgYmUK
dGFrZW4gY2FyZSBvZiBpbiBhIGdlbmVyaWMgbWFubmVyLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
