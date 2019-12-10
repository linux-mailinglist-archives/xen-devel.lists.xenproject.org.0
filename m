Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D647D118441
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:59:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecFG-0004T4-IZ; Tue, 10 Dec 2019 09:55:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jFD4=2A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iecFE-0004Sz-OT
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:55:52 +0000
X-Inumbo-ID: 3fa3a59c-1b33-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fa3a59c-1b33-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575971752;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3KN5fU8fiENr4n2j2ckxgFZ/cQkkZ0o5m8wbnKzbuIU=;
 b=BDKaLslD8T1HhoY+TdNNMY4Rkcbz0pbomsq98Gk7YcTTY0x1FOAbDYDg
 lCLjqdjRXN3X2ZsrVGB4N0KKHi+4Km7KtrznSHSo2uRQe02Vb0v1ArlIu
 HuoodQQgtBfAaQkXVc9NDFpFal5K+TAiOCPwuR+BsmdElzMVK0yBu5S40 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 66kvj9+Dy5vmcpDrKXdPbp9irGUDcq83ql3mzlLRzFByT0MIBi5LmvaYY3q+4+q901SL4QEMMc
 8KVw7uoOtxYADjP6XBCYT/H/QvQVFv1e1XrsfZ+Sb2ZftmAHinBYWFcX6DiHCVEyB4ZueligEx
 4Zmw9OUvy+c2vQXnrPwyjI2om5/Y+DL5ygHwqe+1Dkp0fk4Ga+YjqLb5L+EuQh5dyj0tkJS8K6
 JYEm6lwM0PZVVrOEufB8bKRnxTc/gpmOKxP+wmwYde8GYBAlOZucNKcLv9xiM/vkjjRm5uonta
 37U=
X-SBRS: 2.7
X-MesageID: 9444856
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9444856"
To: Jan Beulich <jbeulich@suse.com>
References: <20191206193429.29165-1-andrew.cooper3@citrix.com>
 <677d8349-ba6f-a90e-99ef-0384180031cf@suse.com>
 <75eeed82-31d7-8f48-6dc5-d4095e11777b@citrix.com>
 <9e5adb48-c837-9b79-805c-839e3be0f130@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <14560f56-e857-c2ab-3d63-eaf8c276a4fc@citrix.com>
Date: Tue, 10 Dec 2019 09:55:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9e5adb48-c837-9b79-805c-839e3be0f130@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: How Xen Boots on x86
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTIvMjAxOSAwNzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMTIuMjAxOSAx
Nzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMTIvMjAxOSAxNToyMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNi4xMi4yMDE5IDIwOjM0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+ICtPYmplY3RzCj4+Pj4gK35+fn5+fn4KPj4+PiArCj4+Pj4gK1RvIGJlZ2luIHdpdGgs
IG1vc3Qgb2JqZWN0IGZpbGVzIGFyZSBjb21waWxlZCBhbmQgbGlua2VkLiAgVGhpcyBpbmNsdWRl
cyB0aGUKPj4+PiArTXVsdGlib290IDEgYW5kIDIgaGVhZGVycyBhbmQgZW50cnlwb2ludHMsIGlu
Y2x1ZGluZyB0aGUgTXVsdGlib290IDIgdGFncyBmb3IKPj4+PiArRUZJIGV4dGVuc2lvbnMuICBX
aGVuIGBgQ09ORklHX1BWSF9HVUVTVGBgIGlzIHNlbGVjdGVkIGF0IGJ1aWxkIHRpbWUsIHRoaXMK
Pj4+PiAraW5jbHVkZXMgdGhlIFBWSCBlbnRyeXBvaW50IGFuZCBhc3NvY2lhdGVkIEVMRiBub3Rl
cy4KPj4+PiArCj4+Pj4gK0RlcGVuZGluZyBvbiB3aGV0aGVyIHRoZSBjb21waWxlciBzdXBwb3J0
cyBgYF9fYXR0cmlidXRlX18oKF9fbXNfYWJpX18pKWBgIG9yCj4+Pj4gK25vdCwgZWl0aGVyIGFu
IEVGSSBzdHViIGlzIGluY2x1ZGVkIHdoaWNoIG5vcHMvZmFpbHMgYXBwbGljYWJsZSBzZXR1cCBj
YWxscywKPj4+PiArb3IgZnVsbCBFRkkgc3VwcG9ydCBpcyBpbmNsdWRlZC4KPj4+IFBlcmhhcHMg
YWxzbyBtZW50aW9uIHRoYXQgdGhlIGxpbmtlciBuZWVkcyB0byBzdXBwb3J0IHRoZSBuZWNlc3Nh
cnkKPj4+IGJpbmFyeSBvdXRwdXQgZm9ybWF0PyBBbmQgcGVyaGFwcyAic2V0dXAgYW5kIHJ1bnRp
bWUgY2FsbHMiPwo+PiBMaW5rIHRpbWUgYmVoYXZpb3VyIGlzIChkZWxpYmVyYXRlbHkpIGluIGEg
bGF0ZXIgc2VjdGlvbi4KPiBJIHJlYWxpemUoZCkgdGhpcywgYnV0IHRoZSBzdGF0ZW1lbnQgYWJv
dmUgaXMgc2ltcGx5IG5vdCB0cnVlIHdpdGhvdXQKPiBhbHNvIG1lbnRpb25pbmcgcmVxdWlyZWQg
bGlua2VyIGNhcGFiaWxpdGllczogVGhlIG9iamVjdCBmaWxlcyB3b24ndAo+IGhhdmUgImZ1bGwg
RUZJIHN1cHBvcnQgaW5jbHVkZWQiIGluIHRoaXMgY2FzZS4gU28gSSdkIGV4cGVjdCBhICJzZWUK
PiBhbHNvIiBoZXJlIGF0IHRoZSB2ZXJ5IGxlYXN0LgoKTm90ZSBob3cgWEVOX0JVSUxEX0VGSSBh
bmQgWEVOX0JVSUxEX1BFIGFyZSBkaWZmZXJlbnQsIG9uZSBieSBjb21waWxlcgpzdXBwb3J0IGZv
ciBtc19hYmksIGFuZCBvbmUgYnkgbGlua2VyIHN1cHBvcnQgZm9yIGkzODZwZXAuCgpMaW5rZXIg
c3VwcG9ydCBmb3IgaTM4NnBlcCBpcyBub3QgcmVxdWlyZWQgYXQgYWxsIHRvIGdldCBFRkkgc3Vw
cG9ydCBpbgpYZW4uwqAgVGhpcyBpcyBob3cgdGhlIE1CMitFRkkgcGF0aCBpcyBjb25zdHJ1Y3Rl
ZC4KCgo+Cj4+Pj4gK1Byb3RvY29scyBhbmQgZW50cnlwb2ludHMKPj4+PiArfn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+Pj4+ICsKPj4+PiArQWxsIGhlYWRlcnMgYW5kIHRhZ3MgYXJlIGJ1aWx0
IGluIGBgeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TYGAKPj4+PiArCj4+Pj4gK1RoZSBNdWx0aWJv
b3QgMSBoZWFkZXJzIHJlcXVlc3QgYWxpZ25lZCBtb2R1bGVzIGFuZCBtZW1vcnkgaW5mb3JtYXRp
b24uICBFbnRyeQo+Pj4+ICtpcyB2aWEgdGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkgaW1hZ2UsIHdo
aWNoIGlzIHRoZSBgYHN0YXJ0YGAgc3ltYm9sLiAgVGhpcwo+Pj4+ICtlbnRyeXBvaW50IG11c3Qg
YmUgc3RhcnRlZCBpbiAzMmJpdCBtb2RlLgo+Pj4+ICsKPj4+PiArVGhlIE11bHRpYm9vdCAyIGhl
YWRlcnMgYXJlIG1vcmUgZmxleGlibGUsIGFuZCBpbiBhZGRpdGlvbiByZXF1ZXN0IHRoYXQgdGhl
Cj4+Pj4gK2ltYWdlIGJlIGxvYWRlZCBhcyBoaWdoIGFzIHBvc3NpYmxlIGJlbG93IHRoZSA0RyBi
b3VuZGFyeSwgd2l0aCAyTSBhbGlnbm1lbnQuCj4+Pj4gK0VudHJ5IGlzIHN0aWxsIHZpYSB0aGUg
YGBzdGFydGBgIHN5bWJvbCBhcyB3aXRoIE1CMS4KPj4+IFBlcmhhcHMgZXhwbGljaXRseSAocmUp
c3RhdGUgdGhpcyBpcyBpbiAzMi1iaXQgbW9kZT8KPj4+Cj4+Pj4gK0hlYWRlcnMgZm9yIHRoZSBF
RkkgTUIyIGV4dGVuc2lvbnMgYXJlIGFsc28gcHJlc2VudC4gIFRoZXNlIHJlcXVlc3QgdGhhdAo+
Pj4+ICtgYEV4aXRCb290U2VydmljZXMoKWBgIG5vdCBiZSBjYWxsZWQsIGFuZCByZWdpc3RlciBg
YF9fZWZpX21iMl9zdGFydGBgIGFzIGFuCj4+Pj4gK2FsdGVybmF0aXZlIGVudHJ5cG9pbnQsIGVu
dGVyZWQgaW4gNjRiaXQgbW9kZS4KPj4+PiArCj4+Pj4gK0lmIGBgQ09ORklHX1BWSF9HVUVTVGBg
IHdhcyBzZWxlY3RlZCBhdCBidWlsZCB0aW1lLCBhbiBFbGYgbm90ZSBpcyBpbmNsdWRlZAo+Pj4+
ICt3aGljaCBpbmRpY2F0ZXMgdGhlIGFiaWxpdHkgdG8gdXNlIHRoZSBQVkggYm9vdCBwcm90b2Nv
bCwgYW5kIHJlZ2lzdGVycwo+Pj4+ICtgYF9fcHZoX3N0YXJ0YGAgYXMgdGhlIGVudHJ5cG9pbnQs
IGVudGVyZWQgaW4gMzJiaXQgbW9kZS4KPj4+PiArCj4+Pj4gKwo+Pj4+ICt4ZW4uZ3oKPj4+PiAr
fn5+fn5+Cj4+Pj4gKwo+Pj4+ICtUaGUgb2JqZWN0cyBhcmUgbGlua2VkIHRvZ2V0aGVyIHRvIGZv
cm0gYGB4ZW4tc3ltc2BgIHdoaWNoIGlzIGFuIEVMRjY0Cj4+Pj4gK2V4ZWN1dGFibGUgd2l0aCBm
dWxsIGRlYnVnZ2luZyBzeW1ib2xzLiAgYGB4ZW4uZ3pgYCBpcyBmb3JtZWQgYnkgc3RyaXBwaW5n
Cj4+Pj4gK2BgeGVuLXN5bXNgYCwgdGhlbiByZXBhY2thZ2luZyB0aGUgcmVzdWx0IGFzIGFuIEVM
RjMyIG9iamVjdCB3aXRoIGEgc2luZ2xlCj4+Pj4gK2xvYWQgc2VjdGlvbiBhdCAyTUIsIGFuZCBg
YGd6aXBgYC1pbmcgdGhlIHJlc3VsdC4gIERlc3BpdGUgdGhlIEVMRjMyIGhhdmluZyBhCj4+Pj4g
K2ZpeGVkIGxvYWQgYWRkcmVzcywgaXRzIGNvbnRlbnRzIGFyZSByZWxvY2F0YWJsZS4KPj4+IFRo
aXMgaXMgYSBsaXR0bGUgYW1iaWd1b3VzIEkgZ3Vlc3MgLSBtb3N0IG9mIHRoZSBjb2RlIGlzIFBJ
QyBhbmQgYXMKPj4+IHN1Y2ggcmVsb2NhdGFibGUsIGJ1dCBub3QgaW4gYSB3YXkgYSBib290IGxv
YWRlciBjb3VsZCBhcnJhbmdlIGZvci4KPj4gSSBkb24ndCBmb2xsb3cgeW91ciBjb25jZXJuLgo+
Pgo+PiBFdmVyeXRoaW5nIHdoaWNoIG5lZWRzIHRvIGJlIGlzIHBvc2l0aW9uIGluZGVwZW5kZW50
IChzdWJqZWN0IHRvIGJlaW5nCj4+IGxvYWRlZCBvbiBhIDJNIGJvdW5kYXJ5IElJUkMpLCBhbmQg
dGhpcyBwcm9wZXJ0eSBpcyByZXF1ZXN0ZWQgYnkgdGhlIE1CMgo+PiBoZWFkZXIuCj4gT2gsIHNv
cnJ5LCBpdCBoYWQgYmVlbiB0b28gbWFueSB5ZWFycyBvZiBzeW1fcGh5cygpIGJlZm9yZSBpdCBi
ZWNhbWUKPiBzeW1fb2ZmcygpLiBZb3UncmUgcmlnaHQuCgpZZWFoIC0gaXQgd2FzIGZpeGVkIGlu
IHRoZSBNQjEgZGF5cywgYnV0IHRoaXMgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlLgoKPgo+Pj4+ICtB
bnkgYm9vdGxvYWRlciB3aGljaCB1bnppcHMgdGhlIGJpbmFyeSBhbmQgZm9sbG93cyB0aGUgRUxG
IGhlYWRlcnMgd2lsbCBwbGFjZQo+Pj4+ICtpdCBhdCB0aGUgMk0gYm91bmRhcnkgYW5kIGp1bXAg
dG8gYGBzdGFydGBgIHdoaWNoIGlzIHRoZSBpZGVudGlmaWVkIGVudHJ5Cj4+Pj4gK3BvaW50LiAg
SG93ZXZlciwgWGVuIGRlcGVuZHMgb24gYmVpbmcgZW50ZXJlZCB3aXRoIHRoZSBNQjEgb3IgTUIy
IHByb3RvY29scywKPj4+PiArYW5kIHdpbGwgdGVybWluYXRlIG90aGVyd2lzZS4KPj4+PiArCj4+
Pj4gK1RoZSBNQjIrRUZJIGVudHJ5cG9pbnQgZGVwZW5kcyBvbiBiZWluZyBlbnRlcmVkIHdpdGgg
dGhlIE1CMiBwcm90b2NvbCwgYW5kCj4+Pj4gK3dpbGwgdGVybWluYXRlIGlmIHRoZSBlbnRyeSBw
cm90b2NvbCBpcyB3cm9uZywgb3IgaWYgRUZJIGRldGFpbHMgYXJlbid0Cj4+Pj4gK3Byb3ZpZGVk
LCBvciBpZiBFRkkgQm9vdCBTZXJ2aWNlcyBhcmUgbm90IGF2YWlsYWJsZS4KPj4+PiArCj4+Pj4g
Kwo+Pj4+ICt4ZW4uZWZpCj4+Pj4gK35+fn5+fn4KPj4+PiArCj4+Pj4gK1doZW4gYSBQRUktY2Fw
YWJsZSB0b29sY2hhaW4gaXMgZm91bmQsIHRoZSBvYmplY3RzIGFyZSBsaW5rZWQgdG9nZXRoZXIg
YW5kIGEKPj4+PiArUEU2NCBiaW5hcnkgaXMgY3JlYXRlZC4gIEl0IGNhbiBiZSBydW4gZGlyZWN0
bHkgZnJvbSB0aGUgRUZJIHNoZWxsLCBhbmQgaGFzCj4+PiBJIHRoaW5rIGl0J3MgY29tbW9ubHkg
Y2FsbGVkIFBFMzIrLCBub3QgUEU2NC4KPj4gT2suLCBiZWNhdXNlIGJ5IGRlZmluaXRpb24sIGl0
IGNhbiBzdGFjay4KPiBIb3cgZG9lcyBzdGFja2luZyBjb21lIGludG8gcGxheSBoZXJlPwoKTWlz
LXBhc3RlIG9uIG15IGJlaGFsZiAodGhhdCB0ZXh0IHdhcyBhbiBlYXJseSB2ZXJzaW9uIGRpc2N1
c3NpbmcKY2hhaW5sb2FkaW5nKS7CoCBUaGF0IHNob3VsZCBoYXZlIGVuZGVkIGF0IG9rLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
