Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366391791C1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:52:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UPl-0000Lc-SZ; Wed, 04 Mar 2020 13:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9UPk-0000LX-Gz
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:50:20 +0000
X-Inumbo-ID: 156d5cb2-5e1f-11ea-90c4-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 156d5cb2-5e1f-11ea-90c4-bc764e2007e4;
 Wed, 04 Mar 2020 13:50:18 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m25so2379435edq.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 05:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8jD1aQ0K4ZHRI9L4DVErk5de13t4CvMVfGLComiCULQ=;
 b=srn2AAzx2WpkUT+G1oa+oawzGO+g4JQ7Kt/glIYrOVvRSr3RRhLk2+iu7wiANKcBnX
 nk969eCo2wDtOhcv/1AXnjfvJr+8mrkg8iMFcsCbeFMiPH+g8gNkdXzhyDnrzhFUyWxs
 O81LeFqupcSrPiFqkZtmNsaMfJcPmifQXz/X1wDCoMd9iO+7QVxBdeFkC40Ld0HbrF+f
 jFxL1E3W/E3EKVKecdjSP5Ky6l1hogZDnnQOOWZycNgNBy+NAo8kigpZRxBzqbU5gWNr
 08jj2MBknIlku/L86yKaWOia8feRqKerELOZa2RGOxKt6wnmoiKTD1Qxd30JJNexzEOG
 xN1w==
X-Gm-Message-State: ANhLgQ3OyJrzXnhxhC64JOvTRamm0Z8nW5iebh/GjGc1BA1nHeJyCYRh
 i0idYxRLeR4vPs51HEmQT/c=
X-Google-Smtp-Source: ADFU+vsZrq7uJzWcS4/3LZotBPFTQ9gsYfoZvYENWEf9F84kQ9T2I6uins3J28b/fwvpIldukXjlEQ==
X-Received: by 2002:a17:906:8284:: with SMTP id
 h4mr2489505ejx.224.1583329818066; 
 Wed, 04 Mar 2020 05:50:18 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id a7sm48294ejs.33.2020.03.04.05.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:50:17 -0800 (PST)
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303221423.21962-1-dongli.zhang@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a45de885-2050-f590-b298-b3297da957a5@xen.org>
Date: Wed, 4 Mar 2020 13:50:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303221423.21962-1-dongli.zhang@oracle.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] xenbus: req->body should be updated
 before req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMy8yMDIwIDIyOjE0LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gVGhlIHJlcS0+
Ym9keSBzaG91bGQgYmUgdXBkYXRlZCBiZWZvcmUgcmVxLT5zdGF0ZSBpcyB1cGRhdGVkIGFuZCB0
aGUKPiBvcmRlciBzaG91bGQgYmUgZ3VhcmFudGVlZCBieSBhIGJhcnJpZXIuCj4gCj4gT3RoZXJ3
aXNlLCByZWFkX3JlcGx5KCkgbWlnaHQgcmV0dXJuIHJlcS0+Ym9keSA9IE5VTEwuCj4gCj4gQmVs
b3cgaXMgc2FtcGxlIGNhbGxzdGFjayB3aGVuIHRoZSBpc3N1ZSBpcyByZXByb2R1Y2VkIG9uIHB1
cnBvc2UgYnkKPiByZW9yZGVyaW5nIHRoZSB1cGRhdGVzIG9mIHJlcS0+Ym9keSBhbmQgcmVxLT5z
dGF0ZSBhbmQgYWRkaW5nIGRlbGF5IGluCj4gY29kZSBiZXR3ZWVuIHVwZGF0ZXMgb2YgcmVxLT5z
dGF0ZSBhbmQgcmVxLT5ib2R5Lgo+IAo+IFsgICAyMi4zNTYxMDVdIGdlbmVyYWwgcHJvdGVjdGlv
biBmYXVsdDogMDAwMCBbIzFdIFNNUCBQVEkKPiBbICAgMjIuMzYxMTg1XSBDUFU6IDIgUElEOiA1
MiBDb21tOiB4ZW53YXRjaCBOb3QgdGFpbnRlZCA1LjUuMHhlbisgIzYKPiBbICAgMjIuMzY2NzI3
XSBIYXJkd2FyZSBuYW1lOiBYZW4gSFZNIGRvbVUsIEJJT1MgLi4uCj4gWyAgIDIyLjM3MjI0NV0g
UklQOiAwMDEwOl9wYXJzZV9pbnRlZ2VyX2ZpeHVwX3JhZGl4KzB4Ni8weDYwCj4gLi4uIC4uLgo+
IFsgICAyMi4zOTIxNjNdIFJTUDogMDAxODpmZmZmYjJkNjQwMjNmZGYwIEVGTEFHUzogMDAwMTAy
NDYKPiBbICAgMjIuMzk1OTMzXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiA3NTc0NmU3NTYy
NzU1ZjZkIFJDWDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAyMi40MDA4NzFdIFJEWDogMDAwMDAw
MDAwMDAwMDAwMCBSU0k6IGZmZmZiMmQ2NDAyM2ZkZmMgUkRJOiA3NTc0NmU3NTYyNzU1ZjZkCj4g
WyAgIDIyLjQwNTg3NF0gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDFl
OCBSMDk6IDAwMDAwMDAwMDBjZGNkY2QKPiBbICAgMjIuNDEwOTQ1XSBSMTA6IGZmZmZiMmQ2NDAy
ZmZlMDAgUjExOiBmZmZmOWQ5NTM5NWVhZWIwIFIxMjogZmZmZjlkOTUzNTkzNTAwMAo+IFsgICAy
Mi40MTc2MTNdIFIxMzogZmZmZjlkOTUyNmQ0YTAwMCBSMTQ6IGZmZmY5ZDk1MjZmNGYzNDAgUjE1
OiBmZmZmOWQ5NTM3NjU0MDAwCj4gWyAgIDIyLjQyMzcyNl0gRlM6ICAwMDAwMDAwMDAwMDAwMDAw
KDAwMDApIEdTOmZmZmY5ZDk1M2JjODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+
IFsgICAyMi40Mjk4OThdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMKPiBbICAgMjIuNDM0MzQyXSBDUjI6IDAwMDAwMGM0MjA2YTkwMDAgQ1IzOiAwMDAw
MDAwMWVhM2ZjMDAyIENSNDogMDAwMDAwMDAwMDE2MDZlMAo+IFsgICAyMi40Mzk2NDVdIERSMDog
MDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAw
MDAwCj4gWyAgIDIyLjQ0NDk0MV0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBm
ZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAKPiBbICAgMjIuNDUwMzQyXSBDYWxsIFRyYWNl
Ogo+IFsgICAyMi40NTI1MDldICBzaW1wbGVfc3RydG91bGwrMHgyNy8weDcwCj4gWyAgIDIyLjQ1
NTU3Ml0gIHhlbmJ1c190cmFuc2FjdGlvbl9zdGFydCsweDMxLzB4NTAKPiBbICAgMjIuNDU5MTA0
XSAgbmV0YmFja19jaGFuZ2VkKzB4NzZjLzB4Y2MxIFt4ZW5fbmV0ZnJvbnRdCj4gWyAgIDIyLjQ2
MzI3OV0gID8gZmluZF93YXRjaCsweDQwLzB4NDAKPiBbICAgMjIuNDY2MTU2XSAgeGVud2F0Y2hf
dGhyZWFkKzB4YjQvMHgxNTAKPiBbICAgMjIuNDY5MzA5XSAgPyB3YWl0X3dva2VuKzB4ODAvMHg4
MAo+IFsgICAyMi40NzIxOThdICBrdGhyZWFkKzB4MTBlLzB4MTMwCj4gWyAgIDIyLjQ3NDkyNV0g
ID8ga3RocmVhZF9wYXJrKzB4ODAvMHg4MAo+IFsgICAyMi40Nzc5NDZdICByZXRfZnJvbV9mb3Jr
KzB4MzUvMHg0MAo+IFsgICAyMi40ODA5NjhdIE1vZHVsZXMgbGlua2VkIGluOiB4ZW5fa2JkZnJv
bnQgeGVuX2ZiZnJvbnQoKykgeGVuX25ldGZyb250IHhlbl9ibGtmcm9udAo+IFsgICAyMi40ODY3
ODNdIC0tLVsgZW5kIHRyYWNlIGE5MjIyMDMwYTc0N2MzZjcgXS0tLQo+IFsgICAyMi40OTA0MjRd
IFJJUDogMDAxMDpfcGFyc2VfaW50ZWdlcl9maXh1cF9yYWRpeCsweDYvMHg2MAo+IAo+IFRoZSB2
aXJ0X3JtYigpIGlzIGFkZGVkIGluIHRoZSAndHJ1ZScgcGF0aCBvZiB0ZXN0X3JlcGx5KCkuIFRo
ZSAid2hpbGUiCj4gaXMgY2hhbmdlZCB0byAiZG8gd2hpbGUiIHNvIHRoYXQgdGVzdF9yZXBseSgp
IGlzIHVzZWQgYXMgYSByZWFkIG1lbW9yeQo+IGJhcnJpZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
RG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKPiAtLS0KPiBDaGFuZ2VkIHNpbmNlIHYxOgo+
ICAgIC0gY2hhbmdlICJiYXJyaWVyKCkiIHRvICJ2aXJ0X3JtYigpIiBpbiB0ZXN0X3JlcGx5KCkK
PiBDaGFuZ2VkIHNpbmNlIHYyOgo+ICAgIC0gVXNlICJ2aXJ0X3JtYigpIiBvbmx5IGluICd0cnVl
JyBwYXRoCj4gCj4gICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMgfCAyICsrCj4g
ICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMgICAgfCA5ICsrKysrKy0tLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYyBiL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfY29tbXMuYwo+IGluZGV4IGQyMzlmYzNjNWUzZC4uODUyZWQxNjFmYzJhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYwo+ICsrKyBiL2Ry
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYwo+IEBAIC0zMTMsNiArMzEzLDggQEAgc3Rh
dGljIGludCBwcm9jZXNzX21zZyh2b2lkKQo+ICAgCQkJcmVxLT5tc2cudHlwZSA9IHN0YXRlLm1z
Zy50eXBlOwo+ICAgCQkJcmVxLT5tc2cubGVuID0gc3RhdGUubXNnLmxlbjsKPiAgIAkJCXJlcS0+
Ym9keSA9IHN0YXRlLmJvZHk7Cj4gKwkJCS8qIHdyaXRlIGJvZHksIHRoZW4gdXBkYXRlIHN0YXRl
ICovCj4gKwkJCXZpcnRfd21iKCk7Cj4gICAJCQlyZXEtPnN0YXRlID0geGJfcmVxX3N0YXRlX2dv
dF9yZXBseTsKPiAgIAkJCXJlcS0+Y2IocmVxKTsKPiAgIAkJfSBlbHNlCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfeHMuYwo+IGluZGV4IGRkYzE4ZGE2MTgzNC4uM2EwNmViNjk5ZjMzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfeHMuYwo+IEBAIC0xOTEsOCArMTkxLDExIEBAIHN0YXRpYyBib29sIHhlbmJ1c19v
ayh2b2lkKQo+ICAgCj4gICBzdGF0aWMgYm9vbCB0ZXN0X3JlcGx5KHN0cnVjdCB4Yl9yZXFfZGF0
YSAqcmVxKQo+ICAgewo+IC0JaWYgKHJlcS0+c3RhdGUgPT0geGJfcmVxX3N0YXRlX2dvdF9yZXBs
eSB8fCAheGVuYnVzX29rKCkpCj4gKwlpZiAocmVxLT5zdGF0ZSA9PSB4Yl9yZXFfc3RhdGVfZ290
X3JlcGx5IHx8ICF4ZW5idXNfb2soKSkgewo+ICsJCS8qIHJlYWQgcmVxLT5zdGF0ZSBiZWZvcmUg
YWxsIG90aGVyIGZpZWxkcyAqLwo+ICsJCXZpcnRfcm1iKCk7Cj4gICAJCXJldHVybiB0cnVlOwo+
ICsJfQo+ICAgCj4gICAJLyogTWFrZSBzdXJlIHRvIHJlcmVhZCByZXEtPnN0YXRlIGVhY2ggdGlt
ZS4gKi8KPiAgIAliYXJyaWVyKCk7Cj4gQEAgLTIwMiw3ICsyMDUsNyBAQCBzdGF0aWMgYm9vbCB0
ZXN0X3JlcGx5KHN0cnVjdCB4Yl9yZXFfZGF0YSAqcmVxKQo+ICAgCj4gICBzdGF0aWMgdm9pZCAq
cmVhZF9yZXBseShzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKPiAgIHsKPiAtCXdoaWxlIChyZXEt
PnN0YXRlICE9IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHkpIHsKPiArCWRvIHsKPiAgIAkJd2FpdF9l
dmVudChyZXEtPndxLCB0ZXN0X3JlcGx5KHJlcSkpOwo+ICAgCj4gICAJCWlmICgheGVuYnVzX29r
KCkpCj4gQEAgLTIxNiw3ICsyMTksNyBAQCBzdGF0aWMgdm9pZCAqcmVhZF9yZXBseShzdHJ1Y3Qg
eGJfcmVxX2RhdGEgKnJlcSkKPiAgIAkJaWYgKHJlcS0+ZXJyKQo+ICAgCQkJcmV0dXJuIEVSUl9Q
VFIocmVxLT5lcnIpOwo+ICAgCj4gLQl9Cj4gKwl9IHdoaWxlIChyZXEtPnN0YXRlICE9IHhiX3Jl
cV9zdGF0ZV9nb3RfcmVwbHkpOwo+ICAgCj4gICAJcmV0dXJuIHJlcS0+Ym9keTsKPiAgIH0KPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
