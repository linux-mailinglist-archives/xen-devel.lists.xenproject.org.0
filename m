Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60D187EC7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 11:53:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE9ov-0003ZL-O2; Tue, 17 Mar 2020 10:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JZIQ=5C=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jE9ot-0003ZG-QZ
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 10:51:35 +0000
X-Inumbo-ID: 4525fd7e-683d-11ea-bec1-bc764e2007e4
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4525fd7e-683d-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 10:51:35 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id d8so31587263qka.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BgRVPTSGl151zc2iawHCnockqhQDbk9OwqW6Ff35UkM=;
 b=fnuXZzi0wkqkxdSqv8EvUWYd4cCyYvJO3K9uFSdefy/51fdUU9A04V8S9H84M8+0rf
 6eja7naN6FyvZHn59bqQEPpGghPOaikYcUmORfCbFORoiv4iDPaihiyssSiYni0aKYPL
 vY7cKSAgxWTvMZ3TSJO2Xa8xi71T9lr5e5q0BMFUFO7JGFeoqFTiT+MXyMZe7+2VRVY3
 QdLS5DU+UOLFfawT5F+so9mwVdAFOzqjiJkSLIMB+oV5ZpczSJRlnK70VYaPhN4e9WuV
 4wn2WgUuWdN8D9SJI+faSCIHPIwJXfFTIgRHm4tUsvgRVUbfq7RMH1KA8+1mX/NS6m7k
 rf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BgRVPTSGl151zc2iawHCnockqhQDbk9OwqW6Ff35UkM=;
 b=LQizRHLeQ6bd/nJfGoBdtQBeAasjPTUBXYWbWLg5pyCT50Ojg8IFvbkag1365g9Pr9
 Bf910ZhFWqqVDK8UPpIj5Tf8QLN+W6tapi73E4vk1MGyP2nGFyW1iVn5ODQzw95wkifp
 9gMkhx+ZhCaoWhiQiopQDuPOddUS8aWp5rG5UKcS+c7jvL/kghZmHBbrhPt2yvXKxxIp
 zSRAf/Eoa4c/fIBXX8h/ThMlJUVpRZXh45p+fqT1qP/nDE4bVw2g1JmV7I90H4GaR6hR
 3JDTm0XsZhi24vIrwl2MsNhhBKsYzXsZwupsFeiqu82IOtISao2rB/0EpjZCvWhXO2ze
 CpKg==
X-Gm-Message-State: ANhLgQ2r9kZbiNbZiWwn8TXSy6Iwk5Rph0ZaCbi61L4CGQ2hwrSqbf1V
 f1N2NOkeibT3XGUORrf60h8=
X-Google-Smtp-Source: ADFU+vuIwdoPEmyhWMxgfN22AqL0hobAR3cV6dorkfl9KOMkgUjN6OvurDm/iYsEHXVomTSvQWXv/w==
X-Received: by 2002:a37:4cd1:: with SMTP id z200mr3643506qka.324.1584442294785; 
 Tue, 17 Mar 2020 03:51:34 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id q142sm1726503qke.45.2020.03.17.03.51.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Mar 2020 03:51:34 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-3-paul@xen.org>
 <a7ab5e54-6ce1-4e3f-0014-9ecebf90d6fa@suse.com>
 <003f01d5fbbe$64271aa0$2c754fe0$@xen.org>
 <4918e84d-97bc-e816-829d-858cf1e6676d@suse.com>
In-Reply-To: <4918e84d-97bc-e816-829d-858cf1e6676d@suse.com>
Date: Tue, 17 Mar 2020 10:51:31 -0000
Message-ID: <004001d5fc4a$06591ae0$130b50a0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHwiqJiESk3QcuCZQ9sD1TAM5D9uQEylTMIAV//ltAA+WRclgL0bdH8p+N7OsA=
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
aEBzdXNlLmNvbT4KPiBTZW50OiAxNyBNYXJjaCAyMDIwIDEwOjQ1Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdBbmRyZXcgQ29vcGVyJyA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47ICdHZW9yZ2UgRHVubGFwJwo+IDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+OyAnSWFuIEphY2tzb24nIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PjsgJ0p1bGllbiBHcmFsbCcKPiA8anVsaWVuQHhlbi5vcmc+OyAnU3RlZmFubyBTdGFiZWxsaW5p
JyA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdSb2dl
ciBQYXUKPiBNb25uw6knIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDIvNV0gbW06IGtlZXAgUEdDX2V4dHJhIHBhZ2VzIG9uIGEgc2VwYXJhdGUgbGlzdAo+
IAo+IE9uIDE2LjAzLjIwMjAgMTk6MTEsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiA+PiBTZW50OiAxNiBNYXJjaCAyMDIwIDE2OjUzCj4gPj4KPiA+PiBPbiAxMC4wMy4y
MDIwIDE4OjQ5LCBwYXVsQHhlbi5vcmcgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gPj4+IEBAIC0y
MzE0LDcgKzIzMTQsNyBAQCBpbnQgYXNzaWduX3BhZ2VzKAo+ID4+PiAgICAgICAgICBzbXBfd21i
KCk7IC8qIERvbWFpbiBwb2ludGVyIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcgcmVm
Y250LiAqLwo+ID4+PiAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0KPiA+Pj4gICAgICAgICAg
ICAgIChwZ1tpXS5jb3VudF9pbmZvICYgUEdDX2V4dHJhKSB8IFBHQ19hbGxvY2F0ZWQgfCAxOwo+
ID4+PiAtICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwoJnBnW2ldLCAmZC0+cGFnZV9saXN0KTsK
PiA+Pj4gKyAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKCZwZ1tpXSwgcGFnZV90b19saXN0KGQs
ICZwZ1tpXSkpOwo+ID4+PiAgICAgIH0KPiA+Pgo+ID4+IFRoaXMgbW92ZXMgdGhlIG9uZSBleHRy
YSBwYWdlIHdlIGN1cnJlbnRseSBoYXZlIChWTVgnZXMgQVBJQyBhY2Nlc3MKPiA+PiBwYWdlKSB0
byBhIGRpZmZlcmVudCBsaXN0LiBXaXRob3V0IGFkanVzdG1lbnQgdG8gZG9tYWluIGNsZWFudXAs
Cj4gPj4gaG93IGlzIHRoaXMgcGFnZSBub3cgZ29pbmcgdG8gZ2V0IGZyZWVkPyAoVGhpcyBvZiBj
b3Vyc2UgdGhlbiBzaG91bGQKPiA+PiBiZSBleHRlbmRlZCB0byBBcm0sIGV2ZW4gaWYgcmlnaHQg
bm93IHRoZXJlJ3Mgbm8gImV4dHJhIiBwYWdlIHRoZXJlLikKPiA+Pgo+ID4KPiA+IEkgZG9uJ3Qg
dGhpbmsgdGhlcmUgaXMgYW55IG5lZWQgdG8gYWRqdXN0IGFzIHRoZSBjdXJyZW50IGNvZGUgaW4g
d2lsbAo+ID4gZHJvcCB0aGUgYWxsb2NhdGlvbiByZWYgaW4gdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoKSwgc28gaXQgZG9lc24ndAo+ID4gbWF0dGVyIHRoYXQgaXQgaXMgbWlzc2VkIGJ5IHJlbGlu
cXVpc2hfbWVtb3J5KCkuCj4gCj4gSG1tLCB5ZXMuIEl0IGZlZWxzIGxpa2UgdGhpbiBpY2UsIGJ1
dCBJIHRoaW5rIHlvdSdyZSByaWdodC4gTmV2ZXJ0aGVsZXNzCj4gdGhlIGZyZWVpbmcgb2YgZXh0
cmEgcGFnZXMgc2hvdWxkIGltbyB1bHRpbWF0ZWx5IG1vdmUgdG8gdGhlIGNlbnRyYWwKPiBwbGFj
ZSwgaS5lLiBpdCB3b3VsZCBzZWVtIG1vcmUgY2xlYW4gdG8gbWUgaWYgdGhlIHB1dF9wYWdlX2Fs
bG9jX3JlZigpCj4gY2FsbCB3YXMgZHJvcHBlZCBmcm9tIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5n
KCkuCj4gCj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+ID4+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiA+Pj4gQEAgLTYyOSwxMCArNjI5LDggQEAgdHlwZWRl
ZiBzdHJ1Y3QgbW1fcndsb2NrIHsKPiA+Pj4gICAgICBjb25zdCBjaGFyICAgICAgICAqbG9ja2Vy
X2Z1bmN0aW9uOyAvKiBmdW5jIHRoYXQgdG9vayBpdCAqLwo+ID4+PiAgfSBtbV9yd2xvY2tfdDsK
PiA+Pj4KPiA+Pj4gLSNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBwZykgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gLSAgICBwYWdlX2xpc3RfZGVsMihw
ZywgaXNfeGVuX2hlYXBfcGFnZShwZykgPyAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgJihkKS0+eGVucGFnZV9saXN0IDogJihkKS0+cGFn
ZV9saXN0LCAgICAgICAgICAgIFwKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAmKGQpLT5hcmNo
LnJlbG1lbV9saXN0KQo+ID4+PiArI2RlZmluZSBhcmNoX2ZyZWVfaGVhcF9wYWdlKGQsIHBnKSBc
Cj4gPj4+ICsgICAgcGFnZV9saXN0X2RlbDIocGcsIHBhZ2VfdG9fbGlzdCgoZCksIChwZykpLCAm
KGQpLT5hcmNoLnJlbG1lbV9saXN0KQo+ID4+Cj4gPj4gQXJndW1lbnRzIHBhc3NlZCBvbiBhcyBp
cyAoaS5lLiBub3QgYXMgcGFydCBvZiBhbiBleHByZXNzaW9uKSBkb24ndAo+ID4+IG5lZWQgcGFy
ZW50aGVzZXMuCj4gPj4KPiA+Cj4gPiBBcmUgeW91IHNheWluZyBpdCBzaG91bGQgYmU6Cj4gPgo+
ID4gI2RlZmluZSBhcmNoX2ZyZWVfaGVhcF9wYWdlKGQsIHBnKSBcCj4gPiAgICAgcGFnZV9saXN0
X2RlbDIocGcsIHBhZ2VfdG9fbGlzdChkLCBwZyksICYoZCktPmFyY2gucmVsbWVtX2xpc3QpCj4g
Cj4gWWVzLiBCdXQgaWYgdGhpcyBhbmQgdGhlIG90aGVyIGNvc21ldGljIGNoYW5nZXMgYXJlIHRo
ZSBvbmx5IGNoYW5nZXMgdG8KPiBtYWtlLCBJJ2QgYmUgZmluZSB0byBkbyBzbyB3aGlsZSBjb21t
aXR0aW5nIChpZiBubyBvdGhlciByZWFzb24gZm9yIGEKPiB2NyBhcmlzZXMpOgo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFua3MsCgogIFBhdWwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
