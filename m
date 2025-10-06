Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A358EBBF272
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 22:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138428.1474136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVm-0004t8-Jk; Mon, 06 Oct 2025 20:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138428.1474136; Mon, 06 Oct 2025 20:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVm-0004qz-Fr; Mon, 06 Oct 2025 20:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1138428;
 Mon, 06 Oct 2025 20:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5rVl-0004qo-32
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 20:08:45 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 426e80f1-a2f0-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 22:08:44 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-421851bca51so3592651f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 13:08:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8efffasm22218896f8f.41.2025.10.06.13.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 13:08:42 -0700 (PDT)
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
X-Inumbo-ID: 426e80f1-a2f0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759781323; x=1760386123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmdLZLTzz1CBbgfHGUEdA8ipycTUpVjlqm249FqRXEs=;
        b=F/DLrX+pNCKyGtfo7uH6K1NrKAWXHRkuW+rI4KM3phOIeSo8EWG63pBk/DEWzXg+SH
         evbn34kIu7N3W5kIglnvLVic/fmtKEaFu9sJzJlVVs/6xI8ESUhgoxzWJSkKEWR1JXlt
         dNA4GbD0F9YqgZh8B1pWYWVQylkf6z14lAMds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781323; x=1760386123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmdLZLTzz1CBbgfHGUEdA8ipycTUpVjlqm249FqRXEs=;
        b=qjRA2pbkfwnbe/KObcA5dufoYn4iX2jHbHUIwioRoo1YDfTQSGp8l6Ko1z7zmnnh2o
         icwO5Xt/L+o8S/sS2NfXCg8nDOeS7v4R9SpWS4zntssSwluFxquiCXoR2DoyxE7aRpOS
         O2za97MNV1IZQNDcXtXyoFiKJbSTDDkhGtqNcJcv2ibF4k4MVGSiuNoTSOjcY/795PQl
         JZ1kia6ol3d94ak26T/STS40Bef7dqrzao//WZ6k008NIjNjt3UPGXfLWpidasyVfpLi
         uq3bQ6FkvGWxyjwDdzHOfnPWyJljRLxEBOIcpohiCYcL4Yqa+89Uv4t7YFOtzxUOumCL
         4pgQ==
X-Gm-Message-State: AOJu0YzWaupFE7cybE8mEwgnNsCFwDYUzmAYdVIuUnl76bf7KQoSldwX
	b1hhjffw207BWN7OiGHn+hpG1Sc2Jv9/2zHtSIbUatIWlCli2eef9hbP9Yd4EW+ey1m+HcADGkz
	tHWpbUBMMHvrK
X-Gm-Gg: ASbGncs8XqE+KJ5FNqWfvl9uKONdh1q/gP5PkI46BJWa+oPXJ/0QgBASkdF3tlfkOrm
	enZDwf47/lVzSHOvVpTI8wfPuMy9/jD6TEE4imJ0+k79gpH7hRaCqmCQboYA91YIYiNxRIeEzZC
	h+ZG9Bp9kOCUZI4d/CXKkcQJT36oTesnS8Gdp5/QTIo+j/XgwW3clq06srk4BiKhQgbneMquPF8
	nKlvlb8HbExJ7F4sru/pOTvnp0WSpb8o3mSGs4v27IweZeCMruzZ0Bj4TRxv5ghK1hS/E4yM3ba
	zSdU97tu2LI3rm+FxKTLi4Zw8pM0q7hKHnkpwJkMJzmVYYm2SRIZkHsszDBKdV+bI8+YWgY8bnK
	GJSBh4Umgr1DKy4/qu0oEG1w2xAdpg8hTh/vAMX7GDbtLZ9PlbUIZtEzXqIk/S36/Gelll2uRcG
	sQCSUoDXQdcV48bKbH/81m
X-Google-Smtp-Source: AGHT+IEa9FU0cNdyBG98GeFTdEqPOZOn2Z+97ND5tfU3/q+SrFqRwdP7thQRLqy+5T7AMpI8XvzavA==
X-Received: by 2002:a05:6000:25c4:b0:3d0:b3cc:c1ff with SMTP id ffacd0b85a97d-425671a9b59mr9934634f8f.39.1759781323084;
        Mon, 06 Oct 2025 13:08:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 0/2] Prepare RC1
Date: Mon,  6 Oct 2025 21:08:38 +0100
Message-Id: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  Config.mk: Pin QEMU_UPSTREAM_REVISION
  Update Xen version to 4.21.0-rc1

 Config.mk    |  2 +-
 README       | 10 +++++-----
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: acaecf31ea1d566a20b5ee9c0f1f3cb4ee0ec9c2
-- 
2.39.5


