Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E44F918D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:08:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWoI-0006bX-Dw; Tue, 12 Nov 2019 14:06:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYGl=ZE=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iUWoH-0006bR-J8
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:06:21 +0000
X-Inumbo-ID: 9931a0c7-0555-11ea-a21d-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9931a0c7-0555-11ea-a21d-12813bfff9fa;
 Tue, 12 Nov 2019 14:06:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573567581; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ac2+Mb2Gu47+vvVlLjeJme4M5Dgcz2WfZCMsk44QfcE=;
 b=h9kOsWblKgOjhmcdG7BYti27aX0CghdQH1LImIh/K4C0GJwhG80BVsEIdSd2aVa4GhHeiXhO
 KbLoEzDeWrZgNuFnigC7mmTiyQ9sxZzEzoYkv8Rd1GepaX75UFtQhe3uLHGnSTODP12X2q1w
 F74GMEsSTZcd1c0Vv4QKebrnF4E=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5dcabc59.7f1495dd58f0-smtp-out-n01;
 Tue, 12 Nov 2019 14:06:17 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l1so3321276wme.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 06:06:16 -0800 (PST)
X-Gm-Message-State: APjAAAVIuO20rYEV1aCfs5S+6m3+bFqHroc9e3juPkbgaoVkp1LaMwSj
 a47T+XE6/vono2ohNEeYAFEYlmdj9hVcwBqOQXM=
X-Google-Smtp-Source: APXvYqw2p7cTZsqROZq33m6wiAnP4CIcqFe7ac1aemYoeIKUn7Ft6uD6AsujZgOYhlNt8foopDfp7qYpYRjkiGD2ADs=
X-Received: by 2002:a1c:3843:: with SMTP id f64mr3884150wma.129.1573567576094; 
 Tue, 12 Nov 2019 06:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
In-Reply-To: <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 12 Nov 2019 07:05:39 -0700
X-Gmail-Original-Message-ID: <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
Message-ID: <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNDo1NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgd3JvdGU6Cj4gPiBAQCAtNDY4MSw3ICs0NjgyLDcgQEAgc3RhdGljIGludCBkb19hbHRw
Mm1fb3AoCj4gPiAgICAgICAgICBicmVhazsKPiA+Cj4gPiAgICAgIGNhc2UgSFZNT1BfYWx0cDJt
X3NldF9zdXBwcmVzc192ZToKPiA+IC0gICAgICAgIGlmICggYS51LnN1cHByZXNzX3ZlLnBhZDEg
fHwgYS51LnN1cHByZXNzX3ZlLnBhZDIgKQo+ID4gKyAgICAgICAgaWYgKCBhLnUuc3VwcHJlc3Nf
dmUucGFkMSApCj4KPiBKdXN0IGJlY2F1c2UgdGhlIGZpZWxkIGNoYW5nZXMgaXRzIG5hbWUgZG9l
c24ndCBtZWFuIHlvdSBjYW4KPiBkcm9wIHRoZSBjaGVjay4gWW91IGV2ZW4gYWRkIGEgbmV3IGZp
ZWxkIG5vdCB1c2VkICh5ZXQpIGJ5Cj4gdGhpcyBzdWItZnVuY3Rpb24sIHdoaWNoIHRoZW4gYWxz
byB3b3VsZCBuZWVkIGNoZWNraW5nIGhlcmUuCj4KPiA+IEBAIC00NjkzLDggKzQ2OTQsMjMgQEAg
c3RhdGljIGludCBkb19hbHRwMm1fb3AoCj4gPiAgICAgICAgICB9Cj4gPiAgICAgICAgICBicmVh
azsKPiA+Cj4gPiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aToK
PiA+ICsgICAgICAgIGlmICggYS51LnN1cHByZXNzX3ZlLnBhZDEgfHwgIWEudS5zdXBwcmVzc192
ZS5uciApCj4KPiBBIGNvdW50IG9mIHplcm8gdHlwaWNhbGx5IGlzIHRha2VuIGFzIGEgbm8tb3As
IG5vdCBhbiBlcnJvci4KPgo+ID4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiA+ICsgICAg
ICAgIGVsc2UKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICByYyA9IHAybV9zZXRfc3Vw
cHJlc3NfdmVfbXVsdGkoZCwgJmEudS5zdXBwcmVzc192ZSk7Cj4gPiArCj4gPiArICAgICAgICAg
ICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQo+ID4gKyAgICAgICAgICAgICAgICBpZiAoIF9fY29w
eV9maWVsZF90b19ndWVzdChndWVzdF9oYW5kbGVfY2FzdChhcmcsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9odm1fYWx0cDJtX29wX3QpLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYSwgdS5zdXBwcmVz
c192ZS5vcGFxdWUpICkKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJjID0gLUVGQVVMVDsKPgo+
IElmIHRoZSBvcGVyYXRpb24gaXMgYmVzdCBlZmZvcnQsIF9zb21lXyBpbmRpY2F0aW9uIG9mIGZh
aWx1cmUgc2hvdWxkCj4gc3RpbGwgYmUgaGFuZGVkIGJhY2sgdG8gdGhlIGNhbGxlci4gV2hldGhl
ciB0aGF0J3MgdGhyb3VnaCB0aGUgb3BhcXVlCj4gZmllbGQgb3IgYnkgc29tZSBvdGhlciBtZWFu
cyBpcyBzZWNvbmRhcnkuIElmIG5vdCB2aWEgdGhhdCBmaWVsZAo+ICh3aGljaCB3b3VsZCBtYWtl
IHRoZSBvdXRlciBvZiB0aGUgdHdvIGlmKCktcyBkaXNhcHBlYXIpLCBwbGVhc2UgZm9sZAo+IHRo
ZSBpZigpLXMuCgpBdCBsZWFzdCBmb3IgbWVtX3NoYXJpbmdfcmFuZ2Vfb3Agd2UgYWxzbyBkbyBh
IGJlc3QtZWZmb3J0IGFuZCBkb24ndApyZXR1cm4gYW4gZXJyb3IgZm9yIHBhZ2VzIHdoZXJlIGl0
IHdhc24ndCBwb3NzaWJsZSB0byBzaGFyZS4gU28gSQpkb24ndCB0aGluayBpdCdzIGFic29sdXRl
bHkgbmVjZXNzYXJ5IHRvIGRvIHRoYXQsIGVzcGVjaWFsbHkgaWYgdGhlCmNhbGxlciBjYW4ndCBk
byBhbnl0aGluZyBhYm91dCB0aG9zZSBlcnJvcnMgYW55d2F5LgoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
