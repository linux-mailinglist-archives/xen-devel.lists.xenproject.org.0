Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4796C3C5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790549.1200365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfc-00012l-HQ; Wed, 04 Sep 2024 16:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790549.1200365; Wed, 04 Sep 2024 16:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfc-00011A-E0; Wed, 04 Sep 2024 16:15:48 +0000
Received: by outflank-mailman (input) for mailman id 790549;
 Wed, 04 Sep 2024 16:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfb-0000I6-G0
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:47 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f18eee98-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:47 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5356bb55224so348894e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:47 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408286b2sm2393762e87.172.2024.09.04.09.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:45 -0700 (PDT)
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
X-Inumbo-ID: f18eee98-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466546; x=1726071346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QaVLnXt0IgeqG1OF+UMCmmf0V+2Gd+nNBZAoCF8K30=;
        b=YuJMezjreqR8JhAYxFCLERe+hktzK7miBRt/IdZsf/8pkz+uQBxbGdcvhiSftmG2KA
         oC5Rtm1YSt4bA8LPD6Uoi88lLOSwVhK6YKSp5wVRANCNHCGM5DwLduw/WfHFYU98caT2
         50xLCe7KgCYUemIbpKrYlgTbduwG2pyM/zw2JxtWnlNuPUL4grZ34YAhgi0sg6j1vENj
         /LyJDlmjwVe861GvS3afPSgGxWmMcizzNzyAlWw/Ct0HZM2/5yij3pnSr52Jb/1iMwmo
         AbXzmHJPD7tNKZ75ei6PkYXjBkaOx0j4wXY4bQMSj2ZjIJT8c5Hsm84dTvrUvqum2O5B
         XmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466546; x=1726071346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QaVLnXt0IgeqG1OF+UMCmmf0V+2Gd+nNBZAoCF8K30=;
        b=jaD3Vd+57MGqaT7U6PdAUa8IpjXV8D9bweedJrXk8qClqCRgkm0uxMzLWhUZPnxhGS
         M2eAsfs/n6LkORS1ke6T2b0Hzwq10CBLN2i0yljUgz8asNtoGA8hO9WD/F9kf78QXMsr
         mzI+Z9wcyqUqxEQ1whNyMkU0/lBYJIaj+PuMvLLJhHedgVIh1frdYMj7eLQLDUu4GJn5
         +VgP/LqayARO/KLCCtywuUe90WKZOZrGJGqNCyQkITj9bBQl+WKbMO2UNKa50IrdYnK0
         dL7j8uaJLAyue52G9NgKMPwQ3B0VJt8Y27c9c6AuUjjgjWKme1B7rXo5Q0dy/MkvDm7T
         Hv3g==
X-Forwarded-Encrypted: i=1; AJvYcCW9R1w1IpqN3Ve+aJ5kBzUlSEwREXI0Cm97JOMiufEuGgbLynm02W3m3YmdvVfL1EYJHpNHF1S8YSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPUVXV62bYsAGsGSRscWZD/Twg4ZKZgB72NxcFfkGKM8usjNmo
	L4AJuXIEONjmlKFLXvJMpc0Ef5j4emc47CL47tOu55dtKjlRrc/v
X-Google-Smtp-Source: AGHT+IEVrMi7SUj3gDc4PnljMDbfUGQS9M6WFx0DSiUFiYCkcinXMFPRnZOAOrty7uworisOgwpFVQ==
X-Received: by 2002:a05:6512:3e08:b0:52f:2ea:499f with SMTP id 2adb3069b0e04-53546b3b1d7mr12943686e87.24.1725466546316;
        Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
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
Subject: [PULL v1 04/12] hw/arm: xenpvh: Add support for SMP guests
Date: Wed,  4 Sep 2024 18:15:28 +0200
Message-ID: <20240904161537.664189-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


