Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C91685C8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 19:00:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5CYS-0001N5-Bk; Fri, 21 Feb 2020 17:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhbZ=4J=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j5CYR-0001N0-Ed
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:57:35 +0000
X-Inumbo-ID: a3483e58-54d3-11ea-bc8e-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3483e58-54d3-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 17:57:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r18so3423027edl.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 09:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shfT732YmBbDgfNxiHl58OnneU1m62ECkI4mmgPxfRI=;
 b=hnRwkvICbVraZzOogqRmxm1xl4HnsLHT38HMTYfbRXmrBAvkxm4awXKVTo2/qwgkIl
 9T0hrTO3gcqUDDVIOZKLT40CcxI/CiaIrL0LiGINhVAQXvrSnemKmfmgUjUlt4YUmZIq
 S8trdDQ1+sP+Zx4tUfPopLHuZqLGL4yAQ90HukjRs262mpzJPpPnxYltwjjIS4iHV7Sx
 aaVFnRmQsFMfRfjeiuxRdY9ssXCTyG94ClDZcxjr/7sATpAwq3IsQu97TX4keV0gbKp2
 ikQmueZ7YWWOb0Isj0kGuarfDGnRsBasA8DLiSnZQCTxcsmC90V3WT8rUzrlwkPJsh/f
 i42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shfT732YmBbDgfNxiHl58OnneU1m62ECkI4mmgPxfRI=;
 b=qDYS6ezDFeFrMHtcmMCclvQ369XzzrwYRnU/sWady64GVjbG01UbRwhU0H9o4PoDXv
 zdByagVBaZf2vCVYPPcoV8NvNZLix/XJ/YqPM+96RQws1/67D1Wvg9jEE9LbT/CKxlny
 SzxIvqUyMK/G6qKd9+AWdqfmtPY3gRTWVbVYJAqjuyxSueEjMiqH35aNYz1rVrhMmAIs
 1INcvoa714tdkCTUVB0Aq14gKqqN5XxKYYaznG/4RhVA5quPPrLZtyH/1M/N6qlOB166
 Hl4VI4WtYMStaPWpeTgcgZIatilSiutYHrWcYPh9rI34n15ZT9YFRihwI32WrYZTCY2F
 o6OA==
X-Gm-Message-State: APjAAAWHrI9YLzlQLnQXGLGGZhhCxiTu+8fvxslx4taWomXtvGxOFHAT
 hky5UH4LW49rIVxOXQYe6s/+gCRrGbQ=
X-Google-Smtp-Source: APXvYqzIePxIEQbQRo3nOPVKfx0DQyXuczj+yIw9cHzT1/JzqBDRySusUb2zAJIYtNmjP2CQTm1x9A==
X-Received: by 2002:aa7:da13:: with SMTP id r19mr4874460eds.188.1582307853386; 
 Fri, 21 Feb 2020 09:57:33 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id x12sm285081eje.52.2020.02.21.09.57.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 09:57:32 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id w15so3015239wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 09:57:32 -0800 (PST)
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr50587972wrx.386.1582307851839; 
 Fri, 21 Feb 2020 09:57:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
 <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
 <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
 <24288f4e-36da-f701-9709-ca3acc1f815a@citrix.com>
In-Reply-To: <24288f4e-36da-f701-9709-ca3acc1f815a@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 21 Feb 2020 10:56:55 -0700
X-Gmail-Original-Message-ID: <CABfawhmYx7wSBR2Kc01Wf7DR_eg4n4TQAh730KXQk-rVVaJTGA@mail.gmail.com>
Message-ID: <CABfawhmYx7wSBR2Kc01Wf7DR_eg4n4TQAh730KXQk-rVVaJTGA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDcgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMS8wMi8yMDIwIDE3OjA3LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCA3OjQyIEFNIEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IE9uIDEwLzAy
LzIwMjAgMTk6MjEsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4gK3N0YXRpYyBpbnQgbWVt
X3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiA+Pj4g
K3sKPiA+Pj4gKyAgICBpbnQgcmMgPSAtRUlOVkFMOwo+ID4+PiArCj4gPj4+ICsgICAgaWYgKCAh
Y2QtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQgKQo+ID4+PiArICAgICAgICByZXR1cm4gcmM7Cj4g
Pj4+ICsKPiA+Pj4gKyAgICAvKgo+ID4+PiArICAgICAqIFdlIG9ubHkgd2FudCB0byBnZXQgYW5k
IHBhdXNlIHRoZSBwYXJlbnQgb25jZSwgbm90IGVhY2ggdGltZSB0aGlzCj4gPj4+ICsgICAgICog
b3BlcmF0aW9uIGlzIHJlc3RhcnRlZCBkdWUgdG8gcHJlZW1wdGlvbi4KPiA+Pj4gKyAgICAgKi8K
PiA+Pj4gKyAgICBpZiAoICFjZC0+cGFyZW50X3BhdXNlZCApCj4gPj4+ICsgICAgewo+ID4+PiAr
ICAgICAgICBBU1NFUlQoZ2V0X2RvbWFpbihkKSk7Cj4gPj4+ICsgICAgICAgIGRvbWFpbl9wYXVz
ZShkKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICBjZC0+cGFyZW50X3BhdXNlZCA9IHRydWU7Cj4g
Pj4+ICsgICAgICAgIGNkLT5tYXhfcGFnZXMgPSBkLT5tYXhfcGFnZXM7Cj4gPj4+ICsgICAgICAg
IGNkLT5tYXhfdmNwdXMgPSBkLT5tYXhfdmNwdXM7Cj4gPj4gU29ycnksIEkgc3Bva2UgdG9vIHNv
b24uICBZb3UgY2FuJ3QgbW9kaWZ5IG1heF92Y3B1cyBoZXJlLCBiZWNhdXNlIGl0Cj4gPj4gdmlv
bGF0ZXMgdGhlIGludmFyaWFudCB0aGF0IGRvbWFpbl92Y3B1KCkgZGVwZW5kcyB1cG9uIGZvciBz
YWZldHkuCj4gPj4KPiA+PiBJZiB0aGUgdG9vbHN0YWNrIGdldHMgdGhpbmdzIHdyb25nLCBYZW4g
d2lsbCBlaXRoZXIgbGVhayBzdHJ1Y3QgdmNwdSdzCj4gPj4gb24gY2QncyB0ZWFyZG93biwgb3Ig
Y29ycnVwdCBtZW1vcnkgYmV5b25kIHRoZSBlbmQgb2YgdGhlIGNkLT52Y3B1W10gYXJyYXkuCj4g
Pj4KPiA+PiBMb29raW5nIGF0IHRoZSBoeXBlcmNhbGwgc2VtYW50aWNzLCB1c2Vyc3BhY2UgY3Jl
YXRlcyBhIG5ldyBkb21haW4KPiA+PiAod2hpY2ggc3BlY2lmaWVzIG1heF9jcHVzKSwgdGhlbiBj
YWxscyBtZW1fc2hhcmluZ19mb3JrKHBhcmVudF9kb20sCj4gPj4gbmV3X2RvbSk7ICBGb3JraW5n
IHNob3VsZCBiZSByZWplY3RlZCBpZiB0b29sc3RhY2sgaGFzbid0IGNob3NlbiB0aGUKPiA+PiBz
YW1lIG51bWJlciBvZiB2Y3B1cyBmb3IgdGhlIG5ldyBkb21haW4uCj4gPiBUaGF0J3MgdW5mb3J0
dW5hdGUgc2luY2UgdGhpcyB3b3VsZCByZXF1aXJlIGFuIGV4dHJhIGh5cGVyY2FsbCBqdXN0IHRv
Cj4gPiBnZXQgaW5mb3JtYXRpb24gWGVuIGFscmVhZHkgaGFzLiBJIHRoaW5rIGluc3RlYWQgb2Yg
d2hhdCB5b3UgcmVjb21tZW5kCj4gPiB3aGF0IEknbGwgZG8gaXMgZXh0ZW5kIFhFTl9ET01DVExf
Y3JlYXRlZG9tYWluIHRvIGluY2x1ZGUgdGhlIHBhcmVudAo+ID4gZG9tYWluJ3MgSUQgYWxyZWFk
eSBzbyBYZW4gY2FuIGdhdGhlciB0aGVzZSBpbmZvcm1hdGlvbiBhdXRvbWF0aWNhbGx5Cj4gPiB3
aXRob3V0IHRoZSB0b29sc3RhY2sgaGF2aW5nIHRvIGRvIGl0IHRoaXMgcm91bmRhYm91dCB3YXku
Cj4KPiBDb25jZXB0dWFsbHksIEkgdGhpbmsgdGhhdCBpcyBjbGVhbmVyLiAgWW91IHJlYWxseSBk
byB3YW50IHRvIGR1cGxpY2F0ZQo+IHRoZSBwYXJlbnQgZG9tYWluLCB3aGF0ZXZlciBpdHMgc2V0
dGluZ3MgYXJlLgo+Cj4gSG93ZXZlciwgSSdkIHN1Z2dlc3Qgbm90IGV4dGVuZGluZyBjcmVhdGVk
b21haW4uICBXaGF0IHNob3VsZCB0aGUKPiBzZW1hbnRpY3MgYmUgZm9yIHN1Y2ggYSBjYWxsIHdo
aWNoIHBhc3NlcyBjb25mbGljdGluZyBzZXR0aW5ncz8KCkknbSBub3Qgc3VyZSB3aGF0IGNvbmZs
aWN0aW5nIHNldHRpbmdzIHlvdSB3b3JyeSBhYm91dD8gSSBzaW1wbHkgYWRkIGEKZmllbGQgdG8g
eGVuX2RvbWN0bF9jcmVhdGVkb21haW4gY2FsbGVkIHBhcmVudF9kb21haW4sIHRoZW4gaW4gdGhl
CmRvbWN0bCBoYW5kbGVyIGlmIGl0cyBzZXQgd2UgY29weSB0aGUgbWF4X3ZjcHVzIHZhbHVlIGRp
cmVjdGx5IGZyb20KdGhlcmU6CgogICAgICAgIHBhcmVudF9kb20gPSBvcC0+dS5jcmVhdGVkb21h
aW4ucGFyZW50X2RvbWlkOwogICAgICAgIGlmICggcGFyZW50X2RvbSApCiAgICAgICAgewogICAg
ICAgICAgICBzdHJ1Y3QgZG9tYWluICpwZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChwYXJlbnRf
ZG9tKTsKCiAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7CiAgICAgICAgICAgIGlmICggIXBkICkK
ICAgICAgICAgICAgICAgIGJyZWFrOwoKICAgICAgICAgICAgb3AtPnUuY3JlYXRlZG9tYWluLm1h
eF92Y3B1cyA9IHBkLT5tYXhfdmNwdXM7CiAgICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKHBk
KTsKICAgICAgICB9Cgo+Cj4gSG93IGFib3V0IGEgbmV3IHRvcCBsZXZlbCBkb21jdGwgZm9yIGNs
b25lX2RvbWFpbiwgdGFraW5nIGEgcGFyZW50Cj4gZG9tYWluIGlkZW50aWZpZXIsIGFuZCBvcHRp
b25hbGx5IHByb3ZpZGluZyBhIHNwZWNpZmljIG5ldyBkb21pZD8gIFRoaXMKPiB3YXksIGl0IGlz
IGltcG9zc2libGUgdG8gcHJvdmlkZSBjb25mbGljdGluZyBzZXR0aW5ncywgYW5kIHRoZSBzZW1h
bnRpY3MKPiBzaG91bGQgYmUgcXVpdGUgY2xlYXIuICBJbnRlcm5hbGx5LCBYZW4gY2FuIGRvIHdo
YXRldmVyIGl0IG5lZWRzIHRvIGNvcHkKPiBhcHByb3ByaWF0ZSBzZXR0aW5ncywgYW5kIGdldCB0
aGluZ3Mgc29ydGVkIGJlZm9yZSB0aGUgZG9tYWluIGJlY29tZXMKPiBnbG9iYWxseSB2aXNpYmxl
LgoKSSBhbHJlYWR5IGhhdmUgYSBoeXBlcmNhbGwgYWRkZWQgZm9yIGZvcmtfZG9tYWluIGFuZCBJ
IGV2ZW4gdHJpZWQKZG9pbmcgZXZlcnl0aGluZyBpbiBhIHNpbmdsZSBoeXBlcmNhbGwuIFRoZSBw
cm9ibGVtIEkgcmFuIGludG8gd2l0aAp0aGF0IHdhcyBpdCByZXF1aXJlZCBhIGxvdCBvZiByZWZh
Y3RvcmluZyB3aXRoaW4gWGVuIHNpbmNlCmRvbWFpbl9jcmVhdGUgaXMgbm90IHByZWVtcHRpYmxl
IHJpZ2h0IG5vdywgd2hpbGUgc29tZSBvdGhlciBwYXJ0cyBvZgpmb3JraW5nIG5lZWQgdG8gYmUg
cHJlZW1wdGlibGUuIFNvIGl0IHdhcyBqdXN0IGVhc2llciB0byBkbyBpdCB3aXRoIDIKaHlwZXJj
YWxscy4gT25lIGp1c3QgY3JlYXRlcyB0aGUgZG9tYWluIHNoZWxsIHZpYQpYRU5fRE9NQ1RMX2Ny
ZWF0ZWRvbWFpbiBhbmQgdGhlIHNlY29uZCBhY3R1YWxseSBzZXRzIGl0IHVwIGFzIGEgZm9yay4K
Cj4KPiBPbmUgcXVlc3Rpb24gbmVlZGluZyBjb25zaWRlcmluZyBpcyB3aGV0aGVyIHN1Y2ggYSBo
eXBlcmNhbGwgY291bGQgaW4KPiB0aGVvcnkgYmUgdXNlZnVsIHdpdGhvdXQgdGhlIG1lbV9zaGFy
aW5nIGluZnJhc3RydWN0dXJlLCBvciBub3QuICAoaS5lLgo+IGhvdyB0aWdodGx5IGludGVncmF0
ZWQgd2Ugc2hvdWxkIGFpbSBmb3IuKQo+Cj4gPj4gVGhpcyByYWlzZXMgdGhlIHF1ZXN0aW9uIG9m
IHdoZXRoZXIgdGhlIHNhbWUgc2hvdWxkIGJlIHRydWUgZm9yCj4gPj4gbWF4X3BhZ2VzIGFzIHdl
bGwuCj4gPiBDb3VsZCB5b3UgZXhwYW5kIG9uIHRoaXM/Cj4KPiBXZWxsIC0gdGhlc2UgdHdvIGFy
ZSBhIHZlcnkgb2RkIHN1YnNldCBvZiB0aGluZ3MgdG8gYmxpbmRseSBjb3B5LiAgVGhlCj4gbWF4
X2NwdXMgc2lkZSBpcyB3cm9uZywgd2hpY2ggbWFrZXMgbWF4X3BhZ2VzIGxpa2VseSB0byBiZSB3
cm9uZyBhcyB3ZWxsLgoKVGhlIG1heF9jcHVzIHNpZGUgaXMgY2xlYXJlciB3aHkgaXQncyB3cm9u
ZyBzaW5jZSB0aGVyZSBpcyBhbgphbGxvY2F0aW9uIGR1cmluZyBkb21haW5fY3JlYXRlIGJhc2Vk
IG9uIHRoYXQgbnVtYmVyLiBJIGhhdmVuJ3QgcmFuCmludG8gdGhhdCBpc3N1ZSBpdCBzZWVtcyBi
ZWNhdXNlIGFsbCB0aGUgZG9tYWlucyBJIHRlc3RlZCB3aXRoIGhhZApvbmx5IGEgc2luZ2xlIHZD
UFUuIEJ1dCBtYXhfcGFnZXMgc2hvdWxkIGJlIHNhZmUgdG8gY29weSwgc2luY2UgYW55CnBhZ2Ug
dGhhdCB3b3VsZCBnZXQgYWNjZXNzZWQgdXAgdG8gbWF4X3BhZ2VzIHdvdWxkIGdldCBmb3JrZWQg
ZnJvbSB0aGUKcGFyZW50LiBJIGhhdmVuJ3QgcnVuIGludG8gYW55IGlzc3VlcyB3aXRoIHRoYXQu
IFNvIEkgZG9uJ3QgcmVhbGx5IHNlZQp3aGF0J3MgdGhlIHByb2JsZW0gdGhlcmUuCgpUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
