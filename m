Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ECE645484
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 08:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455950.713626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2okC-0001AR-Bg; Wed, 07 Dec 2022 07:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455950.713626; Wed, 07 Dec 2022 07:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2okC-00017t-81; Wed, 07 Dec 2022 07:21:28 +0000
Received: by outflank-mailman (input) for mailman id 455950;
 Wed, 07 Dec 2022 07:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2okA-000163-UT
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 07:21:27 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1bbead4-75ff-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 08:21:25 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so713081pjo.3
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 23:21:25 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b0016c9e5f291bsm13906758plh.111.2022.12.06.23.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 23:21:23 -0800 (PST)
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
X-Inumbo-ID: c1bbead4-75ff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtyL97ZsTK2W0CUWHc0FlTdX6j6w9VTCHVaWxxe6Vdw=;
        b=WAHJ4J+76Avgpkzbn4uZOEtu5mZKvfgFBpe8VDSNRyUXfSNRPXavp1FBES6j8j6PQ5
         jFiZmanERdeDF/0agF4EB5a9LAN9UO6MTtaTinetQ4Sw2P4RWBC8Xhr/24uluR8+kPbB
         TdIBfdaKUcqhyv2/4GYNRglgLQKCDh7dxJLJUEB2sN82t+1dDHfbULeVU4RsOMxAO/2i
         U0kQgB9nj/K9Etv7b9pZQ0z/prG0uq2+wwd3Ty4GbWcxrLjfhLfu2ls8QsPgM4zNAJh9
         uleKt8b8Pv1WBJYxAXeGl1Rr4shKnedqlVQpHDkxf1wRlizkRgkIzJ/QZxMzxMpH3x90
         Gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtyL97ZsTK2W0CUWHc0FlTdX6j6w9VTCHVaWxxe6Vdw=;
        b=Av5wWTex/NiO5Yt2nWiis5khoDqsa2IHeRHzhZ12JgFh2UPnpVnAJ0IDX38LD5Eb7A
         ILEtEQWKrdZB4JJyaBkR1YS8vc+G4TWopcNnxGpHC7WO0Mynw44PC3IhM7HD5Ig44xRJ
         Vc2tb6EolyC1K0VluOws/nAXhzuBARS0Qzole8PtFgxn3A5LJhD59gUQvPkCWzyy5JJf
         iQu0NN9IMpgkAbkxe0UVVpiq2b7ZSC8iLttTyG6H6TV8lRRyEzIM0Rhb7GhKUcOHayFV
         qXcONyKpD9uUW7jL/5r8I8KF3VYng4Y2EV4Nxh79rS/DM+gviOuPVbDrx2cfc9jjnNxc
         hVQw==
X-Gm-Message-State: ANoB5pkAo9W/iA0XZFcqe8Iqt6TwG2DRRsYTDDE5BvXSagyvEUdbyKQL
	U4+6RUUs4FZvG3VYtdCMWly8JKC2Mcda6tOZ
X-Google-Smtp-Source: AA0mqf6yPkmadsBp2stSGC3yfxws9kC98cJCo0t0jW3TNHyhONu7YaG09jvtPdhwbAxaWfS7KD52xg==
X-Received: by 2002:a17:902:9889:b0:182:e9dd:936d with SMTP id s9-20020a170902988900b00182e9dd936dmr75466284plp.6.1670397684108;
        Tue, 06 Dec 2022 23:21:24 -0800 (PST)
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
Subject: [PATCH V7 3/3] docs: Add documentation for generic virtio devices
Date: Wed,  7 Dec 2022 12:50:44 +0530
Message-Id: <7376c617d457ffd402cd6518a7fd6c71552e9ec8.1670396758.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670396758.git.viresh.kumar@linaro.org>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates xl.cfg man page with details of generic Virtio device
related information.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/man/xl.cfg.5.pod.in | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ec444fb2ba79..2523027ea54c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1585,6 +1585,34 @@ Set maximum height for pointer device.
 
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


