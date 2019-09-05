Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB2AA353
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qwb-0000So-4a; Thu, 05 Sep 2019 12:32:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5qwZ-0000Sj-VR
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:32:55 +0000
X-Inumbo-ID: 48abcf70-cfd9-11e9-abc9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48abcf70-cfd9-11e9-abc9-12813bfff9fa;
 Thu, 05 Sep 2019 12:32:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B8A6B089;
 Thu,  5 Sep 2019 12:32:54 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-3-jgross@suse.com>
 <adcb0145-0f61-1a64-ae01-ae2e92d80350@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bc5d2f86-8e14-ca5e-34be-d7cd9ce21adf@suse.com>
Date: Thu, 5 Sep 2019 14:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <adcb0145-0f61-1a64-ae01-ae2e92d80350@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 2/4] xen: move debugtrace coding to
 common/debugtrace.c
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTM6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIveGVuL2Nv
bW1vbi9kZWJ1Z3RyYWNlLmMKPj4gQEAgLTAsMCArMSwxODEgQEAKPj4gKy8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPj4gKyAqIGRlYnVndHJhY2UuYwo+PiArICoKPj4gKyAqIERlYnVndHJhY2UgZm9y
IFhlbgo+PiArICovCj4+ICsKPj4gKwo+PiArI2luY2x1ZGUgPHhlbi9jb25zb2xlLmg+Cj4+ICsj
aW5jbHVkZSA8eGVuL2luaXQuaD4KPj4gKyNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgo+PiAr
I2luY2x1ZGUgPHhlbi9saWIuaD4KPj4gKyNpbmNsdWRlIDx4ZW4vbW0uaD4KPj4gKyNpbmNsdWRl
IDx4ZW4vc2VyaWFsLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4+ICsjaW5jbHVk
ZSA8eGVuL3dhdGNoZG9nLmg+Cj4+ICsKPj4gKyNkZWZpbmUgREVCVUdfVFJBQ0VfRU5UUllfU0la
RSAgIDEwMjQKPj4gKwo+PiArLyogU2VuZCBvdXRwdXQgZGlyZWN0IHRvIGNvbnNvbGUsIG9yIGJ1
ZmZlciBpdD8gKi8KPj4gK3N0YXRpYyB2b2xhdGlsZSBpbnQgZGVidWd0cmFjZV9zZW5kX3RvX2Nv
bnNvbGU7Cj4+ICsKPj4gK3N0YXRpYyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERl
YnVnLXRyYWNlIGJ1ZmZlciAqLwo+PiArc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3By
ZDsgLyogUHJvZHVjZXIgaW5kZXggICAgICovCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IGRlYnVn
dHJhY2Vfa2lsb2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+PiArc3RhdGljIHVuc2ln
bmVkIGludCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4+ICtzdGF0aWMgY2hhciBkZWJ1Z3RyYWNlX2xhc3Rf
ZW50cnlfYnVmW0RFQlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+PiArc3RhdGljIERFRklORV9TUElO
TE9DSyhkZWJ1Z3RyYWNlX2xvY2spOwo+PiAraW50ZWdlcl9wYXJhbSgiZGVidWd0cmFjZSIsIGRl
YnVndHJhY2Vfa2lsb2J5dGVzKTsKPj4gKwo+PiArc3RhdGljIHZvaWQgZGVidWd0cmFjZV9kdW1w
X3dvcmtlcih2b2lkKQo+IAo+IEFuZCBhbm90aGVyIHJlbWFyayBoZXJlIHRvbywgZGVzcGl0ZSBt
eSBwcmlvciBhY2s6IEJ5IG1vdmluZyB0aGlzIGludG8KPiBpdHMgb3duIGZpbGUsIHRoZSBkZWJ1
Z3RyYWNlXyBwcmVmaXhlcyBvZiBzdGF0aWMgc3ltYm9scyBub3cgYWxsCj4gYmVjb21lIHJlZHVu
ZGFudCwgYXQgbGVhc3QgYXMgZmFyIGFzIHRoZWlyIG9jY3VycmVuY2UgaW4gZS5nLiBjYWxsCj4g
c3RhY2tzIGdvZXMgKHdoZXJlIHRoZXknZCBiZSBwcmVmaXhlcyBieSB0aGUgZGlzYW1iaWd1YXRp
bmcgc291cmNlCj4gZmlsZSBuYW1lKS4gQnV0IEkga25vdyB3ZSd2ZSBnb3QgYW1wbGUgb3RoZXIg
ZXhhbXBsZXMgd2hlcmUgdGhpcyBpcwo+IGFsc28gdGhlIGNhc2UsIGFuZCBJIGFsc28ga25vdyB0
aGVyZSBhcmUgY29udHJhcnkgb3BpbmlvbnMgb24gdGhlCj4gbWF0dGVyLCBzbyB0aGlzIGlzIG5v
dCBzdHJpY3RseSBhIHJlcXVlc3QgZm9yIGZ1cnRoZXIgY2hhbmdlLgoKSSdtIG9uZSBvZiB0aGUg
ImNvbnRyYXJ5IG9waW5pb24iIGd1eXMuIDotKQoKU28gSSdkIHJhdGhlciBrZWVwIHRoZSBwcmVm
aXguCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
