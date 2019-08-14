Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151838DD67
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 20:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxyHO-0001UA-4r; Wed, 14 Aug 2019 18:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gz8t=WK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hxyHM-0001U5-63
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 18:45:48 +0000
X-Inumbo-ID: ba830ec8-bec3-11e9-8524-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba830ec8-bec3-11e9-8524-bc764e2007e4;
 Wed, 14 Aug 2019 18:45:47 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x18so95723ljh.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l4Fp/i5elkEIgvbzO725FwrpW1KWFOK0NX8DVGDKyO0=;
 b=hqMn752pfMXeSdqvPqQzuQdUlJjwsGj9GEnpUIim95slRKTyy/afEnl5kgasBXsWXj
 5+VxZzEqPW4jf+Mo2jIdnwGbotVtfXJieTSUGbq7L2u443u6gwgrkJajZTHgT0QFdRw5
 EOzSB7mw0pbMYUw9VsVPuQurfobNdy2BtdevhYGv+6IxCxeN68YvcA9eXwb2+HF1yNXi
 wqwCREkaKt6IomHCXlirvly7xP2GVL1LTdiVlnHPbstxrGIfy0V4IsUQJ+iZjdZblS4a
 ArIDLhrvcxaIOzFVTUtQAh+Y8Oax8Q8lnDaTB5CEsXCr3E/SQ5DUJ2aKXtS10wSOmxWS
 Gxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l4Fp/i5elkEIgvbzO725FwrpW1KWFOK0NX8DVGDKyO0=;
 b=bKaMgERBCuk1vsw36oK1+18bx24DdNH6dHpq1YwJ2yJ3iqxMx1LWDFo+pfHu+aVQAk
 osJ46QRNiFEiGGRMh2OpxqwiVXvD52hQVsexTt5/HlDvfjWtQRc6Y4frznNUfMa+0+7J
 V9Ca+9oBIY6dBhPk+YY38+39ma6Yw1fjF/pjmbVE3Lod761BEHVnO9myCaJVwVasLea8
 AlY/egr4vixvKUT0Lo8M/67SRrZSOYzst/o5zXVytgfYzH51/6dqZm588KEdIj7KSZnL
 nBpBYSIh+yRisyGGYN8kxpr0V9KPVeMyA5rDBRYJ8v4hkDL0cVm16TQPZVcaqEVxd4qO
 3C5Q==
X-Gm-Message-State: APjAAAXPBxGIR7swt1HTGHLQQ4G+aXp5qpR6es5opaoedyfUN9hjjs5X
 Hl75utvr2R0zO9JgKbQbt3E=
X-Google-Smtp-Source: APXvYqz3Z6qTWZLprIxy0WlmnY/M1swBskqNioeWfGIWiX6JhqVdOiy4wEDFaFhZeT+vqIvTwlOu8g==
X-Received: by 2002:a2e:534e:: with SMTP id t14mr619406ljd.218.1565808346301; 
 Wed, 14 Aug 2019 11:45:46 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x137sm57094lff.23.2019.08.14.11.45.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 11:45:45 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <42515b0f-f0a2-186c-c5ad-fed02040311d@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4cc0971e-1fb2-3410-628e-f2c669dd4161@gmail.com>
Date: Wed, 14 Aug 2019 21:45:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <42515b0f-f0a2-186c-c5ad-fed02040311d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE0LjA4LjE5IDIwOjM4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuLgoKCj4KPiBPbiAwMi8wOC8yMDE5IDE3OjM5LCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToKPj4gK3N0YXRpYyBpbnQgaXBtbXVfaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRv
bWFpbiAqZCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgaXBtbXVfdm1zYV94ZW5fZG9tYWluICp4
ZW5fZG9tYWluOwo+PiArCj4+ICvCoMKgwqAgeGVuX2RvbWFpbiA9IHh6YWxsb2Moc3RydWN0IGlw
bW11X3Ztc2FfeGVuX2RvbWFpbik7Cj4+ICvCoMKgwqAgaWYgKCAheGVuX2RvbWFpbiApCj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIHNwaW5fbG9ja19p
bml0KCZ4ZW5fZG9tYWluLT5sb2NrKTsKPj4gK8KgwqDCoCBJTklUX0xJU1RfSEVBRCgmeGVuX2Rv
bWFpbi0+Y2FjaGVfZG9tYWlucyk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogV2UgZG9u
J3QgY3JlYXRlIFJvb3QgSVBNTVUgZG9tYWluIGhlcmUsIGl0IHdpbGwgYmUgY3JlYXRlZCBvbiAK
Pj4gZGVtYW5kCj4+ICvCoMKgwqDCoCAqIG9ubHksIHdoZW4gYXR0YWNoaW5nIHRoZSBmaXJzdCBt
YXN0ZXIgZGV2aWNlIHRvIHRoaXMgWGVuIAo+PiBkb21haW4gaW4KPj4gK8KgwqDCoMKgICogaXBt
bXVfYXNzaWduX2RldmljZSgpLgo+PiArwqDCoMKgwqAgKiB4ZW5fZG9tYWluLT5yb290X2RvbWFp
biA9IE5VTEw7Cj4+ICvCoMKgwqAgKi8KPj4gKwo+PiArwqDCoMKgIGRvbV9pb21tdShkKS0+YXJj
aC5wcml2ID0geGVuX2RvbWFpbjsKPgo+IFdoaWxlIGxvb2tpbmcgYXQgb3RoZXIgcGFydCBvZiBY
ZW4gSSByZWFsaXplZCB5b3UgZG9uJ3Qgc2V0IAo+IElPTU1VX0ZFQVRfQ09IRVJFTlRfV0FMSy4g
RG9lcyBpdCBtZWFuIHRoZSBJT01NVSB3YWxrZXIgZG9lcyBub3QgCj4gc3VwcG9ydCBjb2hlcmVu
dCB3YWxrIChpLmUgc25vb3BpbmcgdGhlIGNhY2hlKT8KCipBRkFJSyosIG5vdCBzdXBwb3J0ZWQu
CgpMaW51eCBkcml2ZXIgcmVwb3J0cyBjb2hlcmVudF93YWxrIGlzIG5vdCBzdXBwb3J0ZWQgYXMg
d2VsbC4KCgo+Cj4KPiBOb3RlIHRoYXQgd2hlbiB0aGlzIGZlYXR1cmUgaXMgbm90IHNldCwgdGhl
IHAybSBjb2RlIHdpbGwgcmVxdWlyZSB0byAKPiBjbGVhbiBlYWNoIFAyTSBlbnRyeSB3aGVuIHVw
ZGF0ZWQuIFNvIGlmIHRoZSBJUE1NVSBzdXBwb3J0cyBjb2hlcmVudCAKPiB3YWxrLCBJIHdvdWxk
IHN0cm9uZ2x5IHN1Z2dlc3QgdG8gc2V0IHRoZSBmbGFnIDopLgoKV2hlbiBwbGF5aW5nIHdpdGgg
bm9uLXNoYXJlZCBJT01NVSBpbiBYZW4gKHR3byB5ZWFycyBhZ28pLCBJIG5vdGljZWQgCnRoYXQg
SSBoYWQgZm9yZ290dGVuIHRvIHVzZSBjbGVhbl9kY2FjaGUgYWZ0ZXIgdXBkYXRpbmcgYSBwYWdl
IHRhYmxlIAplbnRyeS4gSSBjb3VsZCBmYWNlIGZhdWx0cyB3aGVuCnNoYXR0ZXJpbmcgc3VwZXJw
YWdlcyBmb3IgZXhhbXBsZS4gT25jZSBJIGFkZGVkIGl0LCB0aGUgZmF1bHRzIHdlbnQgYXdheSAK
Y29tcGxldGVseS4KClNvLCBsZWF2ZSBJT01NVV9GRUFUX0NPSEVSRU5UX1dBTEsgaW4gZGlzYWJs
ZWQgc3RhdGUsIGJ1dCB3aWxsIGtlZXAgeW91ciAKc3VnZ2VzdGlvbiBpbiBtaW5kLgoKCj4KPiBD
aGVlcnMsCj4KLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
