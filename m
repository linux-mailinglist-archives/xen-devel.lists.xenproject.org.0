Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B1A9C1D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:41:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mLS-0002PA-Mp; Thu, 05 Sep 2019 07:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5mLQ-0002P4-T3
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:38:16 +0000
X-Inumbo-ID: 1ef56f02-cfb0-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ef56f02-cfb0-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 07:38:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7180AEA7;
 Thu,  5 Sep 2019 07:38:14 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-8-jgross@suse.com>
 <7ce66a65-8f1b-1587-590c-17d82ac2e800@suse.com>
 <ecad6cb4-c5e1-a280-f86f-3cc7255a0dd3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e4ed5b5-38e7-6ea7-e674-40d445a2826e@suse.com>
Date: Thu, 5 Sep 2019 09:38:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ecad6cb4-c5e1-a280-f86f-3cc7255a0dd3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 07/48] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAwOToxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
NTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBUaGlzIHByZXBhcmVzIHN1cHBvcnQgb2YgbGFyZ2VyIHNjaGVkdWxp
bmcgZ3JhbnVsYXJpdGllcywgZS5nLiBjb3JlCj4+PiBzY2hlZHVsaW5nLgo+Pj4KPj4+IFdoaWxl
IGF0IGl0IG1vdmUgc2NoZWRfaGFzX3VyZ2VudF92Y3B1KCkgZnJvbSBpbmNsdWRlL2FzbS14ODYv
Y3B1aWRsZS5oCj4+PiBpbnRvIHNjaGVkdWxlLmMgcmVtb3ZpbmcgdGhlIG5lZWQgZm9yIGluY2x1
ZGluZyBzY2hlZC1pZi5oIGluCj4+PiBjcHVpZGxlLmggYW5kIG11bHRpcGxlIG90aGVyIEMgc291
cmNlcy4KPj4KPj4gTG9va2luZyBhZ2FpbiwgdGhlICNpbmNsdWRlLXMgaW4gLmMgZmlsZXMgc2hv
dWxkIGhhdmUgYmVlbiB1bm5lY2Vzc2FyeQo+PiBhbHRvZ2V0aGVyIChhbmQgZHJvcHBpbmcgb2Yg
dGhlbSBjb3VsZCwgaWYgaXQgd2FzIGEgc2VwYXJhdGUgcGF0Y2gsIGdvCj4+IGluIHJpZ2h0IGF3
YXkpLCBiZWNhdXNlIG9mIC4uLgo+IAo+IFBhdGNoIHNlbnQuCgpUaGFua3MuIEknbGwgZ28gYXBw
bHkgdGhpcyBpbiBhIG1pbnV0ZS4KCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlk
bGUuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZGxlLmgKPj4+IEBAIC00LDcg
KzQsNiBAQAo+Pj4gICAjaW5jbHVkZSA8eGVuL2NwdWlkbGUuaD4KPj4+ICAgI2luY2x1ZGUgPHhl
bi9ub3RpZmllci5oPgo+Pj4gICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4+PiAtI2luY2x1ZGUg
PHhlbi9zY2hlZC1pZi5oPgo+Pgo+PiAuLi4gdGhpcy4KPj4KPj4+IEBAIC0yNywxNCArMjYsNCBA
QCB2b2lkIHVwZGF0ZV9pZGxlX3N0YXRzKHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9wb3dlciAqLAo+
Pj4gICB2b2lkIHVwZGF0ZV9sYXN0X2N4X3N0YXQoc3RydWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2Vy
ICosCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3Jf
Y3ggKiwgdWludDY0X3QpOwo+Pj4gICAKPj4+IC0vKgo+Pj4gLSAqIHZjcHUgaXMgdXJnZW50IGlm
IHZjcHUgaXMgcG9sbGluZyBldmVudCBjaGFubmVsCj4+PiAtICoKPj4+IC0gKiBpZiB1cmdlbnQg
dmNwdSBleGlzdHMsIENQVSBzaG91bGQgbm90IGVudGVyIGRlZXAgQyBzdGF0ZQo+Pj4gLSAqLwo+
Pj4gLXN0YXRpYyBpbmxpbmUgaW50IHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lkKQo+Pj4gLXsK
Pj4+IC0gICAgcmV0dXJuIGF0b21pY19yZWFkKCZ0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS51cmdl
bnRfY291bnQpOwo+Pj4gLX0KPj4KPj4gQW5kIHRoZW4sIGRlc3BpdGUgbXkgcHJldmlvdXMgYWNr
LCBJJ20gc2xpZ2h0bHkgdW5oYXBweSBhYm91dCB0aGlzCj4+IHZlcnkgc2hvcnQgZnVuY3Rpb24g
YmVjb21pbmcgYW4gb3V0LW9mLWxpbmUgb25lLCB3aGVuIHRoZSBvbmx5Cj4+IHVzZXJzIG9mIGl0
IHdvdWxkIHByZWZlcmFibHkgaGF2ZSBhcyBsb3cgbGF0ZW5jeSBhcyBwb3NzaWJsZS4gSQo+PiBk
b24ndCBzdXBwb3NlIHRoZXJlJ3MgYSB3YXkgdG8ga2VlcCBpdCBpbmxpbmUgYnV0IHN0aWxsIGRy
b3AgdGhlCj4+IHVud2FudGVkICNpbmNsdWRlIGFib3ZlPwo+IAo+IFRoZSBvbmx5IGFsdGVybmF0
aXZlcyBJIGNvdWxkIHRoaW5rIG9mIGFyZToKPiAKPiAtIFBhc3NpbmcgdGhlICJ1cmdlbnQiIGlu
ZGljYXRvciB2aWEgcGFyYW1ldGVyIHRvIGlkbGUgKHlvdSBkaWRuJ3QKPiAgICBsaWtlIHRoYXQp
Cj4gCj4gLSBNYWtlIHVyZ2VudF9jb3VudCBhIHBsYWluIHBlcmNwdSB2YXJpYWJsZQoKTmFtZWQg
c2NoZWRfdXJnZW50X2NvdW50IG9yIHNvbWUgc3VjaCwgdGhpcyBsYXR0ZXIgb3B0aW9uIGRvZXNu
J3QKbG9vayB0b28gYmFkIHRvIG1lOyBub3Qgc3VyZSB3aGF0IHRoZSBzY2hlZHVsZXIgbWFpbnRh
aW5lcnMgdGhpbmsKb2YgdGhpcywgdGhvdWdoLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
