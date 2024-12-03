Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3079E1735
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847517.1262612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6g-0003oN-Dg; Tue, 03 Dec 2024 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847517.1262612; Tue, 03 Dec 2024 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6g-0003lD-A2; Tue, 03 Dec 2024 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 847517;
 Tue, 03 Dec 2024 09:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP6e-0003Be-73
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:08 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10fb037f-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:07 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0be79e7e7so4771954a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:07 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0c8dc9b8asm3868557a12.17.2024.12.03.01.22.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:06 -0800 (PST)
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
X-Inumbo-ID: 10fb037f-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217727; x=1733822527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhfmnQV2U1yeLbQ0YN69JuJChLdIfKrfDAxolXgPuaM=;
        b=NY2YzZpXib/9b46FQvVQ5Pa0ome/80ghyw/L1Emqfl+JAXKlIn78p1aIcwQNgxobhk
         tGfWaGjGcwMltnXFi5H0xspUtgKONh6Z9sCfVvth/fwv3Uc2hUKUi0m4M4G8lf5IwOvX
         X2DrfqG8D5A3eLhYYgyGx86ncpctJiuOFHvrZMRxsAqCJToNtuqx7uSUG2zaZ39Wq8I5
         hAGY18duND5LLbQw8gMmsqhT1HjkjCG5rcgAedOzyKjy6ltocLcvQnFUz57E92DJ2wSk
         jUDKO54J2Iq9zYv0Yyv4rkCc+75U4iW6qyT2wMcl856mSpfIKmBPnYaGh4U4JMHB5a7H
         6yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217727; x=1733822527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhfmnQV2U1yeLbQ0YN69JuJChLdIfKrfDAxolXgPuaM=;
        b=CZ+xjSpH9/MX7XbHeKYbIupPYS9+Jn1cT3zd3jdwMUkZc7ZzBETgESM6lsOsIACy+1
         HVszYRn5sksxXlMdGDb7p1RCypxQ/qhOmd1N1VS/O31+NhRYSr0kZXu5tNqDco9tGUep
         h1G41Ckek7nS14hPHA8Xemb63WBR5Mdx4hPuNjyVzCu2tLfOg+ogwApumV8EmZlo6i2/
         /V4rH1lEPofKIIvFZaCgsq3T1XCJpa4+P+Yk9Z3vNcLY5HrV1A1cEO6Ij+BBConeU2WH
         dSDyFh+mzasn3c6/MaeBV5jXX2MIvl9G26ySmJ63Vop2YT659QtZoqdEwfjGmfYIPjiX
         TNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVotojgVrKTzmmAYxvUK/8U7YFrWkAf1Rs5noBfgH39j/XcOV+HzR0QU1tjsY9IytZ+4fMJEoLKHkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzwc0borwUhKZiCJ7gSHx2fRKdOETD7ye+HId4kILoOcc+ETVTU
	RMkas9vaEjzMZLQ4ezJMEZzxDdqdZj8mLvP/T09a1k+pJCiifSEM3nEyU/OambI=
X-Gm-Gg: ASbGncsJJAU6M5Jt0jZXN/n4UdFU2z5gyOUehi8GWKIqrfR6qVajUy8t5NuoP4W5i8i
	4JwCay3bxP8WYcgtF4obyPXm9e2dycF5Bv+fWQ85e/p4BiBj0zOFP7fDV2/bE38tXFpCFfCM+xw
	NPt3itNUjGErBKitFCrqxnJrcrKzvMZBtHz26n8kQni1egRf/jUDiRK0DGjatJKlXmehpUw5HJ3
	/RkfNQY+auESz3BV377kgLiqYPlY76SsPLdYj2ofdAFnB02t6THSjFwoMKUa02IXmlK/9aE
X-Google-Smtp-Source: AGHT+IExs5Yi7XHHfGv+VoO8nUw6diCtB41A7VJ/kLqxsUAKXSiS5Jv3sEFudcXPJVh9yDPwSljpgA==
X-Received: by 2002:a05:6402:518c:b0:5d0:abb8:799 with SMTP id 4fb4d7f45d1cf-5d10cb4e1ccmr1719770a12.7.1733217727075;
        Tue, 03 Dec 2024 01:22:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/7] tests/functional/test_virtio_gpu: Remove legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:48 +0100
Message-ID: <20241203092153.60590-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
functional tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_virtio_gpu.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_virtio_gpu.py b/tests/functional/test_virtio_gpu.py
index d5027487ac4..cc0ec234861 100755
--- a/tests/functional/test_virtio_gpu.py
+++ b/tests/functional/test_virtio_gpu.py
@@ -61,7 +61,8 @@ def test_virtio_vga_virgl(self):
         self.vm.set_console()
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
-        self.vm.add_args("-machine", "pc,accel=kvm")
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args("-machine", "pc")
         self.vm.add_args("-device", "virtio-vga-gl")
         self.vm.add_args("-display", "egl-headless")
         self.vm.add_args(
@@ -118,10 +119,11 @@ def test_vhost_user_vga_virgl(self):
         )
 
         self.vm.set_console()
+        self.vm.add_args('-accel', 'kvm')
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
-        self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
+        self.vm.add_args("-machine", "pc,memory-backend=mem")
         self.vm.add_args("-chardev", "socket,id=vug,fd=%d" % qemu_sock.fileno())
         self.vm.add_args("-device", "vhost-user-vga,chardev=vug")
         self.vm.add_args("-display", "egl-headless")
-- 
2.45.2


