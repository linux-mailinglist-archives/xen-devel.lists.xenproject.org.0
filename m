Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B198A1843A4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:29:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgaC-0002dz-Ij; Fri, 13 Mar 2020 09:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgaA-0002dJ-LM
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:26:18 +0000
X-Inumbo-ID: b14d68cc-650c-11ea-b2ae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b14d68cc-650c-11ea-b2ae-12813bfff9fa;
 Fri, 13 Mar 2020 09:26:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40701B0BA;
 Fri, 13 Mar 2020 09:26:17 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Message-ID: <8221cc7f-ad33-03da-5780-8a76fbdc404a@suse.com>
Date: Fri, 13 Mar 2020 10:26:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/4] x86/APIC: reduce rounding errors in
 calculations
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGl2aWRpbmcgYnkgSFovMTAganVzdCB0byBzdWJzZXF1ZW50bHkgbXVsdGlwbHkgYnkgSFogYWdh
aW4gaW4gYWxsIHVzZXMKb2YgdGhlIHJlc3BlY3RpdmUgdmFyaWFibGUgaXMgcHJldHR5IHBvaW50
bGVzc2x5IGludHJvZHVjaW5nIHJvdW5kaW5nCihyZWFsbHk6IHRydW5jYXRpb24pIGVycm9ycy4g
V2hpbGUgdHJhbnNmb3JtaW5nIHRoZSByZXNwZWN0aXZlCmV4cHJlc3Npb25zIGl0IGJlY2FtZSBh
cHBhcmVudCB0aGF0ICJyZXN1bHQiIHdvdWxkIGJlIGxlZnQgdW51c2VkIGV4Y2VwdApmb3IgaXRz
IHVzZSBhcyBmdW5jdGlvbiByZXR1cm4gdmFsdWUuIEFzIHRoZSBzb2xlIGNhbGxlciBvZiB0aGUg
ZnVuY3Rpb24KZG9lc24ndCBsb29rIGF0IHRoZSByZXR1cm5lZCB2YWx1ZSwgc2ltcGx5IGNvbnZl
cnQgdGhlIGZ1bmN0aW9uIHRvIGhhdmUKInZvaWQiIHJldHVybiB0eXBlLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2Fw
aWMuYworKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCkBAIC0xMjA0LDE0ICsxMjA0LDE0IEBAIHN0
YXRpYyB2b2lkIHdhaXRfdGlja19wdmgodm9pZCkKICAqIEFQSUMgaXJxIHRoYXQgd2F5LgogICov
CiAKLXN0YXRpYyBpbnQgX19pbml0IGNhbGlicmF0ZV9BUElDX2Nsb2NrKHZvaWQpCitzdGF0aWMg
dm9pZCBfX2luaXQgY2FsaWJyYXRlX0FQSUNfY2xvY2sodm9pZCkKIHsKICAgICB1bnNpZ25lZCBs
b25nIGxvbmcgdDEsIHQyOwotICAgIHVuc2lnbmVkIGxvbmcgdHQxLCB0dDIsIHJlc3VsdDsKKyAg
ICB1bnNpZ25lZCBsb25nIHR0MSwgdHQyOwogICAgIHVuc2lnbmVkIGludCBpOwogICAgIHVuc2ln
bmVkIGxvbmcgYnVzX2ZyZXE7IC8qIEtBRjogcG9pbnRlci1zaXplIGF2b2lkcyBjb21waWxlIHdh
cm5zLiAqLwogICAgIHVuc2lnbmVkIGludCBidXNfY3ljbGU7IC8qIGxlbmd0aCBvZiBvbmUgYnVz
IGN5Y2xlIGluIHBpY28tc2Vjb25kcyAqLwotICAgIGNvbnN0IHVuc2lnbmVkIGludCBMT09QUyA9
IEhaLzEwOworI2RlZmluZSBMT09QU19GUkFDIDEwVSAgICAgIC8qIG1lYXN1cmUgZm9yIG9uZSB0
ZW50aCBvZiBhIHNlY29uZCAqLwogCiAgICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAiY2Fs
aWJyYXRpbmcgQVBJQyB0aW1lciAuLi5cbiIpOwogCkBAIC0xMjM4LDkgKzEyMzgsOSBAQCBzdGF0
aWMgaW50IF9faW5pdCBjYWxpYnJhdGVfQVBJQ19jbG9jayh2CiAgICAgdHQxID0gYXBpY19yZWFk
KEFQSUNfVE1DQ1QpOwogCiAgICAgLyoKLSAgICAgKiBMZXQncyB3YWl0IExPT1BTIHRpY2tzOgor
ICAgICAqIExldCdzIHdhaXQgSFogLyBMT09QU19GUkFDIHRpY2tzOgogICAgICAqLwotICAgIGZv
ciAoaSA9IDA7IGkgPCBMT09QUzsgaSsrKQorICAgIGZvciAoaSA9IDA7IGkgPCBIWiAvIExPT1BT
X0ZSQUM7IGkrKykKICAgICAgICAgaWYgKCAheGVuX2d1ZXN0ICkKICAgICAgICAgICAgIHdhaXRf
ODI1NF93cmFwYXJvdW5kKCk7CiAgICAgICAgIGVsc2UKQEAgLTEyNDksMTcgKzEyNDksMTYgQEAg
c3RhdGljIGludCBfX2luaXQgY2FsaWJyYXRlX0FQSUNfY2xvY2sodgogICAgIHR0MiA9IGFwaWNf
cmVhZChBUElDX1RNQ0NUKTsKICAgICB0MiA9IHJkdHNjX29yZGVyZWQoKTsKIAotICAgIHJlc3Vs
dCA9ICh0dDEtdHQyKSpBUElDX0RJVklTT1IvTE9PUFM7CisgICAgYnVzX2ZyZXEgPSAodHQxIC0g
dHQyKSAqIEFQSUNfRElWSVNPUiAqIExPT1BTX0ZSQUM7CiAKLSAgICBhcGljX3ByaW50ayhBUElD
X1ZFUkJPU0UsICIuLi4uLiBDUFUgY2xvY2sgc3BlZWQgaXMgJWxkLiUwNGxkIE1Iei5cbiIsCi0g
ICAgICAgICAgICAgICAgKChsb25nKSh0MiAtIHQxKSAvIExPT1BTKSAvICgxMDAwMDAwIC8gSFop
LAotICAgICAgICAgICAgICAgICgobG9uZykodDIgLSB0MSkgLyBMT09QUykgJSAoMTAwMDAwMCAv
IEhaKSk7CisgICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAiLi4uLi4gQ1BVIGNsb2NrIHNw
ZWVkIGlzICVsdS4lMDRsdSBNSHouXG4iLAorICAgICAgICAgICAgICAgICgodW5zaWduZWQgbG9u
ZykodDIgLSB0MSkgKiBMT09QU19GUkFDKSAvIDEwMDAwMDAsCisgICAgICAgICAgICAgICAgKCh1
bnNpZ25lZCBsb25nKSh0MiAtIHQxKSAqIExPT1BTX0ZSQUMgLyAxMDApICUgMTAwMDApOwogCiAg
ICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAiLi4uLi4gaG9zdCBidXMgY2xvY2sgc3BlZWQg
aXMgJWxkLiUwNGxkIE1Iei5cbiIsCi0gICAgICAgICAgICAgICAgcmVzdWx0IC8gKDEwMDAwMDAg
LyBIWiksIHJlc3VsdCAlICgxMDAwMDAwIC8gSFopKTsKKyAgICAgICAgICAgICAgICBidXNfZnJl
cSAvIDEwMDAwMDAsIChidXNfZnJlcSAvIDEwMCkgJSAxMDAwMCk7CiAKICAgICAvKiBzZXQgdXAg
bXVsdGlwbGllcnMgZm9yIGFjY3VyYXRlIHRpbWVyIGNvZGUgKi8KLSAgICBidXNfZnJlcSAgID0g
cmVzdWx0KkhaOwogICAgIGJ1c19jeWNsZSAgPSAodTMyKSAoMTAwMDAwMDAwMDAwMExML2J1c19m
cmVxKTsgLyogaW4gcGljbyBzZWNvbmRzICovCiAgICAgYnVzX2N5Y2xlICs9ICgxMDAwMDAwMDAw
MDAwVUwgJSBidXNfZnJlcSkgKiAyID4gYnVzX2ZyZXE7CiAgICAgYnVzX3NjYWxlICA9ICgxMDAw
KjI2MjE0NCkvYnVzX2N5Y2xlOwpAQCAtMTI2OSw3ICsxMjY4LDcgQEAgc3RhdGljIGludCBfX2lu
aXQgY2FsaWJyYXRlX0FQSUNfY2xvY2sodgogICAgIC8qIHJlc2V0IEFQSUMgdG8gemVybyB0aW1l
b3V0IHZhbHVlICovCiAgICAgX19zZXR1cF9BUElDX0xWVFQoMCk7CiAKLSAgICByZXR1cm4gcmVz
dWx0OworI3VuZGVmIExPT1BTX0ZSQUMKIH0KIAogdm9pZCBfX2luaXQgc2V0dXBfYm9vdF9BUElD
X2Nsb2NrKHZvaWQpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
