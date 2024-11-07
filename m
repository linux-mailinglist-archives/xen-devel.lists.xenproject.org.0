Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F659C09D5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831987.1247379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ea-00048r-QY; Thu, 07 Nov 2024 15:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831987.1247379; Thu, 07 Nov 2024 15:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ea-00046M-MS; Thu, 07 Nov 2024 15:15:44 +0000
Received: by outflank-mailman (input) for mailman id 831987;
 Thu, 07 Nov 2024 15:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94EZ-0002r4-PR
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:15:43 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 267592fd-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:15:40 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so1544972a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:15:40 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7f680sm892182a12.35.2024.11.07.07.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:15:39 -0800 (PST)
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
X-Inumbo-ID: 267592fd-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2NzU5MmZkLTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNTQwLjgzMzg4Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992540; x=1731597340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isWwW9X0NWcagZExhydjq1zaUhOWH5R4bKfYKSQjzPQ=;
        b=cwBXLG9/4LpTjizgBSX3Bc4xCDELIeke9QnzusbXcEhLh3xCjJ4I39TNJIZo8H4BIZ
         kTRPnVR8Ipq0KSzZAwSk2JC3iZ81SMRhSmKfdoL9V6kkuzFzuBfyKa3Ck/GqlRuPdcFR
         UZEgnY0UgHhFBCzamZORZSw/XLYGcQ5RhqgZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992540; x=1731597340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isWwW9X0NWcagZExhydjq1zaUhOWH5R4bKfYKSQjzPQ=;
        b=O1BaIZuDZ+QVs1dPFCdZLTWEwtZtDxForZ3JU3+9aPUkZMRYres5+8Gv5U2RHLn/pj
         WMPXaqidRZ4cJO+//704C8xiwpPp+G+ft9IWNtu0ZpNPhwVSiZjl5Qfk2IMhzeUaegVR
         GrkwLR8HsFGWnI/DG6HiMMaWgJltkv0yRm6Fe8cmOTZjWxQo3WIS6opVbGZxoDT+nSsH
         Z8yRpUAsqLb3vgvWQ4Q3tdAI3XhbTuG6EuQyR8DSUf+tdenfIy/geyBajx3PiEd4/6is
         AFr3vo/F0AodUxs9rNXrkhBVFEpET3edlwt/BseE2hSowHEufnZUBUE/r6k0e5KWSQAK
         dM6w==
X-Gm-Message-State: AOJu0YxFV5ahh2to77h/LT5YGcQIFK23JjJFjN0mjmCEYrcAz6evyaQB
	48MvDmb/ar/+K+9XU4uS0S2Hs9dZPwyOw1HvpExYcyKHUiyzKalI979hphiMQbFCTKpIeT5LXzD
	v
X-Google-Smtp-Source: AGHT+IH3O6PHb8bjkcu93G7LpE9tkqRjpgm2ayxjyhVT6hkJH/Mmc8BYk0hy1OIqDB1+t1MocQHAIg==
X-Received: by 2002:a05:6402:2814:b0:5cf:757:f493 with SMTP id 4fb4d7f45d1cf-5cf0757f53dmr836498a12.24.1730992539925;
        Thu, 07 Nov 2024 07:15:39 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/4] create-diff-object: don't include symbols for .livepatch.hooks.* sections
Date: Thu,  7 Nov 2024 16:15:08 +0100
Message-ID: <20241107151509.73621-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107151509.73621-1-roger.pau@citrix.com>
References: <20241107151509.73621-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not all toolchains generate symbols for the .livepatch.hooks.* sections,
neither those symbols are required by the livepatch loading logic in Xen to
find and process the hooks.  Hooks in livepatch payloads are found and
processed based exclusively on section data.

The unconditional attempt to expect each hook serction to have a matching
symbol leads to a segmentation fault in create-diff-object when such symbol is
not present, as the code references a NULL pointer.

Fix this by not attempting to include symbols associated with hook sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index d8a2afbf2774..924059a1842b 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1555,8 +1555,6 @@ static int kpatch_include_hook_elements(struct kpatch_elf *kelf)
 				sym->sec->sym = NULL;
 				/* use section symbol instead */
 				rela->sym = sym->sec->secsym;
-			} else {
-				sec->secsym->include = 1;
 			}
 		}
 	}
-- 
2.46.0


