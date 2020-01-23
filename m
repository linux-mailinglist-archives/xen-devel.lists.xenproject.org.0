Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E24146157
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 06:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuUuD-0000s9-Ob; Thu, 23 Jan 2020 05:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=264E=3M=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iuUuC-0000s4-TS
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 05:19:48 +0000
X-Inumbo-ID: f970366e-3d9f-11ea-8e9a-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f970366e-3d9f-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 05:19:48 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id t141so1024453ywc.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 21:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uvRAutqzzInzt7GYP0eVIAXGmuJHctSq9NpdNKK79RI=;
 b=GUg2R63KrFybcAhl5HVikpp1TrXMkqnAUno39XDDAuqitSnttFf1mMlJiObMECP3sK
 M+Pjn6jh3AazAJ3GlOFYk2SiYBBYWj6jUt2jCPPQAhfA4jl7TTJI5l1Sm7u0gMk8IAfR
 v6Ph7HMxXgHaXbOrDSyzXwSe0BLXbum3HrylPDpiPQ51NI5AVUDClMqhCpe9GlcxLe+N
 A3bsmXlJuOZKz53a+KogukSI2B1cJz/q9CvT93Tm4IYyADNkgH7hvAdTPYFCUdxdFri/
 ks1hKwCxnO4aH79bS8O0teDqAoXsa47+6dHtSmAG/RZR4M5JP9YnduFeM8paId7yZnRG
 jVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uvRAutqzzInzt7GYP0eVIAXGmuJHctSq9NpdNKK79RI=;
 b=jzweF8DoXvZFD8R9fn8Nd/K2EzB+RTAbgD4vkoAX3igVmBD7cVOt3jiPgOALuvoe4S
 glZlxVARz+/9vJNAx+0VtEoCeDfEDHksH/XkuaufrXWgyRq0gootcBYynUeO91ppQ9l+
 Uhh7n4Bygkw0vTIYQDIp4RCBE1UWhE9hy0cg8BmhQFHVSf7Q0XJJjeCBlaoT+Z2c5tTu
 Nv6gnP2bLcOKG2ycX3aX6zrXiB3yYKP/fv+6misb81cuWkWH/3vj9Ujfquuz8WrI0DmG
 ScCi8LkcdIcMZXH4tOL9TfEueTot+Ny4Lo7W/iqb0LFUewYYi/gxm5h1AEJ31hAEQpja
 YinA==
X-Gm-Message-State: APjAAAWuALL6a0YzdQH+2lnE9YCQerTu8aTXscV8yA4oZWxlOB24w4Bf
 vbH6prE6FSRtejhz3lwU810=
X-Google-Smtp-Source: APXvYqwfbBnN8kSC8w7Q23DkZZaxWrrMTZu1xD5uA07bzCbFGQGaPk+otqUnNhVqOOpkRk5n+7EteA==
X-Received: by 2002:a0d:e741:: with SMTP id q62mr10847119ywe.380.1579756787874; 
 Wed, 22 Jan 2020 21:19:47 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id j188sm365903ywc.99.2020.01.22.21.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 21:19:47 -0800 (PST)
Date: Wed, 22 Jan 2020 23:19:45 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200123051945.GB6612@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDI6NTc6NDdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBIb3cgbXVjaCB0aW1lIGRvIHlvdSBoYXZlIHRvIHB1dCB0b3dhcmRzIHRoZSBwb3J0
P8KgIElzIHRoaXMgc29tZXRoaW5nIGluCj4geW91ciBmcmVlIHRpbWUsIG9yIHNvbWV0aGluZyB5
b3UgYXJlIGRvaW5nIGFzIHBhcnQgb2Ygd29yaz/CoCBVbHRpbWF0ZWx5LAo+IHdlIGFyZSBnb2lu
ZyB0byBuZWVkIHRvIGluY3JlYXNlIHRoZSBsZXZlbCBvZiBSSVNDLVYga25vd2xlZGdlIGluIHRo
ZQo+IGNvbW11bml0eSB0byBtYWludGFpbiB0aGluZ3MgaW4gdGhlIGZ1dHVyZS4KPiAKClRoaXMg
aXMgc29tZXRoaW5nIGluIG15IGZyZWUgdGltZSwgYW5kIEkgaGF2ZSBhYm91dCAyMCBob3VycyBh
IHdlZWsgdG8KcHV0IGludG8gaXQuCgo+IE90aGVyIHRoYW4gdGhhdCwgdmVyeSBSRkMgc2VyaWVz
IGFyZSBlbnRpcmVseSBmaW5lLsKgIEEgZ29vZCBmaXJzdCBzdGVwCj4gd291bGQgYmUgc2ltcGx5
IHRvIGdldCB0aGUgYnVpbGQgd29ya2luZywgYW5kIGdldCBzb21lIGtpbmQgb2YKPiBjcm9zcy1j
b21waWxlIGJ1aWxkIGluIENJLCB0byBtYWtlIHN1cmUgdGhhdCB3ZSBkb24ndCBjbG9iYmVyIHRo
ZSBSSVNDLVYKPiBidWlsZCB3aXRoIGNvbW1vbiBvciBvdGhlci1hcmNoIGNoYW5nZXMuCj4gCgpU
aGF0J3Mgc29tZXRoaW5nIEkgY2FuIGxvb2sgYXQsIGlmIHRoZSBpZGVhIG9mIFFFTVUgaW4gQ0kg
aXMKbm90IHRvbyBob3JyaWZpYy4KCgo+IEkgaG9wZSB0aGlzIGhlbHBzLgo+IAo+IH5BbmRyZXcK
CgpEZWZpbml0ZWx5IGhlbHBzLCB0aGFua3MhCgotQm9iYnkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
