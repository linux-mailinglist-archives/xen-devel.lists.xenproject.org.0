Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB967B50034
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 16:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117091.1463324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvziC-0002RH-HE; Tue, 09 Sep 2025 14:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117091.1463324; Tue, 09 Sep 2025 14:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvziC-0002PY-Dj; Tue, 09 Sep 2025 14:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1117091;
 Tue, 09 Sep 2025 14:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wvTB=3U=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvziA-0002LK-VS
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 14:52:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2d87619-8d8c-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 16:52:41 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b02c719a117so1013093366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 07:52:41 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c018f663asm1414898a12.43.2025.09.09.07.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:40 -0700 (PDT)
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
X-Inumbo-ID: a2d87619-8d8c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757429561; x=1758034361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+5tyAGpSMVY5aLl8xVyfpkA4boc1Qj+gZ5ebj+kJ4I=;
        b=WziEMW1zlx2qRyaD1Itzhf5Gf/6NBY/5WX34d2LQAczlN1ytIVKJZUD1VDxOs2xe9v
         xtOwkZucEAU7Rxs/Kmem9ENu/R54JscxIq3LiOpK9VwKS3u/G6AwgcPeONI1pzqaR2xH
         8Di7YcNwCHe6s5OPyInd2XMlB5OxsxTFtydBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429561; x=1758034361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+5tyAGpSMVY5aLl8xVyfpkA4boc1Qj+gZ5ebj+kJ4I=;
        b=MCll7TMkC8hP7QBogtGA+kIIKkjNhxjvBMbXfTiJdhbUpLp9yD5A1G+JJFaQ2DcFUD
         Z25dZXZ8Jnu9PIqmON5qU64NzJzZG8Y/FNccxGBD/Ob47QRkGHc/KtmZIsc4KSxZPvwM
         s7j1uYFs1EV9qP6Tx7cnzgW/zocv+nVtQBNMQD6kdWDzMfTRZNl6PR2aqCQ3jLrN9PQI
         BcGKYbXer0WLIklLh7DNVUlm3qvTUonrRiyUSwv3UeyUwbOEghato+Cf32703BBVd5hp
         eROLmRcH/5hZ4sezTNiRFRxj1LeTSx/zoAwljqcmmWrKIM1Vg1U2b3iPLrHyBdugM5Hg
         MxQw==
X-Gm-Message-State: AOJu0YxX1E5xA0J37BHxkClxq+2NxSU56sNQAuZ89rNnliiBEeYnMEeo
	2vS2dz08x52YMmLK/RbEWD3dfFksPSLR6NUCC2IPUYyjJDAH5AC6KBJGqPu2joTyHNWcTTQPHw5
	yo9Lo
X-Gm-Gg: ASbGncvl31jTy3GQeIqmzfmiHgHpEUW+/nAK1/ASpyQb3g7R+oNKe1A9RWn6nAXgVri
	uavrXT6WdmvQuF06ze7jbsjyVzJOhW39AuiBLptYhJX2tBAorlovOK+oBWMhguj1WS6qtEvrSgx
	8gQcvg4ix46NX20tStSdmJUwuA0SWSbgK9rxBc5gvMmbXyvvT+/nvV9nTtwVWYad5jeKGXUdZRL
	YvCKazojQNklDjr1hJZBwWgAAqRqFrIoKZN9JHk0W3YLOAd94DFkmmheoqhD6nBlykNveEA2WPl
	QrjeFxPqSu5TGF7gc7+n+Lx/pMwplPfaXNg3epuCU6LBoN3VoWOmtcE5qkj9D1Aww/Q2A1+VWcL
	E+8wD0JcMJR3ChMr6Hlf921OgSVoy9By7lBHIAvq8bGqApQ==
X-Google-Smtp-Source: AGHT+IE1i9nuOtbAESvSKCM903/YmGiFwF8LPL7GQNpZp8BSjnKtARKSlSUYmK0Uq8ads8tbVAnA8w==
X-Received: by 2002:a17:907:928e:b0:afe:d62a:f04b with SMTP id a640c23a62f3a-b04b13d017dmr1152983466b.3.1757429560880;
        Tue, 09 Sep 2025 07:52:40 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Subject: [PATCH v5 0/2] efi: Support Shim LoadImage
Date: Tue,  9 Sep 2025 14:52:31 +0000
Message-ID: <cover.1757421999.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support Shim LoadImage protocol but keep Shim Lock for compatibility

https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2029800410
- Saw known unrelated debian-12-x86_64 issue

Gerald Elder-Vass (1):
  efi: Support using Shim's LoadImage protocol

Ross Lagerwall (1):
  efi: Add a function to check if Secure Boot mode is enabled

 xen/common/efi/boot.c    | 87 ++++++++++++++++++++++++++++++++++++----
 xen/common/efi/runtime.c |  1 +
 xen/include/xen/efi.h    |  2 +
 3 files changed, 82 insertions(+), 8 deletions(-)

-- 
2.47.3


