Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C434214E098
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 19:13:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixEH6-0001Ag-8r; Thu, 30 Jan 2020 18:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q1Hx=3T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ixEH4-0001Ab-Ah
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 18:10:42 +0000
X-Inumbo-ID: d32d08fa-438b-11ea-b211-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d32d08fa-438b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580407842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nkleu6ZkiFD131TcSAm7XirJ2QHSFbrNfzGapYBw/aM=;
 b=X8yGqe9xvnkvxNRZM4T9SX8GNEeNNSM91NtOanQfEC+AY7zcTRfA1GSb
 ll3Yo0Rm57n7BOqdkunYBSKwYIWUA5yZ0iBt0JOawqZO/yXP2FSjrm5hI
 YvtfBkg5vKwhTAGXON4ORYgRq4JbqDG91OVEHhp6lg5Ehu/j0EPfX5HqP 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: F0lZW6WG9mNSS72FkSRAMWgvCZMQcxSsAcIK9kR/4KZ2MeqPEHMiRmCBF2WInW5G9ZPfw2agGq
 LVOuUuEZSnaz05kk+B4GbEzYVfLJKg34q2NOV4tDYnO2UUFuZcYjnOOSzO1ZG3daDRDTKLu+/9
 sc9rZvT1g3XqFIBqkV0yld1XNYs8y6qK1s9egut+Ys6YSXZcEMXE67p1hUDXVOEVpqlnjBEi3j
 aZUVzW15CwG28/S7SwPBFd3EWPIR4C3i1lqFkwfzYiSXxqtuEIW6nvND+gxjCPLCWXrpET/6Ah
 2uU=
X-SBRS: 2.7
X-MesageID: 11871971
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11871971"
Date: Thu, 30 Jan 2020 18:10:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130181038.GQ1288@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-5-anthony.perard@citrix.com>
 <db579f9f-d816-47f9-e75c-4b20d60bda3b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db579f9f-d816-47f9-e75c-4b20d60bda3b@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 04/12] xen/build: extract clean
 target from Rules.mk
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDM6MzA6MTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBGcm9t
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAZ21haWwuY29tPgo+ID4gCj4gPiBNb3N0
IG9mIHRoZSBjb2RlIGV4ZWN1dGVkIGJ5IFJ1bGVzLm1rIGlzbid0IG5lY2Vzc2FyeSBmb3IgdGhl
IGNsZWFuCj4gPiB0YXJnZXQsIGVzcGVjaWFsbHkgbm90IHRoZSBDRkxBR1MuIFRoaXMgbWFrZSBy
dW5uaW5nIG1ha2UgY2xlYW4gbXVjaAo+ID4gZmFzdGVyLgo+ID4gCj4gPiBUaGlzIGV4dHJhY3Qg
dGhlIGNvZGUgaW50byBhIGRpZmZlcmVudCBNYWtlZmlsZS4gSXQgZG9lc24ndCB3YW50IHRvCj4g
PiBpbmNsdWRlIENvbmZpZy5tayBlaXRoZXIgc28gdmFyaWFibGVzIERFUFNfUk0gYW5kIERFUFNf
SU5DTFVERSBhcmUKPiA+IGV4dHJhY3RlZCBmcm9tIENvbmZpZy5tayBhcyB3ZWxsLiBERVBTX0lO
Q0xVREUgaXMgcHV0IGludG8KPiA+IEtidWlsZC5pbmNsdWRlIHNvIGl0IGNvdWxkIGJlIHVzZSBi
eSBvdGhlciBNYWtlZmlsZXMuCj4gCj4gImV4dHJhY3RlZCIgbWFrZXMgaXQgc291bmQgYXMgaWYg
dGhlIGludGVudGlvbiB3YXMgdG8gbW92ZSB0aGluZ3MsCj4geWV0IC4uLgo+IAo+ID4gLS0tCj4g
PiAgeGVuL1J1bGVzLm1rICAgICAgICAgICAgICAgfCAxMyAtLS0tLS0tLS0tLS0tCj4gPiAgeGVu
L3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUgfCAgNyArKysrKystCj4gPiAgeGVuL3NjcmlwdHMvTWFr
ZWZpbGUuY2xlYW4gfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IC4u
LiAuL0NvbmZpZy5tayBkb2Vzbid0IGdldCB0b3VjaGVkIGF0IGFsbC4gSSBndWVzcyB0aGVyZSBh
cmUgcmVhc29ucwo+IGZvciB0aGlzLCBidXQgSSBjb25zaWRlciBpdCBkYW5nZXJvdXMgdG8gbGVh
dmUgaW5kZXBlbmRlbnQgZGVmaW5pdGlvbnMKPiBvZiB0aGUgc2FtZSB2YXJpYWJsZXMgaW4gZGlz
Y29ubmVjdGVkIHBsYWNlcy4gV2hhdCBpZiBvbmUgc2lkZSBnZXRzCj4gdXBkYXRlZCB3aXRob3V0
IG5vdGljaW5nIHRoZSBvdGhlcj8KCkkgZ3Vlc3MgdGhlIHdvcmQgImV4dHJhY3RlZCIgaXMgdGhl
IHdyb25nIG9uZS4gSSdsbCBuZWVkIHRvIHJld3JpdGUgdGhlCnBhdGNoIGNvbW1lbnRhcnkuCgpB
cyBmb3Igd2h5IENvbmZpZy5tayBpc24ndCBjaGFuZ2UsIGl0J3MgYmVjYXVzZSBpdCBpcyB1c2Vk
IGJ5IGJvdGggdGhlCmh5cGVydmlzb3IgbWFrZWZpbGVzIGFuZCB0aGUgdG9vbHMgbWFrZWZpbGVz
LiBJIHdvdWxkIGxpa2UgZm9yIHJlY3Vyc2l2ZQptYWtlZmlsZXMgdG8gbm90IGluY2x1ZGUgQ29u
ZmlnLm1rIGFueW1vcmUsIHNvIGhhdmluZyBvbmx5IHhlbi9NYWtlZmlsZQpkb2luZyB0aGF0IGlu
Y2x1ZGUuIChJIHdvdWxkIGxpa2UgdG8gZ28gZnVydGhlciBhbmQgbm90IHVzZWQgQ29uZmlnLm1r
CmFueW1vcmUsIGJ1dCB0aGF0IG1pZ2h0IG5vdCBiZSBuZWNlc3NhcnkuKQoKQXMgZm9yIHRoZSBs
YXN0IHBvaW50LCB0aGUgdmFyaWFibGVzIERFUFNfUk0gYW5kIERFUFNfSU5DTFVERSBhcmUgY29w
aWVkCmJlY2F1c2UgTWFrZWZpbGUuY2xlYW4gZG9lc24ndCBoYXZlIHRoZW0gYW5kIGF0IHNvbWUg
cG9pbnQgUnVsZXMubWsgKG5vCnBhdGNoIHlldCkgaXNuJ3QgZ29pbmcgdG8gaGF2ZSB0aGVtIGVp
dGhlciwgc28gdGhlcmUgd2lsbCBiZSBhIHNpbmdsZQpsb2NhdGlvbiB3aGljaCBpcyBLYnVpbGQu
aW5jbHVkZS4gQ3VycmVudGx5IHdpdGggdGhpcyBwYXRjaCwgYm90aAp2YXJpYWJsZXMgZnJvbSBL
YnVpbGQuaW5jbHVkZSBhcmUgdGhlIG9uZSB1c2VkIGJ5IFJ1bGVzLm1rLCBzbyBpdApkb2Vzbid0
IG1hdHRlciBpZiBDb25maWcubWsgaXMgbW9kaWZpZWQuCgpUaGluZ3MgZG9lc24ndCBsb29rIGdy
ZWF0IHlldCwgYnV0IGl0IGRvZXNuJ3QgZmVlbCBsaWtlIHRoZXJlIGFyZSBiZXR0ZXIKd2F5IHRv
IHJlZmFjdG9yIHRoZSBidWlsZCBzeXN0ZW0uCgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIv
eGVuL3NjcmlwdHMvTWFrZWZpbGUuY2xlYW4KPiA+ICsjIEZpZ3VyZSBvdXQgd2hhdCB3ZSBuZWVk
IHRvIGJ1aWxkIGZyb20gdGhlIHZhcmlvdXMgdmFyaWFibGVzCj4gCj4gcy9idWlsZC9jbGVhbi8g
PwoKWWVwLCBJIGp1c3QgY29weSB0aGUgdHlwbyBmcm9tIExpbnV4LiBCdXQgSSBjYW4gZml4IGl0
IGluIG91ciByZXBvLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
