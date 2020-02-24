Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50616A375
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:06:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6AZn-0000ez-5A; Mon, 24 Feb 2020 10:02:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6AZl-0000eu-1I
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:02:57 +0000
X-Inumbo-ID: d40d24fc-56ec-11ea-ade5-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d40d24fc-56ec-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 10:02:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e10so11168986edv.9
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 02:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o9CspTSeNAsOCh9Cm9cPE+n4qWXddGDSS7sefO9tTA0=;
 b=ZBQfyvaR7sSQ3f0K3GIZM7HC5VrRDB1AWNmzcOkZIvlSDj3tBrpjYQYwRG8tvMU6tM
 a1zb1VD9EONjdlko2NFgr8k25PhID9TPptTbyuivp4txRrp3j+llUULG0jJZKK+mByhQ
 /4saVeFS+yw8aGjl+FPNeE1caYOnuTATusbSJrsc+2HjY80fdvp7/RdzZds3oSlUmkkG
 EtWo+0I+vj7oBkTS52gXHgYwOijhznbwkIo6UB3jhf8bKZ3yfZkBCxeHLiugyDCTYybC
 ePzUnPcBGev1NK689pv4bWitT4T5W+jGyl6Mgd/eNbEEpGEvtr0Ik7YlPEbJHM2x0z0i
 0znw==
X-Gm-Message-State: APjAAAVh5URaCPVo/5tb7+a1sICdMfftRTF3YG08mG48OuIy3Iu63wFB
 g2ClE0D5Zpa68V7TFlrHsvNOSmUGacc=
X-Google-Smtp-Source: APXvYqy8s9JpJSK3YawixCTrrY0DaPQ0qLjEonlmSY8MXDwE+C0Cv8HbjsTp48mvkSsJ6u9NCHK9mA==
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr44489095ejw.62.1582538575373; 
 Mon, 24 Feb 2020 02:02:55 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id n10sm779063ejk.67.2020.02.24.02.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 02:02:54 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
Date: Mon, 24 Feb 2020 10:02:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224084400.94482-2-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpUaGUgbG9naWMgZm9yIEFybTY0IGFuZCBBcm0zMiBsb29rcyBnb29kIHRvIG1l
LiBJIGp1c3QgaGF2ZSBvbmUgcXVlc3Rpb24gCmJlbG93LgoKT24gMjQvMDIvMjAyMCAwODo0Mywg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRvIHg4NiBhbmQgQXJtLiBUaGlzIHBlcmZvcm1zIGFu
IGF0b21pYyBBTkQgb3BlcmF0aW9uIGFnYWluc3QgYW4KPiBhdG9taWNfdCB2YXJpYWJsZSB3aXRo
IHRoZSBwcm92aWRlZCBtYXNrLgo+IAo+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IC0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMu
aCB8IDE3ICsrKysrKysrKysrKysrKysrCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2F0
b21pYy5oIHwgMTQgKysrKysrKysrKysrKysKPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWlj
LmggICAgICAgfCAgOCArKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmgg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCj4gaW5kZXggYzAzZWI2ODRjZC4u
NDYzNzM4MWJjYyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21p
Yy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaAo+IEBAIC05Niw2
ICs5NiwyMyBAQCBzdGF0aWMgaW5saW5lIGludCBhdG9taWNfc3ViX3JldHVybihpbnQgaSwgYXRv
bWljX3QgKnYpCj4gICAJcmV0dXJuIHJlc3VsdDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5l
IHZvaWQgYXRvbWljX2FuZCh1bnNpZ25lZCBpbnQgbSwgYXRvbWljX3QgKnYpCgpBbGwgdGhlIGF0
b21pYyBoZWxwZXJzIGhhdmUgdGFrZW4gYSBzaWduZWQgaW50IHNvIGZhciBiZWNhdXNlIHRoZSAK
Y291bnRlciBpcyBhbiBpbnQuIEFueSByZWFzb24gdG8gZGl2ZXJnZSBmcm9tIHRoYXQ/Cgo+ICt7
Cj4gKwl1bnNpZ25lZCBsb25nIHRtcDsKPiArCWludCByZXN1bHQ7Cj4gKwo+ICsJcHJlZmV0Y2h3
KCZ2LT5jb3VudGVyKTsKPiArCV9fYXNtX18gX192b2xhdGlsZV9fKCJAIGF0b21pY19hbmRcbiIK
PiArIjE6CWxkcmV4CSUwLCBbJTNdXG4iCj4gKyIJYW5kCSUwLCAlMCwgJTRcbiIKPiArIglzdHJl
eAklMSwgJTAsIFslM11cbiIKPiArIgl0ZXEJJTEsICMwXG4iCj4gKyIJYm5lCTFiIgo+ICsJOiAi
PSZyIiAocmVzdWx0KSwgIj0mciIgKHRtcCksICIrUW8iICh2LT5jb3VudGVyKQo+ICsJOiAiciIg
KCZ2LT5jb3VudGVyKSwgIklyIiAobSkKPiArCTogImNjIik7Cj4gK30KPiArCj4gICBzdGF0aWMg
aW5saW5lIGludCBhdG9taWNfY21weGNoZyhhdG9taWNfdCAqcHRyLCBpbnQgb2xkLCBpbnQgbmV3
KQo+ICAgewo+ICAgCWludCBvbGR2YWw7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vYXJtNjQvYXRvbWljLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2F0b21pYy5oCj4g
aW5kZXggYmNlMzhkNGNhMi4uMmY5MDZmMDI2NSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2FybTY0L2F0b21pYy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9h
dG9taWMuaAo+IEBAIC05MSw2ICs5MSwyMCBAQCBzdGF0aWMgaW5saW5lIGludCBhdG9taWNfc3Vi
X3JldHVybihpbnQgaSwgYXRvbWljX3QgKnYpCj4gICAJcmV0dXJuIHJlc3VsdDsKPiAgIH0KPiAg
IAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXRvbWljX2FuZCh1bnNpZ25lZCBpbnQgbSwgYXRvbWlj
X3QgKnYpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdG1wOwo+ICsJaW50IHJlc3VsdDsKPiArCj4g
Kwlhc20gdm9sYXRpbGUoIi8vIGF0b21pY19hbmRcbiIKPiArIjE6CWxkeHIJJXcwLCAlMlxuIgo+
ICsiCWFuZAkldzAsICV3MCwgJXczXG4iCj4gKyIJc3R4cgkldzEsICV3MCwgJTJcbiIKPiArIglj
Ym56CSV3MSwgMWIiCj4gKwk6ICI9JnIiIChyZXN1bHQpLCAiPSZyIiAodG1wKSwgIitRIiAodi0+
Y291bnRlcikKPiArCTogIklyIiAobSkpOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGlubGluZSBpbnQg
YXRvbWljX2NtcHhjaGcoYXRvbWljX3QgKnB0ciwgaW50IG9sZCwgaW50IG5ldykKPiAgIHsKPiAg
IAl1bnNpZ25lZCBsb25nIHRtcDsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9h
dG9taWMuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWljLmgKPiBpbmRleCA2ODJiY2Y5MWIx
Li4yMTc5NGJmZTdiIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWljLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2F0b21pYy5oCj4gQEAgLTIyNCw2ICsyMjQsMTQg
QEAgc3RhdGljIGlubGluZSBpbnQgYXRvbWljX2FkZF91bmxlc3MoYXRvbWljX3QgKnYsIGludCBh
LCBpbnQgdSkKPiAgICAgICByZXR1cm4gYzsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgYXRvbWljX2FuZCh1bnNpZ25lZCBpbnQgbSwgYXRvbWljX3QgKnYpCj4gK3sKPiArICAgIGFz
bSB2b2xhdGlsZSAoCj4gKyAgICAgICAgImxvY2s7IGFuZGwgJTEsJTAiCj4gKyAgICAgICAgOiAi
PW0iICgqKHZvbGF0aWxlIGludCAqKSZ2LT5jb3VudGVyKQo+ICsgICAgICAgIDogImlyIiAobSks
ICJtIiAoKih2b2xhdGlsZSBpbnQgKikmdi0+Y291bnRlcikgKTsKPiArfQo+ICsKPiAgICNkZWZp
bmUgYXRvbWljX3hjaGcodiwgbmV3KSAoeGNoZygmKCh2KS0+Y291bnRlciksIG5ldykpCj4gICAK
PiAgICNlbmRpZiAvKiBfX0FSQ0hfWDg2X0FUT01JQ19fICovCj4gCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
