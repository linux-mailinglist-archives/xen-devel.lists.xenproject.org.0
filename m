Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01C1492C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 13:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNc6Y-00023p-Dd; Mon, 06 May 2019 11:48:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNc6W-00023f-GY
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 11:48:20 +0000
X-Inumbo-ID: d6d3c95f-6ff4-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d6d3c95f-6ff4-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 11:48:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,437,1549929600"; d="scan'208";a="89669900"
Date: Mon, 6 May 2019 13:48:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190506114809.56e2sl4z6w2z4na2@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF0F0200007800229EBC@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DF0F0200007800229EBC@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/9] x86/IRQ: fix locking around vector
 management
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjU6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxsIG9mIF9fe2Fzc2lnbixiaW5kLGNsZWFyfV9pcnFfdmVjdG9yKCkgbWFuaXB1bGF0
ZSBzdHJ1Y3QgaXJxX2Rlc2MKPiBmaWVsZHMsIGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxsZWQg
d2l0aCB0aGUgZGVzY3JpcHRvciBsb2NrIGhlbGQgaW4KPiBhZGRpdGlvbiB0byB2ZWN0b3JfbG9j
ay4gVGhpcyBpcyBjdXJyZW50bHkgdGhlIGNhc2UgZm9yIG9ubHkKPiBzZXRfZGVzY19hZmZpbml0
eSgpIGFuZCBkZXN0cm95X2lycSgpLCB3aGljaCBhbHNvIGNsYXJpZmllcyB3aGF0IHRoZQoKQUZB
SUNUIHNldF9kZXNjX2FmZmluaXR5IGlzIGNhbGxlZCBmcm9tIHNldF9pb2FwaWNfYWZmaW5pdHlf
aXJxIHdoaWNoIGluCnR1cm4gaXMgY2FsbGVkIGZyb20gc2V0dXBfaW9hcGljX2Rlc3Qgd2l0aG91
dCBob2xkaW5nIHRoZSBkZXNjIGxvY2suCklzIHRoaXMgZmluZSBiZWNhdXNlIHRoYXQncyBvbmx5
IHVzZWQgYSBib290IHRpbWU/Cgo+IG5lc3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0aGUgbG9ja3Mg
aGFzIHRvIGJlLiBSZWZsZWN0IHRoZSBuZXcKPiBleHBlY3RhdGlvbiBieSBoYXZpbmcgdGhlc2Ug
ZnVuY3Rpb25zIGFsbCB0YWtlIGEgZGVzY3JpcHRvciBhcwo+IHBhcmFtZXRlciBpbnN0ZWFkIG9m
IGFuIGludGVycnVwdCBudW1iZXIuCj4gCj4gRHJvcCBvbmUgb2YgdGhlIHR3byBsZWFkaW5nIHVu
ZGVyc2NvcmVzIGZyb20gYWxsIHRocmVlIGZ1bmN0aW9ucyBhdAo+IHRoZSBzYW1lIHRpbWUuCj4g
Cj4gVGhlcmUncyBvbmUgY2FzZSBsZWZ0IHdoZXJlIGRlc2NyaXB0b3JzIGdldCBtYW5pcHVsYXRl
ZCB3aXRoIGp1c3QKPiB2ZWN0b3JfbG9jayBoZWxkOiBzZXR1cF92ZWN0b3JfaXJxKCkgYXNzdW1l
cyBpdHMgY2FsbGVyIHRvIGFjcXVpcmUKPiB2ZWN0b3JfbG9jaywgYW5kIGhlbmNlIGNhbid0IGl0
c2VsZiBhY3F1aXJlIHRoZSBkZXNjcmlwdG9yIGxvY2tzICh3cm9uZwo+IGxvY2sgb3JkZXIpLiBJ
IGRvbid0IGN1cnJlbnRseSBzZWUgaG93IHRvIGFkZHJlc3MgdGhpcy4KCkNhbiB5b3UgdGFrZSB0
aGUgZGVzYyBsb2NrIGFuZCB2ZWN0b3IgbG9jayBmb3IgZWFjaCBpcnEgaW4gdGhlIHNlY29uZAps
b29wIG9mIHNldHVwX3ZlY3Rvcl9pcnEgYW5kIHJlbW92ZSB0aGUgdmVjdG9yIGxvY2tpbmcgZnJv
bSB0aGUgY2FsbGVyPwoKVGhhdCBtaWdodCBiZSBpbmVmZmljaWVudCwgYnV0IGl0J3MganVzdCBk
b25lIGZvciBDUFUgaW5pdGlhbGl6YXRpb24uCgpBRkFJQ1QgdGhlIGZpcnN0IGxvb3Agb2Ygc2V0
dXBfdmVjdG9yX2lycSBkb2Vzbid0IHJlcXVpcmUgYW55IGxvY2tpbmcKc2luY2UgaXQncyBwZXIt
Y3B1IGluaXRpYWxpemF0aW9uLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpDaGFuZ2UgbG9va3MgZ29vZCB0byBtZToKClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2lycS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAgLTI3LDYgKzI3LDcg
QEAKPiAgI2luY2x1ZGUgPHB1YmxpYy9waHlzZGV2Lmg+Cj4gIAo+ICBzdGF0aWMgaW50IHBhcnNl
X2lycV92ZWN0b3JfbWFwX3BhcmFtKGNvbnN0IGNoYXIgKnMpOwo+ICtzdGF0aWMgdm9pZCBfY2xl
YXJfaXJxX3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpOwo+ICAKPiAgLyogb3B0X25vaXJx
YmFsYW5jZTogSWYgdHJ1ZSwgc29mdHdhcmUgSVJRIGJhbGFuY2luZy9hZmZpbml0eSBpcyBkaXNh
YmxlZC4gKi8KPiAgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9ub2lycWJhbGFuY2U7Cj4gQEAgLTEx
MiwxMyArMTEzLDEyIEBAIHN0YXRpYyB2b2lkIHRyYWNlX2lycV9tYXNrKHUzMiBldmVudCwgaW4K
PiAgICAgIHRyYWNlX3ZhcihldmVudCwgMSwgc2l6ZW9mKGQpLCAmZCk7Cj4gIH0KPiAgCj4gLXN0
YXRpYyBpbnQgX19pbml0IF9fYmluZF9pcnFfdmVjdG9yKGludCBpcnEsIGludCB2ZWN0b3IsIGNv
bnN0IGNwdW1hc2tfdCAqY3B1X21hc2spCj4gK3N0YXRpYyBpbnQgX19pbml0IF9iaW5kX2lycV92
ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpkZXNjLCBpbnQgdmVjdG9yLAoKSSB3b3VsZG4ndCBiZSBv
cHBvc2VkIHRvIGFkZGluZyBBU1NFUlRzIGhlcmUgKGFuZCBpbgpfe2Fzc2lnbixiaW5kLGNsZWFy
fV9pcnFfdmVjdG9yLCBzZXRfZGVzY19hZmZpbml0eSBhbmQgZGVzdHJveV9pcnEpCnRvIGNoZWNr
IGZvciBsb2NrIGNvcnJlY3RuZXNzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
