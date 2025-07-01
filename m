Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A9AF042F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029948.1403705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh44-0001Ux-4R; Tue, 01 Jul 2025 19:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029948.1403705; Tue, 01 Jul 2025 19:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh43-0001P7-Ti; Tue, 01 Jul 2025 19:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1029948;
 Tue, 01 Jul 2025 19:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh41-0000D0-TQ
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b8e77c4-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:43 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4e749d7b2so1029516f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:43 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:42 -0700 (PDT)
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
X-Inumbo-ID: 3b8e77c4-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399683; x=1752004483; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=Di3xDQEKfDyU7yBCcvW7aAj2PGSFVVzQQwN1VPejqsnsAUO472bU38df8ZInR9KTD4
         2sp0iBEeHF9AI8UxPb6ZokYYbF8GHI6thVhKqdOq1QoYbUImL9fwMXbRM5R7bC+57Upm
         x2mHMtyO76e5sKXg6yUR33xSwXQtRzAsPWTVPT60ocvPXJ8FU+P5nkh0j8eoPkvJCMNn
         NOdV+XlJOERvf2p1yyW06Gs2U5AxijWdOfIIdUKwwM4Zcb9f7hD1z+v9ez9JWJOoUzzd
         J8InY0jwAz3Uy0dLBv9hGNFnRFUeZRzbXt7gHace4cpk7ujap50OscJ6CT2b+a3MqOiH
         spkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399683; x=1752004483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=WgACGQKvSSV9HwOR8ftHypwH75AR7dutHFrpZAkYI8Yil8tNoPeoOhmc+EC+lS5DqZ
         i94SYbGKlWBboreCtqi1ymWlK2nR9fAD4fAp0DPCDcJPfiN2wOWAzCXX0wMHOfsUu22T
         gx4HsLNb3/aR6Th0MyDsAtW/q0usxj8/k0Nj/ejzQgti/eRZCXJ/UDPXUYUChtwI/3Jq
         Gz1Uhgmuv9VaoLOoYyimQuJv0nLsgvNmG3dkJ6bINyQj7ig408JVdFFFBTWqqayvxq+w
         eaVghJDBYkwPQwvzoUvkTmmAEyYf/U+df+C5KRmy97a1UA+M0CwQc6X05bWj8887W3kh
         DH4Q==
X-Gm-Message-State: AOJu0YyWakvvO0zJ4/Bp9qeecV04b1IQtMrP/vwWiTVbPCNNB+tlA4di
	x9Y4GdcsG8HzDBs2cmN6vgjKDsFcTQNEslrqaiwKZ9HrQhRUQqGWQ7mlc3bTKg==
X-Gm-Gg: ASbGnct6PCktHTa6DAQuWkrkcilA8Vk5eISZNPi9ftiF1XbSN9kBJs+0pcti7dBJn78
	trcpYfIb1JlmBaqqi64V4VjiKhHH/lZ2jx1DpjUEWy4hO2aaNHlBCtMTUFiKxt4TQW5Z7AvgzCS
	HcJU1Ol+qPR+xbqjZD8d13NiEeBhc7OT0a32Jqanekk3AJKZ9EQbjQABv68f5gSPxNmilm/hPD+
	jx1Y2gvAr6o/Gt0UahITEe6cKHvTsggu+m+COXkRfc+vV66sTstFiJByLklIg6FsdXIHb2rlS9b
	9JetNqvNSodqWwVse7aDOuo03BWiv2cfMpPUAHhMurbmO8xtHt9RDhsSbn5rUfu3tp3jVJLoJzJ
	t4edGwXXSg2RVPVy6FfgmkBiT13HWjCZfLwBcVwEtMpKxlvjicUye1XL/v/vGqA==
X-Google-Smtp-Source: AGHT+IE/KB/pxZ3KsLfyOzOBxluoYg0uOA1iBcipA1IAJq6s4BCrryXlA7GMb3XV63jEVfYXkY5AUw==
X-Received: by 2002:a05:6000:4282:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3af459656bfmr1410089f8f.0.1751399682732;
        Tue, 01 Jul 2025 12:54:42 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 6/7] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Tue,  1 Jul 2025 19:54:28 +0000
Message-Id: <6875a5f659a9a48e2beb49e3c5ff8a2720ff882e.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


