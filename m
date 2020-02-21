Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52486168060
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:35:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Lv-0001hh-Pz; Fri, 21 Feb 2020 14:32:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j59Lt-0001hS-Mv
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:32:25 +0000
X-Inumbo-ID: fa22a8fc-54b6-11ea-aa99-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa22a8fc-54b6-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 14:32:25 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v28so2546581edw.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O+wuKbJR1QFIWy3h2vj/J2U2LfhQC3R2TfxLdiCTz8w=;
 b=PAxETLNhD5O41anZIRynthhShSpbjbmo1eYajGBqCe9lz6xRY6K+OvbPt90F0WjzoU
 gXTJp2fSMQc+1HvrxNYJWJykoYW6Lns8PsNjXCUywbbBvqAVZ/bSAY2/ORP0gfAqPNqQ
 wmjbMDLgljSmJ1sOmbzXqsz24WwEw4e3RiEqY8JG05ukcSMeKHP3KGSnob23iyejRKKb
 jpnhW3to54f+sD3sHB+pMzhaqlThiQAo0oTtUmhvMbhPrMByrpoatPs8W0rEMKbWG5yp
 tCw5dMKLjTljOckvwGi3zfUluvJDTgXXrh5Lk7bhP/VVu/N4AVdEeKtmlNnq5LmQfN9n
 kKoQ==
X-Gm-Message-State: APjAAAVujLaYeDUHCrJbtL6Cz4avDBbYtdfX13/qfQjEzsrzpCNGF86I
 z31mOmWpRNhTzeHkmIc0onK4xyUVcf+LaQ==
X-Google-Smtp-Source: APXvYqyXaB4c9NCDgVT7O+Wvk/30ChMHL+keIzs7zB7Nb1sQyJuZ//N+mNOgloKJ+MbJyLESb1P+7A==
X-Received: by 2002:aa7:cc86:: with SMTP id p6mr3206508edt.58.1582295543866;
 Fri, 21 Feb 2020 06:32:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id b17sm334768edt.5.2020.02.21.06.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:32:23 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
Date: Fri, 21 Feb 2020 14:32:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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

CgpPbiAyMS8wMi8yMDIwIDE0OjE2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIxLjAyLjIw
IDE1OjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEp1ZXJnZW4sCj4+Cj4+IE9uIDIxLzAy
LzIwMjAgMTQ6MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+PiBPbiAyMS4wMi4yMCAxNDozNiwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+Pj4+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIwLzAyLzIw
MjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+Pj4+IEFsbG93IGEgQ1BVIGFs
cmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRvIGFsc28gbG9jayAKPj4+Pj4+
Pj4+IGl0IGluCj4+Pj4+Pj4+PiByZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2lu
ZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgCj4+Pj4+Pj4+PiB0aGF0J3MKPj4+Pj4+Pj4+IGFscmVh
ZHkgb3duZWQgYnkgdGhlIGNhbGxlciAoaWU6IENQVSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcg
c3VjaAo+Pj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUg
bWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJbiBvcmRlciB0byBkbyB0aGlzIHJl
c2VydmUgMTRiaXRzIG9mIHRoZSBsb2NrLCB0aGlzIGFsbG93cyB0byAKPj4+Pj4+Pj4+IHN1cHBv
cnQKPj4+Pj4+Pj4+IHVwIHRvIDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2Nr
IG1hc2sgdG8gMiBiaXRzOiAKPj4+Pj4+Pj4+IG9uZSB0bwo+Pj4+Pj4+Pj4gc2lnbmFsIHRoZXJl
IGFyZSBwZW5kaW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIAo+Pj4+Pj4+
Pj4gb3RoZXIgdG8KPj4+Pj4+Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBt
b2RlLiBOb3RlIHRoZSB3cml0ZSByZWxhdGVkIAo+Pj4+Pj4+Pj4gZGF0YQo+Pj4+Pj4+Pj4gaXMg
dXNpbmcgMTZiaXRzLCB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjbGVhciBp
dCAoYW5kCj4+Pj4+Pj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2spIHVzaW5nIGEgMTZiaXQgYXRv
bWljIHdyaXRlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoaXMgcmVkdWNlcyB0aGUgbWF4aW11bSBu
dW1iZXIgb2YgY29uY3VycmVudCByZWFkZXJzIGZyb20gCj4+Pj4+Pj4+PiAxNjc3NzIxNiB0bwo+
Pj4+Pj4+Pj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBl
bHNlIHRoZSBsb2NrIGZpZWxkCj4+Pj4+Pj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0byA2
NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCAKPj4+Pj4+Pj4+IGF0b21pYwo+Pj4+
Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gRldJ
VywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJpdCAK
Pj4+Pj4+Pj4gaW50ZWdlcnMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUg
dm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+Pj4gwqDCoCB7Cj4+Pj4+
Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4+PiAtwqDCoMKgwqAgKiBJZiB0aGUgd3JpdGVyIGZpZWxk
IGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuCj4+Pj4+Pj4+PiAtwqDCoMKg
wqAgKiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xl
YXIgaXQuCj4+Pj4+Pj4+PiAtwqDCoMKgwqAgKi8KPj4+Pj4+Pj4+IC3CoMKgwqAgYXRvbWljX3N1
YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7Cj4+Pj4+Pj4+PiArwqDCoMKgIC8qIFNpbmNlIHRo
ZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCAKPj4+Pj4+Pj4+IGRp
cmVjdGx5LiAqLwo+Pj4+Pj4+Pj4gK8KgwqDCoCBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9t
ZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+Pj4+ICvCoMKgwqAgQlVJTERfQlVH
X09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+Pj4+PiArwqDCoMKgIHdyaXRlX2F0b21pYygodWlu
dDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBp
cyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50byBhIAo+Pj4+Pj4+
PiB1aW50MTZfdC4gWW91Cj4+Pj4+Pj4+IHdvdWxkIGF0IGxlYXN0IHdhbnQgdG8gdXNlICZsb2Nr
LT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFN1cmUsIEkgd2FzIHdvbmRlcmlu
ZyBhYm91dCB0aGlzIG15c2VsZi4KPj4+Pj4+Pgo+Pj4+Pj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBj
b21tZW50cywgbm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4+Pj4+Pj4g
Y29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4+Pgo+Pj4+Pj4gSXQncyBt
b3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0
IGxpa2UKPj4+Pj4+IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0
cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+Pj4+PiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwg
aW50by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UKPj4+Pj4+IGEgYnVpbGQg
ZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIGl0
IHdhcwo+Pj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4+Pgo+Pj4+PiBXb3VsZG4ndCBhIHVuaW9u
IGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4+Cj4+Pj4gWW91IHdvdWxkIG5vdCBiZSBhYmxlIHRv
IHVzZSBhdG9taWNfdCBpbiB0aGF0IGNhc2UgYXMgeW91IGNhbid0IAo+Pj4+IGFzc3VtZSB0aGUg
bGF5b3V0IG9mIHRoZSBzdHJ1Y3R1cmUuCj4+Pgo+Pj4gdW5pb24gcndsb2Nrd29yZCB7Cj4+PiDC
oMKgwqDCoCBhdG9taWNfdCBjbnRzOwo+Pj4gwqDCoMKgwqAgdWludDMyX3QgdmFsOwo+Pj4gwqDC
oMKgwqAgc3RydWN0IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3Qgd3JpdGU7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHJlYWRlcnM7Cj4+PiDCoMKgwqDCoCB9Owo+Pj4gfTsK
Pj4+Cj4+PiBzdGF0aWMgaW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+Pj4gwqDCoMKg
wqAgY29uc3QgdW5pb24gcndsb2Nrd29yZCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIC53cml0ZSA9
IDAsCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5yZWFkZXJzID0gMQo+Pj4gwqDCoMKgwqAgfSB4Owo+
Pj4KPj4+IMKgwqDCoMKgIHJldHVybiB4LnZhbDsKPj4+IH0KPj4+Cj4+PiAuLi4KPj4+IMKgwqDC
oMKgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJfYmlhcygpLCAmbG9jay0+Y250cyk7Cj4+
PiAuLi4KPj4+Cj4+PiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4+Cj4+
IFlvdSBhcmUgYXNzdW1pbmcgdGhlIGF0b21pY190IGxheW91dCB3aGljaCBJIHdvdWxkIHJhdGhl
ciBubyB3YW50IHRvIAo+PiBoYXBwZW4uCj4gCj4gVGhhdCBhbHJlYWR5IGhhcHBlbmVkLiByd2xv
Y2suaCBhbHJlYWR5IGFzc3VtZXMgYXRvbWljX3QgdG8gYmUgMzIgYml0cwo+IHdpZGUuIEkgYWdy
ZWUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgYW4gYXRvbWljMzJfdCB0eXBlIGZvciB0aGlz
Cj4gdXNlIGNhc2UuCgpJIGRvbid0IHRoaW5rIHlvdSB1bmRlcnN0b29kIG15IHBvaW50IGhlcmUu
IEFuIGF0b21pYzMyX3Qgd2lsbCBub3QgYmUgCmJldHRlciBhcyB5b3Ugc3RpbGwgYXNzdW1lIHRo
ZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4gSS5lIHRoZSAKc3RydWN0dXJlIGhhcyBvbmx5IG9u
ZSBmaWVsZC4KCkkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGdvaW5nIHRvIGJpdGUgdXMgaW4gdGhl
IGZ1dHVyZSwgYnV0IEkgZG9uJ3Qgd2FudCAKdG8gbWFrZSBhdHRlbXB0IHRvIHVzZSBzdWNoIHVu
aW9uLiBBdCBsZWFzdCB3aXRob3V0IGFueSBzYWZlZ3VhcmQgaW4gWGVuIAooaS5lIEJVSUxEX0JV
R19PTiguLi4pKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
