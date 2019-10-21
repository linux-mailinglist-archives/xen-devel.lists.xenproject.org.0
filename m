Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36EDE6C3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 10:41:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMTCD-00038K-1j; Mon, 21 Oct 2019 08:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UtZw=YO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iMTCB-00038E-Pj
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 08:37:43 +0000
X-Inumbo-ID: 0c74eb44-f3de-11e9-9442-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c74eb44-f3de-11e9-9442-12813bfff9fa;
 Mon, 21 Oct 2019 08:37:43 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 550F285545
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:37:42 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id j14so6548150wrm.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 01:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sNVzdayrnlDBWeLmo+GkJozKhCJfQkOUxXT4oshMYOU=;
 b=nkAaNi0UKQcY6FbhJItfIV1gd6I8Sc7hNZeU49cg/w2BJzdHnRxqwoFi10EF++sYHo
 6E3h3EvYfCy3+9iVbNmVYAbGcwoNpNWlh3390VOblQd8hhHydVM/ef2Ey3aGGOID40PU
 fK5KqZw9lLGs8txNYN8X512dsNLMjnujpKGvKJVrVuCm2Ksnn/z1fh86cqAshGqu+0Tu
 o6sANKEmcIjahH7OEXk0J4bWJt4bPGEarym4dMhhP/djfUCePQT51KxsDr/r4/nHP5Xz
 iZp3m/yGWCvyM4gwqAsm1ofvoDTw0jDRhxl+xIWAMdIcgmbh/vEmzsop8gvxRuyKst1X
 6G0w==
X-Gm-Message-State: APjAAAUqSiO/WidQyyH6oDeDID+z/e3NU3LUYUgF3qy/pA9ANn4YO9tR
 Xl04sfN+Wvq0H6Sk1JrZsc9Ql5tZFiagjWsHif8SiGBwxONLbsV/35WF6c6RKi4O2P8nh+1x2h7
 VRMOl5NNCiFAyN2utxQJMr+SssL8=
X-Received: by 2002:adf:e982:: with SMTP id h2mr15762950wrm.53.1571647061081; 
 Mon, 21 Oct 2019 01:37:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIXvsoQ2lva3Qh8sxfgmMW5TGFt2l9RAoV9jLJ75IuaStH1LFnj54GUkBkM6amq0YkL0CjcQ==
X-Received: by 2002:adf:e982:: with SMTP id h2mr15762935wrm.53.1571647060872; 
 Mon, 21 Oct 2019 01:37:40 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id u21sm10320761wmu.27.2019.10.21.01.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:37:40 -0700 (PDT)
To: Li Qiang <liq3ea@gmail.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-3-philmd@redhat.com>
 <CAKXe6SKQGYj+N04An+t5sP4jVkpEpmmGGfpZxb5VAV+w3owsBw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3235e49f-fdd6-5e5c-f60b-44538ff05d76@redhat.com>
Date: Mon, 21 Oct 2019 10:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKXe6SKQGYj+N04An+t5sP4jVkpEpmmGGfpZxb5VAV+w3owsBw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/20] piix4: Add the Reset Control
 Register
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjEvMTkgMzoyNSBBTSwgTGkgUWlhbmcgd3JvdGU6Cj4gCj4gCj4gUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tIDxtYWlsdG86cGhpbG1kQHJlZGhhdC5jb20+
PiDkuo4gCj4gMjAxOeW5tDEw5pyIMTjml6XlkajkupQg5LiL5Y2IOTo1MOWGmemBk++8mgo+IAo+
ICAgICBGcm9tOiBIZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmcKPiAgICAg
PG1haWx0bzpocG91c3NpbkByZWFjdG9zLm9yZz4+Cj4gCj4gICAgIFRoZSBSQ1IgSS9PIHBvcnQg
KDB4Y2Y5KSBpcyB1c2VkIHRvIGdlbmVyYXRlIGEgaGFyZCByZXNldCBvciBhIHNvZnQKPiAgICAg
cmVzZXQuCj4gCj4gICAgIEFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tIDxtYWlsdG86bXN0QHJlZGhhdC5jb20+Pgo+ICAgICBBY2tlZC1ieTogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbQo+ICAgICA8bWFpbHRvOnBib256aW5pQHJlZGhhdC5jb20+
Pgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBIZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rv
cy5vcmcKPiAgICAgPG1haWx0bzpocG91c3NpbkByZWFjdG9zLm9yZz4+Cj4gICAgIE1lc3NhZ2Ut
SWQ6IDwyMDE3MTIxNjA5MDIyOC4yODUwNS03LWhwb3Vzc2luQHJlYWN0b3Mub3JnCj4gICAgIDxt
YWlsdG86MjAxNzEyMTYwOTAyMjguMjg1MDUtNy1ocG91c3NpbkByZWFjdG9zLm9yZz4+Cj4gICAg
IFJldmlld2VkLWJ5OiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29t
Cj4gICAgIDxtYWlsdG86YW1hcmtvdmljQHdhdmVjb21wLmNvbT4+Cj4gICAgIFtQTUQ6IHJlYmFz
ZWQsIHVwZGF0ZWQgaW5jbHVkZXNdCj4gICAgIFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbQo+ICAgICA8bWFpbHRvOnBoaWxtZEByZWRoYXQu
Y29tPj4KPiAgICAgLS0tCj4gICAgICDCoGh3L2lzYS9waWl4NC5jIHwgNDkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAgICAgwqAxIGZpbGUgY2hh
bmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiAgICAgZGlmZiAtLWdp
dCBhL2h3L2lzYS9waWl4NC5jIGIvaHcvaXNhL3BpaXg0LmMKPiAgICAgaW5kZXggODkwZDk5OWFi
Zi4uZDBiMThlMDU4NiAxMDA2NDQKPiAgICAgLS0tIGEvaHcvaXNhL3BpaXg0LmMKPiAgICAgKysr
IGIvaHcvaXNhL3BpaXg0LmMKPiAgICAgQEAgLTIsNiArMiw3IEBACj4gICAgICDCoCAqIFFFTVUg
UElJWDQgUENJIEJyaWRnZSBFbXVsYXRpb24KPiAgICAgIMKgICoKPiAgICAgIMKgICogQ29weXJp
Z2h0IChjKSAyMDA2IEZhYnJpY2UgQmVsbGFyZAo+ICAgICArICogQ29weXJpZ2h0IChjKSAyMDE4
IEhlcnbDqSBQb3Vzc2luZWF1Cj4gICAgICDCoCAqCj4gICAgICDCoCAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uCj4gICAgIG9idGFp
bmluZyBhIGNvcHkKPiAgICAgIMKgICogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBk
b2N1bWVudGF0aW9uIGZpbGVzICh0aGUKPiAgICAgIlNvZnR3YXJlIiksIHRvIGRlYWwKPiAgICAg
QEAgLTI4LDExICsyOSwxNyBAQAo+ICAgICAgwqAjaW5jbHVkZSAiaHcvaXNhL2lzYS5oIgo+ICAg
ICAgwqAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCj4gICAgICDCoCNpbmNsdWRlICJtaWdyYXRpb24v
dm1zdGF0ZS5oIgo+ICAgICArI2luY2x1ZGUgInN5c2VtdS9yZXNldC5oIgo+ICAgICArI2luY2x1
ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIgo+IAo+ICAgICAgwqBQQ0lEZXZpY2UgKnBpaXg0X2RldjsK
PiAKPiAgICAgIMKgdHlwZWRlZiBzdHJ1Y3QgUElJWDRTdGF0ZSB7Cj4gICAgICDCoCDCoCDCoFBD
SURldmljZSBkZXY7Cj4gICAgICsKPiAgICAgK8KgIMKgIC8qIFJlc2V0IENvbnRyb2wgUmVnaXN0
ZXIgKi8KPiAgICAgK8KgIMKgIE1lbW9yeVJlZ2lvbiByY3JfbWVtOwo+ICAgICArwqAgwqAgdWlu
dDhfdCByY3I7Cj4gICAgICDCoH0gUElJWDRTdGF0ZTsKPiAKPiAgICAgIMKgI2RlZmluZSBUWVBF
X1BJSVg0X1BDSV9ERVZJQ0UgIlBJSVg0Igo+ICAgICBAQCAtODcsMTUgKzk0LDUxIEBAIHN0YXRp
YyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9waWl4NCA9IHsKPiAgICAgIMKgIMKg
IMKgfQo+ICAgICAgwqB9Owo+IAo+ICAgICArc3RhdGljIHZvaWQgcGlpeDRfcmNyX3dyaXRlKHZv
aWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsIHVpbnQ2NF90IHZhbCwKPiAgICAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuc2lnbmVkIGludCBsZW4pCj4gICAgICt7
Cj4gICAgICvCoCDCoCBQSUlYNFN0YXRlICpzID0gb3BhcXVlOwo+ICAgICArCj4gICAgICvCoCDC
oCBpZiAodmFsICYgNCkgewo+ICAgICArwqAgwqAgwqAgwqAgcWVtdV9zeXN0ZW1fcmVzZXRfcmVx
dWVzdChTSFVURE9XTl9DQVVTRV9HVUVTVF9SRVNFVCk7Cj4gICAgICvCoCDCoCDCoCDCoCByZXR1
cm47Cj4gICAgICvCoCDCoCB9Cj4gICAgICsKPiAgICAgK8KgIMKgIHMtPnJjciA9IHZhbCAmIDI7
IC8qIGtlZXAgU3lzdGVtIFJlc2V0IHR5cGUgb25seSAqLwo+ICAgICArfQo+ICAgICArCj4gICAg
ICtzdGF0aWMgdWludDY0X3QgcGlpeDRfcmNyX3JlYWQodm9pZCAqb3BhcXVlLCBod2FkZHIgYWRk
ciwgdW5zaWduZWQKPiAgICAgaW50IGxlbikKPiAgICAgK3sKPiAgICAgK8KgIMKgIFBJSVg0U3Rh
dGUgKnMgPSBvcGFxdWU7Cj4gICAgICsKPiAgICAgK8KgIMKgIHJldHVybiBzLT5yY3I7Cj4gICAg
ICt9Cj4gICAgICsKPiAgICAgK3N0YXRpYyBjb25zdCBNZW1vcnlSZWdpb25PcHMgcGlpeDRfcmNy
X29wcyA9IHsKPiAgICAgK8KgIMKgIC5yZWFkID0gcGlpeDRfcmNyX3JlYWQsCj4gICAgICvCoCDC
oCAud3JpdGUgPSBwaWl4NF9yY3Jfd3JpdGUsCj4gICAgICvCoCDCoCAuZW5kaWFubmVzcyA9IERF
VklDRV9MSVRUTEVfRU5ESUFOLAo+ICAgICArwqAgwqAgLmltcGwgPSB7Cj4gICAgICvCoCDCoCDC
oCDCoCAubWluX2FjY2Vzc19zaXplID0gMSwKPiAgICAgK8KgIMKgIMKgIMKgIC5tYXhfYWNjZXNz
X3NpemUgPSAxLAo+ICAgICArwqAgwqAgfSwKPiAgICAgK307Cj4gICAgICsKPiAgICAgIMKgc3Rh
dGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQo+ICAg
ICAgwqB7Cj4gICAgIC3CoCDCoCBQSUlYNFN0YXRlICpkID0gUElJWDRfUENJX0RFVklDRShkZXYp
Owo+ICAgICArwqAgwqAgUElJWDRTdGF0ZSAqcyA9IFBJSVg0X1BDSV9ERVZJQ0UoZGV2KTsKPiAK
PiAgICAgLcKgIMKgIGlmICghaXNhX2J1c19uZXcoREVWSUNFKGQpLCBwY2lfYWRkcmVzc19zcGFj
ZShkZXYpLAo+ICAgICArwqAgwqAgaWYgKCFpc2FfYnVzX25ldyhERVZJQ0UoZGV2KSwgcGNpX2Fk
ZHJlc3Nfc3BhY2UoZGV2KSwKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHBjaV9hZGRyZXNzX3NwYWNlX2lvKGRldiksIGVycnApKSB7Cj4gICAgICDCoCDCoCDCoCDCoCDC
oHJldHVybjsKPiAgICAgIMKgIMKgIMKgfQo+ICAgICAtwqAgwqAgcGlpeDRfZGV2ID0gJmQtPmRl
djsKPiAgICAgKwo+ICAgICArwqAgwqAgbWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZzLT5yY3JfbWVt
LCBPQkpFQ1QoZGV2KSwgJnBpaXg0X3Jjcl9vcHMsIHMsCj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAicmVzZXQtY29udHJvbCIsIDEpOwo+ICAgICArwqAgwqAg
bWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uX292ZXJsYXAocGNpX2FkZHJlc3Nfc3BhY2VfaW8o
ZGV2KSwKPiAgICAgMHhjZjksCj4gCj4gCj4gCj4gQ2FuIHdlIHVzZSAnUkNSX0lPUE9SVCcgaW5z
dGVhZCBvZiBjb25zdGFudCB2YWx1ZSBoZXJlPyBBbHNvIGRvbid0IHNlZSAKPiB0aGlzIGNoYW5n
ZQo+IGluIGxhdGVyIHBhdGNoZXMgb2YgdGhpcyBzZWlyYWxzLgoKR29vZCBpZGVhLCBJIG1pc3Nl
ZCB0aGlzIG9uZSA6KQoKPiBBbnl3YXkKPiAKPiBSZXZpZXdlZC1ieTogTGkgUWlhbmcgPGxpcTNl
YUBnbWFpbC5jb20gPG1haWx0bzpsaXEzZWFAZ21haWwuY29tPj4KClRoYW5rcyEKCj4gCj4gVGhh
bmtzLAo+IExpIFFpYW5nCj4gCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcy0+cmNyX21lbSwgMSk7Cj4gICAgICsKPiAg
ICAgK8KgIMKgIHBpaXg0X2RldiA9IGRldjsKPiAgICAgIMKgfQo+IAo+ICAgICAgwqBpbnQgcGlp
eDRfaW5pdChQQ0lCdXMgKmJ1cywgSVNBQnVzICoqaXNhX2J1cywgaW50IGRldmZuKQo+ICAgICAt
LSAKPiAgICAgMi4yMS4wCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
