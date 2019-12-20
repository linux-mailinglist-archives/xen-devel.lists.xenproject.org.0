Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E54127202
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 01:05:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii5jR-0006hV-MK; Fri, 20 Dec 2019 00:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fqJK=2K=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ii5jQ-0006hQ-29
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 00:01:24 +0000
X-Inumbo-ID: dbeec5aa-22bb-11ea-b6f1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbeec5aa-22bb-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 00:01:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99CCF222C2;
 Fri, 20 Dec 2019 00:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576800082;
 bh=ut4Fx/EkU705A+fhgrdQgovE3b63GqhcbGN8bflyYDg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Gz2Xe6M3MAFXKOlRP0UXzgwbs6mGbIyWDPKsS9YxIBwamOgbrzc3n3OReosLFY0N0
 lPxvQWyD5tYQMVasRL1SgZsU2nyTWzW3l6MxTV0sVa2DgbutJvuH4JRy7qEWiRzsO6
 mrLh7usntf1DmIo5Z/c+X2nE4XNMcHlOCs3JJnl0=
Date: Thu, 19 Dec 2019 16:01:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
Message-ID: <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
 <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
 <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBEZWMgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBJbiBmYWN0IG1v
c3Qgb2YgcGVvcGxlIG9uIEFybSBhcmUgdXNpbmcgR1JVQiByYXRoZXIgdGhhbiBFRkkgZGlyZWN0
bHkgYXMKPiA+ID4gdGhpcyBpcyBtb3JlIGZyaWVuZGx5IHRvIHVzZS4KPiA+ID4gCj4gPiA+IFJl
Z2FyZGluZyB0aGUgZGV2aWNldHJlZSwgWGVuIGFuZCBMaW51eCB3aWxsIGNvbXBsZXRlbHkgaWdu
b3JlIHRoZQo+ID4gPiBtZW1vcnkgbm9kZXMgaW4gWGVuIGlmIHVzaW5nIEVGSS4gVGhpcyBiZWNh
dXNlIHRoZSBFRkkgbWVtb3J5IG1hcCB3aWxsCj4gPiA+IGdpdmUgeW91IGFuIG92ZXJ2aWV3IG9m
IHRoZSBwbGF0Zm9ybSB3aXRoIHRoZSBFRkkgcmVnaW9ucyBpbmNsdWRlZC4KPiA+IAo+ID4gQWhh
ISBTbyBpbiB0aGF0IHNlbnNlIGl0IGlzIGEgYnVnIGluIFhlbiBhZnRlciBhbGwsIHJpZ2h0PyAo
dGhhdCdzIHdoYXQKPiA+IHlvdSdyZQo+ID4gcmVmZXJyaW5nIHRvIHdoZW4geW91IHNheSB5b3Ug
bm93IHVuZGVyc3RhbmQgd2hhdCBuZWVkcyB0byBnZXQgZml4ZWQpLgo+IAo+IFllcy4gVGhlIEVG
SSBtZW1vcnkgbWFwIGlzIGEgbGlzdCBvZiBleGlzdGluZyBtZW1vcnkgd2l0aCBhIHR5cGUgYXNz
b2NpYXRlZCB0bwo+IGl0IChDb252ZW50aW9uYWwsIEJvb3RTZXJ2aWNlQ29kZXMsIE1lbW9yeU1h
cHBlZElPLi4uKS4KPiAKPiBUaGUgT1MvSHlwZXJ2aXNvciB3aWxsIGhhdmUgdG8gZ28gdGhyb3Vn
aCB0aGVtIGFuZCBjaGVjayB3aGljaCByZWdpb25zIGFyZQo+IHVzdWFibGUuIENvbXBhcmUgdG8g
TGludXgsIFhlbiBoYXMgbGltaXRlZCBpdHNlbGYgdG8gb25seSBhIGZldyB0eXBlcy4KPiAKPiBI
b3dldmVyLCBJIHRoaW5rIHdlIGNhbiBiZSBvbiBhIHBhciB3aXRoIExpbnV4IGhlcmUuCgpJIGdh
dmUgYSBsb29rIGF0IHRoZSBMaW51eCBpbXBsZW1lbnRhdGlvbiwgdGhlIGludGVyZXN0aW5nIGJp
dCBpcwpkcml2ZXJzL2Zpcm13YXJlL2VmaS9hcm0taW5pdC5jOmlzX3VzYWJsZV9tZW1vcnkgYXMg
ZmFyIGFzIEkgY2FuIHRlbGwuCkkgYWxzbyBnYXZlIGEgbG9vayBhdCB0aGUgWGVuIHNpZGUsIHdo
aWNoIGlzCnhlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaDplZmlfcHJvY2Vzc19tZW1vcnlfbWFw
X2Jvb3RpbmZvLiBBcyBndWVzc2VkLAp0aGUgdHdvIGFyZSBub3QgcXVpdGUgdGhlIHNhbWUuCgpP
bmUgb2YgdGhlIG1haW4gZGlmZmVyZW5jZXMgaXMgdGhhdCBMaW51eCB1c2VzIGFzICJTeXN0ZW0g
UkFNIiBldmVuCnJlZ2lvbnMgdGhhdCB3ZXJlIG1hcmtlZCBhcyBFRklfQk9PVF9TRVJWSUNFU19D
T0RFL0RBVEEgYW5kCkVGSV9MT0FERVJfQ09ERS9EQVRBIGJlY2F1c2UgdGhleSB3aWxsIGdldCBm
cmVlZCBhbnl3YXkuIFhlbiBkb2Vzbid0CmRvIHRoYXQgdW5sZXNzIG1hcF9icyBpcyBzZXQuCgpJ
IHdyb3RlIGEgcXVpY2sgcGF0Y2ggdG8gaW1wbGVtZW50IHRoZSBMaW51eCBiZWhhdmlvciBvbiBY
ZW4sIG9ubHkKbGlnaHRseSB0ZXN0ZWQuIEkgY2FuIGNvbmZpcm0gdGhhdCBJIHNlZSBtb3JlIG1l
bW9yeSB0aGlzIHdheS4gSG93ZXZlciwKSSBhbSBub3Qgc3VyZSB3ZSBhY3R1YWxseSB3YW50IHRv
IGltcG9ydCB0aGUgTGludXggYmVoYXZpb3Igd2hvbGVzYWxlLgoKQW55d2F5LCBSb21hbiwgY291
bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIHBhdGNoIHNvbHZlcyB0aGUKaXNzdWU/
CgoKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC9h
cm0vZWZpL2VmaS1ib290LmgKaW5kZXggY2E2NTVmZjAwMy4uYWQxOGZmMzY2OSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZp
LWJvb3QuaApAQCAtMTQ5LDEwICsxNDksMTQgQEAgc3RhdGljIEVGSV9TVEFUVVMgX19pbml0IGVm
aV9wcm9jZXNzX21lbW9yeV9tYXBfYm9vdGluZm8oRUZJX01FTU9SWV9ERVNDUklQVE9SICoKIAog
ICAgIGZvciAoIEluZGV4ID0gMDsgSW5kZXggPCAobW1hcF9zaXplIC8gZGVzY19zaXplKTsgSW5k
ZXgrKyApCiAgICAgewotICAgICAgICBpZiAoIGRlc2NfcHRyLT5UeXBlID09IEVmaUNvbnZlbnRp
b25hbE1lbW9yeSB8fAotICAgICAgICAgICAgICghbWFwX2JzICYmCi0gICAgICAgICAgICAgIChk
ZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNDb2RlIHx8Ci0gICAgICAgICAgICAgICBk
ZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRhKSkgKQorICAgICAgICBpZiAoIGRl
c2NfcHRyLT5BdHRyaWJ1dGUgPT0gRUZJX01FTU9SWV9XQiAmJgorICAgICAgICAgICAgIChkZXNj
X3B0ci0+VHlwZSA9PSBFZmlDb252ZW50aW9uYWxNZW1vcnkgfHwKKyAgICAgICAgICAgICAgZGVz
Y19wdHItPlR5cGUgPT0gRWZpTG9hZGVyQ29kZSB8fAorICAgICAgICAgICAgICBkZXNjX3B0ci0+
VHlwZSA9PSBFZmlMb2FkZXJEYXRhIHx8CisgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09
IEVmaUFDUElSZWNsYWltTWVtb3J5IHx8CisgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09
IEVmaVBlcnNpc3RlbnRNZW1vcnkgfHwKKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0g
RWZpQm9vdFNlcnZpY2VzQ29kZSB8fAorICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBF
ZmlCb290U2VydmljZXNEYXRhKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggIW1lbWlu
Zm9fYWRkX2JhbmsoJmJvb3RpbmZvLm1lbSwgZGVzY19wdHIpICkKICAgICAgICAgICAgIHsKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2VmaS9lZmlkZWYuaCBiL3hlbi9pbmNsdWRlL2VmaS9lZmlk
ZWYuaAppbmRleCA4NmE3ZTExMWJmLi5mNDYyMDc4NDBmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9lZmkvZWZpZGVmLmgKKysrIGIveGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oCkBAIC0xNDcsNiAr
MTQ3LDcgQEAgdHlwZWRlZiBlbnVtIHsKICAgICBFZmlNZW1vcnlNYXBwZWRJTywKICAgICBFZmlN
ZW1vcnlNYXBwZWRJT1BvcnRTcGFjZSwKICAgICBFZmlQYWxDb2RlLAorICAgIEVmaVBlcnNpc3Rl
bnRNZW1vcnksCiAgICAgRWZpTWF4TWVtb3J5VHlwZQogfSBFRklfTUVNT1JZX1RZUEU7CiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
