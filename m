Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D61843A3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:29:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCga1-0002Zm-Tk; Fri, 13 Mar 2020 09:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72WQ=46=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jCga0-0002ZX-Tk
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:26:08 +0000
X-Inumbo-ID: ab6c0a4e-650c-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab6c0a4e-650c-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 09:26:08 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h5so11069607edn.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=lx0o4VlhVdwHcZX09YPBqT/7bA+Izl9/yPKPXU0qsbo=;
 b=fK0fSb3o9uNPw3Lx7v2SnulMhVOtTkZB+GGswysjjLhn8K07GkhoJ+TnoI+AUHxCqB
 R6Z64CvsXTnoZjoImdt3N2xbTPVlpjAQwQhFHlqWRKtqkcZSsX6XSad4lTnwG4ZonDMe
 BWBBTeJv6vVKwhzPXwSQIJHlhyYAYulk71h3il36eFpPNcnwX4wE08OxNS/6tJ9ZUfTC
 CJa05m1n35E4+gsVrAc32XwlMLTKn87A4+VNoZstcMyy/vIKSSNiykuUB6zrJqXWuwSv
 7gSqr/WqgCss4IPOy9xS6pt8+nxA0VAzjEp0nPdslsTp+gNtUyxrmAjGEonYTOw0r9DF
 XCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=lx0o4VlhVdwHcZX09YPBqT/7bA+Izl9/yPKPXU0qsbo=;
 b=YPU8UzhvjqpIkIoJnoNU4Pk2nxjMcHSLY5or5BUYJ9LCuKe5SBz6knmFTc9j3d07OU
 oeTuVoQwIRR1uwhXth4PhklWNJU9SKw11urtz6CorIdGQd4Fqm6Exbmp056xvbVgZWT0
 Gzvqbv+vtf+Qv6qqm5XLhN0HMZJZ9BtVR+Wm1XINdIBtGeKY4RMVOqu5gXINFCiO/eAb
 RFSTHeoSeZMEedyjWeXPVpz9xaVNSWz+dFii8tx0SpoT96N6vlxzYVu+6TXB6lHY/3s7
 Zh9HTVcHMu3+QmHh+mXbeeHt6fEd6oFf1hxSqcSwSdhsXRd+oX4NGq8KDmIUxYtG3FO1
 v6YA==
X-Gm-Message-State: ANhLgQ3uMXiSbC9NUV1l2DqR4pk/wymfFmolV+pDHIczU/EG2LA/3neh
 hoLWKr0fBMhSiaJ2Wteer4Q=
X-Google-Smtp-Source: ADFU+vtDPkdYvHdJctGaUn1yJW2tAzq/75Dudbd3bkwC8xMX4CeHp6fsDhTNJL8ubm7RAJgY6vsEZQ==
X-Received: by 2002:a17:906:bcec:: with SMTP id
 op12mr5878135ejb.241.1584091567280; 
 Fri, 13 Mar 2020 02:26:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id p24sm1361333edx.34.2020.03.13.02.26.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 02:26:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tian, Kevin'" <kevin.tian@intel.com>, "'Jan Beulich'" <jbeulich@suse.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
 <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
 <002e01d5f6ee$75e09700$61a1c500$@xen.org>
 <0c311606-5c96-9171-f106-23e1e0c13bbb@suse.com>
 <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDADF@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDADF@SHSMSX104.ccr.corp.intel.com>
Date: Fri, 13 Mar 2020 09:26:05 -0000
Message-ID: <009d01d5f919$6c76c7c0$45645740$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZoBACz6CdVNlWCO6Kdq3kziJjnAF185EEAMB17mkBaZvhrgKeHsAlAbzQiTYCM0VLBALptjSFAhLLjNWmxZv9YA==
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFRpYW4sIEtldmluIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KPiBTZW50OiAxMyBNYXJjaCAyMDIwIDAzOjIzCj4gVG86IHBhdWxAeGVu
Lm9yZzsgJ0phbiBCZXVsaWNoJyA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ0FuZHJldyBDb29wZXInIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjNdIElPTU1VOiBtYWtl
IERNQSBjb250YWlubWVudCBvZiBxdWFyYW50aW5lZCBkZXZpY2VzIG9wdGlvbmFsCj4gCj4gPiBG
cm9tOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFpbC5jb20+Cj4gPiBTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDExLCAyMDIwIDEyOjA1IEFNCj4gPgo+IFsuLi5dCj4gPgo+ID4gPgo+ID4gPiA+
IEhvd2V2ZXIsIGlzIGEgcmVhbGx5IHNheWluZyB0aGF0IHRoaW5ncyB3aWxsIGJyZWFrIGlmIGFu
eSBvZiB0aGUKPiA+ID4gPiBQVEVzIGhhcyB0aGVpciBwcmVzZW50IGJpdCBjbGVhcj8KPiA+ID4K
PiA+ID4gV2VsbCwgeW91IHNhaWQgdGhhdCByZWFkIGZhdWx0cyBhcmUgZmF0YWwgKHRvIHRoZSBo
b3N0KS4gUmVhZHMgd2lsbCwKPiA+ID4gZm9yIGFueSBhZGRyZXNzIHdpdGggYW4gdW5wb3B1bGF0
ZWQgUFRFLCByZXN1bHQgaW4gYSBmYXVsdCBhbmQgaGVuY2UKPiA+ID4gYnkgaW1wbGljYXRpb24g
YmUgZmF0YWwuCj4gPgo+ID4gT2ggSSBzZWUuIEkgdGhvdWdodCB0aGVyZSB3YXMgYW4gaW1wbGlj
YXRpb24gdGhhdCB0aGUgSU9NTVUgY291bGQgbm90IGNvcGUKPiA+IHdpdGggbm9uLXByZXNlbnQg
UFRFcyBpbiBzb21lIHdheS4gQWdyZWVkIHRoYXQsIHdoZW4gdGhlIGRldmljZSBpcyBhc3NpZ25l
ZAo+ID4gdG8gdGhlIGd1ZXN0LCB0aGVuIGl0IGNhbiBhcnJhbmdlICh2aWEgYmFsbG9vbmluZykg
Zm9yIGEgbm9uLXByZXNlbnQgZW50cnkgdG8KPiA+IGJlIGhpdCBieSBhIHJlYWQgdHJhbnNhY3Rp
b24sIHJlc3VsdGluZyBpbiBhIGxvY2stdXAuIEJ1dCBkZWFsaW5nIHdpdGggYQo+ID4gbWFsaWNp
b3VzIGd1ZXN0IHdhcyBub3QgdGhlIGlzc3VlIGF0IGhhbmQuLi4gZGVhbGluZyB3aXRoIGEgYnVn
Z3kgZGV2aWNlIHRoYXQKPiA+IHN0aWxsIHRyaWVkIHRvIERNQSBhZnRlciByZXNldCBhbmQgd2hp
bHN0IGluIHF1YXJhbnRpbmUgd2FzIHRoZSBwcm9ibGVtLgo+ID4KPiAKPiBNb3JlIHRoaW5raW5n
IG9uIHRoaXMsIEkgd29uZGVyIHdoZXRoZXIgdGhlIHNjcmF0Y2ggcGFnZSBpcyBzdWZmaWNpZW50
LCBvcgo+IHdoZXRoZXIgd2Ugc2hvdWxkIHN1cHBvcnQgc3VjaCBkZXZpY2UgaW4gdGhlIGZpcnN0
IHBsYWNlLiBMb29raW5nIGF0Cj4gMGMzNWQ0NDY6Cj4gLS0KPiAgICAgVGhlIHJlYXNvbiBmb3Ig
ZG9pbmcgdGhpcyBpcyB0aGF0IHNvbWUgaGFyZHdhcmUgbWF5IGNvbnRpbnVlIHRvIHJlLXRyeQo+
ICAgICBETUEgKGRlc3BpdGUgRkxSKSBpbiB0aGUgZXZlbnQgb2YgYW4gZXJyb3IsIG9yIGV2ZW4g
Qk1FIGJlaW5nIGNsZWFyZWQsIGFuZAo+ICAgICB3aWxsIGZhaWwgdG8gZGVhbCB3aXRoIERNQSBy
ZWFkIGZhdWx0cyBncmFjZWZ1bGx5LiBIYXZpbmcgYSBzY3JhdGNoIHBhZ2UKPiAgICAgbWFwcGVk
IHdpbGwgYWxsb3cgcGVuZGluZyBETUEgcmVhZHMgdG8gY29tcGxldGUgYW5kIHRodXMgc3VjaCBi
dWdneQo+ICAgICBoYXJkd2FyZSB3aWxsIGV2ZW50dWFsbHkgYmUgcXVpZXNjZWQuCj4gLS0KPiAK
PiAnZXZlbnR1YWxseScuLi4gd2hhdCBkb2VzIGl0IGV4YWN0bHkgbWVhbj8KCkl0IG1lYW5zIGFm
dGVyIGEgcGVyaW9kIG9mIHRpbWUgd2UgY2FuIG9ubHkgZGV0ZXJtaW5lIGVtcGlyaWNhbGx5LgoK
PiBIb3cgd291bGQgYW4gdXNlciBrbm93IGEKPiBkZXZpY2UgaGFzIGJlZW4gcXVpZXNjZWQgYmVm
b3JlIGhlIGF0dGVtcHRzIHRvIHJlLWFzc2lnbiB0aGUgZGV2aWNlCj4gdG8gb3RoZXIgZG9tVSBv
ciBkb20wPyBieSBndWVzcz8KClllcywgYSBndWVzcywgYnV0IGFuIGVkdWNhdGVkIG9uZS4KCj4g
Tm90ZSB0aGUgZXhhY3QgYmVoYXZpb3Igb2Ygc3VjaAo+IGRldmljZSwgYWZ0ZXIgZGlmZmVyZW50
IGd1ZXN0IGJlaGF2aW9ycyAoaGFuZywga2lsbCwgYnVnLCBldGMuKSwgaXMgbm90Cj4gZG9jdW1l
bnRlZC4gV2hvIGtub3dzIHdoZXRoZXIgYSBpbi1mbHkgRE1BIG1heSBiZSB0cmlnZ2VyZWQgd2hl
bgo+IHRoZSBuZXcgb3duZXIgc3RhcnRzIHRvIGluaXRpYWxpemUgdGhlIGRldmljZSBhZ2Fpbj8g
SG93IG1hbnkgc3RhbGUKPiBzdGF0ZXMgYXJlIHJlbWFpbmluZyBvbiBzdWNoIGRldmljZSB3aGlj
aCwgZXZlbiBub3QgdHJpZ2dlcnJpbmcgaW4tZmx5Cj4gRE1BcywgbWF5IGNoYW5nZSB0aGUgZGVz
aXJlZCBiZWhhdmlvciBvZiB0aGUgbmV3IG93bmVyPyBlLmcuIGl0J3MKPiBwb3NzaWJsZSBvbmUg
Y29udHJvbCByZWdpc3RlciBjb25maWd1cmVkIGJ5IHRoZSBvbGQgb3duZXIsIGJ1dCBub3QKPiB0
b3VjaGVkIGJ5IHRoZSBuZXcgb3duZXIuIElmIGl0IGNhbm5vdCBiZSByZXNldCwgd2hhdCdzIHRo
ZSBwb2ludCBvZgo+IHN1cHBvcnRpbmcgYXNzaWdubWVudCBvZiBzdWNoIGJvZ3VzIGRldmljZT8K
PiAKCkJlY2F1c2UgSSdtIGFmcmFpZCBpdCBpcyBxdWl0ZSB1YmlxdWl0b3VzIGFuZCB3ZSBuZWVk
IHRvIGRlYWwgd2l0aCBpdC4KCj4gVGhlcmVieSBJIGZlZWwgYW55IHN1cHBvcnQgb2Ygc3VjaCBi
b2d1cyBkZXZpY2Ugc2hvdWxkIGJlIG1haW50YWluZWQKPiBvZmZ0cmVlLCBpbnN0ZWFkIG9mIGlu
IHVwc3RyZWFtIFhlbi4gVGhvdWdodHM/Cj4gCgpJIGRvbid0IHNlZSB0aGUgaGFybSBpbiB0aGUg
Y29kZSBiZWluZyB1cHN0cmVhbS4gVGhlcmUgbWF5IHdlbGwgYmUgb3RoZXIgZGV2aWNlcyB3aXRo
IHNpbWlsYXIgaXNzdWVzIGFuZCBpdCBwcm92aWRlcyBhbiBvcHRpb24gZm9yIGFuIGFkbWluIHRv
IHRyeS4KCiAgUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
