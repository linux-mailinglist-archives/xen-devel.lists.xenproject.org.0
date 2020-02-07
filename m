Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67252155497
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 10:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izzrg-0001QK-IC; Fri, 07 Feb 2020 09:23:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izzrf-0001QF-Sp
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 09:23:55 +0000
X-Inumbo-ID: 8f73e74a-498b-11ea-a759-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f73e74a-498b-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 09:23:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C73B5ACA4;
 Fri,  7 Feb 2020 09:23:53 +0000 (UTC)
To: Varad Gautam <vrd@amazon.de>
References: <1581066052-25269-1-git-send-email-vrd@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fbfc47c-c7ab-549b-62a0-a9cf8b790d23@suse.com>
Date: Fri, 7 Feb 2020 10:24:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1581066052-25269-1-git-send-email-vrd@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] kimage: Allow load/exec for images with
 KEXEC_TYPE_LIVE_UPDATE
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
Cc: xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxMDowMCwgVmFyYWQgR2F1dGFtIHdyb3RlOgo+IERvIG5vdCAtRUlOVkFM
IG9uIGxvYWRpbmcvZXhlY2luZyBhbiBpbWFnZSBpZiBrZXhlYyB0eXBlIGlzCj4gS0VYRUNfVFlQ
RV9MSVZFX1VQREFURS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6
b24uZGU+Cj4gQ0M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+CgpQbGVhc2Ug
Q2MgbWFpbnRhaW5lcnMgb24gcGF0Y2hlcy4KCj4gLS0tIGEveGVuL2NvbW1vbi9raW1hZ2UuYwo+
ICsrKyBiL3hlbi9jb21tb24va2ltYWdlLmMKPiBAQCAtNDIxLDYgKzQyMSw3IEBAIHN0cnVjdCBw
YWdlX2luZm8gKmtpbWFnZV9hbGxvY19jb250cm9sX3BhZ2Uoc3RydWN0IGtleGVjX2ltYWdlICpp
bWFnZSwKPiAgICAgIHN3aXRjaCAoIGltYWdlLT50eXBlICkKPiAgICAgIHsKPiAgICAgIGNhc2Ug
S0VYRUNfVFlQRV9ERUZBVUxUOgo+ICsgICAgY2FzZSBLRVhFQ19UWVBFX0xJVkVfVVBEQVRFOgo+
ICAgICAgICAgIHBhZ2VzID0ga2ltYWdlX2FsbG9jX25vcm1hbF9jb250cm9sX3BhZ2UoaW1hZ2Us
IG1lbWZsYWdzKTsKPiAgICAgICAgICBicmVhazsKPiAgICAgIGNhc2UgS0VYRUNfVFlQRV9DUkFT
SDoKPiBAQCAtNzc1LDYgKzc3Niw3IEBAIHN0YXRpYyBpbnQga2ltYWdlX2xvYWRfc2VnbWVudChz
dHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlLCB4ZW5fa2V4ZWNfc2VnbWVudF90ICpzCj4gICAgICAg
ICAgc3dpdGNoICggaW1hZ2UtPnR5cGUgKQo+ICAgICAgICAgIHsKPiAgICAgICAgICBjYXNlIEtF
WEVDX1RZUEVfREVGQVVMVDoKPiArICAgICAgICBjYXNlIEtFWEVDX1RZUEVfTElWRV9VUERBVEU6
Cj4gICAgICAgICAgICAgIHJlc3VsdCA9IGtpbWFnZV9sb2FkX25vcm1hbF9zZWdtZW50KGltYWdl
LCBzZWdtZW50KTsKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgY2FzZSBLRVhFQ19U
WVBFX0NSQVNIOgo+IEBAIC04MDMsNiArODA1LDcgQEAgaW50IGtpbWFnZV9hbGxvYyhzdHJ1Y3Qg
a2V4ZWNfaW1hZ2UgKipyaW1hZ2UsIHVpbnQ4X3QgdHlwZSwgdWludDE2X3QgYXJjaCwKPiAgICAg
IHN3aXRjaCggdHlwZSApCj4gICAgICB7Cj4gICAgICBjYXNlIEtFWEVDX1RZUEVfREVGQVVMVDoK
PiArICAgIGNhc2UgS0VYRUNfVFlQRV9MSVZFX1VQREFURToKPiAgICAgICAgICByZXN1bHQgPSBr
aW1hZ2Vfbm9ybWFsX2FsbG9jKHJpbWFnZSwgZW50cnlfbWFkZHIsIG5yX3NlZ21lbnRzLCBzZWdt
ZW50KTsKPiAgICAgICAgICBicmVhazsKPiAgICAgIGNhc2UgS0VYRUNfVFlQRV9DUkFTSDoKCllv
dSBkb24ndCBtZW50aW9uIGFueSBwcmVyZXEgcGF0Y2hlcywgYW5kIEkgY2FuJ3Qgc2VlIGFueQpk
ZWZpbml0aW9uIG9mIEtFWEVDX1RZUEVfTElWRV9VUERBVEUgaW4gdGhlIHB1YmxpYyBoZWFkZXJz
LgpJT1cgSSBjYW4ndCBzZWUgaG93IHRoaXMgcGF0Y2ggd291bGQgYmUgYWJsZSB0byBub3QgYnJl
YWsKdGhlIGJ1aWxkIG9uIGN1cnJlbnQgc3RhZ2luZy4gUGxlYXNlIGNsYXJpZnkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
