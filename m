Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06013DD14
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 15:11:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is5o3-0005VL-Vk; Thu, 16 Jan 2020 14:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pBP5=3F=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1is5o2-0005V9-6E
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 14:07:30 +0000
X-Inumbo-ID: 87a774ce-3869-11ea-ac27-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87a774ce-3869-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 14:07:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so19270880wro.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13iQI1lo79HXue/YaQE60MCZnhvpoMnL5spNX/3YvMI=;
 b=KYeKw7vDMt1qC2oXWTMhDa7U0xDq0lWa8lyra2WHzhvC49IsLN0W3PRMDfeC/HzBme
 9gMsO5kcxUE3RaEPqwnl6F5nKm9sIVDcNPI9z1uzbtHmcg8tfn6nsx/cCF4dHUdEawcw
 a8ev3EK8ickrF0FTL5F91M8VzH2bMViOq+hk1XpD1tWlRSAFR/EZFRc0yMpekX0cPKRk
 fDvHLILu2tMfFV5VX2MjyibSowb0WYpp2c1hcddUT07KufNJZB/RgafhbXWClPmTHRo9
 /AHJawcqr4OQuiJ1emmEAEDF/cq1kbFJy2n0YFar+emr3bdmcIIgV7XLIgzkqVfkqEAd
 f0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13iQI1lo79HXue/YaQE60MCZnhvpoMnL5spNX/3YvMI=;
 b=DqMCCGqjcJCdmTt+JWzAHiQCCvhjZLYpmVIS3I0VfcrRON5COw1/PgC4A3L/MJ8MCf
 6F95FFY6Rkcg1rU98VLXsHYGKSJtxTHn7nwdaqT+pE//L3agjNfa6wEatmUzzcTd24us
 7Mz49S50qFRLUGp9jlb2Cbd13HRPiCUN4lqb/j9UP83ihLpkI7tfM06LHkc+Siew4OT5
 KPZ3uVdo9EIgxglGF0xQZ1N1w/e2FKX16FynQnPxAcCv33JkWsfK6RS8NryL52TTEonw
 M8Vm1bUc8xLIUtpfJhAMv/jsh+/ZuX7frXbC/HIrpIFXx6N6Dxr406wp0trRQ/Dh3WqS
 MDuw==
X-Gm-Message-State: APjAAAVoKCfR2x80kyMlukUTVDjJzGgsR4GMXq2yYorRHrdDe13WVPT1
 LMw69uDinWuxwEZtjC95NlqydwrLbiOOuJUtEQw=
X-Google-Smtp-Source: APXvYqyTnBB1UB9TZ0T+3rmf+SdhlQZidlFTcODkjMJ2o/gUBV5QCeSB8b8DQN3ejzSK9RGBMvuFOkM/7r/aiogh32Q=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr3353612wre.372.1579183648178; 
 Thu, 16 Jan 2020 06:07:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b1d48d7dd680041709d5fc4ca2562560690c8db4.1578503483.git.tamas.lengyel@intel.com>
 <e99f9fea-3173-83c8-110f-a7d5d72d2961@suse.com>
In-Reply-To: <e99f9fea-3173-83c8-110f-a7d5d72d2961@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 16 Jan 2020 07:06:51 -0700
Message-ID: <CABfawhmFHic1xHOJLNP9ScyLoqi8Wc2kaKqzoAKjGmovgmtfjw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 01/18] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgNToyOCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxMywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQEAgLTQxMjksNDkgKzQxMzAsMzIgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0
X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4gPiAgICAgIHJldHVybiByYzsKPiA+ICB9Cj4gPgo+
ID4gLXN0YXRpYyBpbnQgaHZtb3Bfc2V0X3BhcmFtKAo+ID4gLSAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9odm1fcGFyYW1fdCkgYXJnKQo+ID4gK3N0YXRpYyBpbnQgaHZtX3NldF9wYXJh
bShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgdmFsdWUpCj4gPiAg
ewo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpjdXJyX2QgPSBjdXJyZW50LT5kb21haW47Cj4gPiAt
ICAgIHN0cnVjdCB4ZW5faHZtX3BhcmFtIGE7Cj4gPiAtICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4g
PiAtICAgIHN0cnVjdCB2Y3B1ICp2Owo+ID4gICAgICBpbnQgcmM7Cj4gPiArICAgIHN0cnVjdCB2
Y3B1ICp2Owo+Cj4gTml0OiBQZXJzb25hbGx5IEknZCBwcmVmZXIgaWYgInJjIiByZW1haW5lZCBs
YXN0Lgo+Cj4gPiAraW50IGh2bW9wX3NldF9wYXJhbSgKPiA+ICsgICAgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh4ZW5faHZtX3BhcmFtX3QpIGFyZykKPiA+ICt7Cj4gPiArICAgIHN0cnVjdCB4ZW5f
aHZtX3BhcmFtIGE7Cj4gPiArICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4gPiArICAgIGludCByYzsK
PiA+ICsKPiA+ICsgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+ID4gKyAg
ICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCj4gPiArICAgIGlmICggYS5pbmRleCA+PSBIVk1f
TlJfUEFSQU1TICkKPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAv
KiBNYWtlIHN1cmUgdGhlIGFib3ZlIGJvdW5kIGNoZWNrIGlzIG5vdCBieXBhc3NlZCBkdXJpbmcg
c3BlY3VsYXRpb24uICovCj4gPiArICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7Cj4gPiArCj4gPiAr
ICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwo+ID4gKyAgICBpZiAo
IGQgPT0gTlVMTCApCj4gPiArICAgICAgICByZXR1cm4gLUVTUkNIOwo+ID4gKwo+ID4gKyAgICBy
YyA9IC1FSU5WQUw7Cj4gPiArICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgKQo+ID4gKyAgICAg
ICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgIHJjID0gaHZtX3NldF9wYXJhbShkLCBhLmluZGV4
LCBhLnZhbHVlKTsKPgo+IFdpdGgKPgo+ICAgICByYyA9IC1FSU5WQUw7Cj4gICAgIGlmICggaXNf
aHZtX2RvbWFpbihkKSApCj4gICAgICAgICByYyA9IGh2bV9zZXRfcGFyYW0oZCwgYS5pbmRleCwg
YS52YWx1ZSk7Cj4KPiB0aGUgZnVuY3Rpb24gd291bGRuJ3QgbmVlZCBhbiAib3V0IiBsYWJlbCAo
YW5kIGhlbmNlIGFueSBnb3RvKQo+IGFueW1vcmUuIEkga25vdyBvdGhlcnMgYXJlIGxlc3MgcGlj
a3kgYWJvdXQgZ290by1zIHRoYW4gbWUsIGJ1dAo+IEkgdGhpbmsgaW4gY2FzZXMgd2hlcmUgaXQn
cyBlYXN5IHRvIGF2b2lkIHRoZW0gdGhleSB3b3VsZCBiZXR0ZXIKPiBiZSBhdm9pZGVkLgo+Cj4g
PiBAQCAtNDQwMCw2ICs0NDE0LDQzIEBAIHN0YXRpYyBpbnQgaHZtX2FsbG93X2dldF9wYXJhbShz
dHJ1Y3QgZG9tYWluICpkLAo+ID4gICAgICByZXR1cm4gcmM7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgaW50IGh2bV9nZXRfcGFyYW0oc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgaW5kZXgsIHVp
bnQ2NF90ICp2YWx1ZSkKPiA+ICt7Cj4gPiArICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgaWYg
KCBpbmRleCA+PSBIVk1fTlJfUEFSQU1TIHx8ICF2YWx1ZSApCj4gPiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPgo+IEkgZG9uJ3QgdGhpbmsgdGhlIHJhbmdlIGNoZWNrIGlzIG5lZWRlZCBoZXJl
OiBJdCdzIHJlZHVuZGFudCB3aXRoCj4gdGhhdCBpbiBodm1vcF9nZXRfcGFyYW0oKSBhbmQgcG9p
bnRsZXNzIGZvciB0aGUgbmV3IGZ1bmN0aW9uIHlvdQo+IGFkZC4gKFNhbWUgZm9yICJzZXQiIHRo
ZW4sIGJ1dCBJIG5vdGljZWQgaXQgaGVyZSBmaXJzdC4pIEkgYWxzbwo+IGRvbid0IHRoaW5rIHZh
bHVlIG5lZWRzIGNoZWNraW5nIGFnYWluc3QgTlVMTCBpbiBhIGNhc2UgbGlrZSB0aGlzCj4gb25l
ICh3ZSBkb24ndCB0eXBpY2FsbHkgZG8gc28gZWxzZXdoZXJlIGluIHNpbWlsYXIgc2l0dWF0aW9u
cykuCj4KPiA+IEBAIC01MjY2LDYgKzUyOTQsMzcgQEAgdm9pZCBodm1fc2V0X3NlZ21lbnRfcmVn
aXN0ZXIoc3RydWN0IHZjcHUgKnYsIGVudW0geDg2X3NlZ21lbnQgc2VnLAo+ID4gICAgICBhbHRl
cm5hdGl2ZV92Y2FsbChodm1fZnVuY3Muc2V0X3NlZ21lbnRfcmVnaXN0ZXIsIHYsIHNlZywgcmVn
KTsKPiA+ICB9Cj4gPgo+ID4gK2ludCBodm1fY29weV9jb250ZXh0X2FuZF9wYXJhbXMoc3RydWN0
IGRvbWFpbiAqc3JjLCBzdHJ1Y3QgZG9tYWluICpkc3QpCj4KPiBGb2xsb3dpbmcgbWVtY3B5KCkg
YW5kIGFsaWtlLCBwZXJoYXBzIGJldHRlciB0byBoYXZlIGRzdCBmaXJzdCBhbmQKPiBzcmMgc2Vj
b25kPwo+Cj4gPiArewo+ID4gKyAgICBpbnQgcmMsIGk7Cj4KPiB1bnNpZ25lZCBpbnQgZm9yIGkg
cGxlYXNlLgo+Cj4gPiArICAgIHN0cnVjdCBodm1fZG9tYWluX2NvbnRleHQgYyA9IHsgfTsKPiA+
ICsKPiA+ICsgICAgYy5zaXplID0gaHZtX3NhdmVfc2l6ZShzcmMpOwo+Cj4gUHV0IGluIHRoZSB2
YXJpYWJsZSdzIGluaXRpYWxpemVyPwo+Cj4gPiArICAgIGlmICggKGMuZGF0YSA9IHhtYWxsb2Nf
Ynl0ZXMoYy5zaXplKSkgPT0gTlVMTCApCj4KPiBIb3cgbGlrZWx5IGlzIGl0IGZvciB0aGlzIHRv
IGJlIG1vcmUgdGhhbiBhIHBhZ2UncyB3b3J0aCBvZiBzcGFjZT8KPiBJT1cgd291bGRuJ3QgaXQg
YmUgYmV0dGVyIHRvIHVzZSB2bWFsbG9jKCkgaGVyZSByaWdodCBhd2F5LCBldmVuIGlmCj4gcmln
aHQgbm93IHRoaXMgbWF5IHN0aWxsIGZpdCBpbiBhIHBhZ2UgKHdoaWNoIEknbSBub3Qgc3VyZSBp
dCBkb2VzKT8KCkknbSBub3Qgc3VyZSB3aGF0IHRoZSBzaXplIGlzIG5vcm1hbGx5LCBuZXZlciBj
aGVja2VkLgoKPgo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgIGZv
ciAoIGkgPSAwOyBpIDwgSFZNX05SX1BBUkFNUzsgaSsrICkKPiA+ICsgICAgewo+ID4gKyAgICAg
ICAgdWludDY0X3QgdmFsdWUgPSAwOwo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCBodm1fZ2V0X3Bh
cmFtKHNyYywgaSwgJnZhbHVlKSB8fCAhdmFsdWUgKQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVl
Owo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCAocmMgPSBodm1fc2V0X3BhcmFtKGRzdCwgaSwgdmFs
dWUpKSApCj4gPiArICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsg
ICAgaWYgKCAocmMgPSBodm1fc2F2ZShzcmMsICZjKSkgKQo+ID4gKyAgICAgICAgZ290byBvdXQ7
Cj4KPiBCZXR0ZXIgZG8gdGhpcyBhaGVhZCBvZiB0aGUgbG9vcD8gVGhlcmUncyBubyBwb2ludCBp
biBmaWRkbGluZyB3aXRoCj4gZHN0IGlmIHRoaXMgZmFpbHMsIEkgd291bGQgdGhpbmsuCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcsIEkgZG9uJ3QgaGF2ZSBhbnkgb2JqZWN0aW9ucyB0byB0aGUgdGhp
bmdzIHlvdQpwb2ludGVkIG91dC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
