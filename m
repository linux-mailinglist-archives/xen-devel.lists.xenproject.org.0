Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C060E187213
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 19:15:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDuDe-0001NE-Aj; Mon, 16 Mar 2020 18:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X7PZ=5B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jDuDc-0001N9-IU
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 18:12:04 +0000
X-Inumbo-ID: a327fcba-67b1-11ea-bec1-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a327fcba-67b1-11ea-bec1-bc764e2007e4;
 Mon, 16 Mar 2020 18:12:03 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id j4so11309675qkc.11
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2020 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=JuXaz0F3M+P6ftpR3jv1ZSc0ZlTmVWNSfShbWnU2g6U=;
 b=D/Kwwyug6iQ8O8x5QAuOXdfPr6tGxUg+Spe2dJbqSpl76DCg/8KHoWU6wpRMKQ+ULx
 NKw9cHam2QyaoNcFe+n42rYkvP9yR1KdIbtFQRuzQfX6goXD+0BDVP6AWAqIRniEHDYZ
 OuI0Kr7mtDCavRmCm4ZyEa3xSYPANHJV0fR2a4UjOjIaw8papw05/Xe2/V3kwybiODA6
 rqrl7uuA9gBSU/o3ttoOK1BshU+6pUbqLFSbRpsj9xqFRUjCP3B5/Rr1i0oEHoJnBD9j
 m+NoZtYiSu5CON5FIgQe9Mh+DWU69FDdjTc4zlSPseAZY6dxx7ASXU1B9kaeiMIkdmsb
 8osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=JuXaz0F3M+P6ftpR3jv1ZSc0ZlTmVWNSfShbWnU2g6U=;
 b=S2ppbpo3s01H4yMnXeV1uhC9K/a5KOoVZAMQBHnwlmGlQhC0sgVXt0jZfjTFpf9yAR
 LJhRme8HloR25uCej+R0taOMIaxG14v8NxBVaeYQOF++5tFCEUNwQ90VENMDM537bpoX
 jKPmVWHO4s+56z3BHzRYTGEspSWIkBFvfRgi99Gq2TvIsdrwJsWl1aY7b0vjn7IkSpFv
 w05UU/0BU0lcZ0s+Pfcy77FC10jRNmOUejh47NCpCxQZOzyP8i6xuClrmcV+MaYEdwi5
 R+TMOdh3y6yqJkKOUzfk/UY0gFfD9iL5dfihTeQmgSTJsdh58qC2GJROtX9SJqihmeb+
 6K2g==
X-Gm-Message-State: ANhLgQ23CGu8RvcZ01o1xV4k2iEpQWHSKTbMWXX7XOFK7xG8Ty37Y/0r
 j1XQ5zI9y4HWOY3k3yIXgYc=
X-Google-Smtp-Source: ADFU+vvMaGiRNZCZJP6t+yfs6wkxFmSpE2Ku/joBChe3Q24Turz01xIqMd8NWNt1E6FbqMtWEQGiAw==
X-Received: by 2002:ae9:e88c:: with SMTP id a134mr982231qkg.183.1584382322911; 
 Mon, 16 Mar 2020 11:12:02 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id l2sm307370qtq.69.2020.03.16.11.12.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2020 11:12:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-3-paul@xen.org>
 <a7ab5e54-6ce1-4e3f-0014-9ecebf90d6fa@suse.com>
In-Reply-To: <a7ab5e54-6ce1-4e3f-0014-9ecebf90d6fa@suse.com>
Date: Mon, 16 Mar 2020 18:11:59 -0000
Message-ID: <003f01d5fbbe$64271aa0$2c754fe0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHwiqJiESk3QcuCZQ9sD1TAM5D9uQEylTMIAV//ltCoAc8ocA==
Subject: Re: [Xen-devel] [PATCH v6 2/5] mm: keep PGC_extra pages on a
 separate list
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxNiBNYXJjaCAyMDIwIDE2OjUzCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47Cj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kK
PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzVdIG1t
OiBrZWVwIFBHQ19leHRyYSBwYWdlcyBvbiBhIHNlcGFyYXRlIGxpc3QKPiAKPiBPbiAxMC4wMy4y
MDIwIDE4OjQ5LCBwYXVsQHhlbi5vcmcgd3JvdGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ID4gQEAgLTI1Nyw2ICsyNTcs
MTMgQEAgdm9pZCBkdW1wX3BhZ2VmcmFtZV9pbmZvKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgICAg
ICAgICAgICAgICAgX3AobWZuX3gocGFnZV90b19tZm4ocGFnZSkpKSwKPiA+ICAgICAgICAgICAg
ICAgICBwYWdlLT5jb3VudF9pbmZvLCBwYWdlLT51LmludXNlLnR5cGVfaW5mbyk7Cj4gPiAgICAg
IH0KPiA+ICsKPiA+ICsgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPmV4dHJhX3Bh
Z2VfbGlzdCApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHByaW50aygiICAgIEV4dHJhUGFnZSAl
cDogY2FmPSUwOGx4LCB0YWY9JSIgUFJ0eXBlX2luZm8gIlxuIiwKPiA+ICsgICAgICAgICAgICAg
ICBfcChtZm5feChwYWdlX3RvX21mbihwYWdlKSkpLAo+ID4gKyAgICAgICAgICAgICAgIHBhZ2Ut
PmNvdW50X2luZm8sIHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvKTsKPiA+ICsgICAgfQo+ID4gICAg
ICBzcGluX3VubG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKPiAKPiBBbm90aGVyIGJsYW5rIGxp
bmUgYWJvdmUgaGVyZSB3b3VsZCBoYXZlIGJlZW4gbmljZS4KPiAKCk9rLgoKPiA+IC0tLSBhL3hl
bi9jb21tb24vcGFnZV9hbGxvYy5jCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+
ID4gQEAgLTIzMTQsNyArMjMxNCw3IEBAIGludCBhc3NpZ25fcGFnZXMoCj4gPiAgICAgICAgICBz
bXBfd21iKCk7IC8qIERvbWFpbiBwb2ludGVyIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRp
bmcgcmVmY250LiAqLwo+ID4gICAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9Cj4gPiAgICAgICAg
ICAgICAgKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfZXh0cmEpIHwgUEdDX2FsbG9jYXRlZCB8IDE7
Cj4gPiAtICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwoJnBnW2ldLCAmZC0+cGFnZV9saXN0KTsK
PiA+ICsgICAgICAgIHBhZ2VfbGlzdF9hZGRfdGFpbCgmcGdbaV0sIHBhZ2VfdG9fbGlzdChkLCAm
cGdbaV0pKTsKPiA+ICAgICAgfQo+IAo+IFRoaXMgbW92ZXMgdGhlIG9uZSBleHRyYSBwYWdlIHdl
IGN1cnJlbnRseSBoYXZlIChWTVgnZXMgQVBJQyBhY2Nlc3MKPiBwYWdlKSB0byBhIGRpZmZlcmVu
dCBsaXN0LiBXaXRob3V0IGFkanVzdG1lbnQgdG8gZG9tYWluIGNsZWFudXAsCj4gaG93IGlzIHRo
aXMgcGFnZSBub3cgZ29pbmcgdG8gZ2V0IGZyZWVkPyAoVGhpcyBvZiBjb3Vyc2UgdGhlbiBzaG91
bGQKPiBiZSBleHRlbmRlZCB0byBBcm0sIGV2ZW4gaWYgcmlnaHQgbm93IHRoZXJlJ3Mgbm8gImV4
dHJhIiBwYWdlIHRoZXJlLikKPiAKCkkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IG5lZWQgdG8g
YWRqdXN0IGFzIHRoZSBjdXJyZW50IGNvZGUgaW4gd2lsbCBkcm9wIHRoZSBhbGxvY2F0aW9uIHJl
ZiBpbiB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpLCBzbyBpdCBkb2Vzbid0IG1hdHRlciB0aGF0
IGl0IGlzIG1pc3NlZCBieSByZWxpbnF1aXNoX21lbW9yeSgpLgoKPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvbW0uaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPiBA
QCAtNjI5LDEwICs2MjksOCBAQCB0eXBlZGVmIHN0cnVjdCBtbV9yd2xvY2sgewo+ID4gICAgICBj
b25zdCBjaGFyICAgICAgICAqbG9ja2VyX2Z1bmN0aW9uOyAvKiBmdW5jIHRoYXQgdG9vayBpdCAq
Lwo+ID4gIH0gbW1fcndsb2NrX3Q7Cj4gPgo+ID4gLSNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFn
ZShkLCBwZykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAg
cGFnZV9saXN0X2RlbDIocGcsIGlzX3hlbl9oZWFwX3BhZ2UocGcpID8gICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAmKGQpLT54ZW5wYWdlX2xp
c3QgOiAmKGQpLT5wYWdlX2xpc3QsICAgICAgICAgICAgXAo+ID4gLSAgICAgICAgICAgICAgICAg
ICAmKGQpLT5hcmNoLnJlbG1lbV9saXN0KQo+ID4gKyNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFn
ZShkLCBwZykgXAo+ID4gKyAgICBwYWdlX2xpc3RfZGVsMihwZywgcGFnZV90b19saXN0KChkKSwg
KHBnKSksICYoZCktPmFyY2gucmVsbWVtX2xpc3QpCj4gCj4gQXJndW1lbnRzIHBhc3NlZCBvbiBh
cyBpcyAoaS5lLiBub3QgYXMgcGFydCBvZiBhbiBleHByZXNzaW9uKSBkb24ndAo+IG5lZWQgcGFy
ZW50aGVzZXMuCj4gCgpBcmUgeW91IHNheWluZyBpdCBzaG91bGQgYmU6CgojZGVmaW5lIGFyY2hf
ZnJlZV9oZWFwX3BhZ2UoZCwgcGcpIFwKICAgIHBhZ2VfbGlzdF9kZWwyKHBnLCBwYWdlX3RvX2xp
c3QoZCwgcGcpLCAmKGQpLT5hcmNoLnJlbG1lbV9saXN0KQoKPwoKPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9tbS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+ID4gQEAgLTU4Myw5
ICs1ODMsOCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZXRfb3JkZXJfZnJvbV9wYWdl
cyh1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQo+ID4gIHZvaWQgc2NydWJfb25lX3BhZ2Uoc3RydWN0
IHBhZ2VfaW5mbyAqKTsKPiA+Cj4gPiAgI2lmbmRlZiBhcmNoX2ZyZWVfaGVhcF9wYWdlCj4gPiAt
I2RlZmluZSBhcmNoX2ZyZWVfaGVhcF9wYWdlKGQsIHBnKSAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiAtICAgIHBhZ2VfbGlzdF9kZWwocGcsIGlzX3hlbl9oZWFwX3BhZ2UocGcpID8gICAgICAg
ICAgICBcCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICYoZCktPnhlbnBhZ2VfbGlzdCA6ICYo
ZCktPnBhZ2VfbGlzdCkKPiA+ICsjZGVmaW5lIGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGcpIFwK
PiA+ICsgICAgcGFnZV9saXN0X2RlbChwZywgcGFnZV90b19saXN0KChkKSwgKHBnKSkpCj4gCj4g
U2FtZSBoZXJlIHRoZW4uCj4gCj4gPiBAQCAtNTM4LDYgKzUzOSwxNyBAQCBzdHJ1Y3QgZG9tYWlu
Cj4gPiAgI2VuZGlmCj4gPiAgfTsKPiA+Cj4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9s
aXN0X2hlYWQgKnBhZ2VfdG9fbGlzdCgKPiA+ICsgICAgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qg
c3RydWN0IHBhZ2VfaW5mbyAqcGcpCj4gPiArewo+ID4gKyAgICBpZiAoIGlzX3hlbl9oZWFwX3Bh
Z2UocGcpICkKPiA+ICsgICAgICAgIHJldHVybiAmZC0+eGVucGFnZV9saXN0Owo+ID4gKyAgICBl
bHNlIGlmICggcGctPmNvdW50X2luZm8gJiBQR0NfZXh0cmEgKQo+IAo+IFVubmVjZXNzYXJ5ICJl
bHNlIi4KPgoKT2ggeWVzLgoKICBQYXVsCgogCj4gSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
