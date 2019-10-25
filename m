Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD8E4AB9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:06:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNyJK-00041u-Ax; Fri, 25 Oct 2019 12:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNyJI-00041p-T6
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:03:16 +0000
X-Inumbo-ID: 6c9f7d88-f71f-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c9f7d88-f71f-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 12:03:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7099CAEF3;
 Fri, 25 Oct 2019 12:03:14 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
Date: Fri, 25 Oct 2019 14:03:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBldmFsdWF0ZV9ub3Nw
ZWMoKSBpcyBpbmNyZWRpYmx5IGZyYWdpbGUsIGFuZCB0aGlzIGlzIG9uZSBnaWFudCBib2RnZS4K
PiAKPiBUbyBjb3JyZWN0bHkgcHJvdGVjdCBqdW1wcywgdGhlIGdlbmVyYXRlZCBjb2RlIG5lZWRz
IHRvIGJlIG9mIHRoZSBmb3JtOgo+IAo+ICAgICBjbXAvdGVzdCA8Y29uZD4KPiAgICAgamNjIDFm
Cj4gICAgIGxmZW5jZQo+ICAgICAuLi4KPiAgMTogbGZlbmNlCj4gICAgIC4uLgo+IAo+IENyaXRp
Y2FsbHksIHRoZSBsZmVuY2UgbXVzdCBiZSBhdCB0aGUgaGVhZCBvZiBib3RoIGJhc2ljIGJsb2Nr
cywgbGF0ZXIgaW4gdGhlCj4gaW5zdHJ1Y3Rpb24gc3RyZWFtIHRoYW4gdGhlIGNvbmRpdGlvbmFs
IGp1bXAgaW4gbmVlZCBvZiBwcm90ZWN0aW9uLgo+IAo+IFdoZW4gYSBzdGF0aWMgaW5saW5lIGlz
IGludm9sdmVkLCB0aGUgb3B0aW1pc2VyIGRlY2lkZXMgdG8gYmUgY2xldmVyIGFuZAo+IHJlYXJy
YW5nZXMgdGhlIGNvZGUgYXM6Cj4gCj4gIHByZWQ6Cj4gICAgIGxmZW5jZQo+ICAgICA8Y2FsY3Vs
YXRlIGNvbmQ+Cj4gICAgIHJldAo+IAo+ICAgICBjYWxsIHByZWQKPiAgICAgY21wICQwLCAlZWF4
Cj4gICAgIGpjYyAxZgo+ICAgICAuLi4KPiAgMTogLi4uCj4gCj4gd2hpY2ggYnJlYWtzIHRoZSBz
cGVjdWxhdGl2ZSBzYWZldHkuCgpBaXVpICJwcmVkIiBpcyBhIG5vbi1pbmxpbmVkIHN0YXRpYyBp
bmxpbmUgaGVyZS4gVGhlcmUncyBubyAib3B0aW1pc2VyIGRlY2lkZXMKdG8gYmUgY2xldmVyIiBp
biB0aGlzIGNhc2UgaW1vIC0gaXQgYWxsIGlzIGEgcmVzdWx0IG9mIG5vdCBpbmxpbmluZywgd2hl
biB0aGUKY29uc3RydWN0IGluIGV2YWx1YXRlX25vc3BlYygpIGlzIHNwZWNpZmljYWxseSBhc3N1
bWluZyB0aGlzIHdvdWxkbid0IGhhcHBlbi4KVGhlcmVmb3JlIEkgY29udGludWUgdG8gdGhpbmsg
dGhhdCB0aGUgZGVzY3JpcHRpb24gaXMgbWlzbGVhZGluZy4KCj4gQW55IHVzZSBvZiBldmFsdWF0
ZV9ub3NwZWMoKSBuZWVkcyBhbGwgc3RhdGljIGlubGluZSBwcmVkaWNhdGVzIHdoaWNoIHVzZSBp
dAo+IHRvIGJlIGRlY2xhcmVkIGFsd2F5c19pbmxpbmUgdG8gcHJldmVudCB0aGUgb3B0aW1pc2Vy
IGhhdmluZyB0aGUgZmxleGliaWxpdHkKPiB0byBnZW5lcmF0ZSB1bnNhZmUgY29kZS4KCkkgYWdy
ZWUgd2l0aCB0aGlzIHBhcnQuCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5E
dW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJp
eC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENDOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ0M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBUaGlzIGlzIHRoZSB0cmFuc2l0aXZlIHNldCBvZiBw
cmVkaWNhdGVzIHdoaWNoIEkgY2FuIHNwb3Qgd2hpY2ggbmVlZAo+IHByb3RlY3RpbmcuICBUaGVy
ZSBhcmUgcHJvYmFibHkgb25lcyBJJ3ZlIG1pc3NlZC4gIFBlcnNvbmFsbHksIEknbSAtMSBmb3Ig
dGhpcwo+IGFwcHJvYWNoLCBidXQgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGZvciA0LjEzIGlzIHRv
IHJldmVydCBpdCBhbGwgdG8gdW5icmVhawo+IGxpdmVwYXRjaGluZy4KClRvIHVuYnJlYWsgbGl2
ZXBhdGNoaW5nLCBhaXVpIHdoYXQgeW91IG5lZWQgaXMgc3ltYm9sIGRpc2FtYmlndWF0aW9uLAph
IHBhdGNoIGZvciB3aGljaCBoYXMgYmVlbiBzZW50LiBXaXRoIHRoaXMgSSB0aGluayB3ZSBzaG91
bGQgZm9jdXMgb24KY29kZSBnZW5lcmF0aW9uIGFzcGVjdHMgaGVyZS4gSSdtIGZpbmUgYWNrLWlu
ZyB0aGUgY29kZSBjaGFuZ2VzIHdpdGgKYSBtb2RpZmllZCBkZXNjcmlwdGlvbi4gQnV0IHNpbmNl
IHlvdSdyZSAtMSBmb3IgdGhpcywgSSdtIG5vdCBzdXJlIGluCnRoZSBmaXJzdCBwbGFjZSB0aGF0
IHdlIHdhbnQgdG8gZ28gdGhpcyByb3V0ZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
