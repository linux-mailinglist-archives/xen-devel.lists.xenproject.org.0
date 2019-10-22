Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD2E00E2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:38:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMqb1-0000iO-3R; Tue, 22 Oct 2019 09:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eab=YP=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iMqb0-0000iJ-5e
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:36:54 +0000
X-Inumbo-ID: 7ad52410-f4af-11e9-bbab-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ad52410-f4af-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 09:36:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a11so1146163wra.6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GrCBnZOHUvRRpHLwj3Uwsc68sejzQVaZtg23m4/K6j8=;
 b=WUuJmF6m2EemZlSV0VSdUd6zUyK3hE0vp07VDo63LwtyKtieaWF1ieOxtezRuiODAn
 yIXV3/iO/YHRd0fgqWNibnC6rTwAeh5HCEAV9+zXG6okCgj7ytJdciRMkZUt+ThkiBoA
 AOprxGtMRoNIJPEPyrjIYMBbbx+6o1jXrVh8re1+WWbFSG3aw+VKcaji4fSmpkT/bj+O
 nnnEekoL5BIa8GSQ5TaU4JtZUxVMbGjMNCGSfvfxVg89K7lS9Hx2I8w3pyr8VWe5MrEL
 9Mo0+WL1QPGOun65Oyck4T/ZHkjA5UVscu7/CqOySAnWfHYiXL2tm+uaCAP/au94rIg+
 CqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GrCBnZOHUvRRpHLwj3Uwsc68sejzQVaZtg23m4/K6j8=;
 b=DcIOKsi6C36L/yErZ0OckiXfvwtNIJpnQ3bWw3cP31Nziuj5NKYaTO58to25SRORkR
 si21rVM25VixDWCrl9edMNWTSb0+up1seOUGvcSEIYirLvBAcx0s5iVvcwpgepTaZ5RB
 76V16BL7drvOl2lcjfEm5OgAkasdqbjY+cH1KP4UBq8UHStJzJjXmY+L+e3MykVVxpMZ
 NWxOR5RGDq7cmI9BGa1EBwBFZjvV6ts9V2wiZOGPoMSBjbcUgr4DRwIj/6J7khelkON/
 Q+0SbWoT5wU9RgDxIH4+MzQOqP396gXzhZM1I6rK2hPd5w9zJSE2Vp+WwQp6/cgqw5P1
 KYZA==
X-Gm-Message-State: APjAAAUyXKXd0aK0flHoR0FQqh9YtF1ADshV7ig03NHa/DAiqmgV3DJz
 cBMBn2btfRc1p7K7vWc5S20=
X-Google-Smtp-Source: APXvYqyPts4CApDpEPLLuEZPPFc0cV9UiFde2SXy+eKy8wFu6ds6+3XR6Ejip2yCblHyQTEJDh0d8A==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr1630547wrf.89.1571737012380; 
 Tue, 22 Oct 2019 02:36:52 -0700 (PDT)
Received: from ?IPv6:2a01:c23:604c:2a00:af2b:2e92:39f9:c05b?
 ([2a01:c23:604c:2a00:af2b:2e92:39f9:c05b])
 by smtp.gmail.com with ESMTPSA id w15sm9134360wro.65.2019.10.22.02.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:36:51 -0700 (PDT)
Message-ID: <1cbd3bf3c5dd48e06fae1c7c5acd541d1bd1ada3.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Tue, 22 Oct 2019 11:33:20 +0200
In-Reply-To: <20191018134754.16362-14-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-14-philmd@redhat.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 13/20] hw/pci-host/piix: Extract
 piix3_create()
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWwgdmllLCAxOC0xMC0yMDE5IGEgbGFzIDE1OjQ3ICswMjAwLCBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSBlc2NyaWJpw7M6Cj4gRXh0cmFjdCB0aGUgUElJWDMgY3JlYXRpb24gY29kZSBmcm9tIHRo
ZSBpNDQwZnhfaW5pdCgpIGZ1bmN0aW9uLgo+IAo+IFJldmlld2VkLWJ5OiBBbGVrc2FuZGFyIE1h
cmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvcGNpLWhvc3Qv
cGlpeC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4g
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3L3BjaS1ob3N0L3BpaXgu
Ywo+IGluZGV4IDJmNGNiY2JmZTkuLjMyOTI3MDNkZTcgMTAwNjQ0Cj4gLS0tIGEvaHcvcGNpLWhv
c3QvcGlpeC5jCj4gKysrIGIvaHcvcGNpLWhvc3QvcGlpeC5jCj4gQEAgLTMzMSw2ICszMzEsMzYg
QEAgc3RhdGljIHZvaWQgaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpkZXYsIEVycm9yCj4gKipl
cnJwKQo+ICAgICAgfQo+ICB9Cj4gIAo+ICtzdGF0aWMgUElJWDNTdGF0ZSAqcGlpeDNfY3JlYXRl
KFBDSUJ1cyAqcGNpX2J1cywgSVNBQnVzICoqaXNhX2J1cykKPiArewo+ICsgICAgUElJWDNTdGF0
ZSAqcGlpeDM7Cj4gKyAgICBQQ0lEZXZpY2UgKnBjaV9kZXY7Cj4gKwo+ICsgICAgLyoKPiArICAg
ICAqIFhlbiBzdXBwb3J0cyBhZGRpdGlvbmFsIGludGVycnVwdCByb3V0ZXMgZnJvbSB0aGUgUENJ
IGRldmljZXMKPiB0bwo+ICsgICAgICogdGhlIElPQVBJQzogdGhlIGZvdXIgcGlucyBvZiBlYWNo
IFBDSSBkZXZpY2Ugb24gdGhlIGJ1cyBhcmUKPiBhbHNvCj4gKyAgICAgKiBjb25uZWN0ZWQgdG8g
dGhlIElPQVBJQyBkaXJlY3RseS4KPiArICAgICAqIFRoZXNlIGFkZGl0aW9uYWwgcm91dGVzIGNh
biBiZSBkaXNjb3ZlcmVkIHRocm91Z2ggQUNQSS4KPiArICAgICAqLwo+ICsgICAgaWYgKHhlbl9l
bmFibGVkKCkpIHsKPiArICAgICAgICBwY2lfZGV2ID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlm
dW5jdGlvbihwY2lfYnVzLCAtMSwgdHJ1ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBUWVBFX1BJSVgzX1hFTl9ERVYKPiBJQ0UpOwo+ICsgICAg
ICAgIHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lfZGV2KTsKPiArICAgICAgICBwY2lfYnVz
X2lycXMocGNpX2J1cywgeGVuX3BpaXgzX3NldF9pcnEsCj4geGVuX3BjaV9zbG90X2dldF9waXJx
LAo+ICsgICAgICAgICAgICAgICAgICAgICBwaWl4MywgWEVOX1BJSVhfTlVNX1BJUlFTKTsKPiAr
ICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgcGNpX2RldiA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRp
ZnVuY3Rpb24ocGNpX2J1cywgLTEsIHRydWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9QSUlYM19ERVZJQ0UpCj4gOwo+ICsgICAgICAg
IHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lfZGV2KTsKPiArICAgICAgICBwY2lfYnVzX2ly
cXMocGNpX2J1cywgcGlpeDNfc2V0X2lycSwgcGNpX3Nsb3RfZ2V0X3BpcnEsCj4gKyAgICAgICAg
ICAgICAgICAgICAgIHBpaXgzLCBQSUlYX05VTV9QSVJRUyk7Cj4gKyAgICAgICAgcGNpX2J1c19z
ZXRfcm91dGVfaXJxX2ZuKHBjaV9idXMsCj4gcGlpeDNfcm91dGVfaW50eF9waW5fdG9faXJxKTsK
PiArICAgIH0KPiArICAgICppc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMoREVW
SUNFKHBpaXgzKSwgImlzYS4wIikpOwo+ICsKPiArICAgIHJldHVybiBwaWl4MzsKPiArfQo+ICsK
PiAgUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIg
KnBjaV90eXBlLAo+ICAgICAgICAgICAgICAgICAgICAgIFBDSUk0NDBGWFN0YXRlICoqcGk0NDBm
eF9zdGF0ZSwKPiAgICAgICAgICAgICAgICAgICAgICBpbnQgKnBpaXgzX2RldmZuLAo+IEBAIC00
MDAsMjcgKzQzMCw4IEBAIFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBl
LCBjb25zdAo+IGNoYXIgKnBjaV90eXBlLAo+ICAgICAgICAgICAgICAgICAgIFBBTV9FWFBBTl9T
SVpFKTsKPiAgICAgIH0KPiAgCj4gLSAgICAvKiBYZW4gc3VwcG9ydHMgYWRkaXRpb25hbCBpbnRl
cnJ1cHQgcm91dGVzIGZyb20gdGhlIFBDSSBkZXZpY2VzCj4gdG8KPiAtICAgICAqIHRoZSBJT0FQ
SUM6IHRoZSBmb3VyIHBpbnMgb2YgZWFjaCBQQ0kgZGV2aWNlIG9uIHRoZSBidXMgYXJlCj4gYWxz
bwo+IC0gICAgICogY29ubmVjdGVkIHRvIHRoZSBJT0FQSUMgZGlyZWN0bHkuCj4gLSAgICAgKiBU
aGVzZSBhZGRpdGlvbmFsIHJvdXRlcyBjYW4gYmUgZGlzY292ZXJlZCB0aHJvdWdoIEFDUEkuICov
Cj4gLSAgICBpZiAoeGVuX2VuYWJsZWQoKSkgewo+IC0gICAgICAgIFBDSURldmljZSAqcGNpX2Rl
diA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24oYiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtMSwgdHJ1ZSwgVFlQRV9QSUlYM19YRU5fREVWSUNFKTsKPiAtICAgICAg
ICBwaWl4MyA9IFBJSVgzX1BDSV9ERVZJQ0UocGNpX2Rldik7Cj4gLSAgICAgICAgcGNpX2J1c19p
cnFzKGIsIHhlbl9waWl4M19zZXRfaXJxLCB4ZW5fcGNpX3Nsb3RfZ2V0X3BpcnEsCj4gLSAgICAg
ICAgICAgICAgICBwaWl4MywgWEVOX1BJSVhfTlVNX1BJUlFTKTsKPiAtICAgIH0gZWxzZSB7Cj4g
LSAgICAgICAgUENJRGV2aWNlICpwY2lfZGV2ID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5j
dGlvbihiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0xLCB0cnVlLCBUWVBFX1BJ
SVgzX0RFVklDRSk7Cj4gLSAgICAgICAgcGlpeDMgPSBQSUlYM19QQ0lfREVWSUNFKHBjaV9kZXYp
Owo+IC0gICAgICAgIHBjaV9idXNfaXJxcyhiLCBwaWl4M19zZXRfaXJxLCBwY2lfc2xvdF9nZXRf
cGlycSwgcGlpeDMsCj4gLSAgICAgICAgICAgICAgICBQSUlYX05VTV9QSVJRUyk7Cj4gLSAgICAg
ICAgcGNpX2J1c19zZXRfcm91dGVfaXJxX2ZuKGIsIHBpaXgzX3JvdXRlX2ludHhfcGluX3RvX2ly
cSk7Cj4gLSAgICB9Cj4gKyAgICBwaWl4MyA9IHBpaXgzX2NyZWF0ZShiLCBpc2FfYnVzKTsKPiAg
ICAgIHBpaXgzLT5waWMgPSBwaWM7Cj4gLSAgICAqaXNhX2J1cyA9IElTQV9CVVMocWRldl9nZXRf
Y2hpbGRfYnVzKERFVklDRShwaWl4MyksICJpc2EuMCIpKTsKPiAtCj4gICAgICAqcGlpeDNfZGV2
Zm4gPSBwaWl4My0+ZGV2LmRldmZuOwo+ICAKPiAgICAgIHJhbV9zaXplID0gcmFtX3NpemUgLyA4
IC8gMTAyNCAvIDEwMjQ7ClJldmlld2VkLWJ5OiBFc3RlYmFuIEJvc3NlIDxlc3RlYmFuYm9zc2VA
Z21haWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
