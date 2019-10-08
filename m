Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D6CFBDC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 16:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHq4i-0005zS-SX; Tue, 08 Oct 2019 14:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N428=YB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHq4h-0005zM-Lg
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 14:02:51 +0000
X-Inumbo-ID: 4fa685b2-e9d4-11e9-9bee-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4fa685b2-e9d4-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 14:02:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C49B71570;
 Tue,  8 Oct 2019 07:02:48 -0700 (PDT)
Received: from [10.37.12.88] (unknown [10.37.12.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 656FF3F703;
 Tue,  8 Oct 2019 07:02:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
Date: Tue, 8 Oct 2019 15:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgSnVlcmdlbikKCkhpIFN0ZWZhbm8sCgpPbiAxMC84LzE5IDE6MTggQU0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPiBPbiBNb24sIDcgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDAzLzEwLzIwMTkgMDI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPj4+IE9uIEZyaSwgMjAgU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBUaGF0
J3Mgbm90IGNvcnJlY3QuIGFsbG9jX2Jvb3RfcGFnZXMoKSBpcyBhY3R1YWxseSBoZXJlIHRvIGFs
bG93IGR5bmFtaWMKPj4+PiBhbGxvY2F0aW9uIGJlZm9yZSB0aGUgbWVtb3J5IHN1YnN5c3RlbSAo
YW5kIHRoZXJlZm9yZSB0aGUgcnVudGltZSBhbGxvY2F0b3IpCj4+Pj4gaXMgaW5pdGlhbGl6ZWQu
Cj4+Pgo+Pj4gTGV0IG1lIGNoYW5nZSB0aGUgcXVlc3Rpb24gdGhlbjogaXMgdGhlIHN5c3RlbV9z
dGF0ZSA9PQo+Pj4gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgY2hlY2sgc3RyaWN0bHkgbmVjZXNzYXJ5
PyBJdCBsb29rcyBsaWtlIGl0IGlzIG5vdDoKPj4+IHRoZSBwYXRjaCB3b3VsZCB3b3JrIGV2ZW4g
aWYgaXQgd2FzIGp1c3Q6Cj4+Cj4+IEkgaGFkIGEgZmV3IHRob3VnaHRzIGFib3V0IGl0LiBPbiBB
cm0zMiwgdGhpcyBvbmx5IHJlYWxseSB3b3JrcyBmb3IKPj4gMzItYml0cyBtYWNoaW5lIGFkZHJl
c3MgKGl0IGNhbiBnbyB1cCB0byA0MC1iaXRzKS4gSSBoYXZlbid0IHJlYWxseQo+PiBmdWxseSBp
bnZlc3RpZ2F0ZWQgd2hhdCBjb3VsZCBnbyB3cm9uZywgYnV0IGl0IHdvdWxkIGJlIGJlc3QgdG8g
a2VlcCBpdAo+PiBvbmx5IGZvciBlYXJseSBib290Lgo+Pgo+PiBBbHNvLCBJIGRvbid0IHJlYWxs
eSB3YW50IHRvIHJlbHkgb24gdGhpcyAid29ya2Fyb3VuZCIgYWZ0ZXIgYm9vdC4gTWF5YmUKPj4g
d2Ugd291bGQgd2FudCB0byBrZWVwIHRoZW0gdW5tYXBwZWQgaW4gdGhlIGZ1dHVyZS4KPiAKPiBZ
ZXMsIG5vIHByb2JsZW1zLCB3ZSBhZ3JlZSBvbiB0aGF0LiBJIGFtIG5vdCBhc2tpbmcgaW4gcmVn
YXJkcyB0byB0aGUKPiBjaGVjayBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3Qg
d2l0aCB0aGUgZ29hbCBvZiBhc2tpbmcgeW91Cj4gdG8gZ2V0IHJpZCBvZiBpdC4gSSBhbSBmaW5l
IHdpdGgga2VlcGluZyB0aGUgY2hlY2suIChNYXliZSB3ZSB3YW50IHRvIGFkZAo+IGFuIGB1bmxp
a2VseSgpJyBhcm91bmQgdGhlIGNoZWNrLikKPiAKPiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5k
IHdoZXRoZXIgdGhlIGNvZGUgYWN0dWFsbHkgcmVsaWVzIG9uCj4gc3lzdGVtX3N0YXRlID09IFNZ
U19TVEFURV9lYXJseV9ib290LCBhbmQsIGlmIHNvLCB3aHkuIFRoZSBnb2FsIGlzIHRvCj4gbWFr
ZSBzdXJlIHRoYXQgaWYgdGhlcmUgYXJlIHNvbWUgbGltaXRhdGlvbnMgdGhhdCB0aGV5IGFyZSBk
b2N1bWVudGVkLAo+IG9yIGp1c3QgdG8gZG91YmxlLWNoZWNrIHRoYXQgdGhlcmUgYXJlIG5vIGxp
bWl0YXRpb25zLgoKVGhlIGNoZWNrIGlzIG5vdCBzdHJpY3RseSBuZWNlc3NhcnkuCgo+IAo+IElu
IHJlZ2FyZHMgdG8geW91ciBjb21tZW50IGFib3V0IG9ubHkgd29ya2luZyBmb3IgMzItYml0IGFk
ZHJlc3NlcyBvbgo+IEFybTMyLCB5b3UgaGF2ZSBhIHBvaW50LiBBdCBsZWFzdCB3ZSBzaG91bGQg
YmUgY2FyZWZ1bCB3aXRoIHRoZSBtZm4gdG8KPiB2YWRkciBjb252ZXJzaW9uIGJlY2F1c2UgbWZu
X3RvX21hZGRyIHJldHVybnMgYSBwYWRkcl90IHdoaWNoIGlzIDY0LWJpdAo+IGFuZCB2YWRkcl90
IGlzIDMyLWJpdC4gSSBpbWFnaW5lIHRoYXQgdGhlb3JldGljYWxseSwgZXZlbiB3aXRoCj4gc3lz
dGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290LCBpdCBjb3VsZCBnZXQgdHJ1bmNhdGVk
IHdpdGggdGhlCj4gd3JvbmcgY29tYmluYXRpb24gb2YgbWZuIGFuZCBwaHlzX29mZnNldC4KPiAK
PiBJZiBub3RoaW5nIGVsc2UsIG1heWJlIHdlIHNob3VsZCBhZGQgYSB0cnVuY2F0aW9uIGNoZWNr
IGZvciBzYWZldHk/CgpFeGNlcHQgdGhhdCBwaHlzX29mZnNldCBpcyBub3QgZGVmaW5lZCBjb3Jy
ZWN0bHksIHNvIHlvdXIgY2hlY2sgYmVsb3cgCndpbGwgYnJlYWsgc29tZSBzZXR1cCA6KC4gTGV0
J3MgdGFrZSB0aGUgZm9sbG93aW5nIGV4YW1wbGU6CgogICAgWGVuIGlzIGxvYWRlZCBhdCBQQSAw
eDEwMDAwMAoKVGhlIGJvb3Qgb2Zmc2V0IGlzIGNvbXB1dGVkIHVzaW5nIDMyLWJpdCBhZGRyZXNz
IChzZWUgaGVhZC5TKToKICAgICBQQSAtIFZBID0gMHgxMDAwMDAgLSAweDIwMDAwMAogICAgICAg
ICAgICAgPSAweGZmZjAwMDAwCgpUaGlzIHZhbHVlIHdpbGwgYmUgcGFzc2VkIHRvIEMgY29kZSBh
cyBhbiB1bnNpZ25lZCBsb25nLiBCdXQgdGhlbiB3ZSAKd2lsbCBzdG9yZSBpdCBpbiBhIHVpbnQ2
NF90L3BhZGRyX3QgKHNlZSBwaHlzX29mZnNldCB3aGljaCBpcyBzZXQgaW4gCnNldHVwX3BhZ2Vf
dGFibGVzKS4gQmVjYXVzZSB0aGlzIGlzIGEgY29udmVyc2lvbiBmcm9tIHVuc2lnbmVkIHRvIAp1
bnNpZ25lZCwgdGhlICJzaWduIGJpdCIgd2lsbCBub3QgYmUgcHJvcGFnYXRlZC4KClRoaXMgbWVh
bnMgdGhhdCBwaHlzX29mZnNldCB3aWxsIGJlIGVxdWFsIHRvIDB4ZmZmMDAwMDAgYW5kIG5vdCAK
MHhmZmZmZmZmZmZmZjAwMDAwIQoKVGhlcmVmb3JlIGlmIHdlIHRyeSB0byBjb252ZXJ0IDB4MTAw
MDAwICh3aGVyZSBYZW4gaGFzIGJlZW4gbG9hZGVkKSBiYWNrIAp0byBpdHMgVkEsIHRoZSByZXN1
bHRpbmcgdmFsdWUgd2lsbCBiZSAweGZmZmZmZmZmMDAyMDAxMDAuCgpMb29raW5nIGF0IHRoZSBj
b2RlLCBJIHRoaW5rIHB0ZV9vZl94ZW5hZGRyKCkgaGFzIGFsc28gdGhlIGV4YWN0IHByb2JsZW0u
IDooCgpJIGd1ZXNzIG5vYm9keSB0cmllZCB0byBsb2FkIFhlbiB0aGF0IGxvdyBpbiBtZW1vcnkg
b24gQXJtMzI/IEJ1dCB0aGF0J3MgCmdvaW5nIHRvIGJlIGRlZmluaXRlbHkgYW4gaXNzdWVzIHdp
dGggdGhlIG1lbW9yeSByZXdvcmsgSSBoYXZlIGluIG1pbmQuCgpJIGhhdmUgc29tZSBvdGhlciBp
bXBvcnRhbnQgd29yayB0byBmaW5pc2ggZm9yIFhlbiA0LjEzLiBTbyBJIGFtIAp0aGlua2luZyB0
byBkZWZlciB0aGUgcHJvYmxlbSBJIG1lbnRpb24gYWJvdmUgZm9yIHBvc3QgWGVuIDQuMTMuIApB
bHRob3VnaCwgdGhlIEdSVUIgaXNzdWVzIHdvdWxkIHN0aWxsIG5lZWQgdG8gYmUgZml4LiBBbnkg
b3BpbmlvbnM/CgpOb3RlIHRoYXQgdGhpcyBpcyBhbHNvIG1vcmUgcmVhc29ucyB0byBsaW1pdCB0
aGUgdXNlIG9mICJNQSAtIApwaHlzX29mZnNldCIuIFNvIHRoZSBtZXNzIGlzIGtlcHQgdG8gYm9v
dCBjb2RlLgoKPiBTb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nIGJ1dCB0aGF0IGlkZWFsbHkg
d291bGQgYmUgYXBwbGljYWJsZSB0bwo+IGFybTY0IHRvbyB3aXRob3V0IGhhdmluZyB0byBhZGQg
YW4gI2lmZGVmOgo+IAo+ICAgICAgcGFkZHJfdCBwYSA9IG1mbl90b19tYWRkcihtZm4pIC0gcGh5
c19vZmZzZXQ7Cj4gCj4gICAgICBpZiAoIHBhIDwgX2VuZCAmJiBpc19rZXJuZWwoKHZhZGRyX3Qp
cGEpICkKPiAgICAgICAgICByZXR1cm4gKGxwYWVfdCAqKSh2YWRkcl90KXBhOwoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
