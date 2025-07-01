Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B2AF042D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029947.1403690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh42-00014e-Kx; Tue, 01 Jul 2025 19:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029947.1403690; Tue, 01 Jul 2025 19:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh42-0000zv-BU; Tue, 01 Jul 2025 19:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1029947;
 Tue, 01 Jul 2025 19:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh40-0000D0-TH
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:44 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b15acf0-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:43 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4531898b208so2133445e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:43 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:41 -0700 (PDT)
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
X-Inumbo-ID: 3b15acf0-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399682; x=1752004482; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6AiubYcFN2sCZHsUEd0HCaMavYugrJHT3OnsCW0tjY=;
        b=bH2JHAmT/WqXOxohJuPIrqBPa02Qv0X21W9Q70XmRz9fK2/ZO65SWpPSFj+KBolcCB
         NmdezqGCe2LWdrJUQyows1xaoJkLtfF9aY0qkrsJiBmviKkTjp8c6ZNF3t8o86+u2yVQ
         u38SXIXD9spdUQaqA/B+idu1+fhFwgVwXfxc9/cpD0lkkr62Aqr7KTsnAeszh+2aRJzH
         3b73Z4n2wsj3Io84KoPZR5fEdjnD+vaAMrMa8MN7dMXRbdnrDfrL/5Cen9mUfH0lRNT+
         V9pl5MsMcQYIpKEHo4nPhwuM7CLYCdk+atRhbcnihmDHHDtcCI7Bx4+xJffAK05+yi+1
         Fa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399682; x=1752004482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6AiubYcFN2sCZHsUEd0HCaMavYugrJHT3OnsCW0tjY=;
        b=aH9W8bGM9owiu1bIUBgEBuW5Ztnkz4GJdpSjDe0ThkBoXDLp5jEA0EpQa3Ia1fJOSx
         BxIfpuibs30o0N0TROGLoAUtjWeiluiX+xA1ASRUEOEvjWLNb4C4cyznAVt78U9klTJ7
         2Pg+tl398wZsGyJ+OL/8jSO74wQ4M6dQLx4G+LWfm3shzwToOmF+HqwHIjkC+MUq8CcD
         0zTqJejsMbB2lMKSsbSFpGAAAKubtMsXs4/f2A+KVHZTceZ7ZFACYI2rIU5FfDs3NyT3
         Fftbt0H4RhzHTGTSFmPWUVmbv6+Zf1U9Z2Aptq7LUmpZp7m3PGSD492JSEVr7I2USYtT
         feSw==
X-Gm-Message-State: AOJu0YxXQ7HFSUGyjq6eWAINXkw/Eml7MjYnyt4ThYf3kbjo+tCX0MPs
	WhKgMwPEl99ORRHB6cbc3J7OyfabNUEmzICdS14IZXnHDC2VO+IwQQ4b80Qy3A==
X-Gm-Gg: ASbGncseZv/XJhnEZVaLhMsWUW/Gdfgfbd2KO8S3zUYX7mHhNgFTjlThUwLHE5Dm3qX
	AEYfi/c6vJNrUXQbiDnf1faKEmjnxqr5TkINGMZosPqATWKW8nm8cmASKInO7vxMgc58Q5gpfRp
	CVYXTQ5XZFJS9LXl716gyYLxVPigYyB1TVfEhc5pfqW0UUn5tH/5JH5QgibLhJA5jGia4uC2s3W
	9XfuuKykNFs12bO8cs2UtSQBGArcKWy/FWjEFuMYA/+Ejeqmcyf3M/5rMYqmFQGyA17dNTuwsWj
	GWzMa6WLi2IER/6qBfnKyoWe778PUaVkhEmYiJH5SRgy2b6gap2V7d9UWR/kG72W9syNU3aEnOJ
	b3XgGJuCapRozW7x6SeD2tB6TheUFU3ExnyJkcwprf72WtHhxpiTgLcCJ+0fH+w==
X-Google-Smtp-Source: AGHT+IEegKfuB4Xj0TRqvJCfwBJncc6e4FIwc5OZu1nEyaT3hrTI/JjsOpNSM8DPIMue3C0e8imwpQ==
X-Received: by 2002:a05:600c:4e91:b0:453:78fd:1769 with SMTP id 5b1f17b1804b1-454a370c4e2mr1385555e9.4.1751399681824;
        Tue, 01 Jul 2025 12:54:41 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 5/7] tools/libxl: Activate the altp2m_count feature
Date: Tue,  1 Jul 2025 19:54:27 +0000
Message-Id: <fe9353b46632721789abb92b533a2f5364c52033.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index acf7fd9837..75f0d47f97 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -595,6 +595,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .altp2m = {
+                .opts = 0, /* .opts will be set below */
+                .nr = b_info->altp2m_count,
+            },
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
-- 
2.34.1


