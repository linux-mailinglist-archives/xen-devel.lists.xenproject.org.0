Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28FB10F9A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056341.1424557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiw-0007hL-8L; Thu, 24 Jul 2025 16:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056341.1424557; Thu, 24 Jul 2025 16:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyiw-0007fu-4n; Thu, 24 Jul 2025 16:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1056341;
 Thu, 24 Jul 2025 16:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSid=2F=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueyiv-0007fi-Bw
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:23:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e6dcf46-68aa-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 18:23:12 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so991692f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:23:12 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2bc8sm2615965f8f.72.2025.07.24.09.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:23:11 -0700 (PDT)
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
X-Inumbo-ID: 7e6dcf46-68aa-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753374191; x=1753978991; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uun/luk5/cSGSP8YsGtXZOVv4JBt2ovY85kfuEP6H8w=;
        b=HSk69h3nSc5w/VaSdAoPG2wC8UmCQiWufwbTq7nbX+kz9JAxc0XscIMA3vtaXyDdg3
         4XX+w6T4/d/8xf0GXz1JvZN5IabYGCF8Ze7k6EoK8BJmt1ePHvBZlVeXbElc/K8mB0sZ
         EEcS5k4ZaLyhh+CIuPhcwp3XWXVjjBBemttvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753374191; x=1753978991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uun/luk5/cSGSP8YsGtXZOVv4JBt2ovY85kfuEP6H8w=;
        b=cquejmQalysQLC018D7zt+mIFMOf42x/n530eyoycNjJEfiXdQQNvTiGM0rLOuOXjH
         SUzKliydTZDVbeQwp3OKA1p6VzHNDYLHbyj/TpLx8Lj8AwQkuN1pLcqsXnaV84l61r89
         OwreIX3x3oy1jaIcgfU2BfZ6MaxrvBoRJiu7eA1jZIleBUe7K25ejHbIqL1/xG9fc57e
         RwqKttHe2v79oRTpnDUlgCV9+ZbUZHqeGmIz9Tbdiyqclo8+knr8N2iHiGTnHvz4yEMU
         oSZt+3549HRvBjkboKVLgAZAGKcZvbd47Oe45U8eurk6VH9xWYemu/O4ukEuI6LQO7KT
         f5mg==
X-Gm-Message-State: AOJu0YxDE1uudhraiwvnHPReRJRkjSRhRmX4mzIOdRv90MO6PwIq/nG6
	/WGlZIeIvMETMYPYaJBpeY3dyOWleQU2ZCpENcZi27Rh1AJ/BGwpJwnJeUjPScG5cKnNAs9I4Ag
	fYQLjP4bU1A==
X-Gm-Gg: ASbGncuHutpTzDvTkmpxHLUFO+diDt78CqFAgorhE/dPw+tLgY8iR9lxI7dadEwMw74
	vy7cwwVuw1PCigKiUgVOUtFcThuK0VurG3OCoZL0pOfUL1VE6Es2iguKA4sSC/oxeKH9DfiQIAN
	2iBmYh3M9mXxg6f+D0yGva595lVuF8was+uqBfA4XLNnT3BwaYOYa5U9Ds0xuyEveElsx9/99Ih
	eh7bXxEDpiLzMAngsW7FJ3ECjNf3Oc/ThL8GqdqO+MIJei4TNvYRi6+8k1utkW9CNPFRUX1cqAp
	TbtGSEzItlSP6EbD/LYk0bpx/5Bdiew50u+oNxbQA45Rex4Lff5Ej71lPTg4Etw4qzPdXLQwGcW
	/sX8K2A+tjdYliJv1h+2tLwWLrwG7Hztu5h4Rdvf/msQbcMoFeK4oreoPX7u61O1XpIGadljVWT
	Pu
X-Google-Smtp-Source: AGHT+IEB3FOMkFyzOZvXzg/9k/fSIun2i+emph0m2UJA63IjeZqMftjkusfIlPnhD2BIzCU2FiZPGA==
X-Received: by 2002:a05:6000:250f:b0:3b7:6429:da6 with SMTP id ffacd0b85a97d-3b768f0690bmr6544029f8f.42.1753374191553;
        Thu, 24 Jul 2025 09:23:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 1/4] xen/cache-col: Remove bogus cast in domain_llc_coloring_free()
Date: Thu, 24 Jul 2025 17:23:03 +0100
Message-Id: <20250724162306.2978741-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using:

  xfree(__va(__pa(d->llc_colors)));

is an extraordinarily expensive way of writing:

  xfree((void *)d->llc_colours);

Combined with the comment indicating that this was intention, the patch should
have been rejected outright.

Correct the type of d->llc_colours by removing the bogus const on it, and
remove the cast when freeing it.

No functional change.

Fixes: 6985aa5e0c3c ("xen: extend domctl interface for cache coloring")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/common/llc-coloring.c | 7 ++-----
 xen/include/xen/sched.h   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index a572f77a098a..bd1f634f0bb8 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -309,11 +309,8 @@ int domain_set_llc_colors(struct domain *d,
 
 void domain_llc_coloring_free(struct domain *d)
 {
-    if ( !llc_coloring_enabled || d->llc_colors == default_colors )
-        return;
-
-    /* free pointer-to-const using __va(__pa()) */
-    xfree(__va(__pa(d->llc_colors)));
+    if ( d->llc_colors != default_colors )
+        xfree(d->llc_colors);
 }
 
 int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7ba..df23411869e6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -649,7 +649,7 @@ struct domain
 
 #ifdef CONFIG_LLC_COLORING
     unsigned int num_llc_colors;
-    const unsigned int *llc_colors;
+    unsigned int *llc_colors;
 #endif
 
     /* Console settings. */
-- 
2.39.5


