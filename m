Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC71282ED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:54:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOJd-0005Iq-Ss; Fri, 20 Dec 2019 19:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOJc-0005I9-Cx
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:52:00 +0000
X-Inumbo-ID: 2577aca4-2362-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2577aca4-2362-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 19:51:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d139so10215512wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENSa39ODblgiZaftP8Kk0EjckN+kVjfxs00LYiEa0zA=;
 b=U8P866uOz7wW6yMjmX+KQO4Cbs2YsHrD/rKMTWN2CAssIxCTFvmnA1g64FJiyjoyGh
 Tacyf3/OCvRrqYuXip6BWu0v4NSQoiJ+u6CK9kDueWOA/O4NKDQkWlXzEQw3gsweZvY8
 r9exl1Syw7/UFVd6IOeltC6u/jTF917M36y/xdqXVMW+UQIqm//tcXG5cjj/jrCsYT7Y
 axT3Fy0bfKf/N1LZ60s3Qyb5pFGqiPRDGF7uZOBWQAl8HR5rpInzRvF8vRdU5//qSQdi
 UDxROdtf7fWXf3svctOY7pHWGEg+fnbYdNrmThBaOYDldOn1mEBUf/cacB2ULxiOhaVt
 UHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ENSa39ODblgiZaftP8Kk0EjckN+kVjfxs00LYiEa0zA=;
 b=QkBnQSw9tujjvnmg2SjPB5R81KD7C3qgT0qr1hTc1KppkH71soV++HD8mHm4nl5x5x
 xWUORljF8NRBkKX0/e7IOIMDdcILk976lMHSCRxd0cfmuxIsDnv1yG9xjjKC6yguUQvb
 M5awJ5ll3jW6MY0ErmUPPtIMgL/uybttw67X2i+Q+lYsVmKMZLoZRzlO3Qw2F3InDSDj
 WshtYm8hmeUkytUeCgu9dVFzscO70dQKs7TkHf4eRSeLBI0VOrhDmoN5PY1maRhSjwGy
 lcZGLbQKl/qsW+iwnf/dNcdky6K/VJ8Q0LnmHziAEpTa4bWOdDvVOEZpsw0VnI51Nq7r
 hPxA==
X-Gm-Message-State: APjAAAVa+6L6yxMv8RvEDyUgmVfLIOmbRzHz+tvfYSHuq77aVSeudv1P
 4cRqOpKoRiNz1AI2LUyvk3zrAfJQ
X-Google-Smtp-Source: APXvYqyhTOshxtscHAnLQKLSBEE7LGzhnvOTkOx32FfoyDXPy/XviJahrWjyuTex90Ckma9YejH66w==
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr17624019wma.139.1576871502578; 
 Fri, 20 Dec 2019 11:51:42 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id a184sm11006287wmf.29.2019.12.20.11.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 11:51:42 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 19:51:35 +0000
Message-Id: <20191220195135.20130-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220195135.20130-1-liuwe@microsoft.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] x86: move viridian_guest_os_id_msr to
 hyperv-tlfs.h
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
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VnZ2VzdGVkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+ClNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2
bS92aXJpZGlhbi92aXJpZGlhbi5jICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LXRsZnMuaCB8IDEzICsrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3ZpcmlkaWFuLmggICAgICB8IDE4ICsrKy0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMgYi94ZW4vYXJjaC94ODYvaHZtL3Zpcmlk
aWFuL3ZpcmlkaWFuLmMKaW5kZXggMzQxNTkyZjA1NC4uNDRjOGU2Y2FjNiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vdmlyaWRpYW4vdmlyaWRpYW4uYwpAQCAtMjE4LDcgKzIxOCw3IEBAIHZvaWQgY3B1aWRfdmly
aWRpYW5fbGVhdmVzKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBsZWFmLAogCiBzdGF0
aWMgdm9pZCBkdW1wX2d1ZXN0X29zX2lkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAg
Y29uc3QgdW5pb24gdmlyaWRpYW5fZ3Vlc3Rfb3NfaWRfbXNyICpnb2k7CisgICAgY29uc3QgdW5p
b24gaHZfZ3Vlc3Rfb3NfaWQgKmdvaTsKIAogICAgIGdvaSA9ICZkLT5hcmNoLmh2bS52aXJpZGlh
bi0+Z3Vlc3Rfb3NfaWQ7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2LXRsZnMuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaApp
bmRleCBiMTI4ODA3YjJjLi40NDAyODU0YzgwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnYtdGxmcy5oCkBAIC0zMjcsNiArMzI3LDE5IEBAIHN0cnVjdCBtc19oeXBlcnZfdHNjX3Bh
Z2UgewogICovCiAKICNkZWZpbmUgSFZfTElOVVhfVkVORE9SX0lEICAgICAgICAgICAgICAweDgx
MDAKK3VuaW9uIGh2X2d1ZXN0X29zX2lkCit7CisgICAgdWludDY0X3QgcmF3OworICAgIHN0cnVj
dAorICAgIHsKKyAgICAgICAgdWludDY0X3QgYnVpbGRfbnVtYmVyOjE2OworICAgICAgICB1aW50
NjRfdCBzZXJ2aWNlX3BhY2s6ODsKKyAgICAgICAgdWludDY0X3QgbWlub3I6ODsKKyAgICAgICAg
dWludDY0X3QgbWFqb3I6ODsKKyAgICAgICAgdWludDY0X3Qgb3M6ODsKKyAgICAgICAgdWludDY0
X3QgdmVuZG9yOjE2OworICAgIH07Cit9OwogCiBzdHJ1Y3QgaHZfcmVlbmxpZ2h0ZW5tZW50X2Nv
bnRyb2wgewogCV9fdTY0IHZlY3Rvcjo4OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vdmlyaWRpYW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmgKaW5k
ZXggMDEwYzhiNThkNC4uY2ZiYWVkZTE1OCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vdmlyaWRpYW4uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5o
CkBAIC05LDYgKzksOCBAQAogI2lmbmRlZiBfX0FTTV9YODZfSFZNX1ZJUklESUFOX0hfXwogI2Rl
ZmluZSBfX0FTTV9YODZfSFZNX1ZJUklESUFOX0hfXwogCisjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5
cGVydi10bGZzLmg+CisKIHVuaW9uIHZpcmlkaWFuX3BhZ2VfbXNyCiB7CiAgICAgdWludDY0X3Qg
cmF3OwpAQCAtODMsMjAgKzg1LDYgQEAgc3RydWN0IHZpcmlkaWFuX3ZjcHUKICAgICB1aW50NjRf
dCBjcmFzaF9wYXJhbVs1XTsKIH07CiAKLXVuaW9uIHZpcmlkaWFuX2d1ZXN0X29zX2lkX21zcgot
ewotICAgIHVpbnQ2NF90IHJhdzsKLSAgICBzdHJ1Y3QKLSAgICB7Ci0gICAgICAgIHVpbnQ2NF90
IGJ1aWxkX251bWJlcjoxNjsKLSAgICAgICAgdWludDY0X3Qgc2VydmljZV9wYWNrOjg7Ci0gICAg
ICAgIHVpbnQ2NF90IG1pbm9yOjg7Ci0gICAgICAgIHVpbnQ2NF90IG1ham9yOjg7Ci0gICAgICAg
IHVpbnQ2NF90IG9zOjg7Ci0gICAgICAgIHVpbnQ2NF90IHZlbmRvcjoxNjsKLSAgICB9OwotfTsK
LQogc3RydWN0IHZpcmlkaWFuX3RpbWVfcmVmX2NvdW50CiB7CiAgICAgdW5zaWduZWQgbG9uZyBm
bGFnczsKQEAgLTExMiw3ICsxMDAsNyBAQCBzdHJ1Y3QgdmlyaWRpYW5fdGltZV9yZWZfY291bnQK
IAogc3RydWN0IHZpcmlkaWFuX2RvbWFpbgogewotICAgIHVuaW9uIHZpcmlkaWFuX2d1ZXN0X29z
X2lkX21zciBndWVzdF9vc19pZDsKKyAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBndWVzdF9vc19p
ZDsKICAgICB1bmlvbiB2aXJpZGlhbl9wYWdlX21zciBoeXBlcmNhbGxfZ3BhOwogICAgIHN0cnVj
dCB2aXJpZGlhbl90aW1lX3JlZl9jb3VudCB0aW1lX3JlZl9jb3VudDsKICAgICBzdHJ1Y3Qgdmly
aWRpYW5fcGFnZSByZWZlcmVuY2VfdHNjOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
