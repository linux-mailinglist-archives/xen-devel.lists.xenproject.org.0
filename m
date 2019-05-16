Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999A20813
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGKY-00069j-6o; Thu, 16 May 2019 13:21:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRGKW-00069e-Q7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:21:52 +0000
X-Inumbo-ID: 908ca502-77dd-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 908ca502-77dd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:21:51 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d15so3075760ljc.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qSw0F03P/izFXLYzXdvZZ7Fc5VHruxkPAjVQ9AAO9gc=;
 b=PvWVEgbv6hzWlUjooWvjpFfhfTpbekdQ/bRc9ee31DdNnj63oPwIePtkiBGEQ95PvC
 ZGzhERwGr/AAsZqspt6+FnKoE7BwVQVlfU4/zyj0TQ0gnur4yc+y7UuX9vAbVeN4eKxa
 PQgZNoqHmtyxlzO/ayMaGJV4HQIntm5xZY9Xa+FIf7QdmOeYB6PyXUx/SegD5pv6T2EN
 /Eg6QRqh1ANOgnsDh8MpT3xJHN/Aj6o0MkaIjIRb+LlT65zZVJoJ2ZcPZnnRm83bnQ0n
 3ubSYCzh8E5lqdygBYmmxFtqCIGnrefQRO1Xcz46XlZHTZJcQg8Hj/+Kw1I9cSL02tyh
 O6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qSw0F03P/izFXLYzXdvZZ7Fc5VHruxkPAjVQ9AAO9gc=;
 b=UBSbazb8ODAWe0inFJJO2NpL+9DfM9lSiYvnfsbzpVh53aPe9zn4M8rHw9iZhKHRTX
 HdLeP5Pmq3rFhw1BVqyZOhY5+nwfhN7BpacM953ShLn37E119qeSbL8YOEvDpISJr6Fw
 VtlBNkKkTGUjaUOQcqU+vSJ6QLbLl3ktjHEWXsPqYMNr5rgLadcNHR48WxEHuQ8z1/Iz
 Y6Z7tlfUcQhknx4MPU7HEyDxPI96N5hXolZpBR6/ReV7RFR73TAsyp1k6cEGxnCyLTZU
 gwP7wjp8LOu3X3yT/IbzWRPaYxreoZJ4vJ3w7JlzfSih7wXjT513KayUHKQsXX6JERih
 kMRg==
X-Gm-Message-State: APjAAAVTnABVDvF96nWCXEqgkKmT5UklsBhsBOcrO2nDpBGO9bk11+D4
 Zyal6DAZZNhRfu9YaBB+F+VSEZ5Hf3eO/g==
X-Google-Smtp-Source: APXvYqzofJIvYa2MPd5Ok1dR/t2oJpw14CLTukA2WOBfR/2ToRUwmB9gNucZAE7PFq8BMJE5r5MANA==
X-Received: by 2002:a2e:9a8f:: with SMTP id p15mr23922525lji.191.1558012910080; 
 Thu, 16 May 2019 06:21:50 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id o7sm879335ljh.57.2019.05.16.06.21.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 06:21:49 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 May 2019 16:20:16 +0300
Message-Id: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJjaDY0LgoK
QWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAppdCBtZWFu
cyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
ClRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkgLmluaXQgYmluYXJ5IHdp
dGhvdXQgZ2NvdiBvcHRpb24uClRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdCBhbmQg
bGliZWxmLgpUaGUgZW50aXJlIGxpYnJhcnkgaXMgbW92ZWQgdG8gLmluaXQgdXNpbmc6CiQoT0JK
Q09QWSkgJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0uaW5p
dC4kKHMpKSAkPCAkQApTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBNYWtlZmlsZSB0byBmaWx0
ZXIgb3V0IGxpYmZkdCBhbmQgbGliZWxmLgoKUmVwb3J0ZWQtYnk6IFZpa3RvciBNaXRpbiA8dmlr
dG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRp
bi4xOUBnbWFpbC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KVGVz
dGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+CgotLS0KCkNo
YW5nZXMgZnJvbSB2MToKCiAtIGNvdmVyYWdlOiBmaWx0ZXJlZCBvdXQgbGliZWxmIGFzIHdlbGwK
LS0tCiB4ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZSB8IDEgKwogeGVuL2NvbW1vbi9saWJmZHQv
TWFrZWZpbGUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9saWJlbGYvTWFrZWZpbGUgYi94ZW4vY29tbW9uL2xpYmVsZi9NYWtl
ZmlsZQppbmRleCA1YmY4Zjc2NGYxLi4zZDllMzhmMjdlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L2xpYmVsZi9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZQpAQCAtMSw0
ICsxLDUgQEAKIG9iai1iaW4teSA6PSBsaWJlbGYubworbm9jb3YteSArPSBsaWJlbGYubwogCiBT
RUNUSU9OUyA6PSB0ZXh0IGRhdGEgJChTUEVDSUFMX0RBVEFfU0VDVElPTlMpCiAKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZp
bGUKaW5kZXggZDgxZjU0YjZiOC4uYzA3NWJiZjU0NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9s
aWJmZHQvTWFrZWZpbGUKKysrIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKQEAgLTMsNiAr
Myw3IEBAIGluY2x1ZGUgTWFrZWZpbGUubGliZmR0CiBTRUNUSU9OUyA6PSB0ZXh0IGRhdGEgJChT
UEVDSUFMX0RBVEFfU0VDVElPTlMpCiAKIG9iai15ICs9IGxpYmZkdC5vCitub2Nvdi15ICs9IGxp
YmZkdC5vCiAKIENGTEFHUyArPSAtSSQoQkFTRURJUikvaW5jbHVkZS94ZW4vbGliZmR0LwogCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
