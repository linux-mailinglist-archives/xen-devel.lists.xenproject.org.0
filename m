Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E8AA307
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:24:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qkw-0007H2-Am; Thu, 05 Sep 2019 12:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qku-0007Gv-M6
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:20:52 +0000
X-Inumbo-ID: 989544b5-cfd7-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 989544b5-cfd7-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:20:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A201FAFFC;
 Thu,  5 Sep 2019 12:20:49 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adcb0145-0f61-1a64-ae01-ae2e92d80350@suse.com>
Date: Thu, 5 Sep 2019 14:20:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905113955.24870-3-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKPiBAQCAtMCwwICsxLDE4MSBAQAo+ICsv
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCj4gKyAqIGRlYnVndHJhY2UuYwo+ICsgKgo+ICsgKiBEZWJ1
Z3RyYWNlIGZvciBYZW4KPiArICovCj4gKwo+ICsKPiArI2luY2x1ZGUgPHhlbi9jb25zb2xlLmg+
Cj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+ICsjaW5jbHVkZSA8eGVuL2tleWhhbmRsZXIuaD4K
PiArI2luY2x1ZGUgPHhlbi9saWIuaD4KPiArI2luY2x1ZGUgPHhlbi9tbS5oPgo+ICsjaW5jbHVk
ZSA8eGVuL3NlcmlhbC5oPgo+ICsjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4gKyNpbmNsdWRl
IDx4ZW4vd2F0Y2hkb2cuaD4KPiArCj4gKyNkZWZpbmUgREVCVUdfVFJBQ0VfRU5UUllfU0laRSAg
IDEwMjQKPiArCj4gKy8qIFNlbmQgb3V0cHV0IGRpcmVjdCB0byBjb25zb2xlLCBvciBidWZmZXIg
aXQ/ICovCj4gK3N0YXRpYyB2b2xhdGlsZSBpbnQgZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7
Cj4gKwo+ICtzdGF0aWMgY2hhciAgICAgICAgKmRlYnVndHJhY2VfYnVmOyAvKiBEZWJ1Zy10cmFj
ZSBidWZmZXIgKi8KPiArc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyogUHJv
ZHVjZXIgaW5kZXggICAgICovCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9raWxv
Ynl0ZXMgPSAxMjgsIGRlYnVndHJhY2VfYnl0ZXM7Cj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGVi
dWd0cmFjZV91c2VkOwo+ICtzdGF0aWMgY2hhciBkZWJ1Z3RyYWNlX2xhc3RfZW50cnlfYnVmW0RF
QlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+ICtzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGRlYnVndHJh
Y2VfbG9jayk7Cj4gK2ludGVnZXJfcGFyYW0oImRlYnVndHJhY2UiLCBkZWJ1Z3RyYWNlX2tpbG9i
eXRlcyk7Cj4gKwo+ICtzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKHZvaWQpCgpB
bmQgYW5vdGhlciByZW1hcmsgaGVyZSB0b28sIGRlc3BpdGUgbXkgcHJpb3IgYWNrOiBCeSBtb3Zp
bmcgdGhpcyBpbnRvCml0cyBvd24gZmlsZSwgdGhlIGRlYnVndHJhY2VfIHByZWZpeGVzIG9mIHN0
YXRpYyBzeW1ib2xzIG5vdyBhbGwKYmVjb21lIHJlZHVuZGFudCwgYXQgbGVhc3QgYXMgZmFyIGFz
IHRoZWlyIG9jY3VycmVuY2UgaW4gZS5nLiBjYWxsCnN0YWNrcyBnb2VzICh3aGVyZSB0aGV5J2Qg
YmUgcHJlZml4ZXMgYnkgdGhlIGRpc2FtYmlndWF0aW5nIHNvdXJjZQpmaWxlIG5hbWUpLiBCdXQg
SSBrbm93IHdlJ3ZlIGdvdCBhbXBsZSBvdGhlciBleGFtcGxlcyB3aGVyZSB0aGlzIGlzCmFsc28g
dGhlIGNhc2UsIGFuZCBJIGFsc28ga25vdyB0aGVyZSBhcmUgY29udHJhcnkgb3BpbmlvbnMgb24g
dGhlCm1hdHRlciwgc28gdGhpcyBpcyBub3Qgc3RyaWN0bHkgYSByZXF1ZXN0IGZvciBmdXJ0aGVy
IGNoYW5nZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
