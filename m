Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD514300D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:38:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ita0L-0007I7-Bg; Mon, 20 Jan 2020 16:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ita0J-0007I2-2F
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:34:19 +0000
X-Inumbo-ID: af2341e0-3ba2-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af2341e0-3ba2-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 16:34:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1228CAE41;
 Mon, 20 Jan 2020 16:34:09 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <a74d4a8de609dfba8b561b7ba0795b22e754fa0b.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab45f909-9463-2c6f-1a60-7e541663b1bc@suse.com>
Date: Mon, 20 Jan 2020 17:34:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a74d4a8de609dfba8b561b7ba0795b22e754fa0b.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 14/18] x86/mem_sharing: check page type
 count earlier
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMKPiBAQCAtNjUyLDE5ICs2NTIsMTggQEAgc3RhdGljIGludCBwYWdlX21ha2Vfc2hhcmFi
bGUoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAgICAgfQo+
ICAKPiAtICAgIC8qIENoYW5nZSBwYWdlIHR5cGUgYW5kIGNvdW50IGF0b21pY2FsbHkgKi8KPiAt
ICAgIGlmICggIWdldF9wYWdlX2FuZF90eXBlKHBhZ2UsIGQsIFBHVF9zaGFyZWRfcGFnZSkgKQo+
ICsgICAgLyogQ2hlY2sgaWYgcGFnZSBpcyBhbHJlYWR5IHR5cGVkIGFuZCBiYWlsIGVhcmx5IGlm
IGl0IGlzICovCj4gKyAgICBpZiAoIChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9jb3Vu
dF9tYXNrKSAhPSAxICkKPiAgICAgIHsKPiAgICAgICAgICBzcGluX3VubG9jaygmZC0+cGFnZV9h
bGxvY19sb2NrKTsKPiAtICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICByZXR1cm4g
LUVFWElTVDsKPiAgICAgIH0KPiAgCj4gLSAgICAvKiBDaGVjayBpdCB3YXNuJ3QgYWxyZWFkeSBz
aGFyYWJsZSBhbmQgdW5kbyBpZiBpdCB3YXMgKi8KPiAtICAgIGlmICggKHBhZ2UtPnUuaW51c2Uu
dHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spICE9IDEgKQo+ICsgICAgLyogQ2hhbmdlIHBhZ2Ug
dHlwZSBhbmQgY291bnQgYXRvbWljYWxseSAqLwo+ICsgICAgaWYgKCAhZ2V0X3BhZ2VfYW5kX3R5
cGUocGFnZSwgZCwgUEdUX3NoYXJlZF9wYWdlKSApCj4gICAgICB7Cj4gICAgICAgICAgc3Bpbl91
bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUo
cGFnZSk7Cj4gLSAgICAgICAgcmV0dXJuIC1FRVhJU1Q7Cj4gKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gICAgICB9CgpJdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQgZWl0aGVyIHRoZSBvcmlnaW5h
bCBvciB0aGUgbmV3IGNvZGUgY2Fubm90CmhhdmUgd29ya2VkIC8gd29yazogVGhlIG9yaWdpbmFs
IHZhcmlhbnQgY2hlY2tlZCB0aGUgY291bnQgX2FmdGVyXwpoYXZpbmcgaW5jcmVtZW50ZWQgaXQs
IGkuZS4gaXQgZXhwZWN0ZWQgYSAwLT4xIHRyYW5zaXRpb24uIFRoZSBuZXcKY29kZSBjaGVja3Mg
dGhhdCB0aGUgY291bnQgaXMgMSBfYmVmb3JlXyBkb2luZyB0aGUgZ2V0LgoKSG93ZXZlciwgZXZl
biBpZiB0aGlzIHdhcyBjaGFuZ2VkIHRvCgogICAgaWYgKCBwYWdlLT51LmludXNlLnR5cGVfaW5m
byAmIFBHVF9jb3VudF9tYXNrICkKCkkgd291bGQgcmVjb21tZW5kIGFnYWluc3QgdGhlIGNoYW5n
ZTogQWl1aSB5b3UgYnVpbGQgdXBvbiB0aGUgZmFjdAp0aGF0IGEgdHJhbnNpdGlvbiB0byBQR1Rf
c2hhcmVkX3BhZ2UgY2FuIGhhcHBlbiBvbmx5IGhlcmUsIGFuZCB0aGlzCmNvZGUgaG9sZHMgZC0+
cGFnZV9hbGxvY19sb2NrLiBCdXQgaW1vIHRoaXMgaXMgbWFraW5nIHRoZSBjb2RlIG1vcmUKZnJh
Z2lsZS4gSW4gZmFjdCBJIGNhbid0IGVhc2lseSBzZWUgd2h5IHRoZSBvdGhlciB0d28gY2FzZXMg
d2hlcmUKUEdUX3NoYXJlZF9wYWdlIGdldHMgcGFzc2VkIHRvIGdldF9wYWdlX2FuZF90eXBlKCkg
Y2FuJ3QgYWxzbwplZmZlY3QgYSAwLT4xIHRyYW5zaXRpb24uIEkgY2FuIG9ubHkgZ3Vlc3MgZnJv
bSB0aGVpciBCVUdfT04oKS1zCnRoYXQgdGhleSBhc3N1bWUgYSByZWZlcmVuY2Ugd2FzIGFscmVh
ZHkgYWNxdWlyZWQgc29tZXdoZXJlIGVsc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
