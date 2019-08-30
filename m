Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE4A30F2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 09:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3bHW-0000Nu-Nc; Fri, 30 Aug 2019 07:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3bHV-0000Np-LL
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 07:25:13 +0000
X-Inumbo-ID: 4d7716c2-caf7-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d7716c2-caf7-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 07:25:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F85AACA0;
 Fri, 30 Aug 2019 07:25:11 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-11-git-send-email-chao.gao@intel.com>
 <20190822135923.fmontcb7dofrok4c@Air-de-Roger>
 <ea7b2234-ec3f-1199-3077-a1a610883049@suse.com>
 <20190830032253.GA31905@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f4bba52-c3ef-dcd9-58df-fa0d55b7d505@suse.com>
Date: Fri, 30 Aug 2019 09:25:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830032253.GA31905@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 10/15] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAwNToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBBdWcgMjksIDIw
MTkgYXQgMTI6MDY6MjhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIyLjA4LjIw
MTkgMTU6NTksIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gU2VlaW5nIGhvdyB0aGlzIHdv
cmtzIEknbSBub3Qgc3VyZSB3aGF0J3MgdGhlIGJlc3Qgb3B0aW9uIGhlcmUuIEFzCj4+PiB1cGRh
dGluZyB3aWxsIGJlIGF0dGVtcHRlZCBvbiBvdGhlciBDUFVzLCBJJ20gbm90IHN1cmUgaWYgaXQn
cyBPSyB0bwo+Pj4gcmV0dXJuIGFuIGVycm9yIGlmIHRoZSB1cGRhdGUgc3VjY2VlZCBvbiBzb21l
IENQVXMgYnV0IGZhaWxlZCBvbgo+Pj4gb3RoZXJzLgo+Pgo+PiBUaGUgb3ZlcmFsbCByZXN1bHQg
b2YgYSBwYXJ0aWFsbHkgc3VjY2Vzc2Z1bCB1cGRhdGUgc2hvdWxkIGJlIGFuCj4+IGVycm9yIC0g
bWlzbWF0Y2hlZCB1Y29kZSBtYXksIGFmdGVyIGFsbCwgYmUgbW9yZSBvZiBhIHByb2JsZW0KPj4g
dGhhbiBvdXRkYXRlZCB1Y29kZS4KPiAKPiBXaWxsIG9ubHkgdGFrZSBjYXJlIC1FSU8gY2FzZS4g
SWYgc3lzdGVtcyBoYXZlIGRpZmZlcmluZyB1Y29kZXMgb24KPiBjb3JlcywgcGFydGlhbGx5IHVw
ZGF0ZSBpcyBleHBlY3RlZCB3aGVuIHdlIHRyeSB0byBjb3JyZWN0IHRoZSBzeXN0ZW0KPiB3aXRo
IGFuIHVjb2RlIGVxdWFsIHRvIHRoZSBuZXdlc3QgdWNvZGUgcmV2IGFscmVhZHkgb24gY29yZXMu
CgpCdXQgYW4gdXBkYXRlIGF0dGVtcHQgd2l0aCB3aGF0J3MgYWxyZWFkeSBsb2FkZWQgaW4gdGhl
IENQVSBzaG91bGQKeWllbGQgInN1Y2Nlc3MiLCBoZW5jZSBhICJwYXJ0aWFsIiB1cGRhdGUgbGlr
ZSB3aGF0IHlvdSBkZXNjcmliZQpzaG91bGQgbm90IGJlIGNvbnNpZGVyZWQgInBhcnRpYWwiIGlu
IHRoZSBmaXJzdCBwbGFjZS4gSWlyYyBhbgp1cGRhdGUgYXR0ZW1wdCB3aGVuIHNhbWUgKG9yIG5l
d2VyPykgdWNvZGUgaXMgYWxyZWFkeSBsb2FkZWQgb24KYWxsIGNvcmVzIHlpZWxkcyAic3VjY2Vz
cyIgdG9vLCBkb2Vzbid0IGl0PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
