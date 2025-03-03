Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FCA4C328
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900364.1308298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cK-0007hZ-Pd; Mon, 03 Mar 2025 14:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900364.1308298; Mon, 03 Mar 2025 14:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6cK-0007ew-Lt; Mon, 03 Mar 2025 14:18:00 +0000
Received: by outflank-mailman (input) for mailman id 900364;
 Mon, 03 Mar 2025 14:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp6cK-0007eo-4o
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:18:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f24b9cb-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:17:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bbc8b7c65so12654585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:17:59 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a5b96sm14550595f8f.29.2025.03.03.06.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:17:58 -0800 (PST)
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
X-Inumbo-ID: 4f24b9cb-f83a-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741011478; x=1741616278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypSk08+aHnwtdeHOMqWqXrHn1qNJpa1wyymfXrKI3Ck=;
        b=eFVa9A5upqKlbn0qMfqiSXROAz945YhZSpSJ2rEK7W9Xn/60uOavrty4djv0jIEz4G
         NC1TuPmRc/Y/wUVja52/jcTqx6ZIsY8RTTXZrFnxMmdE/gv5nvmCaVhQxJPtXncDUvmb
         0dVOx+Ur3xWEg9kpncxfMMincjvk9j4QtGEEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741011478; x=1741616278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypSk08+aHnwtdeHOMqWqXrHn1qNJpa1wyymfXrKI3Ck=;
        b=NFDPDU/UozwJr3D6Mvll9RxO32EAboyQrJsrbJq9dT2sDCBUsi3c9jJAbVmBmj0A3/
         0Hh0KNbqQdXUqvTp0zdmjSdZWlbOuIH82wJbyuC1qdd4UXvraVEDhy2nBNUGiVT+dux7
         Q5LOAplX5+b7+rl5oLh+6fcjRuWf0swJerWRXmPibkBwn8XOkOeRC1bu4GVOGuAx/IrP
         kwaBgElDGuDBxBcTeRE14HkDR82pCAiroJIXbkGDYXY+hVmoIcK0W7kGJSMlQvSjaRbA
         n/pUSGgxwyXKwIBZrrWg6cvGAEcckb0ZKSE/8IDzrAeiM4QW5lsYSYtbZBy0d8HNfvY3
         byVA==
X-Gm-Message-State: AOJu0YxT6ewVJvAECUopomYN2lez8VuNjPkjqr+JWliFtRbzLOyrA8SK
	+3oxuMehrsQcmyoAoI3SXCFowFPNMCEB0gelGGzfqspxtM0NvRaZBEx2k/WjfstVJ565J6YzlcQ
	T
X-Gm-Gg: ASbGncs3LPv95L58l4u7vDw66ox+eAQkdU01TVW/b1v4t9SjcfCqvCgWh9PsCtGxv6Q
	Vklzd90gm/SwsRInI+ePYCzYSZ7GD6uhK0ngAaNfHRIs9Et6h/0ZtFkbrNENI2Ij9m88RJZgmmh
	BUfkR/BGQQRVNU7XOnVCTydZwYdcseubBmJ6zg6kkhdscNgan3MxYr1sHH8sJV/Cm9EePBz0TOo
	vbZG3FDvGFq+S9G7MAnK6aNJy/azpN7fMXLM8w2qFsStVOtoxxBZvYNJRSDeIbV07l6kF8qxcKJ
	2rPbB2EHHUFPS0C6a9dk1zF6kwyYzRGfD99euuHC5wLHSO7pVOwEX+0=
X-Google-Smtp-Source: AGHT+IEo9FDe8ah0+sBuzifdD9+kjC/0RjtrBGwqBvzFcDNhGMA9iZlnL/RAfCAdWcvWLju3pqgL4A==
X-Received: by 2002:a05:6000:118c:b0:390:e2a3:cb5b with SMTP id ffacd0b85a97d-390eca06e2emr10851276f8f.41.1741011478501;
        Mon, 03 Mar 2025 06:17:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] Set release date
Date: Mon,  3 Mar 2025 14:17:52 +0000
Message-Id: <20250303141754.26452-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release paperwork.

Andrew Cooper (2):
  CHANGELOG.md: Set release date for 4.20
  SUPPORT.md: Define support lifetime

 CHANGELOG.md |  2 +-
 SUPPORT.md   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1


