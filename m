Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCE8A1889
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703991.1100055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIP-0000iN-T5; Thu, 11 Apr 2024 15:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703991.1100055; Thu, 11 Apr 2024 15:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIP-0000g3-PR; Thu, 11 Apr 2024 15:25:01 +0000
Received: by outflank-mailman (input) for mailman id 703991;
 Thu, 11 Apr 2024 15:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdS7=LQ=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1ruwIN-0000Mi-SN
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:24:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a462ce-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:24:59 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-417d14c3426so6478195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:24:59 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 jg25-20020a05600ca01900b004169836bf9asm5719725wmb.23.2024.04.11.08.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:24:58 -0700 (PDT)
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
X-Inumbo-ID: a8a462ce-f817-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712849098; x=1713453898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjuqnmWYV0nc4dRzJON3TQC6x9O1cypmz7qzf7KldJU=;
        b=J8e9dd9Qs/jrEfzG3dmy+ej+y6Us7J60Z6w3HCZreJOMKuedN01mB44Pj1xHGxOj7Z
         EvHEAnGP7ZEWoiLcXgVvqcbjMYzkkoJK7x//rYVoC7pM2ytfWFWcXlyH9Evhs+IjuPS3
         mo7XX0lsUQ1cRsU4Rxh/D2s8YIWLabUy2Gfzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712849098; x=1713453898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjuqnmWYV0nc4dRzJON3TQC6x9O1cypmz7qzf7KldJU=;
        b=xDAqtBEzyo9LGQbbrZAFFDednyLIeqQyNlEI/QfJAkJXz6UEO4PK8+iX8mSE2lC2dl
         uqvtHYl4a08alEwRya4IUhjB0E3sLU8799Y14FyyO5Gij7HLCerrq4dkFcERKNumFt7Y
         4mYnXE6LDZOB1WGHR/qgYP8qawCES15dOiBgCqjSGKHq86ICdOXew3WhLJgAPiNYfkJo
         YD7CWU/Y2Mz1Art8A7lySOpg0m9kHI3PLewoyi0f8t0jku6SRkSv06VWIGRAnOu2tCQR
         W6LcOYVZbvhyvX40jGyuckzuDtKir2rlRhXzuHsZXJjqKZVK6fxSDp1ZAqblLOJ835qd
         3aTA==
X-Gm-Message-State: AOJu0YzT9OuRtrnlJFhsZj4aJRLTDjMlo1/cK+wyJVENaAgOAOsiqOpw
	xtQ1lSwRumi7YnXc4y1phQGEQaxmPjMBXwX3MDG6yEAifyi8EjEhG20P/4kA+/9pZDX6AwHjtYJ
	c
X-Google-Smtp-Source: AGHT+IF8OOPAtok9GOT+TbeQfHXvMOoeh4PkWlDFuo7e+puuSsXRp7cXKM8ugkRAh/8/otE2eE1sYw==
X-Received: by 2002:a05:600c:a10:b0:416:731e:4a26 with SMTP id z16-20020a05600c0a1000b00416731e4a26mr84206wmp.38.1712849098668;
        Thu, 11 Apr 2024 08:24:58 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] xen/domctl: Add highest allocated evtchn port to getdomaininfo
Date: Thu, 11 Apr 2024 16:24:10 +0100
Message-Id: <55a9cc8fa53e57f898d05463746cbabda821ce25.1712840924.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712840924.git.matthew.barnes@cloud.com>
References: <cover.1712840924.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For tools such as lsevtchn to enumerate through event channels, they
need an upper bound on the port number.

Add the highest allocated event channel port number for a domain in the
xen_domctl_getdomaininfo struct, and populate it.

The field is added above the padding to avoid implicit padding.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/common/domctl.c         | 1 +
 xen/include/public/domctl.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 43b0b074c3a6..1d1ee17f6f91 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -73,6 +73,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 
     info->domain = d->domain_id;
     info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
+    info->highest_evtchn_port = read_atomic(&d->valid_evtchns);
 
     /*
      * - domain is marked as blocked only if all its vcpus are blocked
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b08..d28d29180c75 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -145,7 +145,8 @@ struct xen_domctl_getdomaininfo {
     xen_domain_handle_t handle;
     uint32_t cpupool;
     uint8_t gpaddr_bits; /* Guest physical address space size. */
-    uint8_t pad2[7];
+    uint8_t pad2[3];
+    evtchn_port_t highest_evtchn_port; /* Highest allocated event channel port. Used for enumeration */
     struct xen_arch_domainconfig arch_config;
 };
 typedef struct xen_domctl_getdomaininfo xen_domctl_getdomaininfo_t;
-- 
2.34.1


