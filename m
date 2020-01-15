Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFDF13C5DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 15:24:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irjWG-0000dz-10; Wed, 15 Jan 2020 14:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irjWE-0000du-GN
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 14:19:38 +0000
X-Inumbo-ID: 0fbdf9dc-37a2-11ea-b89f-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fbdf9dc-37a2-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 14:19:38 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id q127so8284599pga.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rv/DqUwBL0cLyteq+cLEvFpPEt4GgePPdmAX2ItXChM=;
 b=kIWJKZcsvkuUZvwRivtFvgIWWDo/Tti9TY17prXqhn8ou+0J4BFvJ8oIYES3K08qiV
 R2Vd/rvzIe6i8Dil+hZ1hPy5ShyssowGgZBxu6/JRIa6PsjSIBRLZaXZ8XByGPpMGHXb
 HMEh9ZxA9USfjlI/OVFGBEnv4FMtGnmgrp8YW8Bne7Sob31aw40Lz7ldLM/hNyY+ouRL
 nO67kdJRx5Qqwd6mEg1nF2oLI06lV89EutTw90xedrb8KftavppvbuE85RQRPFz+aWLB
 jofInZLvvseBm3dWeaCgohHSctkr/z6cg19t3fVZFRNbnLUnK+IO6HNECzCuhrooY2aC
 7PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rv/DqUwBL0cLyteq+cLEvFpPEt4GgePPdmAX2ItXChM=;
 b=etaDSMxXezF54vRir39loGzVM5Z90fjoN/0VenN85sspvezVjCDoHzclW+fjJp+i+/
 lbUQcKHpeYveqFVrdJJo2wQmfZF/MIxEQX+ZnPYnbeEfPoURn0VyZC6kz5eRXrnhwHnZ
 cLiPiVcNqSJB4r8ekauCGh3kXNfoXJbKS3XzVkXOkasA9ULX5fJ16Z3g0P+V3qWIqKaf
 zavMTWtC8ARFe7OlxsA8uHi+cdajPjQ6/HaB2kEQwve8j6UjjgqxR2N+QMArvSPDb8I6
 FSgT7/emzWzdUgZx+Wnpr/hreXS+JjvOlRJpceOd6fM9r5H5GiaoK/sEWX0G+LmZMU2j
 oOzw==
X-Gm-Message-State: APjAAAVyjGmi1bcjzy78c3OxJ8x3cJF7CtNZXgtBp91vfKBwordT2MWU
 GEQQC/fwEC3EK8LXoW6BKjU=
X-Google-Smtp-Source: APXvYqw/Ek4M3Mu/gGAWjG9C64Bz9YXgOVv1wSXGZqMVwUNkMRrlLduGljYrzFwonam0LSkXgoxpww==
X-Received: by 2002:a63:534d:: with SMTP id t13mr31890500pgl.89.1579097977017; 
 Wed, 15 Jan 2020 06:19:37 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:ed72:75ba:e01f:bdbc:c547])
 by smtp.gmail.com with ESMTPSA id p35sm21208425pgl.47.2020.01.15.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:19:36 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: wei.liu@kernel.org,
	paul@xen.org
Date: Wed, 15 Jan 2020 19:48:40 +0530
Message-Id: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU list
 checking
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
Cc: paulmck@kernel.org, frextrite@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4K
Cmxpc3RfZm9yX2VhY2hfZW50cnlfcmN1IGhhcyBidWlsdC1pbiBSQ1UgYW5kIGxvY2sgY2hlY2tp
bmcuClBhc3MgY29uZCBhcmd1bWVudCB0byBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdS4KClNpZ25l
ZC1vZmYtYnk6IE1hZGh1cGFybmEgQmhvd21payA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaGFzaC5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNoLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNo
LmMKaW5kZXggMTBkNTgwYzNkZWEzLi4zZjk3ODNmNzBhNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L3hlbi1uZXRiYWNrL2hhc2guYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9oYXNo
LmMKQEAgLTUxLDcgKzUxLDggQEAgc3RhdGljIHZvaWQgeGVudmlmX2FkZF9oYXNoKHN0cnVjdCB4
ZW52aWYgKnZpZiwgY29uc3QgdTggKnRhZywKIAogCWZvdW5kID0gZmFsc2U7CiAJb2xkZXN0ID0g
TlVMTDsKLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShlbnRyeSwgJnZpZi0+aGFzaC5jYWNoZS5s
aXN0LCBsaW5rKSB7CisJbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoZW50cnksICZ2aWYtPmhhc2gu
Y2FjaGUubGlzdCwgbGluaywKKwkJCQlsb2NrZGVwX2lzX2hlbGQoJnZpZi0+aGFzaC5jYWNoZS5s
b2NrKSkgewogCQkvKiBNYWtlIHN1cmUgd2UgZG9uJ3QgYWRkIGR1cGxpY2F0ZSBlbnRyaWVzICov
CiAJCWlmIChlbnRyeS0+bGVuID09IGxlbiAmJgogCQkgICAgbWVtY21wKGVudHJ5LT50YWcsIHRh
ZywgbGVuKSA9PSAwKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
