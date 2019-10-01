Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEA1C38CD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:22:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJwn-0007aE-LX; Tue, 01 Oct 2019 15:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=emkH=X2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFJwl-0007a9-Il
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:20:15 +0000
X-Inumbo-ID: f791643e-e45e-11e9-bf31-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by localhost (Halon) with ESMTPS
 id f791643e-e45e-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 15:20:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so3872362wmg.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 08:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A2Nk0Tb6h6S7xHaI4N2eQwecWOkaf6URQEQg2ILdHQU=;
 b=mvEsWwmGjxNm8BmKEcyufN3I2rGg+TUMQ+KPg0IWNb8sMjwecrKUvihbNRtLfJ8be8
 x9zsY4yOarNZp9i3H4FJ/yAYB21BIacY1twfLNIsJB8EC4ppu1YjZv49sCn48hb9DCV+
 lDdHDgzxj5PtcZ+Zee43vABrAJyKrNAkgN4Y6rQbIb1hj3gxjSTmqSkdDr/fb4teyvxH
 SIBlisIgr7fTfWbsEzj1rRygWCJFQKWax9ZpAgoaK15IyXrkX8C7Aewxsj0UrckLW1m0
 sr9WicYd+bXl+6bfzURoRJS7fucq4vMVwV6qW7knVEKEsQ2xGxFZxwzGqHqHu4/eLmfo
 d9VA==
X-Gm-Message-State: APjAAAWgHUwg+Zj6dL3gh50cAtJK2q9kVtSG+7H1TI5zalvddxwaeVJB
 mvTBt0+bu7dSUzEL2Qiv7Ps=
X-Google-Smtp-Source: APXvYqzGfZME40FR+UEI1EAz5I5aDDoezVhhG4Haz9QH90+yCePp5Cn6b9CRRgcf0O9BTdZDc/2ptQ==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr4493773wml.14.1569943213902;
 Tue, 01 Oct 2019 08:20:13 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id q15sm35900154wrg.65.2019.10.01.08.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 08:20:13 -0700 (PDT)
Date: Tue, 1 Oct 2019 16:20:11 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyax@amazon.com>
Message-ID: <20191001152011.s254ddmdh2lv4tpa@debian>
References: <cover.1569833766.git.hongyax@amazon.com>
 <f8b0b15146c357270fb0978f3ec50eea4695dc1c.1569833766.git.hongyax@amazon.com>
 <480a0733-07c4-b98a-a2c9-465cf9fbef63@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <480a0733-07c4-b98a-a2c9-465cf9fbef63@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 39/55] x86: switch root_pgt to mfn_t and
 use new APIs
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDI6NTQ6MTlQTSArMDEwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gT24gMzAvMDkvMjAxOSAxMTozMywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gPiBGcm9tOiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gCj4gPiBUaGlzIHRoZW4gcmVxdWlyZXMg
bW92aW5nIGRlY2xhcmF0aW9uIG9mIHJvb3QgcGFnZSB0YWJsZSBtZm4gaW50byBtbS5oCj4gPiBh
bmQgbW9kaWZ5IHNldHVwX2NwdV9yb290X3BndCB0byBoYXZlIGEgc2luZ2xlIGV4aXQgcGF0aC4K
PiA+IAo+ID4gV2UgYWxzbyBuZWVkIHRvIGZvcmNlIG1hcF9kb21haW5fcGFnZSB0byB1c2UgZGly
ZWN0IG1hcCB3aGVuIHN3aXRjaGluZwo+ID4gcGVyLWRvbWFpbiBtYXBwaW5ncy4gVGhpcyBpcyBj
b250cmFyeSB0byBvdXIgZW5kIGdvYWwgb2YgcmVtb3ZpbmcKPiA+IGRpcmVjdCBtYXAsIGJ1dCB0
aGlzIHdpbGwgYmUgcmVtb3ZlZCBvbmNlIHdlIG1ha2UgbWFwX2RvbWFpbl9wYWdlCj4gPiBjb250
ZXh0LXN3aXRjaCBzYWZlIGluIGFub3RoZXIgKGxhcmdlKSBwYXRjaCBzZXJpZXMuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+
ICAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICB8IDE1ICsrKysrKysrKystLS0KPiA+
ICAgeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICAgICB8ICAyICstCj4gPiAgIHhlbi9hcmNo
L3g4Ni9tbS5jICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gICB4ZW4vYXJjaC94ODYvcHYvZG9t
YWluLmMgICAgICAgIHwgIDIgKy0KPiA+ICAgeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgICAg
ICB8IDQwICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gICB4ZW4vaW5jbHVk
ZS9hc20teDg2L21tLmggICAgICAgIHwgIDIgKysKPiA+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9w
cm9jZXNzb3IuaCB8ICAyICstCj4gPiAgIDcgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+IGluZGV4IGRiZGY2YjFiYzIuLmU5YmY0
N2VmY2UgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9kb21haW4uYwo+ID4gQEAgLTY5LDYgKzY5LDcgQEAKPiA+ICAgI2luY2x1ZGUg
PGFzbS9wdi9kb21haW4uaD4KPiA+ICAgI2luY2x1ZGUgPGFzbS9wdi9tbS5oPgo+ID4gICAjaW5j
bHVkZSA8YXNtL3NwZWNfY3RybC5oPgo+ID4gKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4KPiA+ICAg
REVGSU5FX1BFUl9DUFUoc3RydWN0IHZjcHUgKiwgY3Vycl92Y3B1KTsKPiA+IEBAIC0xNTgwLDEy
ICsxNTgxLDIwIEBAIHZvaWQgcGFyYXZpcnRfY3R4dF9zd2l0Y2hfZnJvbShzdHJ1Y3QgdmNwdSAq
dikKPiA+ICAgdm9pZCBwYXJhdmlydF9jdHh0X3N3aXRjaF90byhzdHJ1Y3QgdmNwdSAqdikKPiA+
ICAgewo+ID4gLSAgICByb290X3BnZW50cnlfdCAqcm9vdF9wZ3QgPSB0aGlzX2NwdShyb290X3Bn
dCk7Cj4gPiArICAgIG1mbl90IHJwdF9tZm4gPSB0aGlzX2NwdShyb290X3BndF9tZm4pOwo+ID4g
LSAgICBpZiAoIHJvb3RfcGd0ICkKPiA+IC0gICAgICAgIHJvb3RfcGd0W3Jvb3RfdGFibGVfb2Zm
c2V0KFBFUkRPTUFJTl9WSVJUX1NUQVJUKV0gPQo+ID4gKyAgICBpZiAoICFtZm5fZXEocnB0X21m
biwgSU5WQUxJRF9NRk4pICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgcm9vdF9wZ2VudHJ5X3Qg
KnJwdDsKPiA+ICsKPiA+ICsgICAgICAgIG1hcGNhY2hlX292ZXJyaWRlX2N1cnJlbnQoSU5WQUxJ
RF9WQ1BVKTsKPiA+ICsgICAgICAgIHJwdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhycHRfbWZu
KTsKPiA+ICsgICAgICAgIHJwdFtyb290X3RhYmxlX29mZnNldChQRVJET01BSU5fVklSVF9TVEFS
VCldID0KPiA+ICAgICAgICAgICAgICAgbDRlX2Zyb21fcGFnZSh2LT5kb21haW4tPmFyY2gucGVy
ZG9tYWluX2wzX3BnLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBF
UlZJU09SX1JXKTsKPiA+ICsgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHJwdCk7Cj4g
PiArICAgICAgICBtYXBjYWNoZV9vdmVycmlkZV9jdXJyZW50KE5VTEwpOwo+ID4gKyAgICB9Cj4g
PiAgICAgICBpZiAoIHVubGlrZWx5KHYtPmFyY2guZHI3ICYgRFI3X0FDVElWRV9NQVNLKSApCj4g
PiAgICAgICAgICAgYWN0aXZhdGVfZGVidWdyZWdzKHYpOwo+IAo+IEkgYW0gaGF2aW5nIHNlY29u
ZCB0aG91Z2h0cyBvbiB3aGV0aGVyIEkgc2hvdWxkIGluY2x1ZGUgdGhpcyBwYXRjaCBmb3Igbm93
Lgo+IE9idmlvdXNseSB0aGUgcGVyLWRvbWFpbiBtYXBjYWNoZSBpbiBpdHMgY3VycmVudCBmb3Jt
IGNhbm5vdCBiZSB1c2VkIGhlcmUKPiBkdXJpbmcgdGhlIGNvbnRleHQgc3dpdGNoLiBIb3dldmVy
LCBJIGFsc28gZG9uJ3Qgd2FudCB0byB1c2UgUE1BUCBiZWNhdXNlIGl0Cj4gaXMganVzdCBhIGJv
b3RzdHJhcHBpbmcgbWVjaGFuaXNtIGFuZCBtYXkgcmVzdWx0IGluIGhlYXZ5IGxvY2sgY29udGVu
dGlvbgo+IGhlcmUuCj4gCj4gSSBhbSBpbmNsaW5lZCB0byBkcm9wIGl0IGZvciBub3cgYW5kIGlu
Y2x1ZGUgdGhpcyBhZnRlciB3ZSBoYXZlIGEKPiBjb250ZXh0LXN3aXRjaCBzYWZlIG1hcHBpbmcg
bWVjaGFuaXNtLCBhcyB0aGUgY29tbWl0IG1lc3NhZ2Ugc3VnZ2VzdHMuCj4gCgpEcm9wcGluZyB0
aGlzIHBhdGNoIGlzIG9mIGNvdXJzZSBmaW5lLiBUaGVuIHlvdSBuZWVkIHRvIGNvbnNpZGVyIGhv
dyB0bwptYWtlIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgcmVtYWluIGFwcGxpY2FibGUgdG8gc3Rh
Z2luZy4KCkkgZ3Vlc3MgdGhlIHBsYW4gaW4gdGhlIHNob3J0IHRlcm0gaXMgdG9vIGtlZXAgYSBn
bG9iYWwgbWFwcGluZyBmb3IgZWFjaApyb290IHBhZ2UgdGFibGUsIHJpZ2h0PwoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
