Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D3BEF6C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:18:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQnY-0006dK-V6; Thu, 26 Sep 2019 10:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1NnS=XV=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1iDQnX-0006dF-JZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:14:55 +0000
X-Inumbo-ID: 56955688-e046-11e9-964e-12813bfff9fa
Received: from emh04.mail.saunalahti.fi (unknown [62.142.5.110])
 by localhost (Halon) with ESMTPS
 id 56955688-e046-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:13:52 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh04.mail.saunalahti.fi (Postfix) with ESMTP id 9E0B330074;
 Thu, 26 Sep 2019 13:13:50 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id DD00636C0F6; Thu, 26 Sep 2019 13:13:48 +0300 (EEST)
Date: Thu, 26 Sep 2019 13:13:47 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: "Spassov, Stanislav" <stanspas@amazon.de>
Message-ID: <20190926101347.GD28704@reaktio.net>
References: <1543976357-1053-1-git-send-email-chao.gao@intel.com>
 <2c0ad3bf96551ea6e96e812229507221b76876c6.camel@amazon.de>
 <20190913152818.GA688@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913152818.GA688@gao-cwp>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] [PATCH] xen: xen-pciback: Reset MSI-X state when
 exposing a device
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gU3RhbmlzbGF2LAoKT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6Mjg6MjBQTSArMDgw
MCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6MDI6MjRBTSAr
MDAwMCwgU3Bhc3NvdiwgU3RhbmlzbGF2IHdyb3RlOgo+ID5PbiBUaHUsIERlYyAxMywgMjAxOCBh
dCAwNzo1NCwgQ2hhbyBHYW8gd3JvdGU6Cj4gPj5PbiBUaHUsIERlYyAxMywgMjAxOCBhdCAxMjo1
NDo1MkFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24gMTMuMTIuMTggYXQg
MDQ6NDYsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4+Pj4gT24gV2VkLCBEZWMgMTIs
IDIwMTggYXQgMDg6MjE6MzlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+Pj4+Pj4g
T24gMTIuMTIuMTggYXQgMTY6MTgsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4+Pj4+
PiBPbiBXZWQsIERlYyAxMiwgMjAxOCBhdCAwMTo1MTowMUFNIC0wNzAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4+Pj4+Pj4+IE9uIDEyLjEyLjE4IGF0IDA4OjA2LCA8Y2hhby5nYW9AaW50ZWwu
Y29tPiB3cm90ZToKPiA+Pj4+Pj4+PiBPbiBXZWQsIERlYyAwNSwgMjAxOCBhdCAwOTowMTozM0FN
IC0wNTAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPj4+Pj4+Pj4+T24gMTIvNS8xOCA0OjMy
IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+Pj4+Pj4+Pj4gT24gV2VkLCBEZWMgMDUs
IDIwMTggYXQgMTA6MTk6MTdBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4gPj4+Pj4+Pj4+Pj4g
SSBmaW5kIHNvbWUgcGFzcy10aHJ1IGRldmljZXMgZG9uJ3Qgd29yayBhbnkgbW9yZSBhY3Jvc3Mg
Z3Vlc3QgcmVib290Lgo+ID4+Pj4+Pj4+Pj4+IEFzc2lnbmluZyBpdCB0byBhbm90aGVyIGd1ZXN0
IGFsc28gbWVldHMgdGhlIHNhbWUgaXNzdWUuIEFuZCB0aGUgb25seQo+ID4+Pj4+Pj4+Pj4+IHdh
eSB0byBtYWtlIGl0IHdvcmsgYWdhaW4gaXMgdW4tYmluZGluZyBhbmQgYmluZGluZyBpdCB0byBw
Y2liYWNrLgo+ID4+Pj4+Pj4+Pj4+IFNvbWVvbmUgcmVwb3J0ZWQgdGhpcyBpc3N1ZSBvbmUgeWVh
ciBhZ28gWzFdLiBNb3JlIGRldGFpbCBhbHNvIGNhbiBiZQo+ID4+Pj4+Pj4+Pj4+IGZvdW5kIGlu
IFsyXS4KPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IFRoZSByb290LWNhdXNlIGlzIFhlbidz
IGludGVybmFsIE1TSS1YIHN0YXRlIGlzbid0IHJlc2V0IHByb3Blcmx5Cj4gPj4+Pj4+Pj4+Pj4g
ZHVyaW5nIHJlYm9vdCBvciByZS1hc3NpZ25tZW50LiBJbiB0aGUgYWJvdmUgY2FzZSwgWGVuIHNl
dCBtYXNrYWxsIGJpdAo+ID4+Pj4+Pj4+Pj4+IHRvIG1hc2sgYWxsIE1TSSBpbnRlcnJ1cHRzIGFm
dGVyIGl0IGRldGVjdGVkIGEgcG90ZW50aWFsIHNlY3VyaXR5Cj4gPj4+Pj4+Pj4+Pj4gaXNzdWUu
IEV2ZW4gYWZ0ZXIgZGV2aWNlIHJlc2V0LCBYZW4gZGlkbid0IHJlc2V0IGl0cyBpbnRlcm5hbCBt
YXNrYWxsCj4gPj4+Pj4+Pj4+Pj4gYml0LiBBcyBhIHJlc3VsdCwgbWFza2FsbCBiaXQgd291bGQg
YmUgc2V0IGFnYWluIGluIG5leHQgd3JpdGUgdG8KPiA+Pj4+Pj4+Pj4+PiBNU0ktWCBtZXNzYWdl
IGNvbnRyb2wgcmVnaXN0ZXIuCj4gPj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+PiBHaXZlbiB0aGF0
IFBIWVNERVZPUFNfcHJlcGFyZV9tc2l4KCkgYWxzbyB0cmlnZ2VycyBYZW4gcmVzZXR0aW5nIE1T
SS1YCj4gPj4+Pj4+Pj4+Pj4gaW50ZXJuYWwgc3RhdGUgb2YgYSBkZXZpY2UsIHdlIGVtcGxveSBp
dCB0byBmaXggdGhpcyBpc3N1ZSByYXRoZXIgdGhhbgo+ID4+Pj4+Pj4+Pj4+IGludHJvZHVjaW5n
IGFub3RoZXIgZGVkaWNhdGVkIHN1Yi1oeXBlcmNhbGwuCj4gPj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+
Pj4+PiBOb3RlIHRoYXQgUEhZU0RFVk9QU19yZWxlYXNlX21zaXgoKSB3aWxsIGZhaWwgaWYgdGhl
IG1hcHBpbmcgYmV0d2Vlbgo+ID4+Pj4+Pj4+Pj4+IHRoZSBkZXZpY2UncyBtc2l4IGFuZCBwaXJx
IGhhcyBiZWVuIGNyZWF0ZWQuIFRoaXMgbGltaXRhdGlvbiBwcmV2ZW50cwo+ID4+Pj4+Pj4+Pj4+
IHVzIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiB3aGVuIGRldGFjaGluZyBhIGRldmljZSBmcm9tIGEg
Z3Vlc3QgZHVyaW5nCj4gPj4+Pj4+Pj4+Pj4gZ3Vlc3Qgc2h1dGRvd24uIFRodXMgaXQgaXMgY2Fs
bGVkIHJpZ2h0IGJlZm9yZSBjYWxsaW5nCj4gPj4+Pj4+Pj4+Pj4gUEhZU0RFVk9QU19wcmVwYXJl
X21zaXgoKS4KPiA+Pj4+Pj4+Pj4+IHMvUEhZU0RFVk9QUy9QSFlTREVWT1AvIChubyBmaW5hbCBT
KS4gQW5kIHRoZW4gSSB3b3VsZCBhbHNvIGRyb3AgdGhlCj4gPj4+Pj4+Pj4+PiAoKSBhdCB0aGUg
ZW5kIG9mIHRoZSBoeXBlcmNhbGwgbmFtZSBzaW5jZSBpdCdzIG5vdCBhIGZ1bmN0aW9uLgo+ID4+
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IEknbSBhbHNvIHdvbmRlcmluZyB3aHkgdGhlIHJlbGVhc2Ug
Y2FuJ3QgYmUgZG9uZSB3aGVuIHRoZSBkZXZpY2UgaXMKPiA+Pj4+Pj4+Pj4+IGRldGFjaGVkIGZy
b20gdGhlIGd1ZXN0IChvciB0aGUgZ3Vlc3QgaGFzIGJlZW4gc2h1dCBkb3duKS4gVGhpcyBtYWtl
cwo+ID4+Pj4+Pj4+Pj4gbWUgd29ycnkgYWJvdXQgdGhlIHJhY2luZXNzIG9mIHRoZSBhdHRhY2gv
ZGV0YWNoIHByb2NlZHVyZTogaWYgdGhlcmUncwo+ID4+Pj4+Pj4+Pj4gYSBzdGF0ZSB3aGVyZSBw
Y2liYWNrIGFzc3VtZXMgdGhlIGRldmljZSBoYXMgYmVlbiBkZXRhY2hlZCBmcm9tIHRoZQo+ID4+
Pj4+Pj4+Pj4gZ3Vlc3QsIGJ1dCB0aGVyZSBhcmUgc3RpbGwgcGlycXMgYm91bmQsIGFuIGF0dGVt
cHQgdG8gYXR0YWNoIHRvCj4gPj4+Pj4+Pj4+PiBhbm90aGVyIGd1ZXN0IGluIHN1Y2ggc3RhdGUg
d2lsbCBmYWlsLgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pkkgd29uZGVyIHdoZXRoZXIgdGhpcyBh
ZGRpdGlvbmFsIHJlc2V0IGZ1bmN0aW9uYWxpdHkgY291bGQgYmUgZG9uZSBvdXQKPiA+Pj4+Pj4+
Pj5vZiB4ZW5fcGNpYmtfeGVuYnVzX3JlbW92ZSgpLiBXZSBmaXJzdCBkbyBhIChiZXN0IGVmZm9y
dCkgZGV2aWNlIHJlc2V0Cj4gPj4+Pj4+Pj4+YW5kIHRoZW4gZG8gdGhlIGV4dHJhIHRoaW5ncyB0
aGF0IGFyZSBub3QgcHJvcGVybHkgZG9uZSB0aGVyZS4KPiA+Pj4+Pj4+PiAKPiA+Pj4+Pj4+PiBO
by4gSXQgY2Fubm90IGJlIGRvbmUgaW4geGVuX3BjaWJrX3hlbmJ1c19yZW1vdmUoKSB3aXRob3V0
IG1vZGlmeWluZwo+ID4+Pj4+Pj4+IHRoZSBoYW5kbGVyIG9mIFBIWVNERVZPUF9yZWxlYXNlX21z
aXguIFRvIGRvIGEgc3VjY2Vzc2Z1bCBYZW4gaW50ZXJuYWwKPiA+Pj4+Pj4+PiBNU0ktWCBzdGF0
ZSByZXNldCwgUEhZU0RFVk9QX3tyZWxlYXNlLCBwcmVwYXJlfV9tc2l4IHNob3VsZCBiZSBmaW5p
c2hlZAo+ID4+Pj4+Pj4+IHdpdGhvdXQgZXJyb3IuIEJ1dCBBVE0sIHhlbiBleHBlY3RzIHRoYXQg
bm8gbXNpIGlzIGJvdW5kIHRvIHBpcnEgd2hlbgo+ID4+Pj4+Pj4+IGRvaW5nIFBIWVNERVZPUF9y
ZWxlYXNlX21zaXguIE90aGVyd2lzZSBpdCBmYWlscyB3aXRoIGVycm9yIGNvZGUgLUVCVVNZLgo+
ID4+Pj4+Pj4+IEhvd2V2ZXIsIHRoZSBleHBlY3RhdGlvbiBpc24ndCBndWFyYW50ZWVkIGluIHhl
bl9wY2lia194ZW5idXNfcmVtb3ZlKCkuCj4gPj4+Pj4+Pj4gSW4gc29tZSBjYXNlcywgaWYgcWVt
dSBmYWlscyB0byB1bm1hcCBNU0lzLCBNU0lzIGFyZSB1bm1hcHBlZCBieSBYZW4KPiA+Pj4+Pj4+
PiBhdCBsYXN0IG1pbnV0ZSwgd2hpY2ggaGFwcGVucyBhZnRlciBkZXZpY2UgcmVzZXQgaW4gCj4g
Pj4+Pj4+Pj4geGVuX3BjaWJrX3hlbmJ1c19yZW1vdmUoKS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PkJ1
dCB0aGF0IG1heSBuZWVkIHRha2luZyBjYXJlIG9mOiBJIGRvbid0IHRoaW5rIGl0IGlzIGEgZ29v
ZCBpZGVhIHRvIGhhdmUKPiA+Pj4+Pj4+YW55dGhpbmcgbGVmdCBmcm9tIHRoZSBwcmlvciBvd25p
bmcgZG9tYWluIHdoZW4gdGhlIGRldmljZSBnZXRzIHJlc2V0Lgo+ID4+Pj4+Pj5JLmUuIGxlZnQg
b3ZlciBJUlEgYmluZGluZ3Mgc2hvdWxkIHBlcmhhcHMgYmUgZm9yY2libHkgY2xlYXJlZCBiZWZv
cmUKPiA+Pj4+Pj4+aW52b2tpbmcgdGhlIHJlc2V0Owo+ID4+Pj4+PiAKPiA+Pj4+Pj4gQWdyZWUu
IEhvdyBhYm91dCBwY2liYWNrIHRvIHRyYWNrIHRoZSBlc3RhYmxpc2hlZCBJUlEgYmluZGluZ3M/
IFRoZW4KPiA+Pj4+Pj4gcGNpYmFjayBjYW4gY2xlYXIgaXJxIGJpbmRpbmcgYmVmb3JlIGludm9r
aW5nIHRoZSByZXNldC4KPiA+Pj4+Pgo+ID4+Pj4+SG93IHdvdWxkIHBjaWJhY2sgZXZlbiBrbm93
IG9mIHRob3NlIG1hcHBpbmdzLCB3aGVuIGl0J3MgcWVtdQo+ID4+Pj4+d2hvIGVzdGFibGlzaGVz
IChhbmQgbWFuYWdlcykgdGhlbT8KPiA+Pj4+IAo+ID4+Pj4gSSBtZWFudCB0byBleHBvc2Ugc29t
ZSBpbnRlcmZhY2VzIGZyb20gcGNpYmFjay4gQW5kIHBjaWJhY2sgc2VydmVzCj4gPj4+PiBhcyB0
aGUgcHJveHkgb2YgSVJRICh1biliaW5kaW5nIEFQSXMuCj4gPj4+Cj4gPj4+SWYgYXQgYWxsIHBv
c3NpYmxlIHdlIHNob3VsZCBhdm9pZCBoYXZpbmcgdG8gY2hhbmdlIG1vcmUgcGFydGllcyAocWVt
dSwKPiA+Pj5saWJ4Yywga2VybmVsLCBoeXBlcnZpc29yKSB0aGFuIHJlYWxseSBuZWNlc3Nhcnku
IFJlbWVtYmVyIHRoYXQgc3VjaAo+ID4+PmEgYnVnIGZpeCBtYXkgd2FudCBiYWNrcG9ydGluZywg
YW5kIG1ha2luZyBzdXJlIGFmZmVjdGVkIHBlb3BsZSBoYXZlCj4gPj4+YWxsIHJlbGV2YW50IGNv
bXBvbmVudHMgdXBkYXRlZCBpcyBpbmNyZWFzaW5nbHkgZGlmZmljdWx0IHdpdGggdGhlaXIKPiA+
Pj5udW1iZXIgZ3Jvd2luZy4KPiA+Pj4KPiA+Pj4+Pj4+aW4gZmFjdCBJJ2QgZXhwZWN0IHRoaXMg
dG8gaGFwcGVuIGluIHRoZSBjb3Vyc2Ugb2YKPiA+Pj4+Pj4+ZG9tYWluIGRlc3RydWN0aW9uLCBh
bmQgSSdkIGV4cGVjdCB0aGUgZGV2aWNlIHJlc2V0IHRvIGNvbWUgYWZ0ZXIgdGhlCj4gPj4+Pj4+
PmRvbWFpbiB3YXMgY2xlYW5lZCB1cC4gUGVyaGFwcyBzaW1wbHkgYW4gb3JkZXJpbmcgaXNzdWUg
aW4gdGhlIHRvb2wKPiA+Pj4+Pj4+c3RhY2s/Cj4gPj4+Pj4+IAo+ID4+Pj4+PiBJIGRvbid0IHRo
aW5rIHJldmVyc2luZyB0aGUgc2VxdWVuY2VzIG9mIGRldmljZSByZXNldCBhbmQgZG9tYWluCj4g
Pj4+Pj4+IGRlc3RydWN0aW9uIHdvdWxkIGJlIHNpbXBsZS4gRnVydGhlcm1vcmUsIGR1cmluZyBk
ZXZpY2UgaG90LXVucGx1ZywKPiA+Pj4+Pj4gZGV2aWNlIHJlc2V0IGlzIGRvbmUgd2hlbiB0aGUg
b3duZXIgaXMgYWxpdmUuIFNvIGlmIHdlIHVzZSBkb21haW4KPiA+Pj4+Pj4gZGVzdHJ1Y3Rpb24g
dG8gZW5mb3JjZSBhbGwgaXJxIGJpbmRpbmcgY2xlYXJlZCwgaW4gdGhlb3J5LCBpdCB3b24ndCBi
ZQo+ID4+Pj4+PiBhcHBsaWNhYmxlIHRvIGhvdC11bnBsdWcgY2FzZSAoaWYgcWVtdSdzIGhvdC11
bnBsdWcgbG9naWMgaXMKPiA+Pj4+Pj4gY29tcHJvbWlzZWQpLgo+ID4+Pj4+Cj4gPj4+Pj5FdmVu
IGluIHRoZSBob3QtdW5wbHVnIGNhc2UgdGhlIHRvb2wgc3RhY2sgY291bGQgaXNzdWUgdW5iaW5k
Cj4gPj4+Pj5yZXF1ZXN0cywgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBwb3NzaWJseSBjb21wcm9t
aXNlZCBxZW11LAo+ID4+Pj4+b25jZSBuZWl0aGVyIHRoZSBndWVzdCBub3IgcWVtdSBoYXZlIGFj
Y2VzcyB0byB0aGUgZGV2aWNlCj4gPj4+Pj5hbnltb3JlLgo+ID4+Pj4gCj4gPj4+PiBCdXQgY3Vy
cmVudGx5LCB0b29sIHN0YWNrIGRvZXNuJ3Qga25vdyB0aGUgcmVtYWluaW5nIElSUSBiaW5kaW5n
cy4KPiA+Pj4+IElmIHRvb2wgc3RhY2sgY2FuIG1haW50YWluZSBJUlEgYmluZGluZyBpbmZvcm1h
dGlvbiBvZiBhIHBhc3MtdGhydQo+ID4+Pj4gZGV2aWNlIChzdG9yZWQgaW4gWGVuc3RvcmU/KSwg
d2UgY2FuIGNvbWUgdXAgd2l0aCBhIGNsZWFuIHNvbHV0aW9uCj4gPj4+PiB3aXRob3V0IG1vZGlm
eWluZyBsaW51eCBrZXJuZWwgYW5kIFhlbi4KPiA+Pj4KPiA+Pj5JZiB0aGVyZSdzIG5vIHdheSBm
b3IgdGhlIHRvb2wgc3RhY2sgdG8gZWl0aGVyIGZpbmQgb3V0IHRoZSBiaW5kaW5ncwo+ID4+Pm9y
ICJibGluZGx5IiBpc3N1ZSB1bmJpbmQgcmVxdWVzdHMgKGFjY2VwdGluZyB0aGVtIHRvIGZhaWwp
LCB0aGVuIGEKPiA+Pj4id2lsZGNhcmQiIHVuYmluZCBvcGVyYXRpb24gbWF5IHdhbnQgYWRkaW5n
LiBPciwgcGVyaGFwcyBldmVuCj4gPj4+YmV0dGVyLCBYRU5fRE9NQ1RMX2RlYXNzaWduX2Rldmlj
ZSBjb3VsZCB1bmJpbmQgYW55dGhpbmcgbGVmdAo+ID4+PmluIHBsYWNlIGZvciB0aGUgc3BlY2lm
aWVkIGRldmljZS4KPiA+Pgo+ID4+R29vZCBpZGVhLiBJIHdpbGwgdGFrZSB0aGlzIGFkdmljZS4K
PiA+Pgo+ID4+VGhhbmtzCj4gPj5DaGFvCj4gPgo+ID5JIGFtIGhhdmluZyB0aGUgc2FtZSBpc3N1
ZSwgYW5kIGNhbm5vdCBmaW5kIGEgZml4IGluIGVpdGhlciB4ZW4tcGNpYmFjayBvciB0aGUgWGVu
IGNvZGViYXNlLgo+ID5XYXMgYSBzb2x1dGlvbiBldmVyIHB1c2hlZCBhcyBhIHJlc3VsdCBvZiB0
aGlzIHRocmVhZD8KPiA+Cj4gCj4gSSBzdWJtaXR0ZWQgcGF0Y2hlcyBbMV0gdG8gWGVuIGNvbW11
bml0eS4gQnV0IEkgZGlkbid0IGdldCBpdCBtZXJnZWQuCj4gV2UgbWFkZSBhIGNoYW5nZSBpbiBk
ZXZpY2UgZHJpdmVyIHRvIGRpc2FibGUgTVNJLVggZHVyaW5nIGd1ZXN0IE9TCj4gc2h1dGRvd24g
dG8gbWl0aWdhdGUgdGhlIGlzc3VlLiBCdXQgd2hlbiBndWVzdCBvciBxZW11IHdhcyBjcmFzaGVk
LCB3ZQo+IGVuY291bnRlcmVkIHRoaXMgaXNzdWUgYWdhaW4uIEkgaGF2ZSBubyBwbGFuIHRvIGdl
dCBiYWNrIHRvIHRoZXNlCj4gcGF0Y2hlcy4gQnV0IGlmIHlvdSB3YW50IHRvIGZpeCB0aGUgaXNz
dWUgY29tcGxldGVseSBhbG9uZyB3aGF0IHRoZQo+IHBhdGNoZXMgYmVsb3cgZGlkLCBwbGVhc2Ug
Z28gYWhlYWQuCj4gCj4gWzFdOiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTktMDEvbXNnMDEyMjcuaHRtbAo+IAo+IFRoYW5rcwo+IENoYW8K
PiAKClN0YW5pc2xhdjogQXJlIHlvdSBhYmxlIHRvIGNvbnRpbnVlIHRoZSB3b3JrIHdpdGggdGhl
c2UgcGF0Y2hlcywgdG8gZ2V0IHRoZW0gbWVyZ2VkPyAKCgpUaGFua3MsCgotLSBQYXNpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
