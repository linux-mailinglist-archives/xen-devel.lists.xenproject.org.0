Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4911742B8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 02:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqS0r-00040K-29; Thu, 25 Jul 2019 00:53:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jpaK=VW=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hqS0o-00040D-P5
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 00:53:38 +0000
X-Inumbo-ID: a2f8740a-ae76-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a2f8740a-ae76-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 00:53:37 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s7so93461877iob.11
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 17:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YX+FKBPdP1PjCQoZtYI7M0YxcaORS6zDX4GQoo/2XSM=;
 b=r+AFtpa+QeYH2NnWS8+sosEcz6NoAZrkSZfV7oB7AczW5MTQjUAea4O2KU5pg2nwtB
 8U6UY4Jxf849Nti1toSHr0GZNezP9EyraZ+WOplZDCHZXBgKIY037CrRmEcgfE0DLbev
 q506HF5mZ0OlQdUqaqCvQLlQ/ONz17RtMdDzLPhkFOIY9MSbipprGYWphtdUFa9W0eUM
 mkLFFS6idFCI9EqS9AsK77us7qJOVHJagW5gOllclWtWTra0lVmaIFMku+OLQZ9raXjo
 uw3QBO6EA/HCmv3QcXkR8FiFmQy0sFNZgg2r8wYO8h+/KCFBrgQd1naZWEDSnZM9VMWW
 GMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YX+FKBPdP1PjCQoZtYI7M0YxcaORS6zDX4GQoo/2XSM=;
 b=uRrA8jPGed0JINGIeyQUnrddOMpI0+NmcLZ//TgojMjfhrWYGx/Idi06mPT0UFM/jY
 vAtH7Lo4B2Yq1gQVXeZnC5Mvbro6fUDDiV4q7FrY+bsQQaUzKSm1LxRUo0lduASWqU7s
 vWtQYDWtegKuC/9KsvyZlphsEVYgj+d2+YvCOCgOlh1gycG2ChkgA1Ed4hsDgfCRqaNe
 DbqJXXuoadOXR0XKf9sJTKLWABrBCnf0tn/ruEcImHPssrKEHgIFqflYXKeU9kDFdB0t
 rKpxvGw8OLMcYUIVBqlhP63kjEoZTpH1qLUvQ7vaAieToLrDUWSWVnqLh7wmvVRclrCA
 9irw==
X-Gm-Message-State: APjAAAWn0o15PdtHtbVo7jbYlRUyyBklT8wa9PVh8pvK8bayZVnqLesK
 OhsS5THlQNR7W8U2Ab2pgN7V4o6B
X-Google-Smtp-Source: APXvYqwtK4ATIcT4LXzJAKzE3HjV1XVy66wmL8ULvfzwDAkd2e3IetvYfqy8tbyVApWm/03x/TYUGA==
X-Received: by 2002:a5d:9858:: with SMTP id p24mr16123365ios.171.1564016016893; 
 Wed, 24 Jul 2019 17:53:36 -0700 (PDT)
Received: from desktop.ice.pyrology.org
 (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
 by smtp.gmail.com with ESMTPSA id x22sm34036193ioh.87.2019.07.24.17.53.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 17:53:36 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2019 17:53:26 -0700
Message-Id: <20190725005326.3553-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow warning
 by null terminating strings
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgoK
Z2NjIDkuMS4wIHJlcG9ydHM6Cgp8IHRlc3QtY3B1LXBvbGljeS5jOjY0OjE4OiBlcnJvcjogJyUu
MTJzJyBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbm90IGEgbnVsLXRlcm1pbmF0ZWQgc3RyaW5nIFst
V2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCnwgICAgNjQgfCAgICAgICAgICAgICBmYWlsKCIgIFRl
c3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBnb3QgJXVcbiIsCnwgICAgICAgfCAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KfCB0ZXN0LWNwdS1wb2xpY3kuYzoyMDoxMjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
byAnZmFpbCcKfCAgICAyMCB8ICAgICBwcmludGYoZm10LCAjI19fVkFfQVJHU19fKTsgICAgICAg
ICAgICAgICAgIFwKfCAgICAgICB8ICAgICAgICAgICAgXn5+CnwgdGVzdC1jcHUtcG9saWN5LmM6
NjQ6Mjc6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCnwgICAgNjQgfCAgICAg
ICAgICAgICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBnb3QgJXVc
biIsCnwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+CnwgdGVzdC1jcHUt
cG9saWN5LmM6NDQ6Nzogbm90ZTogcmVmZXJlbmNlZCBhcmd1bWVudCBkZWNsYXJlZCBoZXJlCnwg
ICAgNDQgfCAgICAgfSB0ZXN0c1tdID0gewp8ICAgICAgIHwgICAgICAgXn5+fn4KCnNvIGluY3Jl
YXNlIHRoZSBzdHJpbmcgYXJyYXkgc2l6ZSBieSBvbmUgY2hhcmFjdGVyIGZvciB0aGUgbnVsbCBz
dHJpbmcKdGVybWluYXRvciBhbmQgYWRkIGFub3RoZXIgc2luZ2xlIGNoYXIgdG8gdGhlIHN0cnVj
dCB3aXRoaW4gdGhlIHNhbWUKdW5pb24gdG8gYmFsYW5jZSBpdC4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQog
dG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYyBiL3Rvb2xzL3Rlc3RzL2NwdS1w
b2xpY3kvdGVzdC1jcHUtcG9saWN5LmMKaW5kZXggY2EzYjhkZDQ1Zi4uYzkxNDA4YTkzYSAxMDA2
NDQKLS0tIGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYworKysgYi90
b29scy90ZXN0cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jCkBAIC0zNSw5ICszNSwxMCBA
QCBzdGF0aWMgdm9pZCB0ZXN0X3ZlbmRvcl9pZGVudGlmaWNhdGlvbih2b2lkKQogewogICAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCB7CiAgICAgICAgIHVuaW9uIHsKLSAgICAgICAgICAgIGNo
YXIgaWRlbnRbMTJdOworICAgICAgICAgICAgY2hhciBpZGVudFsxM107CiAgICAgICAgICAgICBz
dHJ1Y3QgewogICAgICAgICAgICAgICAgIHVpbnQzMl90IGIsIGQsIGM7CisgICAgICAgICAgICAg
ICAgY2hhciBudWxsX3Rlcm1pbmF0b3I7CiAgICAgICAgICAgICB9OwogICAgICAgICB9OwogICAg
ICAgICB1bnNpZ25lZCBpbnQgdmVuZG9yOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
