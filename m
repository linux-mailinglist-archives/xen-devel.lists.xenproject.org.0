Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C49840EDE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673076.1047353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIG-0000zr-As; Mon, 29 Jan 2024 17:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673076.1047353; Mon, 29 Jan 2024 17:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIF-0000ni-Is; Mon, 29 Jan 2024 17:19:35 +0000
Received: by outflank-mailman (input) for mailman id 673076;
 Mon, 29 Jan 2024 17:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVIC-0005vY-2e
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:32 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9072ee54-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:31 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55eed368b0bso2594684a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:31 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:30 -0800 (PST)
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
X-Inumbo-ID: 9072ee54-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548770; x=1707153570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/xUYJDHb6Zn3w9TBBig7WhAk/AOSiMp9RlKr6dgP2E=;
        b=WBY8nigApNSmOxzD+7scbd3868YkFxnn8b7pwhrODPFiLU07cxK5R0mkNXXZfMURlM
         ZD4IJ6yTlCx3yBf2gjCDq9oGUfbUVkSAni1hka/qVnz9kIGHGgOtkOixeolk5TvTwBHY
         h7raKAAVDR2rjvDrXxKndL5y32pZWd97YirxKo+V2r9dMdT2519P6BL6jyjIcmRZLDSb
         CGyXv80wZfSUBvw920ZGYDLkSDu/woAUvJKxywCkQ5fwB5BnFgsg/fseS8MIU7wwmog4
         qbix9sCs4VjwTkBrl3jkg6jvPJV7j9hNtUuRSDPrlCa1Jdk+8+2eZHChnw3a3wA9epIS
         lpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548770; x=1707153570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/xUYJDHb6Zn3w9TBBig7WhAk/AOSiMp9RlKr6dgP2E=;
        b=bOIs7Jz2UfenoToX3HFYiTacoeegj/05+eksfmChY6KKcaQ9xBzIwf2KLFAxREH23Z
         GVrdVHx06M/3uC/I1vvOoQO6LU5Yf+PsdGtepvmFU6L5NqB1WGrFUHGC9+7OGqpb668F
         TYXtg8e5eHTnM9ePCNRPI/Pp4b6dcjo6wJYgOEaXQB+VIob7QBlOJyV+A9JQCtReoB6N
         P9efU2LGhObA/KDG5jKsxNBCWFdnmwE1AqLEHkujXcgWdf6rj67pBExVqsaM/N3OqIAS
         TfnFnLCfWtqsxZlyqT851dNDby+zerEu68na53R9eJiW0osgNi0nqcTrJoMRsAIgQoHj
         qLjQ==
X-Gm-Message-State: AOJu0YzhtG3xDpP3w8P14eZOts26G7Gpr3h9SjvIXH0hYbKuHdO+doMT
	s0B8yCuKwEBRUMUQdqs0rma64EPnkilY7Kezn1AviV8yE6vUGHLdRKFHFRNdttc21G3XWgI6Oqp
	Cp6Y=
X-Google-Smtp-Source: AGHT+IFfyqAJQ8sAINSHdQQK6qqpoH3R0bcyfxPSeaYcI3S/L5NM69tIPus/nQPn5TvAizkT+NKrlg==
X-Received: by 2002:a50:ec8d:0:b0:55f:1da7:62f6 with SMTP id e13-20020a50ec8d000000b0055f1da762f6mr1602730edr.13.1706548770565;
        Mon, 29 Jan 2024 09:19:30 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 15/15] support: add cache coloring arm64 experimental feature
Date: Mon, 29 Jan 2024 18:18:11 +0100
Message-Id: <20240129171811.21382-16-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- new patch
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index a90d1108c9..f94569c862 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -363,6 +363,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
     Status, x86 HVM: Tech Preview
     Status, ARM: Tech Preview
 
+### Cache coloring
+
+Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and Xen
+itself.
+
+    Status, Arm64: Experimental
+
 ## Resource Management
 
 ### CPU Pools
-- 
2.34.1


