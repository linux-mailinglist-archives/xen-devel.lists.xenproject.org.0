Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7FA77BBF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934107.1335909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMI-00009p-6B; Tue, 01 Apr 2025 13:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934107.1335909; Tue, 01 Apr 2025 13:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMI-00006q-3O; Tue, 01 Apr 2025 13:08:50 +0000
Received: by outflank-mailman (input) for mailman id 934107;
 Tue, 01 Apr 2025 13:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMF-0008KU-Sl
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:08:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7275c56e-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:08:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso10754572a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:08:47 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5edc17dfe1dsm7009648a12.69.2025.04.01.06.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:46 -0700 (PDT)
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
X-Inumbo-ID: 7275c56e-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512927; x=1744117727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ptGrBuxtEj31Q7M6MgPsMH1aHP2RP83UeWmucEzVyU=;
        b=C6vtzZBGnKO/n0dgmtDMCGVg962H3wjnYye2aLXeWBN7OAd2pAOrzABJ2SKLFIf2tP
         oQUtPGiYGIYF8V1d/GVsonyQNhh9UpAK/upcwx7M6ds8eVPQ0p0+nSznsUVJDgyP1Xxb
         V9z8sNXM2VHdVaGFQNRNvF0iiF7nET4LRa7AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512927; x=1744117727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ptGrBuxtEj31Q7M6MgPsMH1aHP2RP83UeWmucEzVyU=;
        b=F2LTdQ4uUY4R9HmhSihkTdzRiKw1wFehyjWUI6AgtnIuKc1CLpyoUR7WGzBlmJ4CkK
         6oZOrur3dTwpmsdPNyCMt55zPiXlbpVhjLl6wjBH0OSWNpJYcERDx3oENQ/DlThC6+g+
         A2zwttyKWsyDZQR4nWba4lv/GP4vyhbZzXhBMU/D3KeZ7zVx+WUiHKitKJg8m+HB74WJ
         S0/uzv2XlE8DwClqWh8RlQWwKJyLjijDkUwG9oeCPeAfzhRrudgc/natacZjk8poxifi
         0oYZ2n7BYvjUa9ijoRXmngLEB3NJGzAkU5oUpAvE1lok5PsylvLIeVcu6r2fEtqMJqFE
         DDKg==
X-Gm-Message-State: AOJu0YwK4GiS3Yb3uh1wbnDUVazIxf+fcDHgvF0kuBi9W3qeUli+WLrs
	ffW7XK5FlE7vlZhxRww/h2aJfxZf2+8AoMnbebxSHBFXz+AujE5fLZfWJSAD7E+fYvwMJhzPKru
	j
X-Gm-Gg: ASbGncuUM11sNJVEaOO5F0HFbfhFl6yatZIqWeHTLi3D92Jz61paG1KjOQh4I7nCe/x
	zmFf8ZpIngEwPMvyAsEB8q0k0+0g1HOUH1k2Swm0K9bvR4BzopqywOfSfH6sc8QuM+GrtgBBQyO
	530HCdB/leRFvsbLb64dNpkVJlkLDwSctth3gGjPGLIKlgUeiNS30iSXXq3iMMGt+POh+3Q+VsN
	cwhJQKqGAZ70k+ktFPWcj+WiGMmR51tz6sVTJQGJYn6SrflHuOE6ESogWKNmhDZqZQ69LBjphen
	CDRXYw+4XdmSqFQGGGZ5R0InvU1AeGlB5Gc5oP7qRrGY1Tn8ww==
X-Google-Smtp-Source: AGHT+IHEWU/Tdnp6Rgb2HZZhYTozC4Ntsq+w55gYeFC4BgiTnRNz4Ghw0pw6dxqwj1LLsltSzA6ocA==
X-Received: by 2002:a05:6402:2706:b0:5e5:3610:8b7a with SMTP id 4fb4d7f45d1cf-5edfcfe6179mr10612256a12.17.1743512926585;
        Tue, 01 Apr 2025 06:08:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/11] automation/dockers: add to README how to rebuild all containers
Date: Tue,  1 Apr 2025 15:08:30 +0200
Message-ID: <20250401130840.72119-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document in the README how to rebuild all containers.  This is helpful when
populating a local docker registry for testing purposes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/build/README.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/automation/build/README.md b/automation/build/README.md
index ecc898680c91..6c647b1b2a68 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -108,6 +108,13 @@ env CONTAINER_NO_PULL=1 \
 make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
 ```
 
+To rebuild all containers the `all` make target can be used, with or without
+the `PUSH` environment variable:
+
+```
+make -C automation/build all PUSH=1
+```
+
 [BuildKit]: https://docs.docker.com/build/buildkit/
 [registry]: https://gitlab.com/xen-project/xen/container_registry
 [registry help]: https://docs.gitlab.com/ee/user/packages/container_registry/
-- 
2.48.1


