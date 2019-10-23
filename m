Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269AE22F6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 20:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNLnx-0004DF-6b; Wed, 23 Oct 2019 18:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2CXN=YQ=gmail.com=estebanbosse@srs-us1.protection.inumbo.net>)
 id 1iNLnw-0004DA-7e
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 18:56:20 +0000
X-Inumbo-ID: cbd15c18-f5c6-11e9-a531-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbd15c18-f5c6-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 18:56:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v9so11986313wrq.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=WEPGtQ7gGK6XQ5/vOjRhCH5V74QEjKYZ9fIob6AHkvw=;
 b=pVX0d3desBcFd+MshlNCdENKlANRYrAhLZjz8edGPl6MGICWEej5OiNU0c/o9iCRYV
 C3XZEGpGnpUNivgGhzSvlKtNP3T5nppDhq9XuMouDSOkS2n0iwmX55oqkHi4pYqpKk5l
 cpwoFobZJDVzN55RnbB0i7q6nL/4b7SztcOCaUqV+zXZEa6wcUQntTBmHAhkHxInicqA
 NG3oKejiJ4Y0Yd5CiLbL5i0YTVr+HnUyyXWiObxkvuTVbLlpekGaJ2kAKsx9tbECZQbr
 dZJci6tL+R/sHKA7ARDG01229IfuJbGn0+jt86pQuEvDGQ2oFZgz/oJXdHIUwuKuOhcN
 0x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=WEPGtQ7gGK6XQ5/vOjRhCH5V74QEjKYZ9fIob6AHkvw=;
 b=mOgzh5nbA9M0/JHErWA1eJ+HinrBZmzAPmuWAwupQgJ9MXHM1KgLwn+IkEAZQBkRdN
 JMwYA6voc4mdsZOYOOApeuqDx5zoWFRp4Z9MQmcYIcIo28XvTFd/qh3eWnI7M0+NoCU1
 F0Cq84kKS6fYw8jShk0G9pzOOdXFD81DNqsPVq+fqiJO/ECCfuIf4Td7AlSe+SdhHxWW
 xFJjdXCpHPzAa3TkDTplFapf1H7e0OI1nHtz8oNcWJIeq3AgAdSNuH4Y2vwHJ3f0hZXm
 35T/NMD61tKLnj4c5hBB4u3z48PspdjHCw6YLb9/LDKDCANIel/AipjTVz7Q6aGqW+hC
 cvbA==
X-Gm-Message-State: APjAAAV6foLkR6+JGC5WKyPw1a7FXIxgnL5GVzhEleOUeovE8DZ0mWOx
 z8Rb50OtDGDSqNb6Fk/OA8Y=
X-Google-Smtp-Source: APXvYqwQgrx/ATVbGWn8BNneqNMlEXZy7+s3aXLwF/SI7HHAqvlgzrmxjbV51PBunpJS11xYsZw8NA==
X-Received: by 2002:a05:6000:142:: with SMTP id r2mr225991wrx.30.1571856977834; 
 Wed, 23 Oct 2019 11:56:17 -0700 (PDT)
Received: from ?IPv6:2a01:c23:6030:5100:7e6a:c70f:e991:63a?
 ([2a01:c23:6030:5100:7e6a:c70f:e991:63a])
 by smtp.gmail.com with ESMTPSA id u21sm64034wmu.27.2019.10.23.11.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 11:56:17 -0700 (PDT)
Message-ID: <a30454177a5146c4e11fc5463aabbe7a075e0e15.camel@gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Oct 2019 20:52:07 +0200
In-Reply-To: <CAFEAcA-FesfcimTutrYwZFdB93mEE42ha7X93jDqAW7CFUd+0w@mail.gmail.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-4-philmd@redhat.com>
 <b1255a22fe4409244f7a68887137fbe43b71a08d.camel@gmail.com>
 <CAFEAcA-FesfcimTutrYwZFdB93mEE42ha7X93jDqAW7CFUd+0w@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/20] piix4: Add a i8259 Interrupt
 Controller as specified in datasheet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWwgbWFyLCAyMi0xMC0yMDE5IGEgbGFzIDEwOjQyICswMTAwLCBQZXRlciBNYXlkZWxsIGVzY3Jp
YmnDszoKPiBPbiBUdWUsIDIyIE9jdCAyMDE5IGF0IDA5OjUyLCBFc3RlYmFuIEJvc3NlIDxlc3Rl
YmFuYm9zc2VAZ21haWwuY29tPgo+IHdyb3RlOgo+ID4gRWwgdmllLCAxOC0xMC0yMDE5IGEgbGFz
IDE1OjQ3ICswMjAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQo+ID4gZXNjcmliacOzOgo+ID4g
PiArc3RhdGljIHZvaWQgcGlpeDRfcmVxdWVzdF9pODI1OV9pcnEodm9pZCAqb3BhcXVlLCBpbnQg
aXJxLCBpbnQKPiA+ID4gbGV2ZWwpCj4gPiA+ICt7Cj4gPiA+ICsgICAgUElJWDRTdGF0ZSAqcyA9
IG9wYXF1ZTsKPiA+ID4gKyAgICBxZW11X3NldF9pcnEocy0+Y3B1X2ludHIsIGxldmVsKTsKPiA+
ID4gK30KPiA+IEkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSBpbiBgUElJWDRTdGF0ZSAq
cyA9IG9wYXF1ZTtgIGl0cyBub3QKPiA+IG5lY2Vzc2FyeSBhIGNhc3Qgb3IgYSBvYmplY3QgbWFj
cm8gbWFnaWMuCj4gPiBTb21ldGhpbmcgbGlrZToKPiA+IFBJSVg0U3RhdGUgKnMgPSAoUElJWDRT
dGF0ZSopb3BhcXVlOwo+ID4gUElJWDRTdGF0ZSAqcyA9IFBJSVg0U1RBVEUob3BhcXVlKTsKPiAK
PiBUaGUgc2ltcGxlIGFuc3dlciB0byAid2h5IGRvbid0IHdlIG5lZWQgYSBjYXN0IiBpcwo+ICJi
ZWNhdXNlIHRoZSB0eXBlIG9mICdvcGFxdWUnIGlzICd2b2lkIConLCBhbmQgaW4gQyB0aGVyZSBp
cwo+IG5vIG5lZWQgdG8gZXhwbGljaXRseSBjYXN0IGEgJ3ZvaWQgKicgYXMgaXQgd2lsbCBiZSBp
bXBsaWNpdGx5Cj4gY29udmVydGVkIHRvIHRoZSBwb2ludGVyIHR5cGUgb2YgdGhlIGRlc3RpbmF0
aW9uIi4gKFRoaXMgaXMKPiBkaWZmZXJlbnQgZnJvbSBDKyssIHdoaWNoIGRvZXMgcmVxdWlyZSBh
biBleHBsaWNpdCBjYXN0IGZvciB2b2lkKi4pCj4gCj4gRm9yIFFPTSB0eXBlcywgUUVNVSBjb252
ZW50aW9uYWxseSB1c2VzIHRoZSBRT00gY2FzdGluZwo+IG1hY3JvIHRvIGNvbnZlcnQgYSBwb2lu
dGVyLXRvLWluc3RhbmNlIHRvCj4gcG9pbnRlci10by1pbnN0YW5jZS1vZi1wYXJlbnQtY2xhc3Mg
YW5kIHZpY2UgdmVyc2EuCj4gSW4gc29tZSBwbGFjZXMsIGxpa2UgdGhpcyBvbmUsIHdoYXQgd2Ug
aGF2ZSBpcyBqdXN0IGEKPiB2b2lkKiByZXByZXNlbnRpbmcgb3BhcXVlIGRhdGEgaGF2aW5nIGJl
ZW4gcGFzc2VkIGFyb3VuZC4KPiBZb3UgY291bGQgdXNlIHRoZSBRT00gY2FzdCBtYWNybyBoZXJl
LCB3aGljaCB3b3VsZCBhZGQKPiBhIGJpdCBvZiBleHRyYSB0eXBlLXNhZmV0eSwgYnV0IHRoZSBw
cm9qZWN0IGRvZXNuJ3QgaGF2ZQo+IGEgc3Ryb25nIGNvbnZlbnRpb24gaGVyZSBvbiB3aGV0aGVy
IHRvIGRvIHNvIG9yIG5vdCwgc28KPiB5b3UnbGwgb2Z0ZW4gc2VlIHRoZSBqdXN0LWFzc2lnbm1l
bnQgY29kZS4KPiAKPiB0aGFua3MKPiAtLSBQTU0KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgZGV0YWlsZWQgZXhwbGFuYXRpb24gOikuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
