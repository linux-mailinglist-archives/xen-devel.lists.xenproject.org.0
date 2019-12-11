Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F188911AA6D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 13:03:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0gQ-0004ro-2g; Wed, 11 Dec 2019 12:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWtT=2B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1if0gO-0004rj-Hr
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 12:01:32 +0000
X-Inumbo-ID: f850c932-1c0d-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f850c932-1c0d-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 12:01:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so6694109wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 04:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2phQNqtnOVGNYv00+rtiKZkxXLNxPKnA6YbW4OM3t8=;
 b=hR9RXEYDc9duOi1bzSBdD1AL0wJZriDbP+NwWTcHXPmhwSwQe61VazqGgWKca8E6Sc
 DaDdwME/9RDdlA+geXxIHp/fP0U3/HgVlPQlGBVtH5tab5NPd6NxfFbYdcb3diHLv3RR
 9LDSs/6NLpSrozonheLXurlX38Hj+/9jFWA5eShdn8IRInvqiwVgApap7Sa0Z6inDfQX
 tivaV69HWTT9aRL9Pmzzwkfg6l/k73GZr5DFS32jqfWDf/XdYQt9cna6dhq9fq/nx0cI
 yTiN8vQioYQVZ9HtZ0rpViMPGWvP1r8Nuw2gXTKunfi8Of5NxC2Ke1O7lLplbiqlqu9j
 u7PQ==
X-Gm-Message-State: APjAAAU6Th6eUCjfziDGkxl5xROxP4WtV3yWiBwjqkdwSa0LQrXlExj0
 xXGvxqkkaXuLAsEij44qbos=
X-Google-Smtp-Source: APXvYqzI8CkkqmU2it7vxLNXz1YpJuwHYzdhOqbj00E5BL1/O0Zm5GGjLDdrhTvd55sK0JU9F/udjQ==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr3189474wmc.126.1576065691075; 
 Wed, 11 Dec 2019 04:01:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id e12sm2007228wrn.56.2019.12.11.04.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 04:01:30 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
 <cbab999a-fd87-2c2c-d14f-421ec4db6ef0@xen.org>
 <ef33060f-b8a8-a13b-5917-83730f5afdeb@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8acb2abe-6a70-f2a4-632f-d3f1549e58c3@xen.org>
Date: Wed, 11 Dec 2019 12:01:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ef33060f-b8a8-a13b-5917-83730f5afdeb@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOS8xMi8yMDE5IDE3OjM3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA4LzEy
LzIwMTkgMTI6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmV3LAo+Pgo+PiBPbiAw
NS8xMi8yMDE5IDIyOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gVGhlc2UgaHlwZXJjYWxs
cyBlYWNoIHVzZSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCksIHdob3NlIEFQSSBpcwo+Pj4g
YWJvdXQgdG8KPj4+IHN3aXRjaCB0byB1c2UgLUVSRVNUQVJULsKgIFVwZGF0ZSB0aGUgc29vbi10
by1iZSBhZmZlY3RlZCBwYXRocyB0byBjb3BlLAo+Pj4gZm9sZGluZyBleGlzdGluZyBjb250aW5h
dGlvbiBsb2dpYyB3aGVyZSBhcHBsaWNhYmxlLgo+Pj4KPj4+IEluIGFkZGl0aW9uOgo+Pj4gIMKg
ICogRm9yIHBsYXRmb3JtIG9wIGFuZCBzeXNjdGwsIGluc2VydCBhIGNwdV9yZWxheCgpIGludG8g
d2hhdCBpcwo+Pj4gb3RoZXJ3aXNlIGEKPj4+ICDCoMKgwqAgdGlnaHQgc3BpbmxvY2sgbG9vcCwg
YW5kIG1ha2UgdGhlIGNvbnRpbnVhdGlvbiBsb2dpYyBjb21tb24gYXQgdGhlCj4+PiAgwqDCoMKg
IGVwaWxvZ3VlLgo+Pj4gIMKgICogQ29udHJhcnkgdG8gdGhlIGNvbW1lbnQgaW4gdGhlIGNvZGUs
IGtleGVjX2V4ZWMoKSBkb2VzIHJldHVybiBpbiB0aGUKPj4+ICDCoMKgwqAgS0VYRUNfUkVCT09U
IGNhc2UsIG5lZWRzIHRvIHBhc3MgcmV0IGJhY2sgdG8gdGhlIGNhbGxlci4KPj4KPj4gSXQgaXMg
bm90IGVudGlyZWx5IHRyaXZpYWwgdG8gbWUgdGhhdCBLRVhFQ19SRUJPT1QgcmVmZXJzIHRvCj4+
IEtFWEVDX0RFRkFVTFRfVFlQRS4gVGhlIG1vcmUgdGhhdCBpZiB5b3UgbG9vayBhdCB0aGUga2V4
ZWNfcmVib290KCkKPj4gaGVscGVyLCBpdCB3aWxsIG5vdCByZXR1cm4gKHNlZSBCVUcoKSkuIFdo
YXQgbWF5IHJldHVybiBpcwo+PiBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCkuCj4+Cj4+IFNv
IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gdXNlIEtFWEVDX0RFRkFVTFRfVFlQRT8KPiAKPiBJJ20g
bm90IHN1cmUgd2h5IEkgY2FwaXRhbGlzZWQgaXQsIGJ1dCBubyAtIHVzaW5nIEtFWEVDX0RFRkFV
TFRfVFlQRSBpcwo+IHdvcnNlLsKgIEEgY2FzdWFsIHJlYWRlciBpcyBmYXIgbW9yZSBsaWtlbHkg
dG8gdW5kZXJzdGFuZCBrZXhlY19yZWJvb3QoKQo+IGluIHRoaXMgY29udGV4dC4KCkJ1dCBrZXhl
Y19yZWJvb3QoKSBjYW5ub3QgcmV0dXJuIChzZWUgQlVHKCkpIHNvIGEgcmVhZGVyIG1heSBub3Qg
CnVuZGVyc3RhbmQgd2h5IHlvdSBzdWdnZXN0IHRoYXQgaXQgd2lsbCByZXR1cm4uIFNvIEkgdGhp
bmsgdGhpcyB3YW50IHRvIApiZSByZXdvcmRlZC4KPj4KPj4gWy4uLl0KPj4KPj4+IEBAIC04MTYs
NiArODE5LDEzIEBAIHJldF90Cj4+PiBkb19wbGF0Zm9ybV9vcChYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9wbGF0Zm9ybV9vcF90KSB1X3hlbnBmX29wKQo+Pj4gIMKgwqAgb3V0Ogo+Pj4gIMKg
wqDCoMKgwqAgc3Bpbl91bmxvY2soJnhlbnBmX2xvY2spOwo+Pj4gIMKgICvCoMKgwqAgaWYgKCBy
ZXQgPT0gLUVSRVNUQVJUICkKPj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoCBjcmVhdGVfY29udGlu
dWF0aW9uOgo+Pgo+PiBTaGFsbCB3ZSBpbmRlbnQgY3JlYXRlX2NvbnRpbnVhdGlvbiB0aGUgc2Ft
ZSB3YXkgYXMgb3V0Pwo+IAo+IFRoZXkgaGF2ZSBkaWZmZXJlbnQgc2NvcGVzLCBhbmQgd2hpbGUg
aXQgbWF5IGxvb2sgd2VpcmQsIHRoaXMgaXMgaW4KPiBhY2NvcmRhbmNlIHdpdGggb3VyIHN0eWxl
Lgo+IAo+Pgo+PiBbLi4uXQo+Pgo+Pj4gQEAgLTEyNjMsMTMgKzEyNjMsMjUgQEAgc3RhdGljIGlu
dCBkb19rZXhlY19vcF9pbnRlcm5hbCh1bnNpZ25lZCBsb25nCj4+PiBvcCwKPj4+ICDCoCDCoCBs
b25nIGRvX2tleGVjX29wKHVuc2lnbmVkIGxvbmcgb3AsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
dm9pZCkKPj4+IHVhcmcpCj4+PiAgwqAgewo+Pj4gLcKgwqDCoCByZXR1cm4gZG9fa2V4ZWNfb3Bf
aW50ZXJuYWwob3AsIHVhcmcsIDApOwo+Pj4gK8KgwqDCoCBpbnQgcmV0ID0gZG9fa2V4ZWNfb3Bf
aW50ZXJuYWwob3AsIHVhcmcsIDApOwo+PiBTaG91bGRuJ3QgaXQgYmUgbG9uZyAob3IgdW5zaWdu
ZWQgbG9uZykgaGVyZT8gT3RoZXJ3aXNlLCB0aGUgcmV0dXJuIG9mCj4+IGh5cGVyY2FsbF9jcmVh
dGVfY29udGludWF0aW9uKCkgbWF5IGJlIHRydW5jYXRlZC4KPiAKPiBJZiB5b3UncmUgY29uY2Vy
bmVkIGFib3V0IHRydW5jYXRpb24gdmlhIHRoaXMgcGF0dGVybiwgdGhlbiB0aGVyZSBhcmUKPiBv
dGhlciBhcmVhcyBvZiB0aGUgY29kZSB0byBiZSB3b3JyZWQgYWJvdXQuCgpJIGtuZXcgeW91IHdv
dWxkIG1lbnRpb24gdGhlIG90aGVyIHBsYWNlcyA6KS4KCj4gCj4gSG93ZXZlciwgdGhlcmUgaXMg
bm90aGluZyB0byB0cnVuY2F0ZS7CoCBUaGUgcmV0dXJuIHZhbHVlIG9mCj4gaHlwZXJjYWxsX2Ny
ZWF0ZV9jb250aW51YXRpb24oKSBpcyB0aGUgcHJpbWFyeSBoeXBlcmNhbGwgbnVtYmVyLCBpLmUu
Cj4gX19IWVBFUlZJU09SX2tleGVjX29wIGluIHRoaXMgY2FzZS4KCk1ha2Ugc2Vuc2UuIEFuZCBJ
IGd1ZXNzIHRoZSBzaWduZWQgYml0IHdpbGwgYmUgcHJvcGFnYXRlZCBzbyBpZiAKZG9fa2V4ZWNf
b3AoKSByZXR1cm4gLUVJTlZBTCAoMzItYml0KSwgdGhlbiBpdCB3b3VsZCBzdGlsbCBiZSAtRUlO
VkFMIAooNjQtYml0KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
