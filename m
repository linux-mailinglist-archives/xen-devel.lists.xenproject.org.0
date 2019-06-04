Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78E33F39
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 08:53:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY3Gi-00010y-Bo; Tue, 04 Jun 2019 06:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3Gh-00010q-E7
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 06:49:59 +0000
X-Inumbo-ID: f5858f26-8694-11e9-ab83-0f6f7a33c87f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5858f26-8694-11e9-ab83-0f6f7a33c87f;
 Tue, 04 Jun 2019 06:49:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 00:49:53 -0600
Message-Id: <5CF614900200007800234E36@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 00:49:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-3-sstabellini@kernel.org>
 <5CD3EFD5020000780022D0D8@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906031447300.14041@sstabellini-ThinkPad-T480s>
 <b49eb323-e4d4-b959-7c99-1c124c9a5df0@arm.com>
In-Reply-To: <b49eb323-e4d4-b959-7c99-1c124c9a5df0@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDAwOjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvMy8xOSAxMDo1NiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBUaHUs
IDkgTWF5IDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDkuMDUuMTkgYXQgMDA6
NDcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29tbW9u
L3BkeC5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9wZHguYwo+Pj4+IEBAIC01MCw5ICs1MCwxMyBA
QCBzdGF0aWMgdTY0IF9faW5pdCBmaWxsX21hc2sodTY0IG1hc2spCj4+Pj4gICAgICAgcmV0dXJu
IG1hc2s7Cj4+Pj4gICB9Cj4+Pj4gICAKPj4+PiArLyoKPj4+PiArICogV2UgYWx3YXlzIG1hcCB0
aGUgZmlyc3QgMTw8TUFYX09SREVSIHBhZ2VzIG9mIFJBTSwgaGVuY2UsIHRoZXkKPj4+PiArICog
YXJlIGxlZnQgdW5jb21wcmVzc2VkLgo+Pj4+ICsgKi8KPj4+PiAgIHU2NCBfX2luaXQgcGR4X2lu
aXRfbWFzayh1NjQgYmFzZV9hZGRyKQo+Pj4+ICAgewo+Pj4+IC0gICAgcmV0dXJuIGZpbGxfbWFz
ayhiYXNlX2FkZHIgLSAxKTsKPj4+PiArICAgIHJldHVybiBmaWxsX21hc2sobWF4KGJhc2VfYWRk
ciwgKHU2NCkxIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZUKSkgLSAxKTsKPj4+Cj4+PiBQZXJz
b25hbGx5IEkgdGhpbmsgdGhhdCBkZXNwaXRlIHRoZSBzdXJyb3VuZGluZyB1NjQgdGhpcyBzaG91
bGQgYmUKPj4+IHVpbnQ2NF90LiBZb3UgY291bGQgYXZvaWQgdGhpcyBhbHRvZ2V0aGVyIGJ5IHVz
aW5nIDFVTEwuCj4+IAo+PiBJIGNhbm5vdCB1c2UgMVVMTCBiZWNhdXNlIGl0IHdvdWxkIGJyZWFr
IHRoZSBidWlsZDogdGhlIHJlYXNvbiBpcyB0aGF0Cj4+IHU2NCBpcyBkZWZpbmVkIGFzIHVuc2ln
bmVkIGxvbmcgb24gc29tZSBhcmNoaXRlY3R1cmVzIGFuZCB1bnNpZ25lZCBsb25nCj4+IGxvbmcg
b24gb3RoZXJzLiBUaGUgcG9pbnRlcnMgY29tcGFyaXNvbiBpbiB0aGUgbWF4IG1hY3JvIHdpbGwg
ZmFpbCB0bwo+PiBjb21waWxlLgoKSG1tLCB1Z2x5IC0gd2UgaW5kZWVkIGhhdmUgVUlOVDY0X0Mo
KSBvbmx5IGluIGNyeXB0byBjb2RlIHJpZ2h0IG5vdy4KCj4+IEkgY291bGQgdXNlIHVpbnQ2NF90
LCB0aGF0IHdvcmtzLCBidXQgSSB0aGluayBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNlCj4+IHBv
dGVudGlhbGx5IGRpZmZlcmVudCB0eXBlcyBiZXR3ZWVuIHRoZSBhcmd1bWVudHMgcGFzc2VkIHRv
IG1heC4gSWYgeW91Cj4+IHN0aWxsIHdvdWxkIGxpa2UgbWUgdG8gY2hhbmdlICh1NjQpMSB0byAo
dWludDY0X3QpMSBwbGVhc2UgZXhwbGFpbiB3aHkKPj4gaW4gbW9yZSBkZXRhaWxzLgo+IAo+IFdl
IGFyZSBwaGFzaW5nIG91dCB1WFggaW4gZmF2b3Igb2YgdWludFhYX3Qgc28gSSBhZ3JlZSB3aXRo
IEphbiB0aGF0IHdlIAo+IHdhbnQgdG8gYXZvaWQgaW50cm9kdWNpbmcgbW9yZSBoZXJlLgoKSXMg
dGhpcyBzdWZmaWNpZW50IGRldGFpbCBmb3IgeW91PyAoSG9uZXN0bHkgSSB3b3VsZG4ndCB3aGF0
IGVsc2UgdG8gYWRkLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
