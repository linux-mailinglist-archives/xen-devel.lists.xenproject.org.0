Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD9C2430
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExUD-0000eg-HO; Mon, 30 Sep 2019 15:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iExUB-0000eb-Vc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:21:16 +0000
X-Inumbo-ID: f0c451b2-e395-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f0c451b2-e395-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 15:21:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DFBAAFA8;
 Mon, 30 Sep 2019 15:21:13 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
 <2a04d106-7419-ca0c-9850-52255d6cf997@suse.com>
 <20190930143041.GB26290@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fc9ea20-a5ae-24b8-104e-23ff9399896f@suse.com>
Date: Mon, 30 Sep 2019 17:21:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930143041.GB26290@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] x86/msi: Don't panic if msix
 capability is missing
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNjozMCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gTW9uLCBTZXAgMzAsIDIw
MTkgYXQgMTE6MTg6MDVBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA5LjIw
MTkgMjM6MjQsIENoYW8gR2FvIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21zaS5jCj4+
PiArKysgYi94ZW4vYXJjaC94ODYvbXNpLmMKPj4+IEBAIC0xMjY1LDcgKzEyNjUsMTMgQEAgaW50
IHBjaV9tc2lfY29uZl93cml0ZV9pbnRlcmNlcHQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsCj4+PiAgICAgICAgICBwb3MgPSBlbnRyeSA/IGVudHJ5LT5tc2lfYXR0cmli
LnBvcwo+Pj4gICAgICAgICAgICAgICAgICAgICAgOiBwY2lfZmluZF9jYXBfb2Zmc2V0KHNlZywg
YnVzLCBzbG90LCBmdW5jLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9DQVBfSURfTVNJWCk7Cj4+PiAtICAgICAgICBBU1NFUlQocG9zKTsKPj4+ICsg
ICAgICAgIGlmICggdW5saWtlbHkoIXBvcykgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAg
ICAgIHByaW50a19vbmNlKFhFTkxPR19XQVJOSU5HCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgIiUwNHg6JTAyeDolMDJ4LiV1IE1TSS1YIGNhcGFiaWxpdHkgaXMgbWlzc2luZ1xuIiwKPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICBzZWcsIGJ1cywgc2xvdCwgZnVuYyk7Cj4+PiArICAg
ICAgICAgICAgcmV0dXJuIC1FQUdBSU47Cj4+PiArICAgICAgICB9Cj4+Cj4+IEJlc2lkZXMgYWdy
ZWVpbmcgd2l0aCBSb2dlcidzIGNvbW1lbnRzLCB3aG9zZSBhY2Nlc3MgZG8gd2UKPj4gaW50ZXJj
ZXB0IGhlcmUgYXQgdGhlIHRpbWUgeW91IG9ic2VydmUgdGhlIG9wZXJhdGlvbiBhYm92ZQo+PiBw
cm9kdWNpbmcgYSB6ZXJvICJwb3MiPyBJZiBpdCdzIERvbTAsIHRoZW4gc3VyZWx5IHRoZXJlJ3Mg
YSBidWcKPj4gaW4gRG9tMCBkb2luZyB0aGUgYWNjZXNzIGluIHRoZSBmaXJzdCBwbGFjZSB3aGVu
IGEgcmVzZXQgaGFzbid0Cj4+IGNvbXBsZXRlZCB5ZXQ/Cj4+IElmIGl0J3MgYSBEb21VLCB0aGVu
IGlzIHRoZSByZXNldCBoYXBwZW5pbmcKPj4gYmVoaW5kIF9pdHNfIGJhY2sgYXMgd2VsbCAod2hp
Y2ggaXMgbm90IGdvaW5nIHRvIGVuZCB3ZWxsKT8KPiAKPiBMb29rcyBsaWtlIGl0IGlzIERvbTAu
IFhlbiBzaG91bGQgZGVmZW5kIGFnYWluc3QgRG9tMCBidWdzLCByaWdodD8KClRvIGEgZGVncmVl
LCB5ZXMuIEJ1dCB3aGF0IHlvdSBzdWdnZXN0IGFib3ZlIGlzICh0byBtZSkgbm90IGRlZmVuc2Us
CmJ1dCBzaW1wbHkgcGFwZXJpbmcgb3ZlciBhbiBpc3N1ZS4gV2hhdCBoYXBwZW5zIHdpdGggLi4u
Cgo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDI3ZWQ5MD5d
IHBjaV9tc2lfY29uZl93cml0ZV9pbnRlcmNlcHQrMHhkNy8weDIxNgo+IChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDI5N2Q5OT5dIHBjaV9jb25mX3dyaXRlX2ludGVyY2VwdCsweDY4LzB4NzIKPiAoWEVO
KSAgICBbPGZmZmY4MmQwODAzN2Q0MGI+XSBlbXVsLXByaXYtb3AuYyNwY2lfY2ZnX29rKzB4YjUv
MHgxNDYKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAzN2Q1YWY+XSBlbXVsLXByaXYtb3AuYyNndWVz
dF9pb193cml0ZSsweDExMy8weDIwYgo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDM3ZGI2NT5dIGVt
dWwtcHJpdi1vcC5jI3dyaXRlX2lvKzB4ZGEvMHhlNAo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDJi
ZjM1ZD5dIHg4Nl9lbXVsYXRlKzB4MTFjZjcvMHgzMTY5ZAo+IChYRU4pICAgIFs8ZmZmZjgyZDA4
MDJlMDliZD5dIHg4Nl9lbXVsYXRlX3dyYXBwZXIrMHgyNi8weDVmCj4gKFhFTikgICAgWzxmZmZm
ODJkMDgwMzdmNTdlPl0gcHZfZW11bGF0ZV9wcml2aWxlZ2VkX29wKzB4MTUwLzB4MjcxCj4gKFhF
TikgICAgWzxmZmZmODJkMDgwMmE4MGJiPl0gZG9fZ2VuZXJhbF9wcm90ZWN0aW9uKzB4MjBiLzB4
MjU3Cj4gKFhFTikgICAgWzxmZmZmODJkMDgwMzg3YTNkPl0geDg2XzY0L2VudHJ5LlMjaGFuZGxl
X2V4Y2VwdGlvbl9zYXZlZCsweDY4LzB4OTQKCi4uLiB0aGlzIGNhbGwgc3RhY2sgaXMgdGhhdCB0
aGUgcmVxdWVzdCBieSBEb20wIHNpbXBseSBnZXRzIGRyb3BwZWQKb24gdGhlIGZsb29yLiBIb3cg
ZG8geW91IGVuc3VyZSB0aGlzIGlzbid0IGdvaW5nIHRvIGNhdXNlIGZ1cnRoZXIKcHJvYmxlbXMg
ZG93biB0aGUgcm9hZD8gSU9XIEkgdGhpbmsgaW4gdGhpcyBjYXNlIHRoZSBmaXggbmVlZGVkIHRv
CmJlIGluIERvbTAsIGFuZCBJIGRvbid0IHRoaW5rIFhlbiBuZWNlc3NhcmlseSBoYXMgdG8gbWFr
ZSB0aGluZ3MKYXBwZWFyIHRvIGhhdmUgZ29uZSBzbW9vdGhseS4gV2hhdCBJIF9jb3VsZF8gc2Vl
IFhlbiBkbyBpbiB0aGlzCmNhc2UgaXMgYWN0dWFsbHkgcHVuaXNoIERvbTAsIGUuZy4gYnkgaW5q
ZWN0aW5nICNHUCgwKS4gKE9idmlvdXNseQp0aGlzIHdvbid0IGJlIGEgZ29vZCBpZGVhIGFoZWFk
IG9mIHRoZSBpc3N1ZSBhY3R1YWxseSBnZXR0aW5nCmZpeGVkIF9pbl8gRG9tMC4pCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
