Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE516122
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:38:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwVk-0000N5-R9; Tue, 07 May 2019 09:35:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNwVi-0000N0-RR
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:35:42 +0000
X-Inumbo-ID: 7678e380-70ab-11e9-9943-fbc553018634
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7678e380-70ab-11e9-9943-fbc553018634;
 Tue, 07 May 2019 09:35:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 03:35:33 -0600
Message-Id: <5CD15163020000780022C68B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 03:35:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
 <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
 <f9deae17-e925-9a4f-1eb1-443b428e0525@arm.com>
In-Reply-To: <f9deae17-e925-9a4f-1eb1-443b428e0525@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDEwOjU5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvNy8xOSA4OjQwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkg
YXQgMTc6MjYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiA1LzYvMTkgMTA6
MDYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDAzLjA1LjE5IGF0IDIyOjUwLCA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+ICsgICAgbWFzayA9IHBkeF9pbml0
X21hc2soMVVMTCA8PCAoTUFYX09SREVSICsgUEFHRV9TSElGVCkpOwo+Pj4+Cj4+Pj4gUEFHRV9T
SVpFIDw8IE1BWF9PUkRFUj8KPj4+Cj4+PiBIbW1tLCBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5j
ZSB0aGlzIHdpbGwgZ2l2ZSB0aGUgY29ycmVjdCB2YWx1ZQo+Pj4gYmVjYXVzZSBQQUdFX1NJWkUg
aXMgZGVmaW5lZCBhcyAoX0FDKDEsIEwpIDw8IFBBR0VfU0hJRlQuCj4+IAo+PiBPaCwgaW5kZWVk
LCBmb3IgYW4gYWJzdHJhY3QgMzItYml0IGFyY2ggdGhpcyB3b3VsZCBkZS1nZW5lcmF0ZSwgZHVl
Cj4+IHRvIE1BWF9PUkRFUiBiZWluZyAyMC4gTmV2ZXJ0aGVsZXNzIEkgdGhpbmsgdGhlIGV4cHJl
c3Npb24gdXNlZAo+PiBpbnZpdGVzIGZvciAiY2xlYW5pbmcgdXAiIChtYWtpbmcgdGhlIHNhbWUg
bWlzdGFrZSBJJ3ZlIG1hZGUpLCBhbmQKPj4gc2luY2UgdGhpcyBpcyBpbiBBcm0tc3BlY2lmaWMg
Y29kZSAod2hlcmUgTUFYX09SREVSIGlzIDE4KSBJIHRoaW5rIGl0Cj4+IHdvdWxkIHN0aWxsIGJl
IGJldHRlciB0byB1c2UgdGhlIHN1Z2dlc3RlZCBhbHRlcm5hdGl2ZS4KPiAKPiBUaGUgY29tbWVu
dCBvbiB0b3Agb2YgUEFHRV9TSVpFIGluIGFzbS14ODYvcGFnZS5oIGxlYWRzIHRvIHRoaW5rIHRo
YXQgCj4gUEFHRV9TSVpFIHNob3VsZCB1c2Ugc2lnbmVkIHF1YW50aXRpZXMuIFNvIEkgYW0gbm90
IHN1cmUgd2hldGhlciBpdCBpcyAKPiBzYWZlIHRvIHN3aXRjaCB0byBVTCBoZXJlLgoKSXQncyBu
b3QgKGF0IGxlYXN0IHdoZW4ga2VlcGluZyBwYXN0IHg4Ni0zMiBpbiB0aGUgcGljdHVyZSk6IEV4
dGVuZGluZwp0byB1bnNpZ25lZCBsb25nIGxvbmcgd29ya3MgZGlmZmVyZW50bHkgd2hlbiB0aGUg
dHlwZSBpcyAidW5zaWduZWQgbG9uZyIuClRoaXMgbWF0dGVycyB3aGVuIHVzaW5nIHRoaW5ncyBs
aWtlIH4oUEFHRV9TSVpFIC0gMSkuCgo+IElmIHdlIGtlZXAgUEFHRV9TSVpFIGFzIHNpZ25lZCBx
dWFudGl0aWVzLCB0aGVuIEkgd291bGQgcmF0aGVyIG5vdCB1c2VkIAo+IHlvdXIgc3VnZ2VzdGlv
biBiZWNhdXNlIHRoaXMgbWF5IGludHJvZHVjZSBidWdneSBjb2RlIGlmIE1BWF9PUkRFUiBpcyAK
PiBldmVyIHVwZGF0ZWQgb24gQXJtLgoKQSBCVUlMRF9CVUdfT04oKSBjb3VsZCBoZWxwIHByZXZl
bnQgdGhpcy4KCj4+Pj4gSSB3b25kZXIgd2hldGhlciBwZHhfaW5pdF9tYXNrKCkgaXRzZWxmIHdv
dWxkbid0IGJldHRlciBhcHBseSB0aGlzCj4+Pj4gKGxvd2VyKSBjYXAKPj4+Cj4+PiBEbyB5b3Ug
bWVhbiBhbHdheXMgcmV0dXJuaW5nIChQQUdFX1NJWkUgPDwgTUFYX09SREVSKSBvciBjYXBwaW5n
IHRoZQo+Pj4gaW5pdCBtYXNrPwo+Pj4KPj4+IE5vdGUgdGhhdCB0aGUgbGF0ZXIgd2lsbCBub3Qg
cHJvZHVjZSB0aGUgc2FtZSBiZWhhdmlvciBhcyB0aGlzIHBhdGNoLgo+PiAKPj4gU2luY2UgSSdt
IG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIHdpdGggImNhcHBpbmcgdGhlCj4+
IGluaXQgbWFzayIsIEknbSBhbHNvIHVuY2VydGFpbiB3aGF0IGFsdGVybmF0aXZlIGJlaGF2aW9y
IHlvdSdyZQo+PiB0aGlua2luZyBvZi4gV2hhdCBJJ20gc3VnZ2VzdGluZyBpcwo+PiAKPj4gdTY0
IF9faW5pdCBwZHhfaW5pdF9tYXNrKHU2NCBiYXNlX2FkZHIpCj4+IHsKPj4gICAgICByZXR1cm4g
ZmlsbF9tYXNrKG1heChiYXNlX2FkZHIsICh1aW50NjRfdClQQUdFX1NJWkUgPDwgTUFYX09SREVS
KSAtIDEpOwo+PiB9Cj4gCj4gQXMgSSBwb2ludGVkIG91dCBpbiB0aGUgb3JpZ2luYWwgdGhyZWFk
LCB0aGVyZSBhcmUgYSBjb3VwbGUgb2YgaXNzdWVzIAo+IHdpdGggdGhpcyBzdWdnZXN0aW9uOgo+
IAkxKSBiYW5rcyBhcmUgbm90IG9yZGVyZWQgb24gQXJtLCBzbyB0aGUgcGR4IG1hc2sgbWF5IGdl
dCBpbml0aWFsaXplZCAKPiB3aXRoIGEgaGlnaGVyIGJhbmsgYWRkcmVzcyBwcmV2ZW50aW5nIHRo
ZSBQRFggY29tcHJlc3Npb24gdG8gd29yawoKVGhpcyBpcyBvcnRob2dvbmFsIHRvIG15IHN1Z2dl
c3Rpb24gaGVyZS4gSXQncyB1cCB0byBBcm0gY29kZSB0bwpjYWxsIHRoZSBmdW5jdGlvbiB3aXRo
IHRoZSBsb3dlc3QgYmFuaydzIGJhc2UgYWRkcmVzcyBpbnN0ZWFkIG9mCnRoZSBmaXJzdCBvbmUu
Cgo+IAkyKSB0aGUgUERYIHdpbGwgbm90IGJlIGFibGUgdG8gY29tcHJlc3MgYW55IGJpdHMgYmV0
d2VlbiAwIGFuZCB0aGUgTVNCIAo+IDEnIGluIHRoZSBiYXNlX2FkZHIuIEluIG90aGVyIHdvcmQs
IGZvciBhIGJhc2UgYWRkcmVzcyAweDIwMDAwMDAwMCAKPiAoOEdCKSwgdGhlIGluaXRpYWwgbWFz
ayB3aWxsIGJlICAweDFmZmZmZmZmZi4gSSBhbSBhd2FyZSBvZiBzb21lIAo+IHBsYXRmb3JtcyB3
aXRoIHNvbWUgaW50ZXJlc3RpbmcgZmlyc3QgYmFuayBiYXNlIGFkZHJlc3MgKGkuZSBhYm92ZSA0
R0IpLgoKV2VsbCwgd2UnZCBiZWVuIHRoZXJlIGJlZm9yZTogTW9yZSAiaW50ZXJlc3RpbmciIGxh
eW91dHMgbWF5CmluZGVlZCByZXF1aXJlIGFkanVzdG1lbnRzIHRvIHRoZSBsb2dpYy4gVGhlIHBh
cnRpY3VsYXIgY2FzZQp3ZSd2ZSBiZWVuIHRhbGtpbmcgYWJvdXQgd2FzIHRoZXJlIG5vdCBiZWlu
ZyBfYW55XyBSQU0KYmVsb3cgYSBjZXJ0YWluIGJvdW5kYXJ5LgoKPiAyKSBpcyBub3Qgb3Zlcmx5
IGNyaXRpY2FsLCBidXQgSSB0aGluayAxKSBzaG91bGQgYmUgYWRkcmVzc2VkLgo+IAo+IEF0IGxl
YXN0IG9uIEFybSwgSSBkb24ndCBzZWUgYW55IHJlYWwgdmFsdWUgdG8gaW5pdGlhbGl6ZSB0aGUg
UERYIG1hc2sgCj4gd2l0aCBhIGJhc2UgYWRkcmVzcy4gSSB3b3VsZCBiZSBtb3JlIGtlZW4gdG8g
aW1wbGVtZW50IHBkeF9pbml0X21hc2soKSBhczoKPiAKPiByZXR1cm4gZmlsbF9tYXNrKCgodWlu
dDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUiAtIDEpOwoKQnV0IChiZXNpZGVzIHRoZSBtaXNz
aW5nIGNsb3NpbmcgcGFyZW50aGVzZSkgdGhhdCdzIG5vdCB3aGF0IHg4NiB3YW50cy4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
