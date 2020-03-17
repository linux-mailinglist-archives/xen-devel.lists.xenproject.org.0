Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B9188B73
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 18:02:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEFYi-0003UP-R0; Tue, 17 Mar 2020 16:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9yM=5C=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jEFYh-0003UK-NX
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 16:59:15 +0000
X-Inumbo-ID: a12bc04e-6870-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a12bc04e-6870-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 16:59:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a24so27477637edy.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbcdS/YRgRG0xeGkoQXkgg7na07chTm/X13wabavFOI=;
 b=tOJGSMmhuuE+Qm36qTwXl3CsbLb2cmY5y2fnsw5XqIDHp1SuvGDVpluUpD+681AYPl
 q7V7eXmS7k4DLwG6abbItpsjJ18n6En4V9fQtiQlTCBVXyIlD7DIYQ2xN3f6W2dM16dF
 pgoUIu350ApJUn1iJR4s2Wn38bUdOYYc9CdwG3JmOBIbDeeoayCQQWPGxfsY2g1hYtGO
 9Hic9fGPvW6mr2Dmm8zoPTnOHiIW53jSXd1IB2iEna7e+xoYKxKabKZ2dZOKNJ6arerW
 MEDdxL9QsC06njeIKFX2jcIYZNUVW36D//T5H3LmJYjER91uQ6K7JWXDIZL0Mc4OukzC
 eYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbcdS/YRgRG0xeGkoQXkgg7na07chTm/X13wabavFOI=;
 b=i/i7gjsaUaklVCYnpkr5xigGNPnPWjVD0pULEQxhzwoCKAbcen78MZXOEN/uniEATj
 BNZ8wR+3ATFvXCEJVVG8pXtQAnMIt7XZZkofgGCC7+H+jXPoZJyFCYuUpNS7HAwsLME6
 zgXRxmDyld7bLcczIrjgHmdmxmLD1h34Dy0VgXbBeWShyOoeyM8mFnYS24Tz1KzWE8jH
 VaQWPZfal5SRkUA7j6W19AcZsLZ9AkkKrh/hEEMc5SH10XU7QAFSmkzJlnch5yuUCoUB
 dhC0Zx9dNxGHHQqEZIKWShq7Weklp4LHtlRCkiJ0Bgfn5xJJJaRCYA0lc3bnsiyJCXEc
 2+BA==
X-Gm-Message-State: ANhLgQ2Pn6e9QnfKUzTU4E9Szu7rR7V9bi/MJnzQ/fn5nG656SQSIxks
 FVThzaX9rpn81qlSwDwI6Yaw4Va3aHs=
X-Google-Smtp-Source: ADFU+vt7Kz6WQoHrrJK/Y35fECTpkxaHL/gV8jiDz+M71rq6df35OxSxpwNGsJ17Fqijb8dbaMheRg==
X-Received: by 2002:a50:8d84:: with SMTP id r4mr6546646edh.305.1584464353086; 
 Tue, 17 Mar 2020 09:59:13 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id k8sm205112ejq.36.2020.03.17.09.59.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 09:59:12 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id t13so53269wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 09:59:11 -0700 (PDT)
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr1920wmc.84.1584464351205; Tue,
 17 Mar 2020 09:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582914997.git.tamas.lengyel@intel.com>
 <4d049987eab1a08607f62d0e3b51768b529e1ff5.1582914998.git.tamas.lengyel@intel.com>
 <03a3d2e4-8ab1-1a83-f4ed-a6a403524f62@suse.com>
 <CABfawhmr9fvRQ4Y_39XUE+iPjU=sG-kznG5ZP5eDAKH4XZ8bVw@mail.gmail.com>
 <f71b1b25-6cb6-3107-8c93-ad1f8f3d6fbb@suse.com>
In-Reply-To: <f71b1b25-6cb6-3107-8c93-ad1f8f3d6fbb@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Mar 2020 10:58:34 -0600
X-Gmail-Original-Message-ID: <CABfawhmXGGhzyhDasLKOnp81c5TKGpBVK_9G4--K23p3=HrPFw@mail.gmail.com>
Message-ID: <CABfawhmXGGhzyhDasLKOnp81c5TKGpBVK_9G4--K23p3=HrPFw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v11 1/3] xen/mem_sharing: VM forking
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTA6MzUgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDE3LjAzLjIwMjAgMTc6MjMsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPiA+IE9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDEwOjAyIEFNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gT24gMjguMDIuMjAyMCAxOTo0MCwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4+PiBAQCAtNTg4LDcgKzU5NCw4IEBAIHN0cnVjdCBwYWdlX2lu
Zm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiA+Pj4gICAgICAgICAgICAgIHJldHVybiBwYWdl
Owo+ID4+Pgo+ID4+PiAgICAgICAgICAvKiBFcnJvciBwYXRoOiBub3QgYSBzdWl0YWJsZSBHRk4g
YXQgYWxsICovCj4gPj4+IC0gICAgICAgIGlmICggIXAybV9pc19yYW0oKnQpICYmICFwMm1faXNf
cGFnaW5nKCp0KSAmJiAhcDJtX2lzX3BvZCgqdCkgKQo+ID4+PiArICAgICAgICBpZiAoICFwMm1f
aXNfcmFtKCp0KSAmJiAhcDJtX2lzX3BhZ2luZygqdCkgJiYgIXAybV9pc19wb2QoKnQpICYmCj4g
Pj4+ICsgICAgICAgICAgICAgIW1lbV9zaGFyaW5nX2lzX2ZvcmsocDJtLT5kb21haW4pICkKPiA+
Pj4gICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4+Cj4gPj4gVGhpcyBsb29rcyBwcmV0dHkg
YnJvYWQgYSBjb25kaXRpb24sIGkuZS4gYWxsIHBvc3NpYmxlIHR5cGVzIHdvdWxkCj4gPj4gbWFr
ZSBpdCB0aHJvdWdoIGhlcmUgZm9yIGEgZm9yay4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBs
aW1pdAo+ID4+IHRvIHRvIHAybV9pc19ob2xlKCkgcGFnZSB0eXBlcywgbGlrZSB5b3UgY2hlY2sg
Zm9yIGluCj4gPj4gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKCk/Cj4gPgo+ID4gTm8gbmVlZCB0byBw
dXQgdGhhdCBjaGVjayBoZXJlLiBCeSBhbGxvd2luZyB0byBnbyBmdXJ0aGVyIHdoZW4gd2UgaGF2
ZQo+ID4gYSBmb3JrZWQgVk0sIHRoaXMgY29kZS1wYXRoIHdpbGwgY2FsbCBnZXRfZ2ZuX3R5cGVf
YWNjZXNzLCB3aGljaCBkb2VzCj4gPiB0aGF0IGNoZWNrLiBJdCdzIGJldHRlciB0byBoYXZlIHRo
YXQgY2hlY2sgYXQgb25lIHBsYWNlIGluc3RlYWQgb2YgYWxsCj4gPiBvdmVyIHVubmVjZXNzYXJp
bHkuCj4KPiBXZWxsLCBpZiB3b3JzZSBwZXJmb3JtYW5jZSAoZHVlIHRvIG1vcmUgY2FzZXMgd2hl
cmUgdGhlIGxvY2sgd2lsbAo+IGJlIHRha2VuKSBpcyBub3Qgb2YgY29uY2VybiAtIHNvIGJlIGl0
Lgo+Cj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAo+ID4+PiAr
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKPiA+Pj4gQEAgLTM5LDYgKzM5
LDkgQEAgc3RydWN0IG1lbV9zaGFyaW5nX2RvbWFpbgo+ID4+Pgo+ID4+PiAgI2RlZmluZSBtZW1f
c2hhcmluZ19lbmFibGVkKGQpICgoZCktPmFyY2guaHZtLm1lbV9zaGFyaW5nLmVuYWJsZWQpCj4g
Pj4+Cj4gPj4+ICsjZGVmaW5lIG1lbV9zaGFyaW5nX2lzX2ZvcmsoZCkgXAo+ID4+PiArICAgICht
ZW1fc2hhcmluZ19lbmFibGVkKGQpICYmICEhKChkKS0+cGFyZW50KSkKPiA+Pgo+ID4+IEFnYWlu
IG5vdCBuZWVkIGZvciAhISAoZm9yIGEgZGlmZmVyZW50IHJlYXNvbikuCj4gPgo+ID4gV2hpY2gg
aXM/Cj4KPiBGdXJ0aGVyIHVwIHRoZSByZWFzb24gd2FzIHRoYXQgeW91IHBhc3MgdGhlIHZhbHVl
IGFzIGFyZ3VtZW50Cj4gZm9yIGEgYm9vbGVhbiBmdW5jdGlvbiBwYXJhbWV0ZXIuIEhlcmUgdGhl
IHJlYXNvbiBpcyB0aGF0IGlzIGFuCj4gb3BlcmFuZCBvZiAmJi4KPgo+ID4+IEFsc28sIGRvZXMg
dGhlIGJ1aWxkIGJyZWFrIGlmIHlvdSBtYWRlIHRoaXMgYW4gaW5saW5lIGZ1bmN0aW9uCj4gPj4g
KGFzIHdlIGdlbmVyYWxseSBwcmVmZXIpPwo+ID4KPiA+IEFueSBwYXJ0aWN1bGFyIHJlYXNvbiBm
b3IgdGhhdCAoaW5saW5lIHZzIGRlZmluZSk/Cj4KPiBJbmxpbmUgZnVuY3Rpb25zIGFkZCB0eXBl
IHNhZmV0eSBmb3IgdGhlIGFyZ3VtZW50cywgd2hpY2gKPiAjZGVmaW5lLXMgZG9uJ3QgZG8uCgpB
Y2suCgo+Cj4gPj4+IEBAIC01MzIsNiArNTMzLDEwIEBAIHN0cnVjdCB4ZW5fbWVtX3NoYXJpbmdf
b3Agewo+ID4+PiAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGdyZWY7ICAgICAvKiBJTjogZ3Jl
ZiB0byBkZWJ1ZyAgICAgICAgICovCj4gPj4+ICAgICAgICAgICAgICB9IHU7Cj4gPj4+ICAgICAg
ICAgIH0gZGVidWc7Cj4gPj4+ICsgICAgICAgIHN0cnVjdCBtZW1fc2hhcmluZ19vcF9mb3JrIHsg
ICAgICAvKiBPUF9GT1JLICovCj4gPj4+ICsgICAgICAgICAgICBkb21pZF90IHBhcmVudF9kb21h
aW47ICAgICAgICAvKiBJTjogcGFyZW50J3MgZG9tYWluIGlkICovCj4gPj4+ICsgICAgICAgICAg
ICB1aW50MTZfdCBfcGFkWzNdOyAgICAgICAgICAgICAvKiBNdXN0IGJlIHNldCB0byAwICovCj4g
Pj4KPiA+PiBFc3BlY2lhbGx5IGluIHRoZSBwdWJsaWMgaW50ZXJmYWNlIC0gbm8gbmV3IG5hbWUg
c3BhY2UKPiA+PiB2aW9sYXRpb25zIHBsZWFzZS4gSS5lLiBwbGVhc2UgZHJvcCB0aGUgbGVhZGlu
ZyB1bmRlcnNjb3JlLgo+ID4+IEkgYWxzbyBzdHJ1Z2dsZSB0byBzZWUgd2h5IHRoaXMgaXMgYW4g
YXJyYXkgb2YgdGhyZWUKPiA+PiBlbGVtZW50cy4gSW4gZmFjdCBJIGRvbid0IHNlZSB3aHkgdGhl
IHBhZGRpbmcgZmllbGQgd291bGQgYmUKPiA+PiBuZWVkZWQgYXQgYWxsIC0gb25lIG90aGVyIHVu
aW9uIG1lbWJlciBvbmx5IGdldHMgcGFkZGVkIHRvCj4gPj4gaXRzIGFsaWdubWVudCAod2hpY2gg
aXMgd2hhdCBJJ2QgZXhwZWN0KSwgd2hpbGUgb3RoZXJzCj4gPj4gKHByZXN1bWFibHkgb2xkZXIg
b25lcykgZG9uJ3QgaGF2ZSBhbnkgcGFkZGluZyBhdCBhbGwuIEhlcmUKPiA+PiB0aGVyZSdzIG5v
IGltcGxpY2l0IHN0cnVjdHVyZSdzIGFsaWdubWVudCBwYWRkaW5nIHRoYXQgd2FudHMKPiA+PiBt
YWtpbmcgZXhwbGljaXQuCj4gPgo+ID4gSSBkb24ndCBrbm93IHdoYXQgeW91IGFyZSBhc2tpbmcu
IERyb3AgdGhlIHBhZGRpbmc/IEkgcHJlZmVyIGVhY2gKPiA+IHVuaW9uIG1lbWJlciB0byBiZSBw
YWRkZWQgdG8gNjQtYml0LCByZWR1Y2VzIGNvZ25pdGl2ZSBsb2FkIHRyeWluZyB0bwo+ID4gZmln
dXJlIG91dCB3aGF0IHRoZSBzaXplIGFuZCBhbGdpbm1lbnQgb2YgZWFjaCBtZW1iZXIgc3RydWN0
IHdvdWxkIGJlLgo+Cj4gUGVyc29uYWxseSBJJ2Qgc3VnZ2VzdCB0byBkcm9wIHRoZSBwYWRkaW5n
LCBhcyBpdCBhY3R1YWxseQo+IGdyb3dzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUuIEJ1dCBp
ZiB5b3UgZmVlbCBzdHJvbmdseQo+IGFib3V0IGtlZXBpbmcgaXQsIHRoZW4gSSdsbCBiZSBva2F5
IHdpdGgganVzdCB0aGUgZmllbGQncwo+IG5hbWUgY2hhbmdlZC4KCkl0IGdyb3dzIHRoZSBzdHJ1
Y3R1cmUgc2l6ZSB0byA2NC1iaXQsIHllcywgYnV0IGl0IGRvZXNuJ3QgZ3JvdyB0aGUKc2l6ZSBv
ZiB1bmlvbiBhcyBvdGhlciBtZW1iZXJzIGFyZSBtdWNoIGxhcmdlci4gSSdsbCByZW1vdmUgdGhl
CnVuZGVyc2NvcmUgZnJvbSB0aGUgcGFkIG5hbWUgYnV0IEkgc3RpbGwgcHJlZmVyIGl0IGFsaWdu
ZWQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
