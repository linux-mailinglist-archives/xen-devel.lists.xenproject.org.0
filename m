Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00BB17BFC3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:59:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADUG-0007aS-1W; Fri, 06 Mar 2020 13:58:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jADUE-0007aM-53
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:57:58 +0000
X-Inumbo-ID: 7b8c485c-5fb2-11ea-b74d-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b8c485c-5fb2-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 13:57:57 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id cq8so2635141edb.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=NNoHPMYXivhg8cxAwF13S1d4kdAQP7DbXxhhdXqeSH4=;
 b=pck0Wi3aBedORbmjXM9NhMlWaXlsCBRFmpsA647U3rfhZxydD0wTsA0mlH9/jROnfg
 E2VSIRpZBKG0SFzGztFoUcbCPHgQIknQiTxpoZJ1gNPTJo0e1mc3AY47yn8508ZNf0Ae
 k7oEBjJVk7h1kJU0rAmXuTsnlDBjP53bhRwq8iXT3RY1JiXRoTHjA8HtH3yxFizu3GH4
 0liTEKJGL5cW8a3yhpH2KILiPJ7kKnuzCxS4pbUUE6BivJsiUQxT97sXYsdqA03/Wy39
 hvd0szQs0qbuY+5zVmp20phcJk76qJfhNzlRrUQR0teLp53j53mgWTqq4AfDKFrZH/vs
 AoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=NNoHPMYXivhg8cxAwF13S1d4kdAQP7DbXxhhdXqeSH4=;
 b=q6jQuNJCQFVoW/VMKtbNZoSLEP4zah7GB0ElLb19YLSHycE83cHmWPkgzXISvS5ei5
 /T5UNW0sfbuBYd3+5M5mkVK1ufKn8EPakt3oYLXiNThg2rpxBcldsycuiTUG18aIIdtn
 QMfDcKf7+GrGbjAdmSPQ5EUbJ/QB9L8QsvjQLOgpbDCTdJHo32EpLdKFP92FHp821o2K
 9BQDQYXSBcOHDd8JJDu7MmgagNbAoOSRWqEejOlIeZMxOabGglc7LeykPFNWFjY0+xtf
 /Q+jUwEanxlmv1sA4qKIaMVO0+0mqNW5dVzjlo9d5UUh/GXgte9Plk2mQnMlkcoLjHvD
 RumA==
X-Gm-Message-State: ANhLgQ2cU4EUTbIXKaEGLOLyQcNbMFiUkCxJ95gKE/roZ0DkGRnww7gZ
 hcx3c2xpBuX4PPEyMeviySo=
X-Google-Smtp-Source: ADFU+vvYwAsH+s6UGF5eV8tVYsbE0ZyIzGEegQnmdmx2z9iKeNM0xD6wZJmhy8UhrDUti3XJ8OgzNw==
X-Received: by 2002:a05:6402:95b:: with SMTP id
 h27mr3213313edz.114.1583503076685; 
 Fri, 06 Mar 2020 05:57:56 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id ss15sm2016733ejb.10.2020.03.06.05.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:57:56 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
 <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
 <001201d5f3bd$ebd549d0$c37fdd70$@xen.org>
 <f864b32c-57c7-757d-94cd-d8e8b6d6a8e0@suse.com>
In-Reply-To: <f864b32c-57c7-757d-94cd-d8e8b6d6a8e0@suse.com>
Date: Fri, 6 Mar 2020 13:57:54 -0000
Message-ID: <001301d5f3bf$3cc51630$b64f4290$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV876OFMDQQjansUuaWPm55+4856g7lkVA
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
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjUyCj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogcGR1cnJhbnRAYW16bi5jb207ICdTdGVmYW5v
IFN0YWJlbGxpbmknIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgJ0p1bGllbiBHcmFsbCcgPGp1
bGllbkB4ZW4ub3JnPjsKPiAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrJyA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgJ0lhbiBKYWNrc29uJyA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT47ICdHZW9yZ2UgRHVubGFwJwo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyAn
VGltIERlZWdhbicgPHRpbUB4ZW4ub3JnPjsgJ1RhbWFzIEsgTGVuZ3llbCcgPHRhbWFzQHRrbGVu
Z3llbC5jb20+OyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdSb2dlciBQYXUg
TW9ubsOpJyA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1
LzZdIG1tOiBhZGQgJ2lzX3NwZWNpYWxfcGFnZScgbWFjcm8uLi4KPiAKPiBPbiAwNi4wMy4yMDIw
IDE0OjQ4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDog
MDYgTWFyY2ggMjAyMCAxMzo0NAo+ID4+IFRvOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFp
bC5jb20+Cj4gPj4gQ2M6IHBkdXJyYW50QGFtem4uY29tOyAnU3RlZmFubyBTdGFiZWxsaW5pJyA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47ICdKdWxpZW4gR3JhbGwnCj4gPGp1bGllbkB4ZW4ub3Jn
PjsKPiA+PiAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnS29ucmFkIFJ6ZXN6dXRlayBXaWxrJyA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+ID4+IDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsg
J0lhbiBKYWNrc29uJwo+ID4+IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgJ0dlb3JnZSBE
dW5sYXAnIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyAnVGltIERlZWdhbicKPiA8dGltQHhl
bi5vcmc+Owo+ID4+ICdUYW1hcyBLIExlbmd5ZWwnIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyAnUm9nZXIgUGF1IE1vbm7DqScKPiA+PiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzZdIG1tOiBh
ZGQgJ2lzX3NwZWNpYWxfcGFnZScgbWFjcm8uLi4KPiA+Pgo+ID4+IE9uIDA2LjAzLjIwMjAgMTM6
MzUsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2pl
Y3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPiA+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIw
MjAgMTI6MjAKPiA+Pj4+IFRvOiBwZHVycmFudEBhbXpuLmNvbQo+ID4+Pj4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBXZWkgTGl1Cj4gPj4gPHdsQHhlbi5vcmc+Owo+ID4+Pj4gS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwKPiA+Pj4+IER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBE
dW5sYXAKPiA+Pj4+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IHhlbi0KPiA+
Pj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMg
NS82XSBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIG1hY3JvLi4uCj4gPj4+Pgo+ID4+Pj4gT24g
MDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gPj4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+ID4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+Pj4+PiBAQCAtMjA4NywxOSArMjA4NywyMiBAQCBzdGF0
aWMgaW50IHNoX3JlbW92ZV9hbGxfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgZ21m
biwgZ2ZuX3QKPiBnZm4pCj4gPj4+Pj4gICAgICAgICAgICogVGhlIHFlbXUgaGVscGVyIHByb2Nl
c3MgaGFzIGFuIHVudHlwZWQgbWFwcGluZyBvZiB0aGlzIGRvbSdzIFJBTQo+ID4+Pj4+ICAgICAg
ICAgICAqIGFuZCB0aGUgSFZNIHJlc3RvcmUgcHJvZ3JhbSB0YWtlcyBhbm90aGVyLgo+ID4+Pj4+
ICAgICAgICAgICAqIEFsc28gYWxsb3cgb25lIHR5cGVkIHJlZmNvdW50IGZvcgo+ID4+Pj4+IC0g
ICAgICAgICAqIC0gWGVuIGhlYXAgcGFnZXMsIHRvIG1hdGNoIHNoYXJlX3hlbl9wYWdlX3dpdGhf
Z3Vlc3QoKSwKPiA+Pj4+PiAtICAgICAgICAgKiAtIGlvcmVxIHNlcnZlciBwYWdlcywgdG8gbWF0
Y2ggcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPiA+Pj4+PiArICAgICAgICAgKiAtIHNwZWNp
YWwgcGFnZXMsIHdoaWNoIGFyZSBleHBsaWNpdGx5IHJlZmVyZW5jZWQgYW5kIG1hcHBlZCBieQo+
ID4+Pj4+ICsgICAgICAgICAqICAgWGVuLgo+ID4+Pj4+ICsgICAgICAgICAqIC0gaW9yZXEgc2Vy
dmVyIHBhZ2VzLCB3aGljaCBtYXkgYmUgc3BlY2lhbCBwYWdlcyBvciBub3JtYWwKPiA+Pj4+PiAr
ICAgICAgICAgKiAgIGd1ZXN0IHBhZ2VzIHdpdGggYW4gZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5
Cj4gPj4+Pj4gKyAgICAgICAgICogICBwcmVwYXJlX3JpbmdfZm9yX2hlbHBlcigpLgo+ID4+Pj4+
ICAgICAgICAgICAqLwo+ID4+Pj4+ICAgICAgICAgIGlmICggIShzaGFkb3dfbW9kZV9leHRlcm5h
bChkKQo+ID4+Pj4+ICAgICAgICAgICAgICAgICAmJiAocGFnZS0+Y291bnRfaW5mbyAmIFBHQ19j
b3VudF9tYXNrKSA8PSAzCj4gPj4+Pj4gICAgICAgICAgICAgICAgICYmICgocGFnZS0+dS5pbnVz
ZS50eXBlX2luZm8gJiBQR1RfY291bnRfbWFzaykKPiA+Pj4+PiAtICAgICAgICAgICAgICAgICAg
ID09IChpc194ZW5faGVhcF9wYWdlKHBhZ2UpIHx8Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICA9PSAoaXNfc3BlY2lhbF9wYWdlKHBhZ2UpIHx8Cj4gPj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgKGlzX2h2bV9kb21haW4oZCkgJiYgaXNfaW9yZXFfc2VydmVyX3BhZ2UoZCwgcGFnZSkp
KSkpICkKPiA+Pj4+Cj4gPj4+PiBTaG91bGRuJ3QgeW91IGRlbGV0ZSBtb3N0IG9mIHRoaXMgbGlu
ZSwgYWZ0ZXIgdGhlIHByZXZpb3VzIHBhdGNoCj4gPj4+PiBjb252ZXJ0ZWQgdGhlIGlvcmVxIHNl
cnZlciBwYWdlcyB0byBQR0NfZXh0cmEgb25lcz8KPiA+Pj4KPiA+Pj4gSSB0aG91Z2h0IHRoYXQg
dG9vIG9yaWdpbmFsbHkgYnV0IHRoZW4gSSByZWFsaXNlIHdlIHN0aWxsIGhhdmUgdG8KPiA+Pj4g
Y2F0ZXIgZm9yIHRoZSAnbGVnYWN5JyBlbXVsYXRvcnMgdGhhdCBzdGlsbCByZXF1aXJlIElPUkVR
IHNlcnZlcgo+ID4+PiBwYWdlcyB0byBiZSBtYXBwZWQgdGhyb3VnaCB0aGUgcDJtLCBpbiB3aGlj
aCBjYXNlIHRoZXkgd2lsbCBub3QKPiA+Pj4gYmUgUEdDX2V4dHJhIHBhZ2VzLgo+ID4+Cj4gPj4g
T2gsIGluZGVlZC4gKEkgZG9uJ3Qgc3VwcG9zZSB3ZSBjYW4gZXZlciBkbyBhd2F5IHdpdGggdGhp
cyBsZWdhY3kKPiA+PiBtZWNoYW5pc20/KQo+ID4KPiA+IEl0J3MgdHJpY2t5IGJlY2F1c2UgaXQg
d291bGQgZWl0aGVyIG1lYW4gYnJlYWtpbmcgb2xkZXIgKHByZQo+ID4gcmVzb3VyY2UtbWFwcGlu
ZykgUUVNVXMsCj4gCj4gRGlkbid0IGV2ZW4gcWVtdS10cmFkIGdldCBzd2l0Y2hlZD8gKEFueXdh
eSwgbm90IGEgYmlnIGRlYWwgaGVyZSwKPiBqdXN0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHRo
aXMgbGFyZ2UgY29uZGl0aW9uYWwgY291bGQgaGF2ZQo+IGJlZW4gc2hydW5rIGEgbGl0dGxlIGlu
IHNpemUuKQoKWWVzLCB0cmFkIGlzIHN3aXRjaGVkIGJ1dCBJIHRob3VnaHQgb3VyIHBvc2l0aW9u
IHdhcyB0aGF0IHdlIHN1cHBvcnRlZCB1c2Ugb2YgYXJiaXRyYXJ5IGRpc3RybyB2ZXJzaW9ucyBv
ZiBRRU1VIGluIHdoaWNoIGNhc2UgYW55IGNvbXBhdCBjb2RlIHJlYWxseSBkb2VzIGhhdmUgdG8g
c3RpY2sgYXJvdW5kIGZvciBhIHZlcnkgbG9uZyB0aW1lIDotKAoKPiAKPiA+IG9yIGFsbG93aW5n
IHRoZSB0b29sc3RhY2sgdG8gYWxsb2NhdGUgdGhlICdzcGVjaWFsJyBwYWdlcyB3aXRoCj4gPiBh
biBleHRyYSBmbGFnIHRvIG1ha2UgdGhlbSBQR0NfZXh0cmEuCj4gCj4gRG9lc24ndCBzb3VuZCBp
bXBvc3NpYmxlLCBidXQgYWxzbyBub3Qgc29tZXRoaW5nIHdlIHdhbnQgdG8gZWFnZXJseQo+IGdv
IGZvci4KPiAKCk5vLCBwcm9iYWJseSBub3Qgd29ydGggaXQganVzdCB0byBzYXZlIGRvaW5nIHRo
aXMgdGVzdC4KCiAgUGF1bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
