Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEC89DF4F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702500.1097571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWZ-0005L3-KD; Tue, 09 Apr 2024 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702500.1097571; Tue, 09 Apr 2024 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWZ-0005IT-Gf; Tue, 09 Apr 2024 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 702500;
 Tue, 09 Apr 2024 15:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+OA=LO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruDWY-0005IE-6d
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:36:38 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f320c7a1-f686-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 17:36:36 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so959447866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:36:36 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 gs44-20020a1709072d2c00b00a46a3ad035esm5849000ejc.179.2024.04.09.08.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:36:34 -0700 (PDT)
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
X-Inumbo-ID: f320c7a1-f686-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676995; x=1713281795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjXGxf6hN/NI8eCQVoC4arVtcJrr38FNNbbecDYi4BA=;
        b=uCEV9rP1C71cFpzStSsDdPDlK2DyWRU5cg64li2rxI6eUnWlSioqUxJeOXgsRzSYXM
         G2SZsIedhegAxeSigqo6Fd1UX7TwuLZn3EwtCrlym5aQ92e6p8mzL6sjzvLUDen7BQKJ
         UkdSupHn++4ygoPg0pkJYW6P86oUypamPS5pIX9OxQT6TlmZkBYxcsKFhROZw3HhHcHB
         0Zv7k7IvC4IPKqci+2PPefnxCmhw9DEHtNidfucTIbo5RM1KPT1XHxgqKbwDYrHjCPe4
         +WsjU9OXyf8/n7Ly6nnsF1I4g19uho4FQY9s2aRsep0fhphWr24/pJZQsBHBVRNGDB17
         2Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676995; x=1713281795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjXGxf6hN/NI8eCQVoC4arVtcJrr38FNNbbecDYi4BA=;
        b=ffZJLRykxE8BTvyDdGLfuen1MAaoMImLKYXEFsl6+IH7HsAXl7KTTATzKQJirFzMbF
         rSausdCGuLnhr2fWu7fRUnlXQHBoAgDEzDba1ZeZg9Ge77BvI9cvxp9gh5h0nHLvvQYY
         0l+wQzP8VU0vKOc/oG8ze+eIU+8cQAxYgEx9PifLYN22+lI8MS1VkG9ytasinuG04rjI
         Tb/2TV9PzNcNY8ZpB50BPWkabklIIcf0DvXgB0JwralCUzfASSpvgb/OlC6P+bQ6pVMy
         UxfHswIass41SJJ5vHt85qxfP+2LWI4BQwrfixGfgG9/vCixEvTCBKjMbkSSDGnbEh17
         W75Q==
X-Gm-Message-State: AOJu0YyIyKYkeQisDseIUNMwx0R6enSTE08oWeIopupp+6h75h9dOiYq
	JFaS3xaxsiJmUBNIyoyB+1Bpmm90vm5ZmdbNDLGjXDEPgKl4fBsTOMXGspWVxvMgzRzfs06gEYq
	F
X-Google-Smtp-Source: AGHT+IGvB5tGOacB/63jolemEgVxGnqjwji3HeJEdir1nI9YkX9YRmpC6o7pVHrrAzUyBkWr4qE9nQ==
X-Received: by 2002:a17:906:e97:b0:a46:4bd4:df86 with SMTP id p23-20020a1709060e9700b00a464bd4df86mr2874428ejf.3.1712676995231;
        Tue, 09 Apr 2024 08:36:35 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v1 0/5] FF-A notifications
Date: Tue,  9 Apr 2024 17:36:25 +0200
Message-Id: <20240409153630.2026584-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set adds support for FF-A notifications. We only support
global notifications, per vCPU notifications remain unsupported.

The first three patches are further cleanup and can be merged before the
rest if desired.

A physical SGI is used to make Xen aware of pending FF-A notifications. The
physical SGI is selected by the SPMC in the secure world. Since it must not
already be used by Xen the SPMC is in practice forced to donate one of the
secure SGIs, but that's normally not a problem. The SGI handling in Xen is
updated to support registration of handlers for SGIs that aren't statically
assigned, that is, SGI IDs above GIC_SGI_MAX.

Thanks,
Jens

Jens Wiklander (5):
  xen/arm: ffa: refactor ffa_handle_call()
  xen/arm: ffa: use ACCESS_ONCE()
  xen/arm: ffa: simplify ffa_handle_mem_share()
  xen/arm: allow dynamically assigned SGI handlers
  xen/arm: ffa: support notification

 xen/arch/arm/gic.c             |   5 +-
 xen/arch/arm/irq.c             |   7 +-
 xen/arch/arm/tee/Makefile      |   1 +
 xen/arch/arm/tee/ffa.c         |  86 +++++++--
 xen/arch/arm/tee/ffa_notif.c   | 319 +++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h |  71 ++++++++
 xen/arch/arm/tee/ffa_shm.c     |  33 ++--
 7 files changed, 480 insertions(+), 42 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


