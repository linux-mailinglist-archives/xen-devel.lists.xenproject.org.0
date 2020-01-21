Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63B143CE6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:32:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itsed-0008OD-E3; Tue, 21 Jan 2020 12:29:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itsec-0008O8-4e
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:29:10 +0000
X-Inumbo-ID: 9d3d8696-3c49-11ea-ba84-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d3d8696-3c49-11ea-ba84-12813bfff9fa;
 Tue, 21 Jan 2020 12:29:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so3008642wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 04:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7BEDt+TCfD1YlGTvs2qzgEZvuyt659EjI59/6uH5JCA=;
 b=otx+jYInWF3vmvu4ANzPtBCrokLM84l6wl9duR9w2bSuMxa8IVj7CewXltWboetnto
 Yna4m0a/a2vqobMsaLwqhZvh0gtb7NDkNMIVFD6s8TEvKyxpZo+c3r+bHc6e+Zb+bQKQ
 N25RTA9Wr+UQ1+MLD2Us8rJ4w4s8MnLru/GyXNshdFwJN0IMVQqb2qYT9I+7P1U6SD3D
 N5iLx3ZSAdH/rtClcHIzuB6PsAnZhypvIJUWGOxiD1m5/VkIkDq6wGd68RDkI4CqacVB
 06iOp5SBsq0RikjMTXldUrLkni+QflKvJCH1HUbi9whOkWJkMqJmNXtgQqVvMDP4Hlxb
 zdew==
X-Gm-Message-State: APjAAAUD4N45jYT4jCjRfwaRb1HlIiJeUfPyYqujEXjUaulVr84k3k5a
 44cefJM6RI5vhSU1DXlJgpM=
X-Google-Smtp-Source: APXvYqwnkJmQuuc/vol2KZvpqP/KkuNeSfCCYmC4aD+L5fhKUn/IGKUJGu/EaGks85Sjo8HpbX2afg==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr4789192wro.45.1579609745205; 
 Tue, 21 Jan 2020 04:29:05 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id d14sm55782107wru.9.2020.01.21.04.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 04:29:04 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-4-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1c6f1cc1-d341-791e-bdc1-4f2d6beb2495@xen.org>
Date: Tue, 21 Jan 2020 12:29:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121120009.1767-4-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 3/3] x86 / vmx: use a 'normal' domheap page
 for APIC_DEFAULT_PHYS_BASE
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

SGksCgpPbiAyMS8wMS8yMDIwIDEyOjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBp
bmRleCA5MTlhMjcwNTg3Li5lZjMyNzA3MmVkIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBAQCAtMjI2OSw3ICsy
MjY5LDggQEAgaW50IGFzc2lnbl9wYWdlcygKPiAgIAo+ICAgICAgIGlmICggIShtZW1mbGFncyAm
IE1FTUZfbm9fcmVmY291bnQpICkKPiAgICAgICB7Cj4gLSAgICAgICAgaWYgKCB1bmxpa2VseSgo
ZC0+dG90X3BhZ2VzICsgKDEgPDwgb3JkZXIpKSA+IGQtPm1heF9wYWdlcykgKQo+ICsgICAgICAg
IGlmICggdW5saWtlbHkoKGQtPnRvdF9wYWdlcyArICgxIDw8IG9yZGVyKSkgPiBkLT5tYXhfcGFn
ZXMpICYmCj4gKyAgICAgICAgICAgICBkLT5jcmVhdGlvbl9maW5pc2hlZCApCgpUaGlzIGlzIG5v
dCBlbnRpcmVseSBvYnZpb3VzIHRvIG1lIGhvdyB0aGlzIGlzIHNhZmUuIFdoYXQgd291bGQgaGFw
cGVuIAppZiBkLT5jcmVhdGlvbl9maW5pc2hlZCBpcyBzZXQgb24gYW5vdGhlciBDUFUgYXQgdGhl
IHNhbWUgdGltZT8gQXQgbGVhc3QgCm9uIEFybSwgdGhpcyBtYXkgbm90IGJlIHNlZW4gZGlyZWN0
bHkuCgpJIGd1ZXNzIHRoZSBwcm9ibGVtIHdvdWxkIG5vdCBvbmx5IGhhcHBlbiBpbiB0aGlzIHVz
ZSBjYXNlIChJIGFtIG1vcmUgCmNvbmNlcm5lZCBpbiB0aGUgcGh5c21hcCBjb2RlKSwgYnV0IGl0
IHdvdWxkIGJlIGdvb2QgdG8gZG9jdW1lbnQgaG93IGl0IAppcyBtZWFudCB0byBiZSBzYWZlIHRv
IHVzZS4KCkhvd2V2ZXIsIEFGQUlVLCB0aGUgb25seSByZWFzb24gZm9yIHRoZSBjaGVjayB0byBi
ZSBoZXJlIGlzIGJlY2F1c2UgCmQtPm1heF9wYWdlcyBpcyBzZXQgcXVpdGUgbGF0ZS4gSG93IGFi
b3V0IHNldHRpbmcgbWF4X3BhZ2VzIGFzIHBhcnQgb2YgCnRoZSBkb21haW5fY3JlYXRlIGh5cGVy
Y2FsbD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
