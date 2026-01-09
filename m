Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFDD0A58B
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198779.1515606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCNZ-0007Xg-H7; Fri, 09 Jan 2026 13:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198779.1515606; Fri, 09 Jan 2026 13:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCNZ-0007VP-EO; Fri, 09 Jan 2026 13:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1198779;
 Fri, 09 Jan 2026 13:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfgE=7O=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1veCNY-0007TV-ME
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:18:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51a27c7-ed5d-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 14:18:10 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso31256745e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 05:18:10 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm220118875e9.1.2026.01.09.05.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 05:18:09 -0800 (PST)
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
X-Inumbo-ID: a51a27c7-ed5d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767964690; x=1768569490; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kl0mcpss+Yj4Rz2fFKzFGghxaUBOVqZE+VeCnWQvcfk=;
        b=Vcwx4iAsIS2X2+v1F2fIB98uGghLlfUfw/BF0wXMONF/ER+RzN3XE3Ebe0Kql+VlV5
         j5rxm1eco8Vjn2VFg0E+eQUXnivvTkXYYnE67UMyJwiPUyTYTDmi24zvmvlLCA+B4vWI
         hAgkmUofxPcWDOe0Wz2GZdN9OhUebfCPolwtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964690; x=1768569490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl0mcpss+Yj4Rz2fFKzFGghxaUBOVqZE+VeCnWQvcfk=;
        b=QEH/+UMYrfg6VHj9ZNfauWbkGUBbpQPON4sBEDOx4bp3QcPCOkD0tm6+hXBkjEvcGe
         LrSthNWW4AYBPBsNJKqC8Glt3jjc247AGF99bDjQ7iQnkXReFSvHrqHO+qbOUh5FHNMj
         L/42xuWFzIwRLtnMDoYv7k3iSEX+tXJ/GtEen5KFsk8yHEm9w+jt8ivgjDfDsvcELtQg
         Cjcy62kwKqoQthDDIMrauGOoyZLtSpjxXiORFQDZvI212ZGPV0NPHwFIr3By93IhI/XV
         j4+NQMwyQO1gWT9CqLKofUOCUnAgscGUQpEXAQK8CPZE5szMvzdl+9DdbU/VvkPbu896
         d0QQ==
X-Gm-Message-State: AOJu0YwB3pdGHJ+R0C041B+NbEdyOMDboBAxY6AsKZw4SpiwtMVhL7sT
	Ev+wVeh97pCLLhQxt/0BwX9nrXQARP32Z4TscYqyAGw4ZIF7Mlvv4393iHOBi/b962qX5qwqDk1
	6qlxx
X-Gm-Gg: AY/fxX4heGbWVwYXKCIE0qahjC0Z/Hlt9MuwhLM+wrbPPxtnZh+I92NCGDWxG32flWg
	iMJ3Byjmopnicmhkg0oGcj3T6n6cgjFqWqcU5LhOGUX6T/Q9Ot4/OI6FMdU5+c6OXzLVnAncMuj
	9aAMh8DCvzzUGa9XiiGOMOdPsVnGlgm2pNQcNvjpTJ1yP+iOi0QnRinM7HRopOqDBvllcV9b7uT
	837I6/pGZQ1qIex0oqwT8rXkL65SSwmrHAOSKyBjCTRDyOsRSzX/mlaGkakyRBmHx7caKkjz6K+
	PVkXQ3ZFqKhij3mRzVn8qcP+tMleG7lqwv05WNd6AQ7/C4CZrIwvwEqrFM3i6Vs42noX/QPoHDL
	lbKGICkbXj3KrnCM5c4TVqb9lzlfQMKHb+8dCccGoz1CSSKG7NrOy0he/g3xcN/DbNCMgRwR0PS
	qr/EwI/Mb2p73vs05YVmYQxZrhNGdPDvXmKdbwTiFYhGr2laPE6KuLi12gFswxzw==
X-Google-Smtp-Source: AGHT+IEXUKxQNnEmVexB1DU52hvk7oO4A2mDEWWZHwxmA5zZxAy2XWbblqpu5X95eNW3Qo+lEvjcNg==
X-Received: by 2002:a05:600c:190e:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47d84b4099amr111919755e9.33.1767964689909;
        Fri, 09 Jan 2026 05:18:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] MISRA: Extend the R3.1 deviation for URLs to include git://
Date: Fri,  9 Jan 2026 13:18:07 +0000
Message-Id: <20260109131807.860397-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen/drivers/passthrough/arm/ipmmu-vmsa.c contains a git:// URL in a block
comment.  This is also not an example of commented out code, so shouldn't be
considered a R3.1 violation.

Extend the regex to include git://, and swap hyperlink for URL in the
associated documentation to be more precise.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2252341951
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++--
 docs/misra/deviations.rst                        | 4 ++--
 docs/misra/rules.rst                             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 7dee4a488d45..30c323906924 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -58,9 +58,9 @@ removed by the compiler, the resulting slowdown is negligible."
 # Series 3.
 #
 
--doc_begin="Comments starting with '/*' and containing hyperlinks are safe as
+-doc_begin="Comments starting with '/*' and containing URLs are safe as
 they are not instances of commented-out code."
--config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
+-config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*(https?|git)://.*$))"}
 -doc_end
 
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 0d90f5886e7e..17c21537f286 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -117,8 +117,8 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `deliberate` for ECLAIR.
 
    * - R3.1
-     - Comments starting with '/\*' and containing hyperlinks are safe as they
-       are not instances of commented-out code.
+     - Comments starting with '/\*' and containing URLs are safe as they are
+       not instances of commented-out code.
      - Tagged as `safe` for ECLAIR.
 
    * - R5.3
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4e9425188742..b3e929307d51 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -143,7 +143,7 @@ maintainers if you want to suggest a change.
      - Required
      - The character sequences /* and // shall not be used within a
        comment
-     - Comments containing hyperlinks inside C-style block comments are safe
+     - Comments containing URLs inside C-style block comments are safe
 
    * - `Rule 3.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c>`_
      - Required
-- 
2.39.5


