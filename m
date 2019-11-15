Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F1FE5ED
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXS-0001fK-Bs; Fri, 15 Nov 2019 19:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXR-0001eq-Gs
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:49 +0000
X-Inumbo-ID: 6f557b6e-07e0-11ea-9631-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f557b6e-07e0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:11 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id e2so9056849qkn.5
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJpUeWf0jnfsbS1osieBLxXWni5b06jpA8uSL+ymQ14=;
 b=vB2ga8TA5fppzTiacfu695HmOo4qOx1/uOwUDfs223dgo950m0ArARQudaDKoh+mRX
 lTkBHTflg6mjmfMz6aL2LvszVCbtR+NPbevZk08+RweZTdvPgBNqpxn9Mt4JyiYSYQX5
 +0PL15G4nrQ3AKD/J/c7k6hlnT1tOUsQLE2diOBneOi+iTUIbZLCHCsAbdD/TegqnuDq
 wUEDBUQXetErpBx5vqK3F0t75VaJqlHsqtPbtYYfvGJ9pIdQQsFlOLsIY51JHdgQrWXK
 3KLVWQhnIWBNeuy/uHJ/6R0ZiMzdYzbQn4OOij6LEE+u6NUaysnNWcR8y846ipBGDvSB
 0a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJpUeWf0jnfsbS1osieBLxXWni5b06jpA8uSL+ymQ14=;
 b=FBiiQg8QXkWeQYxJ2zUEeNjhohG++A6KL0hchOgtuoDByagv/ajrPneCl/+0Zc3S0W
 v9IQ7d7cfiPcTppSCqDPdcWY5QfWaLMRN9cI+oN8n1P/1qnygDea9SYoT0Mzyw7r8+0+
 6G+G1v/gR0+W7qTDrqvwrlzRvGHZxGFJRYsePtpQ0bkH0cnyBgJdBHP/Nz73+4vjCgqq
 rYD04xq2ROJvN38toGytZ62Gsd7oOWoYg7xSZ9dKammfDcdp8r+6BlQzTu7lVnzk5igB
 RrOeIRsW67H4TXGdAhjdOrm+rOCfWJXUkQPdLx53y+J17XT45fPz2QibqJbq0jD0xafx
 B15A==
X-Gm-Message-State: APjAAAX9dkVU1lGdb1FKTrCq8X402l6W1/6bGqpgjfcS1yJJE93Mquyd
 69bHxpJZEyF4pvvXLMErxfcsZB8L
X-Google-Smtp-Source: APXvYqz17k5Nv8me8SeZk/B7DEoddAipIg0iB1tbbCpNAj2RiYp/E26qlcYJlUYKPaVzKqCfGLoFaw==
X-Received: by 2002:a37:3c8:: with SMTP id 191mr13726851qkd.77.1573847110324; 
 Fri, 15 Nov 2019 11:45:10 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:09 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:17 -0500
Message-Id: <c249a9a27a293c20d580b4b0f0bb3d04ba399c34.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 10/22] golang/xenlight: define
 CpuidPolicyList builtin type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBDcHVp
ZFBvbGljeUxpc3QgYXMgYSBzdHJpbmcgc28gdGhhdCBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcg
Y2FuCmJlIHVzZWQgaW4gdGhlIHRvQyBmdW5jdGlvbi4KCkZvciBub3csIGZyb21DIGlzIGEgbm8t
b3Agc2luY2UgbGlieGwgZG9lcyBub3Qgc3VwcG9ydCBhIHdheSB0byByZWFkIGEKcG9saWN5LCBt
b2RpZnkgaXQsYW5kIHRoZW4gZ2l2ZSBpdCBiYWNrIHRvIGxpYnhsLgoKU2lnbmVkLW9mZi1ieTog
TmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6
Ci0gUmUtZGVmaW5lIENwdWlkUG9saWN5TGlzdCBhcyBzdHJpbmcuCi0gTWFrZSBmcm9tQyBhIG5v
LW9wLgotIFVzZSBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcgaW4gdG9DIGZ1bmN0aW9uLgoKIHRv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDI1ICsrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0LmdvCmluZGV4IGQ1N2Y3ODAxMTYuLjZmMGE5Mjc4YWQgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28KQEAgLTI0OSw2ICsyNDksMzEgQEAgdHlwZSBFdkxpbmsgc3RydWN0e30KIGZ1
bmMgKGVsICpFdkxpbmspIGZyb21DKGNlbCAqQy5saWJ4bF9ldl9saW5rKSBlcnJvciAgICAgIHsg
cmV0dXJuIG5pbCB9CiBmdW5jIChlbCAqRXZMaW5rKSB0b0MoKSAoY2VsIEMubGlieGxfZXZfbGlu
aywgZXJyIGVycm9yKSB7IHJldHVybiB9CiAKKy8vIENwdWlkUG9saWN5TGlzdCByZXByZXNlbnRz
IGEgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QuCisvLworLy8gVGhlIHZhbHVlIG9mIENwdWlkUG9s
aWN5TGlzdCBpcyBob25vcmVkIHdoZW4gdXNlZCBhcyBpbnB1dCB0byBsaWJ4bC4gSWYKKy8vIGEg
c3RydWN0IGNvbnRhaW5zIGEgZmllbGQgb2YgdHlwZSBDcHVpZFBvbGljeUxpc3QsIHRoYXQgZmll
bGQgd2lsbCBiZSBsZWZ0CisvLyBlbXB0eSB3aGVuIGl0IGlzIHJldHVybmVkIGZyb20gbGlieGwu
Cit0eXBlIENwdWlkUG9saWN5TGlzdCBzdHJpbmcKKworZnVuYyAoY3BsIENwdWlkUG9saWN5TGlz
dCkgZnJvbUMoY2NwbCAqQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCkgZXJyb3IgeyByZXR1cm4g
bmlsIH0KKworZnVuYyAoY3BsIENwdWlkUG9saWN5TGlzdCkgdG9DKCkgKEMubGlieGxfY3B1aWRf
cG9saWN5X2xpc3QsIGVycm9yKSB7CisJdmFyIGNjcGwgQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlz
dAorCisJcyA6PSBDLkNTdHJpbmcoc3RyaW5nKGNwbCkpCisJZGVmZXIgQy5mcmVlKHVuc2FmZS5Q
b2ludGVyKHMpKQorCisJcmV0IDo9IEMubGlieGxfY3B1aWRfcGFyc2VfY29uZmlnKCZjY3BsLCBz
KQorCWlmIHJldCAhPSAwIHsKKwkJQy5saWJ4bF9jcHVpZF9kaXNwb3NlKCZjY3BsKQorCisJCXJl
dHVybiBjY3BsLCBFcnJvcigtcmV0KQorCX0KKworCXJldHVybiBjY3BsLCBuaWwKK30KKwogdHlw
ZSBDb250ZXh0IHN0cnVjdCB7CiAJY3R4ICAgICpDLmxpYnhsX2N0eAogCWxvZ2dlciAqQy54ZW50
b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
