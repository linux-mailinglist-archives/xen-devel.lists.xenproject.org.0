Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9429B4E080
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:24:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heCvE-0007if-Av; Fri, 21 Jun 2019 06:21:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heCvC-0007ia-SQ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:21:14 +0000
X-Inumbo-ID: c4a6e81a-93ec-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4a6e81a-93ec-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 06:21:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:21:12 -0600
Message-Id: <5D0C77540200007800239ED5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:21:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
 <20190617185017.32661-2-sstabellini@kernel.org>
 <e3ff3109-73e5-eb87-b8ad-51c697e0d9a3@arm.com>
In-Reply-To: <e3ff3109-73e5-eb87-b8ad-51c697e0d9a3@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA2LjE5IGF0IDE1OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvMTcvMTkgNzo1MCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBUaGUgbWFz
ayBjYWxjdWxhdGlvbiBpbiBwZHhfaW5pdF9tYXNrIGlzIHdyb25nIHdoZW4gdGhlIGZpcnN0IGJh
bmsKPj4gc3RhcnRzIGF0IGFkZHJlc3MgMHgwLiBUaGUgcmVhc29uIGlzIHRoYXQgcGR4X2luaXRf
bWFzayB3aWxsIGRvICcwIC0gMScKPj4gY2F1c2luZyBhbiB1bmRlcmZsb3cuIEFzIGEgcmVzdWx0
LCB0aGUgbWFzayBiZWNvbWVzIDB4ZmZmZmZmZmZmZmZmZmZmZgo+PiB3aGljaCBpcyB0aGUgYmln
Z2VzdCBwb3NzaWJsZSBtYXNrIGFuZCBlbmRzIHVwIGNhdXNpbmcgYSBzaWduaWZpY2FudAo+PiBt
ZW1vcnkgd2FzdGUgaW4gdGhlIGZyYW1ldGFibGUgc2l6ZSBjb21wdXRhdGlvbi4KPj4gCj4+IEZv
ciBpbnN0YW5jZSwgb24gcGxhdGZvcm1zIHRoYXQgaGF2ZSBhIGxvdyBtZW1vcnkgYmFuayBzdGFy
dGluZyBhdCAweDAKPj4gYW5kIGEgaGlnaCBtZW1vcnkgYmFuaywgdGhlIGZyYW1ldGFibGUgd2ls
bCBlbmQgdXAgY292ZXJpbmcgYWxsIHRoZQo+PiBob2xlcyBpbiBiZXR3ZWVuLgo+PiAKPj4gVGhl
IHB1cnBvc2Ugb2YgdGhlIG1hc2sgaXMgdG8gYmUgcGFzc2VkIGFzIGEgcGFyYW1ldGVyIHRvCj4+
IHBmbl9wZHhfaG9sZV9zZXR1cCwgd2hpY2ggYmFzZWQgb24gdGhlIG1hc2sgcGFyYW1ldGVyIGNh
bGN1bGF0ZXMKPj4gcGZuX3BkeF9ob2xlX3NoaWZ0LCBwZm5fcGR4X2JvdHRvbV9tYXNrLCBldGMu
IHdoaWNoIGFyZSBhY3R1YWxseSB0aGUKPj4gaW1wb3J0YW50IG1hc2tzIGZvciBmcmFtZXRhYmxl
IGluaXRpYWxpemF0aW9uIGxhdGVyIG9uLgo+PiAKPj4gcGZuX3BkeF9ob2xlX3NldHVwIG5ldmVy
IGNvbXByZXNzZXMgYWRkcmVzc2VzIGJlbG93IE1BWF9PUkRFUiBiaXRzICgxR0IKPj4gb24gQVJN
KS4gVGh1cywgaXQgaXMgc2FmZSB0byBpbml0aWFsaXplIG1hc2sgcGFzc2luZyAxVUxMIDw8IChN
QVhfT1JERVIKPj4gKyBQQUdFX1NISUZUKSBhcyBzdGFydCBhZGRyZXNzIHRvIHBkeF9pbml0X21h
c2suCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhp
bGlueC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gCj4gSWRlYWxseSwgSSB3b3VsZCBsaWtlIGFuIGFjayBmcm9tIEFuZHJldyBvciBK
YW4uCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIG9uZSBt
b3JlIG1pbm9yIHJlbWFyazoKCj4+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPj4gKysrIGIveGVu
L2NvbW1vbi9wZHguYwo+PiBAQCAtNTAsOSArNTAsMTEgQEAgc3RhdGljIHU2NCBfX2luaXQgZmls
bF9tYXNrKHU2NCBtYXNrKQo+PiAgICAgICByZXR1cm4gbWFzazsKPj4gICB9Cj4+ICAgCj4+ICsv
KiBXZSBkb24ndCBjb21wcmVzcyB0aGUgZmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUgYWRkcmVz
c2VzLiAqLwo+PiAgIHVpbnQ2NF90IF9faW5pdCBwZHhfaW5pdF9tYXNrKHVpbnQ2NF90IGJhc2Vf
YWRkcikKCkkgdGhpbmsgdGhlIGNvbW1lbnQgd291bGQgYmVuZWZpdCBmcm9tICJ3YW50IHRvIiBn
ZXR0aW5nIGluc2VydGVkLgpBbmQgYXMgYSBuaXQsIGl0IHNob3VsZCBiZSAiYml0cyIsIG5vdCAi
Yml0IiwgcGx1cyBwZXJoYXBzICJsb3ciIGluc3RlYWQKb2YgImZpcnN0Ii4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
