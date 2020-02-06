Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7415418E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 11:07:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ize1I-0001P9-SN; Thu, 06 Feb 2020 10:04:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ize1H-0001P4-Sv
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 10:04:23 +0000
X-Inumbo-ID: 0c68e706-48c8-11ea-94cb-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c68e706-48c8-11ea-94cb-bc764e2007e4;
 Thu, 06 Feb 2020 10:04:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z9so6341704wrs.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 02:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNrVwRARCFXUhH0kuZwxw+FXqyoT6+S1NZQpF7KjfBk=;
 b=ApjkmrNJXrPkEzwzeVYrhN0PCvPViahIq5lQ2tQyAkyH3rkFh/NuYMI6JH+3DKjlkJ
 +c6vQxkVwXVOj6vYpOxjwBwhEk8GfLzwWfa/sUQIonjzdmrHV9xpcHlaLmr3OhPbukcE
 OSXSqAm9Ln7nV7qzWWPtJcqaDKmcScetQdVDqm6U5zpFNhKMjm4+HYnwqumXbVydacFZ
 6pg+l1f5iggpaAiJuOvINMicYxy3Oc9R4r8/H1d+Vb/NVgGAV8ff6LZ8J3j9e/F0cAwW
 r22sJfCF/uXU9LrbZPJFBW/Zl+Q59PSTDFz/xAsqxs57xQ91AAYmkZvhsBdyRLGhfhIe
 nQuA==
X-Gm-Message-State: APjAAAXsNuQbYMfqgssrF0ZDGFh938Q2BK2vzPplkM0wnHiUWL7+CEr2
 NufIooFbHsYDC1EyMMiBO2g=
X-Google-Smtp-Source: APXvYqzLfBfxDeiLnD/7Ng6qQwoU76a7ehC0jOuQbphTQGY6IuCV+sjHpYkiL6t3TuaaqTdKWzIJrA==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr3116515wru.296.1580983462261; 
 Thu, 06 Feb 2020 02:04:22 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id w1sm3678514wro.72.2020.02.06.02.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 02:04:21 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <20200203105654.22998-4-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eb444c22-de88-e0e9-1a99-3cbd412851a0@xen.org>
Date: Thu, 6 Feb 2020 10:04:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203105654.22998-4-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v9 3/4] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGFtIHNvcnJ5IHRvIGp1bXAgdGhhdCBsYXRlIGluIHRoZSBjb252ZXJzYXRpb24uCgpP
biAwMy8wMi8yMDIwIDEwOjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gICAKPiAtICAgICAgICBp
ZiAoIHVubGlrZWx5KGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIDEgPDwgb3JkZXIpID09ICgx
IDw8IG9yZGVyKSkgKQo+ICsgICAgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkg
JiYKPiArICAgICAgICAgdW5saWtlbHkoZG9tYWluX2FkanVzdF90b3RfcGFnZXMoZCwgMSA8PCBv
cmRlcikgPT0gKDEgPDwgb3JkZXIpKSApCj4gICAgICAgICAgICAgICBnZXRfa25vd25hbGl2ZV9k
b21haW4oZCk7Cj4gLSAgICB9Cj4gICAKPiAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9y
ZGVyKTsgaSsrICkKPiAgICAgICB7Cj4gICAgICAgICAgIEFTU0VSVChwYWdlX2dldF9vd25lcigm
cGdbaV0pID09IE5VTEwpOwo+IC0gICAgICAgIEFTU0VSVCghcGdbaV0uY291bnRfaW5mbyk7Cj4g
ICAgICAgICAgIHBhZ2Vfc2V0X293bmVyKCZwZ1tpXSwgZCk7Cj4gICAgICAgICAgIHNtcF93bWIo
KTsgLyogRG9tYWluIHBvaW50ZXIgbXVzdCBiZSB2aXNpYmxlIGJlZm9yZSB1cGRhdGluZyByZWZj
bnQuICovCj4gLSAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9IFBHQ19hbGxvY2F0ZWQgfCAxOwo+
ICsgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPQo+ICsgICAgICAgICAgICAocGdbaV0uY291bnRf
aW5mbyAmIFBHQ19leHRyYSkgfCBQR0NfYWxsb2NhdGVkIHwgMTsKClRoaXMgaXMgdGVjaG5pY2Fs
bHkgaW5jb3JyZWN0IGJlY2F1c2Ugd2UgYmxpbmRseSBhc3N1bWUgdGhlIHN0YXRlIG9mIHRoZSAK
cGFnZSBpcyBpbnVzZSAod2hpY2ggaXMgdGhhbmtmdWxseSBlcXVhbCB0byAwKS4KClNlZSB0aGUg
ZGlzY3Vzc2lvbiBbMV0uIFRoaXMgaXMgYWxyZWFkeSBhbiBleGlzdGluZyBidWcgaW4gdGhlIGNv
ZGUgYmFzZSAKYW5kIEkgd2lsbCBiZSB0YWtpbmcgY2FyZSBvZiBpdC4gSG93ZXZlci4uLgoKPiAg
ICAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKCZwZ1tpXSwgJmQtPnBhZ2VfbGlzdCk7Cj4gICAg
ICAgfQo+ICAgCj4gQEAgLTIzMTUsMTEgKzIzMzgsNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICphbGxv
Y19kb21oZWFwX3BhZ2VzKAo+ICAgCj4gICAgICAgaWYgKCBtZW1mbGFncyAmIE1FTUZfbm9fb3du
ZXIgKQo+ICAgICAgICAgICBtZW1mbGFncyB8PSBNRU1GX25vX3JlZmNvdW50Owo+IC0gICAgZWxz
ZSBpZiAoIChtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQpICYmIGQgKQo+IC0gICAgewo+IC0g
ICAgICAgIEFTU0VSVCghKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkpOwo+IC0gICAgICAg
IHJldHVybiBOVUxMOwo+IC0gICAgfQo+ICAgCj4gICAgICAgaWYgKCAhZG1hX2JpdHNpemUgKQo+
ICAgICAgICAgICBtZW1mbGFncyAmPSB+TUVNRl9ub19kbWE7Cj4gQEAgLTIzMzIsMTEgKzIzNTAs
MjMgQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1mbGFncywgZCkpID09IE5VTEwpKSApCj4gICAg
ICAgICAgICByZXR1cm4gTlVMTDsKPiAgIAo+IC0gICAgaWYgKCBkICYmICEobWVtZmxhZ3MgJiBN
RU1GX25vX293bmVyKSAmJgo+IC0gICAgICAgICBhc3NpZ25fcGFnZXMoZCwgcGcsIG9yZGVyLCBt
ZW1mbGFncykgKQo+ICsgICAgaWYgKCBkICYmICEobWVtZmxhZ3MgJiBNRU1GX25vX293bmVyKSAp
Cj4gICAgICAgewo+IC0gICAgICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIsIG1lbWZsYWdz
ICYgTUVNRl9ub19zY3J1Yik7Cj4gLSAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgaWYg
KCBtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBpOwo+ICsKPiArICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAo
MXVsIDw8IG9yZGVyKTsgaSsrICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAg
QVNTRVJUKCFwZ1tpXS5jb3VudF9pbmZvKTsKPiArICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50
X2luZm8gPSBQR0NfZXh0cmE7CgouLi4gdGhpcyBpcyBwdXJzdWluZyB0aGUgd3JvbmduZXNzIG9m
IHRoZSBjb2RlIGFib3ZlIGFuZCBub3Qgc2FmZSAKYWdhaW5zdCBvZmZsaW5pbmcuCgpXZSBjb3Vs
ZCBhcmd1ZSB0aGlzIGlzIGFuIGFscmVhZHkgZXhpc3RpbmcgYnVnLCBob3dldmVyIEkgYW0gYSBi
aXQgCnVuZWFzZSB0byBhZGQgbW9yZSBhYnVzZSBpbiB0aGUgY29kZS4gSmFuLCB3aGF0IGRvIHlv
dSB0aGluaz8KCj4gKyAgICAgICAgICAgIH0KPiArICAgICAgICB9Cj4gKyAgICAgICAgaWYgKCBh
c3NpZ25fcGFnZXMoZCwgcGcsIG9yZGVyLCBtZW1mbGFncykgKQo+ICsgICAgICAgIHsKPiArICAg
ICAgICAgICAgZnJlZV9oZWFwX3BhZ2VzKHBnLCBvcmRlciwgbWVtZmxhZ3MgJiBNRU1GX25vX3Nj
cnViKTsKPiArICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgfQo+ICAgICAgIH0K
CkNoZWVycywKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMDAyMDQx
MzMzNTcuMzIxMDEtMS1qdWxpZW5AeGVuLm9yZy8KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
