Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BD18CC35
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 12:06:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFFQl-0006nn-D2; Fri, 20 Mar 2020 11:03:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i4Ug=5F=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jFFQk-0006ni-HO
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 11:03:10 +0000
X-Inumbo-ID: 6226b634-6a9a-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6226b634-6a9a-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 11:03:09 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z3so6587993edq.11
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ETSMwM++FRuAJTyyWX2HLzddm+o8T5hDL1DUIdp8Uus=;
 b=nnf36E67oFztZnyLj1HSHMPAeyW1Jgx5ckFmK5lOfVT/wECGxKmJR9MxeIPqGIFX7Q
 vsa/NZgP6m5kto5F4kagZagMtaZkdOrdrHfNypzCgTMGR5nLcakOSKbWPI1UgklpefME
 nPQlLOmuONEplFhVKbw+nYSKrqY+GRLp92bn/Allab9XLIggsWaS5882BoLF9JUfPRZH
 8/XqPu6XTrD9pibm5mkbiVT5zaHUoIj586R55iYI3pUzQITDjTkogETPuzqzM2i7BC5M
 3Bjm5m1MVNQRmlqNXPNF+mk62i6UNN3Fo+9cUFmJfTyKV4P0YO6CU0oiLtzKFCbz9nx1
 OxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ETSMwM++FRuAJTyyWX2HLzddm+o8T5hDL1DUIdp8Uus=;
 b=PaiVWv4NhXOrkLRW/4fNn4tQ2QJmZ4b/XQWkiNMlhjUQCrGBIiCM+509ymeWpsLEvC
 Hkbtg1JAt26CRCU8e8ZDENpmhcTiVqo5zmrubp4ylVQ9bBf/1fBR2QUlFoOU1pQgcL54
 SeONVj1wi88ifdrOTrlE7J/1hPacpFdAw1Jt56dSIAZF1f7JOUNRO+jWqRWuUSmjL20f
 okfkzAcrHMzf5VnjPNz989/z5y4H4P1shxGI784eNdESU1tmz8mn3Di1ZxZWuH4cfOhV
 bNZn7V7iYHyEq+dsRw6tA3n1SVEDqubEbyU3+a8wG1taMmPg49iUJLSEQceHrSUKtaMt
 hSHg==
X-Gm-Message-State: ANhLgQ14f+mjbWnJAq0Td/kJJL/Oa4sIQHzrJ/3u0zkiXnGIepwMmGfE
 1Q2rHwS0iZSmTNg3692cfVM=
X-Google-Smtp-Source: ADFU+vs7nbQ5jXXYmX+EB7q9wVsbKvP7ijOjGpuIowOkJvPNK+4Wk80ItdAAlS5E+1KhdoX050ku5g==
X-Received: by 2002:a50:cc9a:: with SMTP id q26mr7523211edi.161.1584702188743; 
 Fri, 20 Mar 2020 04:03:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id t20sm328819eds.51.2020.03.20.04.03.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Mar 2020 04:03:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>, <xen-devel@lists.xenproject.org>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <20200319204025.2649661-2-dwmw2@infradead.org>
In-Reply-To: <20200319204025.2649661-2-dwmw2@infradead.org>
Date: Fri, 20 Mar 2020 11:03:06 -0000
Message-ID: <001a01d5fea7$230f5aa0$692e0fe0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH05xHkgeVc1XB8U8VvyQbeJHs1QQGnJnxfqAZGeFA=
Subject: Re: [Xen-devel] [PATCH 2/2] tools/xenstore: Accumulate errors in
 xenstore-ls and exit appropriately
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
Reply-To: paul@xen.org
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBEYXZpZCBXb29kaG91
c2UKPiBTZW50OiAxOSBNYXJjaCAyMDIwIDIwOjQwCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4g
U3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIDIvMl0gdG9vbHMveGVuc3RvcmU6IEFjY3VtdWxh
dGUgZXJyb3JzIGluIHhlbnN0b3JlLWxzIGFuZCBleGl0Cj4gYXBwcm9wcmlhdGVseQo+IAo+IEZy
b206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gUmVwb3J0IG9ubHkg
b25lIGVycm9yIHRvIHN0ZGVyciBmb3IgZWFjaCBub2RlLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIg
aXQncwo+IHhzX3JlYWQsIHhzX2dldF9wZXJtaXNzaW9ucyBvciB4c19kaXJlY3Rvcnkgb24gdGhl
IGNoaWxkIHRoYXQgZmFpbHMuCj4gCj4gQWx3YXlzIGV4aXQgd2l0aCBhIG5vbi16ZXJvIGNvZGUg
aWYgYW55IGZhaWx1cmUgaGFwcGVucywgcmVwb3J0aW5nIHRoZQo+IGxhc3QgZXJyb3IgdGhhdCBv
Y2N1cnJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9u
LmNvLnVrPgo+IC0tLQo+ICB0b29scy94ZW5zdG9yZS94ZW5zdG9yZV9jbGllbnQuYyB8IDM1ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZV9jbGllbnQuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVudC5jCj4g
aW5kZXggYWU3ZWQzZWI5ZS4uMGM4OTE5NjFhZSAxMDA2NDQKPiAtLS0gYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZV9jbGllbnQuYwo+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVu
dC5jCj4gQEAgLTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMgaW50IHNob3dfd2hvbGVfcGF0aCA9IDA7
Cj4gCj4gICNkZWZpbmUgTUlOKGEsIGIpICgoKGEpIDwgKGIpKT8gKGEpIDogKGIpKQo+IAo+IC1z
dGF0aWMgdm9pZCBkb19scyhzdHJ1Y3QgeHNfaGFuZGxlICpoLCBjaGFyICpwYXRoLCBpbnQgY3Vy
X2RlcHRoLCBpbnQgc2hvd19wZXJtcykKPiArc3RhdGljIGludCBkb19scyhzdHJ1Y3QgeHNfaGFu
ZGxlICpoLCBjaGFyICpwYXRoLCBpbnQgY3VyX2RlcHRoLCBpbnQgc2hvd19wZXJtcywgaW50IGVy
cm9yLCBpbnQKPiBpZ25vcmVfZXJyb3JzKQo+ICB7Cj4gICAgICBjaGFyICoqZTsKPiAgICAgIGNo
YXIgKm5ld3BhdGgsICp2YWw7Cj4gQEAgLTE1MCw5ICsxNTAsMTYgQEAgc3RhdGljIHZvaWQgZG9f
bHMoc3RydWN0IHhzX2hhbmRsZSAqaCwgY2hhciAqcGF0aCwgaW50IGN1cl9kZXB0aCwgaW50IHNo
b3dfcGVybXMKPiAKPiAgICAgIGUgPSB4c19kaXJlY3RvcnkoaCwgWEJUX05VTEwsIHBhdGgsICZu
dW0pOwo+ICAgICAgaWYgKGUgPT0gTlVMTCkgewo+IC0gICAgICAgIGlmIChjdXJfZGVwdGggJiYg
ZXJybm8gPT0gRU5PRU5UKSB7Cj4gLSAgICAgICAgICAgIC8qIElmIGEgbm9kZSBkaXNhcHBlYXJz
IHdoaWxlIHJlY3Vyc2luZywgc2lsZW50bHkgbW92ZSBvbi4gKi8KPiAtICAgICAgICAgICAgcmV0
dXJuOwo+ICsgICAgICAgIGlmIChjdXJfZGVwdGggJiYgKGVycm5vID09IEVOT0VOVCB8fCBlcnJu
byA9PSBFQUNDRVMpKSB7Cj4gKyAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAqIElmIGEg
bm9kZSBkaXNhcHBlYXJzIG9yIGJlY29tZXMgaW5hY2Nlc3NpYmxlIHdoaWxlIHRyYXZlcnNpbmcs
Cj4gKyAgICAgICAgICAgICAqIG9ubHkgcHJpbnQgYW4gZXJyb3IgaWYgcHJldmlvdXMgb3BlcmF0
aW9ucyBvbiB0aGlzIG5vZGUgaGF2ZW4ndAo+ICsgICAgICAgICAgICAgKiBkb25lIGRvLiBUaGVu
IG1vdmUgb24uCj4gKyAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICBlcnJvciA9IGVycm5v
Owo+ICsgICAgICAgICAgICBpZiAoIWlnbm9yZV9lcnJvcnMpCj4gKyAgICAgICAgICAgICAgICB3
YXJuKCJ4c19kaXJlY3RvcnkgKCVzKSIsIHBhdGgpOwo+ICsgICAgICAgICAgICByZXR1cm4gZXJy
b3I7Cj4gICAgICAgICAgfQo+IAo+ICAgICAgICAgIGVycigxLCAieHNfZGlyZWN0b3J5ICglcyki
LCBwYXRoKTsKPiBAQCAtMTk3LDcgKzIwNCw4IEBAIHN0YXRpYyB2b2lkIGRvX2xzKHN0cnVjdCB4
c19oYW5kbGUgKmgsIGNoYXIgKnBhdGgsIGludCBjdXJfZGVwdGgsIGludCBzaG93X3Blcm1zCj4g
Cj4gICAgICAgICAgLyogUHJpbnQgdmFsdWUgKi8KPiAgICAgICAgICBpZiAodmFsID09IE5VTEwp
IHsKPiAtICAgICAgICAgICAgcHJpbnRmKCI6XG4iKTsKPiArICAgICAgICAgICAgZXJyb3IgPSBl
cnJubzsKPiArICAgICAgICAgICAgcHJpbnRmKCI6ICglcykiLCBzdHJlcnJvcihlcnJvcikpOwo+
ICAgICAgICAgIH0KPiAgICAgICAgICBlbHNlIHsKPiAgICAgICAgICAgICAgaWYgKG1heF93aWR0
aCA8IChsaW5ld2lkICsgbGVuICsgVEFHX0xFTikpIHsKPiBAQCAtMjIyLDcgKzIzMCwxMSBAQCBz
dGF0aWMgdm9pZCBkb19scyhzdHJ1Y3QgeHNfaGFuZGxlICpoLCBjaGFyICpwYXRoLCBpbnQgY3Vy
X2RlcHRoLCBpbnQgc2hvd19wZXJtcwo+ICAgICAgICAgIGlmIChzaG93X3Blcm1zKSB7Cj4gICAg
ICAgICAgICAgIHBlcm1zID0geHNfZ2V0X3Blcm1pc3Npb25zKGgsIFhCVF9OVUxMLCBuZXdwYXRo
LCAmbnBlcm1zKTsKPiAgICAgICAgICAgICAgaWYgKHBlcm1zID09IE5VTEwpIHsKPiAtICAgICAg
ICAgICAgICAgIHdhcm4oIlxuY291bGQgbm90IGFjY2VzcyBwZXJtaXNzaW9ucyBmb3IgJXMiLCBl
W2ldKTsKPiArICAgICAgICAgICAgICAgIGVycm9yID0gZXJybm87Cj4gKyAgICAgICAgICAgICAg
ICB2YWwgPSBOVUxMOwo+ICsgICAgICAgICAgICAgICAgLyogRG9uJ3QgcmVwZWF0IGFuIGVycm9y
IG1lc3NhZ2UgaWYgeHNfcmVhZCgpIGFscmVhZHkgZmFpbGVkICovCj4gKyAgICAgICAgICAgICAg
ICBpZiAodmFsKQoKSG93IGNhbiB0aGUgY29kZSBnZXQgaGVyZT8gVGhlIGxpbmUgYWJvdmUgdGhl
IGNvbW1lbnQgYWx3YXlzIHNldHMgdmFsIHRvIE5VTEwuCgogIFBhdWwKCj4gKyAgICAgICAgICAg
ICAgICAgICAgd2FybigiY291bGQgbm90IGFjY2VzcyBwZXJtaXNzaW9ucyBmb3IgJXMiLCBlW2ld
KTsKPiAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICBlbHNlIHsKPiAgICAgICAgICAgICAg
ICAgIGludCBpOwo+IEBAIC0yMzgsMTEgKzI1MCwxMyBAQCBzdGF0aWMgdm9pZCBkb19scyhzdHJ1
Y3QgeHNfaGFuZGxlICpoLCBjaGFyICpwYXRoLCBpbnQgY3VyX2RlcHRoLCBpbnQgc2hvd19wZXJt
cwo+ICAgICAgICAgIH0KPiAKPiAgICAgICAgICBwdXRjaGFyKCdcbicpOwo+IC0KPiAtICAgICAg
ICBkb19scyhoLCBuZXdwYXRoLCBjdXJfZGVwdGgrMSwgc2hvd19wZXJtcyk7Cj4gKwo+ICsgICAg
ICAgIGVycm9yID0gZG9fbHMoaCwgbmV3cGF0aCwgY3VyX2RlcHRoKzEsIHNob3dfcGVybXMsIGVy
cm9yLCAhdmFsKTsKPiAgICAgIH0KPiAgICAgIGZyZWUoZSk7Cj4gICAgICBmcmVlKG5ld3BhdGgp
Owo+ICsKPiArICAgIHJldHVybiBlcnJvcjsKPiAgfQo+IAo+ICBzdGF0aWMgdm9pZAo+IEBAIC00
NDgsNyArNDYyLDEwIEBAIHBlcmZvcm0oZW51bSBtb2RlIG1vZGUsIGludCBvcHRpbmQsIGludCBh
cmdjLCBjaGFyICoqYXJndiwgc3RydWN0IHhzX2hhbmRsZSAqeHNoCj4gICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgIH0KPiAgICAgICAgICBjYXNlIE1PREVfbHM6IHsKPiAtICAgICAgICAg
ICAgZG9fbHMoeHNoLCBhcmd2W29wdGluZF0sIDAsIHByZWZpeCk7Cj4gKyAgICAgICAgICAgIGlu
dCBlcnJvciA9IGRvX2xzKHhzaCwgYXJndltvcHRpbmRdLCAwLCBwcmVmaXgsIDAsIDApOwo+ICsg
ICAgICAgICAgICBpZiAoZXJyb3IpIHsKPiArICAgICAgICAgICAgICAgIGVycngoMSwgIkVycm9y
cyBkdXJpbmcgdHJhdmVyc2FsLiBMYXN0IGVycm9yOiAlcyIsIHN0cmVycm9yKGVycm9yKSk7Cj4g
KyAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgb3B0aW5kKys7Cj4gICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgIH0KPiAtLQo+IDIuMjEuMAo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+
IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
