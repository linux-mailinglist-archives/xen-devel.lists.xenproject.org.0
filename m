Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C215BD19
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:51:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2C2J-00028x-99; Thu, 13 Feb 2020 10:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2C2H-00028s-MS
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:47:57 +0000
X-Inumbo-ID: 4b55cd72-4e4e-11ea-ade5-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b55cd72-4e4e-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 10:47:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so6810847wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 02:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+5s7U8e1eCXsRL8A/c4Z0hrKtmOgyOe8db8+MjjsYKo=;
 b=fkDjjkfUPKcxUBt+lKZRtcSF+c6aWGhrHqMusifE6DrY5Xbv+gbd/bdTZS/bCIz2OS
 TIlqXkHQ6hrjq1ru2H/4RnDrlj3Qj8v52Scq4ntK4jRoCy9hGs4LEoAFLvqGrs+wuEQV
 UkgAEtu8WTgUXCgDgebf7gsIDuWzgOiQfYOawRblgBkeP+RhAaJSoo6J1s9PfaazcaWI
 LnsbDbVij14UCxgXmpaLJgZMLa9xlnoTJXiMDWg7oYpqpPWFI8PvsQfYqmjl4bkwJAkv
 8zhBBalyQKkHpwCAct3XzOQppsUyAEI/WWNSIXV43oR6OCI9lWy64bTjsAlL6udvLl30
 /eNg==
X-Gm-Message-State: APjAAAUjsciTX21FluE0hGOJRapEy2uj8C2Wj22FairaSD2NW/mhBjoD
 d0wRt9gTFRT3a413l66T2sk=
X-Google-Smtp-Source: APXvYqyuDVzd+awrEUPSDgEexZ25jVWgrpkZrDJ2XJmJBPLLkCyNwHhdp3GErHc4hEC3+w4VDHSTKA==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr5352920wml.182.1581590876139; 
 Thu, 13 Feb 2020 02:47:56 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id y185sm2630907wmg.2.2020.02.13.02.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 02:47:55 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <6764d461-f79b-afa1-2623-f1e3451098e4@xen.org>
Date: Thu, 13 Feb 2020 11:47:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-7-dwmw2@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of
 initrdidx when no initrd present
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAwMS8wMi8yMDIwIDAxOjMzLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPiAKPiBSZW1vdmUgYSB0
ZXJuYXJ5IG9wZXJhdG9yIHRoYXQgbWFkZSBteSBicmFpbiBodXJ0Lgo+IAo+IFJlcGxhY2UgaXQg
d2l0aCBzb21ldGhpbmcgc2ltcGxlciB0aGF0IG1ha2VzIGl0IHNvbWV3aGF0IGNsZWFyZXIgdGhh
dAo+IHRoZSBjaGVjayBmb3IgaW5pdHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50IGlzIGJlY2F1c2Ug
bWJpLT5tb2RzX2NvdW50Cj4gaXMgd2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdo
ZW4gaXQgZG9lc24ndCBmaW5kIGFueXRoaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFdv
b2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gLS0tCj4gICB4ZW4vYXJjaC94ODYvc2V0dXAu
YyB8IDkgKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4gaW5kZXggNWY2OGExMzA4Zi4uMTAyMDllNmJmYiAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4g
QEAgLTY4Nyw3ICs2ODcsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIG1iaV9wKQo+ICAgICAgIGNoYXIgKmNtZGxpbmUsICprZXh0cmEsICpsb2FkZXI7
Cj4gICAgICAgdW5zaWduZWQgaW50IGluaXRyZGlkeCwgbnVtX3BhcmtlZCA9IDA7Cj4gICAgICAg
bXVsdGlib290X2luZm9fdCAqbWJpOwo+IC0gICAgbW9kdWxlX3QgKm1vZDsKPiArICAgIG1vZHVs
ZV90ICptb2QsICppbml0cmQgPSBOVUxMOwo+ICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMs
IHJhd19tYXhfcGFnZSwgbW9kdWxlc19oZWFkcm9vbSwgbW9kdWxlX21hcFsxXTsKPiAgICAgICBp
bnQgaSwgaiwgZTgyMF93YXJuID0gMCwgYnl0ZXMgPSAwOwo+ICAgICAgIGJvb2wgYWNwaV9ib290
X3RhYmxlX2luaXRfZG9uZSA9IGZhbHNlLCByZWxvY2F0ZWQgPSBmYWxzZTsKPiBAQCAtMTc5Myw2
ICsxNzkzLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBtYmlfcCkKPiAgICAgICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgfD0gWEVOX1BST0NFU1NP
Ul9QTV9DWDsKPiAgIAo+ICAgICAgIGluaXRyZGlkeCA9IGZpbmRfZmlyc3RfYml0KG1vZHVsZV9t
YXAsIG1iaS0+bW9kc19jb3VudCk7Cj4gKyAgICBpZiAoIGluaXRyZGlkeCA8IG1iaS0+bW9kc19j
b3VudCApCklJVUMsIHRoZSBjaGVjayBvbiBpbml0cmR4ID4gMCB3YXMgcG9pbnRsZXNzIGFzIGJp
dCAwIHdpbGwgYWx3YXlzIGJlIApjbGVhcmVkIChpdCBpcyB1c2VkIGZvciBkb20wIGtlcm5lbCku
IEl0IG1pZ2h0IGJlIHdvcnRoIG1lbnRpb25uaW5nIGl0IAppbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
IFNvbWV0aGluZyBsaWtlOgoKIlRoZSBpbml0cmQgY2FuIG5ldmVyIGJlIGluIHRoZSBmaXJzdCBt
b2R1bGUgKGkuZSBpbml0cmRpZHggPT0gMCkgYXMgCnRoaXMgaXMgYWx3YXlzIHVzZWQgYnkgdGhl
IGRvbTAga2VybmVsLiBTbyB0aGUgY2hlY2sgY2FuIGJlIHNpbXBsaWZ5LiIKCkFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKPiArICAgICAgICBpbml0cmQgPSBtb2QgKyBp
bml0cmRpZHg7Cj4gKwo+ICAgICAgIGlmICggYml0bWFwX3dlaWdodChtb2R1bGVfbWFwLCBtYmkt
Pm1vZHNfY291bnQpID4gMSApCj4gICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORwo+ICAg
ICAgICAgICAgICAgICAgIk11bHRpcGxlIGluaXRyZCBjYW5kaWRhdGVzLCBwaWNraW5nIG1vZHVs
ZSAjJXVcbiIsCj4gQEAgLTE4MTcsOSArMTgyMCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9f
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAgICogV2UncmUgZ29pbmcgdG8g
c2V0dXAgZG9tYWluMCB1c2luZyB0aGUgbW9kdWxlKHMpIHRoYXQgd2Ugc3Rhc2hlZCBzYWZlbHkK
PiAgICAgICAgKiBhYm92ZSBvdXIgaGVhcC4gVGhlIHNlY29uZCBtb2R1bGUsIGlmIHByZXNlbnQs
IGlzIGFuIGluaXRyZCByYW1kaXNrLgo+ICAgICAgICAqLwo+IC0gICAgaWYgKCBjb25zdHJ1Y3Rf
ZG9tMChkb20wLCBtb2QsIG1vZHVsZXNfaGVhZHJvb20sCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgIChpbml0cmRpZHggPiAwKSAmJiAoaW5pdHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50KQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICA/IG1vZCArIGluaXRyZGlkeCA6IE5VTEwsIGNtZGxpbmUp
ICE9IDApCj4gKyAgICBpZiAoIGNvbnN0cnVjdF9kb20wKGRvbTAsIG1vZCwgbW9kdWxlc19oZWFk
cm9vbSwgaW5pdHJkLCBjbWRsaW5lKSAhPSAwICkKPiAgICAgICAgICAgcGFuaWMoIkNvdWxkIG5v
dCBzZXQgdXAgRE9NMCBndWVzdCBPU1xuIik7Cj4gICAKPiAgICAgICBpZiAoIGNwdV9oYXNfc21h
cCApCj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
