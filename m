Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F104B14218
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 20:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061881.1427481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSmF-0004nM-Nz; Mon, 28 Jul 2025 18:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061881.1427481; Mon, 28 Jul 2025 18:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugSmF-0004lj-Kv; Mon, 28 Jul 2025 18:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1061881;
 Mon, 28 Jul 2025 18:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2D=2J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugSmE-0004ld-W4
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 18:40:47 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa9441d-6be2-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 20:40:46 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55a4e55d3a9so5273682e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 11:40:46 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6339b93csm1368123e87.185.2025.07.28.11.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 11:40:44 -0700 (PDT)
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
X-Inumbo-ID: 5fa9441d-6be2-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753728045; x=1754332845; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhOnYR2vhZ2FxJOn2Sl8Hf7472ZZQmZLQtNs0b8UIjk=;
        b=QBh/NhlMgGqUXzvxcSSDrFvAduJvkmrPe38k3zFABlVxpqpIkkh1eapXIFEJ+4B3iU
         5GnyCbk2Ub60DW2zbRm0cOw8YNu058GRLQK2sTw4qfRu5phkyl/EWGDIMlH64Tgd2Gpw
         uvjtVBmiWvWjqDiK2Xw+gxqSp0b1D3XwFbVGwAE21N6fV7sHO+OpngJgEV9CxrPE+UC3
         6/h6tEy9V56LcCiKVdBqzrNlXt1XKab8sALhqcVZp//tqZPawHCWLzUwJqwtQa+Y3qU5
         OeEuUthQn3XaThi5s7g8rXxfJI7BVR2/i65qgwCLIokB4YlONsLhu8MyQd3Ipg6oy2eF
         10MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753728045; x=1754332845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhOnYR2vhZ2FxJOn2Sl8Hf7472ZZQmZLQtNs0b8UIjk=;
        b=XK0XA2JJE56uPh2mppCbjgzlsNTxxtGtLjIvo4P5S2nPKQ9y41bRGE7CsTar89mp7e
         UHePvAlUhJhhDeEnT6JE6a1scyW99H3NGRpn5dEp0BKXP9xvrwxFStMpWjgbHO8KQh4w
         h0FLPgQnedKjtXgYmhuyvV9QRYQ7cqb6i7OSTa83easKLfPTM8C00ufBCkgrQo3jxWRz
         epNsp0g3Du7zF8p4kHmcOxqqNe6wr+FwXwXM8I1AVDwbdlqLM9Bj0jJDFdOtgPVu7KDy
         IBzhgb2gZRkYXx6iRqmjdibk8rYwNk5/HPQTEnbnb5mxrdbv3SHwjdo7eSMxk/fF3Fza
         thfA==
X-Gm-Message-State: AOJu0YzhHjaBfgqVO+SLa56D+Rw8uKKTofjU7J3Ylg/C7pyboLJ2fPV2
	r17TUjvQ7jYVR3MHbjSdvcik9OMxRAe+Wx3mKgRiAnaKsSACG8u11DsLOaZXRw==
X-Gm-Gg: ASbGnctjQ7nMqlhqXR5xGPX1VccrJVgRfQLSa8K0vf+rRsWY73Ae5xJ9Gm/CW5eZZkD
	HhKtsq0wgPKbLEbl21cxbnA2Q9u/16jd2vAUWehezQQKBLKiao5FSP290hJ14PyJjO3/DT8izPS
	HAwKr2fRmq8LPUESYdprI0hfHt+a1m3Kg2qcy67LfF2QUUX3by/xkO55TO26nS/L1kLoo6iUvfh
	DngFcvf1BXX/3Xb4GwdfQwrBBwiMZNEHHC5q39IO1XpXXS/unWgr9qYS0ZOSGPO25lhgxapvPvQ
	mUy1AgxzB/GGFo8zvZ9zl+QcjY5uvGmSxY73J857xaK9Dj6LCW99DNEYfDuCOfrRxi8Nd/H4lJ3
	bea87yHhKLT+Xfxf6FfMl6L4qJhLw1DSoVk3lU/faFU2+hAX4X4cLom7xEGal2Q==
X-Google-Smtp-Source: AGHT+IE8R+uONtPRsRilZJLQ9A2vaolyRRsj96nMW6jYMI0Dp+B+XyM6Vkp9XudfMWaZUNyWgB99EQ==
X-Received: by 2002:a05:6512:ba5:b0:553:2d93:d31 with SMTP id 2adb3069b0e04-55b5f3fa322mr3312439e87.22.1753728044887;
        Mon, 28 Jul 2025 11:40:44 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/domctl: add domain_lock in XEN_DOMCTL_setvcpucontext
Date: Mon, 28 Jul 2025 21:40:41 +0300
Message-ID: <034559c3324e137285065b12642cbf58b7ab5f58.1753727619.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add domain_{lock,unlock} in the XEN_DOMCTL_setvcpucontext operation
for protecting arch_set_info_guest.

This aligns with the locking pattern used by other operations that
modify vCPU state.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/common/domctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf85..f7bf6f4534 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -392,7 +392,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( ret == 0 )
         {
             domain_pause(d);
+            domain_lock(d);
             ret = arch_set_info_guest(v, c);
+            domain_unlock(d);
             domain_unpause(d);
 
             if ( ret == -ERESTART )
-- 
2.48.1


