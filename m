Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB87105013
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:09:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjNQ-00032L-3R; Thu, 21 Nov 2019 10:07:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WwqD=ZN=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iXjNO-00032G-MD
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:07:50 +0000
X-Inumbo-ID: c58eb8dc-0c46-11ea-9631-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c58eb8dc-0c46-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 10:07:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l17so3042268wmh.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 02:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lRuJPrsc6NJSCtw4vUffhdYHO78vZrhWbzEAdIVR55E=;
 b=H1ttMPs2+QSMQD68+FEKgjKMM3vtMR7MuzhHSBD+2sRuqs777ouSs3LgHThqHv3dAE
 7DsBDMw8wCrLGIhwosdlun4m0qGiE6fOHVeRfz0eR51+x3oSYsn/A+zJHDsx3K6C91c7
 fc4qUY7sgKHKUpzyJO7OyjqkP7ILYVhbOW5PKzUTlXHdduMf+cWy2XSC8T33qANcrc1b
 RAohYKqYlwoDONFxjsPKkIlR2Cmk43AMTVumenpXWd19Ny93gmtmtcdHLzs2ozwuuggp
 w2SaxpJNEctg5t6+BSSsQkbgu82QrQkTlEsb1HU96NrFzoP+HO08kLjQqmgPDZbab3Nx
 AoDw==
X-Gm-Message-State: APjAAAXjIbq2U28MFLw1vdGStXBYbItwKZNNIWPJQmSM3UlP9PJvWwIz
 zOfhj3LUE76BxB6Zqe2lbkY=
X-Google-Smtp-Source: APXvYqzD1t5CbRp4o/Wny5YFcM3jV4f1+n+Gg36SsgMXAOLF6lcft6IIkND+7YHBmN5apYwAtB9X6w==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr8117366wmb.87.1574330868625; 
 Thu, 21 Nov 2019 02:07:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id 5sm2220907wmk.48.2019.11.21.02.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 02:07:47 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
 <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
 <48afa07d-8219-3a2e-45eb-e3dec2bcb89e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ae71b47b-3fcf-01c5-5bc8-83948c2f209b@xen.org>
Date: Thu, 21 Nov 2019 10:07:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <48afa07d-8219-3a2e-45eb-e3dec2bcb89e@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 1/2] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8xMS8yMDE5IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMC4xMS4yMDE5
IDIxOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDE0LzExLzIwMTkgMTY6NDMsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gSW4gb3JkZXIgZm9yIGluZGl2aWR1YWwgSU9NTVUgZHJpdmVycyAo
YW5kIGZyb20gYW4gYWJzdHJhY3QgcG92IGFsc28KPj4+IGFyY2hpdGVjdHVyZXMpIHRvIGJlIGFi
bGUgdG8gYWRqdXN0LCBhaGVhZCBvZiBhY3R1YWwgbWFwcGluZyByZXF1ZXN0cywKPj4+IHRoZWly
IGRhdGEgc3RydWN0dXJlcyB3aGVuIHRoZXkgbWlnaHQgY292ZXIgb25seSBhIHN1Yi1yYW5nZSBv
ZiBhbGwKPj4+IHBvc3NpYmxlIEdGTnMsIGludHJvZHVjZSBhIG5vdGlmaWNhdGlvbiBjYWxsIHVz
ZWQgYnkgdmFyaW91cyBjb2RlIHBhdGhzCj4+PiBwb3RlbnRpYWxseSBpbnN0YWxsaW5nIGEgZnJl
c2ggbWFwcGluZyBvZiBhIG5ldmVyIHVzZWQgR0ZOIChmb3IgYQo+Pj4gcGFydGljdWxhciBkb21h
aW4pLgo+Pgo+PiBJZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHksIHRoaXMgaXMgbW9zdGx5
IHRhcmdldGluZyBJT01NTlUgZHJpdmVyCj4+IHdoZXJlIHBhZ2UtdGFibGUgYXJlIG5vdCBzaGFy
ZWQgd2l0aCB0aGUgcHJvY2Vzc29yLiBSaWdodD8KPiAKPiBZZXMgLSB3aXRoIHNoYXJlZCBwYWdl
IHRhYmxlcyB0aGVyZSdzIG5vIHNlcGFyYXRlIGhhbmRsaW5nIG9mCj4gSU9NTVUgKHVuKW1hcHBp
bmdzIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPj4+IFRCRDogRG9lcyBBcm0gYWN0dWFsbHkgaGF2
ZSBhbnl0aGluZyB0byBjaGVjayBhZ2FpbnN0IGluIGl0cwo+Pj4gICAgICAgIGFyY2hfbm90aWZ5
X2dmbigpPwo+Pgo+PiBJIHVuZGVyc3RhbmQgdGhhdCB3ZSB3YW50IHRvIGtlZXAgdGhlIGNvZGUg
bW9zdGx5IGdlbmVyaWMsIGJ1dCBJIGFtIGEKPj4gYml0IGNvbmNlcm5lZCBvZiB0aGUgZXh0cmEg
Y29zdCB0byB1c2Ugbm90aWZ5X2dmbigpIChhbmQgaW5kaXJlY3RseQo+PiBpb21tdV9ub3RpZnlf
Z2ZuKCkpIGZvciBkb2luZyBub3RoaW5nLgo+Pgo+PiBJIGNhbid0IHNlZSBhbnkgZGlyZWN0IHVz
ZSBvZiB0aGlzIGZvciB0aGUgZm9yZXNlYWJsZSBmdXR1cmUgb24gQXJtLiBTbwo+PiBjb3VsZCB3
ZSBnYXRlIHRoaXMgdW5kZXIgYSBjb25maWcgb3B0aW9uPwo+IAo+IFRoaXMgaXMgYW4gb3B0aW9u
LCBzdXJlLiBBbHRlcm5hdGl2ZWx5IEkgY291bGQgc2VlIGFib3V0IG1ha2luZyB0aGlzCj4gYW4g
aW5saW5lIGZ1bmN0aW9uLCBidXQgaWlyYyB0aGVyZSB3ZXJlIGhlYWRlciBkZXBlbmRlbmN5IGlz
c3Vlcy4KPiBUaGVuIGFnYWluIC0gaXMgYSBjYWxsIHRvIGEgZnVuY3Rpb24gZG9pbmcgYWxtb3N0
IG5vdGhpbmcgcmVhbGx5IHNvCj4gbXVjaCBleHRyYSBvdmVyaGVhZCBvbiBBcm0uCgpBRkFJQ1Qs
IHRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBBTUQgZHJpdmVyLiBTbyBhbnkgaW1wYWN0IChubyBt
YXR0ZXIgCnRoZSBzaXplKSBmZWVscyBub3QgcmlnaHQgZm9yIEFybS4KCkluIHRoaXMgcGFydGlj
dWxhciBjYXNlLCB0aGUgb25seSB0aGluZyBJIHJlcXVlc3QgaXMgdG8gcHJvdGVjdCB0aGUgCm5v
dGlmeV9nZm4gJiBjYWxsYmFjayB3aXRoICFDT05GSUdfSU9NTVVfRk9SQ0VfU0hBUkUuCgo+IAo+
Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+PiArKysgYi94ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMKPj4+IEBAIC05NDYsNiArOTQ2LDE2IEBAIG1hcF9ncmFudF9yZWYoCj4+PiAg
ICAgICAgICAgIHJldHVybjsKPj4+ICAgICAgICB9Cj4+PiAgICAKPj4+ICsgICAgaWYgKCBwYWdp
bmdfbW9kZV90cmFuc2xhdGUobGQpIC8qICYmIChvcC0+ZmxhZ3MgJiBHTlRNQVBfaG9zdF9tYXAp
ICovICYmCj4+Cj4+IEkgdGhpbmsgdGhpcyB3YW50cyBhbiBleHBsYW5hdGlvbiBpbiB0aGUgY29k
ZSB3aHkgdGhlIGNoZWNrIGlzIGNvbW1lbnRlZC4KPiAKPiBIbW0sIGluIHN1Y2ggYSBjYXNlIEkn
ZCByYXRoZXIgb21pdCB0aGUgY29tbWVudGVkIGNvbmRpdGlvbi4gSXQKPiBiZWluZyBjb21tZW50
ZWQgaGFzIHRoZSBwdXJwb3NlIG9mIGRvY3VtZW50aW5nIGl0c2VsZi4KCkkgZmFpbCB0byB1bmRl
cnN0YW5kIHdoeSBHTlRNQVBfaG9zdF9tYXAgd291bGQgYWx3YXlzIGJlIHRydWUgaW4gdGhlIGNh
c2UuCgpBRkFJVSB0aGUgY29kZSwgdGhpcyBpcyBvbmx5IGNvcnJlY3QgZm9yIHBhZ2luZ19tb2Rl
X2V4dGVybmFsKGxkKSA9PSAxLiAKRG9lcyBpdCBtZWFuIHRoYXQgcGFnaW5nX21vZGVfdHJhbnNs
YXRlKGxkKSBhbmQgcGFnaW5nX21vZGVfZXh0ZXJuYWwobGQpIAphcmUgYWx3YXlzIGVxdWFsPyBJ
ZiBzbywgd2hhdCdzIHRoZSBwb2ludCBvZiBoYXZpbmcgdHdvIG1hY3JvIChhbmQgdHdvIApmbGFn
cyk/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
