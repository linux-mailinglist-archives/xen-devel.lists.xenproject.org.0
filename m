Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC0864B2FC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460392.718310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52Dh-0000X3-Sw; Tue, 13 Dec 2022 10:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460392.718310; Tue, 13 Dec 2022 10:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52Dh-0000TA-Oy; Tue, 13 Dec 2022 10:09:05 +0000
Received: by outflank-mailman (input) for mailman id 460392;
 Tue, 13 Dec 2022 10:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlCu=4L=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p52Df-0008Kk-UF
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 10:09:04 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8300234d-7acd-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 11:04:21 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so2996126pjs.4
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 02:09:03 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 je19-20020a170903265300b00186b3c3e2dasm8022658plb.155.2022.12.13.02.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:09:01 -0800 (PST)
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
X-Inumbo-ID: 8300234d-7acd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7t/bITPAutPCDFaVHnpGALOK3FXJdmGHlDPnk3jI8E=;
        b=T6ILUYBJz8OYkA6h7aQqiHbdX/YufqnqVpUSrm46+PeL+wKskAseHPC9SD1qxUVjUU
         5P8voGXKEmyspxViIvC3nb9bLhzYmy9Iu2fiFJLkC9C6cj1clKZKP2z5wuBNTgztltoP
         HmqQVP5yZhsIRSuVNu72NGAqtaBXoG1UE6AXG5HAfeweGRIs0suXf+SafE2qyAQfSX+X
         /Vu1ZTNxQtHtIS4FM2B1mSStascJbxis73+wlu7qiUX+9LDBOy8zwVAusslltRNnHYQJ
         gFwxWFbkVdsACxyWMaBbRVPqQCxw45xXk1SHs0Mys1vOBICCfgSq9pvV+C/ebAKVxkca
         CS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7t/bITPAutPCDFaVHnpGALOK3FXJdmGHlDPnk3jI8E=;
        b=vCLkqD0IYHRdbbtomKfVsF0NqV7mRBeg+SJ2AFYMlw/PkDgXREQna8yffVRZRKHtMJ
         8Q97I1pMvzC8UseLn2yWtZJHayKGQuoRXgHg+AIZbdGz7jw79vGZQUw2X9ECJUN0WqfG
         h+YsCkdiB9X05EMW87XpSpu7/OXeUNIAv0Zh3dzCUGu+zPcCTly4xP9kBY4hbFj3U+tB
         fNc2VuJMEgXw0bZe3A4kvNFuqLVXGv+OJOPHeQGHO3IjB/TZrTwRue20miGYdd8vp0Xg
         yoYdTEn//Kqpx+S05Qp6g0/02HJj373GOfRmwe1/MCEJyUaGTlCL3YUqyYwL2y2qXnqO
         6CdA==
X-Gm-Message-State: ANoB5pkrX0HPypHpI6lQ7w5EUTGDBwIZ0aRARhD2+N+FVFiHXAKQJE0O
	z6+OvDPqaAnJL8bI+DCrhrBzXWtp9HwDAK4S
X-Google-Smtp-Source: AA0mqf7l+e1nb0jNYgH2yyzVnU1MdvImLWlvmag1vywWbAq22hfdLiuB2CN9FgOjV3n0e+SaULmc3A==
X-Received: by 2002:a17:903:2448:b0:189:f277:3830 with SMTP id l8-20020a170903244800b00189f2773830mr29937549pls.68.1670926141782;
        Tue, 13 Dec 2022 02:09:01 -0800 (PST)
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
Subject: [PATCH V9 3/3] docs: Add documentation for generic virtio devices
Date: Tue, 13 Dec 2022 15:38:48 +0530
Message-Id: <a0eb1c6d571cc3ed9ca7dd71dabe3aba6e69100c.1670925998.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670925998.git.viresh.kumar@linaro.org>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates xl.cfg man page with details of generic Virtio device
related information.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
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


