Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F99F4F03
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859298.1271421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZG4-0006et-LA; Tue, 17 Dec 2024 15:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859298.1271421; Tue, 17 Dec 2024 15:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZG4-0006c8-Hy; Tue, 17 Dec 2024 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 859298;
 Tue, 17 Dec 2024 15:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ1q=TK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tNZG3-0006c0-Lz
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:13:11 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1ff820-bc89-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 16:13:08 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so4266115f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:13:08 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8060582sm11225037f8f.93.2024.12.17.07.13.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Dec 2024 07:13:07 -0800 (PST)
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
X-Inumbo-ID: 6c1ff820-bc89-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734448388; x=1735053188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhjwbb2cLaV8+g7K6eWDoGH3jLVsHMMck+CiKHhGFfc=;
        b=M9ctBrWjCHNsfOMZGep3NeEhxYv8ZsgHGr3SCmg0ou+pcBpyZUV5I4OGz5L+pcbvah
         I+ppmYJk3SrgOWylhNGkONOdPXDoGk8zsHEeLmhmsHT8evWHVHmd0Su42uu7wZNoXSDh
         J0KrTQGeOXf2LHoU1O6GLJpKdqx9bbeqCooc3yOyDPYQp7LolPKcOnynsEtlCtePFQfE
         8OULWa3EbEcOyRe+mcU+wm2T2DiQ5CQqJYqfDnp8Arh0gSP496hLMZf6w/CnHL/y5zn1
         gB6pKj/9kcb4XZPUamDfHCmVOL2+WgjRJA6OqCvESfrATLivrN5zkTSUmZxxV+71IPT5
         o+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448388; x=1735053188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhjwbb2cLaV8+g7K6eWDoGH3jLVsHMMck+CiKHhGFfc=;
        b=n5kzvF3qP7tq9Aua+Dr8o96vQkC4G7/b8GZu3mgdnnjGhwE0KUA2rJXzxDfDKzOKv+
         90qiCsHSkIEVkojlmc1Ty1tA02HMyy8RTifYjefZmVJcjL+yZNua5z0+wvRnp9p4yIjL
         +OKJdUK8qZPO3NLKSOyO9EM7ZXuQyIyegBDcFYiQqn8GPPxGDcD1KgxpTYfqCE12/euK
         oLuG0L/6qV/W5W0PvG2b8CzoeNWSzcPJAKIDvKzTcssS0OmvMmmgCuCCKOm7K7P+wQF9
         o1H7WZUXIEuoFISRAMkD4sMLT/U/3Hals/S5iywrQLAW4atSThW9Gpo6m60wYh2Ic1gn
         k/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUCPJ7X04JyKWZZL+FhX01ayJBnInqHu05Kten13vWWqUB3LrwAqX25nr97DLhemf/W7qfSYyZdwz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw08kvCue4VCf7abTA1pX+W7dQWCIRRVUd5Z5nR2yr96f57Z6RB
	ypdxVJE8rY0y2Mc6IRtxLjG2i2eIhyAeR3WdQOzV5KEdDgOKe4/s7OHdacUW2yU=
X-Gm-Gg: ASbGnctwnlEO6rUlK4kDHpaMIVO1wY3VcLElqDzC0CSyb+YebyMlDqXDeog7djyT69o
	M/mKRJ/G9CvxD1LMtbEYmwEAWe99rcBwvQhNC2QzPMZHVIICuTXYrxxcndwq0k7aHWDUYLOoUVp
	7yMTr6FeAxOfOPpk6DhxLkP5vllAYql5KPOnN0VG1d2LFBbqxODqJWkq4bOFU9gtyqq83HWWYWP
	gpnTelv8wZt/tywd7GLIjSRHc5RynLZsV6joaNUmutr9cjMqkswZS457gZCiyaMs4hS0MUvd5ne
	U6ii
X-Google-Smtp-Source: AGHT+IGhZvwcrecH/l3tzZxp/9lmRQKKnuH2G+g15sJ2oF8K5YoB0LcEYki3ScgNkajyj1I0/t17Gw==
X-Received: by 2002:adf:e0c6:0:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-388daf909b5mr3090065f8f.0.1734448387783;
        Tue, 17 Dec 2024 07:13:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] include: Cleanups around 'exec/cpu-common.h' header
Date: Tue, 17 Dec 2024 16:13:02 +0100
Message-ID: <20241217151305.29196-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Do not include "exec/cpu-common.h" when we don't need it.

(I plan to merge this series myself).

Philippe Mathieu-Daudé (3):
  hw/xen: Remove unnecessary 'exec/cpu-common.h' header
  system/numa: Remove unnecessary 'exec/cpu-common.h' header
  system/accel-ops: Remove unnecessary 'exec/cpu-common.h' header

 include/hw/xen/xen.h       | 2 --
 include/sysemu/accel-ops.h | 2 +-
 include/sysemu/numa.h      | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.45.2


