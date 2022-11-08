Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F2620EF3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439977.694042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiV-0007QX-AX; Tue, 08 Nov 2022 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439977.694042; Tue, 08 Nov 2022 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiV-0007NZ-6y; Tue, 08 Nov 2022 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 439977;
 Tue, 08 Nov 2022 11:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDgD=3I=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1osMiT-0006S1-Lx
 for xen-devel@lists.xen.org; Tue, 08 Nov 2022 11:24:29 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e824af50-5f57-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 12:24:29 +0100 (CET)
Received: by mail-pf1-x431.google.com with SMTP id b185so13531509pfb.9
 for <xen-devel@lists.xen.org>; Tue, 08 Nov 2022 03:24:28 -0800 (PST)
Received: from localhost ([122.172.84.80]) by smtp.gmail.com with ESMTPSA id
 n6-20020a170903110600b001865c298588sm6677765plh.258.2022.11.08.03.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:24:27 -0800 (PST)
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
X-Inumbo-ID: e824af50-5f57-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O5etID8pnJ+mOBEfmxIpjayhQN9TbUVsRBMhrbeh44=;
        b=NCjoYqLzGCF5lUfugIxT0rR9KaqTtPk0rXEL13eqJQojws8POkXXPr3CRRkY+y4K3D
         NvIGuyf6Vmk8CWW11agxMhUkscJjnD0m7QvpGJ2zcmBy03sG44IqD8qRKq7MRkNLzIP9
         W4qfed7DoWIqs8fZqy7TfceQPQCTz/OLQ67SfG1XpMTebMzG9FstJKbQHAA3SbS3FTLV
         nsjBwbtZsM7/T+kirM3QtQItPb4B/vwepXaSwjJrU6N1qJUARWP9ca4b/ZaAoQTaeLNf
         OpKPFcX824Vp8As3cl7Pjlm4dXa1zHJM/04u3w/gm/Fb8v001z/FCSPjqvqm7mmdhaDT
         BUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O5etID8pnJ+mOBEfmxIpjayhQN9TbUVsRBMhrbeh44=;
        b=QcUQ6ImpxmnCbjZW5WfYD78M+xTJQ+sW99EPUTxpL9+rZU/5bwMpNqp1a+Lkxj8YXw
         c2y5Oplj/vupckRZrX8Hgi9O2bcpG0PMGAYN/6evyj0p9r6Ew2DlpRUwD/fti9Ut9+qI
         VIA11KF+kobHYgNwgPv/fJZfyE9ilsSlioA97gYdCIxxCJ2cFvW4Cb+emUy5bvYYrD/z
         mVcUOff6NJarwwqmPjfgvQtLKNuJHLwYj02SjMBXZC+s1V9v8pbacnc8VcqnB1UQYFtT
         ymIZ+nXR4qCeD4vrTVmPkmoQpmpJPyr4nepc7/tQUw3Or+rvKJcNddPRPHSigY4yhIiQ
         7p/Q==
X-Gm-Message-State: ACrzQf0Zr7WXT7o6zMg8QfHq9hFUYs8BtyMhpqXBOMtHtVYHJPbgjzzL
	WoecKUcyIZLriGPtkCWu7ZpcdXmiwr5hXA==
X-Google-Smtp-Source: AMsMyM7OwRKvh4arUDf2IMW8MGEbBtDR2PFf/GJH4pH79GdWyFn2gsPOcsdW7kYp833YO+wkRtyIpg==
X-Received: by 2002:a63:4420:0:b0:470:89:8e7c with SMTP id r32-20020a634420000000b0047000898e7cmr31541733pga.150.1667906667403;
        Tue, 08 Nov 2022 03:24:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V6 3/3] docs: Add documentation for generic virtio devices
Date: Tue,  8 Nov 2022 16:54:00 +0530
Message-Id: <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667906228.git.viresh.kumar@linaro.org>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates xl.cfg man page with details of generic Virtio device
related information.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/man/xl.cfg.5.pod.in | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 31e58b73b0c9..1056b03df846 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1585,6 +1585,27 @@ Set maximum height for pointer device.
 
 =back
 
+=item B<virtio=[ "VIRTIO_DEVICE_STRING", "VIRTIO_DEVICE_STRING", ...]>
+
+Specifies the Virtio devices to be provided to the guest.
+
+Each B<VIRTIO_DEVICE_STRING> is a comma-separated list of C<KEY=VALUE>
+settings from the following list:
+
+=over 4
+
+=item B<compatible=STRING>
+
+Specifies the compatible string for the specific Virtio device. The same will be
+written in the Device Tree compatible property of the Virtio device. For
+example, "type=virtio,device22" for the I2C device.
+
+=item B<transport=STRING>
+
+Specifies the transport mechanism for the Virtio device, like "mmio" or "pci".
+
+=back
+
 =item B<tee="STRING">
 
 B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution
-- 
2.31.1.272.g89b43f80a514


