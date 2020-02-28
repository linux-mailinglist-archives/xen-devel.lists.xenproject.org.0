Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A45173441
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:39:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7c5M-0000wJ-Mt; Fri, 28 Feb 2020 09:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7c5K-0000wA-PZ
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:37:30 +0000
X-Inumbo-ID: ef48272b-5a0d-11ea-98e3-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef48272b-5a0d-11ea-98e3-12813bfff9fa;
 Fri, 28 Feb 2020 09:37:30 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id n18so2574238edw.9
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 01:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3aDU2GPyR793bFyNCyKIh2nmFzIe8KcnWi88jsrrLho=;
 b=M9jyylEFptqM4R/9vxIsD8/44CsglhfuFPc+ZH9uRnjkyjl6PmqlWynobtih0A3t7u
 1YqKVzGH+KR08tCKr+QVJm0r98pQIPZ94q4G/Qw3QRIlIHEk8W4JgFj1ZlT8l4bidWg9
 1Ety1HE/uaUZcGeYVYzBllIF0vymthytHY2R+uSzVGOFsUaU+b6J6dOPK5wUVz/isl+B
 kyfaOshm9EG8Tqzjd4ep4a4J8xJqmZYPn/KWXlBg58tHKZxPr24PDCfBF46czn/q2in7
 OugNYkhOayjROXEdjGgshqZxZvsbcTVMIvdw+RaAi1aSBecSvpg9dfK7U7M4DaEFYKH+
 nmzQ==
X-Gm-Message-State: APjAAAVZjSDWire9ujjDnFH3ZK7zpdzoLp3avxULxpj7LTI0DZgeSJaj
 xo9sTmpb20GuKTcKGXTtgbQ=
X-Google-Smtp-Source: APXvYqww4jQTYag4An2Kcx/ahAYO8ZjHBLoIhsbeGiAUX/tDbh14dnJtQoDeZLNA/OCXuo3R7KUfsQ==
X-Received: by 2002:a17:906:691:: with SMTP id
 u17mr3395460ejb.365.1582882649136; 
 Fri, 28 Feb 2020 01:37:29 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id bx21sm529626edb.17.2020.02.28.01.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 01:37:28 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200227184602.28282-1-andrew.cooper3@citrix.com>
 <7a55cd17-e006-ea81-0242-7a982aa89861@suse.com>
 <3c361cbd-06f3-9178-054b-131f91c28c72@xen.org>
 <eb563b94-1ae1-8eae-0b2f-b5a135915e47@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c2c2f6c8-4a33-4f9d-5520-561a3b5f3d9b@xen.org>
Date: Fri, 28 Feb 2020 09:37:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <eb563b94-1ae1-8eae-0b2f-b5a135915e47@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/grant: Fix signed/unsigned comparisons
 issues
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjgvMDIvMjAyMCAwOToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjgu
MDIuMjAyMCAxMDowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKYW4sCj4+Cj4+IE9uIDI4
LzAyLzIwMjAgMDg6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjcuMDIuMjAyMCAxOTo0
NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBFYWNoIGZ1bmN0aW9uIHRha2VzIGFuIHVuc2ln
bmVkIGNvdW50LCBhbmQgbG9vcHMgYmFzZWQgb24gYSBzaWduZWQgaS4gIFRoaXMKPj4+PiBjYXVz
ZXMgcHJvYmxlbXMgd2hlbiBiZXR3ZWVuIDIgYW5kIDQgYmlsbGlvbiBvcGVyYXRpb25zIGFyZSBy
ZXF1ZXN0ZWQuCj4+Pgo+Pj4gSSBjYW4gc2VlIHByb2JsZW1zLCBidXQgbm90IChhcyB0aGUgdGl0
bGUgc2F5cykgd2l0aCBjb21wYXJpc29uIGlzc3Vlcwo+Pj4gKHRoZSBzaWduZWQgaSBnZXRzIGNv
bnZlcnRlZCB0byB1bnNpZ25lZCBmb3IgdGhlIHB1cnBvc2Ugb2YgdGhlCj4+PiBjb21wYXJpc29u
KS4KPj4+Cj4+Pj4gSW4gcHJhY3RpY2UsIHNpZ25lZC1uZXNzIGlzc3VlcyBhcmVuJ3QgcG9zc2li
bGUgYmVjYXVzZSBjb3VudCBleGNlZWRpbmcKPj4+PiBJTlRfTUFYIGlzIGV4Y2x1ZGVkIGVhcmxp
ZXIgaW4gZG9fZ3JhbnRfb3AoKSwgYnV0IHRoZSBjb2RlIHJlYWRzIGFzIGlmIGl0IGlzCj4+Pj4g
YnVnZ3ksIGFuZCBHQ0Mgb2J2aW91c2x5IGNhbid0IHNwb3QgdGhpcyBlaXRoZXIuCj4+Pj4KPj4+
PiBCbG9hdC1vLW1ldGVyIHJlcG9ydHM6Cj4+Pj4gICAgIGFkZC9yZW1vdmU6IDAvMCBncm93L3No
cmluazogMC80IHVwL2Rvd246IDAvLTk1ICgtOTUpCj4+Pj4gICAgIEZ1bmN0aW9uICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGEKPj4+PiAgICAg
ZG9fZ3JhbnRfdGFibGVfb3AgICAgICAgICAgICAgICAgICAgICAgICAgICA3MTU1ICAgIDcxNDAg
ICAgIC0xNQo+Pj4+ICAgICBnbnR0YWJfdHJhbnNmZXIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDI3MzIgICAgMjcxNiAgICAgLTE2Cj4+Pj4gICAgIGdudHRhYl91bm1hcF9ncmFudF9yZWYg
ICAgICAgICAgICAgICAgICAgICAgIDc3MSAgICAgNzM5ICAgICAtMzIKPj4+PiAgICAgZ250dGFi
X3VubWFwX2FuZF9yZXBsYWNlICAgICAgICAgICAgICAgICAgICAgNzcxICAgICA3MzkgICAgIC0z
Mgo+Pj4+ICAgICBUb3RhbDogQmVmb3JlPTI5OTYzNjQsIEFmdGVyPTI5OTYyNjksIGNoZyAtMC4w
MCUKPj4+Pgo+Pj4+IGFuZCBpbnNwZWN0aW9uIG9mIGdudHRhYl91bm1hcF9ncmFudF9yZWYoKSBh
dCBsZWFzdCByZXZlYWxzIG9uZSBmZXdlciBsb2NhbAo+Pj4+IHZhcmlhYmxlcyBvbiB0aGUgc3Rh
Y2suCj4+Pgo+Pj4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgZm9yIHg4Ni4gSG93ZXZlciwgaGF2aW5n
IHN0YXJ0ZWQgdG8gZmFtaWxpYXJpemUKPj4+IG15c2VsZiBhIHRpbnkgYml0IHdpdGggUklTQy1W
LCBJJ20gbm8gbG9uZ2VyIGNlcnRhaW4gb3VyIHByZXNlbnQgd2F5Cj4+PiBvZiBwcmVmZXJyaW5n
IHVuc2lnbmVkIGludCBmb3IgYXJyYXkgaW5kZXhpbmcgdmFyaWFibGUgYW5kIGFsaWtlIGlzCj4+
PiBhY3R1YWxseSBhIGdvb2QgdGhpbmcgd2l0aG91dCBmdXJ0aGVyIGFic3RyYWN0aW9uLiBOZXZl
cnRoZWxlc3MsIHRoaXMKPj4+IGlzbid0IGFuIGltbWVkaWF0ZSBpc3N1ZSwgc28gLi4uCj4+Cj4+
IFdvdWxkIHlvdSBtaW5kIGV4cGFuZGluZyBhIGJpdCBtb3JlIGFib3V0IHRoaXMgY29tbWVudCBo
ZXJlPyBIb3cKPj4gdW5zaWduZWQgaW50IGlzIGdvaW5nIHRvIG1ha2UgdGhpbmdzIHdvcnNlIG9u
IFJJU0MtVj8KPiAKPiBPdGhlciB0aGFuIHg4Ni02NCBhbmQgQXJtNjQsIDY0LWJpdCAoYW5kIHdp
ZGVyKSBSSVNDLVYgc2lnbi1leHRlbmQKPiB0aGUgcmVzdWx0IG9mIDMyLWJpdCBvcGVyYXRpb25z
IGJ5IGRlZmF1bHQuIEhlbmNlIGZvciBhbiB1bnNpZ25lZAo+IDMyLWJpdCB0eXBlIHRvIGJlIHVz
ZWQgYXMgYXJyYXkgaW5kZXgsIGFuIGFkZGl0aW9uYWwgemVyby1leHRlbmRpbmcKPiBpbnNuIGlz
IGdvaW5nIHRvIGJlIG5lZWRlZCAoanVzdCBsaWtlIGZvciBvdXIgZXhpc3RpbmcgcG9ydHMgYQo+
IHNpZ24tZXh0ZW5kaW5nIGluc24gaXMgbmVlZGVkIHdoZW4gYXJyYXkgaW5kZXhpbmcgdmFyaWFi
bGVzIGFyZQo+IGNhbGN1bGF0ZWQgYXMgMzItYml0IHNpZ25lZCBxdWFudGl0aWVzLCB3aGljaCBp
cyBvbmUgb2YgdGhlIHJlYXNvbnMKPiB3aHkgcmlnaHQgbm93IHdlIHByZWZlciB1bnNpZ25lZCBp
bnQgaW4gc3VjaCBjYXNlcykuCgpNZWgsIEkgYW0gbm90IGNvbnZpbmNlZCB0aGlzIGlzIGEgZ29v
ZCBlbm91Z2ggcmVhc29uIHRvIHN3aXRjaCBhcnJheSAKaW5kZXhlcyB0byBzaWduZWQgaW50IGZv
ciBSSVNDLVYuIFRoZXJlIGFyZSBwcm9iYWJseSBiZXR0ZXIgcGxhY2UgdG8gCmxvb2sgYXQgb3B0
aW1pemF0aW9uIGluIGNvbW1vbiBjb2RlIGFuZCB3b3VsZCBiZW5lZml0cyBhbGwgYXJjaC4KClJl
Z2FyZGluZyB0aGUgcmVhc29uIGZvciAidW5zaWduZWQgaW50IiwgSSBkb24ndCByZXF1ZXN0IGl0
IGJlY2F1c2UgaXQgCnByb2R1Y2UgInNob3J0ZXInIGNvZGUgYnV0IGJlY2F1c2UgdGhlcmUgaXMg
bm8gcmVhc29uIHRvIGhhdmUgYSBzaWduZWQgCmluZGV4IGZvciBhcnJheS4KCkFueXdheSwgbGV0
J3MgY3Jvc3MgdGhhdCBicmlkZ2Ugd2hlbiB3ZSBoYXZlIGFuIGFjdHVhbCBSSVNDLVYgcG9ydCBm
b3IgClhlbiBtZXJnZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
