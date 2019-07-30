Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF27A5B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 12:12:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsP3T-0003FZ-Bn; Tue, 30 Jul 2019 10:08:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gbCZ=V3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hsP3S-0003FU-16
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 10:08:26 +0000
X-Inumbo-ID: f7543470-b2b1-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7543470-b2b1-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 10:08:24 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MucIrh+jNLecM40XZowyilzvD3qwdUF93b8ID6s6oQh1L62hUPQ29+IDivssdtdyqSYzg1ZHQy
 k4wx13DzrwLEvLX3Ee/s4b+dq1n8HBWgBKoDoYF7PSyxQIDF5m6qBy3my2Aeqe7HGiNrHhF2U7
 TeGo2Ib9gi8oCTulh+s46nfo6D37pxol+K6S8zuT+k1QkuIoxxrrksjx4ETK9366K2fDAM3Yg/
 mhG9cFyPgJvclaIfh+fcyA0m0+aJfEaB/rwuvnuBkpceuego+dp2l2ebpXiBgyV7YaAVCLKOTU
 O8U=
X-SBRS: 2.7
X-MesageID: 3711530
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3711530"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
 <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <47da6b72-614f-b29b-7357-ec6ea0bd3a17@citrix.com>
Date: Tue, 30 Jul 2019 11:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSAxMDo1NCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biAzMC8wNy8yMDE5IDEwOjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMDcuMjAxOSAx
MDo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gT24gNy8zMC8xOSA5OjI5IEFNLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNy4yMDE5IDA4OjU2LCBMdWthc3ogSGF3cnlsa28gd3Jv
dGU6Cj4+Pj4+IFN1cHBvcnQgZm9yIEludGVsIFRYVCBoYXMgb3JwaGFuZWQgc3RhdHVzIHJpZ2h0
IG5vdyBiZWNhdXNlCj4+Pj4+IG5vIGFjdGl2ZSBtYWludGFpbnRlciBpcyBsaXN0ZWQuIEFkZGlu
ZyBteXNlbGYgYXMgcmV2aWV3ZXIKPj4+Pj4gYW5kIG1vdmluZyBpdCB0byBPZGQgRml4ZXMgc3Rh
dGUuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhh
d3J5bGtvQGludGVsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgwqDCoCBNQUlOVEFJTkVSUyB8IDMg
KystCj4+Pj4+IMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
Cj4+Pj4+IGluZGV4IDg5YTAxYjcxMGIuLmNhMzAwZTg3YzggMTAwNjQ0Cj4+Pj4+IC0tLSBhL01B
SU5UQUlORVJTCj4+Pj4+ICsrKyBiL01BSU5UQUlORVJTCj4+Pj4+IEBAIC0yNDAsNyArMjQwLDgg
QEAgUzrCoMKgwqAgTWFpbnRhaW5lZAo+Pj4+PiDCoCBGOsKgwqDCoCB0b29scy9nb2xhbmcKPj4+
Pj4gwqAgSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04gVEVDSE5PTE9HWSAoVFhUKQo+Pj4+PiAt
UzrCoMKgwqAgT3JwaGFuZWQKPj4+Pj4gK1I6wqDCoMKgIEx1a2FzeiBIYXdyeWxrbyA8bHVrYXN6
Lmhhd3J5bGtvQGludGVsLmNvbT4KPj4+Pj4gK1M6wqDCoMKgIE9kZCBGaXhlcwo+Pj4+Cj4+Pj4g
SSBndWVzcyB3ZSBzaG91bGQgZ2l2ZSBpdCBhIGZldyBkYXlzIGZvciBvYmplY3Rpb25zIHRvIGJl
IHJhaXNlZAo+Pj4+IGFnYWluc3QgdGhpcyBzbGlnaHRseSBpbmNvbnNpc3RlbnQgc3RhdGUsIGJ1
dCBJIHRoaW5rIHRoYXQncyB0aGUKPj4+PiBiZXN0IHdheSB0byBleHByZXNzIHRoZSBjdXJyZW50
IHN0YXRlIG9mIHRoaW5ncyAoaGVuY2UgbXkKPj4+PiBzdWdnZXN0aW9uIHRvIHRoaXMgZWZmZWN0
KS4gSWYgbm8gb2JqZWN0aW9ucyB0dXJuIHVwLCBJJ3ZlIHF1ZXVlZAo+Pj4+IHRoaXMgb250byBt
eSB0by1iZS1jb21taXR0ZWQgbGlzdC4KPj4+Cj4+PiBJIGhhdmUgc29tZSBvYmplY3Rpb25zIHJl
Z2FyZGluZyB0aGUgcHJvY2VzcyBpdHNlbGYuLi4gT24gdGhlIGZpcnN0Cj4+PiB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2gsIGl0IHdhcyBwb2ludGVkIG91dCB0aGF0IHRoZSBlLW1haWwgc2hvdWxkbid0
Cj4+PiBiZSBzZW50IHdpdGggZGlzY2xhaW1lci4gVGhpcyBpcyBub3cgdGhlIHRoaXJkIHZlcnNp
b24gYW5kIHRoZQo+Pj4gZGlzY2xhaW1lciBpcyBzdGlsbCBwcmVzZW50Lgo+Pgo+PiBPa2F5LCBJ
IG11c3QgaGF2ZSBtaXNzZWQgYm90aCBlYXJsaWVyIHJlcXVlc3RzIHRvIHRoaXMgZWZmZWN0LiBJ
J3ZlCj4+IGdvbmUgYmFjayB0byB0aGUgbGlzdCBhcmNoaXZlcyB0aG91Z2gsIGFuZCBJIGNvdWxk
bid0IGZpbmQgYW55IHN1Y2gKPj4gcmVxdWVzdCBlaXRoZXIgZnJvbSBKdWx5IG9yIEp1bmUuIFRo
ZXJlZm9yZSAuLi4KPiAKPiBUaGUgZmlyc3QgdmVyc2lvbiB3YXMgc2VudCBmcm9tIE1hcmNoIFsx
XS4KPiAKPj4KPj4+IFRlY2huaWNhbGx5LCBubyBwYXRjaCBzaG91bGQgYmUgYXBwbGllZCB3aGVu
IHRoZXJlIGFyZSBhIGRpc2NsYWltZXIuCj4+Cj4+IC4uLiBJJ2QgYWxzbyBsaWtlIHRvIGFzayBm
b3IgdGhlIGJhY2tncm91bmQgb2YgdGhpcy4gSXQgd291bGQgbmV2ZXIKPj4gaGF2ZSBvY2N1cnJl
ZCB0byBtZSB0aGF0IEkgc2hvdWxkIHBheSBhdHRlbnRpb24gdG8gcG9zc2libGUKPj4gZGlzY2xh
aW1lcnMgb3IgYWxpa2Ugb24gcGF0Y2ggc3VibWlzc2lvbnMuCj4gCj4gVGhlIGRpc2NsYWltZXIg
dGVsbCB5b3UgdGhpcyBwYXRjaCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24K
PiBhbmQgeW91IGFyZSBub3QgYWxsb3dlZCB0byBkaXN0cmlidXRlIGl0Li4uIFdoaWxlIEkgYWdy
ZWUgdGhpcyBtYWtlcyBubwo+IHNlbnNlIGZvciBwdWJsaWMgTUwsIHdlIHN0aWxsIGhhdmUgdG8g
c3RheSBvbiB0aGUgc2FmZSBzaWRlLiBIb3cgZG8geW91Cj4ga25vdyB0aGlzIHdhcyBub3Qgc2Vu
dCBieSBtaXN0YWtlPyBOb3RlIHRoYXQgdGhpcyBxdWVzdGlvbiBtYWtlcyBsaXR0bGUKPiBzZW5z
ZSBvbiBNQUlOVEFJTkVSUyBmaWxlLi4uCj4gCj4gSW4gZ2VuZXJhbCwgSSBhbSBmb2xsb3dpbmcg
R3JlZyBLSCBhZHZpY2UgaGVyZSBbMl0gYW5kIHJlZnJhaW4gdG8gYW5zd2VyCj4gYW55IGUtbWFp
bCB3aXRoIGRpc2NsYWltZXIuIEkgd291bGQgYWN0dWFsbHkgYWR2b2NhdGUgeGVuLWRldmVsIHRv
Cj4gY29tcGxldGVseSBibG9jayB0aG9zZSBlLW1haWxzLgoKSSB0aGluayAicmVmcmFpbmluZyBm
cm9tIGFuc3dlcmluZyIgYW5kICJibG9ja2luZyBmcm9tIHRoZSBsaXN0IiBpcyBhCmJpdCB0b28g
c3Ryb25nOiBhZnRlciBhbGwsIHRoZSBkaXNjbGFtZXIgZG9lcyBzYXkgIm1heSIsIGFuZCBpdCBz
aG91bGQKYmUgcHJldHR5IGNsZWFyIHRoYXQgdGhlICJpbnRlbmRlZCByZWNpcGllbnRzIiBpbmNs
dWRlcyBhbnlvbmUgb24geGVuLWRldmVsLgoKQnV0IGZvciBjb2RlIGl0c2VsZiwgd2hpY2ggd2ls
bCBlbmQgdXAgYmVpbmcgdXNlZCBpbiB0aGUgcHJvZHVjdHMgb2YKbGFyZ2UgY29ycG9yYXRpb25z
IHdpdGggZGVlcCBwb2NrZXRzLCBJIGFncmVlIHNob3VsZCBiZSBhYnNvbHV0ZWx5IGNsZWFyCm9m
IGxlZ2FsIGRvdWJ0OyBhcyBzdWNoLCBoYXZpbmcgc3VjaCBhIGRpc2NsYWltZXIgb24gdGhlIHBh
dGNoZXMgc2hvdWxkCmJlIGRpc2FsbG93ZWQuICBXZSBnZXQgbG90cyBvZiBwYXRjaGVzIGZyb20g
SW50ZWwgZm9sa3Mgd2hpY2ggZG9uJ3QgaGF2ZQp0aGUgZGlzY2xhaW1lciBhdCB0aGUgYm90dG9t
LgoKU29ycnkgdG8gZGVsYXkgdGhpcyBzaW1wbGUgY2hhbmdlIHlldCBhZ2Fpbi4KCiAtR2Vvcmdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
