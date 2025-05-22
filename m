Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5AAC1233
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 19:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994479.1377455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qZ-0003bh-VW; Thu, 22 May 2025 17:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994479.1377455; Thu, 22 May 2025 17:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qZ-0003Zp-QP; Thu, 22 May 2025 17:36:47 +0000
Received: by outflank-mailman (input) for mailman id 994479;
 Thu, 22 May 2025 17:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI9qY-0003ZZ-8x
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 17:36:46 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53f4af67-3733-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 19:36:44 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad560321ed9so697422266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:36:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm1116063366b.103.2025.05.22.10.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 10:36:42 -0700 (PDT)
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
X-Inumbo-ID: 53f4af67-3733-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747935403; x=1748540203; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jlg5b00ly6v1BGwroJTag38z3lVLNHAEgODPbkiybR4=;
        b=PA40mZ+iXGCyfKJuxPR5HeF5mr7PqriuEydxJxyAVGZMG0wVyDTY1MblDgb3Ju0QXf
         Uv+BGtvZe1bbUSQPK1NcZCENaMu9qgs8B5+62Fnwgm2x6NLZXsW9ldSA753qM4QzITgs
         z+KgB17/DSrtZZmTBoRyPdqaIy5+iv5r40xNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935403; x=1748540203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jlg5b00ly6v1BGwroJTag38z3lVLNHAEgODPbkiybR4=;
        b=t/9+BpT4tdJZ5ckSpKnHZ5j2qihkBfC/PIC/fNfsaTPMad5i2jZK+vP7PmiwQDIUCD
         3DhLtmd8XDeKuHT3uGkJacTks3MrPA4H7EjkmE48ElZWA5JpS/pWU54EXgJ3fMTPjKhF
         ovqVdnr0ZPbyu6elvvffiMy9CtiQnurluoUvZ7pcu/Bk/jUp/9LCjsSLfZ+g01Jh9AdD
         zVvJLCDSpG/E1ZBXHsrm3dcyiZBmJoLAkDjZCXeUtdSvhQL0frp5TvZZP/+yduphGlty
         08H+0qC0k2lQLLkfjckDCFqq3uJWaMd4o61+4uNCJD13hvJNXJfZeKY9yhsfdnikZKpJ
         3erA==
X-Gm-Message-State: AOJu0YxNQglyWhggEczjPUGEwJHZIW8u/Avce92ks7WP8zih+VH+gHgI
	+WtpfZraYrI4xT8/EDfpEUZf6D8k020BT/Qxsj7jlnnci5hKOZmBMOhn2LCtz1bQ5BYPuUI+KFH
	paMa0
X-Gm-Gg: ASbGncuslbWFl9eG7mfPSVW8WPimq0xzqZb2O93LbjWfztLFbHJNwSge5LfVnp5NbXT
	Qy0HOqceZboUx5bZqn2eEVMcDh20TEsdNo1/0zrG/dcu8HmpBDlX3OAY0vXYvDdtDJMuJy8B+dw
	qZwtuPLWBWs/6qbguxJSprevNBDCAeY554EwTyljFoYhHIDpYCImUALbX9gA0oU1n4Zzc6wPYj3
	A3EneTM7BUPoFgOev44hEgNyHA1JFoILQ4JbvZzjsanWUKFwNf7O8eTqxoG1ribIu8XdkUBKSBs
	QvTS7QlOJGAtFKIfnlPG0mKn97OxWpDU2kT3RviCISAiolF15AsAPqvtcSUD1+2Iusudu2JmZdW
	zxpCt3aGwDFkQj3gFTRezDsRWff07uk7YdBM=
X-Google-Smtp-Source: AGHT+IExHm8o6ocEIwcqqG1QAc876IpnGu3pGCbDYf6FWjYf0RjbIdp+0NSXlrhcL76QSN0VnUrJWg==
X-Received: by 2002:a17:906:ef0d:b0:ad5:a0e3:dab1 with SMTP id a640c23a62f3a-ad5a0e3db0cmr813415966b.35.1747935403216;
        Thu, 22 May 2025 10:36:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/3] CI: Improve domU handling
Date: Thu, 22 May 2025 18:36:37 +0100
Message-Id: <20250522173640.575452-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A follow-up to an RFC patch on the initrd handling improvements, this time
non-RFC.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1831808006

Andrew Cooper (3):
  CI/qubes: Deduplicate the handling of ${dom0_check}
  CI: Use bash arrays to simplfy dom0 rootfs construction
  CI: Adjust how domU is packaged in dom0

 automation/scripts/qubes-x86-64.sh            | 39 ++++++++++++-------
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 32 +++++++++------
 2 files changed, 46 insertions(+), 25 deletions(-)


base-commit: 7ab4b392b78b5ac1c7a1fb1d085637526e67521a
-- 
2.39.5


