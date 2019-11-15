Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37AFE5F4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXD-0001US-7N; Fri, 15 Nov 2019 19:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXC-0001U3-Gi
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:34 +0000
X-Inumbo-ID: 6d40f128-07e0-11ea-b678-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d40f128-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:07 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 205so9066761qkk.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3RsL6LRs97DifodRCcEmAhXL6aDmbBJ1oLecoxp4fc=;
 b=oSOHWPurQzPaE1rkFXAS3ZR9QGmpEKN9QV9ocrB432AxeIw1+2YN7koYF6C4x3O6sp
 ctf3Q5A3KjSsfJtZPmH6pqXXfCCBXuVJ6yQJ6FjhroR79jn1OZnzH7vXEv6DkdvFSfmo
 g4YSSHiD61t1T8AJIPj97pIXnoW8CpRvHjeWoxXmfvHXUhgja5hE3GT3J/qSgtrpBXOy
 HhCetzlgjp1ijNmeH4thmH2o1GjfC2VwUy+qKT7bpxqRHtk5V8A/VNko2xGYlmZjhsWu
 80OmbckTXHVYrxv+Lg6GGsSVEqtWEH9Ruoen/zpXJzZd/kIHSChRJv12OIQlj3zfqtMv
 nL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3RsL6LRs97DifodRCcEmAhXL6aDmbBJ1oLecoxp4fc=;
 b=gzo4PZ35sJK3oem4Sa/IsrsGHFy1YGCpablH7+VjHViE7gUS3xUJ4MMVJVSBoW7TUc
 TVKXwR2fQ3k7nGS/I6ubTjdVq2yoN+ZZ/fG3DALg6TYGJV/ZmzIT9X55vNKps2dwVKdo
 4a3Qi6todqB100tQkikgvvU4i9FSwc8sQmDy+l/DLWAfpD0aGQIMSlpc2BqnVTtj0yyP
 suNlqQvqE01mw4hVDxhyKzZouBOyLSR4T/zLUhBhLwaLBRRVafWzb8NcxrWzkA08zMcz
 TK2QSV1SWA+Xz0F1YmvGMZiTwmKBTBOkmxtIwOU0l8XYxDWYSu1qeqtOJqsSuU1MF8MD
 on/g==
X-Gm-Message-State: APjAAAXSJsU4F88fsR0GOpBvrwzu04HyZgcfdJsIexY1e3YfhAPuPq1z
 uZMjN77DwStOxb0bL8TV2oIN8Pes
X-Google-Smtp-Source: APXvYqxbzNIYsyknTd1QE1xFPF+aUKmrdGgqkMxEK04FSwOp3iAsh5y/t1eD23ppD8+Jl0ViE39K1A==
X-Received: by 2002:a37:a392:: with SMTP id
 m140mr13862337qke.383.1573847106822; 
 Fri, 15 Nov 2019 11:45:06 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:06 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:14 -0500
Message-Id: <64a78d4802d2aa4f43cf2959fa0d0d884631761e.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 07/22] golang/xenlight: define Mac builtin
 type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBNYWMg
YXMgWzZdYnl0ZSBhbmQgaW1wbGVtZW50IGZyb21DLCB0b0MsIGFuZCBTdHJpbmcgZnVuY3Rpb25z
LgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
LS0tCkNoYW5nZXMgaW4gdjI6Ci0gRml4IHRoZSBmb3JtYXQgc3RyaW5nIGluIFN0cmluZyBmdW5j
dGlvbiB0byB1c2UgJTAyeC4KLSBVc2UgYSB2YWx1ZSByZWNpZXZlciBmb3IgdGhlIHRvQyBmdW5j
dGlvbi4KCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAzNSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCA3MmFmYzNjZjE0Li5lYjBkMzA5NTQzIDEw
MDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0xODEsNiArMTgxLDQxIEBAIGZ1bmMgKGQg
KkRlZmJvb2wpIHRvQygpIChDLmxpYnhsX2RlZmJvb2wsIGVycm9yKSB7CiAJcmV0dXJuIGMsIG5p
bAogfQogCisvLyBNYWMgcmVwcmVzZW50cyBhIGxpYnhsX21hYywgb3Igc2ltcGx5IGEgTUFDIGFk
ZHJlc3MuCit0eXBlIE1hYyBbNl1ieXRlCisKKy8vIFN0cmluZyBmb3JtYXRzIGEgTWFjIGFkZHJl
c3MgdG8gc3RyaW5nIHJlcHJlc2VudGF0aW9uLgorZnVuYyAobWFjIE1hYykgU3RyaW5nKCkgc3Ry
aW5nIHsKKwlzIDo9ICIlMDJ4OiUwMng6JTAyeDolMDJ4OiUwMng6JTAyeCIKKwlvcHRzIDo9IG1h
a2UoW11pbnRlcmZhY2V7fSwgNikKKworCWZvciBpLCB2IDo9IHJhbmdlIG1hYyB7CisJCW9wdHNb
aV0gPSB2CisJfQorCisJcmV0dXJuIGZtdC5TcHJpbnRmKHMsIG9wdHMuLi4pCit9CisKK2Z1bmMg
KG1hYyAqTWFjKSBmcm9tQyhjbWFjICpDLmxpYnhsX21hYykgZXJyb3IgeworCWIgOj0gKCpbNl1D
LnVpbnQ4X3QpKHVuc2FmZS5Qb2ludGVyKGNtYWMpKQorCisJZm9yIGksIHYgOj0gcmFuZ2UgYiB7
CisJCW1hY1tpXSA9IGJ5dGUodikKKwl9CisKKwlyZXR1cm4gbmlsCit9CisKK2Z1bmMgKG1hYyBN
YWMpIHRvQygpIChDLmxpYnhsX21hYywgZXJyb3IpIHsKKwl2YXIgY21hYyBDLmxpYnhsX21hYwor
CisJZm9yIGksIHYgOj0gcmFuZ2UgbWFjIHsKKwkJY21hY1tpXSA9IEMudWludDhfdCh2KQorCX0K
KworCXJldHVybiBjbWFjLCBuaWwKK30KKwogdHlwZSBDb250ZXh0IHN0cnVjdCB7CiAJY3R4ICAg
ICpDLmxpYnhsX2N0eAogCWxvZ2dlciAqQy54ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQot
LSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
