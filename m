Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7668126E86
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 21:15:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii27o-0004Bj-J4; Thu, 19 Dec 2019 20:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8Kc=2J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ii27m-0004Be-Mw
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 20:10:18 +0000
X-Inumbo-ID: 935496f0-229b-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 935496f0-229b-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 20:10:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so7273195wrh.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 12:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mV8bvhaXVWALGTgCUZbSvDXHVHHh1jr0sVBai6iIs8I=;
 b=YoT1MQ5aD/VtpiOnsIAVRnqT9Z57uo6Uv1j6wlYaYRS/qdXa8luQHtK8phEXJFnXjp
 RDKjXWvsr044fkBepxjGXjuu8mLy432P/ueqgAXGCIHRaGtInBhKA+V0Dkmh/b5py89C
 1mCzG+9z39P/rUdt7Afy31nyTzcVNyKKC6XKjUZ3ggSlehTeWnXWpiAyHJV93Z8pWpV9
 oS1nTRTjCDSAPa4VITsADTs0/b9cBnw6AVwseHPRz+9L2RKmMLhA8oBmB2TXvmD/FqcW
 ct1WK3FIi1Ci6RjQv45K58ar92iDNJrB8d+t5OwUXAUKwlcnOIqoR5P6eXEuL14wH9DS
 BEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mV8bvhaXVWALGTgCUZbSvDXHVHHh1jr0sVBai6iIs8I=;
 b=rL/fFyJ9M6/oGDXiK8P5IxzTfIl2Go0NoVHYt+kKsYI6HZKk3OqWH8botwtaVwzZA6
 yoNfmQwuTOpF5Kqq3x0dWnHs/ofamjs5QyxIwiLbr+2NvUiQ84fPFhUeVPhTqlw3PcdE
 WFiOniVOf4HwtVxmrdf3vnDks57+k4CJR79EZ8JVCGy20taQ3nb5HNYaGrkGo0VI9/eY
 2/w6osy6HZ9lqrwrMBmkVigjTkP08Nd/onL0Zv8cWsFOkHjKRQr00G3tYIJbFj/+NMDM
 E5VoaonOzm5F2/IoL8QWp9OL2fyViSwK/tOM4CBIPg6yZqgMtUZenOadWqVAsLHj0zkb
 t4zA==
X-Gm-Message-State: APjAAAUYSIzpErhYuW2N8c0Pg053pk8Q+ZM1XswdUwmS9G0JBzgtHtsu
 ElK2l9TSzBSLteFQOUCJHVBFI2+/JBBzAYdrgEY=
X-Google-Smtp-Source: APXvYqymo7Y2tu92RdrkIGBGpULOwCNmYaTJsJMz5ZwnXpwkTr+up+h9CLv4uSQEgs51TWIl+pMXt1dvtKD2D7z6cxA=
X-Received: by 2002:adf:f586:: with SMTP id f6mr10992073wro.46.1576786217156; 
 Thu, 19 Dec 2019 12:10:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
 <CABfawhkaLMX9aM0dFP1M7foRUa9fi7ZaoQwXpw0ZXAcjVmYsuw@mail.gmail.com>
 <19a06020-924b-be4c-8015-2093cc8d1a33@citrix.com>
 <CABfawhm_MjH=AgGjqT-EFPS=q=+6TMrnm50Aq_KX-2Wa815qeA@mail.gmail.com>
 <ddd7220d-bbea-c7da-62c3-a82ba5a69744@citrix.com>
In-Reply-To: <ddd7220d-bbea-c7da-62c3-a82ba5a69744@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 19 Dec 2019 13:09:40 -0700
Message-ID: <CABfawh=UsksKKNpfx=3sdngw4BcWvSVEsGc0g0_it9OVizD64Q@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMTI6NTcgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOS8xMi8yMDE5IDE5OjQ5LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAxOSwgMjAxOSBhdCAxMjo0MSBQTSBBbmRy
ZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24g
MTkvMTIvMjAxOSAxOTozOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vaHZtLmgKPiA+Pj4+PiBAQCAtMzM1LDYgKzMzNSwxMCBAQCB1bnNpZ25lZCBsb25n
IGh2bV9jcjRfZ3Vlc3RfdmFsaWRfYml0cyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIHJl
c3RvcmUpOwo+ID4+Pj4+ICBib29sIGh2bV9mbHVzaF92Y3B1X3RsYihib29sICgqZmx1c2hfdmNw
dSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+ID4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICpjdHh0KTsKPiA+Pj4+Pgo+ID4+Pj4+ICsvKiBDYWxsZXIgbXVzdCBob2xk
IGRvbWFpbiBsb2NrcyAqLwo+ID4+Pj4gSG93IGFib3V0IGFzc2VydGluZyBzbz8KPiA+Pj4gQUZB
SUNUIHRoZXJlIGlzIG5vICJkb21haW5fbG9ja2VkX2J5X21lIiBmdW5jdGlvbiwgb25seQo+ID4+
PiBwYWdpbmcvcDJtL2dmbl9sb2NrZWRfYnlfbWUuIFNvIGFueSBzdWdnZXN0aW9uIG9uIGhvdyB0
byBhY2hpZXZlIHRoYXQ/Cj4gPj4gc3Bpbl9pc19sb2NrZWQoKSBnZXRzIHlvdSBtb3N0IG9mIHRo
ZSB3YXksIGFuZCB3b3VsZCBiZSBhIHN0YXJ0Lgo+ID4+Cj4gPj4gQnV0IHllcyAtIG5vdyB5b3Ug
c2F5IHRoaXMsIEkgcmVtZW1iZXIgdGhhdCB3ZSBkb24ndCBjdXJyZW50bHkgaGF2ZQo+ID4+IHN1
aXRhYmxlIGluZnJhc3RydWN0dXJlLgo+ID4gSXMgdGhlIGRvbWFpbiBsb2NrIGV2ZW4gYSBzcGlu
IGxvY2sgKHRoZSBvbiB5b3UgdXNlIGJ5Cj4gPiByY3VfbG9ja19saXZlX3JlbW90ZV9kb21haW5f
YnlfaWQpPyBMb29rcyB0byBtZSBpdCBqdXN0IGdvZXMgZG93biB0bwo+ID4gInJjdV9yZWFkX2xv
Y2siIHdoaWNoIG9ubHkgZG9lcyBhIHByZWVtcHRfZGlzYWJsZSgpIGNhbGwgby5PCj4KPiAvc2ln
aCAtIG9mIGNvdXJzZSB3ZSBoYXZlIHR3byB0aGluZ3MgY2FsbGVkIHRoZSBkb21haW4gbG9jay4K
Pgo+IFRoZSBSQ1Ugb25lIGlzIHRvIGVuc3VyZSB0aGF0IHRoZSBzdHJ1Y3QgZG9tYWluIGNhbid0
IGdldCBmcmVlZCBiZWhpbmQKPiBvdXIgYmFjaywgYW5kIHNob3VsZG4ndCBiZSBpbnRlcmVzdGlu
ZyBpbiB0aGlzIGNvbnRleHQgKG9idGFpbmluZyB0aGUgZAo+IHBvaW50ZXIgaW4gdGhlIGZpcnN0
IHBsYWNlIGNhdXNlcyBpdCB0byBiZSBzYWZlKS4gIElmIHRoYXQgaXMgdGhlIG9ubHkKPiBvbmUg
d2hpY2ggbWF0dGVycywgSSB3b3VsZCBkcm9wIHRoZSBjb21tZW50LgoKWWVzLCBvbmx5IHRoZSBS
Q1UgbG9jayBnZXRzIHRha2VuIHJpZ2h0IG5vdyBieSBhbGwgY2FsbGVycywgc28gSSdsbApkcm9w
IHRoZSBjb21tZW50LgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
