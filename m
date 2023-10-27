Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C37D9B4F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 16:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624522.973113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNmt-0003Fd-GW; Fri, 27 Oct 2023 14:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624522.973113; Fri, 27 Oct 2023 14:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNmt-0003Dx-CU; Fri, 27 Oct 2023 14:26:11 +0000
Received: by outflank-mailman (input) for mailman id 624522;
 Fri, 27 Oct 2023 14:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jK+m=GJ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qwNmr-0003Dr-UH
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 14:26:09 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c33dcfc0-74d4-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 16:26:05 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9cb5e0fcso1494402f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 07:26:05 -0700 (PDT)
Received: from localhost.localdomain ([90.243.219.52])
 by smtp.gmail.com with ESMTPSA id
 c8-20020adfef48000000b0031fd849e797sm1854974wrp.105.2023.10.27.07.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 07:26:04 -0700 (PDT)
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
X-Inumbo-ID: c33dcfc0-74d4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698416764; x=1699021564; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Likxx9/XoscccO6ivXBm/dTGgbdygFlPEOIk/gw8kA=;
        b=gcp19p4yq6ON/nfqTcrULmgMArDdVDfTSOqJXqGww5lgBNDsCoVyv2KEV0aWlgs7F4
         Q8IeIjlUbLZYEJUw8m4yrTzadLu++T9zurSbGbk38ekzGB+jhHoj656ucDUEc//M+9eV
         QUHYSq+GXu85sve34Tc/vd7usu7amd9pQ5CHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416764; x=1699021564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Likxx9/XoscccO6ivXBm/dTGgbdygFlPEOIk/gw8kA=;
        b=F21Bdfk2bcd7NRh4Xsahxt/tIg/C0X295h3nlwN/tOZb8Tcu2cFENToevX2c3uH+CE
         JJFVpG1zBwhBJnI8sI45blL7PykDG1AVTjZGF6jsQn+wlyKzRyNt5IAnO+4DrT4uBC8p
         Trh2LCiIcWhOEt5BSs9OMW68nxITbMLv65xaCRtLXjR4MaXRGZ5iQxtxEXEfs3LVNe4j
         1uSrs44A144yat3qmT3iJtXC5MJO4ojRZqMEWrqg3VYo+0R5PmLcUHESUwRWKdGgBdFp
         60iILMm1RUn7/F/GHnbu327MzdnmXLFLG4u43Jf8VYW2QLu9v91nkBZyIHTNNS/GAPA6
         um6w==
X-Gm-Message-State: AOJu0YycqVDZWABMWIHCMb6X45HXHttHCSOCDHatP/sLA5LS7joCLDri
	I0pt/elBYiQIUeG6/x4JzjocYO4B/dT/TwZ/d0I=
X-Google-Smtp-Source: AGHT+IE5gVDU+xs1AVhjUkkVbt3cVi9UMxdBFgKZVoYd7/ePWEZF2Nmyqg2kobyWSjj/sXRBgV289Q==
X-Received: by 2002:adf:ee82:0:b0:32d:a853:af6e with SMTP id b2-20020adfee82000000b0032da853af6emr2351124wro.1.1698416764552;
        Fri, 27 Oct 2023 07:26:04 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH] security-process.pandoc: Statement on issuing XSAs for older versions of Xen
Date: Fri, 27 Oct 2023 15:26:02 +0100
Message-ID: <20231027142602.57037-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We recently had a situation where a security issue was discovered
which only affected versions of Xen out of security support from an
upstream perspective.  However, many downstreams (including XenServer
and SUSE) still had supported products based on the versions affected.

Specify what the security team will do in this situation in the
future.  As always, the goal here is to be fair and helpful, without
adding to the workload of the security team.  Inviting downstreams to
list versions and ranges, as well as expecting them to be involved in
the patch, gives organizations without representation in the security
team the opportunity to decide to engage in the security process.  At
the same time, it puts he onus of determining which products and which
versions might be affected, as well as the core work of creating and
testing a patch, on downstreams.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
The entire security-process.pandoc file can be found here:

https://gitlab.com/xen-project/people/gdunlap/old-governance
---
 security-policy.pandoc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/security-policy.pandoc b/security-policy.pandoc
index 76c25e1..23b6381 100644
--- a/security-policy.pandoc
+++ b/security-policy.pandoc
@@ -30,6 +30,20 @@ Vulnerabilities reported against other Xen Project teams will be handled on a
 best effort basis by the relevant Project Lead together with the Security
 Response Team.
 
+The Xen Project Security Team will issue XSAs, including patches, for
+all upstream versions of the Xen Project Hypervisor currently under
+security support.
+
+It is often the case that downstreams have a longer product support
+lifecycle than upstream Xen provides.  Downstreams are invited to
+inform the security team of the Xen version and support window of
+these products.  If a security issue is discovered which does not
+affect upstream "security supported" versions, but does (or may)
+affect a supported product containing one of these older versions, the
+downstreams will be informed privately.  If at least one of the
+downstreams chooses to participate in the development of a patch, then
+an XSA will be issued according to our normal process.
+
 Specific process
 ----------------
 
-- 
2.42.0


