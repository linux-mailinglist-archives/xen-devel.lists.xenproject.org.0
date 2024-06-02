Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A846E8D77B9
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734558.1140682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRX-0000Jg-1b; Sun, 02 Jun 2024 20:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734558.1140682; Sun, 02 Jun 2024 20:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRW-0000AK-T8; Sun, 02 Jun 2024 20:04:38 +0000
Received: by outflank-mailman (input) for mailman id 734558;
 Sun, 02 Jun 2024 20:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRV-0007mz-5d
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:37 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a5657c-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:35 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35dcd34a69bso2430727f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:35 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:34 -0700 (PDT)
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
X-Inumbo-ID: 55a5657c-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358675; x=1717963475; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPmb+DHWEiqVT7szGSWw+jNtsJuaWk/ic+48cvb9OAo=;
        b=ilCUc32sdQ1yZ8UqZyk2l/gpkY/rAFncomSay9IOsCop+OyUh3Q7ZFehB+EZG6KXpM
         aAUu+ac9vZfsANHUdSYgBdYlrGSJ4hIEuIA3sa6po4qncaqB69fXrAFU8euPbCGxLHzQ
         ZJWnHtMSzLbBptLCbgrE5MFNHXkT7e0zpY5kmd6KW6do94YY2TE72eRHfjKjzDe8gfNt
         FUk5tE+EG3lgwdN2HVHYG0wczX/4hisfXYZreWPKIBBgymFMdLisRGJgoBhFhebvn6aC
         MY2bpcb6e+UkJg1sjEeUquH3oXqVCQgRryXWeMPeuUkuHnoreQN6IjKMGouw7/MsLZYD
         oNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358675; x=1717963475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPmb+DHWEiqVT7szGSWw+jNtsJuaWk/ic+48cvb9OAo=;
        b=eiB8PbLHvMA5nhm1JX8LbL/AcAs4NhCUDUNUCCy0MS7w0zXL6koCHDLEnjfrP6++Sp
         zJFq/oldye8rYSqKRI23Aa2FYOuPydUpqRwppuWjnbM+EOMYntm7wEAZLB9D3RxL8IJm
         cAvWfWbFGbEV4cSpgFWYyeqIhC+vwoYHL72vCWii9Uffp8DyFK/daAgTL6HaGEqWERF0
         FvpBWpYOsJeu6NFs+NuCt06l6nzbNrxQ6f26q3FHsutsObHDkKJzJDFf1Wdai9Yr37PO
         yJn2YV6njB/POwlxEWL8CEKbHFo5UJ8jGCl2OmrCVPQEMkL20G9SER6dOyJs7G92Ly87
         3hNQ==
X-Gm-Message-State: AOJu0YzDQ4s7wxB6cikzXgZ0eLWx4GlAh5ivAlHaY1HTMxcUaBqLNDcd
	vpMpykPXQ9AxK/pdsBM+Qk0r2SGg0x8DgOzhKscrVEj8pFzca5zsL6HzTQ==
X-Google-Smtp-Source: AGHT+IEi2D35Tnzu3IULZGk73EEhgGMItbZSQo70nq+seXU5oU0ENSxO0/uCFi2K2/onl2P+Lh15vQ==
X-Received: by 2002:a5d:4005:0:b0:354:f1de:33eb with SMTP id ffacd0b85a97d-35e0f2836b3mr4900489f8f.26.1717358674817;
        Sun, 02 Jun 2024 13:04:34 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v5 05/10] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Sun,  2 Jun 2024 20:04:18 +0000
Message-Id: <e34f5632f2304b18c9729a749b4d0c406b042faa.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the altp2m_count
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ac3f88fd57..ff03b43884 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2039,6 +2039,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
 B<Note>: While the option "altp2mhvm" is deprecated, legacy applications for
 x86 systems will continue to work using it.

+=item B<altp2m_count=NUMBER>
+
+Specifies the maximum number of alternate-p2m views available to the guest.
+This setting is crucial in domain introspection scenarios that require
+multiple physical-to-machine (p2m) memory mappings to be established
+simultaneously.
+
+Enabling multiple p2m views may increase memory usage. It is advisable to
+review and adjust the B<shadow_memory> setting as necessary to accommodate
+the additional memory requirements.
+
+B<Note>: This option is ignored if B<altp2m> is disabled. The default value
+is 10.
+
 =item B<nestedhvm=BOOLEAN>

 Enable or disables guest access to hardware virtualisation features,
--
2.34.1


