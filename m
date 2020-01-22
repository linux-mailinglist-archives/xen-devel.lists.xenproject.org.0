Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C21144B1E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LA-00058b-9x; Wed, 22 Jan 2020 05:14:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Ks-00069x-5l
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:38 +0000
X-Inumbo-ID: 06637470-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06637470-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:55 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id l5so485320ywd.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/mNPTShwzUyL6jfEMPuwPDxFC1o9ZQmXUBWll6tYVc=;
 b=Hv9cNJ19Kv8HKN2/sU473VBUJmXvNNTROK4GJWQW0BRs76VAEoJ0VgZ1GzTOFxTb6G
 /IQDLewXlVZMWPzE3f70XL3c7Kul7QR6pzMpiD3G0BUiDvce7T5TMxqjuloJgILcRgrM
 yEgFPn9NXbgU4Ptfh8yRYn8BdC+AAJ4MnUUjEp2DfCqCEW3LIB+CantrC5mCw9mFmES/
 I7tXJLqplkxX66Ol1w3L3Q1d88KXaIMhHUgsSnGI2dbb0TXUNJRdWGY2XS1NfG7IKuBA
 MZBzpBgD1PoIUkBN4kj5iabUwKa9EdDcWpAa/3dSnMMAfrdlZATR3wYNgJTc0MtPPZyi
 C0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/mNPTShwzUyL6jfEMPuwPDxFC1o9ZQmXUBWll6tYVc=;
 b=Q5VpO1zrNbpAM8tav/jEbBkqsmzQCv5sP+wenpM5i0W2IbFhI2jqOxaBJ0yzMIhQkw
 TYcqNAuqd3j9U4Ikt+/fp5ofS2eWUUcawMb+0ylhHpjOQtcbyG/HRUuz9GYnsXfLn/b4
 UA5n5K7b9mZZlPFRjf66fNhx1vh3cZJ5K60vHykrMs0+vhKxADuKyKjBu4UA9Nqy7etL
 qLfCbkaxhyuyef4uQus4P9cUiDBjsJTRB8SZFjEQeeklZv1fv+fEarbSsvA6kOWP4/1W
 Kala50kzExOhdCrBARzGpvu0FHVax8YFawPbFZHiP/xOA4IKX3ObkAWqsBrm+EjyQFF7
 u7/w==
X-Gm-Message-State: APjAAAUOGATutjBp756/ItZ22AfZsnE6g0EUTktKXNKSt0h2VlgFvZM1
 VOIA99ImrHzT15P2Evw0WHkwnyK0R2LVlQ==
X-Google-Smtp-Source: APXvYqxBZ1ptf6bIyYqbi3Rk/XJBqgjp/l8qFniRmSKuAbWGyHhFVMNBWQjQMpaNKZxNAvtJ6Iekyw==
X-Received: by 2002:a0d:d712:: with SMTP id z18mr5460714ywd.288.1579658454554; 
 Tue, 21 Jan 2020 18:00:54 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:54 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:53 -0600
Message-Id: <2e92a8a62a1547939e6542bea7587e7aebf57231.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 14/23] riscv: Add shutdown.c
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
IHhlbi9hcmNoL3Jpc2N2L3NodXRkb3duLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L2FyY2gvcmlzY3Yvc2h1dGRvd24uYwoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2L3NodXRk
b3duLmMgYi94ZW4vYXJjaC9yaXNjdi9zaHV0ZG93bi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjkwYWRlOWE1NTUKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC9y
aXNjdi9zaHV0ZG93bi5jCkBAIC0wLDAgKzEsMjQgQEAKKyNpbmNsdWRlIDx4ZW4vY29uc29sZS5o
PgorI2luY2x1ZGUgPHhlbi9jcHUuaD4KKyNpbmNsdWRlIDx4ZW4vZGVsYXkuaD4KKyNpbmNsdWRl
IDx4ZW4vbGliLmg+CisjaW5jbHVkZSA8eGVuL3NtcC5oPgorCit2b2lkIG1hY2hpbmVfaGFsdCh2
b2lkKQoreworICAgIC8qIFRPRE8gKi8KK30KKwordm9pZCBtYWNoaW5lX3Jlc3RhcnQodW5zaWdu
ZWQgaW50IGRlbGF5X21pbGxpc2VjcykKK3sKKyAgICAvKiBUT0RPICovCit9CisKKy8qCisgKiBM
b2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBj
LWJhc2ljLW9mZnNldDogNAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8K
LS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
