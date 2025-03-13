Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E5A5F9FA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912509.1318775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY0-0000Ec-5w; Thu, 13 Mar 2025 15:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912509.1318775; Thu, 13 Mar 2025 15:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY0-0000CR-1D; Thu, 13 Mar 2025 15:32:36 +0000
Received: by outflank-mailman (input) for mailman id 912509;
 Thu, 13 Mar 2025 15:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXx-0007tP-QN
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:33 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61b9e35e-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:32:32 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso1920581a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e81692e64asm825684a12.4.2025.03.13.08.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:31 -0700 (PDT)
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
X-Inumbo-ID: 61b9e35e-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879951; x=1742484751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIV0lbRrLZFbQdSx0BrVvPIuenqWUkKeEWZTK4TAOBs=;
        b=qNPNh6cilg4xvwrSXRfw/4wWiKbZySsu3sStveUIMMyHFrFoFGBTzF8uXa6Bo1/NPP
         kRQIm+m+W+0nJE8Q9qBi9FxqLZrlSAnQsPw9gr49ZJ7tgzZL0lLiYAFtfcmaocXsTGhB
         tktFoa5ZquA0BfF7QbvR05CrI0+f0PluJ9c3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879951; x=1742484751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIV0lbRrLZFbQdSx0BrVvPIuenqWUkKeEWZTK4TAOBs=;
        b=hzIi/C+KJ6DV4brZWidMb54q1+498KVChuy/XxFLoELWMiFN7BcwITApXkpQIFFqOU
         MjagyabE5kjF7FtkpcoxK32FWkbzmN+8n0sbtsyaJc49pcJHGP9X7Ew9mwbu8V5bt/Qq
         sVy1QA/whIDQJsAmPXeVVdwV1G433BZO5PFxw3MebGplNezvmZ43sxDym2GGdOxk4o+e
         DYiTI6Fk+xUvs4rS0QNsZ9Xi5pgiRIPVrYnXD0b/6kuhX/00Is4gln7Z++c04XTodHC0
         3izqFsgvT9y1gKZaJTVKJPx3Oy2p2M/291dW5V4hRlrcMTv8TJzJLI15cIAaSWgGPXOA
         Mz+Q==
X-Gm-Message-State: AOJu0YxwS1ile/xUzrK9Ez0lvrS2brCslQe7IbSoNkRLUbo2qNM+piVd
	7WG35F/BXUwi6rlCTueUM6A45yyUKThI6RdQ9gJNmpUQlA0nQNUaicanCV6zvg3KNwIMvAimw3x
	f
X-Gm-Gg: ASbGnct5DvN/jkVJgGam5KrGo0bQv4XJ9WBVGQunz1kjyrx/UcSMvZDDOPukhaY58Cl
	GLkWoUfq1UvgoPsj2H0gWskWvxSTKS4LmMGUKZ2qkkfpPaboMokpME4Ey53/7mdYvc/qXDj0I19
	EM+b9kYDnqOdG1e2eNdK/YIl/Xd5NIw9WaDY0LemRUvc4zFvQgTG92fPNOFPzpQDugbg3+OgINE
	t4rFIJt5DN2v3CThwqrHi95ELrPOzUnEDHLCMIXoZJ6TkELQVK1heQ5in9p4JD8wV8qHSpstOzC
	dEAtoxe0NeEWre1PARJ+f2RVbOjUjgiTCmNOQhGIvSGACiwNdA==
X-Google-Smtp-Source: AGHT+IGSp33R1eWJEtY9rFEEoNQDrBjGvY13L37whLkeE+FLQVs6my06EgT5NpY7mSqCs6pPUI4sUg==
X-Received: by 2002:a05:6402:42c4:b0:5e4:d192:2373 with SMTP id 4fb4d7f45d1cf-5e5e22bf631mr31125520a12.10.1741879951520;
        Thu, 13 Mar 2025 08:32:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/7] xen/ubsan: expand pointer overflow message printing
Date: Thu, 13 Mar 2025 16:30:26 +0100
Message-ID: <20250313153029.93347-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add messages about operations against the NULL pointer, or that result in
a NULL pointer.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/ubsan/ubsan.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index 7ebe4bfc14dc..20aa0cb598e1 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -517,9 +517,18 @@ void __ubsan_handle_pointer_overflow(struct pointer_overflow_data *data,
 
 	ubsan_prologue(&data->location, &flags);
 
-	pr_err("pointer operation %s %p to %p\n",
-	       base > result ? "overflowed" : "underflowed",
-	       _p(base), _p(result));
+	if (!base && !result)
+		pr_err("applying zero offset to null pointer\n");
+	else if (!base && result)
+		pr_err("applying non-zero offset %p to null pointer\n",
+			_p(result));
+	else if (base && !result)
+		pr_err("applying non-zero offset to non-null pointer %p produced null pointer\n",
+			_p(base));
+	else
+		pr_err("pointer operation %s %p to %p\n",
+			base > result ? "overflowed" : "underflowed",
+			_p(base), _p(result));
 
 	ubsan_epilogue(&flags);
 }
-- 
2.48.1


