Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00041E01B3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 12:11:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMr6B-0003uO-TD; Tue, 22 Oct 2019 10:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ikW=YP=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iMr6B-0003uI-0X
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 10:09:07 +0000
X-Inumbo-ID: fb3aa6e4-f4b3-11e9-9464-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb3aa6e4-f4b3-11e9-9464-12813bfff9fa;
 Tue, 22 Oct 2019 10:09:06 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD2A5C04B940
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 10:09:05 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id z5so4190406wma.5
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 03:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cDIcC71X2j9LYsUN5sPmNj6EXJxvGKxWzrnLFwfa96M=;
 b=fpmAJL8cxy7w3SwjHfoBg6MVFB1NGLxx5U/CNL8Rsgeuwsqb/iqbIBTxD/SeLjnvoR
 pa7XXFwg2Jw151B6DjYV/nk9vsmt62CiB1OFU9gHSNSyrBQE+nJ+WlSmjUxza7c9kw9k
 dRjsaYXU6MsM/G26HhTK9w2FnBTNhSMqx6mjYqKdoQ7zQnWpvpRPQVnNEMGnoYy5uxdS
 14p905eWOntiLOk4+O/Y0/LnPu3RzkLYX2uXCywO+TA0OQGUIK2DvY8aPrLsKQRzSQ2m
 B1hOZmuKhpQxeGbcsfhLQI3kEsb8nx8bracOW/79Tu7BN3MMFdX94L6Mt+1izI5v+H+D
 QRzw==
X-Gm-Message-State: APjAAAUhFMWqRE2tfExNS2lwEHSzLtmgxNwE23zT8KCWW3ZaTj9YsNak
 xoxifjChtRfDcg7d3qMN52BiHiMkHLL4rI/oDzIMCz6WiJfId2T7lNSX5KcCmB4wi1yoHEsXl01
 +3J8jXXGnjxjejySz9tfSwCChu3A=
X-Received: by 2002:adf:b219:: with SMTP id u25mr2579497wra.327.1571738944582; 
 Tue, 22 Oct 2019 03:09:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwi5wHiKhxAtgMDwyR2/pEx6MJWzdYADcmQ7oliJoFdviyyJI7d3qbM+MbGjcSKc0iW3nsRYg==
X-Received: by 2002:adf:b219:: with SMTP id u25mr2579475wra.327.1571738944403; 
 Tue, 22 Oct 2019 03:09:04 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id f7sm10525268wre.68.2019.10.22.03.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2019 03:09:03 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-4-philmd@redhat.com>
 <CAL1e-=hOQqRj2_QA8LqWdsD9JM6t6YzoyxC1cEaMBhs1vmN8oA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6aee537-f433-a350-1679-fcb402cabccd@redhat.com>
Date: Tue, 22 Oct 2019 12:09:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hOQqRj2_QA8LqWdsD9JM6t6YzoyxC1cEaMBhs1vmN8oA@mail.gmail.com>
Content-Language: en-US
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjIvMTkgMTE6NTMgQU0sIEFsZWtzYW5kYXIgTWFya292aWMgd3JvdGU6Cj4gCj4gCj4g
T24gRnJpZGF5LCBPY3RvYmVyIDE4LCAyMDE5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20gCj4gPG1haWx0bzpwaGlsbWRAcmVkaGF0LmNvbT4+IHdyb3RlOgo+IAo+
ICAgICBGcm9tOiBIZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmcKPiAgICAg
PG1haWx0bzpocG91c3NpbkByZWFjdG9zLm9yZz4+Cj4gCj4gICAgIEFkZCBJU0EgaXJxcyBhcyBw
aWl4NCBncGlvIGluLCBhbmQgQ1BVIGludGVycnVwdCByZXF1ZXN0IGFzIHBpaXg0Cj4gICAgIGdw
aW8gb3V0Lgo+ICAgICBSZW1vdmUgaTgyNTkgaW5zdGFuY2lhdGVkIGluIG1hbHRhIGJvYXJkLCB0
byBub3QgaGF2ZSBpdCB0d2ljZS4KPiAKPiAgICAgV2UgY2FuIGFsc28gcmVtb3ZlIHRoZSBub3cg
dW51c2VkIHBpaXg0X2luaXQoKSBmdW5jdGlvbi4KPiAKPiAgICAgQWNrZWQtYnk6IE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20gPG1haWx0bzptc3RAcmVkaGF0LmNvbT4+Cj4gICAg
IEFja2VkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tCj4gICAgIDxtYWls
dG86cGJvbnppbmlAcmVkaGF0LmNvbT4+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQb3Vz
c2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZwo+ICAgICA8bWFpbHRvOmhwb3Vzc2luQHJlYWN0
b3Mub3JnPj4KPiAgICAgTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkwMjI4LjI4NTA1LTgtaHBvdXNz
aW5AcmVhY3Rvcy5vcmcKPiAgICAgPG1haWx0bzoyMDE3MTIxNjA5MDIyOC4yODUwNS04LWhwb3Vz
c2luQHJlYWN0b3Mub3JnPj4KPiAgICAgUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMg
PGFtYXJrb3ZpY0B3YXZlY29tcC5jb20KPiAgICAgPG1haWx0bzphbWFya292aWNAd2F2ZWNvbXAu
Y29tPj4KPiAgICAgW1BNRDogcmViYXNlZCwgdXBkYXRlZCBpbmNsdWRlcywgdXNlIElTQV9OVU1f
SVJRUyBpbiBmb3IgbG9vcF0KPiAgICAgU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEByZWRoYXQuY29tCj4gICAgIDxtYWlsdG86cGhpbG1kQHJlZGhhdC5jb20+
Pgo+ICAgICAtLS0KPiAgICAgIMKgaHcvaXNhL3BpaXg0LmPCoCDCoCDCoCDCoHwgNDMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAgICAgwqBody9taXBzL21p
cHNfbWFsdGEuYyB8IDMyICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgICDC
oGluY2x1ZGUvaHcvaTM4Ni9wYy5oIHzCoCAxIC0KPiAgICAgIMKgMyBmaWxlcyBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKPiAKPiAKPiAKPiBBIGRldGFpbDogSW4g
dGhlIHRpdGxlOgo+IEFkZCBhIGk4MjU5wqAgLT4gQWRkIGFuIGk4MjU5CgpPSy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
