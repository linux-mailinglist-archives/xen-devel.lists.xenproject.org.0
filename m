Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049A17BD2C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:49:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACNE-0006oM-Hu; Fri, 06 Mar 2020 12:46:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACND-0006oH-HG
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:46:39 +0000
X-Inumbo-ID: 85338974-5fa8-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85338974-5fa8-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 12:46:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6FACCAE19;
 Fri,  6 Mar 2020 12:46:37 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
Date: Fri, 6 Mar 2020 13:46:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzowNywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwNiBNYXJjaCAyMDIwIDExOjQ2Cj4+IFRvOiBwZHVycmFudEBhbXpuLmNvbQo+PiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY28udWs+OyBBbmRyZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IFJvZ2VyIFBhdQo+PiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiByZW1vdmUgcGFnZV9saXN0
IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+Pgo+PiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVy
cmFudEBhbXpuLmNvbSB3cm90ZToKPj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KPj4+Cj4+PiBUaGVyZSBkb2VzIG5vdCBzZWVtIHRvIGJlIGFueSBqdXN0aWZpY2F0
aW9uIGZvciByZWZ1c2luZyB0byBjcmVhdGUgdGhlCj4+PiBkb21haW4ncyBwMm0gdGFibGUgc2lt
cGx5IGJlY2F1c2UgaXQgbWF5IGhhdmUgYXNzaWduZWQgcGFnZXMuCj4+Cj4+IEkgdGhpbmsgdGhl
cmUgaXM6IElmIGFueSBzdWNoIGFsbG9jYXRpb24gaGFkIGhhcHBlbmVkIGJlZm9yZSwgaG93Cj4+
IHdvdWxkIGl0IGJlIHJlcHJlc2VudGVkIGluIHRoZSBkb21haW4ncyBwMm0/Cj4gCj4gSW5zZXJ0
aW9uIGludG8gdGhlIHAybSBpcyBhIHNlcGFyYXRlIGFjdGlvbiBmcm9tIHBhZ2UgYWxsb2NhdGlv
bi4gV2h5IHNob3VsZCB0aGV5IGJlIGxpbmtlZD8KClRoZXkgYXJlLCBiZWNhdXNlIG9mIGhvdyBY
RU5NRU1fcG9wdWxhdGVfcGh5c21hcCB3b3Jrcy4gWWVzLAp0aGV5IF9jb3VsZF8gYmUgc2VwYXJh
dGUgc3RlcHMsIGJ1dCB0aGF0J3Mgb25seSBhIHRoZW9yZXRpY2FsCmNvbnNpZGVyYXRpb24uCgo+
Pj4gUGFydGljdWxhcmx5Cj4+PiBpdCBwcmV2ZW50cyB0aGUgcHJpb3IgYWxsb2NhdGlvbiBvZiBQ
R0NfZXh0cmEgcGFnZXMuCj4+Cj4+IFRoYXQncyB1bmZvcnR1bmF0ZSwgYnV0IHdpbGwgbmVlZCB0
YWtpbmcgY2FyZSBvZiBkaWZmZXJlbnRseSB0aGVuOgo+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL3AybS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4+IEBAIC02OTUsMTQg
KzY5NSw2IEBAIGludCBwMm1fYWxsb2NfdGFibGUoc3RydWN0IHAybV9kb21haW4gKnAybSkKPj4+
Cj4+PiAgICAgIHAybV9sb2NrKHAybSk7Cj4+Pgo+Pj4gLSAgICBpZiAoIHAybV9pc19ob3N0cDJt
KHAybSkKPj4+IC0gICAgICAgICAmJiAhcGFnZV9saXN0X2VtcHR5KCZkLT5wYWdlX2xpc3QpICkK
Pj4+IC0gICAgewo+Pj4gLSAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxyZWFkeSBoYXMgbWVt
b3J5IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsKPj4+IC0gICAgICAgIHAybV91bmxvY2so
cDJtKTsKPj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gLSAgICB9Cj4+Cj4+IEluc3Rl
YWQgb2YgY2hlY2tpbmcgdGhlIGxpc3QgdG8gYmUgZW1wdHksIGhvdyBhYm91dCBjaGVja2luZwo+
PiBkb21haW5fdG90X3BhZ2VzKCkgdG8gcmV0dXJuIHplcm8/Cj4gCj4gSSBjb3VsZCBkbyB0aGF0
LCBhbmQgaW4gZmFjdCBteSBvcmlnaW5hbCBjb2RlIGRpZCwgYnV0IHdpdGggbW9yZQo+IGNvbnNp
ZGVyYXRpb24gdGhlIHdob2xlIHRlc3QganVzdCBkaWRuJ3QgbWFrZSBzZW5zZSB0byBtZS4gWWVz
LAo+IGNsZWFybHkgdGhlIHAybSBoYXMgdG8gYmUgdGhlcmUgYmVmb3JlIHBhZ2VzIGNhbiBiZSBh
ZGRlZCBpbnRvIGl0LAo+IGJ1dCBJIGNhbid0IHNlZSBhbnkgcmVhc29uIHdoeSB5b3UgY291bGRu
J3QgZXZlbiBhbGxvY2F0ZSB0aGUKPiBlbnRpcmUgZ3Vlc3QgUkFNLCB0aGVuIGNyZWF0ZSB0aGUg
cDJtIGFuZCB0aGVuIGFkZCB0aGUgcGFnZXMgaW50bwo+IGl0LgoKUmlnaHQgLSBtb3JlIGh5cGVy
Y2FsbHMgKFhFTk1FTV9pbmNyZWFzZV9yZXNlcnZhdGlvbiArIG9wZXJhdGlvbnMKbGlrZSBYRU5N
QVBTUEFDRV9nbWZuKSwgYW5kIGhlbmNlIHNsb3dlciBvdmVyYWxsIGRvbWFpbiBjcmVhdGlvbi4K
UGx1cyAtIFhFTk1FTV9pbmNyZWFzZV9yZXNlcnZhdGlvbiBpcyBub3QgdmVyeSB1c2VmdWwgZm9y
CnRyYW5zbGF0ZWQgZG9tYWlucywgYXMgaXQgd29uJ3QgcmV0dXJuIHRoZSBNRk5zIGFsbG9jYXRl
ZCwgYW5kCnRoZXJlJ3Mgbm8gd2F5IHRvIHNwZWNpZnkgd2hlcmUgdGhleSBzaG91bGQgYXBwZWFy
IGluIEdGTiBzcGFjZS4KSGVuY2UgaW4gcHJhY3RpY2UgSSBkb24ndCBzZWUgaG93IHRoaXMgd2hv
bGUgb3BlcmF0aW9uIGNvdWxkCndvcmsgd2l0aG91dCBYRU5NRU1fcG9wdWxhdGVfcGh5c21hcC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
