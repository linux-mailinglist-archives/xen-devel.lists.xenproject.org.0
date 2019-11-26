Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03A109D0C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 12:33:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZ3F-0007UR-DZ; Tue, 26 Nov 2019 11:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hZjB=ZS=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZZ3D-0007UM-G9
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 11:30:35 +0000
X-Inumbo-ID: 28e5cec8-1040-11ea-a55d-bc764e2007e4
Received: from mail-pj1-x1041.google.com (unknown [2607:f8b0:4864:20::1041])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e5cec8-1040-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 11:30:34 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id r67so396768pjb.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 03:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bTVtR+r0ShdgxnOVuLqJt31JCE8f81k8Q7t8OX4bCg=;
 b=NP3387ca1xfbiYEaNoWCMmdY6lb7iF1tBZvtr6HWgLIj1KQcQKGXxU88Gnze3qeqPV
 K8VxY0sIZ3oiszSsEoDumO9E8gjy4yY7V5K6HuE7zWF+H8Jn1APqPgbt/chotPvd1yAZ
 fuD1eIgw+u5JUEcBTxe87P5FRe/Z0iqdaBH3z/rEncZ3byZLsXWvepj+VfjoRwhsiFJ/
 rObRJiI/GlBOL74GsTYR+9SGcxzS4jiSs3qYdlV9Ds9KB39kvzkV39CoDLtlk9bGghLY
 /nxOhErL9Ak0XRMozsRWvoggLGY0wT4NTYpcytKpYkl6vSs7vsejnCaPBYcBO84K3imp
 /VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bTVtR+r0ShdgxnOVuLqJt31JCE8f81k8Q7t8OX4bCg=;
 b=lV9f9BSTnO3MlclEghUdlRMS0PO6OQzI8chlOGtZ/OJRHo480gpfEVEQkAq2ZPBEGH
 DGR+meYpEB5+eBAjOTErjwXHz7TBdUjNaxDIiU3sl4z0Ofty7xm93gtQVURYcrOighuh
 4fzNMKxsd5MA+6kpTja+XtHItmdllW7eMYh1/OxeTVcM0LQNHxJtrzcKFIEBFITtXtXf
 hMtEjGs6lDtjvWz9DbqhXuoAnLeiV3ESYK7nqj5mzbW5ntACFKn3z4OduSwpWNluOYbY
 BBADUzNE+4bNgeCjsSOowhUpTgasKtuDzkyQ7NrtYGD3WIooAaFvzLxqLMKEJ5ZZkf4U
 xrVQ==
X-Gm-Message-State: APjAAAX52/RUCsMcgC4Cr7lNdF7ybEIiJnWBxaNkmEDNOSMC3r/l04lD
 wtRjs6zdjd/2f7GCTiS233FtbGhl0JyEy2Bf2MM=
X-Google-Smtp-Source: APXvYqwcqtCR6zc+1UNVq3qqI6HppbcPZHg5wWxUEUcsTAvaWRhruZJm1cwNA2tcwO+EkWmKeXEIecOObHk0cw024QI=
X-Received: by 2002:a17:90a:a483:: with SMTP id
 z3mr5922234pjp.55.1574767833275; 
 Tue, 26 Nov 2019 03:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20191113135330.1209-1-pdurrant@amazon.com>
In-Reply-To: <20191113135330.1209-1-pdurrant@amazon.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Tue, 26 Nov 2019 11:30:22 +0000
Message-ID: <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMyBOb3YgMjAxOSBhdCAxMzo1NSwgUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPiB3cm90ZToKPgo+IC4uLndoZW4gdGhlaXIgdmFsdWVzIGFyZSBsYXJnZXIgdGhhbiB0
aGUgcGVyLWRvbWFpbiBjb25maWd1cmVkIGxpbWl0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAtLS0KPiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPgo+IEFmdGVyIG1pbmlu
ZyB0aHJvdWdoIGNvbW1pdHMgaXQgaXMgc3RpbGwgdW5jbGVhciB0byBtZSBleGFjdGx5IHdoZW4g
WGVuCj4gc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1dCBJIHJlYWxseSB0
aGluayB0aGlzIGNvbW1pdCBzaG91bGQKPiBiZSBiYWNrLXBvcnRlZCB0byBzdGFibGUgdHJlZXMg
YXMgaXQgd2FzIGEgYmVoYXZpb3VyYWwgY2hhbmdlIHRoYXQgY2FuCj4gY2F1c2UgZG9tVXMgdG8g
ZmFpbCBpbiBub24tb2J2aW91cyB3YXlzLgoKQW55IG90aGVyIG9waW5pb25zIG9uIHRoaXM/IEFG
QUlDVCBxdWVzdGlvbnMgaXMgc3RpbGwgb3BlbjoKCi0gRG8gd2UgY29uc2lkZXIgbm90IGhvbm91
cmluZyB0aGUgY29tbWFuZCBsaW5lIHZhbHVlcyB0byBiZSBhCnJlZ3Jlc3Npb24gKHNpbmNlIGRv
bVVzIHRoYXQgd291bGQgaGF2ZSB3b3JrZWQgYmVmb3JlIHdpbGwgbm8gbG9uZ2VyCndvcmsgYWZ0
ZXIgYSBiYXNpYyB1cGdyYWRlIG9mIFhlbik/CgogIFBhdWwKCj4gLS0tCj4gIHhlbi9jb21tb24v
ZG9tYWluLmMgfCAxNCArKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFp
bi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwo+IGluZGV4IDYxMTExNmM3ZmMuLmFhZDZkNTViODIg
MTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9t
YWluLmMKPiBAQCAtMzM1LDYgKzMzNSw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUo
ZG9taWRfdCBkb21pZCwKPiAgICAgIGVudW0geyBJTklUX3dhdGNoZG9nID0gMXU8PDEsCj4gICAg
ICAgICAgICAgSU5JVF9ldnRjaG4gPSAxdTw8MywgSU5JVF9nbnR0YWIgPSAxdTw8NCwgSU5JVF9h
cmNoID0gMXU8PDUgfTsKPiAgICAgIGludCBlcnIsIGluaXRfc3RhdHVzID0gMDsKPiArICAgIHVu
c2lnbmVkIGludCBtYXhfZ3JhbnRfZnJhbWVzLCBtYXhfbWFwdHJhY2tfZnJhbWVzOwo+Cj4gICAg
ICBpZiAoIGNvbmZpZyAmJiAoZXJyID0gc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhjb25maWcpKSAp
Cj4gICAgICAgICAgcmV0dXJuIEVSUl9QVFIoZXJyKTsKPiBAQCAtNDU2LDggKzQ1NywxNyBAQCBz
dHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCj4gICAgICAgICAgICAg
IGdvdG8gZmFpbDsKPiAgICAgICAgICBpbml0X3N0YXR1cyB8PSBJTklUX2V2dGNobjsKPgo+IC0g
ICAgICAgIGlmICggKGVyciA9IGdyYW50X3RhYmxlX2luaXQoZCwgY29uZmlnLT5tYXhfZ3JhbnRf
ZnJhbWVzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZmlnLT5t
YXhfbWFwdHJhY2tfZnJhbWVzKSkgIT0gMCApCj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBN
YWtlIHN1cmUgdGhhdCB0aGUgY29uZmlndXJlZCB2YWx1ZXMgZG9uJ3QgcmVkdWNlIGFueQo+ICsg
ICAgICAgICAqIGdsb2JhbCBjb21tYW5kIGxpbmUgb3ZlcnJpZGUuCj4gKyAgICAgICAgICovCj4g
KyAgICAgICAgbWF4X2dyYW50X2ZyYW1lcyA9IG1heChjb25maWctPm1heF9ncmFudF9mcmFtZXMs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4X2dyYW50X2ZyYW1lcyk7
Cj4gKyAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcyA9IG1heChjb25maWctPm1heF9tYXB0cmFj
a19mcmFtZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4X21h
cHRyYWNrX2ZyYW1lcyk7Cj4gKwo+ICsgICAgICAgIGlmICggKGVyciA9IGdyYW50X3RhYmxlX2lu
aXQoZCwgbWF4X2dyYW50X2ZyYW1lcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMpKSAhPSAwICkKPiAgICAgICAgICAgICAgZ290byBm
YWlsOwo+ICAgICAgICAgIGluaXRfc3RhdHVzIHw9IElOSVRfZ250dGFiOwo+Cj4gLS0KPiAyLjE3
LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
