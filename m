Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADE60239
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 10:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjJde-0002aX-21; Fri, 05 Jul 2019 08:32:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVzm=VC=gmail.com=drhunter95@srs-us1.protection.inumbo.net>)
 id 1hjJdc-0002aR-Lq
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 08:32:12 +0000
X-Inumbo-ID: 61aa7db0-9eff-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 61aa7db0-9eff-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 08:32:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so7513043edv.6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2019 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//VdEvLIwBf2m96RuQQbdVE/jmAAQEcnxmFZLM2qswo=;
 b=RIDznAOOTPzvUIlxePV8BU5EP1533K+V60IiUnz1KBhgmp3T7vCpfR0/Td/mJ840uV
 gxfBWqC6BnKXeP+bo3HfVS3hf5x5bNJNpASxB1XMJLIGAzc4UdOna+MGT39pYdaK9Y0C
 lvBFMK6+aMklflrQjCuKjiBgG9MqkNKCiq4MXLPIH9U+r2M6eo0Bq/7234d+M/U4vWJO
 T8vd5Iw2yE9mecT6LG6bcxLI8+w6o413a4Du4rdv1qeRawIFHaFvjPpc04hdXsPO5+2z
 83eqxO/5bb9+Qk54lGE8n36F4gvez6vR82o+trPFCBLbugkAzptBAVznJNO7H32AmxCr
 3SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//VdEvLIwBf2m96RuQQbdVE/jmAAQEcnxmFZLM2qswo=;
 b=S300/LmpdnRWRUyB+xCDR+gpR41qMhzf+XzeTWLtzCdyskd4CZmYY8QmTqWybz3GRv
 swEoSZ/N9AC+dH6pXldFtRNy1zbNGKIc4RiR9rYTcSlCs5xq0COeklctkSc9mUEC7mIN
 NA0XmC2PbL/caHKsWFrPXFCrbQjfw0QhkNsh7cUK2QGVFQUa2Sn9nCIDrHau0sf6AwAh
 w04yxovr3HTAuaWnD1kuGl0RrY5EGwLoraMdMOOK13TJOrRk7F+sVhTaks/Prt5O6Ll2
 dZGCynWwGQ0uqt3fmejAITl5HHMZPgLyqPaEY9CgDaimXQBqIYu7JsExOXe/DUpQKo4e
 MrAA==
X-Gm-Message-State: APjAAAUsZrg5E0gXl6+g6W/RYkC1qFYxz2r75ulkTi+3knQhWTDiplNf
 zrMAT2+MA+EUKfCEFSFXMttg1OakHU3ijfZiiW0=
X-Google-Smtp-Source: APXvYqycKMQOYqwl9IZNKA8HYS49Y9jP5ZUy0/fIat76frP49ZWW0sHrTQ11oXm8WB0H8/n7ZzzR/QTrZVvs9n9tlb4=
X-Received: by 2002:a05:6402:1456:: with SMTP id
 d22mr3094111edx.57.1562315529842; 
 Fri, 05 Jul 2019 01:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
In-Reply-To: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
From: Iain Hunter <drhunter95@gmail.com>
Date: Fri, 5 Jul 2019 09:31:59 +0100
Message-ID: <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsClRoYXQgaXMgYWJvdXQgYXMgZmFyIGFzIEkgZ290Li4uLgoKVGhlIGRyaXZlciB0
byBoYW5kbGUgY3Jvc3NiYXIgaXMKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvbWFzdGVyL2RyaXZlcnMvaXJxY2hpcC9pcnEtY3Jvc3NiYXIuYwpUaGUgZG9jdW1lbnRhdGlv
biBpcwpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9vbWFwL2Nyb3NzYmFyLnR4dAoKVGhpcyBp
cyBhIFRJIHNwZWNpZmljIGRyaXZlciBhcyBmYXIgYXMgSSBrbm93IHNvIFhlbiB3aWxsIHByb2Jh
Ymx5IG5vdAp1bmRlcnN0YW5kIGl0LgpJYWluCgpPbiBXZWQsIDMgSnVsIDIwMTkgYXQgMTY6MzQs
IERlbmlzIE9icmV6a292IDxkZW5pc29icmV6a292QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
bywKPiBJIGFtIHRyeWluZyB0byBydW4geGVuIGFuZCBJIGhhdmUgYSBwcm9ibGVtOgo+IGh0dHBz
Oi8vcGFzdGViaW4uY29tL1UwZ2NoOXVzIG9uIGxpbmUgMTkwLTE5Mwo+Cj4gU28sIGl0IHNlZW1z
IHRoYXQgTGludXggY2FuJ3QgZGlzY292ZXIgdGhlIGlycSBkb21haW5nIGZvciBjcm9zc2Jhcgo+
IGludGVycnVwdCBjb250cm9sbGVyIHdoZW4gcnVubmluZyBpbiBkb20wLCBidXQgaXQgaGFzIG5v
IHByb2JsZW0gd2hlbgo+IHJ1bm5pbmcgYmFyZW1ldGFsLgo+Cj4gSGVyZSBpcyB0aGUgRFQgbG9n
IHdpdGggeGVuOgo+IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9vcGVuP2lkPTE1WVRzQ0tZVVRi
RzJpLXNpV2V6SlhLV3VHMEgxVmZRego+IChhbiBvbGRlciB2ZXJzaW9uIHdpdGggYW5vdGhlciBt
aXN0YWtlKSAgSXQgY2FuIGJlIHNlZW4gdGhhdCBleHRlcm5hbAo+IGludGVycnVwdHMgYXJlIGNv
bm5lY3RlZCB0byB0aGUgY3Jvc3NiYXIgaW50ZXJydXB0IGNvbnRyb2xsZXIuCj4KPiBJIGZvdW5k
IHNvbWUgaW5mb3JtYXRpb24gYWJvdXQgaXJxIGRvbWFpbnMgYW5kIGNyb3NzYmFyczoKPiBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL0lSUS1kb21haW4udHh0Cj4KPiBp
dCBzZWVtcyB0byBtZSB0aGF0IGl0IGlzIHBvc3NpYmxlIHRvIGdpdmUgY29udHJvbCBvbiB0aGUg
Y3Jvc3NiYXIgdG8KPiBkb20wLCB0aG91Z2gsIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgd2hh
dCdzIGhhcHBlbmluZy4KPgo+IC0tCj4gUmVnYXJkcywgRGVuaXMgT2JyZXprb3YKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
