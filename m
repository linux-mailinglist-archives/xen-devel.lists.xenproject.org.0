Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B47187427
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 21:38:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDwSM-0004ch-8a; Mon, 16 Mar 2020 20:35:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A+cT=5B=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1jDwSK-0004cc-Jt
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 20:35:24 +0000
X-Inumbo-ID: a9736bc2-67c5-11ea-bec1-bc764e2007e4
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a9736bc2-67c5-11ea-bec1-bc764e2007e4;
 Mon, 16 Mar 2020 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584390923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rNP0mmhYO3ZkBwa0TVYh9YRT8v7S/Igc0A+3yqdKcRw=;
 b=WU6JWP3b8bwbT2ydavzD6zFrGl9cqES7CH1EkKRNvZArIkKG4805c+5bJW6tc7tsg/Ag/f
 1bTtVwUdiAG/W62q4zasbl6OeTRWobVUufNvZ2EmtDLsh7p0uzSeUTSwwtRvZywjI6cNwq
 t9NG/rF0HuTjEgCX0ov6ZrE91khyyvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-yXlxTpiMOSaQPrYogFg8ag-1; Mon, 16 Mar 2020 16:35:21 -0400
X-MC-Unique: yXlxTpiMOSaQPrYogFg8ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39A0918AB2C0;
 Mon, 16 Mar 2020 20:35:19 +0000 (UTC)
Received: from treble (ovpn-121-192.rdu2.redhat.com [10.10.121.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 852049CA3;
 Mon, 16 Mar 2020 20:35:16 +0000 (UTC)
Date: Mon, 16 Mar 2020 15:35:14 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
Message-ID: <20200316203514.qm7so7b55jbmskgg@treble>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-3-mbenes@suse.cz>
 <75224ad1-f160-802a-9d72-b092ba864fb7@suse.com>
 <alpine.LSU.2.21.2003131048110.30076@pobox.suse.cz>
 <alpine.LSU.2.21.2003161642450.15518@pobox.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2003161642450.15518@pobox.suse.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/xen: Make the secondary CPU
 idle tasks reliable
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, sstabellini@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, jslaby@suse.cz, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDQ6NTE6MTJQTSArMDEwMCwgTWlyb3NsYXYgQmVuZXMg
d3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3NtcF9wdi5jIGIvYXJjaC94ODYv
eGVuL3NtcF9wdi5jCj4gPiBpbmRleCA2Yjg4Y2RjYmVmOGYuLjM5YWZkODgzMDljYiAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gveDg2L3hlbi9zbXBfcHYuYwo+ID4gKysrIGIvYXJjaC94ODYveGVuL3Nt
cF9wdi5jCj4gPiBAQCAtOTIsNiArOTIsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIGNw
dV9icmluZ3VwX2FuZF9pZGxlKHZvaWQpCj4gPiAgewo+ID4gICAgICAgICBjcHVfYnJpbmd1cCgp
Owo+ID4gICAgICAgICBib290X2luaXRfc3RhY2tfY2FuYXJ5KCk7Cj4gPiArICAgICAgIGFzbSB2
b2xhdGlsZSAoVU5XSU5EX0hJTlQoT1JDX1JFR19VTkRFRklORUQsIDAsIE9SQ19UWVBFX0NBTEws
IDEpKTsKPiA+ICAgICAgICAgY3B1X3N0YXJ0dXBfZW50cnkoQ1BVSFBfQVBfT05MSU5FX0lETEUp
Owo+ID4gIH0KPiA+IAo+ID4gYW5kIHRoYXQgc2VlbXMgdG8gd29yay4gSSBuZWVkIHRvIHByb3Bl
cmx5IHZlcmlmeSBhbmQgdGVzdCwgYnV0IHRoZSAKPiA+IGV4cGxhbmF0aW9uIGlzIHRoYXQgYXMg
b3Bwb3NlZCB0byB0aGUgYWJvdmUsIGNwdV9zdGFydHVwX2VudHJ5KCkgaXMgb24gdGhlIAo+ID4g
aWRsZSB0YXNrJ3Mgc3RhY2sgYW5kIHRoZSBoaW50IGlzIHRoZW4gdGFrZW4gaW50byBhY2NvdW50
LiBUaGUgdW53b3VuZCAKPiA+IHN0YWNrIHNlZW1zIHRvIGJlIGNvbXBsZXRlLCBzbyBpdCBjb3Vs
ZCBpbmRlZWQgYmUgdGhlIGZpeC4KPiAKPiBOb3QgdGhlIGNvcnJlY3Qgb25lIHRob3VnaC4gT2Jq
dG9vbCByaWdodGZ1bGx5IGNvbXBsYWlucyB3aXRoCj4gCj4gYXJjaC94ODYveGVuL3NtcF9wdi5v
OiB3YXJuaW5nOiBvYmp0b29sOiBjcHVfYnJpbmd1cF9hbmRfaWRsZSgpKzB4NmE6IHVuZGVmaW5l
ZCBzdGFjayBzdGF0ZQo+IAo+IGFuZCBhbGwgdGhlIG90aGVyIGhhY2tzIEkgdHJpZWQgZW5kZWQg
dXAgaW4gdGhlIHNhbWUgZGVhZCBhbGxleS4gSXQgc2VlbXMgCj4gdG8gbWUgdGhlIGNvcnJlY3Qg
Zml4IGlzIHRoYXQgYWxsIG9yYyBlbnRyaWVzIGZvciBjcHVfYnJpbmd1cF9hbmRfaWRsZSgpIAo+
IHNob3VsZCBoYXZlICJlbmQiIHByb3BlcnR5IHNldCB0byAxLCBzaW5jZSBpdCBpcyB0aGUgZmly
c3QgZnVuY3Rpb24gb24gdGhlIAo+IHN0YWNrLiBJIGRvbid0IGtub3cgaG93IHRvIGFjaGlldmUg
dGhhdCB3aXRob3V0IHRoZSBhc3NlbWJseSBoYWNrIGluIHRoZSAKPiBwYXRjaCBJIHNlbnQuIElm
IEkgYW0gbm90IG1pc3Npbmcgc29tZXRoaW5nLCBvZiBjb3Vyc2UuCj4gCj4gSm9zaCwgYW55IGlk
ZWE/CgpZZWFoLCBJIHRoaW5rIG11Y2tpbmcgd2l0aCB0aGUgdW53aW5kIGhpbnRzIGluIEMgY29k
ZSBpcyBnb2luZyB0byBiZQpwcmVjYXJpb3VzLiAgWW91IGNvdWxkIG1heWJlIGhhdmUgc29tZXRo
aW5nIGxpa2UKCglhc20oIgoJICBVTldJTkRfSElOVF9FTVBUWVxuCgkgIG1vdiAkQ1BVSFBfQVBf
T05MSU5FX0lETEUsICVyZGlcbgoJICBjYWxsIGNwdV9zdGFydHVwX2VudHJ5XG4KCSkiCgl1bnJl
YWNoYWJsZSgpOwoKYnV0IHRoYXQncyBwcmV0dHkgdWdseSAoYW5kIGl0IG1pZ2h0IG5vdCB3b3Jr
IGFueXdheSkuCgpJIHN1cHBvc2Ugd2UgY291bGQgYWRkIGEgbmV3IGZhY2lsaXR5IHRvIG1hcmsg
YW4gZW50aXJlIEMgZnVuY3Rpb24gYXMgYW4KImVuZCIgcG9pbnQuCgpCdXQgSSB0aGluayBpdCB3
b3VsZCBiZSBjbGVhbmVzdCB0byBqdXN0IGRvIHNvbWV0aGluZyBsaWtlIHlvdXIgcGF0Y2gKYW5k
IGhhdmUgdGhlIGVudHJ5IGNvZGUgYmUgYXNtIHdoaWNoIHRoZW4gY2FsbHMgY3B1X2JyaW5ndXBf
YW5kX2lkbGUoKS4KVGhhdCB3b3VsZCBtYWtlIGl0IGNvbnNpc3RlbnQgd2l0aCBhbGwgb3RoZXIg
ZW50cnkgY29kZSwgd2hpY2ggYWxsIGxpdmVzCmluIGFzbS4KCi0tIApKb3NoCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
