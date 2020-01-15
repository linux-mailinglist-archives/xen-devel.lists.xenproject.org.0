Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8013C126
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:39:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhuD-0007NE-Dj; Wed, 15 Jan 2020 12:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irhuB-0007N9-9R
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:36:15 +0000
X-Inumbo-ID: 9ca585fe-3793-11ea-8531-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ca585fe-3793-11ea-8531-12813bfff9fa;
 Wed, 15 Jan 2020 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579091772;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=shsZWk9Ovk5/flNv/If+EaDjzBkbVbYkW/idMycbhac=;
 b=M9qxEm4M8mrB8xlFHTz0gKPnR8tUCe8ViRgJT0GObPSlihjr5/m5GES3
 w7NbtwfB7vPdZ0BUhUPKUf7OFlYsq6PYPuwRR7iFP6QIxrqtlTLtD7l9u
 jhPCXfQ10Cl/2IKckO94xtmDXgkn8iZzozYA5ftvMFTDjG4jBYh5ioa83 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vFjFHS7QgNBIa0decDVfwpNSAMDB6iqlnwllOZAFw+gU0X9NHdaR9SjM3AJyTOMRioiIbGAUPy
 5O10ixZP02uHpcOkN1c6naYt2Zz2tEL3rbK+s6GRO5qspICHiQWDZHWQvY36kcXxyLvlMeJCi2
 RgTAcLAeCbg/3zeteRLXRASVSNDiLghmpsu5gjO6XptZe1kFnOGzS4R8u2h5X/7tFTm6H7iK4m
 rWhmSb6azA61kMsP+Zzf9eHYlvS1N4mV1L1D31zFn9pjWdEySFPtHfu34vh4tFenx7IDWjoapx
 77w=
X-SBRS: 2.7
X-MesageID: 10935870
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10935870"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7d9e9668-3b21-46c6-5428-b6e9394bb8fe@citrix.com>
Date: Wed, 15 Jan 2020 12:36:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200115094703.GH11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAwOTo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAxNCwgMjAyMCBhdCAwNzozNjoyMVBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
SWYgSVRTQyBpcyBub3QgYXZhaWxhYmxlIG9uIENQVSAoZS5nIGlmIHJ1bm5pbmcgbmVzdGVkIGFz
IFBWIHNoaW0pCj4+IHRoZW4gWDg2X0ZFQVRVUkVfTk9OU1RPUF9UU0MgaXMgbm90IGFkdmVydGlz
ZWQgaW4gY2VydGFpbiBjYXNlcywgaS5lLgo+PiBhbGwgQU1EIGFuZCBzb21lIG9sZCBJbnRlbCBw
cm9jZXNzb3JzLiBJbiB3aGljaCBjYXNlIFRTQyB3b3VsZCBuZWVkIHRvCj4+IGJlIHJlc3RvcmVk
IG9uIENQVSBmcm9tIHBsYXRmb3JtIHRpbWUgYnkgWGVuIHVwb24gZXhpdGluZyBkZWVwIEMtc3Rh
dGVzLgo+Pgo+PiBBcyBwbGF0Zm9ybSB0aW1lIG1pZ2h0IGJlIGJlaGluZCB0aGUgbGFzdCBUU0Mg
c3RhbXAgcmVjb3JkZWQgZm9yIHRoZQo+PiBjdXJyZW50IENQVSwgaW52YXJpYW50IG9mIFRTQyBz
dGFtcCBiZWluZyBhbHdheXMgYmVoaW5kIGxvY2FsIFRTQyBjb3VudGVyCj4+IGlzIHZpb2xhdGVk
LiBUaGlzIGhhcyBhbiBlZmZlY3Qgb2YgZ2V0X3NfdGltZSgpIGdvaW5nIG5lZ2F0aXZlIHJlc3Vs
dGluZwo+PiBpbiBldmVudHVhbCBzeXN0ZW0gaGFuZyBvciBjcmFzaC4KPj4KPj4gRml4IHRoaXMg
aXNzdWUgYnkgdXBkYXRpbmcgbG9jYWwgVFNDIHN0YW1wIGFsb25nIHdpdGggVFNDIGNvdW50ZXIg
d3JpdGUuCj4gCj4gVGhhbmtzISBJIGhhdmVuJ3Qgc2VlbiBzdWNoIGlzc3VlIGJlY2F1c2UgSSd2
ZSBiZWVuIHJ1bm5pbmcgdGhlIHNoaW0KPiB3aXRoIG5vbWlncmF0ZSBpbiBvcmRlciB0byBwcmV2
ZW50IHRoZSB2VFNDIG92ZXJoZWFkLgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpo
aW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPj4gLS0tCj4+IFRoaXMgY2F1c2VkIHJl
bGlhYmxlIGhhbmdzIG9mIHNoaW0gZG9tYWlucyB3aXRoIG11bHRpcGxlIHZDUFVzIG9uIGFsbCBB
TUQKPj4gc3lzdGVtcy4gVGhlIHByb2JsZW0gZ290IGFsc28gcmVwcm9kdWNlZCBvbiBiYXJlLW1l
dGFsIGJ5IGFydGlmaWNhbGx5Cj4+IG1hc2tpbmcgSVRTQyBmZWF0dXJlIGJpdC4gVGhlIHByb3Bv
c2VkIGZpeCBoYXMgYmVlbiB2ZXJpZmllZCBmb3IgYm90aAo+PiBjYXNlcy4KPj4gLS0tCj4+ICB4
ZW4vYXJjaC94ODYvdGltZS5jIHwgOCArKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4gaW5kZXggZTc5Y2I0ZC4uZjZiMjZmOCAx
MDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYv
dGltZS5jCj4+IEBAIC05NTUsMTAgKzk1NSwxNiBAQCB1NjQgc3RpbWUydHNjKHNfdGltZV90IHN0
aW1lKQo+PiAgCj4+ICB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+PiAgewo+PiArICAg
IHN0cnVjdCBjcHVfdGltZSAqdCA9ICZ0aGlzX2NwdShjcHVfdGltZSk7Cj4+ICsKPj4gICAgICBp
ZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgKQo+PiAgICAgICAgICBy
ZXR1cm47Cj4+ICAKPj4gLSAgICB3cml0ZV90c2Moc3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3Rp
bWUoTlVMTCkpKTsKPj4gKyAgICB0LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3Jt
X3N0aW1lKE5VTEwpOwo+PiArICAgIHQtPnN0YW1wLmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5z
dGFtcC5tYXN0ZXJfc3RpbWUpOwo+PiArICAgIHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+c3Rh
bXAubWFzdGVyX3N0aW1lOwo+PiArCj4+ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3Rz
Yyk7Cj4gCj4gSW4gb3JkZXIgdG8gYXZvaWQgdGhlIFRTQyB3cml0ZSAoYW5kIHRoZSBsaWtlbHkg
YXNzb2NpYXRlZCB2bWV4aXQpLAo+IGNvdWxkIHlvdSBpbnN0ZWFkIGRvOgo+IAo+IHQtPnN0YW1w
LmxvY2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGlt
ZShOVUxMKTsKPiB0LT5zdGFtcC5sb2NhbF90c2MgPSByZHRzY19vcmRlcmVkKCk7CgpJIHRoaW5r
IGluIHRoYXQgY2FzZSBSRFRTQyBtaWdodCByZXR1cm4gc29tZXRoaW5nIGJlaGluZCBwbGF0Zm9y
bSB0aW1lCndoaWNoIGlzIG5vdCByaWdodCBJIGd1ZXNzLgoKSWdvcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
