Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D734610DD87
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 12:59:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1Np-0004ka-RQ; Sat, 30 Nov 2019 11:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1No-0004kG-JF
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:57:52 +0000
X-Inumbo-ID: 9de3358c-1368-11ea-9db0-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de3358c-1368-11ea-9db0-bc764e2007e4;
 Sat, 30 Nov 2019 11:57:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so1544972wmc.2
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVP+NJX1jO0Cy8PowYlfCy2l9JmfmeIKdgyamebmLNw=;
 b=aIHUb7L85/oXBMkQ+lLSCXcxfodoGzT2RuANQaynGHWyccJALKZX571qu/u0dmsiKN
 61mIsu+u9TPyb/E5KVXkjeGNRZuC9djcoM22rmEWpecQWzDllW3RLjmUxwc+jdbZNpks
 OxAFLLzpu/e6VYa3vG+NcV+2gJBK3ByBVH1y8B1MynShwkUYBJxzzVNTIon0LLb4bdto
 JQSteo/HtBL7UOYWDhC+pjOF2k78K/fzj+g7mm1of+5/lRxqLEqB6F3Xcooo1sVTzNNr
 txczZqOoxWfJbD3GzCyx6MCOBINJmraTtnuqOyqZZ4ZL/1/XVfMxOqkjbTBVXFqDT+cU
 c4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AVP+NJX1jO0Cy8PowYlfCy2l9JmfmeIKdgyamebmLNw=;
 b=ShGhJOMcCSzzcSRPN6+d+IkUMI6GVFTLUZpLYz5IWFhbgGD3Omk5XQjL2c4hbZXS6V
 +2/TyHdgl13M90XZ9wm1Qboh8mv4syJgwgKeEeQ0yB8jImDgH+6nNxq3syuZX4cpkvrQ
 Q3Hbmb6Nx2G+eEgjbnA6Zcv+bhJbiKD8HtIEGNLEwPmX7aBOUYA5FOQeicqLFYH0baQ7
 V3d85TIrt8qkTmVs1cn6kKTi4cv8jG1vgomFIYS6ZcVFHj5s0kj1Mhok81NiylKv/vze
 lO+5LGymh98tB1JM2HD66qdF3ppuExggDug2zBcnEI46I6QkvF7dWvl5Mlig4chZmtOf
 PK+g==
X-Gm-Message-State: APjAAAUzZ/dc0D9fMgUlm184b6IEE62La8u11dFkOrUwqRPx9xNxqKBx
 /txk78qoRslwsrmMNLOBBCjehkPbIQU=
X-Google-Smtp-Source: APXvYqyf6U71XGXoxA1M/K+FKlnKccclTPKrpyFVOXUEPvmIVUE63dglQzqSJ9B6INTgv/PEE/7f0Q==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr5509640wmh.22.1575115063033;
 Sat, 30 Nov 2019 03:57:43 -0800 (PST)
Received: from debian.mshome.net (122.163.200.146.dyn.plus.net.
 [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z11sm2227769wrt.82.2019.11.30.03.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:57:42 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 30 Nov 2019 11:57:31 +0000
Message-Id: <20191130115737.15752-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130115737.15752-1-liuwe@microsoft.com>
References: <20191130115737.15752-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 2/8] x86: add missing headers in hypercall.h
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBhc21fZGVmbnMuaCBiZWNhdXNlIEFTTV9DQUxMX0NPTlNUUkFJTlQgaXMgZGVmaW5l
ZCB0aGVyZS4KCkluY2x1ZGUgeGVuL2xpYi5oIGJlY2F1c2Ugd2UgbmVlZCBBU1NFUlRfVU5SRUFD
SEFCTEUuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxp
dXdlQG1pY3Jvc29mdC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
LS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJj
YWxsLmgKaW5kZXggZDU0ODgxNmIzMC4uZDBkMmY1MDIyZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVyY2FsbC5oCkBAIC0yMyw2ICsyMyw4IEBACiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMu
aD4KIAorI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KKwogI2luY2x1ZGUgPHB1YmxpYy94ZW4u
aD4KICNpbmNsdWRlIDxwdWJsaWMvc2NoZWQuaD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL2h2bV9v
cC5oPgpAQCAtMTgwLDYgKzE4Miw4IEBAIHN0YXRpYyBpbmxpbmUgbG9uZyB4ZW5faHlwZXJjYWxs
X3NldF9ldnRjaG5fdXBjYWxsX3ZlY3RvcigKIAogI2Vsc2UgLyogQ09ORklHX1hFTl9HVUVTVCAq
LwogCisjaW5jbHVkZSA8eGVuL2xpYi5oPgorCiAjaW5jbHVkZSA8cHVibGljL3NjaGVkLmg+CiAK
IHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5faHlwZXJjYWxsX2NvbnNvbGVfd3JpdGUoCi0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
