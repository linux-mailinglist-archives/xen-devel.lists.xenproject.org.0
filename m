Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9414A698
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:54:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5jJ-0005EH-4y; Mon, 27 Jan 2020 14:51:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw5jH-0005EC-BK
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:51:07 +0000
X-Inumbo-ID: 726c0008-4114-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 726c0008-4114-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 14:51:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2831ABED;
 Mon, 27 Jan 2020 14:51:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-17-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bb985c9-bb1d-097d-9927-95b0a3b0e216@suse.com>
Date: Mon, 27 Jan 2020 15:51:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127143444.25538-17-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 16/17] tools/libxc: Restore CPUID/MSR
 data found in the migration stream
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxNTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaXRoIGFsbCBvdGhl
ciBwaWVjZXMgaW4gcGxhY2UsIGl0IGlzIG5vdyBzYWZlIHRvIHJlc3RvcmUgdGhlIENQVUlEIGFu
ZCBNU1IKPiBkYXRhIGluIHRoZSBtaWdyYXRpb24gc3RyZWFtLCByYXRoZXIgdGhhbiBkaXNjYXJk
aW5nIHRoZW0gYW5kIHVzaW5nIHRoZSBoaWdoZXIKPiBsZXZlbCB0b29sc3RhY2tzIGNvbXBhdGli
aWxpdHkgbG9naWMuCj4gCj4gV2hpbGUgdGhpcyBpcyBhIHNtYWxsIHBhdGNoLCBpdCBoYXMgbGFy
Z2UgaW1wbGljYXRpb25zIGZvciBtaWdyYXRlZC9yZXN1bWVkCj4gZG9tYWlucy4gIE1vc3Qgb2J2
aW91c2x5LCB0aGUgQ1BVIGZhbWlseS9tb2RlbC9zdGVwcGluZyBkYXRhLAo+IGNhY2hlL3RsYi9l
dGMuIHdpbGwgbm8gbG9uZ2VyIGNoYW5nZSBiZWhpbmQgdGhlIGd1ZXN0cyBiYWNrLgo+IAo+IEFu
b3RoZXIgY2hhbmdlIGlzIHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgWGVuZCBjcHVpZCBzdHJp
bmdzLiAgVGhlICdrJwo+IG9wdGlvbiBpcyBub3QgYSBzZW5zaWJsZSB0aGluZyB0byBoYXZlIGV2
ZXIgc3VwcG9ydGVkLCBhbmQgJ3MnIGlzIGhvdyBob3cgdGhlCj4gc3RyZWFtIHdpbGwgZW5kIHVw
IGJlaGF2aW5nLgoKSSdtIGEgbGl0dGxlIGNvbmZ1c2VkIEkgZ3Vlc3MgLSBJJ2QgaGF2ZSBleHBl
Y3RlZCBzdWNoIGEgZGVzY3JpcHRpb24KdG8gbWVhbiB0aGF0IC4uLgoKPiAtLS0gYS90b29scy9s
aWJ4Yy94Y19jcHVpZF94ODYuYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4g
QEAgLTI5MSwxMCArMjkxLDkgQEAgaW50IHhjX3NldF9kb21haW5fY3B1X3BvbGljeSh4Y19pbnRl
cmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4gICAqICAgJzAnIC0+IGZvcmNlIHRvIDAKPiAg
ICogICAneCcgLT4gd2UgZG9uJ3QgY2FyZSAodXNlIGRlZmF1bHQpCj4gICAqICAgJ2snIC0+IHBh
c3MgdGhyb3VnaCBob3N0IHZhbHVlCj4gLSAqICAgJ3MnIC0+IHBhc3MgdGhyb3VnaCB0aGUgZmly
c3QgdGltZSBhbmQgdGhlbiBrZWVwIHRoZSBzYW1lIHZhbHVlCj4gLSAqICAgICAgICAgIGFjcm9z
cyBzYXZlL3Jlc3RvcmUgYW5kIG1pZ3JhdGlvbi4KPiArICogICAncycgLT4gbGVnYWN5IGFsaWFz
IGZvciAnaycKCi4uLiAncycgcmVtYWlucyBkb2N1bWVudGVkIGFzIGlzLCBhbmQgJ2snIHRvIGJl
Y29tZSBhIGxlZ2FjeSBhbGlhcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
