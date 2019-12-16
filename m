Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFBE121AFE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 21:40:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igx6a-0005w3-26; Mon, 16 Dec 2019 20:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v9dV=2G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1igx6Z-0005vy-1A
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 20:36:35 +0000
X-Inumbo-ID: baf41fdc-2043-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baf41fdc-2043-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 20:36:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so8896009wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 12:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JF5j2QhBPiKVEsszO1fwNIEf5ztIBBW8hIVMIyB6TX8=;
 b=ZQzFrd6trp8Kk6DKxdp9HbdtvvRvPmwUOAT29tDb1tcyiSDN+wbRCdfftYITizIfnp
 EMqAlxwh+vrcIDXfw+FgBCRHha3z5SOxCv1oo8U9JQy+KzmaXV09NdW7X0WC7A0BIkpY
 Won1UipPNzjc5Ne2jW8ALvAWAszpWs4JwNWdVaMahgO/FBV5893ZrP6yM6eb4d4M5lEe
 wxF6/8MzaUB4CuVL/XQd9FlvPWKxWPGq9eXLN0ZODDent/XsiNucdW2e6Dgj5CYDuJ+B
 Hezt2Z7Z5sJHPnc7JzHfwrJdJBv5+OB9d0Th6r7gxplNDneakvSkLqasla2aPTYcf2iS
 P93Q==
X-Gm-Message-State: APjAAAW4fVk2E/mTxGe2eYUh25uDwRvDR+9cfUWzOZGH7feN3jeF3OLl
 YIZI5jzlUQO3r0UHjYBCExE=
X-Google-Smtp-Source: APXvYqz9kOCrk7TdGWR+j99RWSQ6+KDeJJaAl/3DJBRD938fSrWXpjD853kqh1J0TmYUVY6y872K+A==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr33173920wru.119.1576528585567; 
 Mon, 16 Dec 2019 12:36:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id v8sm22540503wrw.2.2019.12.16.12.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 12:36:24 -0800 (PST)
To: Pavel Tatashin <pasha.tatashin@soleen.com>, jmorris@namei.org,
 sashal@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 maz@kernel.org, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk,
 andrew.cooper3@citrix.com
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
 <20191204232058.2500117-2-pasha.tatashin@soleen.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c5dcf342-90f4-beb5-d2b1-4a37ccedfe42@xen.org>
Date: Mon, 16 Dec 2019 20:36:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191204232058.2500117-2-pasha.tatashin@soleen.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 1/6] arm/arm64/xen: hypercall.h add
 includes guards
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNC8xMi8yMDE5IDIzOjIwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiBUaGUgYXJt
IGFuZCBhcm02NCB2ZXJzaW9ucyBvZiBoeXBlcmNhbGwuaCBhcmUgbWlzc2luZyB0aGUgaW5jbHVk
ZQo+IGd1YXJkcy4gVGhpcyBpcyBuZWVkZWQgYmVjYXVzZSBDIGlubGluZXMgZm9yIHByaXZjbWRf
Y2FsbCBhcmUgZ29pbmcgdG8KPiBiZSBhZGRlZCB0byB0aGUgZmlsZXMuCj4gCj4gQWxzbyBmaXgg
YSBjb21tZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRh
c2hpbkBzb2xlZW4uY29tPgo+IC0tLQo+ICAgYXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVy
LmggICAgICAgfCAyICstCj4gICBhcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgg
ICB8IDQgKysrKwo+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggfCA0
ICsrKysKPiAgIGluY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaCAgICAgICAgICAgIHwgNiArKyst
LS0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVyLmggYi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9hc3NlbWJsZXIuaAo+IGluZGV4IDk5OTI5MTIyZGFkNy4uOGU5MjYy
YTBmMDE2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oCj4g
KysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVyLmgKPiBAQCAtNDgwLDcgKzQ4MCw3
IEBAIFRIVU1CKAlvcnIJXHJlZyAsIFxyZWcgLCAjUFNSX1RfQklUCSkKPiAgIAkubWFjcm8JdWFj
Y2Vzc19kaXNhYmxlLCB0bXAsIGlzYj0xCj4gICAjaWZkZWYgQ09ORklHX0NQVV9TV19ET01BSU5f
UEFOCj4gICAJLyoKPiAtCSAqIFdoZW5ldmVyIHdlIHJlLWVudGVyIHVzZXJzcGFjZSwgdGhlIGRv
bWFpbnMgc2hvdWxkIGFsd2F5cyBiZQo+ICsJICogV2hlbmV2ZXIgd2UgcmUtZW50ZXIga2VybmVs
LCB0aGUgZG9tYWlucyBzaG91bGQgYWx3YXlzIGJlCgpUaGlzIGZlZWxzIHVucmVsYXRlZCBmcm9t
IHRoZSByZXN0IG9mIHRoZSBwYXRjaCBhbmQgcHJvYmFibHkgd2FudCBhbiAKZXhwbGFuYXRpb24u
IFNvIEkgdGhpbmsgdGhpcyB3YW50IHRvIGJlIGluIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGUgcmVz
dCBvZiB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
