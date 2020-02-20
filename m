Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B71659B1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:59:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4heN-0007dK-L8; Thu, 20 Feb 2020 08:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWA0=4I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4heL-0007dD-V0
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:57:37 +0000
X-Inumbo-ID: 0a8118e4-53bf-11ea-ade5-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a8118e4-53bf-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 08:57:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j17so32787183edp.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 00:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0V5iDIBZDLeW2oxNy+I0IlSR5G1eUn+Hs/SSQYVp/+w=;
 b=gVgcsyjB0qEZlBxlH91XD8RZmLC/znpOgRN5H8s2LwR+bDDOgPXJ7vRnTzKn2djDTd
 EeafvpFhuh5lXr7Ug+BCNKhvhLQ89qbpxYDIca7KJ7TQ3NpQkXzPwq/DDd9dgd/N1Vxx
 gzKWrvgsU+pqAQzlCgafhxDyefWqEy4w8doGW+9PRW/sRIaDTPgGMTODvIPUJ3vt5AWh
 kuWrjnpwo8XT3sEQE/oF6O6zBpyczf6dG3PbFLB5njmFXfyzLyCegdG9XgFweUelC25M
 cmU8e7dNibgRN6vWq4bYbK2/+PsbL3ln6uHyPyxXrcAJWJHR5edJvvbO50vv9JBwAWel
 /LlQ==
X-Gm-Message-State: APjAAAWk2gHO7L+YBJI7RetEp9FWItXKlexoqeIyuDy0N5f6if6DmzeM
 eBS2k1QxK/3PXQljCiOYv6ztGJKZuPp9ig==
X-Google-Smtp-Source: APXvYqwOfew2aEiJLGyiG1OarZKUBL3Wekqi2T27DgZ71itMoQWEPSyD/6exhW4z8zRPZBfs+pwTYQ==
X-Received: by 2002:a05:6402:603:: with SMTP id
 n3mr27552386edv.257.1582189056045; 
 Thu, 20 Feb 2020 00:57:36 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id e21sm52036eds.36.2020.02.20.00.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 00:57:35 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
 <8abb37bc-e1e8-d9ab-d66e-4c0e9c8f4da3@suse.com>
 <bb1ec887-0b04-20e4-20f4-e45b1e8aa8a3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <560f20f0-db06-e21d-cf8a-cecf4d6cf09b@xen.org>
Date: Thu, 20 Feb 2020 08:57:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bb1ec887-0b04-20e4-20f4-e45b1e8aa8a3@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMC8wMi8yMDIwIDA4OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMC4wMi4yMDIw
IDA5OjI3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMC4wMi4yMCAwOToxMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMy4wMi4yMDIwIDEyOjMyLCBSb2dlciBQYXUgTW9ubmUgd3Jv
dGU6Cj4+Pj4gTW9zdCB1c2VycyBvZiB0aGUgY3B1IG1hcHMganVzdCBjYXJlIGFib3V0IHRoZSBt
YXBzIG5vdCBjaGFuZ2luZyB3aGlsZQo+Pj4+IHRoZSBsb2NrIGlzIGJlaW5nIGhlbGQsIGJ1dCBk
b24ndCBhY3R1YWxseSBtb2RpZnkgdGhlIG1hcHMuCj4+Pj4KPj4+PiBDb252ZXJ0IHRoZSBsb2Nr
IGludG8gYSBydyBsb2NrLCBhbmQgdGFrZSB0aGUgbG9jayBpbiByZWFkIG1vZGUgaW4KPj4+PiBn
ZXRfY3B1X21hcHMgYW5kIGluIHdyaXRlIG1vZGUgaW4gY3B1X2hvdHBsdWdfYmVnaW4uIFRoaXMg
d2lsbCBsb3dlcgo+Pj4+IHRoZSBjb250ZW50aW9uIGFyb3VuZCB0aGUgbG9jaywgc2luY2UgcGx1
ZyBhbmQgdW5wbHVnIG9wZXJhdGlvbnMgdGhhdAo+Pj4+IHRha2UgdGhlIGxvY2sgaW4gd3JpdGUg
bW9kZSBhcmUgbm90IHRoYXQgY29tbW9uLgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IHRoZSByZWFkIGxv
Y2sgY2FuIGJlIHRha2VuIHJlY3Vyc2l2ZWx5IChhcyBpdCdzIGEgc2hhcmVkCj4+Pj4gbG9jayks
IGFuZCBoZW5jZSB3aWxsIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhlIHByZXZpb3VzbHkg
dXNlZAo+Pj4+IHJlY3Vyc2l2ZSBsb2NrLiBBcyBmb3IgdGhlIHdyaXRlIGxvY2ssIGl0J3Mgb25s
eSB1c2VkIGJ5IENQVQo+Pj4+IHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMsIGFuZCB0aGUgbG9jayBp
cyBuZXZlciB0YWtlbiByZWN1cnNpdmVseSBpbgo+Pj4+IHRoYXQgY2FzZS4KPj4+Pgo+Pj4+IFdo
aWxlIHRoZXJlIGFsc28gY2hhbmdlIGdldF9jcHVfbWFwcyByZXR1cm4gdHlwZSB0byBib29sLgo+
Pj4+Cj4+Pj4gUmVwb3J0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pj4g
U3VnZ2VzdGVkLWFsc28tYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+
Cj4+PiBJJ20gYWZyYWlkIEkgY2FuJ3Qgc2VlIGhvdyBvZmZsaW5pbmcgYSBDUFUgd291bGQgbm93
IHdvcmsuCj4+PiBDb25kZW5zZWQgdG8ganVzdCB0aGUgcmVsZXZhbnQgY2FsbHMsIHRoZSBzZXF1
ZW5jZSBmcm9tCj4+PiBjcHVfZG93bigpIGlzCj4+Pgo+Pj4gY3B1X2hvdHBsdWdfYmVnaW4oKSAo
aS5lLiBsb2NrIHRha2VuIGluIHdyaXRlIG1vZGUpCj4+PiBzdG9wX21hY2hpbmVfcnVuKCkKPj4+
IC0+IGdldF9jcHVfbWFwcygpIChsb2NrIHVuYXZhaWxhYmxlIHRvIHJlYWRlcnMpCj4+Cj4+IEkn
dmUgYWxyZWFkeSBwb2ludGVkIHRoYXQgb3V0IGluIGFub3RoZXIgdGhyZWFkLiA6LSkKPiAKPiBP
aCwgSSBkaWRuJ3QgcmVjYWxsLiBPciBlbHNlIEkgd291bGRuJ3QgaGF2ZSBjb21taXR0ZWQgdGhl
Cj4gcGF0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgo+IAo+Pj4gT3RoZXIgdGhhbiByZWN1cnNpdmUg
c3BpbiBsb2NrcywgcncgbG9ja3MgZG9uJ3QgY3VycmVudGx5Cj4+PiBoYXZlIGEgY29uY2VwdCBv
ZiBwZXJtaXR0aW5nIGluIGEgcmVhZGVyIHdoZW4gdGhpcyBDUFUKPj4+IGFscmVhZHkgaG9sZHMg
dGhlIGxvY2sgaW4gd3JpdGUgbW9kZS4gSGVuY2UgSSBjYW4ndCBzZWUKPj4+IGhvdyB0aGUgZ2V0
X2NwdV9tYXBzKCkgYWJvdmUgd291bGQgbm93IGV2ZXIgc3VjY2VlZC4gQW0gSQo+Pj4gbWlzc2lu
ZyBhbnl0aGluZywgb3IgZG9lcyB0aGUgcGF0Y2ggbmVlZCByZXZlcnRpbmcgdW50aWwKPj4+IHRo
ZSByZWFkX3RyeWxvY2soKSBnb3QgZW5oYW5jZWQgdG8gY29wZSB3aXRoIHRoaXM/Cj4+Cj4+IEkg
dGhpbmsgdGhpcyBjYW4gYmUgaGFuZGxlZCBsb2NhbGx5IGluIGdldF9jcHVfbWFwcygpIGFuZAo+
PiBjcHVfaG90cGx1Z19iZWdpbigpIHdpdGggdGhlIHVzZSBvZiBhIHZhcmlhYmxlIGhvbGRpbmcg
dGhlIGNwdSAob3IKPj4gTlJfQ1BVUykgb2YgdGhlIGNwdSBob2xkaW5nIHRoZSB3cml0ZSBsb2Nr
LiBnZXRfY3B1X21hcHMoKSBjYW4ganVzdAo+PiBzdWNjZWVkIGluIGNhc2UgdGhpcyB2YXJpYWJs
ZSBjb250YWlucyBzbXBfcHJvY2Vzc29yX2lkKCkuCj4gCj4gSXQgY291bGQsIHllcy4gQnV0IHRo
aXMgaXMgYSBnZW5lcmFsIHNob3J0Y29taW5nIG9mIG91ciBydwo+IGxvY2sgaW1wbGVtZW50YXRp
b24gKGFuZCBpbW8gYSB0cmFwIHdhaXRpbmcgZm9yIG90aGVycyB0bwo+IGZhbGwgaW50byBhcyB3
ZWxsKSwgYW5kIGhlbmNlIEkgdGhpbmsgaXQgd291bGQgYmV0dGVyIGJlCj4gdGFrZW4gY2FyZSBv
ZiBpbiBhIGdlbmVyaWMgbWFubmVyLgpJIGFjdHVhbGx5IGRpZCBmYWxsIGludG8gdGhpcyB0cmFw
IGxhc3Qgd2VlayB3aGVuIHBsYXlpbmcgd2l0aCB0aGUgcDJtIApjb2RlIGFuZCB0aGUgZW11bGF0
aW9uIGNvZGUuIFRoZSBlbXVsYXRpb24gY29kZSBpcyBncmFiYmluZyB0aGUgd3JpdGUgCmxvY2sg
dmVyeSBlYXJseSAod2hpY2ggSSBkaWRuJ3QgaW5pdGlhbGx5IHNwb3QpIGFuZCBJIHdhcyB0cnlp
bmcgdG8gdXNlIAp0aGUgcmVhZCBsb2NrIGluIGEgc3Vic2VxdWVudCBjYWxsZXIgcXVpdGUgZGVl
cCBpbiB0aGUgc3RhY2suCgpTbyBhIGdlbmVyaWMgbWFubmVyIHRvIHNvbHZlIHRoZSBwcm9ibGVt
IGhlcmUgd291bGQgYmUgaWRlYWwuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
