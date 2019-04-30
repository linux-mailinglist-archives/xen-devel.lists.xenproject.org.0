Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0824AF1B6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 09:59:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLNcy-0005Gl-B1; Tue, 30 Apr 2019 07:56:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLNcx-0005Gg-I7
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 07:56:35 +0000
X-Inumbo-ID: 78c35b50-6b1d-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78c35b50-6b1d-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 07:56:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 01:56:33 -0600
Message-Id: <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 01:56:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
In-Reply-To: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDA3OjE5LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBX
aGVuIHRlc3Rpbmcgd2l0aCBhbiBVUCBndWVzdCB3aXRoIGEgcGFzcy10aHJ1IGRldmljZSB3aXRo
IHZ0LWQgcGkKPiBlbmFibGVkIGluIGhvc3QsIHdlIG9ic2VydmVkIHRoYXQgZ3Vlc3QgY291bGRu
J3QgcmVjZWl2ZSBpbnRlcnJ1cHRzCj4gZnJvbSB0aGF0IHBhc3MtdGhydSBkZXZpY2UuIER1bXBp
bmcgSVJURSwgd2UgZm91bmQgdGhlIGNvcnJlc3BvbmRpbmcKPiBJUlRFIGlzIHNldCB0byBwb3N0
ZWQgZm9ybWF0IHdpdGggInZlY3RvciIgZmllbGQgYXMgMC4KPiAKPiBXZSB3b3VsZCBmYWxsIGlu
dG8gdGhpcyBpc3N1ZSB3aGVuIGd1ZXN0IHVzZWQgdGhlIHBpcnEgZm9ybWF0IG9mIE1TSQo+IChz
ZWUgdGhlIGNvbW1lbnQgeGVuX21zaV9jb21wb3NlX21zZygpIGluIGxpbnV4IGtlcm5lbCkuIEFz
ICdkZXN0X2lkJwo+IGlzIHJlcHVycG9zZWQsIHNraXAgbWlncmF0aW9uIHdoaWNoIGlzIGJhc2Vk
IG9uICdkZXN0X2lkJy4KCkkndmUgZ29uZSB0aHJvdWdoIGFsbCB1c2VzIG9mIGd2ZWMsIGFuZCBJ
IGNvdWxkbid0IGZpbmQgYW55IGV4aXN0aW5nCnNwZWNpYWwgY2FzaW5nIG9mIGl0IGJlaW5nIHpl
cm8uIEkgYXNzdW1lIHRoaXMgaXMgYWN0dWFsbHkgY29tbXVuaWNhdGlvbgpiZXR3ZWVuIHRoZSBr
ZXJuZWwgYW5kIHFlbXUsIGluIHdoaWNoIGNhc2UgSSdkIGxpa2UgdG8gc2VlIGFuCmV4cGxhbmF0
aW9uIG9mIHdoeSB0aGUgaXNzdWUgbmVlZHMgdG8gYmUgYWRkcmVzc2VkIGluIFhlbiByYXRoZXIK
dGhhbiBxZW11LiBPdGhlcndpc2UsIGlmIEkndmUgb3Zlcmxvb2tlZCBzb21ldGhpbmcsIHdvdWxk
IHlvdQptaW5kIHBvaW50aW5nIG91dCB3aGVyZSBzdWNoIHNwZWNpYWwgY2FzaW5nIGxpdmVzIGlu
IFhlbj8KCkluIGFueSBldmVudCBpdCBkb2Vzbid0IGxvb2sgY29ycmVjdCB0byBza2lwIG1pZ3Jh
dGlvbiBhbHRvZ2V0aGVyIGluCnRoYXQgY2FzZS4gSSdkIHJhdGhlciBleHBlY3QgaXQgdG8gcmVx
dWlyZSBnZXR0aW5nIGRvbmUgZGlmZmVyZW50bHkuCkFmdGVyIGFsbCB0aGVyZSBzdGlsbCBpcyBh
IChDUFUsIHZlY3RvcikgdHVwbGUgYXNzb2NpYXRlZCB3aXRoIHRoYXQKeyxwfUlSUSBpZiBpdCdz
IG5vdCBwb3N0ZWQsIGFuZCBodm1fbWlncmF0ZV9waXJxKCkgaXMgYSBuby1vcCBpZiBpdCBpcwpw
b3N0ZWQuCgpGaW5hbGx5IGl0IGhhc24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgd2h5IHRoaXMgaXMg
YSBVUC1ndWVzdCBpc3N1ZQpvbmx5LgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
by5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+IEBAIC00MTMsMzQgKzQx
Myw1MiBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+ICAgICAgICAgICAgICAgICAgcGlycV9k
cGNpLT5nbXNpLmdmbGFncyA9IGdmbGFnczsKPiAgICAgICAgICAgICAgfQo+ICAgICAgICAgIH0K
PiAtICAgICAgICAvKiBDYWxjdWxhdGUgZGVzdF92Y3B1X2lkIGZvciBNU0ktdHlwZSBwaXJxIG1p
Z3JhdGlvbi4gKi8KPiAtICAgICAgICBkZXN0ID0gTUFTS19FWFRSKHBpcnFfZHBjaS0+Z21zaS5n
ZmxhZ3MsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX1ZNU0lfWDg2X0RF
U1RfSURfTUFTSyk7Cj4gLSAgICAgICAgZGVzdF9tb2RlID0gcGlycV9kcGNpLT5nbXNpLmdmbGFn
cyAmIFhFTl9ET01DVExfVk1TSV9YODZfRE1fTUFTSzsKPiAtICAgICAgICBkZWxpdmVyeV9tb2Rl
ID0gTUFTS19FWFRSKHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3MsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX1ZNU0lfWDg2X0RFTElWX01BU0spOwo+IC0KPiAt
ICAgICAgICBkZXN0X3ZjcHVfaWQgPSBodm1fZ2lycV9kZXN0XzJfdmNwdV9pZChkLCBkZXN0LCBk
ZXN0X21vZGUpOwo+IC0gICAgICAgIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQgPSBkZXN0
X3ZjcHVfaWQ7Cj4gLSAgICAgICAgc3Bpbl91bmxvY2soJmQtPmV2ZW50X2xvY2spOwo+IC0KPiAt
ICAgICAgICBwaXJxX2RwY2ktPmdtc2kucG9zdGVkID0gZmFsc2U7Cj4gLSAgICAgICAgdmNwdSA9
IChkZXN0X3ZjcHVfaWQgPj0gMCkgPyBkLT52Y3B1W2Rlc3RfdmNwdV9pZF0gOiBOVUxMOwo+IC0g
ICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApCj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBN
aWdyYXRlIHBpcnEgYW5kIGNyZWF0ZSBwb3N0ZWQgZm9ybWF0IElSVEUgb25seSBpZiB3ZSBrbm93
IHRoZSBnbXNpJ3MKPiArICAgICAgICAgKiBkZXN0X2lkIGFuZCB2ZWN0b3IuCj4gKyAgICAgICAg
ICovCj4gKyAgICAgICAgaWYgKCBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyApCgpJZiB3ZSdyZSB0byBn
byB3aXRoIHRoaXMgaHlwZXJ2aXNvciBzaWRlIGNoYW5nZSwgcGxlYXNlIGluc2VydCBhCmJsYW5r
IGxpbmUgYWJvdmUgdGhlIGNvbW1lbnQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
