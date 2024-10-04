Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BF98FED9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810099.1222847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVU-00014q-VH; Fri, 04 Oct 2024 08:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810099.1222847; Fri, 04 Oct 2024 08:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVT-0000l1-UL; Fri, 04 Oct 2024 08:17:47 +0000
Received: by outflank-mailman (input) for mailman id 810099;
 Fri, 04 Oct 2024 08:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVN-0005Vm-Bv
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:41 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fa4fed4-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so181725066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:40 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:39 -0700 (PDT)
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
X-Inumbo-ID: 1fa4fed4-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029860; x=1728634660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=YMsPcRFvQMpQTvtd2qnBOgoq0x6AEmm63FsROKxudHdxS8K4gAqCjNA73QVoiGZUNN
         HZVfZ8X7f7MaQJLTthMY0dDevhYNk8xVgxiOWDdhY6N68tqnp3S63323ps2xJbiPgR28
         9KKE8DwfEBN35vyp2cSttzPtMjAgPhuXw9ZA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029860; x=1728634660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=hYwfXrZ5U5GEaW8YZfCD7EHgeYBh4W6/ibnlECOcG1W6QJClWGzmjc31Eur8VcWLAa
         RySbgq6M8/fOO0PNsnXyBDRpvLcPbjzKZlDq061f28NE3Hx3wnpu4qL5jYHjUBbvB9T1
         AVu8RGWqDJmUS0nYg2QzxPbWAcd8WXjS96qHY/TK1my1WzyNjFwKDBpTAVYY9mDSOLnj
         9PBf+/k7pbFlWNb8v9YktUvqVGjnBO7VfCYSWzs4t7lhatQvzXehINxClhmqBcPBi5vD
         9AFjoArpPKXwcGTvfBljkFGkqsfSB4r9AvKu/stJ/mDgLUvCJ1oZQlZocwC21kE/hWT4
         ncFg==
X-Gm-Message-State: AOJu0Yz1oKIxou3hd02kevZiERUo/kgLqX67rM+YJLvk0E0ab2y6MILq
	VX1+BbXH6PL2hgv42Szuw08r1r/E/B+/NmFsHT7dO41LUHgwIggaUPBi0q7cOftqWvjwxiOlFNr
	N
X-Google-Smtp-Source: AGHT+IE2P6bTmkP4WyoRi0mlV1wW2wJvlrHKdRpyxStOSbVPpyLjhCkn1VuZ5K2L5OgKcWoOcjudWA==
X-Received: by 2002:a17:906:4fd0:b0:a8d:4db8:9edf with SMTP id a640c23a62f3a-a991bff02d6mr187522166b.42.1728029860154;
        Fri, 04 Oct 2024 01:17:40 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 18/19] xen: Update header guards - VPCI
Date: Fri,  4 Oct 2024 09:17:12 +0100
Message-Id: <20241004081713.749031-19-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to VPCI.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/vpci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc27..d2d2905447 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_VPCI_H_
-#define _XEN_VPCI_H_
+#ifndef XEN__VPCI_H
+#define XEN__VPCI_H
 
 #ifdef CONFIG_HAS_VPCI
 
-- 
2.34.1


