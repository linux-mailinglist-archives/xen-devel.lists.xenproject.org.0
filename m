Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35257958948
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780532.1190194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs2-0001aU-7S; Tue, 20 Aug 2024 14:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780532.1190194; Tue, 20 Aug 2024 14:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs2-0001Xr-3T; Tue, 20 Aug 2024 14:30:02 +0000
Received: by outflank-mailman (input) for mailman id 780532;
 Tue, 20 Aug 2024 14:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPs0-0000aG-SY
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:00 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adb5a1ec-5f00-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 16:29:59 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso2793478e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:29:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d41e1a0sm1782218e87.196.2024.08.20.07.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:29:57 -0700 (PDT)
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
X-Inumbo-ID: adb5a1ec-5f00-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164199; x=1724768999; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3FilNtR3ylHjSgCwXgc1/4kLFqGR/asrW9olruIp6U=;
        b=OSJ5Q5IR63wVFpGW3Qi0fgH573k29Nk5TPTriToFD0Yje2sMPNREql/e3dLt4dYJXn
         YKvZJKyGjudUEgiNzWg+USU07QfvwcQ2xRcXlxzoufElt6678fUPEZ78vCkMvbkAkNrs
         MWim7cRFIHoAGMezoz398ofWx7Mw4JSWsWOhvyvsC5Tp8DIbQtVe4aNJPo8ZYhV+okwQ
         4IpZ8rcOlxOePgi71hJao6TJMDf8n2yqCjOOd6x0zqAUgZVKE+Z2Lb5sJqKmM8TFwKp9
         4OWVjT/FQM2wyKDPlNOvcwbugNqM4rY3G9/rosbUg1LMfoNa/4hWds3xhCiyqnAD/W0C
         IAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164199; x=1724768999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3FilNtR3ylHjSgCwXgc1/4kLFqGR/asrW9olruIp6U=;
        b=gqydiQ8eVJqm6AKTBAiE91gsXiaAheroMz6h+HL0raiI6pftHqjXqqDnJdKFwbEqfT
         qVT2UIuQ3jEN1fUhtiFXpJ93rnK0ki5+RXC7Yt6RmUMF3DaK0lLqlw9IHi2VzYSkNKf7
         8L5RuGRqrVlGOV83y9OnThTTJqNkf4RsWTmkrI9VwQCIXmTaH3dXpbdT5J8G3SIs293R
         9lE5jPDUNSKAOzb+szlQdzsqkJfhCeTcM5kDxXfitlV0dTiQxrSsnsYi/g4wo9ta7YdT
         +xsv7x2aF9UvfjRmuGyVRHGprX4J/TqUyLkCACNG2OF8Da4jKSqUoBsJq60bhrwhpX2G
         Qiag==
X-Forwarded-Encrypted: i=1; AJvYcCVRv2L1ScquuuanJW9RfHCJIURQhO3I8qmgxEbAsGAw6v2b74SgBBhYNJuR+uMEC0DiOf30n+ZDaNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLT/4zD7nY9kZT0KEVUj/Ab7fDF6KLXjlfPkB9bzAmZkzma59m
	uKNEqH+8qC1LGKvNrf2/VRteyxdTiNE9W1Ahs6ZlqwxSsR6gXiWF
X-Google-Smtp-Source: AGHT+IGQzw9towbWt3esYv6BylqAAAmG7i8maUZip7BzOASpnZ5frQ70BGwkwxAacACbTLNukHjFrw==
X-Received: by 2002:a05:6512:224c:b0:52e:a008:8f55 with SMTP id 2adb3069b0e04-5331c6dcd38mr9613532e87.41.1724164198100;
        Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/12] hw/arm: xenpvh: Add support for SMP guests
Date: Tue, 20 Aug 2024 16:29:41 +0200
Message-ID: <20240820142949.533381-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add SMP support for Xen PVH ARM guests.
Create ms->smp.max_cpus ioreq servers to handle hotplug.

Note that ms->smp.max_cpus will be passed to us by the
user (Xen tools) set to the guests maxvcpus.

The value in mc->max_cpus is an absolute maximum for the
-smp option and won't be used to setup ioreq servers unless
the user explicitly specifies it with -smp.

If the user doesn't pass -smp on the command-line, smp.cpus
and smp.max_cpus will default to 1.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 5f75cc3779..fda65d0d8d 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
+    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,7 +218,26 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
-    mc->max_cpus = 1;
+
+    /*
+     * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
+     *
+     * 1. If users don't pass any -smp option:
+     *   ms->smp.cpus will default to 1.
+     *   ms->smp.max_cpus will default to 1.
+     *
+     * 2. If users pass -smp X:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will also be set to X.
+     *
+     * 3. If users pass -smp X,maxcpus=Y:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will be set to Y.
+     *
+     * In scenarios 2 and 3, if X or Y are set to something larger than
+     * mc->max_cpus, QEMU will bail out with an error message.
+     */
+    mc->max_cpus = GUEST_MAX_VCPUS;
     mc->default_machine_opts = "accel=xen";
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
-- 
2.43.0


