Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4C7EB4C8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632933.987435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wK1-0002Rl-LC; Tue, 14 Nov 2023 16:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632933.987435; Tue, 14 Nov 2023 16:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wK1-0002P7-Hj; Tue, 14 Nov 2023 16:31:29 +0000
Received: by outflank-mailman (input) for mailman id 632933;
 Tue, 14 Nov 2023 16:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wK0-0002Oz-Hg
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 424f928a-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:31:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9db6cf8309cso858550666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:27 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 m16-20020a1709060d9000b009be14e5cd54sm5785453eji.57.2023.11.14.08.31.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:26 -0800 (PST)
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
X-Inumbo-ID: 424f928a-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979487; x=1700584287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLUIW1wEN60RfjCUyh0wJRK9Kz/EqjAkfQjEh/PTjs0=;
        b=o/X8E6ejyyAcqCQ6tz1jrXstwWCO6Tp2jhqOzycLwphszHIWYh677IHGvvKKO36YBg
         8LyUw54hGJ+4a/lvIGrYuhmTVXbPbmQpD11NX/rknrPj+HxCUWQUk3b29XxL5yv5Csud
         wumGEfjxirpTF48pclBJvEvC5lZPGVDeHNDhW/4St7CUgubYh70VAhjf1AmwlCNKM8bV
         AQYEDlzhs5LhvLfLD5kKN034tVqScCe3I61P4bBBfTEQKOT4e/wD7JOStxjtAB/By60+
         T2kfwwzpOyBnCqoCvX16dmxLuoBORuX/x8Vjd+J8vM8oxKVkITBC3w3DVcvC530BY9O4
         GUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979487; x=1700584287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLUIW1wEN60RfjCUyh0wJRK9Kz/EqjAkfQjEh/PTjs0=;
        b=taXlelYcf7jxUt0sTqtzarynLIo1EJVKAcNjJSd+BFjqMnK2knOT8fFI1nZpCTS5zP
         XI65Cox37p+tqlx8W1aXVLD9qH4a42nzBVec5349Iiau0hPUCfAZ+5iKJz8MKiVWOcVa
         WdumSCtxtVgdQXMz5DK1E2XHI7trHI1Xj2EaUQnGQxJZTC9jii9HLt2P8zf6ENmYaQzF
         ddmdOe1BthCGAyW68h0V+cPRoIbndfc1C37sKGC3jlEHkquP4vU0Z4l5BBNkOIFy/nja
         cctYoYAd3dy9kx7y0GhPOgfBCsUhQ7ua8hkZOFt31zLE/6rfSyKoCmrFxV5UmqDKmdEm
         vkLg==
X-Gm-Message-State: AOJu0YzCdTviRMS+Tq/HeaEsMj/VKsVWcFpjzyUupzw+F4mwJ4586hko
	wXsLgKE+MOakaSY3xTGht/RqpQ==
X-Google-Smtp-Source: AGHT+IEWSkzHY5obRM6zNhXhqu10PReegPajovJZrPBLVpt+fJDzRpOh65h9KSuNBeV+qPZ25y+u/g==
X-Received: by 2002:a17:906:b889:b0:9e0:dcf:17f6 with SMTP id hb9-20020a170906b88900b009e00dcf17f6mr7932359ejb.58.1699979487100;
        Tue, 14 Nov 2023 08:31:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common xen_memory_listener
Date: Tue, 14 Nov 2023 17:31:14 +0100
Message-ID: <20231114163123.74888-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

While looking at Xen target-specific code, I noticed some
generic code used by x86 which is not implemented for ARM.

Maybe ARM machines don't need it, I don't know. But I
wanted to see if I can get this common code target agnostic
and build it once, possibly bringing smth useful to ARM.

The changes don't break CI testing and Avocado local tests.
If this xen_memory_listener feature isn't required for ARM,
I'll send follow up patch that keep this series with common
xen_memory_listener but with a runtime flag to disable.

Patches do the usual "change target-specific API to a
target-agnostic one", in particular using "exec/target_page.h"
at runtime. Then non-x86 code is extracted, then merged to
the generic xen/xen-hvm-common.c.

Thoughts?

Regards,

Phil.

Based-on: <20231114143816.71079-1-philmd@linaro.org>

Philippe Mathieu-Daudé (9):
  hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
  hw/xen/hvm: Propagate page_mask to a pair of functions
  hw/xen/hvm: Get target page size at runtime
  hw/xen/hvm: Expose xen_memory_listener declaration
  hw/xen/hvm: Expose xen_read_physmap() prototype
  hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
  hw/xen/hvm: Extract common code to xen-hvm-common.c
  hw/xen/hvm: Merge xen-hvm-common.c files
  hw/xen/hvm: Inline xen_arch_set_memory()

 include/hw/xen/xen-hvm-common.h |   5 +-
 hw/arm/xen_arm.c                |  24 --
 hw/i386/xen/xen-hvm.c           | 441 +----------------------------
 hw/xen/xen-hvm-common.c         | 474 +++++++++++++++++++++++++++++++-
 stubs/xen-hw-stub.c             |   4 -
 5 files changed, 468 insertions(+), 480 deletions(-)

-- 
2.41.0


