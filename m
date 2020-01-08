Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B9134462
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 14:57:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBnY-0002z5-FU; Wed, 08 Jan 2020 13:55:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipBnX-0002z0-Ny
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:54:59 +0000
X-Inumbo-ID: 7544f014-321e-11ea-b7f8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7544f014-321e-11ea-b7f8-12813bfff9fa;
 Wed, 08 Jan 2020 13:54:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18F51B1A8;
 Wed,  8 Jan 2020 13:54:58 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
 <20200108132819.GO11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
Date: Wed, 8 Jan 2020 14:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108132819.GO11756@Air-de-Roger>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNDozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBK
YW4gMDMsIDIwMjAgYXQgMDE6NTU6NTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAzLjAxLjIwMjAgMTM6MzQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBGcmksIEph
biAwMywgMjAyMCBhdCAwMTowODoyMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBP
biAyNC4xMi4yMDE5IDEzOjQ0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4gRnVydGhlciBh
IHF1ZXN0aW9uIG9uIGxvY2sgbmVzdGluZzogU2luY2UgdGhlIGNvbW1pdCBtZXNzYWdlCj4+Pj4g
ZG9lc24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRpZCB5b3UgY2hlY2sgdGhlcmUg
YXJlIG5vCj4+Pj4gVExCIGZsdXNoIGludm9jYXRpb25zIHdpdGggdGhlIGdldF9jcHVfbWFwcygp
IGxvY2sgaGVsZD8KPj4+Cj4+PiBUaGUgQ1BVIG1hcHMgbG9jayBpcyBhIHJlY3Vyc2l2ZSBvbmUs
IHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGF0dGVtcHQKPj4+IGEgVExCIGZsdXNoIHdpdGggdGhl
IGxvY2sgYWxyZWFkeSBoZWxkLgo+Pgo+PiBXaGVuIGFscmVhZHkgaGVsZCBieSB0aGUgc2FtZSBD
UFUgLSBzdXJlLiBJdCBiZWluZyBhIHJlY3Vyc2l2ZQo+PiBvbmUgKHdoaWNoIEkgcGFpZCBhdHRl
bnRpb24gdG8gd2hlbiB3cml0aW5nIG15IGVhcmxpZXIgcmVwbHkpCj4+IGRvZXNuJ3QgbWFrZSBp
dCAodG9nZXRoZXIgd2l0aCBhbnkgb3RoZXIgb25lKSBpbW11bmUgYWdhaW5zdAo+PiBBQkJBIGRl
YWRsb2NrcywgdGhvdWdoLgo+IAo+IFRoZXJlJ3Mgbm8gcG9zc2liaWxpdHkgb2YgYSBkZWFkbG9j
ayBoZXJlIGJlY2F1c2UgZ2V0X2NwdV9tYXBzIGRvZXMgYQo+IHRyeWxvY2ssIHNvIGlmIGFub3Ro
ZXIgY3B1IGlzIGhvbGRpbmcgdGhlIGxvY2sgdGhlIGZsdXNoIHdpbGwganVzdAo+IGZhbGxiYWNr
IHRvIG5vdCB1c2luZyB0aGUgc2hvcnRoYW5kLgoKV2VsbCwgd2l0aCB0aGUgX2V4YWN0XyBhcnJh
bmdlbWVudHMgKGZsdXNoX2xvY2sgdXNlZCBvbmx5IGluIG9uZQpwbGFjZSwgYW5kIGNwdV9hZGRf
cmVtb3ZlX2xvY2sgb25seSB1c2VkIGluIHdheXMgc2ltaWxhciB0byBob3cgaXQKaXMgdXNlZCBu
b3cpLCB0aGVyZSdzIG5vIHN1Y2ggcmlzaywgSSBhZ3JlZS4gQnV0IHRoZXJlJ3Mgbm90aGluZwph
dCBhbGwgbWFraW5nIHN1cmUgdGhpcyBkb2Vzbid0IGNoYW5nZS4gSGVuY2UsIGFzIHNhaWQsIGF0
IHRoZSB2ZXJ5CmxlYXN0IHRoaXMgbmVlZHMgcmVhc29uaW5nIGFib3V0IGluIHRoZSBkZXNjcmlw
dGlvbiAob3IgYSBjb2RlCmNvbW1lbnQpLgoKPj4+PiBFdmVuIGlmCj4+Pj4geW91IGRpZCBhbmQg
ZXZlbiBpZiB0aGVyZSBhcmUgbm9uZSwgSSB0aGluayB0aGUgZnVuY3Rpb24gc2hvdWxkCj4+Pj4g
dGhlbiBnZXQgYSBjb21tZW50IGF0dGFjaGVkIHRvIHRoZSBlZmZlY3Qgb2YgdGhpcyBsb2NrIG9y
ZGVyCj4+Pj4gaW52ZXJzaW9uIHJpc2suIChGb3IgZXhhbXBsZSwgaXQgaXNuJ3Qgb2J2aW91cyB0
byBtZSB0aGF0IG5vIHVzZXIKPj4+PiBvZiBzdG9wX21hY2hpbmUoKSB3b3VsZCBldmVyIHdhbnQg
dG8gZG8gYW55IGtpbmQgb2YgVExCIGZsdXNoaW5nLikKPj4+Pgo+Pj4+IE92ZXJhbGwgSSB3b25k
ZXIgd2hldGhlciB5b3VyIGdvYWwgY291bGRuJ3QgYmUgYWNoaWV2ZWQgd2l0aG91dAo+Pj4+IHRo
ZSBleHRyYSBsb2NraW5nIGFuZCB3aXRob3V0IHRoZSBzcGVjaWFsIGNvbmRpdGlvbnMuCj4+Pgo+
Pj4gSG0sIHRoaXMgc28gZmFyIGhhcyB3b3JrZWQgZmluZSBvbiBhbGwgdGhlIGJveGVzIHRoYXQg
SSd2ZSB0cmllZC4KPj4+IEknbSBoYXBweSB0byBjaGFuZ2UgaXQgdG8gYSBzaW1wbGVyIGFwcHJv
YWNoLCBidXQgSSB0aGluayB0aGUKPj4+IGNvbmRpdGlvbnMgYW5kIGxvY2tpbmcgYXJlIHJlcXVp
cmVkIGZvciB0aGlzIHRvIHdvcmsgY29ycmVjdGx5Lgo+Pgo+PiBXaGljaCBtaWdodCB0aGVuIGlu
ZGljYXRlIHNhaWQgcHJlLWV4aXN0aW5nIHVzZSBvZiBjcHVfb25saW5lX21hcAo+PiB0byBiZSBh
IChsYXRlbnQ/KSBwcm9ibGVtLgo+IAo+IEhtLCBtYXliZSBpdCBjb3VsZCBiZSBhIHByb2JsZW0g
d2hlbiBvZmZsaW5pbmcgYSBDUFUuIEkgYXNzdW1lIHRoaXMgaXMKPiBub3QgYW4gaXNzdWUgc28g
ZmFyIGJlY2F1c2UgdGhlcmUgYXJlIG5vIGdsb2JhbCBUTEIgZmx1c2hlcyB3aXRoIGEKPiBtYXNr
IGNvbnRhbmluZyBhIENQVSB0aGF0IGlzIGJlaW5nIG9mZmxpbmVkLgo+IAo+IFJlZ2FyZGluZyB0
aGUgcGF0Y2ggaXRzZWxmLCBkbyB5b3UgdGhpbmsgdGhlIHNob3J0aGFuZCBsb2dpYyBzaG91bGQg
YmUKPiBhZGRlZCB0byBzZW5kX0lQSV9tYXNrLCBvciB3b3VsZCB5b3UgcmF0aGVyIG9ubHkgdXNl
IHRoZSBzaG9ydGhhbmQgZm9yCj4gdGhlIFRMQiBmbHVzaGVzPwoKSWYgaXQgY291bGQgYmUgZ2Vu
ZXJhbGl6ZSB0byBhbGwgSVBJIHNlbmRpbmcsIHRoaXMgd291bGQgb2YgY291cnNlCnNlZW0gcHJl
ZmVyYWJsZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
