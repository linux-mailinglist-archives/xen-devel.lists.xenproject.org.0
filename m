Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B113AF56
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:28:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irP1N-0003op-1I; Tue, 14 Jan 2020 16:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irP1L-0003oi-7N
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:26:23 +0000
X-Inumbo-ID: 9528a9e0-36ea-11ea-ac27-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9528a9e0-36ea-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 16:26:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q10so12793702wrm.11
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 08:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PBmurjMJTXIaUvT1vS09qqGW5unt4NIZf6e7soJrTr4=;
 b=LNPPt4SGlqlcF6cs7YvhnLtQJ2gm7Te+jdUZNtfDSlmgvic20QEbDYqF7PQfUtUtyt
 JlGhPWp8mhKu6Hh/ZqTQ7m+rSjTT3boIP3Jk5EXm8fpuJ/lNi/MtyC+LqH3DDWkBZnKg
 ph9fgBS8UJu6SxQIJnapDR5Adq3YhrUsGuTq5B31pvfOD85KhOsyUezjVb6vMwAY/BcX
 bZjsIAqKRb+4xniwOygebPKXyiLIyjHA32nh1ujOSR6QaOArynforBOFr6aNncCvPNhH
 4nAbBoK2zskv7XagPMfk4TIqcH7OKKAbzC68lCo9DihVHLG1Fg+WKpvvX93dThd64ouy
 Am2Q==
X-Gm-Message-State: APjAAAUMfhLFZO9sxfg/FsU6uF0327/8BbVjCrEkzQvUMQhbQ9sXQjIG
 reCrCBgYpa/c9D+kcENjE3w=
X-Google-Smtp-Source: APXvYqzYUVzXCZMg01sNx0W8yVc/dJ50/Pl3xjyrzhB9CdrocUCwyetzN2nhm33tJ5t1uLZpUzTgBw==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr26230302wrm.48.1579019173650; 
 Tue, 14 Jan 2020 08:26:13 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id w8sm602762wmd.2.2020.01.14.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 08:26:13 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-5-julien@xen.org>
 <84e159cc-6615-aa1b-4d7e-3c284958d28a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c2d29bac-9685-c7ae-58a5-6377d29cf0e6@xen.org>
Date: Tue, 14 Jan 2020 16:26:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <84e159cc-6615-aa1b-4d7e-3c284958d28a@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/4] xen/x86: Rework inclusion between
 struct pirq and struct hvm_pirq_dpci
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDEvMjAyMCAxNjowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMu
MDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2lycS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMKPj4gQEAgLTI5LDcgKzI5
LDggQEAKPj4gICAKPj4gICBib29sIGh2bV9kb21haW5fdXNlX3BpcnEoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgY29uc3Qgc3RydWN0IHBpcnEgKnBpcnEpCj4+ICAgewo+PiAtICAgIHJldHVybiBp
c19odm1fZG9tYWluKGQpICYmIHBpcnEgJiYgcGlycS0+YXJjaC5odm0uZW11aXJxICE9IElSUV9V
TkJPVU5EOwo+PiArICAgIHJldHVybiBpc19odm1fZG9tYWluKGQpICYmIHBpcnEgJiYKPj4gKyAg
ICAgICAgY29uc3RfcGlycV9kcGNpKHBpcnEpLT5lbXVpcnEgIT0gSVJRX1VOQk9VTkQ7Cj4+ICAg
fQo+PiAgIAo+PiAgIC8qIE11c3QgYmUgY2FsbGVkIHdpdGggaHZtX2RvbWFpbi0+aXJxX2xvY2sg
aG9sZCAqLwo+PiBAQCAtMzk2LDcgKzM5Nyw3IEBAIGludCBodm1faW5qZWN0X21zaShzdHJ1Y3Qg
ZG9tYWluICpkLCB1aW50NjRfdCBhZGRyLCB1aW50MzJfdCBkYXRhKQo+PiAgICAgICAgICAgICAg
IHN0cnVjdCBwaXJxICppbmZvID0gcGlycV9pbmZvKGQsIHBpcnEpOwo+PiAgIAo+PiAgICAgICAg
ICAgICAgIC8qIGlmIGl0IGlzIHRoZSBmaXJzdCB0aW1lLCBhbGxvY2F0ZSB0aGUgcGlycSAqLwo+
PiAtICAgICAgICAgICAgaWYgKCAhaW5mbyB8fCBpbmZvLT5hcmNoLmh2bS5lbXVpcnEgPT0gSVJR
X1VOQk9VTkQgKQo+PiArICAgICAgICAgICAgaWYgKCAhaW5mbyB8fCBwaXJxX2RwY2koaW5mbykt
PmVtdWlycSA9PSBJUlFfVU5CT1VORCApCj4+ICAgICAgICAgICAgICAgewo+PiAgICAgICAgICAg
ICAgICAgICBpbnQgcmM7Cj4+ICAgCj4+IEBAIC00MDksNyArNDEwLDcgQEAgaW50IGh2bV9pbmpl
Y3RfbXNpKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IGFkZHIsIHVpbnQzMl90IGRhdGEpCj4+
ICAgICAgICAgICAgICAgICAgIGlmICggIWluZm8gKQo+PiAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FQlVTWTsKPj4gICAgICAgICAgICAgICB9Cj4+IC0gICAgICAgICAgICBlbHNlIGlm
ICggaW5mby0+YXJjaC5odm0uZW11aXJxICE9IElSUV9NU0lfRU1VICkKPj4gKyAgICAgICAgICAg
IGVsc2UgaWYgKCBwaXJxX2RwY2koaW5mbyktPmVtdWlycSAhPSBJUlFfTVNJX0VNVSApCj4+ICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAgICAgICAgICAgICAgIHNlbmRfZ3Vl
c3RfcGlycShkLCBpbmZvKTsKPj4gICAgICAgICAgICAgICByZXR1cm4gMDsKPiAKPiBBbGwgb2Yg
dGhlc2UgdXNlcyAoYW5kIG90aGVycyBmdXJ0aGVyIGRvd24pIG1ha2UgcHJldHR5IGNsZWFyCj4g
dGhhdCB0aGUgZW11aXJxIGZpZWxkIGRvZXNuJ3QgYmVsb25nIGluIHRoZSBzdHJ1Y3R1cmUgeW91
IHB1dCBpdAo+IGluIC0gdGhlICdkJyBpbiBkcGNpIHN0YW5kcyBmb3IgImRpcmVjdCIgYWZhaWss
IGFuZCB0aGUgZmllbGQgaXMKPiBmb3IgYSBjZXJ0YWluIHZhcmlhbnQgb2YgZW11bGF0aW9uIG9m
IGludGVycnVwdCBkZWxpdmVyeSBpbnRvCj4gZ3Vlc3RzLCBpLmUuIG5vdCByZWFsbHkgcGFzcy10
aHJvdWdoIGZvY3VzZWQgYXQgYWxsLgoKSSBhbSBoYXBweSB0byBrZWVwIGVtdWlycSBpbiBzdHJ1
Y3QgcGlycSBpZiB5b3UgYXJlIGhhcHB5IHdpdGggc2xpZ2h0bHkgCmluY3JlYXNpbmcgdGhlIHNp
emUgYWxsb2NhdGVkIG9uIFBWLgoKVGhlIG1haW4gdGhpbmcgSSB3YW50IHRvIGdldCByaWQgb2Yg
aXMgdGhlIHdlaXJkIGFsbG9jYXRpb24gc2l6ZSB3ZSBkbyAKdG9kYXkuCgo+IAo+PiBAQCAtMTcx
LDggKzE3MiwyNiBAQCBzdHJ1Y3QgaHZtX3BpcnFfZHBjaSB7Cj4+ICAgICAgIHN0cnVjdCBodm1f
Z21zaV9pbmZvIGdtc2k7Cj4+ICAgICAgIHN0cnVjdCB0aW1lciB0aW1lcjsKPj4gICAgICAgc3Ry
dWN0IGxpc3RfaGVhZCBzb2Z0aXJxX2xpc3Q7Cj4+ICsgICAgaW50IGVtdWlycTsKPj4gKyAgICBz
dHJ1Y3QgcGlycSBwaXJxOwo+PiAgIH07Cj4+ICAgCj4+ICsjZGVmaW5lIHBpcnFfZHBjaShwKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgKChwKSA/IGNvbnRhaW5lcl9vZihwLCBzdHJ1Y3QgaHZtX3BpcnFfZHBjaSwgcGlycSkgOiBO
VUxMKQo+PiArI2RlZmluZSBjb25zdF9waXJxX2RwY2kocCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICgocCkgPyBjb250YWluZXJfb2YocCwg
Y29uc3Qgc3RydWN0IGh2bV9waXJxX2RwY2ksIHBpcnEpIDogTlVMTCkKPj4gKwo+PiArI2RlZmlu
ZSBkcGNpX3BpcnEocGQpICgmKHBkKS0+cGlycSkKPj4gKwo+PiArI2RlZmluZSBkb21haW5fcGly
cV90b19lbXVpcnEoZCwgcCkgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
PiArICAgIHN0cnVjdCBwaXJxICpfX3BpID0gcGlycV9pbmZvKGQsIHApOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiArICAgIF9fcGkgPyBwaXJxX2RwY2koX19waSktPmVtdWly
cSA6IElSUV9VTkJPVU5EOyAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArfSkKPj4gKyNkZWZp
bmUgZG9tYWluX2VtdWlycV90b19waXJxKGQsIGVtdWlycSkgKHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICB2b2lkICpfX3JldCA9IHJhZGl4X3RyZWVfbG9va3VwKCYoZCkt
PmFyY2guaHZtLmVtdWlycV9waXJxLCBlbXVpcnEpO1wKPj4gKyAgICBfX3JldCA/IHJhZGl4X3Ry
ZWVfcHRyX3RvX2ludChfX3JldCkgOiBJUlFfVU5CT1VORDsgICAgICAgICAgICAgICAgIFwKPj4g
K30pCj4gCj4gV2hpbGUgZm9yIHRoZSBsYXR0ZXIgeW91IG1lcmVseSBtb3ZlIHRoZSBib2d1cyBk
b3VibGUtbGVhZGluZy0KPiB1bmRlcnNjb3JlIG1hY3JvIGxvY2FsIHZhcmlhYmxlICh3aGljaCBv
biB0aGlzIG9jY2FzaW9uIEknZAo+IGxpa2UgdG8gYXNrIGFueXdheSB0byBiZSBjaGFuZ2VkKSwg
eW91IGFjdGl2ZWx5IGludHJvZHVjZSBhCj4gbmV3IHNpbWlsYXIgbmFtZSBzcGFjZSB2aW9sYXRp
b24gaW4gdGhlIGRvbWFpbl9waXJxX3RvX2VtdWlycSgpLgoKQUZBSUssIHRoZXJlIGlzIG5vdGhp
bmcgaW4gdGhlIGNvZGluZyBzdHlsZSBmb3JiaWRkaW5nIHlvdXIgImJvZ3VzIiAKbmFtaW5nLiBT
byBJIGp1c3QgZm9sbG93ZWQgdGhlIHJlc3Qgb2YgdGhlIGNvZGUuCgo+IAo+PiBAQCAtMTMzLDE3
ICsxMzIsMTAgQEAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgaXJxX2NvdW50KTsKPj4g
ICAKPj4gICBzdHJ1Y3QgYXJjaF9waXJxIHsKPj4gICAgICAgaW50IGlycTsKPj4gLSAgICB1bmlv
biB7Cj4+IC0gICAgICAgIHN0cnVjdCBodm1fcGlycSB7Cj4+IC0gICAgICAgICAgICBpbnQgZW11
aXJxOwo+PiAtICAgICAgICAgICAgc3RydWN0IGh2bV9waXJxX2RwY2kgZHBjaTsKPj4gLSAgICAg
ICAgfSBodm07Cj4+IC0gICAgfTsKPj4gKyAgICAvKiBJcyB0aGUgUElSUSBhc3NvY2lhdGVkIHRv
IGFuIEhWTSBkb21haW4/ICovCj4+ICsgICAgYm9vbCBodm07Cj4gCj4gSXQgbG9va3MgbGlrZSB0
aGlzIGZpZWxkIGlzIG5lZWRlZCBmb3Igb25seSBhcmNoX2ZyZWVfcGlycV9zdHJ1Y3QoKS4KPiBB
cyBpdCdsbCBtYWtlIGEgZGlmZmVyZW5jZSB0byBzdHJ1Y3QgcGlycSdzIHNpemUsIGNhbiB5b3Ug
bm90IGdldAo+IGF3YXkgd2l0aG91dCBpdD8gQWxsIChwZXJoYXBzIGluZGlyZWN0KSBjYWxsZXJz
IG9mIHRoZSBmdW5jdGlvbgo+IGtub3cgdGhlIGRvbWFpbiwgYWZ0ZXIgYWxsLgoKVGhlIGZyZWUg
aXMgZG9uZSB0aHJvdWdoIGFuIFJDVSBjYWxsYmFjayB3aXRoIG5vIGV4dHJhIHBhcmFtZXRlcnMg
dG8gCnRlbGwgaG93IGl0IGNhbiBiZSBmcmVlZC4KClRoZSBvbmx5IHdheSBJIGNhbiB0aGluayBv
ZiB0byBnZXQgcmlkIG9mIHRoZSBmaWVsZCBpcyB0byBpbnRyb2R1Y2UgdHdvIApkaWZmZXJlbnQg
Y2FsbGJhY2sgZm9yIHRoZSBmcmVlLiBXZSB3b3VsZCB1c2UgYSBkaWZmZXJlbnQgY2FsbGJhY2sg
CmRlcGVuZGluZyBvbiB0aGUgZG9tYWluIHR5cGUuCgpIb3cgZG9lcyB0aGF0IHNvdW5kPwoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
