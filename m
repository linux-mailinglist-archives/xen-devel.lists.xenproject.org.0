Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13213CBBB2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNfC-0008HI-Sm; Fri, 04 Oct 2019 13:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGNfB-0008H5-8D
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:30:29 +0000
X-Inumbo-ID: 20deaf1a-e6ab-11e9-9756-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20deaf1a-e6ab-11e9-9756-12813bfff9fa;
 Fri, 04 Oct 2019 13:30:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45257B193;
 Fri,  4 Oct 2019 13:30:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
 <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
Date: Fri, 4 Oct 2019 15:30:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMjAxOSAxNToxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wOS8yMDE5
IDE1OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQEAgLTEwNjgsOCArMTA2NywyOSBAQCBzdGF0
aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIElPTU1VX1BQUl9MT0dfREVGQVVMVF9FTlRSSUVTLCAiUFBSIExvZyIp
Owo+PiAgfQo+PiAgCj4+ICsvKgo+PiArICogV2l0aGluIGl2cnNfbWFwcGluZ3NbXSB3ZSBhbGxv
Y2F0ZSBhbiBleHRyYSBhcnJheSBlbGVtZW50IHRvIHN0b3JlCj4+ICsgKiAtIHNlZ21lbnQgbnVt
YmVyLAo+PiArICogLSBkZXZpY2UgdGFibGUuCj4+ICsgKi8KPj4gKyNkZWZpbmUgSVZSU19NQVBQ
SU5HU19TRUcobSkgKG0pW2l2cnNfYmRmX2VudHJpZXNdLmR0ZV9yZXF1ZXN0b3JfaWQKPj4gKyNk
ZWZpbmUgSVZSU19NQVBQSU5HU19ERVZUQUIobSkgKG0pW2l2cnNfYmRmX2VudHJpZXNdLmludHJl
bWFwX3RhYmxlCj4+ICsKPj4gK3N0YXRpYyB2b2lkIF9faW5pdCBmcmVlX2l2cnNfbWFwcGluZyh2
b2lkICpwdHIpCj4+ICt7Cj4+ICsgICAgY29uc3Qgc3RydWN0IGl2cnNfbWFwcGluZ3MgKml2cnNf
bWFwcGluZ3MgPSBwdHI7Cj4gCj4gSG93IGFic29sdXRlbHkgY2VydGFpbiBhcmUgd2UgdGhhdCBw
dHIgd2lsbCBuZXZlciBiZSBOVUxMPwoKQXMgY2VydGFpbiBhcyB3ZSBjYW4gYmUgYnkgbmV2ZXIg
aW5zdGFsbGluZyBhIE5VTEwgcG9pbnRlciBpbnRvIHRoZQpyYWRpeCB0cmVlLCBhbmQgYnkgb2Jz
ZXJ2aW5nIHRoYXQgbmVpdGhlciByYWRpeF90cmVlX2Rlc3Ryb3koKSBub3IKcmFkaXhfdHJlZV9u
b2RlX2Rlc3Ryb3koKSB3b3VsZCBldmVyIGNhbGwgdGhlIGNhbGxiYWNrIGZvciBhIE5VTEwKbm9k
ZS4KCj4gSXQgbWlnaHQgYmUgYmV0dGVyIHRvIHJlbmFtZSB0aGlzIHRvIHJhZGl4X3RyZWVfZnJl
ZV9pdnJzX21hcHBpbmdzKCkgdG8KPiBtYWtlIGl0IGNsZWFyIHdobyBjYWxscyBpdCwgYW5kIGFs
c28gcHJvdmlkZSBhIGhpbnQgYXMgdG8gd2h5IHRoZQo+IHBhcmFtZXRlciBpcyB2b2lkLgoKSSdt
IG5vdCBoYXBweSB0byBhZGQgYSByYWRpeF90cmVlXyBwcmVmaXg7IEknZCBiZSBmaW5lIHdpdGgg
YWRkaW5nCmUuZy4gZG9fIGluc3RlYWQsIGluIGNhc2UgdGhpcyBwcm92aWRlcyBlbm91Z2ggb2Yg
YSBoaW50IGZvciB5b3VyCnRhc3RlIHRoYXQgdGhpcyBpcyBhY3R1YWxseSBhIGNhbGxiYWNrIGZ1
bmN0aW9uLgoKPj4gQEAgLTEwODIsMTMgKzExMDIsMTUgQEAgc3RhdGljIGludCBfX2luaXQgYW1k
X2lvbW11X2luaXRfb25lKHN0cgo+PiAgICAgIGlmICggaW50ciAmJiAhc2V0X2lvbW11X2ludGVy
cnVwdF9oYW5kbGVyKGlvbW11KSApCj4+ICAgICAgICAgIGdvdG8gZXJyb3Jfb3V0Owo+PiAgCj4+
IC0gICAgLyogVG8gbWFrZSBzdXJlIHRoYXQgZGV2aWNlX3RhYmxlLmJ1ZmZlciBoYXMgYmVlbiBz
dWNjZXNzZnVsbHkgYWxsb2NhdGVkICovCj4+IC0gICAgaWYgKCBkZXZpY2VfdGFibGUuYnVmZmVy
ID09IE5VTEwgKQo+PiArICAgIC8qIE1ha2Ugc3VyZSB0aGF0IHRoZSBkZXZpY2UgdGFibGUgaGFz
IGJlZW4gc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZC4gKi8KPj4gKyAgICBpdnJzX21hcHBpbmdzID0g
Z2V0X2l2cnNfbWFwcGluZ3MoaW9tbXUtPnNlZyk7Cj4+ICsgICAgaWYgKCAhSVZSU19NQVBQSU5H
U19ERVZUQUIoaXZyc19tYXBwaW5ncykgKQo+IAo+IFRoaXMgaXMgc3RpbGwgZ29pbmcgdG8gY3Jh
c2ggd2l0aCBhIE5VTEwgcG9pbnRlciBkZWZlcmVuY2UgaW4gdGhlIGNhc2UKPiBkZXNjcmliZWQg
YnkgdGhlIGNvbW1lbnQuwqAgKFRoZW4gYWdhaW4sIGl0IG1heSBub3QgY3Jhc2gsIGFuZCBoaXQK
PiB1c2Vyc3BhY2UgYXQgdGhlIDY0TSBtYXJrLikKPiAKPiBZb3UgYWJzb2x1dGVseSBuZWVkIHRv
IGNoZWNrIGl2cnNfbWFwcGluZ3MgYmVpbmcgbm9uIE5VTEwgYmVmb3JlIHVzaW5nCj4gSVZSU19N
QVBQSU5HU19ERVZUQUIoKSwgb3IgcGVyaGFwcyByb2xsIHRoZSBjaGVjayBpbnRvIHRoZSBtYWNy
by4KCkkgY2FuIG9ubHkgcmVwZWF0IHdoYXQgSSd2ZSBzYWlkIGluIHJlcGx5IHRvIHlvdXIgcmVz
cGVjdGl2ZSB2NiByZW1hcms6CldlIHdvbid0IGNvbWUgaGVyZSBmb3IgYW4gSU9NTVUgd2hpY2gg
ZGlkbid0IGhhdmUgaXRzIGl2cnNfbWFwcGluZ3MKc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZC4gWW91
IGFsc28gc2VlbSB0byBiZSBtaXhpbmcgdXAgdGhpcyBhbmQgdGhlCmRldmljZSB0YWJsZSBhbGxv
Y2F0aW9uIC0gdGhlIGNvbW1lbnQgcmVmZXJzIHRvIHRoZSBsYXR0ZXIsIHdoaWxlIHlvdXIKTlVM
TCBkZXJlZiBjb25jZXJuIGlzIGFib3V0IHRoZSBmb3JtZXIuIChJZiB5b3UgZ28gdGhyb3VnaCB0
aGUgY29kZQp5b3UnbGwgZmluZCB0aGF0IHdlIGhhdmUgbnVtZXJvdXMgb3RoZXIgcGxhY2VzIHV0
aWxpemluZyB0aGUgZmFjdCB0aGF0CmdldF9pdnJzX21hcHBpbmdzKCkgY2FuJ3QgZmFpbCBpbiBj
YXNlcyBsaWtlIHRoZSBvbmUgYWJvdmUuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
