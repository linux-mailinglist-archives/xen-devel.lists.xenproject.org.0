Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE9BFC598
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148149.1480329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZP3-0003Zs-PP; Wed, 22 Oct 2025 14:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148149.1480329; Wed, 22 Oct 2025 14:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZP3-0003XO-Md; Wed, 22 Oct 2025 14:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1148149;
 Wed, 22 Oct 2025 14:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vj3f=47=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBZP2-0003XH-0A
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:01:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 951afbcf-af4f-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 16:01:18 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso7519635e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:01:18 -0700 (PDT)
Received: from localhost.localdomain ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a993sm25420329f8f.24.2025.10.22.07.01.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 07:01:17 -0700 (PDT)
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
X-Inumbo-ID: 951afbcf-af4f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761141678; x=1761746478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5zOIT6yyRYMvDGxwuy/M05LXGeT1MKP7CDmxvvly/8=;
        b=JLHzvKSKzz4K2XVNy1AB3Lez06KdE7qdgneRoWkzRx1uM+0roJrZbGXkpe4ThLPCXW
         vKBMrQAoQM2IVyKAd9IxJ8VnrXfJc6pLG8nTEEo1feqUHvCr0h+D3Wjj/KtPa6UuMW/Y
         dNpVAFFd1rVbKwlmPvsFennSxcpDQJoaq5XXpZfGeQ1RHlH333SnfePUUV0i1KrtU29R
         cyKWc9tIyl5MCkODV1EvI5BrTJLClJ7ind6RV0bAQq9wMW/gH1fjBMtn3cae0qonAq05
         pQh4a36rXdYJ6avojxSmCLfyICndFKY9RgNWw9Ull6KEOwakYy3WhGJ72B0Yl8stgSSu
         Qt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141678; x=1761746478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5zOIT6yyRYMvDGxwuy/M05LXGeT1MKP7CDmxvvly/8=;
        b=NuLmtk1nLj3iSpCy2BOGVp8Bg7RcGwbQ3zrTj7QdCIVisNWMmd+ygWn9RjOt9SjjDf
         P6a/aSbD5Gse/OaF2dSLP0FY406NMEUr/RMYiiR17eGsCExDVXN8ZtqUN12cqyQgCMt/
         uEfWE1BXP4H8OZQq4M8An2IX+U+6DLTD8941TtOLs66C2sDUDaP/RQD6X59ruL3jQ8RV
         Ml4RvvhvtXyP2Ou98YsS50scVoNDgO8zN8MzDVy63FKicurSQtQLGJDm19ICNtB7BGBb
         gJtjJje9KKxhow/Gvn3frhq7YLsc6AmORkq7ORfibyruDZeNvqJp/KH7ToJZjBiihS8e
         GN8g==
X-Forwarded-Encrypted: i=1; AJvYcCVgQ/VaZ88u4ZjAy90z+fNEWhqpwog+GSoYTpbkyeeGxMsWnKwoVXrh9SQD/9pGcUFhiWKbdx44mGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdm9cWOnzcfcMPPLl8Nw3qRR250ypSpju8N1NoECtjECBdmIk9
	erJcMgxnxo9wYMHRS3uik6W0YNW4o/qjoXnc+GeH4DgIj7VEdVajRnTQ/LHHfiPQ/2k=
X-Gm-Gg: ASbGnctwv4xUTdsOTN0NyqNVQm5rBUMgqqug/WClGlnO49VS/j/3lpw15RQC1+NVlwY
	KngMfnqt5Cu97YDin2TET0WSyo2xdFDV0kHF3DRTVGx/0fvyHySYLllY2e7j3kGztT/KFcxA9+F
	EiMoiV/wHrheqPKhEhBcGvN3ifjmzTh36PXZwFEdO5kEVS7FBBUtFQEaRMrF2DNxLHyoXUxYOfm
	WOiqzKr0IIy4HDdT7fesZtHiWBbEaE/hksQkY54fCDvsPsmID1Fyb70ijBi+aj2UO4zViNHH+En
	dIcTtctILtgN9t2peU/4es3bHr0Lh1tEzPxFCymfST0Fj2iMBMAf6zMBn/oXMGNH119gzndR5YJ
	NSWU+nH+c+zaRNzfQVWo/afa2RiLDUymAnOdHCPKOa58b+EIjT4GpzDxw3vjIjYs39GgG+yMJ4m
	gFw0mDUfmiMVCyGgCFFIgtFf8md46ufQ==
X-Google-Smtp-Source: AGHT+IHwD6XwUYTEWSIBNXw4avAFhtVwKLSbQflNayMy0B2n1fepXptONBhHDo/sWRqdW80YDOW2Yw==
X-Received: by 2002:a05:600c:8b17:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-475c3fe35f4mr26669155e9.16.1761141678027;
        Wed, 22 Oct 2025 07:01:18 -0700 (PDT)
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
Subject: [PATCH 0/3] hw/xen: Build only once
Date: Wed, 22 Oct 2025 16:01:10 +0200
Message-ID: <20251022140114.72372-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Replace target-specific code to allow building
hw/xen/ files once.

Philippe Mathieu-Daudé (3):
  hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in req_size_bits()
  hw/xen: Replace target_ulong by agnostic target_long_bits()
  hw/xen: Build only once

 hw/xen/xen-hvm-common.c |  9 ++++++---
 hw/xen/meson.build      | 22 +++++++++-------------
 2 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.51.0


