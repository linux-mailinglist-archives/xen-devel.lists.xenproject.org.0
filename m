Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456E171254
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:21:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ENr-00009q-HY; Thu, 27 Feb 2020 08:19:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7ENq-00009k-Mf
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:19:02 +0000
X-Inumbo-ID: cf53400a-5939-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf53400a-5939-11ea-aba8-bc764e2007e4;
 Thu, 27 Feb 2020 08:19:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6E52B208;
 Thu, 27 Feb 2020 08:19:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af3fe9fc-0d3c-4a9a-336c-b316f31fbfed@suse.com>
Date: Thu, 27 Feb 2020 09:19:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-9-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/10] x86/cpuid: Introduce and use default
 CPUID policies
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

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGb3Igbm93LCB0aGUg
ZGVmYXVsdCBhbmQgbWF4IHBvbGljaWVzIHJlbWFpbiBpZGVudGljYWwsIGJ1dCB0aGlzIHdpbGwg
Y2hhbmdlCj4gaW4gdGhlIGZ1dHVyZS4gIFdyaXRlIGNhbGN1bGF0ZV97cHYsaHZtfV9kZWZfcG9s
aWN5KCkgaW4gYSB3YXkgd2hpY2ggd2lsbCBjb3BlCj4gd2l0aCBzaW1wbGUgZmVhdHVyZSBkaWZm
ZXJlbmNlcyBmb3Igbm93Lgo+IAo+IFVwZGF0ZSBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5IGFu
ZCBpbml0X2RvbWFpbl9jcHVpZF9wb2xpY3koKSB0byB1c2UgdGhlCj4gZGVmYXVsdCBwb2xpY2ll
cy4KCkZvciB0aGUgc3lzY3RsIHRoZSBzdGF0ZW1lbnQgbG9va3MgdG8gYmUgYnJvYWRlciB0aGFu
IHJlYWxpdHksCmFzIChvZiBjb3Vyc2UpIHlvdSBkb24ndCB0b3VjaCBYRU5fU1lTQ1RMX2NwdV9w
b2xpY3lfKl9tYXguCgo+IEBAIC0zODEsNiArMzg2LDIzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBj
YWxjdWxhdGVfcHZfbWF4X3BvbGljeSh2b2lkKQo+ICAgICAgcC0+ZXh0ZC5yYXdbMHhhXSA9IEVN
UFRZX0xFQUY7IC8qIE5vIFNWTSBmb3IgUFYgZ3Vlc3RzLiAqLwo+ICB9Cj4gIAo+ICtzdGF0aWMg
dm9pZCBfX2luaXQgY2FsY3VsYXRlX3B2X2RlZl9wb2xpY3kodm9pZCkKPiArewo+ICsgICAgc3Ry
dWN0IGNwdWlkX3BvbGljeSAqcCA9ICZwdl9kZWZfY3B1aWRfcG9saWN5Owo+ICsgICAgdWludDMy
X3QgcHZfZmVhdHVyZXNldFtGU0NBUElOVFNdOwo+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+
ICsgICAgKnAgPSBwdl9tYXhfY3B1aWRfcG9saWN5Owo+ICsgICAgY3B1aWRfcG9saWN5X3RvX2Zl
YXR1cmVzZXQocCwgcHZfZmVhdHVyZXNldCk7Cj4gKwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHB2X2ZlYXR1cmVzZXQpOyArK2kgKQo+ICsgICAgICAgIHB2X2ZlYXR1cmVzZXRb
aV0gJj0gcHZfZGVmX2ZlYXR1cmVtYXNrW2ldOwo+ICsKPiArICAgIHNhbml0aXNlX2ZlYXR1cmVz
ZXQocHZfZmVhdHVyZXNldCk7Cj4gKyAgICBjcHVpZF9mZWF0dXJlc2V0X3RvX3BvbGljeShwdl9m
ZWF0dXJlc2V0LCBwKTsKPiArICAgIHJlY2FsY3VsYXRlX3hzdGF0ZShwKTsKPiArfQoKSXMgdGhl
cmUgYSByZWFzb24gdGhlIGNhbGwgdG8gZ3Vlc3RfY29tbW9uX2ZlYXR1cmVfYWRqdXN0bWVudHMo
KQppcyBtaXNzaW5nIGhlcmU/IElmIHNvLCBJIHRoaW5rIHlvdSB3YW50IHRvIHNheSBhIHdvcmQg
b24gdGhlIHdoeQppbiB0aGUgZGVzY3JpcHRpb24uIElmIG5vdCwgd2l0aCBpdCBhZGRlZApSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
