Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D917BF8E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:51:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADLC-0006D5-Kv; Fri, 06 Mar 2020 13:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jADLA-0006Ct-S9
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:48:36 +0000
X-Inumbo-ID: 2a9f1e8e-5fb1-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a9f1e8e-5fb1-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:48:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id y3so2539612edj.13
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=V2y1sVB3XFH8Yr6spDECPYM9DHTkUnSAP//RIao7xHI=;
 b=ZOAueiyawvn7fyPgmmvZBucidKXaLzczaVnQ2OSyFi/BBM/T4rF4qmbJ2FudqmIK47
 +0muMqoubpAID4GAc9on5LQ21jpnkbcEMZkXMQd7tykJu6dfSEkB/tCHBT2K9mTHs1re
 Sy8ntG9Q+rhUrZtSO9UnOY8F9srcRlja2AcjpJrnm2xn9MKleKo6uvg6xoCBmuXMqvHv
 dQsRUW/11/YAmoFvgKXMkaNWcYM4zM3dzPTQwl8ULwp3EBT9zU3c9Wj/O8RaMS/kyMJ8
 4cnzICMTsAyAApKncMLhq7Sbcs2KS+XM7pT1bxueBtpNPF4c7p8iTvsCV+gDGcSwpK5A
 6v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=V2y1sVB3XFH8Yr6spDECPYM9DHTkUnSAP//RIao7xHI=;
 b=Dk62t5KC6yAlkcNslchItq9myzDywf/pK7Kg4Ty7V0feuZaPci1Z2hq/onmqstMnGo
 1KT4mHFTL+TKNMRs6vcBRveT+IlIlkbqMvcru30KcDcLWFOqP6/mh7BIbpxqgeb+dQmk
 BiDFQaBbMpPztQlYvy27IuDWS4fEwR/IorgwQw2oaw3+5ThHrPAFBuO5nJ/AfOQhIR2N
 sMFfcGqPlLW5tqrGsdKW571ApFCNvLTYX6pNcXA62I407aJ0e/RYpRA5LqVHcO8jzjxx
 Yt8AAxlhg7TUJqazCd++loCcye1mXX3wRuxOLmCeaDXSOhZRJR3G7/0HhbGJDAx4sz1C
 x5Gw==
X-Gm-Message-State: ANhLgQ3av/uZo51f8YqjU53jBBP6/0gPnRKeMJqAtTnypBF8tjvSs1qX
 B6knm12CET3w0LIDkRMCEoY=
X-Google-Smtp-Source: ADFU+vtTdbkeJKSJcD4/grN92pkHQeaSXCbHa22Esc8b0mZEJSMfmGcsTYwAVhlXMxb7vJ/sJIRP4Q==
X-Received: by 2002:aa7:c486:: with SMTP id m6mr3238502edq.70.1583502511334;
 Fri, 06 Mar 2020 05:48:31 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id z6sm1057301edi.37.2020.03.06.05.48.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:48:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
 <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
In-Reply-To: <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
Date: Fri, 6 Mar 2020 13:48:29 -0000
Message-ID: <001201d5f3bd$ebd549d0$c37fdd70$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV871jFaWJ3Sw84Um/46B4u9wVoqg7k4+Q
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjQ0Cj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogcGR1cnJhbnRAYW16bi5jb207ICdTdGVmYW5v
IFN0YWJlbGxpbmknIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgJ0p1bGllbiBHcmFsbCcgPGp1
bGllbkB4ZW4ub3JnPjsKPiAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrJyA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNv
LnVrPjsgJ0lhbiBKYWNrc29uJwo+IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgJ0dlb3Jn
ZSBEdW5sYXAnIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyAnVGltIERlZWdhbicgPHRpbUB4
ZW4ub3JnPjsKPiAnVGFtYXMgSyBMZW5neWVsJyA8dGFtYXNAdGtsZW5neWVsLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ1JvZ2VyIFBhdSBNb25uw6knCj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS82XSBtbTogYWRkICdpc19z
cGVjaWFsX3BhZ2UnIG1hY3JvLi4uCj4gCj4gT24gMDYuMDMuMjAyMCAxMzozNSwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogWGVu
LWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxm
IE9mIEphbiBCZXVsaWNoCj4gPj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMjoyMAo+ID4+IFRvOiBw
ZHVycmFudEBhbXpuLmNvbQo+ID4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgV2VpIExpdQo+IDx3
bEB4ZW4ub3JnPjsKPiA+PiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUGF1bAo+
ID4+IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA+PiA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+OyB4ZW4tCj4gPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4+IFN1YmplY3Q6IFJlOiBb
WGVuLWRldmVsXSBbUEFUQ0ggdjMgNS82XSBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIG1hY3Jv
Li4uCj4gPj4KPiA+PiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFudEBhbXpuLmNvbSB3cm90
ZToKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+ID4+PiArKysg
Yi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4gPj4+IEBAIC0yMDg3LDE5ICsyMDg3
LDIyIEBAIHN0YXRpYyBpbnQgc2hfcmVtb3ZlX2FsbF9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWluICpk
LCBtZm5fdCBnbWZuLCBnZm5fdCBnZm4pCj4gPj4+ICAgICAgICAgICAqIFRoZSBxZW11IGhlbHBl
ciBwcm9jZXNzIGhhcyBhbiB1bnR5cGVkIG1hcHBpbmcgb2YgdGhpcyBkb20ncyBSQU0KPiA+Pj4g
ICAgICAgICAgICogYW5kIHRoZSBIVk0gcmVzdG9yZSBwcm9ncmFtIHRha2VzIGFub3RoZXIuCj4g
Pj4+ICAgICAgICAgICAqIEFsc28gYWxsb3cgb25lIHR5cGVkIHJlZmNvdW50IGZvcgo+ID4+PiAt
ICAgICAgICAgKiAtIFhlbiBoZWFwIHBhZ2VzLCB0byBtYXRjaCBzaGFyZV94ZW5fcGFnZV93aXRo
X2d1ZXN0KCksCj4gPj4+IC0gICAgICAgICAqIC0gaW9yZXEgc2VydmVyIHBhZ2VzLCB0byBtYXRj
aCBwcmVwYXJlX3JpbmdfZm9yX2hlbHBlcigpLgo+ID4+PiArICAgICAgICAgKiAtIHNwZWNpYWwg
cGFnZXMsIHdoaWNoIGFyZSBleHBsaWNpdGx5IHJlZmVyZW5jZWQgYW5kIG1hcHBlZCBieQo+ID4+
PiArICAgICAgICAgKiAgIFhlbi4KPiA+Pj4gKyAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFn
ZXMsIHdoaWNoIG1heSBiZSBzcGVjaWFsIHBhZ2VzIG9yIG5vcm1hbAo+ID4+PiArICAgICAgICAg
KiAgIGd1ZXN0IHBhZ2VzIHdpdGggYW4gZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5Cj4gPj4+ICsg
ICAgICAgICAqICAgcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPiA+Pj4gICAgICAgICAgICov
Cj4gPj4+ICAgICAgICAgIGlmICggIShzaGFkb3dfbW9kZV9leHRlcm5hbChkKQo+ID4+PiAgICAg
ICAgICAgICAgICAgJiYgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPD0gMwo+
ID4+PiAgICAgICAgICAgICAgICAgJiYgKChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9j
b3VudF9tYXNrKQo+ID4+PiAtICAgICAgICAgICAgICAgICAgID09IChpc194ZW5faGVhcF9wYWdl
KHBhZ2UpIHx8Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgPT0gKGlzX3NwZWNpYWxfcGFnZShw
YWdlKSB8fAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAoaXNfaHZtX2RvbWFpbihkKSAm
JiBpc19pb3JlcV9zZXJ2ZXJfcGFnZShkLCBwYWdlKSkpKSkgKQo+ID4+Cj4gPj4gU2hvdWxkbid0
IHlvdSBkZWxldGUgbW9zdCBvZiB0aGlzIGxpbmUsIGFmdGVyIHRoZSBwcmV2aW91cyBwYXRjaAo+
ID4+IGNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIHRvIFBHQ19leHRyYSBvbmVzPwo+
ID4KPiA+IEkgdGhvdWdodCB0aGF0IHRvbyBvcmlnaW5hbGx5IGJ1dCB0aGVuIEkgcmVhbGlzZSB3
ZSBzdGlsbCBoYXZlIHRvCj4gPiBjYXRlciBmb3IgdGhlICdsZWdhY3knIGVtdWxhdG9ycyB0aGF0
IHN0aWxsIHJlcXVpcmUgSU9SRVEgc2VydmVyCj4gPiBwYWdlcyB0byBiZSBtYXBwZWQgdGhyb3Vn
aCB0aGUgcDJtLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBub3QKPiA+IGJlIFBHQ19leHRyYSBw
YWdlcy4KPiAKPiBPaCwgaW5kZWVkLiAoSSBkb24ndCBzdXBwb3NlIHdlIGNhbiBldmVyIGRvIGF3
YXkgd2l0aCB0aGlzIGxlZ2FjeQo+IG1lY2hhbmlzbT8pCgpJdCdzIHRyaWNreSBiZWNhdXNlIGl0
IHdvdWxkIGVpdGhlciBtZWFuIGJyZWFraW5nIG9sZGVyIChwcmUgcmVzb3VyY2UtbWFwcGluZykg
UUVNVXMsIG9yIGFsbG93aW5nIHRoZSB0b29sc3RhY2sgdG8gYWxsb2NhdGUgdGhlICdzcGVjaWFs
JyBwYWdlcyB3aXRoIGFuIGV4dHJhIGZsYWcgdG8gbWFrZSB0aGVtIFBHQ19leHRyYS4KCj4gCj4g
Pj4gQWxzbyBJIG5vdGljZSB0aGlzIGNvbnN0cnVjdCBpcyB1c2VkIGJ5IHg4NiBjb2RlIG9ubHkg
LSBpcyB0aGVyZQo+ID4+IGEgcGFydGljdWxhciByZWFzb24gaXQgZG9lc24ndCBnZXQgcGxhY2Vk
IGluIGFuIHg4NiBoZWFkZXIgKGF0Cj4gPj4gbGVhc3QgZm9yIHRoZSB0aW1lIGJlaW5nKT8KPiA+
Cj4gPiBQR0NfZXh0cmEgcGFnZXMgYXJlIGNvbW1vbiBzbyBtYXliZSBpdCBpcyBiZXR0ZXIgb2Zm
IGRlZmluZWQgaGVyZQo+ID4gc28gaXQgaXMgYXZhaWxhYmxlIHRvIEFSTSBjb2RlPwo+IAo+IFRv
IGJlIGhvbmVzdCwgbXkgcXVlc3Rpb24gd2FzIG1haW5seSBiYXNlZCBvbiBtZSBiZWluZyBwdXp6
bGVkIHRoYXQKPiBBcm0gKG9yIGNvbW1vbikgY29kZSBkb2Vzbid0IG5lZWQgYW55IHN1Y2ggYWRq
dXN0bWVudC4gQXMgYSByZXN1bHQKPiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgdGhhdCdzIGp1c3Qg
Imx1Y2siIChpbiB3aGljaCBjYXNlIEknZCBhZ3JlZQo+IHRoZSBwbGFjZW1lbnQgY291bGQgcmVt
YWluIGFzIGlzKSwgb3Igd2hldGhlciB0aGVyZSdzIGEgZGVlcGVyCj4gcmVhc29uIGJlaGluZCB0
aGF0LCBsYXJnZWx5IGd1YXJhbnRlZWluZyBBcm0gd291bGQgYWxzbyBuZXZlciBuZWVkCj4gaXQu
Cj4gCgpJJ2xsIGhhdmUgYSBjaGF0IHdpdGggSnVsaWVuIGFuZCBzZWUgd2hhdCBoZSB0aGlua3Mu
CgogIFBhdWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
