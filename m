Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51CEAFA81
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvj-0000FK-4v; Wed, 11 Sep 2019 10:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvh-0000EQ-9u
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:32:53 +0000
X-Inumbo-ID: 77adbebe-d47f-11e9-a337-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77adbebe-d47f-11e9-a337-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so19511223ljd.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MxYXirbw6xPemib9KGe3LPit2WCpm5IHJxLF3QhMyss=;
 b=BnFZb4zkh2Vi/LyxIKfqWpTOqMoIEu6BHvmnds1YYCeXR64vHew35ijMfBsIGEzmXP
 +94/wYp2b/jE0XhgoFUl/6yOW7M79jWSYp2wiNCMuIjtJEDcLUrsL1nJmTeCfejTNxNk
 U3T57S6i/IWTHn/g3ttVmcKarb3g/iVbFdN+0EdnqvqfL4aoX1zr0/LxV7MSJR1boohY
 ySFnEmsTwFTT+Ferk//eheLkr7IY68wLd+M3EE64UfEnMrs7M90HFtulddvJn4o8VTLd
 ba9So8Tnad1hokXfYS8ty7VdNF+e3hJd9wN+DTWjar/syQmk4rUUc37PKwkQE88I6oNW
 nyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MxYXirbw6xPemib9KGe3LPit2WCpm5IHJxLF3QhMyss=;
 b=ZKjeQz4XJmBsNp4RZet1MbNg4ppfELST+z/l2N8jSqizSzmhLhquSIwEW6ANfBR88h
 iFZOEUeBF0NDeh9ZJyLTJUeiii8la2Ho6O6e+XPivEdaKFQiMI5SWD73CwnEIiZY5D7W
 LQqGzWgbpGFkp9tHaCxDnyCtVM6xpCyZ2OKCJ8fziygeGdMkLwWXpxdFmRsheAWhPAT+
 12tVOtW4tYL0Z8WC4N24j4spS8REJrYuMAxRvFfr7vl4hgAnxDmTUb7LCuEHHb+TIvEj
 q79znxQdj98KO+RO5wJWpgWhrA9QU6k2lAGzT3lkfQ2vpycaKQCQKNmF+jy6U0nTjpwp
 rspA==
X-Gm-Message-State: APjAAAXf+MqjyGgoeTRBsQzSDA+f5/U6n8TajcGPwUbQKFOA7v8Ixjg3
 50yT+j/4n68dz5LI8jr/1Icjk+tf04M=
X-Google-Smtp-Source: APXvYqxHC/9oq3VXTPaJPxfA6HiwbnCV8O4kfZcimSKZ+5co849oMuU2HcoQhHVnUa59R9x7sdW4KQ==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr9291670ljc.138.1568197953676; 
 Wed, 11 Sep 2019 03:32:33 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:33 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:18 +0300
Message-Id: <1568197942-15374-6-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 5/9] tacc: Introduce a lockless interface for
 guest time
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoZSBsb2NrbGVz
cyBpbnRlcmZhY2UgdG8gYWNxdWlyZSBndWVzdCB0aW1lIGJ5IHNjaGVkdWxpbmcgY29kZQppcyBp
bnRyb2R1Y2VkLiBJdCBjYW4gYmUgdXNlZCBieSBzY2hlZHVsZXJzIHdoYXQgZG8gbm90IHJlcXVp
cmUKZ3Vlc3QgdGltZSBmcm9tIGEgZGlmZmVyZW50IHBjcHUgdG8gdGFrZSBzY2hlZHVsaW5nIGRl
Y2lzc2lvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBh
bS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCAxMCArKysrKysrKysrCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKaW5kZXggMjAwNzAzNC4uNjJkZjc3ZSAxMDA2NDQKLS0tIGEveGVuL2Nv
bW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMTY0Myw2ICsx
NjQzLDE2IEBAIHZvaWQgdGFjY19pcnFfZXhpdChpbnQgcGxhY2UpCiAgICAgdGFjYy0+aXJxX2Nu
dC0tOwogfQogCitzX3RpbWVfdCB0YWNjX2dldF9ndWVzdF90aW1lKHN0cnVjdCB0YWNjICp0YWNj
KQoreworICAgIHNfdGltZV90IGd1ZXN0X3RpbWU7CisKKyAgICBndWVzdF90aW1lID0gdGFjYy0+
c3RhdGVfdGltZVtUQUNDX0dVRVNUXTsKKyAgICBndWVzdF90aW1lICs9IHRhY2MtPnN0YXRlX3Rp
bWVbVEFDQ19HU1lOQ107CisKKyAgICByZXR1cm4gZ3Vlc3RfdGltZTsKK30KKwogdm9pZCBjb250
ZXh0X3NhdmVkKHN0cnVjdCB2Y3B1ICpwcmV2KQogewogICAgIC8qIENsZWFyIHJ1bm5pbmcgZmxh
ZyAvYWZ0ZXIvIHdyaXRpbmcgY29udGV4dCB0byBtZW1vcnkuICovCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDgxNjc2
MDguLjViNDE4MDUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0yNjYsNiArMjY2LDggQEAgc3RydWN0IHZjcHUKIAog
ICAgIHN0cnVjdCBldnRjaG5fZmlmb192Y3B1ICpldnRjaG5fZmlmbzsKIAorICAgIHNfdGltZV90
ICAgIHBjcHVfZ3Vlc3RfdGltZTsKKwogICAgIC8qIHZQQ0kgcGVyLXZDUFUgYXJlYSwgdXNlZCB0
byBzdG9yZSBkYXRhIGZvciBsb25nIHJ1bm5pbmcgb3BlcmF0aW9ucy4gKi8KICAgICBzdHJ1Y3Qg
dnBjaV92Y3B1IHZwY2k7CiAKQEAgLTEwMzMsNiArMTAzNSwxMiBAQCBERUNMQVJFX1BFUl9DUFUo
c3RydWN0IHRhY2MsIHRhY2MpOwogdm9pZCB0YWNjX2h5cChpbnQgcGxhY2UpOwogdm9pZCB0YWNj
X2lkbGUoaW50IHBsYWNlKTsKIAorc190aW1lX3QgdGFjY19nZXRfZ3Vlc3RfdGltZShzdHJ1Y3Qg
dGFjYyAqdGFjYyk7CitpbmxpbmUgc190aW1lX3QgdGFjY19nZXRfZ3Vlc3RfdGltZV9kZWx0YSh2
b2lkKQoreworICAgIHJldHVybiB0YWNjX2dldF9ndWVzdF90aW1lKCZ0aGlzX2NwdSh0YWNjKSkg
LSBjdXJyZW50LT5wY3B1X2d1ZXN0X3RpbWU7Cit9CisKICNlbmRpZiAvKiBfX1NDSEVEX0hfXyAq
LwogCiAvKgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
