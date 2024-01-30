Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436378427CC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673564.1047965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpqt-0000ZC-Su; Tue, 30 Jan 2024 15:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673564.1047965; Tue, 30 Jan 2024 15:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpqt-0000Xc-Pd; Tue, 30 Jan 2024 15:16:43 +0000
Received: by outflank-mailman (input) for mailman id 673564;
 Tue, 30 Jan 2024 15:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xawb=JI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rUpqs-0000XK-2T
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:16:42 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 915420ef-bf82-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:16:40 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5111e3b03dfso555827e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:16:40 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05651210c300b0050e6df07728sm1495012lfg.180.2024.01.30.07.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 07:16:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 915420ef-bf82-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706627799; x=1707232599; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zT48tCWBHP/qFtXAZcXm0Ce52oAyaABbhemGgw8xV54=;
        b=gvVT2CnX1MIKZL+4dfo/YL1cN6+8gz48HS0Ih1fGCFi0VSRJVxQUSBnXrZJ1keU0mJ
         aI8UMdLgva5zRW0nM356xfD1k2fpLFQ2RbHzHPeaMqvpsLzaToc8MSopkqtJWMW6v9dt
         /SMVLXtQk3mJNuYP80Um9sjt4e91CZ4Vyd4964VGL14ishAksMK5QzXFDNaDfnUn8+jh
         PBuQTVAmIZkre2jATLjgcoi1G4wRRvDaIkcIMR9gUKek6Wd6T+o4K1pJzcD6+vtBfWGj
         D9Y2gbzHPa7lKbuBJuq7WP6Jl+yLGQQ1HZ4UX2GkdSIyu030N3kneVWtlgsG/PzijwCu
         snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627799; x=1707232599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT48tCWBHP/qFtXAZcXm0Ce52oAyaABbhemGgw8xV54=;
        b=Vxcmik0VseUqOn3pw1W8YMvEECD5Ch/iHSPX8lz59ae6L5cKzDbwQ/FBJaqHUk2Jdl
         Q35LyMVRam4qMRydcyqm448FVk1ECwE+cF+zkIC+HvC63HTibenfRfVR1pXC2xPPzMjS
         uhS43gjh/ww5VospUaHUnFOJrm9F7uNysy/A7zmE95aEP4EBcmNODp6IOBYkHSF9z219
         D2DEGqNWJwPib0oVm1cs1A3OuwKSWzZ8JyG7T0rexrElb/uFpfbkzOYLOPy2gF0VltOn
         RXwM/vTaY+EpHNMW/PmbUdnkpDDpsRjO1sd66gmolCAqYdKM39Gu1UQ3xO85hsler0+o
         Ndzw==
X-Gm-Message-State: AOJu0YwPG4P5FMNX3l5/LV0IFPZZmz7KRoa5xyTuXjPPDvKuUP6T2pe9
	CK9Rd7zbj6CccKiTfm6HNqMwlnG42c/wQtFoAttP78PJ9qhaJEFc
X-Google-Smtp-Source: AGHT+IHF/oDMpPWTqnI5U0fnjkxh0ZgAX2e8o9n6HVYLa5l9upW1NX1wcmKVWMcYOVG+YFn6KT6DLg==
X-Received: by 2002:a05:6512:138d:b0:510:b5c:a79a with SMTP id fc13-20020a056512138d00b005100b5ca79amr820164lfb.10.1706627799385;
        Tue, 30 Jan 2024 07:16:39 -0800 (PST)
Message-ID: <c589ba26c0b57856723a1463cc9807408301886d.camel@gmail.com>
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 30 Jan 2024 17:16:38 +0200
In-Reply-To: <9e604a3e-fac7-49dd-8f84-744e72ba71b7@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
	 <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
	 <848bcb2d7e5357ca6d3672bef52ac57c5b1f7f95.camel@gmail.com>
	 <9e604a3e-fac7-49dd-8f84-744e72ba71b7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTAxLTMwIGF0IDE2OjA1ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAzMC4wMS4yMDI0IDE1OjU3LCBPbGVrc2lpIHdyb3RlOgo+ID4gT24gTW9uLCAyMDI0LTAxLTIy
IGF0IDE3OjI3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiArI2RlZmluZSBfX3hj
aGdfYWNxdWlyZShwdHIsIG5ldywgc2l6ZSkgXAo+ID4gPiA+ICsoeyBcCj4gPiA+ID4gK8KgwqDC
oCBfX3R5cGVvZl9fKHB0cikgcHRyX18gPSAocHRyKTsgXAo+ID4gPiA+ICvCoMKgwqAgX190eXBl
b2ZfXyhuZXcpIG5ld19fID0gKG5ldyk7IFwKPiA+ID4gPiArwqDCoMKgIF9fdHlwZW9mX18oKihw
dHIpKSByZXRfXzsgXAo+ID4gPiA+ICvCoMKgwqAgc3dpdGNoIChzaXplKSBcCj4gPiA+ID4gKwl7
IFwKPiA+ID4gPiArwqDCoMKgIGNhc2UgNDogXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBhc20g
dm9sYXRpbGUoIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiCWFtb3N3YXAudyAl
MCwgJTIsICUxXG4iIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9BQ1FV
SVJFX0JBUlJJRVIgXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIj1yIiAocmV0
X18pLCAiK0EiICgqcHRyX18pIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJy
IiAobmV3X18pIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiICk7
IFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7IFwKPiA+ID4gPiArwqDCoMKgIGNhc2Ug
ODogXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBhc20gdm9sYXRpbGUoIFwKPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiCWFtb3N3YXAuZCAlMCwgJTIsICUxXG4iIFwKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9BQ1FVSVJFX0JBUlJJRVIgXAo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIj1yIiAocmV0X18pLCAiK0EiICgqcHRyX18pIFwKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJyIiAobmV3X18pIFwKPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiICk7IFwKPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgYnJlYWs7IFwKPiA+ID4gPiArwqDCoMKgIGRlZmF1bHQ6IFwKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IFwKPiA+ID4gPiArwqDCoMKgIH0gXAo+ID4gPiA+
ICvCoMKgwqAgcmV0X187IFwKPiA+ID4gPiArfSkKPiA+ID4gCj4gPiA+IElmIEknbSBub3QgbWlz
dGFrZW4gdGhpcyBkaWZmZXJzIGZyb20gX194Y2hnX3JlbGF4ZWQoKSBvbmx5IGluCj4gPiA+IHRo
ZQo+ID4gPiB1c2UKPiA+ID4gb2YgUklTQ1ZfQUNRVUlSRV9CQVJSSUVSLCBhbmQgLi4uCj4gPiA+
IAo+ID4gPiA+ICsjZGVmaW5lIHhjaGdfYWNxdWlyZShwdHIsIHgpIFwKPiA+ID4gPiArKHsgXAo+
ID4gPiA+ICvCoMKgwqAgX190eXBlb2ZfXygqKHB0cikpIHhfID0gKHgpOyBcCj4gPiA+ID4gK8Kg
wqDCoCAoX190eXBlb2ZfXygqKHB0cikpKSBfX3hjaGdfYWNxdWlyZSgocHRyKSwgeF8sCj4gPiA+
ID4gc2l6ZW9mKCoocHRyKSkpOyBcCj4gPiA+ID4gK30pCj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVm
aW5lIF9feGNoZ19yZWxlYXNlKHB0ciwgbmV3LCBzaXplKSBcCj4gPiA+ID4gKyh7IFwKPiA+ID4g
PiArwqDCoMKgIF9fdHlwZW9mX18ocHRyKSBwdHJfXyA9IChwdHIpOyBcCj4gPiA+ID4gK8KgwqDC
oCBfX3R5cGVvZl9fKG5ldykgbmV3X18gPSAobmV3KTsgXAo+ID4gPiA+ICvCoMKgwqAgX190eXBl
b2ZfXygqKHB0cikpIHJldF9fOyBcCj4gPiA+ID4gK8KgwqDCoCBzd2l0Y2ggKHNpemUpIFwKPiA+
ID4gPiArCXsgXAo+ID4gPiA+ICvCoMKgwqAgY2FzZSA0OiBcCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgIGFzbSB2b2xhdGlsZSAoIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVND
Vl9SRUxFQVNFX0JBUlJJRVIgXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIJYW1v
c3dhcC53ICUwLCAlMiwgJTFcbiIgXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDog
Ij1yIiAocmV0X18pLCAiK0EiICgqcHRyX18pIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA6ICJyIiAobmV3X18pIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJt
ZW1vcnkiKTsgXAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsgXAo+ID4gPiA+ICvCoMKg
wqAgY2FzZSA4OiBcCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIGFzbSB2b2xhdGlsZSAoIFwKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9SRUxFQVNFX0JBUlJJRVIgXAo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIJYW1vc3dhcC5kICUwLCAlMiwgJTFcbiIgXAo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIj1yIiAocmV0X18pLCAiK0EiICgqcHRy
X18pIFwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJyIiAobmV3X18pIFwKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiKTsgXAo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoCBicmVhazsgXAo+ID4gPiA+ICvCoMKgwqAgZGVmYXVsdDogXAo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgXAo+ID4gPiA+ICvCoMKgwqAgfSBc
Cj4gPiA+ID4gK8KgwqDCoCByZXRfXzsgXAo+ID4gPiA+ICt9KQo+ID4gPiAKPiA+ID4gdGhpcyBv
bmx5IGluIHRoZSB1c2Ugb2YgUklTQ1ZfUkVMRUFTRV9CQVJSSUVSLiBJZiBzbyB0aGV5IGxpa2Vs
eQo+ID4gPiB3YW50Cj4gPiA+IGZvbGRpbmcsIHRvIGxpbWl0IHJlZHVuZGFuY3kgYW5kIG1ha2Ug
ZXZlbnR1YWwgdXBkYXRpbmcgZWFzaWVyLgo+ID4gPiAoU2FtZQo+ID4gPiBmb3IgdGhlIGNtcHhj
aGcgaGVscGVyIGZ1cnRoZXIgZG93biwgYXMgaXQgc2VlbXMuKQo+ID4gQWxzbyB0aGUgZGlmZmVy
ZW5jZSBpcyBpbiB3aGVyZSB0byBwbGFjZSBiYXJyaWVyIGJlZm9yZSBvciBhZnRlcgo+ID4gYXRv
bWljCj4gPiBpbnN0cnVjdGlvbi4gSSBhbSBub3Qgc3VyZSB0aGF0IHdlIGNhbiBlYXNpbHkgZm9s
ZGVkIHRoaXMgbWFjcm9zLgo+IAo+IFRoZSBmb2xkZWQgbWFjcm8gd291bGQgaGF2ZSB0d28gYmFy
cmllciBwYXJhbWV0ZXJzIC0gb24gZm9yIGFjcXVpcmUsCj4gb25lCj4gZm9yIHJlbGVhc2UuClll
cywgaW4gc3VjaCBjYXNlIGl0IHdpbGwgd29yay4KClRoYW5rcy4KCn4gT2xla3NpaQo=


