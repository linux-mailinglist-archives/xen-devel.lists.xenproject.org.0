Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB6BF3F0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:19:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTdi-0005sE-8u; Thu, 26 Sep 2019 13:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDTdg-0005s9-TR
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:16:56 +0000
X-Inumbo-ID: e9acc6f4-e05f-11e9-97fb-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id e9acc6f4-e05f-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 13:16:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y19so2740153wrd.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p0HzFE3Sm4z/W5G2mNbAOr/p4tg7v8m2GqndqdKpZ6Y=;
 b=lLIbbvYGBQLqncBCpNWec6jDMjqucQ2y4tlYtcjjvqF7+xTYnyV246UbWZNbo/MhuZ
 0gPwX5qtQ4srsVPTUFZyd+E4NKkd7ezHAOECtToLZsgFlw3gTPrYTvvve+g/rPBcCI/z
 mAJSZUimI8iPEh5DnzqAnIFaDhQKYXHsscGQf1NPVjfD9mxWBHghJPb9QuVJS8EU3juf
 tE/C0+jsLvhxATEnAJy2lNy3uwIslxBpH1zxeK2owTYwsTDgh4rGIhJS/rM99j9BISkA
 4hGi9SM9ginqw4YE8YXzUbQbpdRok1QfjaKewog3mV2OXvoKtOVai9xfOWVNuDlJRu5j
 3d3A==
X-Gm-Message-State: APjAAAURvau71AhyUL6Zj3D+fFNSbdyIYolcaUNWkLyC4i7tlmTr6Iax
 5ntdXaUMJTN2IPILWkafVKA=
X-Google-Smtp-Source: APXvYqwS2JsmpFU0cOKDcdxTxIK84hXvLQMGojsl6zZkqNWgTR9CJ+Do1R4ohWYzb6zbrfNtEmppXQ==
X-Received: by 2002:adf:fe92:: with SMTP id l18mr2899673wrr.369.1569503815480; 
 Thu, 26 Sep 2019 06:16:55 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id v11sm3314210wrv.54.2019.09.26.06.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:16:54 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:16:53 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926131653.sunfgehtp4zi4fvt@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <6d79e6301ff15af71b21c64d10760abb9775b626.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d79e6301ff15af71b21c64d10760abb9775b626.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 58/84] x86/mm: fix leaks in
 map_xen_pagetable.
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MjFBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
Tm90IHVubWFwcGluZyBwYWdlcyBhZnRlciBtYXBfeGVuX3BhZ2V0YWJsZSBjYW4gbGVhayB0aGUg
dmlydHVhbCBhZGRyZXNzCj4gc3BhY2Ugb3ZlciB0aW1lLgoKSSB1bmRlcnN0YW5kIHRoaXMgcGFy
dCwgYnV0IC4uLgoKPiBBbHNvIHRoaXMgZml4IG1ha2VzIHZtYXBfdG9fbWZuIG5vbi10cml2aWFs
IHRvIGJlIGEKPiBtYWNyby4gVGhlcmUgbWlnaHQgYmUgYmV0dGVyIG9wdGlvbnMgYnV0IG1vdmUg
aXQgaW50byB2bWFwLmMgZm9yIG5vdy4KPiAKCi4uLiBub3QgdGhpcyBwYXJ0LgoKPiBTaWduZWQt
b2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+IC0tLQo+ICB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgICB8ICA1ICstLS0tCj4gIHhlbi9jb21tb24vdm1hcC5jICAgICAg
ICAgIHwgMTMgKysrKysrKysrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggICB8ICAy
IC0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnZS5oIHwgIDIgLS0KPiAgeGVuL2luY2x1ZGUv
eGVuL3ZtYXAuaCAgICAgfCAgMyArKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBi
L3hlbi9hcmNoL3g4Ni9tbS5jCj4gaW5kZXggYjJiMmVkYmVkMS4uMTQ1YzVhYjQ3YyAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAg
LTUxNjAsNiArNTE2MCw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICEobDJlX2dldF9mbGFncyhvbDJlKSAmIF9QQUdFX1BTRSkgKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwyZV9nZXRfbWZu
KG9sMmUpKTsKPiAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAg
VU5NQVBfWEVOX1BBR0VUQUJMRShsMnQpOwoKVGhpcyBpcyBwcmVzdW1hYmx5IHRoZSBpc3N1ZSB5
b3UgdHJ5IHRvIGZpeC4KCj4gICAgICAgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxl
KGwydF9tZm4pOwo+ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICB9Cj4gQEAgLTUy
MjUsNyArNTIyNiw2IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAo+ICAgICAgICAgICAgICAgICAg
bDNlX3dyaXRlX2F0b21pYyhwbDNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsM2VfZnJvbV9tZm4obDJ0X21mbiwgX19QQUdFX0hZUEVSVklTT1IpKTsKPiAgICAgICAgICAg
ICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEUobDJ0KTsKPiAtICAgICAgICAgICAgICAgIGwydCA9
IE5VTEw7CgpUaGlzIGFuZCBzaW1pbGFyIGNoYW5nZXMgYmVsb3cgYXJlIGlycmVsZXZhbnQgdG8g
dGhlIGJ1ZyB5b3VyIHRyeSB0bwpmaXguCgpVTk1BUF9YRU5fUEFHRVRBQkxFIGFscmVhZHkgc2V0
cyBsWHQgdG8gTlVMTC4gRGVsZXRpbmcgdGhlc2UgdHdvIGxpbmVzCmFyZSBmaW5lLCBidXQgdGhl
eSBzaG91bGQgYmUgZm9sZGVkIGludG8gb25lIG9mIHRoZSBwcmV2aW91cyBwYXRjaGVzCndoZXJl
IFVOTUFQX1hFTl9QQUdFVEFCTEUgd2FzIHVzZWQgaW4gdGhpcyBmdW5jdGlvbi4KCj4gICAgICAg
ICAgICAgIH0KPiAgICAgICAgICAgICAgaWYgKCBsb2NraW5nICkKPiAgICAgICAgICAgICAgICAg
IHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7Cj4gQEAgLTUzNDYsNyArNTM0Niw2IEBAIGlu
dCBtYXBfcGFnZXNfdG9feGVuKAo+ICAgICAgICAgICAgICAgICAgICAgIGwyZV93cml0ZV9hdG9t
aWMocGwyZSwgbDJlX2Zyb21fbWZuKGwxdF9tZm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpKTsKPiAg
ICAgICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFKGwxdCk7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgbDF0ID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAg
ICAgICAgIGlmICggbG9ja2luZyApCj4gICAgICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2so
Jm1hcF9wZ2Rpcl9sb2NrKTsKPiBAQCAtNTU4OSw3ICs1NTg4LDYgQEAgaW50IG1vZGlmeV94ZW5f
bWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBu
ZikKPiAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhw
bDNlLCBsM2VfZnJvbV9tZm4obWZuLCBfX1BBR0VfSFlQRVJWSVNPUikpOwo+ICAgICAgICAgICAg
ICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRShsMnQpOwo+IC0gICAgICAgICAgICAgICAgbDJ0ID0g
TlVMTDsKPiAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICBpZiAoIGxvY2tpbmcgKQo+ICAg
ICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKPiBAQCAtNTY1Nyw3
ICs1NjU1LDYgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNp
Z25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKPiAgICAgICAgICAgICAgICAgICAgICBsMmVf
d3JpdGVfYXRvbWljKHBsMmUsIGwyZV9mcm9tX21mbihtZm4sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1Ip
KTsKPiAgICAgICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFKGwxdCk7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgbDF0ID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgIH0KPiAgICAg
ICAgICAgICAgICAgIGlmICggbG9ja2luZyApCj4gICAgICAgICAgICAgICAgICAgICAgc3Bpbl91
bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bWFwLmMg
Yi94ZW4vY29tbW9uL3ZtYXAuYwo+IGluZGV4IGZhZWJjMWRkZjEuLmZjZGI4NDk1YzggMTAwNjQ0
Cj4gLS0tIGEveGVuL2NvbW1vbi92bWFwLmMKPiArKysgYi94ZW4vY29tbW9uL3ZtYXAuYwoKSSBm
YWlsIHRvIHNlZSB3aHkgeW91IG5lZWQgdG8gY2hhbmdlIHZtYXAgdG8gZml4IGEgbGVhayBzb21l
d2hlcmUgZWxzZS4KCkkgZ3Vlc3MgSSB3aWxsIG5lZWQgdG8gd2FpdCBmb3IgeW91ciBicmFuY2gg
dG8gaGF2ZSBhIGNsb3NlciBsb29rLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
