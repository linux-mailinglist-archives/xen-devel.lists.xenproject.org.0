Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE000179A94
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 22:02:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9b4o-0007Ig-9s; Wed, 04 Mar 2020 20:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VlIb=4V=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1j9b4m-0007Ib-TI
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 20:57:08 +0000
X-Inumbo-ID: b4e7933a-5e5a-11ea-90c4-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4e7933a-5e5a-11ea-90c4-bc764e2007e4;
 Wed, 04 Mar 2020 20:57:06 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id i1so3567953oie.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NeXW7YNWKtPM2qhkPxW/kiKtKjk7UpmXN4m91WTJNCM=;
 b=Jrd8sZi8FK4jANBFdzU+UpRWAbAAy7EQjaFH7cCT7k1bLXlDXEqYwWTvoy3XqwXx9N
 oje8H4L7MQFhh/bZTgymvv2Pm37WnJid2buYJA06o01S3aAmAE8SEIX9iecggKE4D5CE
 61KhXhqzn6oIfP2TyxecT/+zPVW/hkGof5elxwtp5/Z+NXZpjf7XRFXWQl6Mu6GIZoOt
 3f4+ZqUK0FE9Egdunl86lWrAB4VPqJuYmuCSW0UKbBKN4yNFCOOzR4iO+QBmSS1MIDz0
 6PS4VpG3X07nTssv+skbDbHfMb1PQmdi4QqJ5NUXJoDp2a2BbU134cApL9tz3ODL8TiU
 FUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeXW7YNWKtPM2qhkPxW/kiKtKjk7UpmXN4m91WTJNCM=;
 b=ol6CeCWeZn0iujbWU2IL0KgL6doHXRUlnPVQiS2eJ85FFjlz/2ZHY3JMx0qOqSetVM
 kShSaw337kq/gt/lit5QIab0QYypsH9QKOZLgn5kGo7uiuES1X9rw17PKprmMHEq64nw
 yam+zk4S4P1O7nN07d3P+B7wkMqEq2WUjqC44dtzM45UCGLpuIuWFkYj58oS/44GpPkI
 R0pLiV67UmYZmKTZR2jZuD+2Pfm6pe+cr6jRjXZa0ayFxS6EAofbkkcmVlOUq4ULPN3y
 mzKMNSOg8cS3ZU7tqnbEm323jK++7FBbluJ80Kpo/Ww26ESNBco2QpCaSatrmpIqKBCm
 J0hw==
X-Gm-Message-State: ANhLgQ0HugBFZNcb4c260Avle0+yjxSOtdSp6Bpx4LujkAeAuc2MhXES
 YRCTycYuyv7KXxs50J9wWGqUNZEUyyo3nOsS13UNWw==
X-Google-Smtp-Source: ADFU+vtFbEv31ANDFs0/4N9Z/l6H9sqYzjPTVswiZTAKAsgysts9zHxyIRsH1as4Wq2QvfA+x1ko0P0794u+WWSSnqw=
X-Received: by 2002:aca:ed58:: with SMTP id l85mr1490175oih.70.1583355426008; 
 Wed, 04 Mar 2020 12:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20200223165724.23816-1-mcroce@redhat.com>
In-Reply-To: <20200223165724.23816-1-mcroce@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 4 Mar 2020 12:56:54 -0800
Message-ID: <CAPcyv4ijKqVhHixsp42kZL4p7uReJ67p3XoPyw5ojM-ZsOOUOg@mail.gmail.com>
To: Matteo Croce <mcroce@redhat.com>
Subject: Re: [Xen-devel] [PATCH] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
 linux-nfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBGZWIgMjMsIDIwMjAgYXQgOTowNCBBTSBNYXR0ZW8gQ3JvY2UgPG1jcm9jZUByZWRo
YXQuY29tPiB3cm90ZToKPgo+IFRoZSBtYWNyb3MgUEFHRV9TRUNUT1JTLCBQQUdFX1NFQ1RPUlNf
U0hJRlQgYW5kIFNFQ1RPUl9NQVNLIGFyZSBkZWZpbmVkCj4gc2V2ZXJhbCB0aW1lcyBpbiBkaWZm
ZXJlbnQgZmxhdm91cnMgYWNyb3NzIHRoZSB3aG9sZSB0cmVlLgo+IERlZmluZSB0aGVtIGp1c3Qg
b25jZSBpbiBhIGNvbW1vbiBoZWFkZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0ZW8gQ3JvY2Ug
PG1jcm9jZUByZWRoYXQuY29tPgo+IC0tLQo+ICBibG9jay9ibGstbGliLmMgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2svYnJkLmMgICAgICAgICAgICAgIHwgIDMgLS0t
Cj4gIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFpbi5jICAgIHwgIDQgLS0tLQo+ICBkcml2ZXJz
L2Jsb2NrL3pyYW0venJhbV9kcnYuYyAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvYmxvY2sv
enJhbS96cmFtX2Rydi5oICAgIHwgIDIgLS0KPiAgZHJpdmVycy9kYXgvc3VwZXIuYyAgICAgICAg
ICAgICAgfCAgMiArLQoKRm9yIHRoZSBkYXggY2hhbmdlOgoKQWNrZWQtYnk6IERhbiBXaWxsaWFt
cyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgoKSG93ZXZlci4uLgoKWy4uXQo+ICBpbmNsdWRl
L2xpbnV4L2Jsa2Rldi5oICAgICAgICAgICB8ICA0ICsrKysKWy4uXQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2Jsa2Rldi5oIGIvaW5jbHVkZS9saW51eC9ibGtkZXYuaAo+IGluZGV4IDA1
M2VhNGI1MTk4OC4uYjNjOWJlNjkwNmEwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvYmxr
ZGV2LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCj4gQEAgLTkxMCw2ICs5MTAsMTAg
QEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqYmRldl9nZXRfcXVldWUoc3Ry
dWN0IGJsb2NrX2RldmljZSAqYmRldikKPiAgI2RlZmluZSBTRUNUT1JfU0laRSAoMSA8PCBTRUNU
T1JfU0hJRlQpCj4gICNlbmRpZgo+Cj4gKyNkZWZpbmUgUEFHRV9TRUNUT1JTX1NISUZUICAgICAo
UEFHRV9TSElGVCAtIFNFQ1RPUl9TSElGVCkKPiArI2RlZmluZSBQQUdFX1NFQ1RPUlMgICAgICAg
ICAgICgxIDw8IFBBR0VfU0VDVE9SU19TSElGVCkKPiArI2RlZmluZSBTRUNUT1JfTUFTSyAgICAg
ICAgICAgIChQQUdFX1NFQ1RPUlMgLSAxKQo+ICsKCi4uLkkgdGhpbmsgU0VDVE9SX01BU0sgaXMg
bWlzbmFtZWQgZ2l2ZW4gaXQgY29uc2lkZXJzIHBhZ2VzLCBhbmQKc2hvdWxkIHByb2JhYmx5IG1h
dGNoIHRoZSBwb2xhcml0eSBvZiBQQUdFX01BU0ssIGkuZS4KCiNkZWZpbmUgUEFHRV9TRUNUT1JT
X01BU0sgICAgICAgICAgICAofihQQUdFX1NFQ1RPUlMgLSAxKSkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
