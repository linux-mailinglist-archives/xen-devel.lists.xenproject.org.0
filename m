Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3D10A41
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 17:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLrPF-0001fJ-Io; Wed, 01 May 2019 15:44:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WEFG=TB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hLrPE-0001en-Ey
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 15:44:24 +0000
X-Inumbo-ID: fd420a0d-6c27-11e9-843c-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fd420a0d-6c27-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 15:44:23 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8A705305FFA2; Wed,  1 May 2019 18:44:21 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.181.74])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 341D5306E4AC;
 Wed,  1 May 2019 18:44:21 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
 <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
 <CABfawh=Q6iYej3xAEAwwJd=X_HzbU0iLLUTHby=1QDstBZf4QA@mail.gmail.com>
 <CABfawhnMLKb3psg81x4FzVX8UbgGrZYzOJkYXaTxFzABsGoXtg@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <36354bcd-a0ac-dd52-3609-ed74b909a7b4@bitdefender.com>
Date: Wed, 1 May 2019 18:43:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnMLKb3psg81x4FzVX8UbgGrZYzOJkYXaTxFzABsGoXtg@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xLzE5IDY6MDEgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBXZWQsIE1heSAx
LCAyMDE5IGF0IDg6NTMgQU0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3
cm90ZToKPj4KPj4gT24gV2VkLCBNYXkgMSwgMjAxOSBhdCA4OjIwIEFNIFJhenZhbiBDb2pvY2Fy
dQo+PiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gNS8xLzE5
IDQ6NTggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+IEl0IG1pZ2h0IGJlIHdvcnRo
IGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJvbSBodyIgaG9vayB3aGljaCBjb2xsZWN0cwo+
Pj4+Pj4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0aW9u
IGFnZW50Lgo+Pj4+Pgo+Pj4+PiBZb3UgbWVhbiBhZGRpbmcgYW5vdGhlciBodm0gaG9vaz8KPj4+
Pgo+Pj4+IEFjdHVhbGx5LCBpbnN0ZWFkIG9mIGFub3RoZXIgaG9vayBJIHRoaW5rIHdoYXQgd291
bGQgbWFrZSBzZW5zZSBpdCB0bwo+Pj4+IGp1c3QgdXBkYXRlIHZteF9zYXZlX3ZtY3NfY3R4dCB0
byBhdXRvbWF0aWNhbGx5IHJlZnJlc2ggdGhlIGNhY2hlZAo+Pj4+IHJlZ2lzdGVyIHZhbHVlcyB3
aGVuIGl0J3MgY2FsbGVkIHdpdGggInYgPT0gY3VycmVudCIuIFRob3VnaHRzPwo+Pj4KPj4+IFRo
YXQncyBwcm9iYWJseSB0aGUgYmV0dGVyIHdheSB0byBnbyBhYm91dCBpdCwgc2luY2Ugb3RoZXJ3
aXNlIHRoZQo+Pj4geGNfaHZtX2dldGNvbnRleHRfcGFydGlhbCgpIGh5cGVyY2FsbCB3aWxsIHN1
ZmZlciBmcm9tIHRoZSBzYW1lIHByb2JsZW0uCj4+PiAodGhlcmUgYXJlIHR3byB3YXlzIG9mIGdl
dHRpbmcgZ3Vlc3Qgc3RhdGU6IG9uZSBpcyB2aWEgdGhlIHZtX2V2ZW50Cj4+PiBjYWNoZWQgdmFs
dWVzLCB0aGUgb3RoZXIgaXMgdmlhIHRoZSBhZm9yZW1lbnRpb25lZCBoeXBlcmNhbGwpLgo+Pgo+
PiBUcnVlLCBhbHRob3VnaCBpc3N1aW5nIHRoZSBoeXBlcmNhbGwgaW4gdGhlIHZtX2V2ZW50IGNh
bGxiYWNrIGlzCj4+IGFjdHVhbGx5IGZpbmUgLSB0aGF0J3MgaG93IEkgZm91bmQgdGhlIGlzc3Vl
IHRvIGJlZ2luIHdpdGgsIHNpbmNlIHRoZQo+PiB2Q1BVIHdpbGwgYmUgc2NoZWR1bGVkIG91dCB3
aXRoIHRoZSBjYWNoZWQgcmVnaXN0ZXJzIHJlZnJlc2hlZCBhbmQKPj4gdGh1cyBiZSBkaWZmZXJl
bnQgdGhlbiB3aGF0IHRoZSB2bV9ldmVudCBpdHNlbGYgaGFkLiBCdXQgb3RoZXIgY2FsbGVycwo+
PiBvZiB0aGUgaHlwZXJjYWxsIGNhbiBydW4gaW50byB0aGUgcHJvYmxlbSBpZiB0aGUgZ3Vlc3Qv
dmNwdSBpcyBub3QKPj4gcGF1c2VkLgo+IAo+IEFjdHVhbGx5LCBkb2luZyB0aGUgInYgPT0gY3Vy
cmVudCIgY2hlY2sgd291bGRuJ3QgcmVhbGx5IGRvIGFueXRoaW5nCj4gZm9yIHRoZSBoeXBlcmNh
bGwgc2luY2UgaXQncyBub3QgdGhlIGRvbWFpbiBpc3N1aW5nIHRoZSBoeXBlcmNhbGwgb24KPiBp
dHNlbGYuIFRoZSBvbmx5IHdheSB0byBlbnN1cmUgdGhhdCBoeXBlcmNhbGwgaXMgcmV0dXJuaW5n
IGNvcnJlY3QKPiB2YWx1ZXMgd291bGQgYmUgdG8gcGF1c2UgdGhlIHZDUFUuCgpJJ3ZlIGRpc2N1
c3NlZCB0aGlzIHdpdGggQW5kcmV3IGluIHRoZSBtZWFudGltZSBhbmQgaGUncyBraW5kbHkgcG9p
bnRlZApvdXQgdGhhdCBmb3IgdGhlIGh5cGVyY2FsbCB3ZSBwYXVzZSBmcm9tIHJlbW90ZSBjb250
ZXh0LCB3aGljaCBmb3JjZXMgYQpkZS1zY2hlZHVsZS4gU28gdGhlIGh5cGVyY2FsbCBfc2hvdWxk
XyBiZSBmaW5lLiBCdXQgd2Ugd3JpdGUgZGF0YSB0byB0aGUKdm1fZXZlbnQgcmluZyBmcm9tIHRo
ZSBjdXJyZW50IGNvbnRleHQsIHdoZXJlIHN0YXRlIG1pZ2h0IGFjdHVhbGx5IGJlIGluCmhhcmR3
YXJlLgoKSGUnbGwgcHJvYmFibHkgY2hpbWUgaW4gd2l0aCBhZGRpdGlvbmFsIHN1Z2dlc3Rpb25z
IC8gY29tbWVudHMuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
