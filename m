Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B2B10CC5F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:00:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMC8-0006ks-HW; Thu, 28 Nov 2019 15:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaMC7-0006kn-9E
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 15:59:03 +0000
X-Inumbo-ID: fec373de-11f7-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fec373de-11f7-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 15:59:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67F68B1BD;
 Thu, 28 Nov 2019 15:59:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <20191128113904.GU980@Air-de-Roger>
 <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
 <20191128141328.GV980@Air-de-Roger>
 <c949cacc-5ba7-d93f-7e08-f49c528431b0@suse.com>
 <20191128143012.GW980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95ac4328-7052-e9d2-8adc-e70cc1674f4e@suse.com>
Date: Thu, 28 Nov 2019 16:59:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128143012.GW980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
Cc: Juergen Gross <jgross@suse.com>, AndrewCooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNTozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMjgsIDIwMTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI4LjExLjIwMTkgMTU6MTMsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVGh1LCBO
b3YgMjgsIDIwMTkgYXQgMDI6MzM6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMjguMTEuMjAxOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4gT24gVGh1
LCBOb3YgMjgsIDIwMTkgYXQgMTI6MDM6NDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+PiBBdCB0aGUgdGltZSB0aGUgcGVuZGluZyBFT0kgc3RhY2sgd2FzIGludHJvZHVjZWQgdGhl
cmUgd2VyZSBubwo+Pj4+Pj4gaW50ZXJuYWxseSB1c2VkIElSUXMgd2hpY2ggd291bGQgaGF2ZSB0
aGUgTEFQSUMgRU9JIGlzc3VlZCBmcm9tIHRoZQo+Pj4+Pj4gLT5lbmQoKSBob29rLiBUaGlzIGhh
ZCB0aGVuIGNoYW5nZWQgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIElPTU1VcywKPj4+Pj4+IGJ1
dCB0aGUgaW50ZXJhY3Rpb24gaXNzdWUgd2FzIHByZXN1bWFibHkgbWFza2VkIGJ5Cj4+Pj4+PiBp
cnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKCkgZnJlcXVlbnRseSBFT0ktaW5nIGludGVycnVwdHMgd2F5
IHRvbyBlYXJseQo+Pj4+Pj4gKHdoaWNoIGdvdCBmaXhlZCBieSAzNTljZjZmOGEwZWMgWyJ4ODYv
SVJROiBkb24ndCBrZWVwIEVPSSB0aW1lcgo+Pj4+Pj4gcnVubmluZyB3aXRob3V0IG5lZWQiXSku
Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCB3aXRoIHVzIHJlLWVuYWJsaW5nIGlu
dGVycnVwdHMgYWNyb3NzIGhhbmRsZXIKPj4+Pj4+IGludm9jYXRpb24sIGEgaGlnaGVyIHByaW9y
aXR5IChndWVzdCkgaW50ZXJydXB0IG1heSB0cmlnZ2VyIHdoaWxlCj4+Pj4+PiBoYW5kbGluZyBh
IGxvd2VyIHByaW9yaXR5IChpbnRlcm5hbCkgb25lLiBUaGUgRU9JIGlzc3VlZCBmcm9tCj4+Pj4+
PiAtPmVuZCgpIChmb3IgQUNLVFlQRV9FT0kga2luZCBpbnRlcnJ1cHRzKSB3b3VsZCB0aGVuIG1p
c3Rha2VubHkKPj4+Pj4+IEVPSSB0aGUgaGlnaGVyIHByaW9yaXR5IChndWVzdCkgaW50ZXJydXB0
LCBicmVha2luZyAoYW1vbmcgb3RoZXIKPj4+Pj4+IHRoaW5ncykgcGVuZGluZyBFT0kgc3RhY2sg
bG9naWMncyBhc3N1bXB0aW9ucy4KPj4+Pj4KPj4+Pj4gTWF5YmUgdGhlcmUncyBzb21ldGhpbmcg
dGhhdCBJJ20gbWlzc2luZywgYnV0IHNob3VsZG4ndCBoeXBlcnZpc29yCj4+Pj4+IHZlY3RvcnMg
YWx3YXlzIGJlIGhpZ2hlciBwcmlvcml0eSB0aGFuIGd1ZXN0IG9uZXM/Cj4+Pj4KPj4+PiBEZXBl
bmRzIC0gSU9NTVUgb25lcyBpbW8gYXJlbid0IHNvbWV0aGluZyB0aGF0IG5lZWRzIHVyZ2VudGx5
Cj4+Pj4gZGVhbGluZyB3aXRoLCBzbyBhIGxpdHRsZSBiaXQgb2YgZGVsYXkgd29uJ3QgaHVydC4g
VGhlcmUgd291bGQKPj4+PiBvbmx5IGJlIGEgcHJvYmxlbSBpZiBzdWNoIGludGVycnVwdHMgY291
bGQgYmUgZGVmZXJyZWQKPj4+PiBpbmRlZmluaXRlbHkuCj4+Pj4KPj4+Pj4gSSBzZWUgdGhlcmUn
cyBhbHJlYWR5IGEgcmFuZ2UgcmVzZXJ2ZWQgZm9yIGhpZ2ggcHJpb3JpdHkgdmVjdG9ycwo+Pj4+
PiAoe0ZJUlNUL0xBU1R9X0hJUFJJT1JJVFlfVkVDVE9SKSwgd2hhdCdzIHRoZSByZWFzb24gZm9y
IGh5cGVydmlzb3IKPj4+Pj4gaW50ZXJydXB0cyBub3QgdXNpbmcgdGhpcyByYW5nZT8KPj4+Pgo+
Pj4+IFdlJ2QgcXVpY2tseSBydW4gb3V0IG9mIGhpZ2ggcHJpb3JpdHkgdmVjdG9ycyBvbiBzeXN0
ZW1zIHdpdGgKPj4+PiBtdWx0aXBsZSAoYW5kIHBlcmhhcHMgaW5kZWVkIG1hbnkpIElPTU1Vcy4K
Pj4+Cj4+PiBXZWxsLCB0aGVyZSdzIG5vIGxpbWl0IG9uIHRoZSBudW1iZXIgb2YgaGlnaCBwcmlv
cml0eSB2ZWN0b3JzLCBzaW5jZQo+Pj4gdGhpcyBpcyBhbGwgYSBzb2Z0d2FyZSBhYnN0cmFjdGlv
bi4gSXQgb25seSBtYXR0ZXJzIHRoYXQgc3VjaCB2ZWN0b3JzCj4+PiBhcmUgaGlnaGVyIHRoYW4g
Z3Vlc3Qgb3duZWQgb25lcy4KPj4+Cj4+PiBJIGhhdmUgdG8gdGFrZSBhIGxvb2ssIGJ1dCBJIHdv
dWxkIHRoaW5rIHRoYXQgWGVuIHVzZWQgdmVjdG9ycyBhcmUgdGhlCj4+PiBmaXJzdCBvbmVzIHRv
IGJlIGFsbG9jYXRlZCwgYW5kIGhlbmNlIGNvdWxkIHN0YXJ0IGZyb20KPj4+IEZJUlNUX0hJUFJJ
T1JJVFlfVkVDVE9SIC0gMSBhbmQgZ28gZG93biBmcm9tIHRoZXJlLgo+Pgo+PiBJZiB0aGlzIHdh
cyB0aGUgY2FzZSwgdGhlbiB3ZSB3b3VsZG4ndCBoYXZlIG9ic2VydmVkIHRoZSBpc3N1ZSAoZGVz
cGl0ZQo+PiBpdCBiZWluZyB0aGVyZSkgdGhpcyBwYXRjaCB0cmllcyB0byBhZGRyZXNzLiBUaGUg
SU9NTVVzIGZvciBib3RoIEFuZHJldwo+PiBhbmQgbWUgZW5kZWQgdXAgdXNpbmcgdmVjdG9yIDB4
MjgsIGJlbG93IGV2ZXJ5dGhpbmcgdGhhdCBlLmcuIHRoZQo+PiBJTy1BUElDIFJURSBnb3QgYXNz
aWduZWQuCj4gCj4gSSBrbm93IGl0J3Mgbm90IGxpa2UgdGhhdCBBVE0sIGFuZCBoZW5jZSBJIHdv
bmRlciB3aGV0aGVyIGl0IHdvdWxkIGJlCj4gcG9zc2libGUgdG8gbWFrZSBpdCBzbzogWGVuIHZl
Y3RvcnMgZ2V0IGFsbG9jYXRlZCBkb3duIGZyb20KPiBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAt
IDEgYW5kIHRoZW4gd2Ugd29uJ3QgaGF2ZSB0aGlzIGlzc3VlLgo+IAo+PiBBbHNvIGRvbid0IGZv
cmdldCB0aGF0IHdlIGRvbid0IGFsbG9jYXRlCj4+IHZlY3RvcnMgY29udGludW91c2x5LCBidXQg
c3VjaCB0aGF0IHRoZXknZCBnZXQgc3ByZWFkIGFjcm9zcyB0aGUKPj4gZGlmZmVyZW50IHByaW9y
aXR5IGxldmVscy4gKFdoZXRoZXIgdGhhdCdzIGFuIGF3ZnVsbHkgZ29vZCBpZGVhIGlzIGEKPj4g
c2VwYXJhdGUgcXVlc3Rpb24uKQo+IAo+IFdlbGwsIHZlY3RvcnMgdXNlZCBieSBYZW4gd291bGQg
YmUgYWxsb2NhdGVkIGRvd253YXJkcyBjb250aW51b3VzbHkKPiBmcm9tIEZJUlNUX0hJUFJJT1JJ
VFlfVkVDVE9SIC0gMSwgYW5kIGhlbmNlIHdvbid0IGJlIHNwcmVhZC4KPiAKPiBHdWVzdCB1c2Vk
IHZlY3RvcnMgY291bGQgY29udGludWUgdG8gdXNlIHRoZSBzYW1lIGFsbG9jYXRpb24KPiBtZWNo
YW5pc20sIHNpbmNlIHRoYXQncyBhIGRpZmZlcmVudCBpc3N1ZS4KClRoZSBpc3N1ZSB3b3VsZCBn
byBhd2F5IG9ubHkgaWYgZ3Vlc3QgdmVjdG9ycyBhcmUgYXQgc3RyaWN0bHkKbG93ZXIgcHJpb3Jp
dHkgdGhhbiBYZW4gb25lcy4gSS5lLiB3ZSdkIG5lZWQgdG8gZ28gaW4gc3RlcHMgb2YKMTYuIEFu
ZCB0aGVyZSBhcmVuJ3QgdGhhdCBtYW55IHZlY3RvcnMgLi4uIChJJ20gaGFwcHkgdG8gc2VlCmNo
YW5nZXMgaGVyZSwgYnV0IGl0J2xsIG5lZWQgdG8gYmUgdmVyeSBjYXJlZnVsIG9uZXMuKQoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
