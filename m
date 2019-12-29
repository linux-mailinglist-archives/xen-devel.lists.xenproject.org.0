Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5712CA72
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildO1-0008NV-2z; Sun, 29 Dec 2019 18:33:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildO0-0008NQ-7A
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:33:56 +0000
X-Inumbo-ID: c4a51ac4-2a69-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4a51ac4-2a69-11ea-88e7-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so12615824wmb.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkTwVQKsAhb6VzIqsXjtfT0j+phDUgGsTQmPhdprOb4=;
 b=UKr4KEuIZS4EYz/adkEIX9Gr6szwKurQvbnvEvULSU3FYkCUDzMvmfc4R6IJLU8TY3
 NqAsosiWzUiXhz0Pgl80WuF/VSl381j9jvEJHulI62Z36bW78LCCFhvl2J/E5nsGLjg5
 qS3PlzPwQmrJcwPHF2BKpI+CO76EtuCx+sjgcv+mNgWfH787KujKVwFH6NFtgp8jlE8I
 6WMMPhLMw2FcBp7qjvvsaxjJhR3603Dt/KJOttEtKpIIkUUXmdzFE8Gb4Pfrs+xZjfpc
 fjSjzdP7uZAdq/TnmMjs41nJGuPLWHidmczj09FZAHK05sKmsgjsRYosOcbTqVoTbuS7
 hWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jkTwVQKsAhb6VzIqsXjtfT0j+phDUgGsTQmPhdprOb4=;
 b=ZR8WU/J+/KCiI7bm728d7By+pwt5WY15ahfwPfBLdpOwsYD4t94XPTZjWb6AXatBdQ
 KVjKMswk9qLkZErl49KUDkJ9z4Giq9g8IvMeTr8EOSOnK086hFvX4C3j14lkC2X48lqV
 8VZJeyZANCfsrd2GmND+NejHFE6aJFGEqF8Zgf5AJLwxZ2LVDuoQAT7+fi/DOFlTaz23
 RTHSqme+yxVUIXKQ+SEth0dzFNXUfhoyvEAt3PqqXVhEnZfTRH5VirIhIICJDhjzLIXk
 ymP9CS53FwnxTdAi2aO8UiEPkAOnywCph6jnEZRqu4tcE/aXeWIink6cuY/S1lrTaMxx
 EFeg==
X-Gm-Message-State: APjAAAXSY8rTxf706L9iRbS7NvKix0midyeqaPmPC0oY9aJIgI01Ctbi
 Vi/rOhJhEVq4FdhqMZfm9+9OYBeiFcg=
X-Google-Smtp-Source: APXvYqzh7Y4V/hMwuJ1gOPIrlNMgROckRtVORJJwcz7+Xi2u8lg49WBqoo5Ub3ISYTdA7WDJBc+BRQ==
X-Received: by 2002:a1c:2504:: with SMTP id l4mr30618978wml.134.1577644434278; 
 Sun, 29 Dec 2019 10:33:54 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:53 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:33 +0000
Message-Id: <20191229183341.14877-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/8] More Hyper-V infrastructure
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIG1vcmUgZGV0YWlscy4KCkkgY2FuIG9ubHkgdGVzdCB0aGVtIGxpZ2h0bHkgYW5kIGxv
b2sgYXQgZGlzYXNzZW1ibHkgb3V0cHV0IHRvIGNoZWNrCmNvcnJlY3RuZXNzIGF0IHRoaXMgc3Rh
Z2UuIEF0IHRoZSB2ZXJ5IGxhc3QgWGVuIG9uIEh5cGVyLVYgYm9vdHMgdXAKb2theSwgc28gaXQg
aXMgbm90IGJyZWFraW5nIGFueXRoaW5nLgoKV2VpLgoKCkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+
CkNjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KCldlaSBMaXUgKDgpOgogIHg4NjogaW5j
bHVkZSB4ZW4vbGliLmggaW4gZ3Vlc3QvcHZoLWJvb3QuaAogIHg4Ni9oeXBlcnY6IGRldGVjdCBh
YnNvbHV0ZWx5IG5lY2Vzc2FyeSBNU1JzCiAgeDg2OiByZW5hbWUgZ3Vlc3QvaHlwZXJjYWxsLmgg
dG8gZ3Vlc3QveGVuLWh5cGVyY2FsbC5oCiAgeDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxsIHBh
Z2UKICB4ODYvaHlwZXJ2OiBwcm92aWRlIEh5cGVyLVYgaHlwZXJjYWxsIGZ1bmN0aW9ucwogIHg4
Ni9oeXBlcnY6IHByb3ZpZGUgcGVyY3B1IGh5cGVyY2FsbCBpbnB1dCBwYWdlCiAgeDg2L2h5cGVy
djogcmV0cmlldmUgdnBfaW5kZXggZnJvbSBIeXBlci1WCiAgeDg2L2h5cGVydjogc2V0dXAgVlAg
YXNzaXN0IHBhZ2UKCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgICAg
ICAgfCAxMjUgKysrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0Lmgg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2LWh5cGVyY2FsbC5oICB8IDEwNSArKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICAgICAgICB8ICAxMCArKwogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9wdmgtYm9vdC5oICAgICAgICAgIHwgICAyICsKIC4uLi9ndWVzdC97aHlwZXJjYWxs
LmggPT4geGVuLWh5cGVyY2FsbC5ofSAgICB8ICAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCAyNDEg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaAogcmVuYW1lIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3Qve2h5cGVyY2FsbC5oID0+IHhlbi1oeXBlcmNhbGwuaH0gKDk5JSkKCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
