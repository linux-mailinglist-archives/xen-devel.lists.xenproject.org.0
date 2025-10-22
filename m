Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D9BFC5A4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148158.1480349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPR-0004FU-8L; Wed, 22 Oct 2025 14:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148158.1480349; Wed, 22 Oct 2025 14:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPR-0004Dr-5M; Wed, 22 Oct 2025 14:01:49 +0000
Received: by outflank-mailman (input) for mailman id 1148158;
 Wed, 22 Oct 2025 14:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vj3f=47=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBZPP-0003XH-GU
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:01:47 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a529406c-af4f-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 16:01:45 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so5658263f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:01:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce3e2sm25403441f8f.47.2025.10.22.07.01.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 07:01:44 -0700 (PDT)
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
X-Inumbo-ID: a529406c-af4f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761141705; x=1761746505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLHVl30GjqbT2sNGUrp6u7XODjWGOXYBV9cF9vJVcc4=;
        b=TM92pJ61n1SyIS4H6ljDsqCSfzkbuENXBMiiR5esiC8Q2BpNbAHdWw5AzGgqZng7Hp
         0BTd1BL5mOqrSlPasUhGX2MP+p8ndmO5fiZ6NqPO5Qqr6IP7CVeld8+SokR5VIzEJ3Z7
         LdMONE/soWsbY4BF98Rm8od4+l1K78+yPCotyhK2p0r+Gn4TOQkla0CrtnPtTo+IkR5o
         2PjH1eoeIcNH38e+46fBvFbUMXehBMhn/OrF7tv2AgcBxZ/FRHJRkC5Yzd2TmJm34j00
         A1a+mKvsSydY6e8DqsouFeEgJ/1LXjmOr41j0fBwl1RNmTsafAntet7f8MqRiP+Wy8SR
         Xrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141705; x=1761746505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLHVl30GjqbT2sNGUrp6u7XODjWGOXYBV9cF9vJVcc4=;
        b=en5UFf1YRgMug+pEcOYOTJ5LZmLlw9iFyHnW3M/Afx+Rbz4K39Zz3nrL96rIFXCVfv
         Gbq68MzBN162Ddy5XGVC/fSpnDoc+oRJAWwqSQOrGeRQpxUfebIsPFcmVME4wfCgjHr1
         PDQeaAUhISibo78vPziVl25Cg5r22rkJ4pQBCKrcxuVtdn45X5cN8GJzTgrk2tuGRlg/
         RP+LZX6jR8r3fLFiev2TNVWlIkrJjJAUUicsdstYu9g2m1Op43L3x1+pQUfIM+sVogka
         P3sHJXOyySsudfWMGiITdLi4Njv5thUnAaGZqoQI9C+WZtgT8vQ1sKD6AG3TSyTwimOU
         pNCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0WbH2t/kMll0NE9ULNFTcxYA8foSiU5hfAN8Rev1a0eh7P17/IJ2zI4XVKClFA5ZNlBei0mCcFgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFtcWcs4GwI7zuueSZRnCz64+7KljUiMKWljBQ7nb3eaNo+CRy
	YO86e1LlhtLLSHzyvf0NrkHeb3D/2WTvQd4Ojo+2PJJCMkGqmJPyuiNdGM7yTJuhZEOvtaTrj8O
	80lcspc8=
X-Gm-Gg: ASbGncucK1JwiKMtw3ByWh29bLiaG2TBBob4/tkIrxMhyQgZcmq5S8i3TF2oftvYe0l
	NvYgmYDeykYCBjpsbhh5VSZupseTt54sjkaTgev7nLvG3fmIlHKzZVT50mQTigAnd5AGVBtayKe
	Gm6UHtn/FMvK3MwYPSqnNuKaADq/0NJSIcejhRUc4MSjTH7igaQT6eyYHMwTDHTFlYdPSH3OS3a
	5aWe6R5wTsxV2+k2A26KSiVVU5b7v6YG13Hqou60FPWHiQ9rtDH2P8xcAlPkHqURRf8hYyTZvoA
	d2U0Fqk2HR6fGvv19Gu9aGbz7yuUSer7dF57lRBeu0cPoXaWSW4Vmv9ON3csTVh26+lF8Lnxaoy
	vBLFfTiOZjZ13aZFj9/pBu7uLa5WPn8OtQ0qHOJOHPUiIXCpjzmXbZpj4AdADzJ6fKK91dgLJU4
	7lBwfun0saByY+DCIi0biwXutMc5BmXj70e2uc8GOFBCfl0NTe6XzAj01ecrO2qxFc9UZw3No=
X-Google-Smtp-Source: AGHT+IGHHb6FmERd2aST6drwPR4rAF24ZKe8dRavWtQqwCKBMgkph9S4iRBPtxPC9PIdkKTi8zgAlA==
X-Received: by 2002:a05:6000:420f:b0:428:51b2:18b4 with SMTP id ffacd0b85a97d-42851b22910mr3947461f8f.29.1761141705142;
        Wed, 22 Oct 2025 07:01:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] hw/xen: Replace target_ulong by agnostic target_long_bits()
Date: Wed, 22 Oct 2025 16:01:12 +0200
Message-ID: <20251022140114.72372-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022140114.72372-1-philmd@linaro.org>
References: <20251022140114.72372-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both are equivalent:

  target_long_bits()

  sizeof(target_u?long) * BITS_PER_BYTE

Prefer the former which is target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 258014370e1..b40ae0b3af0 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -2,8 +2,8 @@
 #include "qemu/units.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
-#include "exec/target_long.h"
 #include "exec/target_page.h"
 #include "trace.h"
 
@@ -455,7 +455,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
                        req->addr, req->data, req->count, req->size);
 
     if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
+            (req_size_bits < target_long_bits())) {
         req->data &= MAKE_64BIT_MASK(0, req_size_bits);
     }
 
-- 
2.51.0


