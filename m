Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D012485C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:27:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZJD-0004oB-0a; Wed, 18 Dec 2019 13:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihZJB-0004o6-H5
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:24:09 +0000
X-Inumbo-ID: aa571902-2199-11ea-9078-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa571902-2199-11ea-9078-12813bfff9fa;
 Wed, 18 Dec 2019 13:24:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 725EAAD4A;
 Wed, 18 Dec 2019 13:24:05 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
 <20191218131852.cl7yiz3an2tbc5eg@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6eeed56-6fef-9676-1e40-3b5ce152a99c@suse.com>
Date: Wed, 18 Dec 2019 14:24:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218131852.cl7yiz3an2tbc5eg@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock
 source
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxNDoxOCwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIERlYyAxOCwgMjAx
OSBhdCAwMTo1MTo1NFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTguMTIuMjAx
OSAxMzozOCwgV2VpIExpdSB3cm90ZToKPj4+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDA1OjU5
OjA0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjEwLjIwMTkgMTE6MTYs
IFdlaSBMaXUgd3JvdGU6Cj4+Pj4+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2
X3RpbWVyKHZvaWQpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgdWludDY0X3Qgc2NhbGUsIG9mZnNldCwg
cmV0LCB0c2M7Cj4+Pj4+ICsgICAgdWludDMyX3Qgc2VxOwo+Pj4+PiArICAgIHN0cnVjdCBtc19o
eXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gJmh5cGVydl90c2NfcGFnZTsKPj4+Pj4gKwo+Pj4+
PiArICAgIGRvIHsKPj4+Pj4gKyAgICAgICAgc2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsK
Pj4+Pj4gKwo+Pj4+PiArICAgICAgICAvKiBTZXEgMCBpcyBzcGVjaWFsLiBJdCBtZWFucyB0aGUg
VFNDIGVubGlnaHRlbm1lbnQgaXMgbm90Cj4+Pj4+ICsgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0
aGUgbW9tZW50LiBUaGUgcmVmZXJlbmNlIHRpbWUgY2FuIG9ubHkgYmUKPj4+Pj4gKyAgICAgICAg
ICogb2J0YWluZWQgZnJvbSB0aGUgUmVmZXJlbmNlIENvdW50ZXIgTVNSLgo+Pj4+PiArICAgICAg
ICAgKi8KPj4+Pj4gKyAgICAgICAgaWYgKCBzZXEgPT0gMCApCj4+Pj4+ICsgICAgICAgIHsKPj4+
Pj4gKyAgICAgICAgICAgIHJkbXNybChIVl9YNjRfTVNSX1RJTUVfUkVGX0NPVU5ULCByZXQpOwo+
Pj4+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4gKyAgICAgICAgfQo+Pj4+PiArCj4+
Pj4+ICsgICAgICAgIHNtcF9ybWIoKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICB0c2MgPSByZHRz
Y19vcmRlcmVkKCk7Cj4+Pj4KPj4+PiBUaGlzIGFscmVhZHkgaW5jbHVkZXMgYXQgbGVhc3QgYSBy
ZWFkIGZlbmNlLgo+Pj4KPj4+IE9LLiByZHRzYygpIHNob3VsZCBiZSBlbm91Z2ggaGVyZS4KPj4K
Pj4gQXJlIHlvdSBzdXJlPyBNeSBjb21tZW50IHdhcyByYXRoZXIgdG93YXJkcyB0aGUgZHJvcHBp
bmcgb2Ygc21wX3JtYigpCj4+IChtYXliZSByZXBsYWNpbmcgYnkgYSBjb21tZW50KS4KPiAKPiBJ
IGRvIG1lYW4gdG8ga2VlcCBzbXBfcm1iKCkgYmVmb3JlIGl0LiBJcyB0aGF0IG5vdCBlbm91Z2g/
CgpXaXRoCgojZGVmaW5lIHNtcF9ybWIoKSAgICAgICBiYXJyaWVyKCkKCml0IGlzbid0IC0gaXQn
cyBtZXJlbHkgYSBjb21waWxlciBiYXJyaWVyLCBidXQgZm9yIHRoZSBvcmRlcmluZwp5b3Ugd2Fu
dCB5b3UgbmVlZCBhIGZlbmNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
