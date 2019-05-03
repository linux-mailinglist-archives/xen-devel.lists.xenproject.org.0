Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC0128DF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 09:30:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMSaU-0008Mf-E9; Fri, 03 May 2019 07:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMSaS-0008MZ-Na
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 07:26:28 +0000
X-Inumbo-ID: baa45b1e-6d74-11e9-8908-47b10b665b3f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baa45b1e-6d74-11e9-8908-47b10b665b3f;
 Fri, 03 May 2019 07:26:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 01:26:12 -0600
Message-Id: <5CCBED14020000780022B7FE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 01:26:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
 <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
 <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904291008070.27577@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1905011536510.23881@sstabellini-ThinkPad-X260>
 <5CCA9CAC020000780022B058@prv1-mh.provo.novell.com>
 <1f9effdd-e920-bf07-d9e1-1b126a409fc0@arm.com>
 <5CCAB676020000780022B199@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1905021517420.4309@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1905021517420.4309@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjI1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gQWxsIHJpZ2h0LiBMb29raW5nIGF0IHRoZSBjb21tZW50IGluIHBmbl9wZHhfaG9sZV9zZXR1
cCwgaXQgc2VlbXMgdGhhdAo+IGl0IGlzIGludGVuZGluZyB0byBza2lwIHRoZSBmaXJzdCBNQVhf
T1JERVIgYml0cywgYnV0IGFjdHVhbGx5IGl0IGlzCj4gc2tpcHBpbmcgdGhlIGZpcnN0IE1BWF9P
UkRFUi0xIGJpdHMsIGlmIG15IGNhbGN1bGF0aW9ucyBhcmUgY29ycmVjdC4KPiAKPiBNQVhfT1JE
RVIgaXMgMTggb24gQVJNIHdoaWNoIGNvcnJlc3BvbmQgdG8gMUdCLiBXaXRoIHRoZSBjdXJyZW50
Cj4gaW1wbGVtZW50YXRpb24gb2YgcGZuX3BkeF9ob2xlX3NldHVwLCBpZiBJIHBhc3MgYSBtYXNr
IGNvcnJlc3BvbmRpbmcgdG8KPiA1MTJNQiwgSSBjYW4gc2VlICJQRk4gY29tcHJlc3Npb24gb24g
Yml0cyAxNy4uLjE5Ii4gU28gdGhlIHJhbmdlCj4gNTEyTUItMUdCIGdldHMgY29tcHJlc3NlZC4K
PiAKPiBTaG91bGRuJ3QgaXQgYmU6Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGR4LmMg
Yi94ZW4vY29tbW9uL3BkeC5jCj4gaW5kZXggNTBjMjFiNi4uYjMzNGViOSAxMDA2NDQKPiAtLS0g
YS94ZW4vY29tbW9uL3BkeC5jCj4gKysrIGIveGVuL2NvbW1vbi9wZHguYwo+IEBAIC04MSw3ICs4
MSw3IEBAIHZvaWQgX19pbml0IHBmbl9wZHhfaG9sZV9zZXR1cCh1bnNpZ25lZCBsb25nIG1hc2sp
Cj4gICAgICAgKiBjb250aWd1b3VzIGFsaWduZWQgcmFuZ2VzIG9mIDJeTUFYX09SREVSIHBhZ2Vz
LiBBbW9uZyBvdGhlcnMsIG91cgo+ICAgICAgICogYnVkZHkgYWxsb2NhdG9yIHJlbGllcyBvbiB0
aGlzIGFzc3VtcHRpb24uCj4gICAgICAgKi8KPiAtICAgIGZvciAoIGogPSBNQVhfT1JERVItMTsg
OyApCj4gKyAgICBmb3IgKCBqID0gTUFYX09SREVSOyA7ICkKPiAgICAgIHsKPiAgICAgICAgICBp
ID0gZmluZF9uZXh0X3plcm9fYml0KCZtYXNrLCBCSVRTX1BFUl9MT05HLCBqKTsKPiAgICAgICAg
ICBqID0gZmluZF9uZXh0X2JpdCgmbWFzaywgQklUU19QRVJfTE9ORywgaSk7IAoKWWVzLCBidXQu
IE9yaWdpbmFsbHkgd2Ugc3RhcnRlZCBmcm9tIHplcm8gaGVyZS4gQXMgYSB3aWxkIGd1ZXNzLApJ
IHRoaW5rIEtlaXIgbWF5IGhhdmUgdGhvdWdodCB0aGUgY3B1bWFza19uZXh0KCkgd2F5IHdoZW4K
cHV0dGluZyB0b2dldGhlciBiZGI1NDM5YzNmLCB3aGVyZSBhbiBhZGp1c3RtZW50IGJ5IDEgaXMK
bmVlZGVkIGluIHRoZSBjYWxsIHRvIGZpbmRfbmV4dF9iaXQoKS4gSGVuY2UgaXQgcHJvYmFibHkg
d2FzCmludHVpdGl2ZSBmb3IgaGltIHRvIGhhdmUgdGhlIGluZGV4IHN0YXJ0IGF0IG9uZSBsZXNz
LiBJIGRvIHRoaW5rLApob3dldmVyLCB0aGF0IHdpdGggdGhlIHN3aXRjaCBhd2F5IGZyb20gemVy
bywgdGhpbmdzIHdvdWxkCmJldHRlciBoYXZlIGJlY29tZQoKICAgIGZvciAoIGogPSBNQVhfT1JE
RVIgLSAxOyA7ICkKICAgIHsKICAgICAgICBpID0gZmluZF9uZXh0X3plcm9fYml0KCZtYXNrLCBC
SVRTX1BFUl9MT05HLCBqICsgMSk7CiAgICAgICAgaiA9IGZpbmRfbmV4dF9iaXQoJm1hc2ssIEJJ
VFNfUEVSX0xPTkcsIGkgKyAxKTsKCkFzIHlvdSBjYW4gc2VlLCB1c2luZyBqICsgMSB3aGVuIHN0
YXJ0aW5nIGZyb20gemVybyB3b3VsZG4ndApyZWFsbHkgaGF2ZSBiZWVuIGNvcnJlY3QgKGFsYmVp
dCB3ZSBzdXJlbHkgZGlkbid0IGV4cGVjdCB0bwpjb21wcmVzcyBvbiBiaXQgemVybywgc28gdGhp
cyBpcyBtZXJlbHkgYSBtb290IGNvbnNpZGVyYXRpb24pLgoKTm93IHRoZXJlJ3MgYSBwb3NzaWJs
ZSBjYXZlYXQgaGVyZTogV2hpbGUgZm9yIHN5bW1ldHJ5IGFsc28KdXNpbmcgaSArIDEgaW4gdGhl
IHNlY29uZCBjYWxsIHdvdWxkIHNlZW0gZGVzaXJhYmxlLCBJJ20gYWZyYWlkCml0IGNhbid0IGJl
IHVzZWQgZGlyZWN0bHkgdGhhdCB3YXksIGFzIGZpbmRfeyxuZXh0X316ZXJvX2JpdCgpLApvbiB4
ODYgYXQgbGVhc3QsIGFzc3VtZSB0aGVpciBsYXN0IGFyZ3VtZW50IHRvIGJlIGxlc3MgdGhhbgp0
aGVpciBtaWRkbGUgb25lLiBUaGlzLCBpbiB0dXJuLCBtYXkgYWxyZWFkeSBiZSB2aW9sYXRlZCBp
bgp0aGUgZ2VuZXJhbCBjYXNlIChub3cgdGhhdCB0aGUgZnVuY3Rpb24gbGl2ZXMgaW4gY29tbW9u
IGNvZGUpOgpBbiBhcmNoaXRlY3R1cmUgd2l0aCBhbGwgQklUU19QRVJfTE9ORytQQUdFX1NJWkUg
Yml0cyB1c2FibGUKYXMgcGh5c2ljYWwgYWRkcmVzcyAoeDg2LTY0IGNhbiB1c2Ugb25seSB1cCB0
byA1MiwgYnV0IHg4Ni0zMgpjYW4gaW4gcHJpbmNpcGxlIC0gcG9zc2libHkgd2l0aCBzb21lIGV4
dHJhIGNvbmRpdGlvbnMgbGlrZSBydW5uaW5nCm9uIHRvcCBvZiBhIDY0LWJpdCBoeXBlcnZpc29y
IC0gdXNlIGFsbCA0NCBiaXRzKSB0aGUgZmlyc3QgY2FsbCBtYXkKYWxyZWFkeSByZXR1cm4gQklU
U19QRVJfTE9ORywgYW5kIGhlbmNlIHRoZSBzZWNvbmQgY2FsbAptaWdodCBhbHJlYWR5IHByb2R1
Y2UgVUIuIEFzIGEgcmVzdWx0LCB0byBmaXggdGhpcyBvdGhlciAobGF0ZW50Cm9ubHkgYWZhaWN0
KSBpc3N1ZSBhdCB0aGUgc2FtZSB0aW1lLCB0aGUgY29kZSBpbW8gb3VnaHQgdG8KYmVjb21lCgog
ICAgZm9yICggaiA9IE1BWF9PUkRFUiAtIDE7IDsgKQogICAgewogICAgICAgIGkgPSBmaW5kX25l
eHRfemVyb19iaXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGogKyAxKTsKICAgICAgICBpZiAoIGkg
Pj0gQklUU19QRVJfTE9ORyApCiAgICAgICAgICAgIGJyZWFrOwogICAgICAgIGogPSBmaW5kX25l
eHRfYml0KCZtYXNrLCBCSVRTX1BFUl9MT05HLCBpICsgMSk7CiAgICAgICAgaWYgKCBqID49IEJJ
VFNfUEVSX0xPTkcgKQogICAgICAgICAgICBicmVhazsKCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
