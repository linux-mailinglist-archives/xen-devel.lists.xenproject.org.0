Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9361B52B8F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119699.1464996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbk-000803-D8; Thu, 11 Sep 2025 08:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119699.1464996; Thu, 11 Sep 2025 08:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbk-0007wZ-8j; Thu, 11 Sep 2025 08:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1119699;
 Thu, 11 Sep 2025 08:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUFa=3W=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uwcbi-0007Fi-VF
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:24:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38985a8-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:24:41 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso453389a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:24:41 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33b4d63sm699314a12.23.2025.09.11.01.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 01:24:40 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c38985a8-8ee8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757579081; x=1758183881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl9F9GdCq3XbjB4Z6CoXc+8IbHjldBrhiMbyobpL14w=;
        b=fr0h3FTIxmM+G4o1dmsolkSZje1J3/tPXvZSITkGeUfjrysK9MAyPT3w73nLqejlbx
         XM2fylkZk++4QwjkJvHMxfUFcUursUBbQZnzWOhKvASB0O4HVQsK2pVx1w4wudg2oKMO
         mMOF4VY9NW42zlWRo0Ink9O6nl2wPtNZBMUlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579081; x=1758183881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hl9F9GdCq3XbjB4Z6CoXc+8IbHjldBrhiMbyobpL14w=;
        b=dabbcyCveCATqLHkCr9t+Hi49Pa/NoSWXnciMFjHMK4gYeBo4E5t/n1wWKPWdscWxo
         XAbqoE3/0S5ArCw9VdwuakMifElu+aBmftDo8La6SsAu3nstfVXWwCHFHhMrdpJBYQMT
         QdTb9z1XOiFQCOwFFeuTXV2vYjaRJkcKkgwqufhhNj3x2ihbYk6ahZYyxE9eOLSsQIa/
         hLF83vuhUVX8WnaZ1h1uglJE/CiZmfvBv44IEM8duDreOWYsOoZardwdR9oyUvYYXkhv
         CFa7UZZfthNrxzgLXvwhjdF1IafW+EvZurHvprfW4cmC7Dv1+EsQhcSBTXkhjY8JBxlJ
         01QQ==
X-Gm-Message-State: AOJu0YxY28lulxA3ZuIqd4W9vo/LrZkvc9/yTuNQ2YrqGDMERmqDELIm
	TX+29L4rLBfS4MICVz5T6iHi3/2+ehfudjeE+QwHjnzgJhAPLqeL3ZJQdRo85HG13V4PAJ6Q7kR
	ewPQm
X-Gm-Gg: ASbGncsFVJMNShJnssiaMfJLnC1S9CV9h1BbRL4kdhj2ZKqYM6avuqr5+FKSt5kO3vB
	skSqKfiazWtEiJU97rDYQuoHhKIPJrW803CA/o8Hdo3r242D7wrQ5WUmzRyifK5ovb2XQGE7i3q
	w+cCdc1QwFmP/QOfT/UF8Z2IQPl5Y6EeyzyFBbQ9r2PVmYm5S6MKCrpqF1y/Ea7LK0IPX8014Rv
	+WSeqsICs1QvRalQ6z6M4vSuDfLRh4rC8MyfuBUU462Az4ZjUGK9vvKetSHxtV/YeUW7pahfequ
	pJ215mUwO1FjpmGn+hHwq1+VSrmbAoPECCf9VhECOzC8Hn1Z19yBKeRvbtLa+Dv+8Vl5zd238JY
	UxtrmO43xyXGdqFuAsnmEcR090GL47B1cPeXxPKWxsgTszw==
X-Google-Smtp-Source: AGHT+IEKYdGW49F1QRWZFaaOhXYtDEMXUm2DU7DUuF8lWq0D1h9ghowYA5zkYThRoQSb4KytgD1/BQ==
X-Received: by 2002:a05:6402:5049:b0:61c:e99d:fdef with SMTP id 4fb4d7f45d1cf-62372bbf6cdmr15573109a12.2.1757579080505;
        Thu, 11 Sep 2025 01:24:40 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] efi: Limit Shim's Verify success to EFI_SUCCESS
Date: Thu, 11 Sep 2025 08:24:29 +0000
Message-ID: <20fa42c198ab257085a49e157a2d0e58a0010393.1757519202.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757519202.git.gerald.elder-vass@cloud.com>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 59a1d6d3ea1e replaced the Verify status check with
!EFI_ERROR(...), this changed the behaviour to consider any warnings
(EFI_WARN_) to be considered a successful verification.

This commit reverts that behaviour change.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/efi/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ca162db0d8d3..36e1e2cf9d4a 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1090,7 +1090,7 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
     if ( !verified &&
          !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
                                            (void **)&shim_lock)) &&
-         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )
+         shim_lock->Verify(kernel.ptr, kernel.size) == EFI_SUCCESS )
         verified = true;
 
     if ( !verified )
-- 
2.47.3


