Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16647144B14
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LA-00058k-LP; Wed, 22 Jan 2020 05:14:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Kx-0006AG-5o
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:43 +0000
X-Inumbo-ID: 0730ab5c-3cbb-11ea-8e9a-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0730ab5c-3cbb-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:56 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id x18so2407783ybk.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DguBlsKx+useix8AowTQdVRjFHam0pkwXuJUG2anYyE=;
 b=EsVD+8pI6nXMDMwgrGzPC4tA+Fs9GZ8bjuyTOcQwjY7tGqgLXpsPWINXCd8ZoECG4y
 JR2Q+9ypRbne9ZWErG6lQ0DSuf3s3RSw2lvls6gQTJai2nJ2REbjBH5QeR5qUih7U9cY
 vkHIXd8JaIMRrIsmytTZ9EQ0D0c/uNo9kMvQR0BIkUujinlr/pNCPCwQ30vSWo3xmA4W
 2MG1Kyi9UhfMkt89D7wsgMe3ujTj2M6vpQM/UBxc/qTOvXzEM/epErZ9s5bFvMSauQNV
 1pB88nRRUSG9Ih1xr/wiAQhRafxo+2RcOo+SDAfBA7GBBEuZ2SiV47QWUM/WkF638n40
 yvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DguBlsKx+useix8AowTQdVRjFHam0pkwXuJUG2anYyE=;
 b=HP4n7IAcYeEU6ZsAE+jkCupq5vYhAF3E3arQX6KNuw3yIxrpA7gorUSqbFRxBZUjeM
 bjhZNkvGz2F1oMonK97VaYwEg019CaTpjsKV3FMa+XFwxbg9VoPsLfXrOzvMdFEixc9A
 e+L04N6Tr6SkLDN4UjTR8Qn5U7lZdK4vv6bJVWd/FiOOl+v0dzLEfugVvbqZ+jCo1XFT
 qZV/Ugr6/x1oOvn0hDtR4SFoudoQT3BlFF6Fvx6oWDDpL3g46JaSUKROf4GXOUQ9NQwn
 WctRWc+dlIDLrTcIdslanDgS3OCuXy2IxdpfpXQJRJyibEL/2qozM+ag0Y2P+tMlrxuA
 PQEA==
X-Gm-Message-State: APjAAAXIEA4I+uVz/6Sl5vCzKLLSwXMe04DIeNW3DlEAwm/aRbmAqCM7
 zSm+YMnmaKRf0cW4P695kgOzjtglFdj6Bg==
X-Google-Smtp-Source: APXvYqwcQY9WggTe5u4m8SXsAuN0oxZD80nFxkwp5sZreRxgYxsytUpmOD+Dz43PGkrl0Ok02qW0vg==
X-Received: by 2002:a25:df83:: with SMTP id w125mr6266579ybg.137.1579658455928; 
 Tue, 21 Jan 2020 18:00:55 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:55 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:54 -0600
Message-Id: <724f266934a68f53dafca2c9a65ed4001e6883d5.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 15/23] riscv: Add traps.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L3RyYXBzLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvdHJhcHMuYwoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3Jpc2N2L3RyYXBzLmMgYi94ZW4vYXJjaC9yaXNjdi90cmFwcy5jCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQwMTQ3YTUyN2YKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4v
YXJjaC9yaXNjdi90cmFwcy5jCkBAIC0wLDAgKzEsNTYgQEAKKy8qCisgKiBSSVNDLVYgVHJhcCBo
YW5kbGVycworICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IK
KyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogVGhpcyBwcm9n
cmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisg
KiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZQorICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUg
ZGV0YWlscy4KKyAqLworCisjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+CisjaW5jbHVkZSA8
eGVuL2Vycm5vLmg+CisjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgorI2luY2x1ZGUgPHhlbi9p
bml0Lmg+CisjaW5jbHVkZSA8eGVuL2lvY2FwLmg+CisjaW5jbHVkZSA8eGVuL2lycS5oPgorI2lu
Y2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vbGl2ZXBhdGNoLmg+CisjaW5jbHVkZSA8
eGVuL21lbV9hY2Nlc3MuaD4KKyNpbmNsdWRlIDx4ZW4vbW0uaD4KKyNpbmNsdWRlIDx4ZW4vcGVy
ZmMuaD4KKyNpbmNsdWRlIDx4ZW4vc21wLmg+CisjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4KKyNp
bmNsdWRlIDx4ZW4vc3RyaW5nLmg+CisjaW5jbHVkZSA8eGVuL3N5bWJvbHMuaD4KKyNpbmNsdWRl
IDx4ZW4vdmVyc2lvbi5oPgorI2luY2x1ZGUgPHhlbi92aXJ0dWFsX3JlZ2lvbi5oPgorCisjaW5j
bHVkZSA8cHVibGljL3NjaGVkLmg+CisjaW5jbHVkZSA8cHVibGljL3hlbi5oPgorCit2b2lkIHNo
b3dfc3RhY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCit7CisgICAgLyogVE9E
TyAqLworfQorCit2b2lkIHNob3dfZXhlY3V0aW9uX3N0YXRlKGNvbnN0IHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQoreworICAgIC8qIFRPRE8gKi8KK30KKwordm9pZCB2Y3B1X3Nob3dfZXhl
Y3V0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQoreworICAgIC8qIFRPRE8gKi8KK30KKworZW51
bSBtY19kaXNwb3NpdGlvbiBhcmNoX2RvX211bHRpY2FsbF9jYWxsKHN0cnVjdCBtY19zdGF0ZSAq
c3RhdGUpCit7CisgICAgLyogVE9ETyAqLworCisgICAgcmV0dXJuIG1jX2NvbnRpbnVlOworfQot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
