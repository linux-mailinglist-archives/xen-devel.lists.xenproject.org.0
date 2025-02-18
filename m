Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F79A3A2AF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892000.1301029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQi-0004vp-L3; Tue, 18 Feb 2025 16:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892000.1301029; Tue, 18 Feb 2025 16:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQi-0004t6-HT; Tue, 18 Feb 2025 16:26:40 +0000
Received: by outflank-mailman (input) for mailman id 892000;
 Tue, 18 Feb 2025 16:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQh-0004Eu-1q
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff44b29-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:37 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so15158555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:37 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398a44264csm48836645e9.25.2025.02.18.08.26.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:36 -0800 (PST)
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
X-Inumbo-ID: 1ff44b29-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739895996; x=1740500796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmvUlbgMu5QXQdotks4SMqmfKLjL3YMxTV+8+DmV1vQ=;
        b=jTGDLGt2dd80lsvN+Mw5Xl/dFh2qz1sg5AwXP8en6ce5NSCm458C3cPi4Qkepx7KCB
         B+10QLjM7rOYeFsJBTa2WhRHwhJ+4RWW83XOomrYRIom//piUS7I8Z8rtVLN+Zd+OOur
         lG5bzFOp/hq1ZRIWnaJAfZE9qvouSAxJkNnvCRt8KgFK7Ck48ukozTXv4cQ33rW4T4bU
         NaEQ52uMuYJNRQc+zuuPAK4+vFxzhAKNE1C4Hc3V6ufA6BLNOh88hVcydC0MFX0hYBC4
         ZbJGxHLXHBGy28GvdFChqRb1TjYsos+IonNgdKriYhQMbZp9Jqyl2J3utDIkXq9P/ewW
         dnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895996; x=1740500796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmvUlbgMu5QXQdotks4SMqmfKLjL3YMxTV+8+DmV1vQ=;
        b=pqTMfVFN9ZRAB1pP3/gQaj3GC3JjFV1V0VNgF6kUyB2VaT5SBIC713m4riJnyuct5L
         /S69pnyAiXF07diPZQk/OlQ5qBMqs67WlbNDBgLInGgwGG0F8oau/woZxy4oNzlJgRv7
         p6EQ0prOpYCvr8uzmALGLSXOQwx7rpbdMJaliXOEkmCS4DyFKaPQjayOcTYq+WwqXjBq
         NqMnbV3WfIjNwxQfZje9aE05Pf2qPTyz5Ynnow2mrM/V6R7+YY3vWCCVsluutJUKkwE/
         QCnkgnG5eB1gyzFe9tfbaAK9y/7JUbJsnI6lHjT93AW5YQ4lRhDclGr++xRK2PR4X2+F
         U9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNb4OcHLjhaaVxF5JgtBdqAfJSuguVueH0U8i6GK4H2hAwsD6UznYZnwaAMUsuawBPB6Nmbu2DBd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjOdPe6QSNAnQBcllIXz6XIEi0KOhcMkGTGVELzKHCow52cQsp
	yoeL9iU/YOe20X0tX5rvXBPaxXhdtvkyTz0sTYAYeQOxF+OtBADDf+G4g1kcit4=
X-Gm-Gg: ASbGnctvyu/hoFi1AQOyHIlB4VOenPwm7GR5LVjvsWo6/C7DPQt40jArLL7m3VdRW7r
	nf/wwpjJmGUQzqNMFq7G4zlB+5FO1g/PdzdlJV8yjOarNaML6grCefDhs9Wj7++valYW3TJTxfK
	kQ8utWTT1vjwm89QeF4wzSaM5+yIzFV9OoX4im8maKqv59mUZs9iisD9HschL3Bbx1xM7jIEDQG
	ZOLrObLZYa7mr54DE2FoJFXZzYxswkZ35h20xlE7blAxWquQV31tRbD+BvrXo6M7xWZel4VHZ2H
	YkpjUs3TeJaX4Wsjv18XIhwcXF0LaEqF4EPoIErfImTeYYuLz/4x5FxmEd5TFELtRg==
X-Google-Smtp-Source: AGHT+IGDpjA1jMRndJ8zzyh/WqT4n0dcOTmIjm+pFjuPp+1wE2F6F3aH9+wQEgZeB7C8Blu7KKErWQ==
X-Received: by 2002:a05:600c:35c2:b0:439:5a37:814b with SMTP id 5b1f17b1804b1-43999dd216fmr2597845e9.20.1739895996546;
        Tue, 18 Feb 2025 08:26:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 3/8] hw/arm/xen-pvh: Do not allow specifying any CPU type
Date: Tue, 18 Feb 2025 17:26:13 +0100
Message-ID: <20250218162618.46167-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No CPU can be selected by the PHV machine.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xen-pvh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index d1509bd235d..2557d520307 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -53,6 +53,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
     XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = { NULL };
 
     mc->desc = "Xen PVH ARM machine";
 
@@ -75,6 +76,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
      * mc->max_cpus, QEMU will bail out with an error message.
      */
     mc->max_cpus = GUEST_MAX_VCPUS;
+    mc->valid_cpu_types = valid_cpu_types;
 
     /* Xen/ARM does not use buffered IOREQs.  */
     xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
-- 
2.47.1


