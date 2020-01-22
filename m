Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA3144B22
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L9-00057s-13; Wed, 22 Jan 2020 05:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5KY-00068H-5J
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:18 +0000
X-Inumbo-ID: 00880570-3cbb-11ea-8e9a-bc764e2007e4
Received: from mail-yw1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00880570-3cbb-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:45 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id 10so2496052ywv.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCAEHgmNOOtTuwUhIt9PF8FGTWKA+YilE4KRvaoUNK8=;
 b=emC00jKcXEC+lCouE7NcmJ3lJluUJkp1VfUxI4HBRBHzXhAc88U/72l5sOMrJF0UFm
 nNVcfpPJ+M2jO8m7SocLOot2UR3e/gnTGTECl+la8StZXXdX7AUL5wKZv3drDHAG6CHM
 Ta55i5q43HTwXUrDQqLZknV7T8uZq+L3y1xFVkLuxhXAKxgZYwvLk7S2lLjIBeGEKZA+
 e7nClNUbIX/yghDwsVvBa5S4/0WCH6rOpKbFGwnD1a65qTX3VO9zD/BdtEs1CgH/rys4
 VI7GoC7GS6AfIyADqfjq3o8eboCkJpLitUM/hnOF1M//MsUd1g4Dd9gcrcYKmeKfwlgw
 2eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCAEHgmNOOtTuwUhIt9PF8FGTWKA+YilE4KRvaoUNK8=;
 b=RZCCx9iMy4JZjzxO6/p/835bOugCqOG/sIwav91lyVVvjoctJExdPmutAKiLmn9yHj
 QK8TEk3JZwi3WC0IFoar8R8PVUEoxZv+Qzu/s0TUrSXkco9pWDh73xtVDc4+DXPmYEd9
 1qVYjKazejvhN0lqd29GezW23o3ws5mxc9kOABIju/xzKcJQThpRFRvSTpR5UekQgGm2
 SsV8PLf+HZuMlnDzXk95dF/xwVmuTdFE9mWAbYhcK7RkPYeRNTlyR9M+I/R3NeNUUqva
 jDrYtUbioNmeW6HaqsrH9J06YIdLA6DsqlRVBw4O8rBcUQA4dq3TjRXq7RHUPG7ZR9pm
 xV3Q==
X-Gm-Message-State: APjAAAXEdpnTaVRskENFx2/cZx4rNPfuj0xxjvtw8nvp06lhj/89ytPG
 +j9MXF9lR+Rej+tMRFVUTQjJiR64da02Jw==
X-Google-Smtp-Source: APXvYqwn8djD4kwWrpsXysHVF56nPLxbCs75z9Vpmct+sTQOFKyKsWgIZHqBSjnmLONfCmSIbZ6IQg==
X-Received: by 2002:a81:5305:: with SMTP id h5mr5708001ywb.31.1579658444808;
 Tue, 21 Jan 2020 18:00:44 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:44 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:49 -0600
Message-Id: <c163a3078044cf63fe665aeb3afece616e9d7605.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 10/23] riscv: Add domctl.c
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
IHhlbi9hcmNoL3Jpc2N2L2RvbWN0bC5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvZG9tY3RsLmMKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9yaXNjdi9kb21jdGwuYyBiL3hlbi9hcmNoL3Jpc2N2L2RvbWN0bC5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRiYmQ0ZTc0MGQKLS0tIC9kZXYvbnVsbAorKysgYi94
ZW4vYXJjaC9yaXNjdi9kb21jdGwuYwpAQCAtMCwwICsxLDUzIEBACisvKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCisgKiBBcmNoLXNwZWNpZmljIGRvbWN0bC5jCisgKgorICogQ29weXJpZ2h0IChjKSAy
MDEyLCBDaXRyaXggU3lzdGVtcworICovCisKKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KKyNpbmNs
dWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+CisjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgorI2lu
Y2x1ZGUgPHhlbi9pb2NhcC5oPgorI2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4v
bW0uaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KKyNp
bmNsdWRlIDx4c20veHNtLmg+CisjaW5jbHVkZSA8cHVibGljL2RvbWN0bC5oPgorCit2b2lkIGFy
Y2hfZ2V0X2RvbWFpbl9pbmZvKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8gKmluZm8pCit7Cisg
ICAgaW5mby0+ZmxhZ3MgfD0gWEVOX0RPTUlORl9oYXA7Cit9CisKK2xvbmcgYXJjaF9kb19kb21j
dGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAg
ICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3Rs
KQoreworICAgIC8qIFRPRE8gKi8KKworICAgIHN3aXRjaCAoIGRvbWN0bC0+Y21kICkgeworICAg
IGNhc2UgWEVOX0RPTUNUTF9jYWNoZWZsdXNoOgorICAgIGNhc2UgWEVOX0RPTUNUTF9iaW5kX3B0
X2lycToKKyAgICBjYXNlIFhFTl9ET01DVExfdW5iaW5kX3B0X2lycToKKyAgICBjYXNlIFhFTl9E
T01DVExfZGlzYWJsZV9taWdyYXRlOgorICAgIGNhc2UgWEVOX0RPTUNUTF92dWFydF9vcDoKKyAg
ICBkZWZhdWx0OgorICAgICAgICByZXR1cm4gMDsKKyAgICB9Cit9CisKK3ZvaWQgYXJjaF9nZXRf
aW5mb19ndWVzdChzdHJ1Y3QgdmNwdSAqdiwgdmNwdV9ndWVzdF9jb250ZXh0X3UgYykKK3sKKyAg
ICAvKiBUT0RPICovCit9CisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisg
KiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdpZHRo
OiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwotLSAKMi4yNS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
