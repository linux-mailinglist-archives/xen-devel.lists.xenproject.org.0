Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AB86A73
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 21:18:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvnu2-0002dc-RG; Thu, 08 Aug 2019 19:16:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvnu1-0002dM-Hj
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 19:16:45 +0000
X-Inumbo-ID: 0eca8054-ba11-11e9-a0ad-5f8843351e86
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eca8054-ba11-11e9-a0ad-5f8843351e86;
 Thu, 08 Aug 2019 19:16:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C338214C6;
 Thu,  8 Aug 2019 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565291803;
 bh=Pol8ajq7pHVzCsR+zySnbGaiHX49WBTabQOFQC5mOXw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=g0KFVohLlzLPqCf94Jhyt16DsknDh2SZ9+2ymviJ7iYkKxxh092JYr6MKTduPwns8
 ND1ZNc/cKalItoZUrzsQErn2G7KRVJd4NNesIVR9s0j9DkY560eU6zVKWclXdj9N05
 9ipooo+mzQsWlegxtCJ6q+lgmj46vWSj1M+JucLk=
Date: Thu, 8 Aug 2019 12:16:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <2aaaecba-7f1a-969a-ca33-3efc2bf2cca9@arm.com>
Message-ID: <alpine.DEB.2.21.1908081216280.22196@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-2-git-send-email-sstabellini@kernel.org>
 <5766f31c-b89a-2353-3650-e9ec732b239b@arm.com>
 <alpine.DEB.2.10.1901031246200.800@sstabellini-ThinkPad-X260>
 <f54712e7-aad7-5f76-9a51-224b1ad2c744@arm.com>
 <alpine.DEB.2.21.1908071422210.2451@sstabellini-ThinkPad-T480s>
 <2aaaecba-7f1a-969a-ca33-3efc2bf2cca9@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/5] xen/arm: assign devices to boot domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNy8wOC8yMDE5IDIzOjQ2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
dWUsIDE1IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ID4gPiA+ID4gYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMKPiA+ID4gPiA+ID4gaW5kZXggY2M2YjQ2NC4uZDQ4Zjc3ZSAxMDA2
NDQKPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiA+ID4g
PiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gPiA+ID4gPiBAQCAtMjA5
NCw2ICsyMDk0LDg4IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21haW4oc3RydWN0
Cj4gPiA+ID4gPiA+IGRvbWFpbgo+ID4gPiA+ID4gPiAqZCwKPiA+ID4gPiA+ID4gc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbykKPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiA+
ID4gICAgIH0KPiA+ID4gPiA+ID4gICAgICtzdGF0aWMgaW50IF9faW5pdCBzY2FuX3B0X25vZGUo
Y29uc3Qgdm9pZCAqcGZkdCwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbm9kZW9mZiwgY29uc3QgY2hhciAqbmFtZSwgaW50Cj4gPiA+ID4gPiA+IGRlcHRo
LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNz
X2NlbGxzLCB1MzIgc2l6ZV9jZWxscywKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJcyBpdCByZWFsbHkg
bmVjZXNzYXJ5IHRvIHBhcnNlIHRoZSBkZXZpY2UtdHJlZSB0d2ljZT8KPiA+ID4gPiAKPiA+ID4g
PiBJIGRvbid0IHRoaW5rIEkgdW5kZXJzdGFuZCB0aGlzIGNvbW1lbnQuIFRoZSBkZXZpY2UgdHJl
ZSBmcmFnbWVudCBpcyBub3QKPiA+ID4gPiBzY2FubmVkIHR3aWNlLCBqdXN0IG9uY2UgSSB0aGlu
ay4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiA+ID4gCj4gPiA+IFRoZSBwcmV2aW91cyBwYXRj
aCBpcyBnb2luZyB0aHJvdWdoIHRoZSBEVCB0byBjb3B5IHRoZSBwcm9wZXJ0aWVzIG92ZXIuCj4g
PiA+IFRoaXMKPiA+ID4gcGF0Y2ggaW50cm9kdWNlIGEgbmV3IGZ1bmN0aW9uIHRvIGdvIG92ZXIg
dGhlIERUIHRvIGZpbmQgdGhlIERldmljZSB0bwo+ID4gPiBhdHRhY2guCj4gPiA+IFNvIHlvdSBh
cmUgcGFyc2luZyB0aGUgRFQgdHdpY2UuIElzIHRoZXJlIGFueSByZWFzb24gZm9yIHRoYXQ/Cj4g
PiAKPiA+IEkgZ290IHlvdXIgcXVlc3Rpb24gbm93LiAgSSBzcGVudCBxdWl0ZSBzb21lIHRpbWUg
dG8gbWVyZ2UgdGhlIHR3bwo+ID4gcGF0aHMsIHRoZSBmaXJzdCBvbmUgdXNlZCB0byBjb3B5IHRo
ZSBmcmFnbWVudCwgdGhlIHNlY29uZCBvbmUgdXNlZCB0bwo+ID4gcGFyc2UgaXQsIGludG8gYSBz
aW5nbGUgZnVuY3Rpb24uIEl0IGlzIGRpZmZpY3VsdCBiZWNhdXNlIHRoZQo+ID4gaW5mb3JtYXRp
b24gY29udmVuaWVudCB0byB1c2UgZm9yIG9uZSBjYXNlLCBpdCBpcyBub3QgY29udmVuaWVudCBm
b3IgdGhlCj4gPiBvdGhlciAoc3BlY2lmaWNhbGx5IGZpZ3VyaW5nIG91dCB3aGVuIHRvIGNhbGwg
ZmR0X2VuZF9ub2RlIHdoZW4gY2FsbGVkCj4gPiBmcm9tIGRldmljZV90cmVlX2Zvcl9lYWNoX25v
ZGUuKSBJIG1hbmFnZWQgdG8gZG8gaXQgdGhvdWdoLCBpbiB0aGUgbmV4dAo+ID4gdmVyc2lvbiB0
aGVyZSB3aWxsIGJlIG9ubHkgb25lIHBhcnNpbmcgb2YgdGhlIGZyYWdtZW50Lgo+IAo+IEkgd2Fz
bid0IG5lY2Vzc2FyaWx5IGFza2luZyB0byBtZXJnZSB0aGUgdHdvLiBJIHdhbnRlZCB0byB1bmRl
cnN0YW5kIHdoZXRoZXIKPiB3ZSBjYW4gYXZvaWQgdHdvIHBhcnNpbmcgeWV0IGtlZXBpbmcgdGhl
IGNvZGUgc2ltcGxlLiBTb3JyeSBpZiBpdCB3YXNuJ3QgY2xlYXIKPiBlbm91Z2guCj4gCj4gWy4u
Ll0KPiAKPiA+ID4gPiA+IEZ1cnRoZXJtb3JlLCB0aGlzIGlzIGFzc3VtaW5nIGFsbCB0aGUgbm9k
ZXMgaW4gdGhlIGZyYWdtZW50IHdpbGwgYmUKPiA+ID4gPiA+IHVuZGVyIHRoZSBHSUMgY29udHJv
bGxlci4gIFlvdSBtYXkgd2FudCB0byBwYXNzdGhyb3VnaCBhIGludGVycnVwdAo+ID4gPiA+ID4g
Y29udHJvbGxlciAoaS5lIEdQSU8pIHRvIHRoZSBndWVzdCBhbmQgdGhlIHJlbGF0ZWQgZGV2aWNl
Lgo+ID4gPiA+IAo+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGUgbm9uLUdJQyBzY2VuYXJp
byBpcyBzdXBwb3J0ZWQgdG9kYXkuIEkgZG9uJ3QKPiA+ID4gPiB0aGluayBpdCB3b3JrcyBldmVu
IHdpdGhvdXQgZG9tMGxlc3MuIEkgd3JvdGUgbW9yZSBhYm91dCB0aGlzIGFzIGEgcmVwbHkKPiA+
ID4gPiB0byB0aGUgb3RoZXIgZW1haWwuCj4gPiA+IEkgYmVsaWV2ZSB0aGlzIHdvcmtzIG91dC1v
Zi1ib3ggd2l0aCB0aGUgZ3Vlc3QuIElmIHdlIHRha2UgdGhlIGV4YW1wbGUgb2YKPiA+ID4gdGhl
Cj4gPiA+IEdQSU8gY29udHJvbGxlciwgaXQgbWF5IGJlIGJlaGluZCB0aGUgR0lDLiBZb3Ugb25s
eSBjYXJlIHRvIHJvdXRlIHRob3NlCj4gPiA+IGludGVycnVwdHMgdXNlZCBieSBHUElPIGFuZCBN
TUlPIGFzc29jaWF0ZWQuIFRoZSByZXN0IGNhbiBiZSBkZXNjcmliZQo+ID4gPiBub3JtYWxseQo+
ID4gPiBpbiB0aGUgRFQuCj4gPiA+IAo+ID4gPiBPZiBjb3Vyc2UsIHRoaXMgbWVhbnMgdGhhdCB5
b3UgbmVlZCB0byBwYXNzdGhyb3VnaCBhbGwgZGV2aWNlcyB1c2luZyB0aGUKPiA+ID4gR1BJTwo+
ID4gPiBjb250cm9sbGVyIHRvIHRoYXQgZ3Vlc3QuCj4gPiA+IAo+ID4gPiBTbyBJIHN0aWxsIHRo
aW5rIHlvdSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGludGVycnVwdHMgYmVsb25ncyB0aGUg
R0lDCj4gPiA+IG9yCj4gPiA+IG5vdC4KPiA+IAo+ID4gSSB0aGluayBJIHVuZGVyc3RhbmQgd2hh
dCB5b3UgbWVhbnQgbm93LiBJIGNvdWxkIGFkZCBhIGNoZWNrIGJlZm9yZQo+ID4gcm91dGluZyBh
bnkgaW50ZXJydXB0cyB0byB0aGUgZ3Vlc3QsIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZXkgYXJlIEdJ
Qwo+ID4gaW50ZXJydXB0cy4gSG93ZXZlciwgdGhlIHdheSB0byBkbyB0aGF0IGNoZWNrIEkgYmVs
aWV2ZSB3b3VsZCBiZSB1c2luZwo+ID4gdGhlICJpbnRlcnJ1cHQtcGFyZW50IiBwcm9wZXJ0eSwg
YnV0IHdlIGhhdmUganVzdCBkaXNjdXNzZWQgYWJvdXQKPiA+IHJlbW92aW5nIGl0Lgo+IAo+IEkg
aGF2ZSBzdWdnZXN0ZWQgYSB3YXkgdG8ga2VlcCBpdCBhbmQgYXZvaWQgd3JpdGluZyBkb3duIHRo
ZSBwaGFuZGxlIHZhbHVlLgo+IAo+ID4gCj4gPiBTbywgaWYgdGhlIHVzZXIgcHJvdmlkZXMgYSBm
cmFnbWVudCB0aGF0IGRvZXNuJ3QgaGF2ZSBhbnkKPiA+ICJpbnRlcnJ1cHQtcGFyZW50IiBwcm9w
ZXJ0aWVzLCBob3cgY2FuIEkgY2hlY2sgdGhhdCB0aGUgaW50ZXJydXB0cyBhcmUKPiA+IEdJQyBp
bnRlcnJ1cHRzPwo+IAo+IFRoZSBwcm9ibGVtIGhlcmUgaXMgeW91IGFyZSByZS11c2luZyB0aGUg
Z3Vlc3QgImludGVycnVwdHMiIHByb3BlcnR5IGZvcgo+IGZpbmRpbmcgb3V0IHRoZSBob3N0IGlu
dGVycnVwdHMuIEZpcnN0bHksIHRoaXMgZG9lcyBub3QgY2F0ZXIgdGhlIGNhc2Ugd2hlcmUKPiBn
dWVzdCBEVCBpcyB1c2luZyB0aGUgcHJvcGVydHkgImludGVycnVwdC1leHRlbmRlZCIuCj4gCj4g
SXQgZmVlbHMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgbG9vayBhdCB0aGUgImludGVycnVwdHMiIHBy
b3BlcnR5IGZyb20gdGhlIGhvc3QKPiBEVCBhbmQgbWFwIHRoZW0gMToxIChpLmUgaXJxID09IHZp
cnEpLiBUaGUgcHJvcGVydHkgaW4gdGhlIHBhcnRpYWwgRFQgd291bGQKPiBqdXN0IGJlIHJlcGxp
Y2F0aW5nIHRoZSB2YWx1ZXMgZnJvbSB0aGUgaG9zdCBEVC4KClllcywgdGhhdCB3b3JrcywgZ29v
ZCBzdWdnZXN0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
