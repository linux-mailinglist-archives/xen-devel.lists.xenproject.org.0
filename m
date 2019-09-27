Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B6C046B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:33:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoSm-0007Pl-5C; Fri, 27 Sep 2019 11:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDoSj-0007Oj-Q6
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:31:01 +0000
X-Inumbo-ID: 480aadaa-e11a-11e9-9675-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by localhost (Halon) with ESMTPS
 id 480aadaa-e11a-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 11:31:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so6208342wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 04:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=24tcwIPXOYwj1C0hdQ2lqiJBF07aGDB7RUegllSGYDU=;
 b=FB+07tcYrfZ/IemsVf/dvyzCCuXhC9Z3kF/55HYgdWGWLO62B7M++KbQrldma9xd1+
 Sq+DxQMDGKI7h53cXhFDVtge3ZnzDDqSNwB11FBS1w8UEbfLDRA4MFvJ3Tye2F/dW7ps
 bGS4qCClyssT6okJDv/7p/cX1WCrTxh+sYjReRQMhoMWJvv/LOribW+V9OTNT9p+XTKZ
 sSCjcK8gwbCcmouqdBoADWn5CuVW2FQFaedkOUkBgZ4w4Hhl/MKxBpMg2i9R7JKlSAx2
 wvLS/Yh8rHj3GP+pa3sshrxg6Z/WO9GJiFE+HweDLsbai/cd1ih/ko1X+EVXonWUxvY6
 uDsA==
X-Gm-Message-State: APjAAAXJ6K6h031NVDkZsv2KslIRAYJpuEqtGnpONGTp3M40euMt2yY5
 4n6K9k+pfbWpLXfuU6lQsGg=
X-Google-Smtp-Source: APXvYqzLxZ56+hF+GtHxPSI+YBh0tu/gN0j6W3Jdkxov1XkkzSoJtTEXOnVGy0Skzexqunb3K37uOQ==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr6657257wmk.31.1569583860236; 
 Fri, 27 Sep 2019 04:31:00 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id x6sm10120991wmf.38.2019.09.27.04.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 04:30:59 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:30:58 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190927113058.53xs3sw57as3r3tr@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTI6MjM6NTRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+IC12b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpCj4gPiArc3Rh
dGljIHZvaWQgX19pbml0IHByb2JlX3hlbih2b2lkKQo+IAo+IFdoaWxlIGhlcmUgSSB3b3VsZCBy
ZW5hbWUgdG8geGVuX3Byb2JlLCB0byBtYXRjaCB3aXRoIHRoZSBvdGhlcgo+IGZ1bmN0aW9ucyAo
aWU6IHhlbl9zZXR1cCBiZWxvdyBmb3IgZXhhbXBsZSkuCgpTdXJlLiBJIGNhbiBkbyB0aGF0LiBJ
IGFsd2F5cyB0aG91Z2h0IHRoYXQgc3RyYW5nZSB0b28uCgo+IAo+ID4gIHsKPiA+ICAgICAgaWYg
KCB4ZW5fZ3Vlc3QgKQo+ID4gICAgICAgICAgcmV0dXJuOwo+ID4gQEAgLTg3LDYgKzg3LDExIEBA
IHZvaWQgX19pbml0IHByb2JlX2h5cGVydmlzb3Iodm9pZCkKPiA+ICAgICAgeGVuX2d1ZXN0ID0g
dHJ1ZTsKPiA+ICB9Cj4gPiAgCj4gPiArdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lk
KQo+IAo+IFNob3VsZG4ndCB0aGlzIGxpdmUgaW4gYSBzZXBhcmF0ZSBmaWxlLCBsaWtlIGd1ZXN0
L2d1ZXN0LmMgb3Igc29tZQo+IHN1Y2g/Cj4gCgpJdCdzIGRvbmUgaW4gYSBsYXRlciBwYXRjaC4g
SSBiZWxpZXZlIHlvdSd2ZSBhbHJlYWR5IHNlZW4gaXQuCgo+IEFsc28gaXQgbWlnaHQgYmUgbmlj
ZSB0byBpbnRyb2R1Y2Ugc29tZXRoaW5nIGxpa2U6Cj4gCj4gZW51bSBndWVzdF90eXBlIHsKPiAg
ICAgWEVOX0dVRVNULAo+IH0gZ3Vlc3RfdHlwZTsKPiAKClRoaXMgd29ya3MgZm9yIG1lLgoKPiBT
byB0aGF0IHlvdSBjYW4gYWRkIGEgc3dpdGNoIGhlcmUsIGV2ZW4gaWYgdGhlIG9ubHkgY2FzZSBp
cyBYZW4gQVRNLiBJCj4gZ3Vlc3MgdGhpcyB3aWxsIGJlIGRvbmUgaW4gYSBsYXRlciBwYXRjaCwg
b3IgaW50cm9kdWNlIGFuCj4gaHlwZXJ2aXNvcl9vcHMgc3RydWN0IHRoYXQgY29udGFpbiBwb2lu
dGVycyB0byBmdW5jdGlvbnMgdG8gYWxsb3cgZm9yCj4gZGlmZmVyZW50IGltcGxlbWVudGF0aW9u
cy4KPiAKCkkgZGViYXRlZCB0aGlzLiBUaGVzZSBjaGFuZ2VzIHJlcXVpcmUgbW9yZSBjb2RlIGNo
dXJuIHdpdGggbm8gYXBwYXJlbnQKYmVuZWZpdCwgYnV0IGlmIHBlb3BsZSBhZ3JlZSB0aGlzIGlz
IGJldHRlciBJIGNhbiBtYWtlIHRob3NlIGNoYW5nZXMuCgo+ID4gK3sKPiA+ICsgICAgcHJvYmVf
eGVuKCk7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lk
KQo+ID4gIHsKPiA+ICAgICAgbWZuX3QgbWZuOwo+ID4gQEAgLTI0OSwxMCArMjU0LDggQEAgc3Rh
dGljIHZvaWQgaW5pdF9ldnRjaG4odm9pZCkKPiA+ICAgICAgfQo+ID4gIH0KPiA+ICAKPiA+IC12
b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCj4gPiArc3RhdGljIHZvaWQgX19pbml0
IHhlbl9zZXR1cCh2b2lkKQo+ID4gIHsKPiA+IC0gICAgaW5pdF9tZW1tYXAoKTsKPiA+IC0KPiA+
ICAgICAgbWFwX3NoYXJlZF9pbmZvKCk7Cj4gPiAgCj4gPiAgICAgIHNldF92Y3B1X2lkKCk7Cj4g
PiBAQCAtMjc3LDEzICsyODAsMjUgQEAgdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lk
KQo+ID4gICAgICBpbml0X2V2dGNobigpOwo+ID4gIH0KPiA+ICAKPiA+IC12b2lkIGh5cGVydmlz
b3JfYXBfc2V0dXAodm9pZCkKPiA+ICt2b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQp
Cj4gPiArewo+ID4gKyAgICBpbml0X21lbW1hcCgpOwo+IAo+IEkgd29uZGVyLCBkbyB5b3UgYWxz
byByZXF1aXJlIHRvIG1hcCBoeXBlcnZpc29yIGRhdGEgaW50byB0aGUgZ3Vlc3QKPiBwaHlzbWFw
IHdoZW4gcnVubmluZyBvbiBIeXBlclY/Cj4gCgpZZXMuIFRoZXJlIGFyZSBhIGxvdCBvZiBjb21w
YXJhYmxlIGNvbmNlcHRzIGluIEh5cGVyLVYuIEZvciBleGFtcGxlLAp0aGVyZSBpcyBhIHBhZ2Ug
Y2FsbGVkIFZQIGFzc2lzdCBwYWdlIHdoaWNoIGlzIG1vcmUgb3IgbGVzcyB0aGUgc2FtZSBhcwpY
ZW4ncyB2Y3B1aW5mby4gSXRzIGZvcm1hdCwgY29udGVudCBhbmQgaW50ZXJmYWNlcyBtYXkgYmUg
ZGlmZmVyZW50LCBidXQKY29uY2VwdHVhbGx5IGl0IGlzIHRoZSBzYW1lIGFzIHZjcHVpbmZvLgoK
PiBJcyB0aGVyZSBhIHdheSB3aGVuIHJ1bm5pbmcgb24gSHlwZXJWIHRvIHJlcXVlc3QgdW51c2Vk
IHBoeXNpY2FsCj4gYWRkcmVzcyBzcGFjZSByYW5nZXM/IFdoYXQgWGVuIGN1cnJlbnRseSBkb2Vz
IGluIGluaXRfbWVtbWFwIGlzIHF1aXRlCj4gY3JhcHB5Lgo+IAoKWGVuIGl0c2VsZiBzdGlsbCBu
ZWVkcyB0byBtYW5hZ2UgdGhlIGFkZHJlc3Mgc3BhY2UsIG5vPwoKSSBhZ3JlZSB0aGUgcmFuZ2Vz
ZXQgY29kZSBpbiB4ZW4uYyBpc24ndCBwcmV0dHksIGJ1dCBpdCBkb2VzIHRoZSBqb2IgYW5kCmlz
IG5vdCB0b28gaW50cnVzaXZlLgoKV2VpLgoKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
