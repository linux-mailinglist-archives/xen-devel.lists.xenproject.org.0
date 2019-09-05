Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA9AA380
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:51:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rA6-0001Yb-Um; Thu, 05 Sep 2019 12:46:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5rA5-0001YW-E0
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:46:53 +0000
X-Inumbo-ID: 3b505682-cfdb-11e9-abca-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b505682-cfdb-11e9-abca-12813bfff9fa;
 Thu, 05 Sep 2019 12:46:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90953B02C;
 Thu,  5 Sep 2019 12:46:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
 <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
 <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c5e744c2-73e7-3a6c-6404-b7596c1c24e3@suse.com>
Date: Thu, 5 Sep 2019 14:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
 Julien Grall <julien.grall@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTQ6
MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA1LjA5LjE5IDE0OjIyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA1LjA5LjIwMTkgMTQ6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDUuMDkuMTkgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4wOS4y
MDE5IDEzOjM5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gQXMgYSBwcmVwYXJhdGlvbiBm
b3IgcGVyLWNwdSBidWZmZXJzIGRvIGEgbGl0dGxlIHJlZmFjdG9yaW5nIG9mIHRoZQo+Pj4+Pj4g
ZGVidWd0cmFjZSBkYXRhOiBwdXQgdGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRo
ZSBidWZmZXIgYXMKPj4+Pj4+IGl0IHdpbGwgYmUgbmVlZGVkIGZvciBlYWNoIGJ1ZmZlci4gSW4g
b3JkZXIgbm90IHRvIGxpbWl0IGJ1ZmZlciBzaXplCj4+Pj4+PiBzd2l0Y2ggdGhlIHJlbGF0ZWQg
ZmllbGRzIGZyb20gdW5zaWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcsIGFzIG9uCj4+Pj4+PiBo
dWdlIG1hY2hpbmVzIHdpdGggUkFNIGluIHRoZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVz
dGluZyB0bwo+Pj4+Pj4gc3VwcG9ydCBidWZmZXJzID40R0IuCj4+Pj4+Cj4+Pj4+IEp1c3QgYXMg
YSBmdXJ0aGVyIHJlbWFyayBpbiB0aGlzIHJlZ2FyZDoKPj4+Pj4KPj4+Pj4+ICAgICB2b2lkIGRl
YnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4gICAgIHsKPj4+Pj4+
ICAgICAgICAgc3RhdGljIGNoYXIgYnVmW0RFQlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+Pj4+Pj4g
LSAgICBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKPj4+
Pj4+ICsgICAgc3RhdGljIHVuc2lnbmVkIGludCBjb3VudCwgbGFzdF9jb3VudDsKPj4+Pj4KPj4+
Pj4gSG93IGxvbmcgZG8gd2UgdGhpbmsgd2lsbCBpdCB0YWtlIHVudGlsIHRoZWlyIHdyYXBwaW5n
IHdpbGwgYmVjb21lCj4+Pj4+IGFuIGlzc3VlIHdpdGggc3VjaCBodWdlIGJ1ZmZlcnM/Cj4+Pj4K
Pj4+PiBDb3VudCB3cmFwcGluZyB3aWxsIG5vdCByZXN1bHQgaW4gYW55IG1pc2JlaGF2aW9yIG9m
IHRyYWNpbmcuIFdpdGgKPj4+PiBwZXItY3B1IGJ1ZmZlcnMgaXQgbWlnaHQgcmVzdWx0IGluIGFt
YmlndWl0eSByZWdhcmRpbmcgc29ydGluZyB0aGUKPj4+PiBlbnRyaWVzLCBidXQgSSBndWVzcyBj
aGFuY2VzIGFyZSByYXRoZXIgbG93IHRoaXMgYmVpbmcgYSByZWFsIGlzc3VlLgo+Pj4+Cj4+Pj4g
QlRXOiB3cmFwcGluZyBvZiBjb3VudCBpcyBub3QgcmVsYXRlZCB0byBidWZmZXIgc2l6ZSwgYnV0
IHRvIHRoZQo+Pj4+IGFtb3VudCBvZiB0cmFjZSBkYXRhIHdyaXR0ZW4uCj4+Pgo+Pj4gU3VyZSwg
YnV0IHRoZSBjaGFuY2Ugb2YgYW1iaWd1aXR5IGluY3JlYXNlcyB3aXRoIGxhcmdlciBidWZmZXIg
c2l6ZXMuCj4+Cj4+IFdlbGwsIGJldHRlciBzYWZlIHRoYW4gc29ycnkuIFN3aXRjaGluZyB0byB1
bnNpZ25lZCBsb25nIHdpbGwgcmFyZWx5Cj4+IGh1cnQsIHNvIEknbSBnb2luZyB0byBkbyBqdXN0
IHRoYXQuIFRoZSBvbmx5IGRvd25zaWRlIHdpbGwgYmUgc29tZSB3YXN0ZQo+PiBvZiBidWZmZXIg
c3BhY2UgZm9yIHZlcnkgbG9uZyBydW5uaW5nIHRyYWNlcyB3aXRoIGh1Z2UgYW1vdW50cyBvZgo+
PiBlbnRyaWVzLgo+IAo+IEhtbSwgdHJ1ZS4gTWF5YmUgd2UgY291bGQgZ2V0IHNvbWVvbmUgZWxz
ZSdzIG9waW5pb24gb24gdGhpcyAtIGFueW9uZT8KClRCSCwgSSB3b3VsZG4ndCBiZSBjb25jZXJu
ZWQgYWJvdXQgdGhlIGJ1ZmZlciBzcGFjZS4gSW4gY2FzZSB0aGVyZSBhcmUKcmVhbGx5IGJpbGxp
b25zIG9mIGVudHJpZXMsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYSAxMC1kaWdpdCBjb3VudAp2
YWx1ZSBhbmQgbWF5YmUgYSAxNSBkaWdpdCBvbmUgKGFuZCB0aGF0IGlzIGFscmVhZHkgYSBtYXNz
aXZlIGFtb3VudCkKaXNuJ3QgdGhhdCBsYXJnZS4gVGhlIGF2ZXJhZ2UgcHJpbnRlZCBzaXplIG9m
IGNvdW50IHdpdGggYWJvdXQKNCBiaWxsaW9uIGVudHJpZXMgaXMgOS43NSBkaWdpdHMgKGFuZCBu
b3QganVzdCA1IDotKSApLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
