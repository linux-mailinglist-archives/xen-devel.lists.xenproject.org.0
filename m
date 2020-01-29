Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759014C9E9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:51:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwloU-0003sU-Qz; Wed, 29 Jan 2020 11:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwloT-0003sP-Ae
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:47:17 +0000
X-Inumbo-ID: 1865ecb6-428d-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1865ecb6-428d-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 11:47:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07DA1AC69;
 Wed, 29 Jan 2020 11:47:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Varad Gautam <vrd@amazon.de>
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
 <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9bb58eaf-bb85-f0f2-b626-3442532305ac@suse.com>
Date: Wed, 29 Jan 2020 12:47:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMTozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBIZWxsbywKPiAK
PiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgTmV4dCB0aW1lIGNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRv
IHJlcGx5IHRvIHRoZQo+IHByZXZpb3VzIHF1ZXN0aW9ucyBiZWZvcmUgc2VuZGluZyBhIG5ldyB2
ZXJzaW9uOgo+IAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMDI1Ny5odG1sCj4gCj4gT24gV2VkLCBKYW4gMjksIDIwMjAg
YXQgMTA6Mjg6MDdBTSArMDEwMCwgVmFyYWQgR2F1dGFtIHdyb3RlOgo+PiBYRU5fRE9NQ1RMX2Rl
c3Ryb3lkb21haW4gY3JlYXRlcyBhIGNvbnRpbnVhdGlvbiBpZiBkb21haW5fa2lsbCAtRVJFU1RB
UlRTLgo+PiBJbiB0aGF0IHNjZW5hcmlvLCBpdCBpcyBwb3NzaWJsZSB0byByZWNlaXZlIG11bHRp
cGxlIF9waXJxX2d1ZXN0X3VuYmluZAo+PiBjYWxscyBmb3IgdGhlIHNhbWUgcGlycSBmcm9tIGRv
bWFpbl9raWxsLCBpZiB0aGUgcGlycSBoYXMgbm90IHlldCBiZWVuCj4+IHJlbW92ZWQgZnJvbSB0
aGUgZG9tYWluJ3MgcGlycV90cmVlLCBhczoKPj4gICBkb21haW5fa2lsbCgpCj4+ICAgICAtPiBk
b21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQo+PiAgICAgICAtPiBwY2lfcmVsZWFzZV9kZXZp
Y2VzKCkKPj4gICAgICAgICAtPiBwY2lfY2xlYW5fZHBjaV9pcnEoKQo+PiAgICAgICAgICAgLT4g
cGlycV9ndWVzdF91bmJpbmQoKQo+PiAgICAgICAgICAgICAtPiBfX3BpcnFfZ3Vlc3RfdW5iaW5k
KCkKPj4KPj4gRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2Fs
bCB3b3VsZCB6YXAgdGhlIGN1cnJlbnQKPj4gZG9tYWluIGZyb20gdGhlIHBpcnEncyBndWVzdHNb
XSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVyIGlzIG5ldmVyIGZyZWVkCj4+IGFzIHRoZXJl
IGFyZSBvdGhlciBndWVzdHMgdXNpbmcgdGhpcyBwaXJxLiBBcyBhIHJlc3VsdCwgb24gdGhlIHNl
Y29uZCBjYWxsLAo+PiBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVu
dCBkb21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZAo+PiBmcm9tIHRoZSBndWVzdHNbXSBsaXN0
LCBhbmQgaGl0cyBhIEJVR19PTi4KPj4KPj4gTWFrZSBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNhZmUg
dG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRpbmcgeGVuCj4+IGNvbnRpbnVlIGlm
IGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBndWVzdC4g
VGhlCj4+IFBJUlEgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20gdGhlIGRvbWFpbidzIHBpcnFfdHJl
ZSBkdXJpbmcgdGhlIGRlc3RydWN0aW9uCj4+IGluIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95IGFu
eXdheXMuCj4gCj4gU28gQUZBSUNUIHRoaXMgaXMgYmVjYXVzZSBwdF9waXJxX3NvZnRpcnFfYWN0
aXZlKCkgcmV0dXJucyB0cnVlIGluCj4gcGNpX2NsZWFuX2RwY2lfaXJxKCkgYW5kIGhlbmNlIHRo
ZSBpdGVyYXRpb24gaXMgc3RvcHBlZCBhbmQKPiBodm1fZG9tYWluX2lycShkKS0+ZHBjaSBpcyBu
b3Qgc2V0IHRvIE5VTEwuCj4gCj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gY2xlYW4gdGhlIGFs
cmVhZHkgcHJvY2Vzc2VkIElSUXMgZnJvbSB0aGUKPiBkb21haW4gcGlycV90cmVlPwoKVGhpcyBt
aWdodCB3b3JrLCBwZXJoYXBzIGJ5IHdheSBvZiBpbnZva2luZyB1bm1hcF9kb21haW5fcGlycSgp
CnJpZ2h0IGFmdGVyIHBpcnFfZ3Vlc3RfdW5iaW5kKCksIGFzIGxvbmcgYXMgaHZtX2RpcnFfYXNz
aXN0KCkgKGFzCmNhbGxlZCBmcm9tIGRwY2lfc29mdGlycSgpKSBjYW4gYmUgbWFkZSBza2lwIGFs
bCBhY3R1YWwgd29yayBpdAptZWFucyB0byBkbyBpbiBzdWNoIGEgY2FzZS4gVW5mb3J0dW5hdGVs
eSB0aGUgdHdvIC0+bWFza2VkIGZpZWxkcwphY3RlZCB1cG9uIGFyZSBkaWZmZXJlbnQgYmV0d2Vl
biBfX3BpcnFfZ3Vlc3RfdW5iaW5kKCkgYW5kCmh2bV9kaXJxX2Fzc2lzdCgpLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
