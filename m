Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E165C7FB593
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642824.1002568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIV-0005Fx-Jr; Tue, 28 Nov 2023 09:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642824.1002568; Tue, 28 Nov 2023 09:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uIV-0005At-Fi; Tue, 28 Nov 2023 09:22:27 +0000
Received: by outflank-mailman (input) for mailman id 642824;
 Tue, 28 Nov 2023 09:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uIU-0004tq-C2
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:22:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a472df4c-8dcf-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 10:22:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b4c2ef58aso4187555e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 01:22:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b0040b398f0585sm14323367wms.9.2023.11.28.01.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 01:22:24 -0800 (PST)
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
X-Inumbo-ID: a472df4c-8dcf-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701163345; x=1701768145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nloFbZsR0n5o1gFMfsRypOwTdPPhgWOtMQCBf1lcPX8=;
        b=eX4ePTQEiWinhG61NI8NtbC0pSmWTfp4G1zG3TASMY4PNT4MQ1ybL9nLc6OHVw+NkR
         eBhKvXVKN23VRTwND5PLx9jYXmw43eigkuSu42AvxidIoBkCJnIWP8v01msJ5biTlfaM
         zJz4MaWKjRBSG741CWN9qSyKj3ZlCUh9MGi/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163345; x=1701768145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nloFbZsR0n5o1gFMfsRypOwTdPPhgWOtMQCBf1lcPX8=;
        b=Zu15x3k9uipQ4EdIaNoh4Is5bJnFyzq2FqMWCkPLETuuDkZO5p/yMJTo6v+P6+sqGl
         XuqtNFfBAw3+Ej36fo3qu+SivNAH0ro/+rDNFjzBFtu6QGe3DtBBlmbWNxFFqYrY80Yh
         6petiGvPkwC/WlXtd7RbRYyWbwlV0eglPZw2NXiD5rWvAGLP2WJVQb6DZUk5u/RuF6I+
         x7IpXOXShfyTw01f5oFJOdga3WF5E+ct8XCQ5r+JFrf5HMviJczvNsc1BhcgFfZ1eCGW
         D76Gxry7XxC0Ehh55reXc7PvaUU97i/uO7Kr2rJH47cuSMU12USv9UgrdE2k0ZWUeueT
         lhiw==
X-Gm-Message-State: AOJu0YzlHDp4qza2KReYyR7hZqtPUpZJ5VThXrdrLWz0l8WAvacaOAoG
	sbjgPNRcYZJZNXnig+0RxGprw9pu+pc6/umuOjI=
X-Google-Smtp-Source: AGHT+IG3Eo5ZvV3iidJ+LL4lIRYVlc0WvPm8MgpcybdntPPVgNd0KKSy77sIYN1+0k2yHT3X4/QGCA==
X-Received: by 2002:a05:600c:198a:b0:40b:448b:f711 with SMTP id t10-20020a05600c198a00b0040b448bf711mr4835936wmq.18.1701163345041;
        Tue, 28 Nov 2023 01:22:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] livepatch-build-tools: account for section alignment when calculating function size
Date: Tue, 28 Nov 2023 10:21:52 +0100
Message-ID: <20231128092152.35039-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128092152.35039-1-roger.pau@citrix.com>
References: <20231128092152.35039-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Forcing function section alignment at the compiler level ensures that enough
space is present in the text section so that at least a jump can be encoded in
the old function body to switch to the newly loaded code payload.

Modify create-diff-object to account for any section alignment when calculating
the size of the old function.

When used with a suitable -falign-function compiler parameter on the Xen
hypervisor build this ensures that all functions have enough space to
accommodate for any control flow instructions plus a jump.

Note that while the rounding could be applied to all (text) symbols, it's not
required, as the size is only relevant for functions that are live patched, and
hence only do the rounding when calculating the old (previous) function size.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 common.h             | 2 ++
 create-diff-object.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/common.h b/common.h
index 0d3e5f1dd3b5..5ff9ef6ca8e9 100644
--- a/common.h
+++ b/common.h
@@ -37,6 +37,8 @@ extern char *childobj;
 	list_add_tail(&(_new)->list, (_list)); \
 }
 
+#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+
 enum loglevel {
 	DEBUG,
 	NORMAL
diff --git a/create-diff-object.c b/create-diff-object.c
index d0e14e3a62bb..fed360a9aa68 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -2015,6 +2015,11 @@ static void livepatch_create_patches_sections(struct kpatch_elf *kelf,
 					ERROR("lookup_global_symbol %s",
 					      sym->name);
 			}
+
+			/* Take into account section alignment for padding. */
+			result.size = ROUNDUP(result.size,
+					      sym->sec->sh.sh_addralign);
+
 			log_debug("lookup for %s @ 0x%016lx len %lu\n",
 			          sym->name, result.value, result.size);
 
-- 
2.43.0


