Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23080136BB9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 12:10:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ips8i-0006ln-IW; Fri, 10 Jan 2020 11:07:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VEhH=27=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ips8g-0006lh-Su
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 11:07:38 +0000
X-Inumbo-ID: 642cf7f0-3399-11ea-ac27-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 642cf7f0-3399-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578654449;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oGXGay7cCpzVzXtI7lKewXBfa/hl7JcDGI+Xi/x2vl8=;
 b=LoNReGzVZY+bjvBTgb3DiskWXP9TdKMdJMF2uPbPVqB5/oJcS/r3iaO0
 ob2sMKvWQWY9L43Jg0Sg67WLOM+gmrWP2zleuImPJpYskphr7HJt/pqHZ
 EiIQPUltP9kAO+IkAMvw5Qh6/aiky2rXym4Jz0Fyn5WcF/kc6kPBHsTaF g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: twpcSmXpC1qCNCFAijV/X2KEvYkOgAGoh1Cqqhl5VEHfHZ3/f6lq8R2JA7J7utgKQoUnpZXwbN
 rQCOKXw2lHYzt6NEBUHJWRHyGPKhCZgoK5+eIprHYSQ2XuY9bZutptCiYzSpcSYx9nheSDYoZK
 KxGfjTMT0gZ7uhrfyIrY5Z86NKvvtTH2xJ5B0LrQOtHfKiJIKnVWxgbGEN6FwKIPqQ/inn3SMA
 TH9pHg4lXICcighXX2GlFnG1lCyg6Y6jrFV+9mlGG+0xW5k5MsHQbL8jSvqCZsco3BuFq1wthr
 Bzs=
X-SBRS: 2.7
X-MesageID: 11108479
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,416,1571716800"; d="scan'208";a="11108479"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-3-sergey.dyasli@citrix.com>
 <0c968669-2b21-b772-dba8-f674057bd6e7@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <e5853285-8c18-8c9d-2d40-7e7115c8d3cf@citrix.com>
Date: Fri, 10 Jan 2020 11:07:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0c968669-2b21-b772-dba8-f674057bd6e7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/xen: add basic KASAN support for
 PV kernel
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDEvMjAyMCAwOToxNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAx
NjoyMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gVGhpcyBlbmFibGVzIHRvIHVzZSBPdXRsaW5l
IGluc3RydW1lbnRhdGlvbiBmb3IgWGVuIFBWIGtlcm5lbHMuCj4+Cj4+IEtBU0FOX0lOTElORSBh
bmQgS0FTQU5fVk1BTExPQyBvcHRpb25zIGN1cnJlbnRseSBsZWFkIHRvIGJvb3QgY3Jhc2hlcwo+
PiBhbmQgaGVuY2UgZGlzYWJsZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkg
PHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPj4gLS0tCj4+IFJGQyAtLT4gdjE6Cj4+IC0gTmV3
IGZ1bmN0aW9ucyB3aXRoIGRlY2xhcmF0aW9ucyBpbiB4ZW4veGVuLW9wcy5oCj4+IC0gRml4ZWQg
dGhlIGlzc3VlIHdpdGggZnJlZV9rZXJuZWxfaW1hZ2VfcGFnZXMoKSB3aXRoIHRoZSBoZWxwIG9m
Cj4+ICAgIHhlbl9wdl9rYXNhbl91bnBpbl9wZ2QoKQo+PiAtLS0KPj4gICBhcmNoL3g4Ni9tbS9r
YXNhbl9pbml0XzY0LmMgfCAxMiArKysrKysrKysrKysKPj4gICBhcmNoL3g4Ni94ZW4vTWFrZWZp
bGUgICAgICAgfCAgNyArKysrKysrCj4+ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwg
IDMgKysrCj4+ICAgYXJjaC94ODYveGVuL21tdV9wdi5jICAgICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGRyaXZlcnMveGVuL01ha2VmaWxlICAgICAg
ICB8ICAyICsrCj4+ICAgaW5jbHVkZS94ZW4veGVuLW9wcy5oICAgICAgIHwgIDQgKysrKwo+PiAg
IGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAyICsrCj4+ICAgbGliL0tjb25maWcua2Fz
YW4gICAgICAgICAgIHwgIDMgKystCj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9rYXNhbl9p
bml0XzY0LmMgYi9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKPj4gaW5kZXggY2Y1YmMzN2M5
MGFjLi45MDJhNmExNTJkMzMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L21tL2thc2FuX2luaXRf
NjQuYwo+PiArKysgYi9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKPj4gQEAgLTEzLDYgKzEz
LDkgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgo+PiAgICNpbmNsdWRlIDxs
aW51eC92bWFsbG9jLmg+Cj4+ICAgKyNpbmNsdWRlIDx4ZW4veGVuLmg+Cj4+ICsjaW5jbHVkZSA8
eGVuL3hlbi1vcHMuaD4KPj4gKwo+PiAgICNpbmNsdWRlIDxhc20vZTgyMC90eXBlcy5oPgo+PiAg
ICNpbmNsdWRlIDxhc20vcGdhbGxvYy5oPgo+PiAgICNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4K
Pj4gQEAgLTMzMiw2ICszMzUsMTEgQEAgdm9pZCBfX2luaXQga2FzYW5fZWFybHlfaW5pdCh2b2lk
KQo+PiAgICAgICBmb3IgKGkgPSAwOyBwZ3RhYmxlX2w1X2VuYWJsZWQoKSAmJiBpIDwgUFRSU19Q
RVJfUDREOyBpKyspCj4+ICAgICAgICAgICBrYXNhbl9lYXJseV9zaGFkb3dfcDRkW2ldID0gX19w
NGQocDRkX3ZhbCk7Cj4+ICAgKyAgICBpZiAoeGVuX3B2X2RvbWFpbigpKSB7Cj4+ICsgICAgICAg
IHBnZF90ICpwdl90b3BfcGd0ID0geGVuX3B2X2thc2FuX2Vhcmx5X2luaXQoKTsKPgo+IFlvdSBh
cmUgYnJlYWtpbmcgdGhlIGJ1aWxkIHdpdGggQ09ORklHX1hFTl9QViB1bmRlZmluZWQgaGVyZS4K
ClJpZ2h0LCB0aGUgZm9sbG93aW5nIGlzIG5lZWRlZDoKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hl
bi94ZW4tb3BzLmggYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKaW5kZXggOTFkNjY1MjBmMGEzLi4z
ZDIwZjAwMGFmMTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaAorKysgYi9pbmNs
dWRlL3hlbi94ZW4tb3BzLmgKQEAgLTI0MSw4ICsyNDEsMTQgQEAgc3RhdGljIGlubGluZSB2b2lk
IHhlbl9wcmVlbXB0aWJsZV9oY2FsbF9lbmQodm9pZCkKCiAjZW5kaWYgLyogQ09ORklHX1BSRUVN
UFQgKi8KCisjaWYgZGVmaW5lZChDT05GSUdfWEVOX1BWKQogcGdkX3QgKnhlbl9wdl9rYXNhbl9l
YXJseV9pbml0KHZvaWQpOwogdm9pZCB4ZW5fcHZfa2FzYW5fcGluX3BnZChwZ2RfdCAqcGdkKTsK
IHZvaWQgeGVuX3B2X2thc2FuX3VucGluX3BnZChwZ2RfdCAqcGdkKTsKKyNlbHNlCitzdGF0aWMg
aW5saW5lIHBnZF90ICp4ZW5fcHZfa2FzYW5fZWFybHlfaW5pdCh2b2lkKSB7IHJldHVybiBOVUxM
OyB9CitzdGF0aWMgaW5saW5lIHZvaWQgeGVuX3B2X2thc2FuX3Bpbl9wZ2QocGdkX3QgKnBnZCkg
eyB9CitzdGF0aWMgaW5saW5lIHZvaWQgeGVuX3B2X2thc2FuX3VucGluX3BnZChwZ2RfdCAqcGdk
KSB7IH0KKyNlbmRpZiAvKiBkZWZpbmVkKENPTkZJR19YRU5fUFYpICovCgogI2VuZGlmIC8qIElO
Q0xVREVfWEVOX09QU19IICovCgotLQpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
