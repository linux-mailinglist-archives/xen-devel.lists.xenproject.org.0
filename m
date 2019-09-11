Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1ABAFA84
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:35:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zw3-0000UL-Hx; Wed, 11 Sep 2019 10:33:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zw1-0000T0-AK
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:33:13 +0000
X-Inumbo-ID: 7b29eefa-d47f-11e9-b76c-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b29eefa-d47f-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so19132831ljn.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nTxSIglmusaJTq+slsHa0UgJ/0RrGOlxtblHgFLIsZ4=;
 b=uj8hwhqHEt/YuJweovSp6KjRqgNBJw149U13EqsUdElkHyDRWKs2ERrR5JC3TyROTE
 pETd614g2kxfVzS2TX2Vf6MtN+l7zm0DRFgilUicOfsCz4rR5uOVstSqCdZqkcqgfIsr
 QoiOZHxg6Tr/hdRRqvateyzO2vF39//gz/tdd2nUu62ZQWMdgYCdE5sUjC8mT8LTCj8P
 aQ3KPkkHQtWLiV6FUWAQD6ChOFGbQTVQxtNfR64FPVy9vYc+HdGOo3JkWyTLh75FnQmD
 yWh1aIKOG97JEiYgnavoWAG9ZG6loIVH1mV2J2fN/7uBUD3GjHSy7aI5MtDMiy5DW9vC
 gYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nTxSIglmusaJTq+slsHa0UgJ/0RrGOlxtblHgFLIsZ4=;
 b=WdheIRjDD0cjz2fiJxKthDRXZsrwfd+lH2TuLJmmejaOsAsiQdGY0iyFO7zJrn0AEK
 StmnRtXNqPNXrwI8xIvFbvK76R2HUpOvHOyRnH2sLX3TiK7jR/sgFuCKswb1EYCxZWGg
 dxeMCHmFcMVZru+mhM/1JoGY+SJZYdTK6YlXfj8IjILTy54i+azrxvSc7NOo7DedLEvI
 RMfpSURHo+Fq1wcwZFI+/PfqSAV1MVPe+SDdEHjwZ5e2f/04FGpA8vJYl4qbeGs5byiC
 mGfDcTbQyMi1LUM6CoQVRwRWsIEUx8TAoyGrzbtuyXXg+s58wRSeGekdeHh0MF2hQLLv
 1Xug==
X-Gm-Message-State: APjAAAUWnbSHnfvHo/izFNwB60MDU88vRGLJ/OaaZdlxxI7KxkboLKRW
 w4r/BiU7JvlA9OXt02sLa8gXxTYJKYQ=
X-Google-Smtp-Source: APXvYqw7Zpe3MGMlHtgBgNuE9VQf7Mufhx7GHZJO8jeINlKDc+9rZNrgrh9XUoy2yHDqq24BiZzGIA==
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr23164351ljk.39.1568197959507; 
 Wed, 11 Sep 2019 03:32:39 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:38 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:22 +0300
Message-Id: <1568197942-15374-10-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 9/9] sched:credit2: get guest time from time
 accounting code
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCldoaWxlIHRoZSBD
cmVkaXQyIHNjaGVkdWxlciBjb2RlIHVzZXMgZ3Vlc3QgdGltZSBmcm9tIHRoZQpvdGhlciBwY3B1
LCB3ZSBoYXZlIHRvIHVzZSBsb2NrZWQgdGltZSBhY2NvdW50aW5nLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vY29tbW9uL0tj
b25maWcgICAgICAgICB8ICAxICsKIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgMTcgKysr
KysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tj
b25maWcKaW5kZXggZDE3YThiNC4uNjQwOGMxOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29u
ZmlnCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZwpAQCAtMjM0LDYgKzIzNCw3IEBAIGNvbmZpZyBT
Q0hFRF9DUkVESVQKIGNvbmZpZyBTQ0hFRF9DUkVESVQyCiAJYm9vbCAiQ3JlZGl0MiBzY2hlZHVs
ZXIgc3VwcG9ydCIKIAlkZWZhdWx0IHkKKwlzZWxlY3QgVEFDQ19ORUVEU19MT0NLCiAJLS0taGVs
cC0tLQogCSAgVGhlIGNyZWRpdDIgc2NoZWR1bGVyIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIHNjaGVk
dWxlciB0aGF0IGlzCiAJICBvcHRpbWl6ZWQgZm9yIGxvd2VyIGxhdGVuY3kgYW5kIGhpZ2hlciBW
TSBkZW5zaXR5LgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4v
Y29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRleCA2Yjc3ZGE3Li4zYjM4ODhiIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dDIuYwpAQCAtMTM0Miw3ICsxMzQyLDcgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3ByZWVtcHRh
YmxlKGNvbnN0IHN0cnVjdCBjc2NoZWQyX3ZjcHUgKnN2YywKICAgICAgICAgcmV0dXJuIHRydWU7
CiAKICAgICBBU1NFUlQoc3ZjLT52Y3B1LT5pc19ydW5uaW5nKTsKLSAgICByZXR1cm4gbm93IC0g
c3ZjLT52Y3B1LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lID4KKyAgICByZXR1cm4gdGFjY19n
ZXRfZ3Vlc3RfdGltZV9kZWx0YV92Y3B1KHN2Yy0+dmNwdSk+CiAgICAgICAgICAgIHJhdGVsaW1p
dCAtIENTQ0hFRDJfUkFURUxJTUlUX1RJQ0tMRV9UT0xFUkFOQ0U7CiB9CiAKQEAgLTE3MjIsNyAr
MTcyMiw3IEBAIHZvaWQgYnVybl9jcmVkaXRzKHN0cnVjdCBjc2NoZWQyX3J1bnF1ZXVlX2RhdGEg
KnJxZCwKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIGRlbHRhID0gbm93IC0gc3ZjLT5z
dGFydF90aW1lOworICAgIGRlbHRhID0gdGFjY19nZXRfZ3Vlc3RfdGltZV9kZWx0YV92Y3B1KHN2
Yy0+dmNwdSk7CiAKICAgICBpZiAoIHVubGlrZWx5KGRlbHRhIDw9IDApICkKICAgICB7CkBAIC0x
NzM5LDcgKzE3MzksNyBAQCB2b2lkIGJ1cm5fY3JlZGl0cyhzdHJ1Y3QgY3NjaGVkMl9ydW5xdWV1
ZV9kYXRhICpycWQsCiAgICAgaWYgKCBoYXNfY2FwKHN2YykgKQogICAgICAgICBzdmMtPmJ1ZGdl
dCAtPSBkZWx0YTsKIAotICAgIHN2Yy0+c3RhcnRfdGltZSA9IG5vdzsKKyAgICBzdmMtPnZjcHUt
PnBjcHVfZ3Vlc3RfdGltZSArPSBkZWx0YTsKIAogIG91dDoKICAgICBpZiAoIHVubGlrZWx5KHRi
X2luaXRfZG9uZSkgKQpAQCAtMzE4OSw4ICszMTg5LDggQEAgY3NjaGVkMl9ydW50aW1lKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgaW50IGNwdSwKICAgICB7CiAgICAgICAgIHNfdGltZV90
IHJhdGVsaW1pdF9taW4gPSBNSUNST1NFQ1MocHJ2LT5yYXRlbGltaXRfdXMpOwogICAgICAgICBp
ZiAoIHNuZXh0LT52Y3B1LT5pc19ydW5uaW5nICkKLSAgICAgICAgICAgIHJhdGVsaW1pdF9taW4g
PSBzbmV4dC0+dmNwdS0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSArCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTUlDUk9TRUNTKHBydi0+cmF0ZWxpbWl0X3VzKSAtIG5vdzsKKyAgICAg
ICAgICAgIHJhdGVsaW1pdF9taW4gPSB0YWNjX2dldF9ndWVzdF90aW1lX2RlbHRhX3ZjcHUoc25l
eHQtPnZjcHUpICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBNSUNST1NFQ1MocHJ2LT5y
YXRlbGltaXRfdXMpOwogICAgICAgICBpZiAoIHJhdGVsaW1pdF9taW4gPiBtaW5fdGltZSApCiAg
ICAgICAgICAgICBtaW5fdGltZSA9IHJhdGVsaW1pdF9taW47CiAgICAgfQpAQCAtMzI2NSw2ICsz
MjY1LDcgQEAgcnVucV9jYW5kaWRhdGUoc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0YSAqcnFk
LAogICAgIHN0cnVjdCBjc2NoZWQyX3ZjcHUgKnNuZXh0ID0gTlVMTDsKICAgICBzdHJ1Y3QgY3Nj
aGVkMl9wcml2YXRlICpwcnYgPSBjc2NoZWQyX3ByaXYocGVyX2NwdShzY2hlZHVsZXIsIGNwdSkp
OwogICAgIGJvb2wgeWllbGQgPSBmYWxzZSwgc29mdF9hZmZfcHJlZW1wdCA9IGZhbHNlOworICAg
IHNfdGltZV90IGd1ZXN0X3RpbWU7CiAKICAgICAqc2tpcHBlZCA9IDA7CiAKQEAgLTMyODYsOCAr
MzI4Nyw4IEBAIHJ1bnFfY2FuZGlkYXRlKHN0cnVjdCBjc2NoZWQyX3J1bnF1ZXVlX2RhdGEgKnJx
ZCwKICAgICAgKiBubyBwb2ludCBmb3JjaW5nIGl0IHRvIGRvIHNvIHVudGlsIHJhdGUgbGltaXRp
bmcgZXhwaXJlcy4KICAgICAgKi8KICAgICBpZiAoICF5aWVsZCAmJiBwcnYtPnJhdGVsaW1pdF91
cyAmJiB2Y3B1X3J1bm5hYmxlKHNjdXJyLT52Y3B1KSAmJgotICAgICAgICAgKG5vdyAtIHNjdXJy
LT52Y3B1LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lKSA8Ci0gICAgICAgICAgTUlDUk9TRUNT
KHBydi0+cmF0ZWxpbWl0X3VzKSApCisgICAgICAgICAoKGd1ZXN0X3RpbWUgPSB0YWNjX2dldF9n
dWVzdF90aW1lX2RlbHRhX3ZjcHUoc2N1cnItPnZjcHUpKSA8CisgICAgICAgICAgTUlDUk9TRUNT
KHBydi0+cmF0ZWxpbWl0X3VzKSkpCiAgICAgewogICAgICAgICBpZiAoIHVubGlrZWx5KHRiX2lu
aXRfZG9uZSkgKQogICAgICAgICB7CkBAIC0zMjk3LDcgKzMyOTgsNyBAQCBydW5xX2NhbmRpZGF0
ZShzdHJ1Y3QgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhICpycWQsCiAgICAgICAgICAgICB9IGQ7CiAg
ICAgICAgICAgICBkLmRvbSA9IHNjdXJyLT52Y3B1LT5kb21haW4tPmRvbWFpbl9pZDsKICAgICAg
ICAgICAgIGQudmNwdSA9IHNjdXJyLT52Y3B1LT52Y3B1X2lkOwotICAgICAgICAgICAgZC5ydW50
aW1lID0gbm93IC0gc2N1cnItPnZjcHUtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWU7CisgICAg
ICAgICAgICBkLnJ1bnRpbWUgPSBndWVzdF90aW1lOwogICAgICAgICAgICAgX190cmFjZV92YXIo
VFJDX0NTQ0hFRDJfUkFURUxJTUlULCAxLAogICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9m
KGQpLAogICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGNoYXIgKikmZCk7Ci0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
