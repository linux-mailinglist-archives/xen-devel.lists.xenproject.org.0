Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F67FE5EC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXJ-0001YB-IC; Fri, 15 Nov 2019 19:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXI-0001Xe-Hk
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:40 +0000
X-Inumbo-ID: 6dfd0a2a-07e0-11ea-9631-bc764e2007e4
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dfd0a2a-07e0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:08 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m125so9041154qkd.8
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SdC3z0q2na4GF7Q+htKEKzAVYjaMonpTz2Zd41lqCo0=;
 b=ddoP75pHdluMP02msXTVeMLvAdlTJ8CWatHwBCqTZ/HMJt9AV36eJYe6LVlYl+POUi
 5GCCeV7Vgx7Pkr8H97RChgnQvY6WYopt1RTXcCOmJQvEfZYbg0BT32fUWBkaRzjeFYaV
 S2p1GUUuSboRBzMwtRJ55R1OQvqG8/sGBIj9/9SnAG0yERTe2pSz7aSxNd9+Ku8FdkBJ
 xqBIpRcazUK/WVjAk98Xc52PmS2g9aJFdCPJQ4g09li0EqnLw1mnU3I1Bok3kIZds+vs
 yv1cde4fT1BLiMTUHdABnisiKGEY2mphysLHWy6O99px24AKIPmbuLHEA1a4DCOLmvta
 jvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdC3z0q2na4GF7Q+htKEKzAVYjaMonpTz2Zd41lqCo0=;
 b=T4cthEi6ja20YPZj3Ut8mMAnvuXGH7anyYcHmVbhx59Bj2HZX9IQw5GxBA9VrvEgks
 ydPYXwOadkbo3OqDprvuCwZftscM0CXJ66yFKwvB1CO4Xro62P4ZBLTzv6whk5/3j7dW
 Y1vzCFJJSXne48/Zrvdu00pudWGHdHx1AhwwY7dgsSMlzJndpK2yXfBVviLaAXjtyx1h
 tP8TqJpeq8Tb6ZzV2gd5bnrL62LZygsjABMug/Kqn3mRVN2/nkUJUOmldshh8agw31bJ
 89D0GoodxnYyEAdtYEPiYs0jDtqknbGuTYSPr0XmLl4i3vzkUcl5vipZHrUi+Ppmxp9u
 Rzbw==
X-Gm-Message-State: APjAAAV7lHMhzmLfQ4jUw1McMHWWNv3cmkVVa4hJk9CmldJu28AaA6H4
 K9/RiY9030Zt/VONnTYAk40wubr/
X-Google-Smtp-Source: APXvYqz/6fXySMTJvm4o7sPDf4H+ZX/qWfaAbd3x4S5bGthJuPLFfbXed1gypq2QTW3DhZYpfapvYw==
X-Received: by 2002:a37:2796:: with SMTP id
 n144mr14103397qkn.403.1573847108072; 
 Fri, 15 Nov 2019 11:45:08 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:07 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:15 -0500
Message-Id: <25ebb96e473b1405d202f4334725fd68cb882c38.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 08/22] golang/xenlight: define MsVmGenid
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBNc1Zt
R2VuaWQgYXMgW2ludChDLkxJQlhMX01TX1ZNX0dFTklEX0xFTildYnl0ZSBhbmQgaW1wbGVtZW50
IGZyb21DIGFuZCB0b0MgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8
cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28gfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28g
Yi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggZWIwZDMwOTU0My4uMTA4
YjUwMTI0YSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisr
KyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMjE2LDYgKzIxNiwyOSBA
QCBmdW5jIChtYWMgTWFjKSB0b0MoKSAoQy5saWJ4bF9tYWMsIGVycm9yKSB7CiAJcmV0dXJuIGNt
YWMsIG5pbAogfQogCisvLyBNc1ZtR2VuaWQgcmVwcmVzZW50cyBhIGxpYnhsX21zX3ZtX2dlbmlk
LgordHlwZSBNc1ZtR2VuaWQgW2ludChDLkxJQlhMX01TX1ZNX0dFTklEX0xFTildYnl0ZQorCitm
dW5jIChtdmcgKk1zVm1HZW5pZCkgZnJvbUMoY212ZyAqQy5saWJ4bF9tc192bV9nZW5pZCkgZXJy
b3IgeworCWIgOj0gKCpbaW50KEMuTElCWExfTVNfVk1fR0VOSURfTEVOKV1DLnVpbnQ4X3QpKHVu
c2FmZS5Qb2ludGVyKCZjbXZnLmJ5dGVzWzBdKSkKKworCWZvciBpLCB2IDo9IHJhbmdlIGIgewor
CQltdmdbaV0gPSBieXRlKHYpCisJfQorCisJcmV0dXJuIG5pbAorfQorCitmdW5jIChtdmcgKk1z
Vm1HZW5pZCkgdG9DKCkgKEMubGlieGxfbXNfdm1fZ2VuaWQsIGVycm9yKSB7CisJdmFyIGNtdmcg
Qy5saWJ4bF9tc192bV9nZW5pZAorCisJZm9yIGksIHYgOj0gcmFuZ2UgbXZnIHsKKwkJY212Zy5i
eXRlc1tpXSA9IEMudWludDhfdCh2KQorCX0KKworCXJldHVybiBjbXZnLCBuaWwKK30KKwogdHlw
ZSBDb250ZXh0IHN0cnVjdCB7CiAJY3R4ICAgICpDLmxpYnhsX2N0eAogCWxvZ2dlciAqQy54ZW50
b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
