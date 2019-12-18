Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63F512475A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:55:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYnh-0001b3-6L; Wed, 18 Dec 2019 12:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihYng-0001av-CU
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:51:36 +0000
X-Inumbo-ID: 1ae2c91e-2195-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ae2c91e-2195-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 12:51:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E87F3AE24;
 Wed, 18 Dec 2019 12:51:26 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
Date: Wed, 18 Dec 2019 13:51:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218123856.mskxir5onsmvql27@debian>
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

T24gMTguMTIuMjAxOSAxMzozOCwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIERlYyAxMCwgMjAx
OSBhdCAwNTo1OTowNFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMTAuMjAx
OSAxMToxNiwgV2VpIExpdSB3cm90ZToKPj4+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRf
aHlwZXJ2X3RpbWVyKHZvaWQpCj4+PiArewo+Pj4gKyAgICB1aW50NjRfdCBzY2FsZSwgb2Zmc2V0
LCByZXQsIHRzYzsKPj4+ICsgICAgdWludDMyX3Qgc2VxOwo+Pj4gKyAgICBzdHJ1Y3QgbXNfaHlw
ZXJ2X3RzY19wYWdlICp0c2NfcGFnZSA9ICZoeXBlcnZfdHNjX3BhZ2U7Cj4+PiArCj4+PiArICAg
IGRvIHsKPj4+ICsgICAgICAgIHNlcSA9IHRzY19wYWdlLT50c2Nfc2VxdWVuY2U7Cj4+PiArCj4+
PiArICAgICAgICAvKiBTZXEgMCBpcyBzcGVjaWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRl
bm1lbnQgaXMgbm90Cj4+PiArICAgICAgICAgKiBhdmFpbGFibGUgYXQgdGhlIG1vbWVudC4gVGhl
IHJlZmVyZW5jZSB0aW1lIGNhbiBvbmx5IGJlCj4+PiArICAgICAgICAgKiBvYnRhaW5lZCBmcm9t
IHRoZSBSZWZlcmVuY2UgQ291bnRlciBNU1IuCj4+PiArICAgICAgICAgKi8KPj4+ICsgICAgICAg
IGlmICggc2VxID09IDAgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAgIHJkbXNybChI
Vl9YNjRfTVNSX1RJTUVfUkVGX0NPVU5ULCByZXQpOwo+Pj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4+PiArICAgICAgICB9Cj4+PiArCj4+PiArICAgICAgICBzbXBfcm1iKCk7Cj4+PiArCj4+
PiArICAgICAgICB0c2MgPSByZHRzY19vcmRlcmVkKCk7Cj4+Cj4+IFRoaXMgYWxyZWFkeSBpbmNs
dWRlcyBhdCBsZWFzdCBhIHJlYWQgZmVuY2UuCj4gCj4gT0suIHJkdHNjKCkgc2hvdWxkIGJlIGVu
b3VnaCBoZXJlLgoKQXJlIHlvdSBzdXJlPyBNeSBjb21tZW50IHdhcyByYXRoZXIgdG93YXJkcyB0
aGUgZHJvcHBpbmcgb2Ygc21wX3JtYigpCihtYXliZSByZXBsYWNpbmcgYnkgYSBjb21tZW50KS4K
Cj4+PiArICAgICAgICBzY2FsZSA9IHRzY19wYWdlLT50c2Nfc2NhbGU7Cj4+PiArICAgICAgICBv
ZmZzZXQgPSB0c2NfcGFnZS0+dHNjX29mZnNldDsKPj4+ICsKPj4+ICsgICAgICAgIHNtcF9ybWIo
KTsKPj4+ICsKPj4+ICsgICAgfSB3aGlsZSAodHNjX3BhZ2UtPnRzY19zZXF1ZW5jZSAhPSBzZXEp
Owo+Pj4gKwo+Pj4gKyAgICAvKiB4ODYgaGFzIEFSQ0hfU1VQUE9SVFNfSU5UMTI4ICovCj4+PiAr
ICAgIHJldCA9ICh1aW50NjRfdCkoKChfX3VpbnQxMjhfdCl0c2MgKiBzY2FsZSkgPj4gNjQpICsg
b2Zmc2V0Owo+Pgo+PiBUaGUgZmluYWwgY2FzdCBpc24ndCByZWFsbHkgbmVlZGVkLCBpcyBpdD8g
QXMgdG8gdGhlIG11bHRpcGxpY2F0aW9uCj4+IC0gYXJlIHlvdSBzdXJlIGFsbCBjb21waWxlcnMg
aW4gYWxsIGNhc2VzIHdpbGwgYXZvaWQgZmFsbGluZyBiYWNrCj4+IHRvIGEgbGlicmFyeSBjYWxs
IGhlcmU/IEluIG90aGVyIHNpbWlsYXIgcGxhY2VzIEkgdGhpbmsgd2UgdXNlCj4+IGlubGluZSBh
c3NlbWJseSBpbnN0ZWFkLgo+IAo+IFdoYXQgbGlicmFyeSBjYWxsPyBBIGZ1bmN0aW9uIGluIGxp
YmdjYyAob3IgY2xhbmcncyBlcXVpdmFsZW5jZSk/Cj4gSVNUUiBsaWJnY2MgaXMgYWx3YXlzIGxp
bmtlZCwgYnV0IEkgY291bGQgYmUgd3JvbmcgaGVyZS4KCk5vLCB0aGUgaHlwZXJ2aXNvciAoYXQg
bGVhc3QgdGhlIHg4NiBvbmUpIGRvZXNuJ3QgbGluayBsaWJnY2MgYWZhaWsuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
