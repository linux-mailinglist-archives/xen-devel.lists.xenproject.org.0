Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92857F0F4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTuf-0008H1-Vz; Fri, 02 Aug 2019 09:31:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htTud-0008Gv-Sm
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:31:47 +0000
X-Inumbo-ID: 575857c8-b508-11e9-927d-6f43046e20b6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 575857c8-b508-11e9-927d-6f43046e20b6;
 Fri, 02 Aug 2019 09:31:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF64B344;
 Fri,  2 Aug 2019 02:31:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E31D3F575;
 Fri,  2 Aug 2019 02:31:43 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
 <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
 <5e9ddd34-30d4-118a-ed76-89a11e3c7adf@gmail.com>
 <3c42f553-7030-2dd4-cb85-319bd81495ff@suse.com>
 <0ba3a0e9-1e22-660d-7978-c4857f3c0dc4@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5b00ced5-e0c2-6d64-7b72-f3cf8af5e08a@arm.com>
Date: Fri, 2 Aug 2019 10:31:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ba3a0e9-1e22-660d-7978-c4857f3c0dc4@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMDEvMDgvMjAxOSAxOTo0MCwgT2xla3NhbmRyIHdyb3RlOgo+IAo+
IE9uIDAxLjA4LjE5IDE4OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMDguMjAxOSAx
Njo1NCwgT2xla3NhbmRyIHdyb3RlOgo+Pj4gT24gMDEuMDguMTkgMTc6MzQsIEphbiBCZXVsaWNo
IHdyb3RlOgo+Pj4+IE9uIDAxLjA4LjIwMTkgMTY6MzEsIE9sZWtzYW5kciB3cm90ZToKPj4+Pj4g
wqDCoCDCoFRoaXMgaXMgbmVlZGVkIGZvciB0aGUgdXBjb21pbmcgVjIgb2YgdGhlIElQTU1VIGRy
aXZlciAoQVJNKSBbMV0gd2hpY2ggCj4+Pj4+IG1heSByZXF1ZXN0Cj4+Pj4+IMKgwqAgwqBkZWZl
cnJlZCBwcm9iaW5nIChyZXR1cm5zIC1FUFJPQkVfREVGRVIpIGRlcGVuZGluZyBvbiB3aGF0IGRl
dmljZSB3aWxsIAo+Pj4+PiBiZSBwcm9iZWQgdGhlIGZpcnN0Cj4+Pj4+IMKgwqAgwqAoUm9vdCBk
ZXZpY2UgbXVzdCBiZSByZWdpc3RlcmVkIGJlZm9yZSBDYWNoZSBkZXZpY2VzLiBJZiBub3QgdGhl
IGNhc2UsCj4+Pj4+IMKgwqAgwqBkcml2ZXIgd2lsbCBkZW55IGZ1cnRoZXIgQ2FjaGUgZGV2aWNl
IHByb2JlcyB1bnRpbCBSb290IGRldmljZSBpcyAKPj4+Pj4gcmVnaXN0ZXJlZCkuCj4+Pj4+Cj4+
Pj4+IEFzIHdlIGNhbid0IGd1YXJhbnRlZSBhIGZpeGVkIHByZS1kZWZpbmVkIG9yZGVyIGZvciB0
aGUgZGV2aWNlIG5vZGVzIGluIERULCAKPj4+Pj4gd2UgbmVlZCB0byBiZSByZWFkeSBmb3IgdGhl
IHNpdHVhdGlvbiB3aGVyZSBkZXZpY2VzIGJlaW5nIHByb2JlZAo+Pj4+PiBpbiAiYW55IiBvcmRl
ci4gU28sIGZyYW1ld29yayAoZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYykgd2lsbCBi
ZSAKPj4+Pj4gbW9kaWZpZWQgYSBiaXQgdG8gYmUgYWJsZSB0byBoYW5kbGUgLUVQUk9CRV9ERUZF
UiByZXR1cm5pbmcgYnkgZHJpdmVyLgo+Pj4+IEknbSBzdXJlIHRoaXMgY2FuIGJlIGhhZCB3aXRo
b3V0IGludHJvZHVjaW5nIGEgbmV3IGVycm9yIGNvZGUuCj4+PiBCeSByZXVzaW5nIGV4aXN0aW5n
IG9uZSAoRUFHQUlOIGNvbWVzIHRvIG1pbmQpPwo+PiBGb3IgZXhhbXBsZS4gT3IgYnkgdXNpbmcg
c29tZSBwb3NpdGl2ZSB2YWx1ZSBpbnN0ZWFkIG9mIHRoZSAobmVnYXRpdmUpCj4+IGVycm5vLmgg
b25lcy4KPiAKPiBBY3R1YWxseSwgd2h5IG5vdD8gVGhhbmsgeW91Lgo+IAo+IFdlIGNvdWxkIGZp
bmQgY29tbW9uIGdyb3VuZCBvbiB3aGF0IGRyaXZlcidzIGluaXQgY2FsbGJhY2sgc2hvdWxkIHJl
dHVybiBpZiAKPiBkcml2ZXIgd2FudHMgdG8gcmVxdWVzdCBkZWZlcnJlZCBwcm9iaW5nIGFuZCBk
b2N1bWVudCB0aGlzIGJlaGF2aW9yIGluIAo+IGRldmljZV9pbml0IHVzYWdlLgo+IEkgd291bGQg
dXNlIEVBR0FJTiwgYnV0IEkgYW0gb3BlbiB0byBvdGhlciBvcHRpb25zIGhlcmUuCj4gCj4gSnVs
aWVuLCB3aGF0IGRvIHlvdSB0aGluaz8KCkkgZG9uJ3QgaGF2ZSBhbnkgcGFydGljdWxhciBvcGlu
aW9uIGFzIGxvbmcgYXMgdGhlIGVycm5vIGNhbm5vdCBiZSB1c2VkIGZvciAKc29tZXRoaW5nIGVs
c2UgaW4gdGhhdCBjb2RlIHBhdGguCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
