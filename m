Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AE162E22
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 19:16:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j47NC-0007BA-SK; Tue, 18 Feb 2020 18:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nsmm=4G=redhat.com=pmathieu@srs-us1.protection.inumbo.net>)
 id 1j47NB-0007B5-Aj
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 18:13:29 +0000
X-Inumbo-ID: 5ccb4eda-527a-11ea-b0fd-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5ccb4eda-527a-11ea-b0fd-bc764e2007e4;
 Tue, 18 Feb 2020 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582049608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KpRWbNcSjJsHQ+gG/O63WZoHuP7pEag/tech2ayuVw=;
 b=fd22tX/uomLqRuRcshu02BsSFN3NJVsBMpC5YnQGxHmCAw+nZB6PQgUG3jsnCM9SoWFJcL
 NZeamsLcRmScg2Nf2J2cm+pu7PUVatTls4fEkNWMnc6Z7PM9/FUG7VTTNrdp34LTlIqD/j
 p+/snT5lYeJ96UE92sA44VouhPjVrJw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-RGuVzdnMNtuJ5FX7sJ6d9Q-1; Tue, 18 Feb 2020 13:13:26 -0500
Received: by mail-wm1-f72.google.com with SMTP id n17so433949wmk.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 10:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+KpRWbNcSjJsHQ+gG/O63WZoHuP7pEag/tech2ayuVw=;
 b=iQLx4vg7Gb5PXvqh30upXaZxl8DExAAr9WKclllAtqYqRfznlXRjRWnHvNE8IicPi5
 UPIB/ef1V7xFi1wIEo8qPnbQUDzeKkwWbxdnNokQmpauysHCKsdlY+smRzDYFnSEMqQR
 cFnPGBdLNroV3P1CPTYctajrABBiIDvWfmXGM4n0e0JYcBmK7OKxDjOnOLkOshG4Yr1P
 YTopvgL/1HwEuIITDqJZzK5QGZe1BRbzpQkiDm4GxI8kMVEdaqA0Gthvm1XBX6B6+um7
 aky6fnKDcY6CxqoZEjRdFGvzQj4RdoppcODIF3YjLkMbuhny9BTtl6Mi9Aybb1Xqy8e+
 3A9A==
X-Gm-Message-State: APjAAAVS/29CXJ+Hwr9MTwiWk7BLO020eYGgEszy9g5eK4YNs3Navk++
 PmL4HRP25/LCGL4y5JACQnXl+r3yO7622PqrJznykJHG9T2+cGpqpR1aV8byQBdIpRQIrJpc0Iq
 LDLz8Nq/rKmROg6wyHRrvZnrgGKL8OobdqqxakOw9AhE=
X-Received: by 2002:a1c:541b:: with SMTP id i27mr4702153wmb.137.1582049605326; 
 Tue, 18 Feb 2020 10:13:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7UNU7x6QZKyAdaoMwxwEJaiZzjnldKkbWzDhA7+BBrbcanJCw4Sp6UuGtCDt76Uz1938/Qi8gyjAcqv89CYo=
X-Received: by 2002:a1c:541b:: with SMTP id i27mr4702139wmb.137.1582049605155; 
 Tue, 18 Feb 2020 10:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
In-Reply-To: <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 18 Feb 2020 19:13:14 +0100
Message-ID: <CAP+75-W5kdPAz0HZqz+XxRg3RfkosFG4ptcu3o_jYBE26ZhkQw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
X-MC-Unique: RGuVzdnMNtuJ5FX7sJ6d9Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgNjo1NyBQTSBTdGVmYW4gV2VpbCA8c3dAd2VpbG5ldHou
ZGU+IHdyb3RlOgo+IEFtIDE4LjAyLjIwIHVtIDE0OjIwIHNjaHJpZWIgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6k6Cj4KPiA+IFRoaXMgY29tbWl0IHdhcyBwcm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRl
ZCBDb2NjaW5lbGxlIHNjcmlwdAo+ID4gc2NyaXB0cy9jb2NjaW5lbGxlL2FzLXJ3LWNvbnN0LnBh
dGNoLgo+ID4KPiA+IEluc3BpcmVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IEJhc2VkLW9uOiA8MjAyMDAyMTgxMTI0NTcuMjI3
MTItMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS90
YXJnZXQvaTM4Ni9oYXgtYWxsLmMgYi90YXJnZXQvaTM4Ni9oYXgtYWxsLmMKPiA+IGluZGV4IGE4
YjZlNWFlYjguLmY1OTcxY2NjNzQgMTAwNjQ0Cj4gPiAtLS0gYS90YXJnZXQvaTM4Ni9oYXgtYWxs
LmMKPiA+ICsrKyBiL3RhcmdldC9pMzg2L2hheC1hbGwuYwo+ID4gQEAgLTM3Niw4ICszNzYsOCBA
QCBzdGF0aWMgaW50IGhheF9oYW5kbGVfZmFzdG1taW8oQ1BVQXJjaFN0YXRlICplbnYsIHN0cnVj
dCBoYXhfZmFzdG1taW8gKmhmdCkKPiA+ICAgICAgICAgICAqICBoZnQtPmRpcmVjdGlvbiA9PSAy
OiBncGEgPT0+IGdwYTIKPiA+ICAgICAgICAgICAqLwo+ID4gICAgICAgICAgdWludDY0X3QgdmFs
dWU7Cj4gPiAtICAgICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGhmdC0+Z3BhLCAodWludDhf
dCAqKSAmdmFsdWUsIGhmdC0+c2l6ZSwgMCk7Cj4gPiAtICAgICAgICBjcHVfcGh5c2ljYWxfbWVt
b3J5X3J3KGhmdC0+Z3BhMiwgKHVpbnQ4X3QgKikgJnZhbHVlLCBoZnQtPnNpemUsIDEpOwo+ID4g
KyAgICAgICAgY3B1X3BoeXNpY2FsX21lbW9yeV9yZWFkKGhmdC0+Z3BhLCAodWludDhfdCAqKSZ2
YWx1ZSwgaGZ0LT5zaXplKTsKPiA+ICsgICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfd3JpdGUo
aGZ0LT5ncGEyLCAodWludDhfdCAqKSZ2YWx1ZSwgaGZ0LT5zaXplKTsKPgo+Cj4gTWF5YmUgdGhv
c2UgdHlwZSBjYXN0cyBjb3VsZCBiZSByZW1vdmVkLCB0b28uIFRoZXkgYXJlIG5vIGxvbmdlciBu
ZWVkZWQKPiBhZnRlciB5b3VyIG1vZGlmaWNhdGlvbi4KCkdvb2QgY2F0Y2gsIHRoYW5rcyBTdGVm
YW4hCgo+Cj4gU3RlZmFuCj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
