Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CC918375
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749009.1156988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9z-00015x-6S; Wed, 26 Jun 2024 13:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749009.1156988; Wed, 26 Jun 2024 13:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9z-000147-0m; Wed, 26 Jun 2024 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 749009;
 Wed, 26 Jun 2024 13:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9x-0000af-BC
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:05 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ab3aff0-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:03 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-795a4fde8bfso396633185a.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:03 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:01 -0700 (PDT)
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
X-Inumbo-ID: 1ab3aff0-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410282; x=1720015082; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtQlCgHMpYyj0NMMsQz5bXaCF8IMRtA28KklQoqKVVg=;
        b=gQu7JENtQR7tLTo8nv1XDdlszKteOr5Q2PJpoTFLCBOoJ5H6KldOIYWJ60JApkUtbS
         ihiGsYKev5a0jQ1F5l1I5rm1kOW4OkrBB4aCW8T7xLo1R80oRZzjkc0JyZ3DyF8+FA3m
         SMLTqY3MozFYRQZYmCpLDjFRvlVdZurzuOLe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410282; x=1720015082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtQlCgHMpYyj0NMMsQz5bXaCF8IMRtA28KklQoqKVVg=;
        b=A6rAIet/mvMb6gLafCcTK6Abio2bQnGb8X23GOIsARwpTWIoBDAlHezwMy/BbdX1UL
         rxmakdOnBfkNynLX+4mZXEpvyiKkf1gC2rYmGnr+wSY/hinCZnEUIHdNCqq4llWyMxpo
         1zk3LiQ2xu3vpdEcbFzv247ZLzXAdzlFZiOpKGWs3XhSFrktN8svgtjRsfjoY9KP0KYS
         D2TKAwk0W9Ncq+Nz0ZZTAJOF0slPfn7BPMT9r1ax5U0bJ70ExPVKgJnl9rQL8cIMnhbn
         FwiVzqfXVS3fziAIVnnAJG2aFMg+k45UxIk04zQM5LYCDnLfg5+YUScFYH5Oz3JPiEkl
         +UBA==
X-Gm-Message-State: AOJu0YwcJg9fccEq+cL5hGM87BbKmWYvVsuFDetXsDhMTU7R4y75S9J9
	0129pEJTpnh8bL4Bvj/sIvnyvYFSpqjm8ysCeL70aRp8B2kEjPzcLfcZe6KzfXJ8nqzbmCM8gtk
	hZ10=
X-Google-Smtp-Source: AGHT+IF+gxCgdyj9i9WXkQO/B9fdFeKeEYEhfT9GWGoCYkvEYPhcPyStk9Q1P/c1vDx6AEp+n33aqw==
X-Received: by 2002:a05:620a:2494:b0:79d:5943:15ee with SMTP id af79cd13be357-79d59431889mr16196485a.60.1719410281882;
        Wed, 26 Jun 2024 06:58:01 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 02/14] x86/cpu-policy: HACK Disable PCID when nested virt is enabled
Date: Wed, 26 Jun 2024 14:38:41 +0100
Message-Id: <20240626133853.4150731-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-nested HVM code knows how to provide PCID functionality
(non-zero values in the lower 12 bits of CR3 when running in 64-bit
mode), but the nested code doesn't.  If the L2 decides to use the PCID
functionality, the L0 will fail the next L1 VMENTRY.

Long term we definitely want to enable this feature, but for now, just
hide it from guests when nested HVM is enabled.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/cpu-policy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index d3ba177dac..91281b44b0 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -916,6 +916,7 @@ void recalculate_cpuid_policy(struct domain *d)
              * hosts.
              */
             fs[FEATURESET_ead] = max_fs[FEATURESET_ead];
+            __clear_bit(X86_FEATURE_PCID, max_fs);
         }
     }
 
-- 
2.25.1


