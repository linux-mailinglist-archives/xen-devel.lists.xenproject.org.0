Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF21828AAF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 18:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664809.1034936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFY7-0000Y1-VD; Tue, 09 Jan 2024 17:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664809.1034936; Tue, 09 Jan 2024 17:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFY7-0000WQ-PY; Tue, 09 Jan 2024 17:05:59 +0000
Received: by outflank-mailman (input) for mailman id 664809;
 Tue, 09 Jan 2024 17:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNFY5-0000WE-EW
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 17:05:57 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b48abd-af11-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 18:05:55 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-783293278adso114906585a.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 09:05:55 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 dt15-20020a05620a478f00b0077f435ed844sm938738qkb.112.2024.01.09.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:05:52 -0800 (PST)
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
X-Inumbo-ID: 59b48abd-af11-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704819953; x=1705424753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2SwLljorVhWvgkSuH2ZFX21icy4tS63YsP+lvu7tic=;
        b=i6Lfjx9M2hmopdYy4jEjuOuX2LZqaZIYgOgngyMXmpCAhVMh/sS+RUYStKX+NUNBSy
         2OSiYg3Ob+Bsnc/H4gAAPh+m0qh8Gk6sudXwkSbHCzY5OFYH5FY+qmud22G0Ie5YTYJ0
         YYog+jQx0FwnLIUenFkdOc7GirMdLaWVRjfjQBEHSsa9uDqVWNcgyqRteyqWiyfBEChW
         jRI2NbTtx447SGDZz2I9opbWPTkmKgIKInTOpSifAgtMwK42p70QWJbmOxpnyRk3dMK3
         SPOVNKp9d5gdL9Falr7oXaJmyiHRSjvFpo6fWmdtvwyDP8kahhlEUAWbxH/VMLb+DfV0
         HiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704819953; x=1705424753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2SwLljorVhWvgkSuH2ZFX21icy4tS63YsP+lvu7tic=;
        b=tOJ3H9Kgp1QeRTj5+UznFpML656aL+onwi+EJ4juE9iUg6PHsXtn7F0egcNpEi1NYh
         7nn/r1nbfRJ2uSNheKu9BmgixTxwvVlR3BszKTotgQfGsKXsCAsuD2qjmM9qHIySuSIP
         5LClAydSFdSn2piluGZHcixXkgcws2KHCz1brH7BLCKGo9nKxSeWwlbDzN6FLKQ9yaLI
         hZ5BcxQDqVs+aOueSFlABepnyJ1bSpPCxdZ2J6SSIlEDJjiqDU8R/LZaaKSu9Z9iKwnA
         H8pcZ5yqYiX6oekB5nb026+D9H/quX4npIrcKr3f9n336i+JGg5H/RroTUEYhw/9RDKs
         V00g==
X-Gm-Message-State: AOJu0Yye/BSH4hbIe+W0cLyHihdr+AeyzIVRMmGH9Ui5eRLv59HXSgzJ
	8XIxqfBoTFNywyY9+O8BAcNhQtCdGrg=
X-Google-Smtp-Source: AGHT+IFo5XVNKn1BRUlDrYawuzLXG1w6fYgO5McNwSWHOEdOSwOvHMbdZy5okKGy/E2TaPGvXyaf7Q==
X-Received: by 2002:a05:620a:29d5:b0:783:639:39d7 with SMTP id s21-20020a05620a29d500b00783063939d7mr6922552qkp.4.1704819953574;
        Tue, 09 Jan 2024 09:05:53 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] libxl: devd support for QEMU 9pfs
Date: Tue,  9 Jan 2024 12:05:38 -0500
Message-ID: <20240109170540.38239-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches enable xl devd (in a service vm) to launch QEMU to
provide 9pfs backends.

Jason Andryuk (2):
  libxl: Fix segfault in device_model_spawn_outcome
  libxl: devd: Spawn QEMU for 9pfs

 tools/libs/light/libxl_device.c   | 22 ++++++++++++----------
 tools/libs/light/libxl_dm.c       | 15 ++++++++-------
 tools/libs/light/libxl_internal.h |  4 ++--
 3 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.43.0


