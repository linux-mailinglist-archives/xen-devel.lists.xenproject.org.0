Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31880146CC7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:28:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueNH-0007uP-Pe; Thu, 23 Jan 2020 15:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iueNG-0007uK-0n
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:26:26 +0000
X-Inumbo-ID: b2c4ff6a-3df4-11ea-9fd7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2c4ff6a-3df4-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 15:26:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so3545222wru.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 07:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tx+f/LEQ1QczLRWn/fkaEsDEzw+R3jbF4rmjRIOEQrM=;
 b=KBk5DVvOSqXubzYKC1WUw81heHPDPW1GZpXgBPf7Bw0yPAjf67EnLqV+/23uJU4Gj6
 Z6+XzM5NGvb2ZLFId3IrCyiPCOk6/kvNetuhVzd/o/6LGYnUqQwPPQzkXdjsIzHt1sr6
 ZHoeVz/ISwpwnWKEHFsG6O2iAcN8OdqXf/JMQNzuIKqK6AErBszUJBsmHPVUxPg8jM2B
 UiiLz4QsNVKLZAjTBg4J/Ppd0qai6mvi7lieHavJO5bShRtsWV8px3uc8MmPT3A2S2Ns
 rujPxRPfQI++ljKz3Cr0eJOSl9qV9tGLFtuRH+FoCXJVRzf2DKYHGXWzaSADrPDYkcmK
 7zqA==
X-Gm-Message-State: APjAAAVKLAZk7Ts7gRbzQRRoIIj7TiXt13zYhrIFrfUCBlG5jaBrMvXD
 n7jdXTHWVuE1Su7mN6afm1A=
X-Google-Smtp-Source: APXvYqw3S0fIzNnPntiiQXThjBKByAjWbMji6zwazMe919ocUp1Z81j2PZrBo7aiwlpu+xZaJ/b7pQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr18326891wrl.260.1579793176493; 
 Thu, 23 Jan 2020 07:26:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id a5sm2998455wmb.37.2020.01.23.07.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 07:26:15 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d3b28297-0a5e-2a9b-9c2f-4348e98ce757@xen.org>
Date: Thu, 23 Jan 2020 15:26:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123140305.21050-4-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMy8wMS8yMDIwIDE0OjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gaW5kZXggZWUzZjlm
ZmQzZS4uMzBjNzc3YWNiOCAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysr
IGIveGVuL2NvbW1vbi9kb21haW4uYwo+IEBAIC0zMzksNiArMzM5LDggQEAgc3RhdGljIGludCBz
YW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29u
ZmlnKQo+ICAgICAgIHJldHVybiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoY29uZmlnKTsK
PiAgIH0KPiAgIAo+ICsjZGVmaW5lIERPTUFJTl9JTklUX1BBR0VTIDEKCldvdWxkIGl0IG1ha2Ug
c2Vuc2UgdG8gbWFrZSB0aGlzIGEgcGVyLWFyY2ggZGVmaW5lPyBUaGlzIHdvdWxkIGFsbG93IApl
YWNoIGFyY2ggdG8gZGVmaW5lIGEgZGlmZmVyZW50IG51bWJlciBvZiBpbml0IHBhZ2VzIChhbmQg
Y2F0Y2ggYW55IG1pc3VzZSkuCgo+ICsKPiAgIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUo
ZG9taWRfdCBkb21pZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhl
bl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgaXNfcHJpdikKPiBAQCAtNDQxLDYgKzQ0MywxMiBAQCBzdHJ1Y3QgZG9tYWlu
ICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCj4gICAgICAgICAgIHJhZGl4X3RyZWVfaW5p
dCgmZC0+cGlycV90cmVlKTsKPiAgICAgICB9Cj4gICAKPiArICAgIC8qCj4gKyAgICAgKiBBbGxv
dyBhIGxpbWl0ZWQgbnVtYmVyIG9mIHNwZWNpYWwgcGFnZXMgdG8gYmUgYWxsb2NhdGVkIGZvciB0
aGUKPiArICAgICAqIGRvbWFpbgo+ICsgICAgICovCj4gKyAgICBkLT5tYXhfcGFnZXMgPSBET01B
SU5fSU5JVF9QQUdFUzsKPiArCj4gICAgICAgaWYgKCAoZXJyID0gYXJjaF9kb21haW5fY3JlYXRl
KGQsIGNvbmZpZykpICE9IDAgKQo+ICAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAgICAgaW5pdF9z
dGF0dXMgfD0gSU5JVF9hcmNoOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21t
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiBpbmRleCAyY2E4ODgyYWQwLi5lNDI5ZjM4
MjI4IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaAo+IEBAIC0zMTcsOCArMzE3LDYgQEAgc3RydWN0IHBhZ2VfaW5m
bwo+ICAgCj4gICAjZGVmaW5lIG1hZGRyX2dldF9vd25lcihtYSkgICAocGFnZV9nZXRfb3duZXIo
bWFkZHJfdG9fcGFnZSgobWEpKSkpCj4gICAKPiAtZXh0ZXJuIHZvaWQgZnJlZV9zaGFyZWRfZG9t
aGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpOwo+IC0KPiAgICNkZWZpbmUgZnJhbWVf
dGFibGUgKChzdHJ1Y3QgcGFnZV9pbmZvICopRlJBTUVUQUJMRV9WSVJUX1NUQVJUKQo+ICAgZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgbWF4X3BhZ2U7Cj4gICBleHRlcm4gdW5zaWduZWQgbG9uZyB0b3Rh
bF9wYWdlczsKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
