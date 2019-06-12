Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6084423F9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 13:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb1Pm-0007SN-KC; Wed, 12 Jun 2019 11:27:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8NI=UL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hb1Pl-0007SG-DE
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 11:27:37 +0000
X-Inumbo-ID: 1215f83a-8d05-11e9-9800-bf628c935e84
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1215f83a-8d05-11e9-9800-bf628c935e84;
 Wed, 12 Jun 2019 11:27:33 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IcSVai1yXUREa48blqlRE5yfGuKAu3qdxEuj+axonU6eV1/uiGKQxLJlBv4A6Dsrpvtz5eO1JN
 /Ajb+TBVYmJyP94K3O0GFUK46358sp+S0w9u5P0ilQcv5RElOBexDqwxiVq7YSfNJoinXa1O+L
 1J4qz9gI8yoYXZKth55XohrdqHYXv/WfjAxXzcg1VqxQ0XrjLdk4dxonRqtcpCGjKiKdZCceUC
 EzMoEGIbVNjFqSYaKYILheAoJ7gFGQcJXQ/4VhJFZKIKjkZ3nPuwAC8+Wkih4To9ztZ+yF2B/W
 8ww=
X-SBRS: 2.7
X-MesageID: 1642565
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,365,1557201600"; 
   d="scan'208";a="1642565"
To: Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20190528103313.13431jgross@suse.com>
 <20190528103313.13434jgross@suse.com>
 <afe9fd8d36b5e946208436bf8f7dcaba@citrix.com>
 <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
 <5D00C6960200007800237622@suse.com>
 <0889f51d8aed0c95ecfcd038678f945abf2ca42a.camel@suse.com>
 <5D00D07F020000780023768C@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <44422740-bef7-0025-a139-67aa0de13982@citrix.com>
Date: Wed, 12 Jun 2019 12:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D00D07F020000780023768C@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDYvMjAxOSAxMToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDYuMTkg
YXQgMTE6NTYsIDxkZmFnZ2lvbGlAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiBXZWQsIDIwMTktMDYt
MTIgYXQgMTA6MzIgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTIuMDYuMTkg
YXQgMTA6MTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDEyLjA2LjE5IDEwOjA1
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBPbiAyOC8wNS8yMDE5IDExOjMyLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4+Pj4gKyAgICBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KSA9IG5ld19v
cHM7Cj4+Pj4+PiArICAgIHNkLT5zY2hlZF9wcml2ID0gcHByaXY7Cj4+Pj4+PiArCj4+Pj4+PiAr
ICAgIC8qCj4+Pj4+PiArICAgICAqIChSZT8pcm91dGUgdGhlIGxvY2sgdG8gdGhlIHBlciBwQ1BV
IGxvY2sgYXMgL2xhc3QvCj4+Pj4+PiB0aGluZy4gSW4gZmFjdCwKPj4+Pj4+ICsgICAgICogaWYg
aXQgaXMgZnJlZSAoYW5kIGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0Cj4+Pj4+
PiBtYW5hZ2VzCj4+Pj4+PiArICAgICAqIHRha2luZyBpdCwgZmluZHMgYWxsIHRoZSBpbml0aWFs
aXphdGlvbnMgd2UndmUgZG9uZQo+Pj4+Pj4gYWJvdmUgaW4gcGxhY2UuCj4+Pj4+PiArICAgICAq
Lwo+Pj4+Pj4gKyAgICBzbXBfbWIoKTsKPj4+Pj4gQSBmdWxsIG1lbW9yeSBiYXJyaWVyIGlzIGEg
bWFzc2l2ZSBvdmVyaGVhZCBmb3Igd2hhdCBzaG91bGQgYmUKPj4+Pj4gc21wX3dtYigpLiAgVGhl
IG1hdGNoaW5nIGJhcnJpZXIgaXMgYWN0dWFsbHkgaGlkZGVuIGluIHRoZQo+Pj4+PiBpbXBsaWNp
dAo+Pj4+PiBzZW1hbnRpY3Mgb2YgbWFuYWdpbmcgdG8gbG9jayBzZC0+c2NoZWR1bGVfbG9jayAo
d2hpY2ggaXMgdHJpYWwKPj4+Pj4gYW4gZXJyb3IKPj4+Pj4gYW55d2F5KSwgYnV0IHRoZSBvbmx5
IHRoaW5nIHRoYXQgbWF0dGVycyBoZXJlIGlzIHRoYXQgYWxsIG90aGVyCj4+Pj4+IHdyaXR0ZW4K
Pj4+Pj4gZGF0YSBpcyBpbiBwbGFjZSBmaXJzdC4KPj4+Pj4KPj4+PiBOb3QgdGhhdCBpdCB3b3Vs
ZCByZWFsbHkgbWF0dGVyIGZvciBwZXJmb3JtYW5jZSAoc3dpdGNoaW5nIGNwdXMKPj4+PiBiZXR3
ZWVuCj4+Pj4gY3B1cG9vbHMgaXMgYSBfdmVyeV8gcmFyZSBvcGVyYXRpb24pLCBJJ20gZmluZSB0
cmFuc2Zvcm1pbmcgdGhlCj4+Pj4gYmFycmllcgo+Pj4+IGludG8gc21wX3dtYigpLgo+Pj4gVGhp
cyBhZ2FpbiBpcyBhIGNoYW5nZSBlYXN5IGVub3VnaCB0byBtYWtlIHdoaWxlIGNvbW1pdHRpbmcu
IEknbQo+Pj4gcmVjb3JkaW5nIHRoZSBhYm92ZSBpbiBjYXNlIEkgZW5kIHVwIGJlaW5nIHRoZSBj
b21taXR0ZXIuCj4+Pgo+PiBJJ20gZmluZSAoaS5lLiwgbXkgUmV2LWJ5OiByZW1haW5zIHZhbGlk
KSB3aXRoIHRoaXMgYmVpbmcgdHVybmVkIGludG8gYQo+PiB3bWIoKSwgYW5kIGl0IGJlaW5nIGRv
bmUgdXBvbiBjb21taXQgKHRoYW5rcyBKYW4gZm9yIHRoZSBvZmZlciB0byBkbwo+PiB0aGF0ISku
Cj4+Cj4+IElmIHdlIGRvIGl0LCBob3dldmVyLCBJIHRoaW5rIHRoZSBjb21tZW50IG5lZWRzIHRv
IGJlIGFkanVzdGVkIHRvbywgYW5kCj4+IHRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBicmll
Zmx5IG1lbnRpb24gdGhpcyBuZXcgY2hhbmdlIHdlJ3JlCj4+IGRvaW5nLgo+Pgo+PiBNYXliZSwg
Zm9yIHRoZSBjb21tZW50LCBhZGQgc29tZXRoaW5nIGxpa2U6Cj4+Cj4+ICJUaGUgc21wX3dtYigp
IGNvcnJlc3BvbmRzIHRvIHRoZSBiYXJyaWVyIGltcGxpY2l0IGluIHN1Y2Nlc3NmdWxseQo+PiB0
YWtpbmcgdGhlIGxvY2suIgo+IEknbSBub3QgZW50aXJlbHkgaGFwcHkgd2l0aCB0aGlzIG9uZTog
VGFraW5nIGEgbG9jayBpcyBhbiBpbXBsaWNpdCBmdWxsCj4gYmFycmllciwgc28gY2Fubm90IGFs
b25lIGJlIHVzZWQgdG8gcmVhc29uIHdoeSBhIHdyaXRlIGJhcnJpZXIgaXMKPiBzdWZmaWNpZW50
IGhlcmUuCgpJdCBpcyBhIGNvbnNlcXVlbmNlIG9mIG91ciBleHRyYSBtYWdpYyBzY2hlZHVsZXIg
bG9ja3Mgd2hpY2ggcHJvdGVjdCB0aGUKcG9pbnRlciB1c2VkIHRvIGxvY2F0ZSB0aGVtLCBhbmQg
dGhlIGVuc3VpbmcgZG91YmxlLXN0ZXAgaW4gPz8/CihzZXJpb3VzbHkgLSBJIGNhbid0IGZpZ3Vy
ZSBvdXQgdGhlIGZ1bmN0aW9uIG5hbWVzIGNyZWF0ZWQgYnkgdGhlCnNjaGVkX2xvY2soKSBtb25z
dHJvc2l0eSkgd2hpY2ggdGFrZSB0aGUgbG9jaywgcmUtcmVhZCB0aGUgbG9jayBwb2ludGVyCmFu
ZCBkcm9wIG9uIGEgbWlzbWF0Y2guCgpJJ3ZlIGdvbmUgd2l0aDoKCivCoMKgwqAgLyoKK8KgwqDC
oMKgICogVGhlIGRhdGEgYWJvdmUgaXMgcHJvdGVjdGVkIHVuZGVyIG5ld19sb2NrLCB3aGljaCBt
YXkgYmUgdW5sb2NrZWQuCivCoMKgwqDCoCAqIEFub3RoZXIgQ1BVIGNhbiB0YWtlIG5ld19sb2Nr
IGFzIHNvb24gYXMgc2QtPnNjaGVkdWxlX2xvY2sgaXMKdmlzaWJsZSwKK8KgwqDCoMKgICogYW5k
IG11c3Qgb2JzZXJ2ZSBhbGwgcHJpb3IgaW5pdGlhbGlzYXRpb24uCivCoMKgwqDCoCAqLworwqDC
oMKgIHNtcF93bWIoKTsKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
