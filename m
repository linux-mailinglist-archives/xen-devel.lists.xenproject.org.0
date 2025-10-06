Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D1BBF276
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 22:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138429.1474141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVm-0004wr-R6; Mon, 06 Oct 2025 20:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138429.1474141; Mon, 06 Oct 2025 20:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5rVm-0004sq-Ns; Mon, 06 Oct 2025 20:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1138429;
 Mon, 06 Oct 2025 20:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5rVl-0004qo-Ln
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 20:08:45 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fa3d8b-a2f0-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 22:08:44 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso3423424f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 13:08:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8efffasm22218896f8f.41.2025.10.06.13.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 13:08:43 -0700 (PDT)
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
X-Inumbo-ID: 42fa3d8b-a2f0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759781324; x=1760386124; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d253A9c3RLUx/fPC095ikzcsQqT4bAkrEIwMa1K25M=;
        b=i8KBFIHdpnnGCrbukgkFEE6M5KRRHBa6519ePZLG349GB5aIq5rcXjCGpxuE5JJH9E
         H/4Dv/dXryX3l2UJkG0pQ4xxLABMmHR8rVYqEt7ONvJaeFn579nerTUp1P0DhuCCv2cm
         UPurKogJsJqvgD5uoaOlxAS2znovJGi1TFxSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781324; x=1760386124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d253A9c3RLUx/fPC095ikzcsQqT4bAkrEIwMa1K25M=;
        b=WEe/U+9H2Fd0UUKkKy9vmOuhroXS710Pd/BSbJmNAuZdQC7wbXciuyrjgl8zSFhGvO
         BGoYhyHPxtmNRhA9LL1ThqDNu1RaJHq8aB4m+WrQYid44jDtbIMlaWx8MIohGfa9UvK2
         YGIqM571VhcJKspTAb3zEqULPKNy2hQ+pj2f4EXhv83J9CfluVs1C1IoH3ZrvuKt0UDd
         uxbQxhgB7eKOareom5U1nQQKs2Tz6BPQnSnuqs42BIkySDdMkeptPUhYnP74GlynAlFj
         JTKqIwu0XtKg0+svC02dAOCTZm8QJfumoXy64JIvgLnDeMv3hRbDRvfQzma4MuUkgVY2
         xR1g==
X-Gm-Message-State: AOJu0YzVy8UeWewGophRu3ww5OL8OYL67pIbiWSVyWRPg4ziUsDORt/A
	fygtg/5k4AO3xq6jcU29I3ZMrY7tcHfZrkXqS4kxLN49LHKB4RHAc5eZrp+T537IcdN6kZE4KYF
	MZ3MM72l7Nchn
X-Gm-Gg: ASbGncsc2xk0zKVBIPqNmV1O99p6JaQfiCH656u8e2YnJdtU1QHDnISLyRYHVRI7sVz
	mH+eP3Zcl15fleNAkVvOel8IzEYt2cHqJ23jjoe0zeeq/tmy804hR1eRe0UBLzQBo74ZttD8q31
	AZh6lWor8Fq1JCauKj4zTnggWmsKwpgwvFO7S7NFjCaxTsehE287SdwZa98gEs7/y5PnkxlmG2Z
	k8sEcHOJ58iZAm3kIeZZGtfDo7RbQKxGT0dyvrzr6+aYVyoUNQVzLW5iSdNiySY5bhZ2t+E5o3+
	cl5LcQRM+jNO02OukRwJNi6pztAYib1Fxx3fMgju0JyIgR1H5C+pEhno4+41Jns3BhVdPb/gs6j
	F8Ln0yWceVRoU1PJmnAZyxpCN/6qdqHppYICyHrVerra7rg8P7WEKnzlMGVJnLwAvVokGWm95/s
	wNB7ORuGPOpSBvAaMotior
X-Google-Smtp-Source: AGHT+IEnuT+yhPiUt/hmTBDvuvCw6j+knUYZm5TIY5Wusou6g0CcLzqf7xJrqtMLVMoHdOO59p6hcw==
X-Received: by 2002:a05:6000:310d:b0:3ec:db87:e88f with SMTP id ffacd0b85a97d-425671c1edamr8348160f8f.58.1759781324107;
        Mon, 06 Oct 2025 13:08:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] Config.mk: Pin QEMU_UPSTREAM_REVISION
Date: Mon,  6 Oct 2025 21:08:39 +0100
Message-Id: <20251006200840.2171113-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 7edbab8efe89..89c7524a3ec8 100644
--- a/Config.mk
+++ b/Config.mk
@@ -205,7 +205,7 @@ OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
 QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_REVISION ?= e064f42c80be6f6ff8c12dcb2a663bdf70f965f6
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= 6732fd42d8eb8d0af9f5eb54aca17f4c250213a8
-- 
2.39.5


