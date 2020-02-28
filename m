Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF51733BE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7boa-0007yd-Sw; Fri, 28 Feb 2020 09:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7boZ-0007yR-H1
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:20:11 +0000
X-Inumbo-ID: 84a0258c-5a0b-11ea-98dc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84a0258c-5a0b-11ea-98dc-12813bfff9fa;
 Fri, 28 Feb 2020 09:20:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1801DAC4A;
 Fri, 28 Feb 2020 09:20:10 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200228071922.3983-1-jgross@suse.com>
 <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
 <47ddfaf8-273c-ab52-866d-52d0ca5f3aee@suse.com>
 <dfd112a4-04fc-8beb-a74c-89db85057906@suse.com>
 <451bc44f-2bbf-d55f-00a1-825d78ac6a3a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48404a5f-6ca5-7790-965f-fc3e8cdf55eb@suse.com>
Date: Fri, 28 Feb 2020 10:20:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <451bc44f-2bbf-d55f-00a1-825d78ac6a3a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: make sure stop_machine_run() is
 always called in a tasklet
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMDoxOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOC4wMi4yMCAx
MDoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjAyLjIwMjAgMDk6NTgsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyOC4wMi4yMCAwOToyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMjguMDIuMjAyMCAwODoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gV2l0aCBj
b3JlIHNjaGVkdWxpbmcgYWN0aXZlIGl0IGlzIG1hbmRhdG9yeSBmb3Igc3RvcF9tYWNoaW5lX3J1
bigpIHRvCj4+Pj4+IGJlIGNhbGxlZCBpbiBpZGxlIGNvbnRleHQgb25seSAoc28gZWl0aGVyIGR1
cmluZyBib290IG9yIGluIGEgdGFza2xldCksCj4+Pj4+IGFzIG90aGVyd2lzZSBhIHNjaGVkdWxp
bmcgZGVhZGxvY2sgd291bGQgb2NjdXI6IHN0b3BfbWFjaGluZV9ydW4oKQo+Pj4+PiBkb2VzIGEg
Y3B1IHJlbmRlenZvdXMgYnkgYWN0aXZhdGluZyBhIHRhc2tsZXQgb24gYWxsIG90aGVyIGNwdXMu
IEluCj4+Pj4+IGNhc2Ugc3RvcF9tYWNoaW5lX3J1bigpIHdhcyBub3QgY2FsbGVkIGluIGFuIGlk
bGUgdmNwdSBpdCB3b3VsZCBibG9jawo+Pj4+PiBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUgb24g
aXRzIHNpYmxpbmdzIHdpdGggY29yZSBzY2hlZHVsaW5nIGJlaW5nCj4+Pj4+IGFjdGl2ZSwgcmVz
dWx0aW5nIGluIGEgaGFuZy4KPj4+Pj4KPj4+Pj4gUHV0IGEgQlVHX09OKCkgaW50byBzdG9wX21h
Y2hpbmVfcnVuKCkgdG8gdGVzdCBmb3IgYmVpbmcgY2FsbGVkIGluIGFuCj4+Pj4+IGlkbGUgdmNw
dSBvbmx5IGFuZCBhZGFwdCB0aGUgbWlzc2luZyBjYWxsIHNpdGUgKHVjb2RlIGxvYWRpbmcpIHRv
IHVzZSBhCj4+Pj4+IHRhc2tsZXQgZm9yIGNhbGxpbmcgc3RvcF9tYWNoaW5lX3J1bigpLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+
Pj4+IC0tLQo+Pj4+PiBWMjoKPj4+Pj4gLSByZXBocmFzZSBjb21taXQgbWVzc2FnZSAoSnVsaWVu
IEdyYWxsKQo+Pj4+PiAtLS0KPj4+Pj4gICAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICB8IDU0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+ICAg
IHhlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMgfCAgMSArCj4+Pj4+ICAgIDIgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBUaGVyZSdzIG5v
IG1lbnRpb24gYW55d2hlcmUgb2YgYSBjb25uZWN0aW9uIHRvIHlvdXIgUkNVIHNlcmllcywKPj4+
PiBub3IgdG8gcmN1X2JhcnJpZXIoKS4gWWV0IHRoZSBjaGFuZ2UgcHV0cyBhIG5ldyByZXN0cmlj
dGlvbiBhbHNvCj4+Pj4gb24gaXRzIHVzZSwgYW5kIGlpcmMgdGhpcyB3YXMgbWVudGlvbmVkIGlu
IHByaW9yIGRpc2N1c3Npb24uIERpZAo+Pj4+IEkgbWlzcyBhbnl0aGluZz8KPj4+Cj4+PiBCYXNp
Y2FsbHkgdGhpcyBwYXRjaCBtYWtlcyB0aGUgcmVzdHJpY3Rpb24gZXhwbGljaXQuIFdpdGhvdXQg
dGhlIHBhdGNoCj4+PiBzdG9wX21hY2hpbmVfcnVuKCkgYmVpbmcgY2FsbGVkIG91dHNpZGUgb2Yg
YSB0YXNrbGV0IHdvdWxkIGp1c3QgaGFuZwo+Pj4gd2l0aCBjb3JlIHNjaGVkdWxpbmcgYmVpbmcg
YWN0aXZlLiBOb3cgaXQgd2lsbCBjYXRjaCB0aG9zZSB2aW9sYXRpb25zCj4+PiBlYXJseSBldmVu
IHdpdGggY29yZSBzY2hlZHVsaW5nIGluYWN0aXZlLgo+Pj4KPj4+IE5vdGUgdGhhdCBjdXJyZW50
bHkgdGhlcmUgYXJlIG5vIHZpb2xhdGlvbnMgb2YgdGhpcyByZXN0cmljdGlvbiBhbnl3aGVyZQo+
Pj4gaW4gdGhlIGh5cGVydmlzb3Igb3RoZXIgdGhhbiB0aGUgb25lIGFkZHJlc3NlZCBieSB0aGlz
IHBhdGNoLgo+Pgo+PiBXZWxsLCB0aGVyZSBpcyBhIGNvbm5lY3Rpb24gdG8gY29yZSBzY2hlZHVs
aW5nLiBXaXRob3V0IGl0LCBpLmUuCj4+IHByaW9yIHRvIDQuMTMsIHRoZXJlIHdhcyBubyByZXN0
cmljdGlvbiBvbiB0aGUgcGxhY2VtZW50IG9mCj4+IHJjdV9iYXJyaWVyKCkgaW52b2NhdGlvbnMu
IEFjY29yZGluZyB0byB3aGF0IHlvdSBzYXkgYWJvdmUsIHRoZQo+PiByZXN0cmljdGlvbiB3YXMg
aW1wbGljaXRseSBpbnRyb2R1Y2VkIHdpdGggY29yZSBzY2hlZHVsaW5nLiBJdAo+PiBzaG91bGQg
aW1vIGJlIG1hZGUgZXhwbGljaXQgYnkgYXR0YWNoaW5nIGEgY29tbWVudCwgd2hpY2ggd291bGQK
Pj4gKGFnYWluIGltbykgYmVzdCBiZSBkb25lIGhlcmUgYmVjYXVzZSBub3cgeW91IGFsc28gbWFr
ZSB0aGlzCj4+IGNhc2UgY3Jhc2ggd2l0aG91dCBjb3JlIHNjaGVkdWxpbmcgaW4gdXNlLgo+IAo+
IE9rYXksIEknbGwgYWRkIGEgY29tbWVudCB0byBzdG9wX21hY2hpbmVfcnVuKCkgYW5kIHRvIHJj
dV9iYXJyaWVyKCkuIFRoZQo+IHJjdV9iYXJyaWVyKCkgY29tbWVudCB3aWxsIGJlIHRoZW4gcmVt
b3ZlZCBieSBteSByY3Ugc2VyaWVzIGFnYWluLgoKUmlnaHQgLSB0aGUgYWx0ZXJuYXRpdmUgdGhl
biB3b3VsZCBiZSB0byBjYWxsIG91dCBhIGRlcGVuZGVuY3kgb2YKdGhpcyBwYXRjaCBvbiB0aGF0
IHNlcmllcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
