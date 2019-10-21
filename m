Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D9DF243
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:59:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa2t-00083K-Af; Mon, 21 Oct 2019 15:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UtZw=YO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iMa2r-00083F-Mz
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:56:33 +0000
X-Inumbo-ID: 589985d8-f41b-11e9-a531-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 589985d8-f41b-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 15:56:30 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 63F67C057F20
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 15:56:29 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id k184so6170942wmk.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCo8epeB07g14wJcxGAOGTwUjr6BSErnYOWlDkDuG1k=;
 b=MolMFDhLhmb4srbgFMIfG751+q2XousQaolcV9F4OjVPdsSkbZvfjfjlYQr0SxOiCw
 uiNehpih5UMps286tP44LjeyleV6CnydwfONwh4KEe0Dkzsrz7EwaRm7igdqYu2JhaRY
 Vi8Ka2fDCi+0cEJpHfIaeuoNnfKBQIHiuBmg80xXsraJshnA0vR52YxXu1cB1abx8C8I
 CdQeoaJ4nvl0tr+w0kMo3+QLi1Bdg1jYxUtUAwpZTU2SXTTsE4cxOl/hDkonxE7eZVzN
 lTS9EsUr50mAcxnBCsYV64CiOqkpAbQcXxbZXdWjai/PZ97gohIE4Fo/A/TG9ZnFVEu9
 l8kA==
X-Gm-Message-State: APjAAAUIZuAIMnbqEucHze4vZZH5d3exgYPERVivMSjnewUoSW4eT6+G
 8MNfOIXt+dmnGZOaCkTTy7ez4CWl9K6Q93YBK9L4VW1ZadVi3eywLTy6Hh7/nLhiRfJGO1VMetu
 2Mp6Ozk/n4WStpEDcaGmF8mxJiDE=
X-Received: by 2002:a1c:990a:: with SMTP id b10mr19476623wme.39.1571673387818; 
 Mon, 21 Oct 2019 08:56:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8h9QT1OMoiObhND4cXnd932RWn4nisRCw5izziNOh+97I2bnJ44dvTjpgmLRvastYeWsv/A==
X-Received: by 2002:a1c:990a:: with SMTP id b10mr19476590wme.39.1571673387473; 
 Mon, 21 Oct 2019 08:56:27 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id f8sm14697365wmb.37.2019.10.21.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 08:56:26 -0700 (PDT)
To: Li Qiang <liq3ea@gmail.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-7-philmd@redhat.com>
 <CAKXe6SL6GX_eL4yXfmdbGaYd0=Pbpo1vx1P+NbWM_eZ3GCYgBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56d26cdd-795e-0707-4335-c94e5af119b5@redhat.com>
Date: Mon, 21 Oct 2019 17:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKXe6SL6GX_eL4yXfmdbGaYd0=Pbpo1vx1P+NbWM_eZ3GCYgBA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/20] piix4: Add a i8257 DMA Controller
 as specified in datasheet
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

T24gMTAvMjEvMTkgNToyNSBQTSwgTGkgUWlhbmcgd3JvdGU6Cj4gCj4gCj4gUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tIDxtYWlsdG86cGhpbG1kQHJlZGhhdC5jb20+
PiDkuo4gCj4gMjAxOeW5tDEw5pyIMTjml6XlkajkupQg5LiL5Y2IOTo1NeWGmemBk++8mgo+IAo+
ICAgICBGcm9tOiBIZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmcKPiAgICAg
PG1haWx0bzpocG91c3NpbkByZWFjdG9zLm9yZz4+Cj4gCj4gICAgIFJlbW92ZSBpODI1NyBpbnN0
YW50aWF0ZWQgaW4gbWFsdGEgYm9hcmQsIHRvIG5vdCBoYXZlIGl0IHR3aWNlLgo+IAo+ICAgICBB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbSA8bWFpbHRvOm1zdEBy
ZWRoYXQuY29tPj4KPiAgICAgQWNrZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20KPiAgICAgPG1haWx0bzpwYm9uemluaUByZWRoYXQuY29tPj4KPiAgICAgU2lnbmVkLW9m
Zi1ieTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnCj4gICAgIDxtYWls
dG86aHBvdXNzaW5AcmVhY3Rvcy5vcmc+Pgo+ICAgICBNZXNzYWdlLUlkOiA8MjAxNzEyMTYwOTAy
MjguMjg1MDUtOS1ocG91c3NpbkByZWFjdG9zLm9yZwo+ICAgICA8bWFpbHRvOjIwMTcxMjE2MDkw
MjI4LjI4NTA1LTktaHBvdXNzaW5AcmVhY3Rvcy5vcmc+Pgo+ICAgICBSZXZpZXdlZC1ieTogQWxl
a3NhbmRhciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbQo+ICAgICA8bWFpbHRvOmFt
YXJrb3ZpY0B3YXZlY29tcC5jb20+Pgo+ICAgICBbUE1EOiByZWJhc2VkXQo+ICAgICBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20KPiAgICAg
PG1haWx0bzpwaGlsbWRAcmVkaGF0LmNvbT4+Cj4gICAgIC0tLQo+ICAgICAgwqBody9pc2EvcGlp
eDQuY8KgIMKgIMKgIMKgfCA0ICsrKysKPiAgICAgIMKgaHcvbWlwcy9taXBzX21hbHRhLmMgfCAy
IC0tCj4gICAgICDCoDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQu
Ywo+ICAgICBpbmRleCBhYzkzODNhNjU4Li4wYjI0ZDgzMjNjIDEwMDY0NAo+ICAgICAtLS0gYS9o
dy9pc2EvcGlpeDQuYwo+ICAgICArKysgYi9ody9pc2EvcGlpeDQuYwo+ICAgICBAQCAtMjksNiAr
MjksNyBAQAo+ICAgICAgwqAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgo+ICAgICAgwqAjaW5jbHVk
ZSAiaHcvaXNhL2lzYS5oIgo+ICAgICAgwqAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCj4gICAgICsj
aW5jbHVkZSAiaHcvZG1hL2k4MjU3LmgiCj4gICAgICDCoCNpbmNsdWRlICJtaWdyYXRpb24vdm1z
dGF0ZS5oIgo+ICAgICAgwqAjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiCj4gICAgICDCoCNpbmNs
dWRlICJzeXNlbXUvcnVuc3RhdGUuaCIKPiAgICAgQEAgLTE2Nyw2ICsxNjgsOSBAQCBzdGF0aWMg
dm9pZCBwaWl4NF9yZWFsaXplKFBDSURldmljZSAqZGV2LCBFcnJvcgo+ICAgICAqKmVycnApCj4g
ICAgICDCoCDCoCDCoC8qIGluaXRpYWxpemUgSVNBIGlycXMgKi8KPiAgICAgIMKgIMKgIMKgaXNh
X2J1c19pcnFzKGlzYV9idXMsIHMtPmlzYSk7Cj4gCj4gICAgICvCoCDCoCAvKiBETUEgKi8KPiAg
ICAgK8KgIMKgIGk4MjU3X2RtYV9pbml0KGlzYV9idXMsIDApOwo+ICAgICArCj4gICAgICDCoCDC
oCDCoHBpaXg0X2RldiA9IGRldjsKPiAgICAgIMKgfQo+IAo+IAo+IENvdWxkIHlvdSBwbGVhc2Ug
ZXhwbGFpbiB3aHkgdGhpcyBpcyBiZXR0ZXIgY2FsbGluZyAnaTgyNTdfZG1hX2luaXQnIGluIAo+
IHBpaXg0IHJlYWxpemUgZnVuY3Rpb24KPiBpbnN0ZWFkIG9mIGNhbGxpbmcgaXQgaW4gbWlwc19t
YWx0YV9pbml0LgoKaTgyNTdfZG1hX2luaXQoKSBpcyBhIGJpdCBtaXNuYW1lZCBhcyBpdCBpbnN0
YW50aWF0ZSAyeCBpODI1Ny4KClRoZSBQSUlYNCBpbnRlZ3JhdGVzIDJ4IGk4MjM3ICh2ZXJ5IHNp
bWlsYXIgdG8gdGhlIGk4MjU3KS4KClRoZSBpODIzNyBhcmUgcGFydHMgb2YgdGhlIFBJSVg0IGNo
aXAsIGFuZCBhcmUgbm90IGNoaXBzIG9uIHRoZSBNYWx0YSAKYm9hcmQgUENCLgoKU28gd2hlbiB5
b3UgaW5zdGFudGlhdGUgYSBQSUlYNCBpbiBRRU1VLCBvbmUgZXhwZWN0cyB0aGVtIGludGVncmF0
ZWQsIAphbmQgc2hvdWxkIG5vdCBoYXZlIHRvIG1hbnVhbGx5IG1hbmFnZSB0aGVtIG91dHNpZGUg
b2YgdGhlIHNvdXRoYnJpZGdlIApjaGlwc2V0LgoKPiBJJ20gc3RpbGwgYSBsaXR0bGUgb2Ygd2hp
Y2ggdGhpbmdzIHNob3VsZCBiZSBkb25lIGluIHJlYWxpemUgYW5kIHdoaWNoIAo+IHNob3VsZCBi
ZSBkb25lIGluIHFvbSBpbnN0YW5jZSBpbml0IGZ1bmN0aW9uLgoKSSByZW1lbWJlciBhIHRocmVh
ZCBzdGFydGVkIGJ5IFBldGVyIE1heWRlbGwgd2hlbiBoZSB3YXMgd29ya2luZyBvbiB0aGUgCk1Q
UzIgYm9hcmRzLCBidXQgSSBjYW4ndCBmaW5kIGl0LgoKQW55d2F5IHRoaXMgdGhyZWFkIGlzIG1v
cmUgcmVjZW50OgoiT2JqZWN0IGluc3RhbnRpYXRpb24gdnMuIGRldmljZSByZWFsaXphdGlvbjog
d2hhdCB0byBkbyB3aGVuPyIKaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVs
QG5vbmdudS5vcmcvbXNnNTk2MzYxLmh0bWwKCj4gCj4gVGhhbmtzLAo+IExpIFFpYW5nCj4gCj4g
ICAgIGRpZmYgLS1naXQgYS9ody9taXBzL21pcHNfbWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0
YS5jCj4gICAgIGluZGV4IGU0OTliN2E2YmIuLmRmMjQ3MTc3Y2EgMTAwNjQ0Cj4gICAgIC0tLSBh
L2h3L21pcHMvbWlwc19tYWx0YS5jCj4gICAgICsrKyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCj4g
ICAgIEBAIC0yOCw3ICsyOCw2IEBACj4gICAgICDCoCNpbmNsdWRlICJjcHUuaCIKPiAgICAgIMKg
I2luY2x1ZGUgImh3L2kzODYvcGMuaCIKPiAgICAgIMKgI2luY2x1ZGUgImh3L2lzYS9zdXBlcmlv
LmgiCj4gICAgIC0jaW5jbHVkZSAiaHcvZG1hL2k4MjU3LmgiCj4gICAgICDCoCNpbmNsdWRlICJo
dy9jaGFyL3NlcmlhbC5oIgo+ICAgICAgwqAjaW5jbHVkZSAibmV0L25ldC5oIgo+ICAgICAgwqAj
aW5jbHVkZSAiaHcvYm9hcmRzLmgiCj4gICAgIEBAIC0xNDMwLDcgKzE0MjksNiBAQCB2b2lkIG1p
cHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCj4gICAgICDCoCDCoCDCoHNtYnVz
ID0gcGlpeDRfcG1faW5pdChwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDMsIDB4MTEwMCwKPiAgICAg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaXNhX2dldF9pcnEoTlVM
TCwgOSksIE5VTEwsIDAsIE5VTEwpOwo+ICAgICAgwqAgwqAgwqBwaXQgPSBpODI1NF9waXRfaW5p
dChpc2FfYnVzLCAweDQwLCAwLCBOVUxMKTsKPiAgICAgLcKgIMKgIGk4MjU3X2RtYV9pbml0KGlz
YV9idXMsIDApOwo+ICAgICAgwqAgwqAgwqBtYzE0NjgxOF9ydGNfaW5pdChpc2FfYnVzLCAyMDAw
LCBOVUxMKTsKPiAKPiAgICAgIMKgIMKgIMKgLyogZ2VuZXJhdGUgU1BEIEVFUFJPTSBkYXRhICov
Cj4gICAgIC0tIAo+ICAgICAyLjIxLjAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
