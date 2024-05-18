Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B88C907D
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724748.1129927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpj-0006jk-Q9; Sat, 18 May 2024 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724748.1129927; Sat, 18 May 2024 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpj-0006cP-KP; Sat, 18 May 2024 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 724748;
 Sat, 18 May 2024 11:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hph-0005yr-ML
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2074f509-1506-11ef-909f-e314d9c70b13;
 Sat, 18 May 2024 13:02:33 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4202959b060so8032425e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:33 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:32 -0700 (PDT)
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
X-Inumbo-ID: 2074f509-1506-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030152; x=1716634952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcXsJFjS9m5+2bzRAoHvtJjIOqkMU5GtwndPgJCwhX4=;
        b=GudoogxHMvdn4w0cqD5eTYm6th1gwGqv4gs9gLQ0mrO/5R7z0FK1O8tgF9pLN2rqYY
         1foSI5c7Su2FqiCj7Ee0xeV76j0alPFhUQS5em1KWrXTjPQBYtet64ycX1U3KiSDpSMQ
         wx4zEUAQSLvTlPSniIpfmTMAmyptDslAAMd+zqdyFkpMYkU8orb5jDGpxZaiEd/IKzzu
         zSdrX8n+I//YEa5P4GsdX20ZzQXaIbUGPzjjgTqYHlZRxavOHzLNX2PiLdafsRnsNkGr
         lRTIHsgj2WhZChYNvB1iQgzK15G5Qw3SSsIxsFc81ai6ps7d5SMyV3LzaLagSuzHixQk
         LWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030152; x=1716634952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcXsJFjS9m5+2bzRAoHvtJjIOqkMU5GtwndPgJCwhX4=;
        b=K+KBs7P3a2cOK3dwrgqjZTICWF5x2Wn5XSy0Wz2iutxak8D6ag18c2cGv2ugsja3VU
         26303llDZR2kjrhaPKCBDpDH84MogP3jqRHx2GSjYcUzJtu4SwNBsYmg9SYtJVTHpoma
         wMK7jMCqXzbVr1mbnyeHT8u/dgPSf/pzFTtMdf6ADVur15QZeF3QG1d2j2l9O5vRZd9d
         A5HmLlWHKsEc+jbbj6aHHXQqgVV9UtMuTVrOKsAwp0uVPM2D2nNw3GkAn5rJ80JuRvJn
         TAqKQ9ILhg4iAtH60P0CC7W1mfnKItkZdB/sfj0TL/v3ADT70J1q0asJz8as2eKhbZu7
         Cctw==
X-Gm-Message-State: AOJu0Yxh1unlnQGp9pTxbTZB2ebDkTBYbkuTEZbzUjLxKkkIp1p5tZND
	xaZ5Ivs8ip8A7sq4lqn15X0bvP57bNS5QZc7ZZO1g0KDlZ9K9sIQNoESXA==
X-Google-Smtp-Source: AGHT+IECOdi8/7PFZQliYUQDOmQMOAewH/Lgc3HHGhX0HkDS8B59my93i6l669Pnaf3F5kA5yxREEQ==
X-Received: by 2002:a05:600c:1f92:b0:420:29dd:84dd with SMTP id 5b1f17b1804b1-42029dd8865mr50068795e9.3.1716030152348;
        Sat, 18 May 2024 04:02:32 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v4 5/6] tools/libxl: Activate the altp2m_count feature
Date: Sat, 18 May 2024 11:02:16 +0000
Message-Id: <b4ed18f65fb1b5d38a5ce4061cd8f4990598167a.1716029860.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716029860.git.w1benny@gmail.com>
References: <cover.1716029860.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/libs/light/libxl_create.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 236b8c1965..f5eb16d0dc 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -657,6 +657,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .nr_altp2m = b_info->altp2m_count,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
--
2.34.1


