Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5516AB3E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:22:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GT8-0003is-K9; Mon, 24 Feb 2020 16:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rl5L=4M=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j6GT7-0003in-RM
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:20:29 +0000
X-Inumbo-ID: 92286a9e-5721-11ea-a490-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92286a9e-5721-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 16:20:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so9577276wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 08:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjgyw6ywmIQQxWHmc0G6HuqimNAkcDmAUuwu4LPphFk=;
 b=C8P+qkjB7U/EXCRRWfvTXLuKnk71fL/B8yBeLmfHVuojOqq6q/RnusqiZC6lBmLesO
 GE5N+qQ6HvUvoMCetpzLPY/tdP1HOh2Inck2Z27QMVJNoaFu3ji/B1TLKwjaQgxh2ou1
 JhqxZEI9UKzNkfxQxuVV+2kM6mg02JxYRCmCf3J+3O4RY2CWy78p/L4jnijcyI5N4qTf
 TvJhFQP3PIsp83ybADQ7pa6gkmAqgIxXfIDQfuC4OrynqME5JElIkhgXvK6XvcVn4uvT
 iTbaM1x8O1BMnz1+ZxFAQvTdioP+d2XK+oNkfTAnRSBfx+AuVtkKbqXLSjGkiNGbDyZw
 OPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjgyw6ywmIQQxWHmc0G6HuqimNAkcDmAUuwu4LPphFk=;
 b=KjVHPenxTZ0278sJtfyG6TEARHZUFkjicfp7qxrZBQK1o+HItVUq3WTJ5SpiquuHf7
 gu9LLkDlgRgrkD4AxJnmcK7jAkQoLgx/f5Euzbp+DtyzGxVqWJyQ/jHFy1sTmDXmjNL5
 XosB4fmPb1ybrHezqn8/jB7Hp6XD3/FSJPloFg4Z/NxWtvsVRSg5lTggVlOYUoMqPMAQ
 fF+OqoX22qVNC0Sxy6Bp80juMvl2vHNLeftv1Z7q6qWnnNOw06yJHEq+vCidrkgISh6p
 kQ7St0kShJLZ7vRpeUUDxlWE75soD1NHF/EGpQSXtq/SBuxZQCC3YQWhTUC9CZA6bViS
 RuEw==
X-Gm-Message-State: APjAAAU+kxjFvdQ8u8WaNeKV1uTw3TKU25ola+8i732Z8CfP4/oJN/Ph
 ZdUWGmc2cNhb1ePkf/32ldDid9kLibvYjOJIosA=
X-Google-Smtp-Source: APXvYqyYWoST+vtx/hWNoCdR2rZFZufQ5HzUTdAt2/K/NuWjcIyL0Bgi/IK8HEumznPMz4SfmIhypaRksL4j2yhcKBw=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr24001133wmg.154.1582561228187; 
 Mon, 24 Feb 2020 08:20:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <532a499f00b42299d8035b4ca9c6d7bfcbdc6e1f.1582310142.git.tamas.lengyel@intel.com>
 <b58479ab-94d0-7cc2-72ff-7fbcb1374a40@xen.org>
In-Reply-To: <b58479ab-94d0-7cc2-72ff-7fbcb1374a40@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 24 Feb 2020 09:19:52 -0700
Message-ID: <CABfawhk=+bTmjT-T1kehFs=+E01zs_6sou=CjO986aYNvugO0w@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v9 5/5] xen/tools: VM forking toolstack side
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgOToxMyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gT24gMjEvMDIvMjAyMCAxODo0OSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gK2ludCBsaWJ4bF9kb21haW5fZm9ya192bShsaWJ4bF9jdHgg
KmN0eCwgdWludDMyX3QgcGRvbWlkLCB1aW50MzJfdCAqZG9taWQpCj4gPiArewo+ID4gKyAgICBp
bnQgcmM7Cj4gPiArICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBjcmVhdGUgPSB7
MH07Cj4gPiArICAgIGNyZWF0ZS5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9odm07Cj4gPiArICAg
IGNyZWF0ZS5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9oYXA7Cj4gPiArICAgIGNyZWF0ZS5mbGFn
cyB8PSBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmOwo+ID4gKyAgICBjcmVhdGUuYXJjaC5lbXVsYXRp
b25fZmxhZ3MgPSAoWEVOX1g4Nl9FTVVfQUxMICYgflhFTl9YODZfRU1VX1ZQQ0kpOwo+Cj4gVGhp
cyBpcyB4ODYgc3BlY2lmaWMgYnV0IHNlZW1zIHRvIGJlIHdyaXR0ZW4gaW4gY29tbW9uIGNvZGUu
IERpZCB5b3UKPiBidWlsZCBpdCBvbiBBcm0/CgpJIGhhdmUgbm90LCBkb24ndCBoYXZlIGEgc2V0
dXAgZm9yIEFSTSBhdCB0aGUgbW9tZW50LiBJIGd1ZXNzIEknbGwKanVzdCBtb3ZlIHRoaXMgZnVu
Y3Rpb24gdG8gbGlieGxfeDg2LmMgdG8gcmVzb2x2ZSB0aGUgaXNzdWUuCgo+Cj4gPiArCj4gPiAr
ICAgIGNyZWF0ZS5zc2lkcmVmID0gU0VDSU5JVFNJRF9ET01VOwo+ID4gKyAgICBjcmVhdGUucGFy
ZW50X2RvbWlkID0gcGRvbWlkOwo+ID4gKyAgICBjcmVhdGUubWF4X2V2dGNobl9wb3J0ID0gMTAy
MzsKPiA+ICsgICAgY3JlYXRlLm1heF9ncmFudF9mcmFtZXMgPSBMSUJYTF9NQVhfR1JBTlRfRlJB
TUVTX0RFRkFVTFQ7Cj4gPiArICAgIGNyZWF0ZS5tYXhfbWFwdHJhY2tfZnJhbWVzID0gTElCWExf
TUFYX01BUFRSQUNLX0ZSQU1FU19ERUZBVUxUOwo+Cj4gVGhlIGRvbWFpbiB5b3UgZm9yayBtYXkg
aGF2ZSBkaWZmZXJlbnQgdmFsdWVzIGhlcmUuIEZyb20gbXkKPiB1bmRlcnN0YW5kaW5nLCB0aGUg
Zm9yayByZXF1aXJlcyB0byBoYXZlIHRoZSBzYW1lIHBhcmFtZXRlcnMgYXMgdGhlCj4gcGFyZW50
LiBTbyBob3cgZG8geW91IGVuc3VyZSB0aGV5IGFyZSB0aGUgc2FtZT8KClRoZSBwYXJlbnQgZG9t
YWluIGlzIGNyZWF0ZWQgYnkgeGwuIElmIHlvdSBjcmVhdGUgYSBkb21haW4gd2l0aCB4bCBpdAp3
aWxsIGhhdmUgdGhlc2UgcGFyYW1ldGVycyBzZXQgYnkgZGVmYXVsdC4KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
