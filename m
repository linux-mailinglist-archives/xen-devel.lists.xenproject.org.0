Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC364C378
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461681.719842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBU-0002kP-K5; Wed, 14 Dec 2022 05:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461681.719842; Wed, 14 Dec 2022 05:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KBU-0002hI-GD; Wed, 14 Dec 2022 05:20:00 +0000
Received: by outflank-mailman (input) for mailman id 461681;
 Wed, 14 Dec 2022 05:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5KBT-0001q7-2o
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 05:19:59 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f31f6701-7b6e-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 06:19:58 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so5979963pjp.1
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 21:19:58 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 n15-20020a170902d2cf00b00186b0ac12c5sm792489plc.172.2022.12.13.21.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 21:19:56 -0800 (PST)
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
X-Inumbo-ID: f31f6701-7b6e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIMHWod3nlZXI5RU0uCiLAkBPk1CCoIYR7gbpGQe3bE=;
        b=I2KLF4quE9jLfiKGrHkVnyQVFA+AAPT0vwH+Jt3+Ku+2jgo+tm92L/QRDknTVoncr6
         szAdhhUWE7qhyCJVAZXBgT4QA/6lFJuJ5PAUzDIMeLxyeSw64es3rSrYs4odftUsJXAH
         48M4r19WWUqx4YTXLS8RaGcaiNZUtrpFt/dgKKE8r7a8kHBMet17K0nBcp/GadsfS/Dj
         ViKAbiIINOzMrC3xT3obh9GeY1IgSlF0YznlLqxm2M7PH0to4XVH++xMYYi6XvMlDVJa
         +xekvCrsS35BjnwK8miXspysA5R3V73uLofOyv9f0+ld9h56A0s+7pP6z2UZEsZpn3L/
         rPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIMHWod3nlZXI5RU0uCiLAkBPk1CCoIYR7gbpGQe3bE=;
        b=c0dqXMgJk7xGIWCd8n0wHtWiOk/eJrwV63oqbHN8cYjGWBW/2fXmo47SJsKmsDmpW4
         WYkxqNGO+F6q/iuxuofOpKlIpbRuX8oFXU8sl0ACAI6L9QS5kDYXCuuv0UifpJpXOwMb
         24jf5SVbcEHYCETmbAg6mqWmRZGZf3cDSVG0et/5zv1N+S8nfNVGwS6UZcsAZSt4AKFg
         /HCAlXrUcLHWb7ODiFsRNLFmOQLORCwej9mBiGdVMOy4sZw/TTW5yocROqBKB9/cIOwz
         5goSvQ16nmAT8kGi9nTOfuAKIi5OlHrN0QRqTynlRHeZqL+X6TJMha46MuOm02ltl8bR
         TwPw==
X-Gm-Message-State: ANoB5pnLAVuHeRz71NnHzCpS019f/IBV9tV/x7HbHIEoLiiqnnMYxLcE
	DtzHoNHvhGYZYZWlmC8gjSjbbobMG18JQkeu
X-Google-Smtp-Source: AA0mqf44Zwb8GAsu21BUerAIW1rTTs3xTs7nTZPbVYXwjbZeEN0JomGGYp9AeJ0rEByrUEx++MwdTQ==
X-Received: by 2002:a17:902:c454:b0:189:fba2:3756 with SMTP id m20-20020a170902c45400b00189fba23756mr20937187plm.66.1670995196857;
        Tue, 13 Dec 2022 21:19:56 -0800 (PST)
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
	Wei Liu <wl@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V10 3/3] docs: Add documentation for generic virtio devices
Date: Wed, 14 Dec 2022 10:49:42 +0530
Message-Id: <d24e53a633b3efae690aad6b545a0b0474cd5f85.1670994930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670994930.git.viresh.kumar@linaro.org>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates xl.cfg man page with details of generic Virtio device
related information.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
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


