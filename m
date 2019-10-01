Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547AC3025
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:26:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFENx-0005V2-U3; Tue, 01 Oct 2019 09:23:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYZ1=X2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iFENw-0005Uj-Bt
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:23:56 +0000
X-Inumbo-ID: 306d0a74-e42d-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 306d0a74-e42d-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 09:23:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 7so12539294ljw.7
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uYxFZQUM5YZlmCwkcfIY8hh/yJkmdJEJoJN561S0lsU=;
 b=P4vMlQYobuQ7oGIWVV+y+5lc102n7z3+mAnivoyDy2dRXb+ZJ6jzz6+MsEwijpoBZo
 3kXDDS8FSOh0a+nap65udfKPU2QhkXntyC//SnSY4WAd5Hu41IaypMk/ui+mDHOiqNK+
 ur36NGOkUjjhTMn/mfx+2Jle/CEov3EaxdVbEgydlJr+d0IXO/lrsUn23xfLvdVr+Vip
 rJIaQbQniMlo0Lw3/vElOZTS2MGc+/67YM8EtwUoYzt+czNZvU1C7hsNayUMGYFkiB/W
 Kj/FA+q1O3V/ijn+wrtXtGun3O4hMW1JiuspHUk7h4d/0wnRZbjE/oUXTQtL+VBIjYNT
 Q5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uYxFZQUM5YZlmCwkcfIY8hh/yJkmdJEJoJN561S0lsU=;
 b=EcctQQS0vrc0Wtj/vZucWJqzqilQcgSiHQhlCBY1i+v9kooSG2A2DzAufsmC0OFcsl
 nEa5j/HlKHdEfwnUqHzbwRa1hnqyFkgOujNqw6jZ6ncqcUiv3h40v+UQziNYuj0si+4u
 kQTtzVuubR2qGbI9O8k6wYbfMg57QeKXeHxkhgyNPvEZ8NH0BR/XmQ9JGlXV2YFBbFru
 P9OjyPHolHcwi2KfbBfIg3DwYZKgmwD3Vdo4UhYtJgwuwCs4ShV8EzxmeAXzNw8NFEaN
 OVvCK0YGr38aOblQWqB2JiO5/ySwEvpY9VyEWgoVrbfnFhsbdE4U4tq50WLJvncB+LBe
 y4eQ==
X-Gm-Message-State: APjAAAW1EFVE8AKVZcl3UZLG+OGgXrBsA3QVAKnqdAWqWTgprRM6jzEm
 rzOtZR9gIoq2eW7DpHh9kf4=
X-Google-Smtp-Source: APXvYqxyyAnxLzHjkNSUO431/iPkq6/QNgb/h3I44oP1XwteE/eHCvcJgGP2ZmmCMBiFG/Sp1/asvg==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr3169188ljg.234.1569921834188; 
 Tue, 01 Oct 2019 02:23:54 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b6sm4612649lfi.72.2019.10.01.02.23.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 02:23:53 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <Julien.Grall@arm.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
 <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
 <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
 <CAPD2p-mO7msJexqbmnmGX7z5SmN00KKQCN7pVZc-+H6OjLcUqw@mail.gmail.com>
 <96bea916-74a0-fa8e-582c-a702d43483c2@arm.com>
 <alpine.DEB.2.21.1909301339100.2594@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a249acd1-5482-fdc8-d27e-b78b69f8704b@gmail.com>
Date: Tue, 1 Oct 2019 12:23:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301339100.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, nd <nd@arm.com>,
 "volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMwLjA5LjE5IDIzOjU4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSBTdGVmYW5v
Cgo+IE9uIFNhdCwgMjggU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMjgvMDkv
MjAxOSAwMDo1MiwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+PiDRgdCxLCAyOCDRgdC1
0L3Rgi4gMjAxOSDQsy4sIDAxOjUwIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZwo+Pj4gPG1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnPj46Cj4+Pgo+Pj4gICAg
ICBPbiBUaHUsIDI2IFNlcCAyMDE5LCBPbGVrc2FuZHIgd3JvdGU6Cj4+PiAgICAgICA+IE9uIDI2
LjA5LjE5IDE3OjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiAgICAgICA+ID4gSGksCj4+PiAg
ICAgICA+Cj4+PiAgICAgICA+IEhpIEp1bGllbgo+Pj4gICAgICAgPgo+Pj4gICAgICAgPgo+Pj4g
ICAgICAgPiA+Cj4+PiAgICAgICA+ID4gT24gOS8yNi8xOSAxMjoyMCBQTSwgT2xla3NhbmRyIFR5
c2hjaGVua28gd3JvdGU6Cj4+PiAgICAgICA+ID4gPiBPbGVrc2FuZHIgVHlzaGNoZW5rbyAoOCk6
Cj4+PiAgICAgICA+ID4gPiDCoMKgIGlvbW11L2FybTogQWRkIGlvbW11X2hlbHBlcnMuYyBmaWxl
IHRvIGtlZXAgY29tbW9uIGZvcgo+Pj4gICAgICBJT01NVXMgc3R1ZmYKPj4+ICAgICAgID4gPiA+
IMKgwqAgaW9tbXUvYXJtOiBBZGQgYWJpbGl0eSB0byBoYW5kbGUgZGVmZXJyZWQgcHJvYmluZyBy
ZXF1ZXN0Cj4+PiAgICAgICA+ID4gPiDCoMKgIHhlbi9jb21tb246IEludHJvZHVjZSBfeHJlYWxs
b2MgZnVuY3Rpb24KPj4+ICAgICAgID4gPiA+IMKgwqAgeGVuL2NvbW1vbjogSW50cm9kdWNlIHhy
ZWFsbG9jX2ZsZXhfc3RydWN0KCkgaGVscGVyIG1hY3Jvcwo+Pj4gICAgICAgPiA+ID4gwqDCoCBp
b21tdS9hcm06IEFkZCBsaWdodHdlaWdodCBpb21tdV9md3NwZWMgc3VwcG9ydAo+Pj4gICAgICAg
PiA+ID4gwqDCoCBpb21tdTogT3JkZXIgdGhlIGhlYWRlcnMgYWxwaGFiZXRpY2FsbHkgaW4gZGV2
aWNlX3RyZWUuYwo+Pj4gICAgICAgPiA+ID4gwqDCoCBpb21tdS9hcm06IEludHJvZHVjZSBpb21t
dV9hZGRfZHRfZGV2aWNlIEFQSQo+Pj4gICAgICAgPiA+ID4gwqDCoCBpb21tdS9hcm06IEFkZCBS
ZW5lc2FzIElQTU1VLVZNU0Egc3VwcG9ydAo+Pj4gICAgICAgPiA+Cj4+PiAgICAgICA+ID4gVGhp
cyBzZXJpZXMgaXMgbm93IG1lcmdlZC4KPj4+ICAgICAgID4KPj4+ICAgICAgID4gVGhhbmsgeW91
IQo+Pj4KPj4+ICAgICAgSSBqdXN0IHdhbnRlZCB0byBwcm92aWRlIGVhcmx5IGZlZWRiYWNrIHRo
YXQgdGhpcyBzZXJpZXMgY2F1c2VzIHByb2JsZW1zCj4+PiAgICAgIHdpdGggdGhlIGxlZ2FjeSBt
bXUtbWFzdGVycyBiaW5kaW5nOgo+Pj4KPj4+Cj4+PiBUaGlzIHNlcmllcyB3YXMgZGV2ZWxvcGVk
IGluIGEgd2F5IHRvIGFkZCBuZXcgZnVuY3Rpb25hbGl0eSwgYnV0IG5vdCB0bwo+Pj4gYnJha2Ug
ZXhpc3RpbmcgKGxlZ2FjeSBiaW5kaW5ncykuIFByb2JhYmx5LCBJIG1pc3NlZCBzb21ldGhpbmcK
Pj4+IGltcG9ydGFudC7CoGlvbW11X2FkZF9kdF9kZXZpY2UoKSBjb3VsZCByZXR1cm4gYW4gZXJy
b3IgKEkgYXNzdW1lLCB0aGlzCj4+PiBpcyB3aGF0IHlvdSBhcmUgZmFjaW5nKSBpZiB0aGUgZGV2
aWNlIG5vZGUgaW4gRFQgY29udGFpbnMgImlvbW11cyIKPj4+IHByb3BlcnR5IChJIG1lYW4sIHVz
ZXMgbmV3IGJpbmRpbmdzKSwgYnV0IHRoZSBJT01NVSBkcml2ZXIgZG9lc24ndAo+Pj4gaW1wbGVt
ZW50IHJlcXVpcmVkIGNhbGxiYWNrcyB5ZXQuIERvIHRoZSBkZXZpY2Ugbm9kZXMgaW4geW91ciBE
VCBjb250YWluCj4+PiAiaW9tbXVzIiBwcm9wZXJ0eT8gQW5kIHRvIHdoaWNoIGRvbWFpbiB0aGVz
ZSBkZXZpY2VzIChpbiB5b3VyIGxvZykgYXJlCj4+PiBnb2luZyB0byBiZSBhc3NpZ25lZCAoZG9t
MCBvciBvdGhlciBkb21haW5zPykuCj4+IExvb2tpbmcgYXQgdGhlIGJpbmRpbmdzLCBJIGRvbid0
IHRoaW5rIGl0IGlzIGxlZ2l0IHRvIGhhdmUgYSBub2RlIHVzaW5nCj4+IGJvdGggbGVnYWN5IGFu
ZCBnZW5lcmljIGJpbmRpbmcgdG9nZXRoZXIuIElmIHRoaXMgaXMgd2hhdCBoYXBwZW5zLCB0aGVu
Cj4+IEkgd291bGQgY29uc2lkZXIgaXQgYXMgdW5zdXBwb3J0ZWQuCj4gSSBoYXZlIGp1c3Qgc2Vu
dCBhIGZpeCBmb3IgdGhpcy4KPgo+IFRoZSBpc3N1ZSBpcyB0aGF0IHNvbWUgWGlsaW54IGRldmlj
ZSB0cmVlcyBleHBvc2UgYm90aCB0aGUgbGVnYWN5IGFuZAo+IGdlbmVyaWMgYmluZGluZ3MsIGhv
d2V2ZXIsIG9ubHkgb25lIHNldCBvZiBiaW5kaW5ncyBpcyBzdXBwb3NlZCB0byBiZQo+IHVzZWQs
IGVpdGhlciB0aGUgbGVnYWN5IG9yIHRoZSBnZW5lcmljIGJpbmRpbmdzIChub3QgYm90aCEpLgoK
SSBleHBlY3RlZCB0aGlzIGNvdWxkIGJlIGEgcmVhc29uLgoKCj4gICBMaW51eAo+IHNvbHZlcyB0
aGlzIHByb2JsZW0gYnkgcHJvYmluZyBmb3IgdGhlIGV4aXN0ZW5jZSBvZiAibW11LW1hc3RlcnMi
ICh0aGUKPiBsZWdhY3kgYmluZGluZ3MgcHJvcGVydHkpIHZlcnkgZWFybHkgb24gYW5kIGRpc2Fi
bGluZyB0aGUgZ2VuZXJpYwo+IGJpbmRpbmdzIGlmICJtbXUtbWFzdGVycyIgaXMgcHJlc2VudC4K
Pgo+IFNvbWV0aGluZyBsaWtlIHRoYXQgd291bGQgd29yayBmb3IgWGVuIHRvbywgYnV0IEkgY2hh
dHRlZCB3aXRoIEp1bGllbgo+IGFuZCBjYW1lIHVwIHdpdGggc29tZXRoaW5nIHNpbXBsZXIuIChB
bHNvIGtlZXBpbmcgaW4gbWluZCB0aGF0IGEgbmV3Cj4gY29sbGVhZ3VlIG9mIG1pbmUgaGFzIGp1
c3Qgc3RhcnRlZCB3b3JraW5nIG9uIGdlbmVyaWMgYmluZGluZ3Mgc3VwcG9ydAo+IGZvciB0aGUg
QVJNIFNNTVUgZHJpdmVyIGluIFhlbiBzbyB0aGlzIGlzc3VlIHdpbGwgZ28gYXdheSBzb29uKS4g
U2VlOgo+Cj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTU2OTg3NzA3NjE0NzQ0
CgpTb3VuZHMgZ29vZCB0byBtZS4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
