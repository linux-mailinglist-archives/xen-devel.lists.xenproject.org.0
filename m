Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D814C889
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:10:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkGB-0002iq-R5; Wed, 29 Jan 2020 10:07:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCRk=3S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iwkGA-0002il-JR
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:07:46 +0000
X-Inumbo-ID: 319af8d8-427f-11ea-8867-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319af8d8-427f-11ea-8867-12813bfff9fa;
 Wed, 29 Jan 2020 10:07:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so5755364wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 02:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sl0goSX7uNbCyS+M9/vrBoShXMvq1GkCj2Gpt5TL+88=;
 b=BBQm0/t8P2bzvTvB+cLObVUQHyslg8UPAK+ITNaqhabM9jEUoamYSR6qVl368xuRBH
 b/o85EMDwqNRePlq3snVYVQ1jZa2RH9rDqMgD84eRUb4tunBC3EZBPk+4c7Fxv6/Emp/
 zIvu9c/ebxtOCv1MAi9R5TClcG+38PALsGmLJ1kOH6tO+dKFAnsiITACGylwuNYkSt7U
 Hm2o2jaJb7PdZaHbbKHpaHpNBDGbmnvRM0gN9r+CYGOCs0l071fSQJ4NLf1/9/KtIe0o
 53d3eDld/aCwK84n+WPe1Vc1zO2vuF1Czo386P0C8sBfjKAK0gSrAaIem3EZaJVBklRu
 RmPQ==
X-Gm-Message-State: APjAAAVGNBjttmfzEYulRTGgBMuzasKE/GAjEaPZVlVRlhVjC6h0mBec
 cHr7K6rVvpADGNnw7dSgrg0=
X-Google-Smtp-Source: APXvYqzNJHSG7tLqWHyPy/Nz6XkzC2kwEQ08gdqInHBpNZvdS0g3XITtUubkfsT5NwUxDuFe1X0MKQ==
X-Received: by 2002:a1c:20c4:: with SMTP id g187mr10034591wmg.29.1580292464405; 
 Wed, 29 Jan 2020 02:07:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id v3sm2244955wru.32.2020.01.29.02.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 02:07:43 -0800 (PST)
To: vrd@amazon.com, Varad Gautam <vrd@amazon.de>,
 xen-devel@lists.xenproject.org
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
 <b89a250a-2b6b-0cc4-655c-2c27c0b8ab76@xen.org>
 <faabd882-c848-370f-f6d2-3f66bae2c110@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9b4307ae-367b-75f6-d00e-52437afc69ad@xen.org>
Date: Wed, 29 Jan 2020 10:07:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <faabd882-c848-370f-f6d2-3f66bae2c110@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOS8wMS8yMDIwIDA5OjI3LCB2cmRAYW1hem9uLmNvbSB3cm90ZToKPiBIZXkgSnVsaWVu
LAoKSGksCgo+IAo+IE9uIDEyLzE4LzE5IDI6NTcgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgVmFyYWQsCj4+Cj4+IFBsZWFzZSBzZW5kIG5ldyB2ZXJzaW9uIG9mIGEgcGF0Y2ggaW4gYSBu
ZXcgdGhyZWFkIHJhdGhlciB0aGFuIAo+PiBpbi1yZXBseSB0byB0aGUgZmlyc3QgdmVyc2lvbi4K
Pj4KPj4gT24gMTgvMTIvMjAxOSAxMDo1MywgVmFyYWQgR2F1dGFtIHdyb3RlOgo+Pj4gWEVOX0RP
TUNUTF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwg
Cj4+PiAtRVJFU1RBUlRTLgo+Pj4gSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8g
cmVjZWl2ZSBtdWx0aXBsZSBfcGlycV9ndWVzdF91bmJpbmQKPj4+IGNhbGxzIGZvciB0aGUgc2Ft
ZSBwaXJxIGZyb20gZG9tYWluX2tpbGwsIGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KPj4+
IHJlbW92ZWQgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlLCBhczoKPj4+IMKgwqAgZG9tYWlu
X2tpbGwoKQo+Pj4gwqDCoMKgwqAgLT4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkKPj4+
IMKgwqDCoMKgwqDCoCAtPiBwY2lfcmVsZWFzZV9kZXZpY2VzKCkKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0+IHBp
cnFfZ3Vlc3RfdW5iaW5kKCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBfX3BpcnFf
Z3Vlc3RfdW5iaW5kKCkKPj4+Cj4+PiBGb3IgYSBzaGFyZWQgcGlycSAobnJfZ3Vlc3RzID4gMSks
IHRoZSBmaXJzdCBjYWxsIHdvdWxkIHphcCB0aGUgY3VycmVudAo+Pj4gZG9tYWluIGZyb20gdGhl
IHBpcnEncyBndWVzdHNbXSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVyIGlzIG5ldmVyIAo+
Pj4gZnJlZWQKPj4+IGFzIHRoZXJlIGFyZSBvdGhlciBndWVzdHMgdXNpbmcgdGhpcyBwaXJxLiBB
cyBhIHJlc3VsdCwgb24gdGhlIHNlY29uZCAKPj4+IGNhbGwsCj4+PiBfX3BpcnFfZ3Vlc3RfdW5i
aW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFzIGJlZW4gCj4+PiBy
ZW1vdmVkCj4+PiBmcm9tIHRoZSBndWVzdHNbXSBsaXN0LCBhbmQgaGl0cyBhIEJVR19PTi4KPj4+
Cj4+PiBNYWtlIF9fcGlycV9ndWVzdF91bmJpbmQgc2FmZSB0byBiZSBjYWxsZWQgbXVsdGlwbGUg
dGltZXMgYnkgbGV0dGluZyB4ZW4KPj4+IGNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFs
cmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBndWVzdC4gVGhlCj4+PiBQSVJRIHdpbGwgYmUg
Y2xlYW5lZCB1cCBmcm9tIHRoZSBkb21haW4ncyBwaXJxX3RyZWUgZHVyaW5nIHRoZSAKPj4+IGRl
c3RydWN0aW9uCj4+PiBpbiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBhbnl3YXlzLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFZhcmFkIEdhdXRhbSA8dnJkQGFtYXpvbi5kZT4KPj4+IENDOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4+Cj4+PiB2MjogU3BsaXQgdGhlIGNoZWNrIG9uIGFjdGlvbi0+bnJfZ3Vl
c3RzID4gMCBhbmQgbWFrZSBpdCBhbiBBU1NFUlQsIAo+Pj4gcmV3b3JkLgo+Pj4gLS0tCj4+PiDC
oCB4ZW4vYXJjaC94ODYvaXJxLmMgfCAxMSArKysrKysrKysrLQo+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2lycS5jIGIveGVuL2FyY2gveDg2L2lycS5jCj4+PiBpbmRleCA1ZDBkOTRj
Li4zZWI3YjIyIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvaXJxLmMKPj4+IEBAIC0xODYzLDcgKzE4NjMsMTYgQEAgc3RhdGljIGlycV9n
dWVzdF9hY3Rpb25fdCAqX19waXJxX2d1ZXN0X3VuYmluZCgKPj4+IMKgIMKgwqDCoMKgwqAgZm9y
ICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVzdHMpICYmIChhY3Rpb24tPmd1ZXN0W2ldICE9
IAo+Pj4gZCk7IGkrKyApCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiAtwqDC
oMKgIEJVR19PTihpID09IGFjdGlvbi0+bnJfZ3Vlc3RzKTsKPj4+ICvCoMKgwqAgaWYgKCBpID09
IGFjdGlvbi0+bnJfZ3Vlc3RzICkgewo+Pgo+PiBUaGUgeyBzaG91bGQgYmUgYSBuZXcgbGluZS4K
Pj4KPj4+ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlQoYWN0aW9uLT5ucl9ndWVzdHMgPiAwKSA7Cj4+
Cj4+IFRoZSBzcGFjZSBiZWZvcmUgOyBpcyBub3QgbmVjZXNzYXJ5Lgo+Pgo+Pj4gK8KgwqDCoMKg
wqDCoMKgIC8qIEluIGNhc2UgdGhlIHBpcnEgd2FzIHNoYXJlZCwgdW5ib3VuZCBmb3IgdGhpcyBk
b21haW4gaW4gCj4+PiBhbiBlYXJsaWVyIGNhbGwsIGJ1dCBzdGlsbAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqAgKiBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3RyZWUsIHdlIHN0aWxsIHJlYWNo
IGhlcmUgaWYgCj4+PiB0aGVyZSBhcmUgYW55IGxhdGVyCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IHVuYmluZCBjYWxscyBvbiB0aGUgc2FtZSBwaXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQg
Cj4+PiBoYXBwZW5zLiAqLwo+Pgo+PiBUaGUgY29kaW5nIHN0eWxlIGZvciBjb21tZW50IGlzOgo+
Pgo+PiAvKgo+PiDCoCogRm9vCj4+IMKgKiBCYXIKPj4gwqAqLwo+Pgo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGlmICggYWN0aW9uLT5zaGFyZWFibGUgKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIE5VTEw7Cj4+PiArwqDCoMKgwqDCoMKgwqAgQlVHKCk7Cj4+Cj4+IEdpdmVuIHRoYXQg
dGhlIHByZXZpb3VzIEJVR19PTigpIHdhcyBoaXQsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gdHJ5
IAo+PiB0byBhdm9pZCBhIG5ldyBCVUcoKS4KPj4KPj4gU28gd2h5IG5vdCBqdXN0IHJldHVybmlu
ZyBOVUxMIGFzIHlvdSBkbyBmb3IgYWN0aW9uLT5zaGFyZWFibGU/Cj4+Cj4gCj4gVGhhbmtzLCBJ
J3ZlIGRvbmUgdGhlIHN0eWxlIGZpeHVwcyBpbiB2My4KPiAKPiBJJ2QgYXJndWUgdGhhdCBpcyBp
bmRlZWQgYSBCVUcsIGlmIHRoZSBwaXJxIHdhcyBfbm90XyBzaGFyZWFibGUgYW5kIHRoZSAKPiBs
b29wIGFib3ZlIGNvdWxkbid0IGZpbmQgYSBtYXRjaGluZyBkb21haW4gZm9yIGl0IC0gdGhhdCBp
bXBsaWVzIHRoZSAKPiBwaXJxIHNob3VsZG4ndCBoYXZlIGV4aXN0ZWQgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKSSBhbSBhZnJhaWQgdGhpcyBpcyBvbmx5IHRlbGxpbmcgbWUgaG93IHRoZSBCVUcoKSBj
b3VsZCBiZSB0cmlnZ2VyZWQgYW5kIApub3Qgd2h5IGEgQlVHKCkgaXMgbW9yZSB3YXJyYW50IHRo
YW4gYW4gQVNTRVJUKCkuCgpBRkFJVSwgdGhlIEJVRygpIGNhbiBvbmx5IGJlIHRyaWdnZXJlZCBp
ZiB0aGVyZSBpcyBhIHByb2dyYW1hdGljIGVycm9yLiAKVGhpcyBpcyBubyBkaWZmZXJlbnQgdGhh
biB5b3VyIEFTU0VSVChhY3Rpb24tPm5yX2d1ZXN0ID4gMCkgeW91IGp1c3QgYWRkZWQuCgpSZWFk
aW5nIHRoZSBzZWN0aW9uICJIYW5kbGluZyB1bmV4cGVjdGVkIGNvbmRpdGlvbnMiIGluIENPRElO
R19TVFlMRSwgaXQgCmZlZWxzIHRvIG1lIHRoZSBCVUcoKSBpcyBub3QgdGhlIGNvcnJlY3QgaGFu
ZGxpbmcgYXMgeW91IGNhbiByZXR1cm4gYW4gCmVycm9yIGhlcmUgYW5kIGl0IHdvdWxkIGNvbnRp
bnVlIGZpbmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
