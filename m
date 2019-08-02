Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546E7FECF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htab7-0004AC-Bx; Fri, 02 Aug 2019 16:40:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/l75=V6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htab5-0003rU-2T
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 16:40:03 +0000
X-Inumbo-ID: 2bcc9853-b544-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bcc9853-b544-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 16:40:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z28so19232458ljn.4
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PgnbDeNvPObShiypUWFNiBvgdeoIW4vOdanJkIbquHU=;
 b=HSXo8fMwXg+H/fqX2ZkHhDY2xTUzwB9OUKQ4yfEj/D0toSAN69fqtPsBjweF6rHLKA
 duBEFJIiKoRYIVzGFdXSagis9KmgzgwKZMheg1WzHBTqsSFIcvmV6mEDS4KxyYug1Vpl
 oVkZnP8dFWefZzXevddGUbheIjKuSv5cQBM1d1Wg+rl1F7yR727Yv2PSD3fV+sSvYSDw
 C2v6bZjLCDZdAyTwZXW5IsHuXphnxlxevBJTj5LoMP7Hyf7zagTOnhozVuKZ03m0aGw4
 r+Of03NXaOBrWaT7IcpYaCWVGIAM366cFe0y6ntXAzhp6y3xgDEcQSl8MDrSpr5xpNa/
 eMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PgnbDeNvPObShiypUWFNiBvgdeoIW4vOdanJkIbquHU=;
 b=WxUmiqP8UG3lxfC9Jg3/MSHklKx4f6feL6Ua6HhSfjkjFdnP/8JrxELTItjuHPHUhD
 uPd/lRiRs9xsY78xtb6GPPFRRqkDNGNgQ5nY1PX2+9XUOBdPAjQM0NBdqGkQCfgYnkOF
 RX2+h/SB8AaBKHhiIQcM1FAQnfo3KOGk4BEv4zXJDLJGjbN6q1tjsGgc6HXGr8EYWagm
 cPJndj/6H6/xZhP2EMvfUNnwmcssVEvBBV2mDqgG0Q/21ooSM2ZzrtdcUPDmpJZRAdgp
 4zs0kQ7aamqPYawXg1YjcssvWOdtxY5vqj0fj6+PHan5Ufr793jxjY4S/VWaXn8RoWeK
 Decg==
X-Gm-Message-State: APjAAAVdUy1QU3F22LXtMdG8uexM3/pxp4JxD9L4fv6S7p7GBNIeZKMW
 lEfCfG4YJayqa49V5aewkundLFT9zeU=
X-Google-Smtp-Source: APXvYqxegN9WyW1h8rNRz4pRvBMM9euzIxGil77e1rujkTwpelpMo+uHq4RcCihb5QeKNPYhQN2Yag==
X-Received: by 2002:a2e:3604:: with SMTP id d4mr21245116lja.85.1564764000324; 
 Fri, 02 Aug 2019 09:40:00 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q6sm15378998lji.70.2019.08.02.09.39.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Aug 2019 09:39:59 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  2 Aug 2019 19:39:42 +0300
Message-Id: <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKTmV4dCBwYXRjaCBpbiB0aGlzIHNlcmllcyB3aWxsIG1ha2UgdXNlIG9mIGl0LgoKT3JpZ2lu
YWwgcGF0Y2ggd2FzIGluaXRpYWxseSBwb3N0ZWQgYnkgU2FtZWVyIEdvZWw6Cmh0dHBzOi8vbGlz
dHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTA2L21zZzAwODU4Lmh0bWwK
ClRoaXMgY291bGQgYmUgY29uc2lkZXJlZCBhcyBhbm90aGVyIGF0dGVtcHQgdG8gYWRkIGl0Ogpo
dHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2tleGVjQGxpc3RzLmluZnJhZGVhZC5vcmcvbXNn
MjEzMzUuaHRtbAoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5k
cl90eXNoY2hlbmtvQGVwYW0uY29tPgpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFRp
bSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCi0tLQogICBb
QXMgaXQgd2FzIHByZXZpb3VzbHkgZGlzY3Vzc2VkIHdpdGggSnVsaWVuIGluIElSQ10KCiAgIFRo
ZSByZWFzb24gZm9yIHRoaXMgcGF0Y2ggdG8gYmUgYW4gUkZDIGlzIHRoYXQgcGF0Y2ggaXRzZWxm
IGlzIG5vdAogICBjb21wbGV0ZWx5IGNvcnJlY3QgYW5kIEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFu
ZCB3aGF0L2hvdyBzaG91bGQKICAgYmUgZG9uZSBmb3IgdGhpcyBwYXRjaCB0byBiZSBhY2NlcHRl
ZC4gT3Igd2hldGhlciBjb21tdW5pdHkgZXZlbgogICB3YW50cyB0aGlzIHRvIGdvIGluLiBTbywg
dG8gYXZvaWQgYmlrZSBzaGVkZGluZywgdGhlIGZpcnN0IHRhcmdldCBpcwogICB0byBjb2xsZWN0
IGZlZWRiYWNrIGZyb20gdGhlIG1haW50YWluZXJzLgoKICAgSW4gYSBudXRzaGVsbCwgdGhlIHVw
Y29taW5nICJpb21tdV9md3NwZWMiIHN1cHBvcnQgb24gQVJNCiAgIGlzIGdvaW5nIHRvIHVzZSB4
cmVhbGxvYyB3aGVuIGFkZGluZyBuZXcgZGV2aWNlIElELgogICAKICAgV2UgcmVhbGx5IHdhbnQg
dG8gaGF2ZSAiaW9tbXVfZndzcGVjIiBzdXBwb3J0IHdoaWNoIHdpbGwgZ2l2ZSB1cwogICBhIGdl
bmVyaWMgYWJzdHJhY3Qgd2F5IHRvIGFkZCBuZXcgZGV2aWNlIHRvIHRoZSBJT01NVSBiYXNlZCBv
bgogICB0aGUgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5nLgogICAKICAgVGhpcyBpcyBob3cgTGlu
dXggZG9lczoKICAgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVy
L2RyaXZlcnMvaW9tbXUvaW9tbXUuYyNMMjI1NwogICBhbmQgd2UgYXJlIGRvaW5nIHRoZSBzaW1p
bGFyIGluIG5leHQgcGF0Y2ggb2YgdGhpcyB0aHJlYWQ6CiAgICJpb21tdS9hcm06IEFkZCBsaWdo
dHdlaWdodCBpb21tdV9md3NwZWMgc3VwcG9ydCIKLS0tCiB4ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5o
IHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMKaW5k
ZXggMjA3Njk1My4uYzA4MDc2MyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2Yu
YworKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCkBAIC02MTAsNiArNjEwLDI3IEBAIHZv
aWQgKl94emFsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBhbGlnbikKICAg
ICByZXR1cm4gcCA/IG1lbXNldChwLCAwLCBzaXplKSA6IHA7CiB9CiAKK3ZvaWQgKl94cmVhbGxv
Yyh2b2lkICpwLCB1bnNpZ25lZCBsb25nIG5ld19zaXplLCB1bnNpZ25lZCBsb25nIGFsaWduKQor
eworICAgIHZvaWQgKm5ld19wOworCisgICAgaWYgKCAhbmV3X3NpemUgKQorICAgIHsKKyAgICAg
ICAgeGZyZWUocCk7CisgICAgICAgIHJldHVybiBOVUxMOworICAgIH0KKworICAgIG5ld19wID0g
X3htYWxsb2MobmV3X3NpemUsIGFsaWduKTsKKworICAgIGlmICggbmV3X3AgJiYgcCApCisgICAg
eworICAgICAgICBtZW1jcHkobmV3X3AsIHAsIG5ld19zaXplKTsKKyAgICAgICAgeGZyZWUocCk7
CisgICAgfQorCisgICAgcmV0dXJuIG5ld19wOworfQorCiB2b2lkIHhmcmVlKHZvaWQgKnApCiB7
CiAgICAgc3RydWN0IGJoZHIgKmI7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxv
Yy5oIGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAppbmRleCBiNDg2ZmU0Li42Mzk2MWVmIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hl
bi94bWFsbG9jLmgKQEAgLTUxLDYgKzUxLDcgQEAgZXh0ZXJuIHZvaWQgeGZyZWUodm9pZCAqKTsK
IC8qIFVuZGVybHlpbmcgZnVuY3Rpb25zICovCiBleHRlcm4gdm9pZCAqX3htYWxsb2ModW5zaWdu
ZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIGFsaWduKTsKIGV4dGVybiB2b2lkICpfeHphbGxv
Yyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pOworZXh0ZXJuIHZvaWQg
Kl94cmVhbGxvYyh2b2lkICpwLCB1bnNpZ25lZCBsb25nIG5ld19zaXplLCB1bnNpZ25lZCBsb25n
IGFsaWduKTsKIAogc3RhdGljIGlubGluZSB2b2lkICpfeG1hbGxvY19hcnJheSgKICAgICB1bnNp
Z25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24sIHVuc2lnbmVkIGxvbmcgbnVtKQot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
