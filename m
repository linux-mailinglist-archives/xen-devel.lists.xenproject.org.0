Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CE649BBD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459358.717107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fl0-0003ky-FP; Mon, 12 Dec 2022 10:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459358.717107; Mon, 12 Dec 2022 10:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fl0-0003j3-9s; Mon, 12 Dec 2022 10:09:58 +0000
Received: by outflank-mailman (input) for mailman id 459358;
 Mon, 12 Dec 2022 10:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Osd=4K=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p4fky-000356-Tw
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 10:09:57 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20434934-7a05-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 11:09:56 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id u5so11467589pjy.5
 for <xen-devel@lists.xen.org>; Mon, 12 Dec 2022 02:09:56 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 ij28-20020a170902ab5c00b00177faf558b5sm5910850plb.250.2022.12.12.02.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 02:09:54 -0800 (PST)
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
X-Inumbo-ID: 20434934-7a05-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTElSs9N8xx49WAzju81gXq5LYR4Uou2wisGAI9T00k=;
        b=EF3qY8M304UEl9w7u6V5aWCv5LqcgvqRTPu/w8W/MZtkxrpg48T8YoZcjpcHGBTm6R
         BU3h27QIl4sr7ECPDstwiG1buv/p5HfUlrRn/qJr6KtFC5NzPsiN0G+JagQlaiqNKHF6
         K6MmoPervSFTFi5LGLoZLRYTsP1nemMAsxoSVZHxAdrPZwa79MfxFulOXM5exkdd6Wn2
         6VI7bG72g4bBNfvG3CXmFORDF4KGpSBi+MPSkLi5Irh1DKwEEpzQpY3QtbSsXsIhEznn
         jcrbx8di/OECqlHF5oYB1j8YoPEf7GizXoXNHzrF9u6k3T+eDz3U5PmAU28JfY057A9F
         5OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTElSs9N8xx49WAzju81gXq5LYR4Uou2wisGAI9T00k=;
        b=J2HRABVx5nz//mPrAbCLxdbv14RjdqRQgJy9mrcjy8oVkC0T/N0YQVUwKfAlyKN4Vb
         fkbcb5Brk696T2ai2J2L4RZfPJG8fN5sHMQulF+wU5+yAb3IEqq7HSI2ws9fXsJcD1X3
         vfNonsYQ3zW3AM7cP7IviOXXFe/inaAcVB3q4GyM0PsW7siVitjlZl3CNE4kILQcnztG
         FdxWz/rI7Q8ooyzjSenT2bMQdlRKQ6eiLVuTNOn7TdD8pa7Iqv4hJYKOQy96rnzScDmQ
         qKhrJJ0XwadNTN1vuKFMKgf713FJPQHt+zf/KC4wD9cRj6XhVhJhx1ipr905mOD5CbdN
         KWyA==
X-Gm-Message-State: ANoB5pkGxSwJIJvY+LCHm3H/je6bhzXWgWMN/ULNgaNIjFdpIZiaSKRj
	LGfizxjH5A+jERwkYibY1EYZz2jqJskjhAyO
X-Google-Smtp-Source: AA0mqf5Y4o5w8FyCRHm+mENBFXVvZgkuokIgMrpop/Ld1lh/qOOPHnqghmPpyB1ckw7q/lIIe27TPA==
X-Received: by 2002:a17:902:f78f:b0:188:59e2:5f91 with SMTP id q15-20020a170902f78f00b0018859e25f91mr18295517pln.59.1670839794768;
        Mon, 12 Dec 2022 02:09:54 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH V8 3/3] docs: Add documentation for generic virtio devices
Date: Mon, 12 Dec 2022 15:35:55 +0530
Message-Id: <b427a95b2c051ecd12d8342d65a34aa16a1feebd.1670839220.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670839220.git.viresh.kumar@linaro.org>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates xl.cfg man page with details of generic Virtio device
related information.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/man/xl.cfg.5.pod.in | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ec444fb2ba79..024bceeb61b2 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1585,6 +1585,39 @@ Set maximum height for pointer device.
 
 =back
 
+=item B<virtio=[ "VIRTIO_DEVICE_STRING", "VIRTIO_DEVICE_STRING", ...]>
+
+Specifies the Virtio devices to be provided to the guest.
+
+Each B<VIRTIO_DEVICE_STRING> is a comma-separated list of C<KEY=VALUE> settings
+from the following list. As a special case, a single comma is allowed in the
+VALUE of the "type" KEY, where the VALUE is set with "virtio,device<N>".
+
+=over 4
+
+=item B<backend=domain-id>
+
+Specifies the backend domain name or id, defaults to dom0.
+
+=item B<type=STRING>
+
+Specifies the compatible string for the specific Virtio device. The same will be
+written in the Device Tree compatible property of the Virtio device. For
+example, "type=virtio,device22" for the I2C device, whose device-tree binding is
+present here:
+
+L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
+
+For generic virtio devices, where we don't need to set special or compatible
+properties in the Device Tree, the type field must be set to "virtio,device".
+
+=item B<transport=STRING>
+
+Specifies the transport mechanism for the Virtio device, only "mmio" is
+supported for now.
+
+=back
+
 =item B<tee="STRING">
 
 B<Arm only.> Set TEE type for the guest. TEE is a Trusted Execution
-- 
2.31.1.272.g89b43f80a514


