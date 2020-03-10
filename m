Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E151803A2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:37:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhpz-0000wQ-9G; Tue, 10 Mar 2020 16:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBhpy-0000wJ-5S
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:34:34 +0000
X-Inumbo-ID: 05bf845c-62ed-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05bf845c-62ed-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 16:34:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37EA2AB92;
 Tue, 10 Mar 2020 16:34:32 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-3-jgross@suse.com>
 <758b6a3a-a08e-4b83-9523-0fcb02f705a7@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7f1d759e-2a35-f7ab-7d71-104420192fb6@suse.com>
Date: Tue, 10 Mar 2020 17:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <758b6a3a-a08e-4b83-9523-0fcb02f705a7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAgMTc6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAzLjIwMjAgMDg6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0xNDMsNTEgKzE0Myw3NSBAQCBzdGF0aWMg
aW50IHFoaW1hcmsgPSAxMDAwMDsKPj4gICBzdGF0aWMgaW50IHFsb3dtYXJrID0gMTAwOwo+PiAg
IHN0YXRpYyBpbnQgcnNpbnRlcnZhbCA9IDEwMDA7Cj4+ICAgCj4+IC1zdHJ1Y3QgcmN1X2JhcnJp
ZXJfZGF0YSB7Cj4+IC0gICAgc3RydWN0IHJjdV9oZWFkIGhlYWQ7Cj4+IC0gICAgYXRvbWljX3Qg
KmNwdV9jb3VudDsKPj4gLX07Cj4+ICsvKgo+PiArICogcmN1X2JhcnJpZXIoKSBoYW5kbGluZzoK
Pj4gKyAqIGNwdV9jb3VudCBob2xkcyB0aGUgbnVtYmVyIG9mIGNwdSByZXF1aXJlZCB0byBmaW5p
c2ggYmFycmllciBoYW5kbGluZy4KPj4gKyAqIENwdXMgYXJlIHN5bmNocm9uaXplZCB2aWEgc29m
dGlycSBtZWNoYW5pc20uIHJjdV9iYXJyaWVyKCkgaXMgcmVnYXJkZWQgdG8KPj4gKyAqIGJlIGFj
dGl2ZSBpZiBjcHVfY291bnQgaXMgbm90IHplcm8uIEluIGNhc2UgcmN1X2JhcnJpZXIoKSBpcyBj
YWxsZWQgb24KPj4gKyAqIG11bHRpcGxlIGNwdXMgaXQgaXMgZW5vdWdoIHRvIGNoZWNrIGZvciBj
cHVfY291bnQgYmVpbmcgbm90IHplcm8gb24gZW50cnkKPj4gKyAqIGFuZCB0byBjYWxsIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpIGluIGEgbG9vcCB1bnRpbCBjcHVfY291bnQgZHJvcHMgdG8K
Pj4gKyAqIHplcm8sIGFzIHN5bmNpbmcgaGFzIGJlZW4gcmVxdWVzdGVkIGFscmVhZHkgYW5kIHdl
IGRvbid0IG5lZWQgdG8gc3luYwo+PiArICogbXVsdGlwbGUgdGltZXMuCj4+ICsgKiBJbiBvcmRl
ciB0byBhdm9pZCBoYW5ncyB3aGVuIHJjdV9iYXJyaWVyKCkgaXMgY2FsbGVkIG11dGlwbGUgdGlt
ZXMgb24gdGhlCj4+ICsgKiBzYW1lIGNwdSBpbiBmYXN0IHNlcXVlbmNlIGFuZCBhIHNsYXZlIGNw
dSBjb3VsZG4ndCBkcm9wIG91dCBvZiB0aGUKPj4gKyAqIGJhcnJpZXIgaGFuZGxpbmcgZmFzdCBl
bm91Z2ggYSBzZWNvbmQgY291bnRlciBkb25lX2NvdW50IGlzIG5lZWRlZC4KPj4gKyAqLwo+PiAr
c3RhdGljIGF0b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+PiArc3RhdGljIGF0
b21pY190IGRvbmVfY291bnQgPSBBVE9NSUNfSU5JVCgwKTsKPiAKPiAgRnJvbSBpdHMgdXNlIGJl
bG93IHRoaXMgbG9va3MgbW9yZSBsaWtlICJ0b2RvX2NvdW50IiBvcgo+ICJwZW5kaW5nX2NvdW50
Ii4KPiAKPj4gK3ZvaWQgcmN1X2JhcnJpZXIodm9pZCkKPj4gICB7Cj4+IC0gICAgYXRvbWljX3Qg
Y3B1X2NvdW50ID0gQVRPTUlDX0lOSVQoMCk7Cj4+IC0gICAgcmV0dXJuIHN0b3BfbWFjaGluZV9y
dW4ocmN1X2JhcnJpZXJfYWN0aW9uLCAmY3B1X2NvdW50LCBOUl9DUFVTKTsKPj4gKyAgICB1bnNp
Z25lZCBpbnQgbl9jcHVzOwo+PiArCj4+ICsgICAgd2hpbGUgKCAhZ2V0X2NwdV9tYXBzKCkgKQo+
PiArICAgIHsKPj4gKyAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7Cj4+ICsgICAg
ICAgIGlmICggIWF0b21pY19yZWFkKCZjcHVfY291bnQpICkKPj4gKyAgICAgICAgICAgIHJldHVy
bjsKPj4gKwo+PiArICAgICAgICBjcHVfcmVsYXgoKTsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBu
X2NwdXMgPSBudW1fb25saW5lX2NwdXMoKTsKPj4gKwo+PiArICAgIGlmICggYXRvbWljX2NtcHhj
aGcoJmNwdV9jb3VudCwgMCwgbl9jcHVzKSA9PSAwICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGF0
b21pY19hZGQobl9jcHVzLCAmZG9uZV9jb3VudCk7Cj4+ICsgICAgICAgIGNwdW1hc2tfcmFpc2Vf
c29mdGlycSgmY3B1X29ubGluZV9tYXAsIFJDVV9TT0ZUSVJRKTsKPj4gKyAgICB9Cj4+ICsKPj4g
KyAgICB3aGlsZSAoIGF0b21pY19yZWFkKCZkb25lX2NvdW50KSApCj4gCj4gRG9uJ3QgeW91IGxl
YXZlIGEgd2luZG93IGZvciByYWNlcyBoZXJlLCBpbiB0aGF0IGRvbmVfY291bnQKPiBnZXRzIHNl
dCB0byBub24temVybyBvbmx5IGFmdGVyIHNldHRpbmcgY3B1X2NvdW50PyBBIENQVQo+IGxvc2lu
ZyB0aGUgY21weGNoZyBhdHRlbXB0IGFib3ZlIG1heSBvYnNlcnZlIGRvbmVfY291bnQKPiBzdGls
bCBiZWluZyB6ZXJvLCBhbmQgaGVuY2UgZXhpdCB3aXRob3V0IHdhaXRpbmcgZm9yIHRoZQo+IGNv
dW50IHRvIGFjdHVhbGx5IF9kcm9wXyB0byB6ZXJvLgoKVGhpcyBjYW4gb25seSBiZSBhIGNwdSBu
b3QgaGF2aW5nIGpvaW5lZCB0aGUgYmFycmllciBoYW5kbGluZywgc28gaXQKd2lsbCBkbyB0aGF0
IGxhdGVyLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
