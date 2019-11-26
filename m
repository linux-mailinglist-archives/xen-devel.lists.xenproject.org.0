Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C710A70D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 00:19:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZk4W-0008QQ-Nf; Tue, 26 Nov 2019 23:16:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZk4U-0008QD-VO
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 23:16:38 +0000
X-Inumbo-ID: cbf9cf6c-10a2-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbf9cf6c-10a2-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 23:16:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A01102068E;
 Tue, 26 Nov 2019 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574810197;
 bh=bRPZhmwnTfOHJinTgjV8oSSrVJ2BB2bx1K1fceb4oP4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=R7Bfuh1b4iMNafln4hKJrr7/TZP/J/PJNrAbELsScVy8bj0SdZRlIqeXJqhkkhVe6
 kD+TboOni+mN1VPBPgruVsNxUrFEJgUcDw01IKLxIGeETWnSlonUfogyocf0Sht/t0
 978/3gX6j2JqK/rxghBYtXXRrnlyaYJLoG52iebw=
Date: Tue, 26 Nov 2019 15:16:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
In-Reply-To: <20191115201037.44982-4-stewart.hildebrand@dornerworks.com>
Message-ID: <alpine.DEB.2.21.1911261440500.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-4-stewart.hildebrand@dornerworks.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC XEN PATCH v3 08/11] xen: arm: vgic: don't fail
 if IRQ is already connected
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNSBOb3YgMjAxOSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IFRoZXJlIGFy
ZSBzb21lIElSUXMgdGhhdCBoYXBwZW4gdG8gaGF2ZSBtdWx0aXBsZSAiaW50ZXJydXB0cyA9IDwg
Li4uID47Igo+IHByb3BlcnRpZXMgd2l0aCB0aGUgc2FtZSBJUlEgaW4gdGhlIGRldmljZSB0cmVl
LiBGb3IgZXhhbXBsZToKPiAKPiBpbnRlcnJ1cHRzID0gPDAgMTIzIDQ+LAo+ICAgICAgICAgICAg
ICA8MCAxMjMgND4sCj4gICAgICAgICAgICAgIDwwIDEyMyA0PiwKPiAgICAgICAgICAgICAgPDAg
MTIzIDQ+LAo+ICAgICAgICAgICAgICA8MCAxMjMgND47Cj4gCj4gSW4gdGhpcyBjYXNlIGl0IHNl
ZW1zIHRoYXQgd2UgYXJlIGludm9raW5nIHZnaWNfY29ubmVjdF9od19pcnEgbXVsdGlwbGUKPiB0
aW1lcyBmb3IgdGhlIHNhbWUgSVJRLgo+IAo+IFJld29yayB0aGUgY2hlY2tzIHRvIGFsbG93IGJv
b3RpbmcgaW4gdGhpcyBzY2VuYXJpby4KPiAKPiBJIGhhdmUgbm90IHNlZW4gYW55IGNhc2VzIHdo
ZXJlIHRoZSBwcmUtZXhpc3RpbmcgcC0+ZGVzYyBpcyBhbnkgZGlmZmVyZW50IGZyb20KPiB0aGUg
bmV3IGRlc2MsIHNvIEJVRygpIG91dCBpZiB0aGV5J3JlIGRpZmZlcmVudCBmb3Igbm93Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRv
cm5lcndvcmtzLmNvbT4KPiAKPiAtLS0KPiB2MzogbmV3IHBhdGNoCj4gCj4gSSB0ZXN0ZWQgb24g
WGlsaW54IFp5bnEgVWx0cmFTY2FsZSsgd2l0aCB0aGUgb2xkIHZHSUMuIEkgaGF2ZSBub3QgZnVs
bHkKPiB0ZXN0ZWQgd2l0aCBDT05GSUdfTkVXX1ZHSUMuIFRoaXMgaGFjayBvbmx5IGJlY2FtZSBu
ZWNlc3NhcnkgYWZ0ZXIKPiBpbnRyb2R1Y2luZyB0aGUgUFBJIHNlcmllcywgYW5kIEknbSBub3Qg
ZW50aXJlbHkgc3VyZSB3aGF0IHRoZSByZWFzb24KPiBpcyBmb3IgdGhhdC4KCkkgdGhpbmsgdGhl
IHJlYXNvbiBpcyBhY3R1YWxseSB2ZXJ5IHNpbXBsZTogd2l0aCB0aGUgcHJldmlvdXMgY29kZSBp
Zgp0aGUgaXJxIHdhcyBhbHJlYWR5IHNldHVwIGFuZCB0aGUgZGV0YWlscyBtYXRjaGVkIGl0IHdv
dWxkICJnb3RvIG91dCIKYWxsIHRoZSB3YXkgb3V0IG9mIHJvdXRlX2lycV90b19ndWVzdC4KCk5v
dyB3aXRoIHRoZSBuZXcgY29kZSwgaXQgd291bGQgImdvdG8gb3V0IiBvZiBzZXR1cF9ndWVzdF9p
cnEgcmV0dXJuaW5nCnplcm8sIHdoaWNoIG1lYW5zIHRoYXQgZ2ljX3JvdXRlX2lycV90b19ndWVz
dCBpcyBhY3R1YWxseSBnb2luZyB0byBiZQpjYWxsZWQgYW55d2F5LCB3aGljaCBpcyBhIG1pc3Rh
a2UuIEkgdGhpbmsgd2Ugd2FudCB0byBhdm9pZCB0aGF0IGJ5CnJldHVybmluZyBhbiBhcHByb3By
aWF0ZSBlcnJvciBjb25kaXRpb24gZnJvbSBzZXR1cF9ndWVzdF9pcnEgc28gdGhhdCB3ZQphbHNv
IHJldHVybiBlYXJseSBmcm9tIHJvdXRlX2lycV90b19ndWVzdC4KCgo+IEknbSBhbHNvIHVuc3Vy
ZSBpZiBCVUcoKWluZyBvdXQgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGluIGNhc2Ugb2YKPiBk
ZXNjICE9IHAtPmRlc2MsIG9yIHdoYXQgY29uZGl0aW9ucyB3b3VsZCBldmVuIHRyaWdnZXIgdGhp
cz8gSXMgdGhpcwo+IGZ1bmN0aW9uIGV4cG9zZWQgdG8gZ3Vlc3RzPwoKSSB0aGluayB0aGUgb3Jp
Z2luYWwgY29kZSBwcmludGVkIGEgd2FybmluZyBhbmQgcmV0dXJuZWQgYW4gZXJyb3IuClRoYXQn
cyBwcm9iYWJseSBzdGlsbCB3aGF0IHdlIHdhbnQuCgoKCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9n
aWMtdmdpYy5jICB8IDkgKysrKysrKy0tCj4gIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDQg
KysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jIGIveGVuL2FyY2gvYXJt
L2dpYy12Z2ljLmMKPiBpbmRleCAyYzY2YThmYTkyLi41YzE2ZTY2YjMyIDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMK
PiBAQCAtNDYwLDkgKzQ2MCwxNCBAQCBpbnQgdmdpY19jb25uZWN0X2h3X2lycShzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHZpcnEsCj4gICAgICBpZiAoIGNv
bm5lY3QgKQo+ICAgICAgewo+ICAgICAgICAgIC8qIFRoZSBWSVJRIHNob3VsZCBub3QgYmUgYWxy
ZWFkeSBlbmFibGVkIGJ5IHRoZSBndWVzdCAqLwo+IC0gICAgICAgIGlmICggIXAtPmRlc2MgJiYK
PiAtICAgICAgICAgICAgICF0ZXN0X2JpdChHSUNfSVJRX0dVRVNUX0VOQUJMRUQsICZwLT5zdGF0
dXMpICkKPiArICAgICAgICBpZiAoICF0ZXN0X2JpdChHSUNfSVJRX0dVRVNUX0VOQUJMRUQsICZw
LT5zdGF0dXMpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGlmIChwLT5kZXNjICYmIHAt
PmRlc2MgIT0gZGVzYykKCkNvZGUgc3R5bGUKCgo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAg
ICAgICAgICBCVUcoKTsKPiArICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICBwLT5kZXNjID0g
ZGVzYzsKPiArICAgICAgICB9Cj4gICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICByZXQgPSAt
RUJVU1k7Cj4gICAgICB9Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyBi
L3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwo+IGluZGV4IGYwZjJlYTUwMjEuLmFhNzc1Zjc2Njgg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gKysrIGIveGVuL2FyY2gv
YXJtL3ZnaWMvdmdpYy5jCj4gQEAgLTg4Miw2ICs4ODIsMTAgQEAgaW50IHZnaWNfY29ubmVjdF9o
d19pcnEoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnZjcHUsCj4gICAgICAgICAgICAg
IGlycS0+aHcgPSB0cnVlOwo+ICAgICAgICAgICAgICBpcnEtPmh3aW50aWQgPSBkZXNjLT5pcnE7
Cj4gICAgICAgICAgfQo+ICsgICAgICAgIGVsc2UgaWYgKCBpcnEtPmh3ICYmICFpcnEtPmVuYWJs
ZWQgJiYgaXJxLT5od2ludGlkID09IGRlc2MtPmlycSApCj4gKyAgICAgICAgewo+ICsgICAgICAg
ICAgICAvKiBUaGUgSVJRIHdhcyBhbHJlYWR5IGNvbm5lY3RlZC4gTm8gYWN0aW9uIGlzIG5lY2Vz
c2FyeS4gKi8KPiArICAgICAgICB9Cj4gICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICByZXQg
PSAtRUJVU1k7Cj4gICAgICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
