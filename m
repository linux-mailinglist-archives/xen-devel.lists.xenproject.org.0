Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBF162AC6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:36:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j45oR-0006GK-W0; Tue, 18 Feb 2020 16:33:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j45oQ-0006GB-P3
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:33:30 +0000
X-Inumbo-ID: 64a6e7fa-526c-11ea-81d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64a6e7fa-526c-11ea-81d9-12813bfff9fa;
 Tue, 18 Feb 2020 16:33:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9543CC1B8;
 Tue, 18 Feb 2020 16:33:28 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <20200218112238.GT4679@Air-de-Roger>
 <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
 <20200218114602.GU4679@Air-de-Roger>
 <4509c89d-78ea-18e1-843d-905c617b7bd6@citrix.com>
 <20200218144300.GW4679@Air-de-Roger>
 <60449074-9272-351e-b7ae-d400634b727f@citrix.com>
 <1b36b2e7-eda8-4702-9f28-390e04a3b9f1@suse.com>
 <20200218161807.GX4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88961dc3-1351-a563-4f90-068d21190ac7@suse.com>
Date: Tue, 18 Feb 2020 17:33:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218161807.GX4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAyMCAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxOCwgMjAyMCBhdCAwNDo0MDoyOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTguMDIuMjAyMCAxNjozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDE4LzAyLzIwMjAg
MTQ6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT0ssIHNvIHdoYXQgYWJvdXQ6Cj4+
Pj4KPj4+PiBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQo+Pj4+IHsKPj4+PiAgICAgYm9vbCB4
MmFwaWMgPSBjdXJyZW50X2xvY2FsX2FwaWNfbW9kZSgpID09IEFQSUNfTU9ERV9YMkFQSUM7Cj4+
Pj4gICAgIHVuc2lnbmVkIGludCBpY3IyOwo+Pj4+Cj4+Pj4gICAgIC8qCj4+Pj4gICAgICAqIFdo
ZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUgcGVyLUNQVSBzY3Jh
dGNoIG1hc2sKPj4+PiAgICAgICogYmVjYXVzZSB3ZSBoYXZlIG5vIHdheSB0byBhdm9pZCByZWVu
dHJ5LCBzbyBkbyBub3QgdXNlIHRoZSBBUElDCj4+Pj4gICAgICAqIHNob3J0aGFuZC4gVGhlIG9u
bHkgSVBJIHRoYXQgc2hvdWxkIGJlIHNlbnQgZnJvbSBzdWNoIGNvbnRleHQKPj4+PiAgICAgICog
aXMgYSAjTk1JIHRvIHNodXRkb3duIHRoZSBzeXN0ZW0gaW4gY2FzZSBvZiBhIGNyYXNoLgo+Pj4+
ICAgICAgKi8KPj4+PiAgICAgQVNTRVJUKHZlY3RvciA9PSBBUElDX0RNX05NSSk7Cj4+Pj4gICAg
IGlmICggIXgyYXBpYyApCj4+Pj4gICAgICAgICBpY3IyID0gYXBpY19yZWFkKEFQSUNfSUNSMik7
Cj4+Pj4gICAgIGFsdGVybmF0aXZlX3ZjYWxsKGdlbmFwaWMuc2VuZF9JUElfbWFzaywgbWFzaywg
dmVjdG9yKTsKPj4+PiAgICAgaWYgKCAheDJhcGljICkKPj4+PiAgICAgICAgIGFwaWNfd3JpdGUo
QVBJQ19JQ1IyLCBpY3IyKTsKPj4+Pgo+Pj4+ICAgICByZXR1cm47Cj4+Pj4gfQo+Pj4+Cj4+Pj4g
SSdtIHVuc3VyZSBhcyB0byB3aGV0aGVyIHRoZSBhc3NlcnQgaXMgYWN0dWFsbHkgaGVscGZ1bCwg
YnV0IHdvdWxkCj4+Pj4gbGlrZSB0byBzZXR0bGUgdGhpcyBiZWZvcmUgc2VuZGluZyBhIG5ldyB2
ZXJzaW9uLgo+Pj4KPj4+IEkgY2FuIG9ubHkgcmVwZWF0IG15IHByZXZpb3VzIGVtYWlsIChxdWVz
dGlvbnMgYW5kIHN0YXRlbWVudHMpLgo+Pj4KPj4+ICpBbnkqIGxvZ2ljIGluc2lkZSAiaWYgKCBp
bl9tYygpIHx8IGluX25taSgpICkiIGNhbid0IGJlIHRlc3RlZAo+Pj4gdXNlZnVsbHksIG1ha2lu
ZyBpdCBwcm9ibGVtYXRpYyBhcyBhIHNhbml0eSBjaGVjay4KPiAKPiBSaWdodCwgc28gd2hhdCBh
Ym91dCBrZWVwaW5nIHRoZSBsb2dpYyBpbiAiaWYgKCBpbl9tYygpIHx8IGluX25taSgpICkiCj4g
dXNpbmcgdGhlIGNvZGUgYXMgaXQgd2FzIHByZXZpb3VzIHRvIGludHJvZHVjaW5nIHRoZSBzaG9y
dGhhbmQsIGllOgo+IAo+IGlmICggaW5fbWMoKSB8fCBpbl9ubWkoKSApCj4gewo+ICAgICBhbHRl
cm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rvcik7Cj4gICAg
IHJldHVybjsKPiB9Cj4gCj4gVGhhdCB3b3VsZCBiZSBleGFjdGx5IHdoYXQgc2VuZF9JUElfbWFz
ayB3b3VsZCBkbyBwcmlvciB0byB0aGUKPiBpbnRyb2R1Y3Rpb24gb2YgdGhlIHNob3J0aGFuZCAo
cHJlIDU1MDBkMjY1YTJhOGYpLCBhbmQgSSB0aGluawo+IGl0J3MgYSBjb21wcm9taXNlIGJldHdl
ZW4gImRvbid0IGRvIGFueXRoaW5nIiBhbmQgImxldCdzIHRyeSB0byBoYW5kbGUKPiB0aGlzIGlu
IGEgbm9uLWJyb2tlbiB3YXkiLgo+IAo+IFVzaW5nIHRoZSBzaG9ydGhhbmQgYWRkcyBtb3JlIGxv
Z2ljLCB3aGljaCB3ZSB3b3VsZCBsaWtlIHRvIGF2b2lkIGluCj4gc3VjaCBjcml0aWNhbCBjcmFz
aCBwYXRocywgc28gbGV0J3MgdHJ5IHRvIGF2b2lkIGFzIG11Y2ggYXMgcG9zc2libGUKPiBieSBq
dXN0IGZhbGxpbmcgYmFjayB0byB3aGF0IHdhcyB0aGVyZSBwcmV2aW91c2x5Lgo+IAo+Pj4gKEZv
ciB0aGlzIHZlcnNpb24gb2YgdGhlIGNvZGUgc3BlY2lmaWNhbGx5LCB5b3UgYWJzb2x1dGVseSBk
b24ndCB3YW50IHRvCj4+PiBiZSByZWFkaW5nIE1TUl9BUElDX0JBU0UgZXZlcnkgdGltZSwgYW5k
IHdoZW4gd2UncmUgb24gdGhlIGNyYXNoIHBhdGgKPj4+IHNlbmRpbmcgTk1Jcywgd2UgZG9uJ3Qg
Y2FyZSBhdCBhbGwgYWJvdXQgY2xvYmJlcmluZyBJQ1IyLikKPj4+Cj4+PiBEb2luZyBub3RoaW5n
LCBpcyBsZXNzIGJhZCB0aGFuIGRvaW5nIHRoaXMuwqAgVGhlcmUgaXMgbm8gcG9pbnQgdHJ5aW5n
IHRvCj4+PiBjb3BlIHdpdGggYSBjb3JuZXIgY2FzZSB3ZSBkb24ndCBzdXBwb3J0LCBhbmQgdGhl
cmUgaXMgbm90aGluZyB5b3UgY2FuCj4+PiBkbywgc2FuaXR5IHdpc2UsIHdoaWNoIGRvZXNuJ3Qg
Y29tZSB3aXRoIGEgaGlnaCBjaGFuY2Ugb2YgYmxvd2luZyB1cAo+Pj4gZmlyc3QgaW4gYSBjdXN0
b21lciBlbnZpcm9ubWVudC4KPj4+Cj4+PiBMaXRlcmFsbHksIGRvIG5vdGhpbmcuwqAgSXQgaXMg
dGhlIGxlYXN0IGJhZCBvcHRpb24gZ29pbmcuCj4+Cj4+IEkgdGhpbmsgeW91J3JlIGEgbGl0dGxl
IHRvbyBmb2N1c2VkIG9uIHRoZSBjcmFzaCBwYXRoLiBEb2luZyBub3RoaW5nCj4+IGhlcmUgbGlr
ZWx5IG1lYW5zIGhhdmluZyBwcm9ibGVtcyBsYXRlciBpZiB3ZSBnZXQgaW50byBoZXJlLCBpbiBh
Cj4+IGZhciBoYXJkZXIgdG8gZGVidWcgbWFubmVyLiBNYXkgSSBzdWdnZXN0IHdlIGludHJvZHVj
ZSBlLmcuCj4+IFNZU19TVEFURV9jcmFzaGVkLCBhbmQgYnlwYXNzIGFueSBzdWNoIHBvdGVudGlh
bGx5IHByb2JsZW1hdGljCj4+IGNoZWNrcyBpZiBpbiB0aGlzIHN0YXRlPyBZb3VyIGFyZ3VtZW50
IGFib3V0IG5vdCBiZWluZyBhYmxlIHRvIHRlc3QKPj4gdGhlc2UgcGF0aHMgYXBwbGllcyB0byBh
ICJkb24ndCBkbyBhbnl0aGluZyIgYXBwcm9hY2ggYXMgd2VsbCwgYWZ0ZXIKPj4gYWxsIC0gd2Ug
d29uJ3Qga25vdyBpZiB0aGUgYWJzZW5jZSBvZiBhbnkgZXh0cmEgbG9naWMgaXMgZmluZSB1bnRp
bAo+PiBzb21lb25lIChwZXJoYXBzIGV2ZW4gbXVsdGlwbGUgInNvbWVvbmUiLXMpIGFjdHVhbGx5
IGhpdCB0aGF0IHBhdGguCj4gCj4gSW50cm9kdWNpbmcgc3VjaCBzdGF0ZSB3b3VsZCBiZSBhbm90
aGVyIG9wdGlvbiAob3IgYSBmdXJ0aGVyCj4gaW1wcm92ZW1lbnQpLCBidXQgd2Ugc3RpbGwgbmVl
ZCB0byBoYW5kbGUgd2hhdCBoYXBwZW5zIHdoZW4KPiBzZW5kX0lQSV9tYXNrIGdldHMgY2FsbGVk
IGZyb20gbm9uLW1hc2thYmxlIGludGVycnVwdCBjb250ZXh0LCBiZWNhdXNlCj4gdXNpbmcgdGhl
IHBlci1DUFUgbWFzayBpbiB0aGF0IGNvbnRleHQgaXMgZGVmaW5pdGVseSBub3Qgc2FmZQo+IChy
ZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQncyBhIGNyYXNoIHBhdGggb3Igbm90KS4KPiAKPiBGYWxs
aW5nIGJhY2sgdG8gbm90IHVzaW5nIHRoZSBzaG9ydGhhbmQgaW4gc3VjaCBjb250ZXh0cyBzZWVt
cyBsaWtlIGEKPiBnb29kIGNvbXByb21pc2U6IGl0J3Mgbm90IGFkZGluZyBuZXcgbG9naWMsIGp1
c3QgcmVzdG9yaW5nIHRoZSBsb2dpYwo+IHByaW9yIHRvIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhl
IHNob3J0aGFuZC4KCkknZCBiZSBva2F5IHdpdGggdGhpcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
