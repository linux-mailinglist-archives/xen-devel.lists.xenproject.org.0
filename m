Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1040168027
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:26:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59DM-0000O0-LV; Fri, 21 Feb 2020 14:23:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhbZ=4J=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j59DL-0000Nr-C6
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:23:35 +0000
X-Inumbo-ID: be213e0a-54b5-11ea-ade5-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be213e0a-54b5-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 14:23:34 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p3so2533938edx.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4m+Hl/axc0/E8JI7FGYVzwc95kvNcytjCyze/fx+A1Q=;
 b=w7aaH2H5C9Z55CZjSPLg9SoHFXgB1jW6CfZiuFqQHPQ55DNeYIg4pPOl8RKcP6f1kX
 BdUG557bDbuRgsMY2/JQd8406PctnPvErGCj1UVQUXB4MG61kXRP+6ACzDXGCBfzcyy8
 ZOGrcSN86gw1yKM+o3xWkG5F96Vq3bKJ0wGboRolliDSSb8GZH//ekBiO1K0ZbcacVna
 nV5XuvgrHvn1pgL23yrmBdI4UtHPFUvOg5tyuwr/V4dIGNTrCWLxweQW+iWjB1FHZ9q0
 0dLFzGJ9BQmtCNUQIgBQu5D+cNu6g+bwJdcMBzysDjWXxvIipfiER7t4MtB1X0xoDCi+
 4kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4m+Hl/axc0/E8JI7FGYVzwc95kvNcytjCyze/fx+A1Q=;
 b=oFEkkoL1m4tcNX0Hc0A/D6GP0znuIZnTONqzFkNClgHY/YaCgI7dYIi5dFMk1Yh9ip
 +pr5k7+sXAao1eA5opbPsSkazpqS8VIJwcizqcOv267aAsoKggxmhzlSGXdmBLa6+QpT
 isVmhaDOyVk6520zksud2b9z0Ksak7aNhX2cVuJpaFAK0BTY4Ta/DuQNhb2+l6mgEv7g
 D+GrVmUC0shv0cUjVkyXBtupmTr1eyohMsmHjynR8lzljl7sUV3OdgOlNyCFDWCh7Bma
 unLyEMEYPSr699y2EiGWaBZSUQ70+jK5qt+ZlDMAWimJz8viL1SlgfaAsCJs7H9yReGd
 l1Ug==
X-Gm-Message-State: APjAAAXYHKJGWNlXsgQa8xwffEfMl7RJtCGxAvgESe/Hs0ZpJCSyoO3p
 HdOxT9h02FFniOKVciFCOfnYzjCrdyQ=
X-Google-Smtp-Source: APXvYqxvJSgW0kcNLg9AoRWzX8X34agXj6mbbdSdeMc+yikTDlLbD2siPCaNh2GbdwjM+daBs6SlIA==
X-Received: by 2002:aa7:da18:: with SMTP id r24mr33551905eds.111.1582295013457; 
 Fri, 21 Feb 2020 06:23:33 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id w3sm330905edt.80.2020.02.21.06.23.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:23:31 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id a5so1990888wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:23:30 -0800 (PST)
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr4228549wmm.77.1582295010286; 
 Fri, 21 Feb 2020 06:23:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
 <02eb07b3-fd4f-09f7-335c-c2fb48811931@citrix.com>
 <2e8d6c12-d839-6662-6dd8-b6976527c252@citrix.com>
In-Reply-To: <2e8d6c12-d839-6662-6dd8-b6976527c252@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 21 Feb 2020 07:22:53 -0700
X-Gmail-Original-Message-ID: <CABfawhkwm4Nh6zrb9dmUPizaxMJG7ccsg3Mb8QdOdObGkJ-Hqg@mail.gmail.com>
Message-ID: <CABfawhkwm4Nh6zrb9dmUPizaxMJG7ccsg3Mb8QdOdObGkJ-Hqg@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgNzowMiBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIxLzAyLzIwMjAgMTM6NDMsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4gPiBPbiAxMC8wMi8yMDIwIDE5OjIxLCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+PiBpbmRleCAzODM1YmM5MjhmLi5jY2YzMzg5
MThkIDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gPj4g
KysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+PiBAQCAtMzYsNiArMzcsOSBA
QAo+ID4+ICAjaW5jbHVkZSA8YXNtL2FsdHAybS5oPgo+ID4+ICAjaW5jbHVkZSA8YXNtL2F0b21p
Yy5oPgo+ID4+ICAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+Cj4gPj4gKyNpbmNsdWRlIDxhc20vaGFw
Lmg+Cj4gPj4gKyNpbmNsdWRlIDxhc20vaHZtL2h2bS5oPgo+ID4+ICsjaW5jbHVkZSA8YXNtL2h2
bS9zYXZlLmg+Cj4gPiBUaGlzIGluY2x1ZGUgaXMgc3RhbGUsIEkgdGhpbmsuCj4gPgo+ID4+ICtz
dGF0aWMgdm9pZCBmb3JrX3RzYyhzdHJ1Y3QgZG9tYWluICpjZCwgc3RydWN0IGRvbWFpbiAqZCkK
PiA+PiArewo+ID4+ICsgICAgdWludDMyX3QgdHNjX21vZGU7Cj4gPj4gKyAgICB1aW50MzJfdCBn
dHNjX2toejsKPiA+PiArICAgIHVpbnQzMl90IGluY2FybmF0aW9uOwo+ID4+ICsgICAgdWludDY0
X3QgZWxhcHNlZF9uc2VjOwo+ID4+ICsKPiA+PiArICAgIHRzY19nZXRfaW5mbyhkLCAmdHNjX21v
ZGUsICZlbGFwc2VkX25zZWMsICZndHNjX2toeiwgJmluY2FybmF0aW9uKTsKPiA+PiArICAgIHRz
Y19zZXRfaW5mbyhjZCwgdHNjX21vZGUsIGVsYXBzZWRfbnNlYywgZ3RzY19raHosIGluY2FybmF0
aW9uKTsKPiA+IFNhZGx5LCBnZXQgYW5kIHNldCBhcmUgYXN5bWV0cmljLiAgRm9yIHJlYXNvbnMg
YmVzdCB1bmRlcnN0b29kIGJ5IHRoZQo+ID4gb3JpZ2luYWwgYXV0aG9ycywgaW5jYXJuYXRpb24g
Z2V0cyBhdXRvbWF0aWNhbGx5IGluY3JlbWVudGVkIG9uIHNldCwKPiA+IHJhdGhlciB0aGFuIGhh
cHBpbmcgYXMgcGFydCBvZiBtaWdyYXRpb24gd2hlcmUgaXQgbG9naWNhbGx5IGxpdmVzLgo+ID4K
PiA+IEFzIGEgcmVzdWx0LCB5b3UgcHJvYmFibHkgd2FudCB0byBzZXQgaW5jYXJuYXRpb24gLSAx
LCBhbmQgbGVhdmUgYQo+ID4gY29tbWVudCBzYXlpbmcgIkRvbid0IGJ1bXAgdGhlIGluY2FybmF0
aW9uIiBvciBzaW1pbGFyLgo+Cj4gUC5TLiBDYW4gYm90aCBiZSBmaXhlZCBvbiBjb21taXQgaWYg
eW91IGFncmVlLiAgU2VlbXMgcG9pbnRsZXNzIHNlbmRpbmcKPiBhIHY5IGp1c3QgZm9yIHRoZXNl
IHR3by4KCkdyZWF0LCBJIGhhdmUgbm8gaXNzdWUgd2l0aCB0aGVzZSBjaGFuZ2VzLgoKVGhhbmtz
IQpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
