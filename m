Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E939B51B1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827800.1242559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmF-0000Ui-Vi; Tue, 29 Oct 2024 18:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827800.1242559; Tue, 29 Oct 2024 18:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmF-0000Sc-R9; Tue, 29 Oct 2024 18:17:11 +0000
Received: by outflank-mailman (input) for mailman id 827800;
 Tue, 29 Oct 2024 18:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qmE-0007bP-6x
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0207de9e-9622-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:17:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9634c9160so6597861a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:08 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:17:06 -0700 (PDT)
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
X-Inumbo-ID: 0207de9e-9622-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyMDdkZTllLTk2MjItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI1ODI4LjAzODM3OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225827; x=1730830627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOAoP8cuHmKGFhmeuvZS1Al8PeEIAn2DesMMCGjFrZU=;
        b=lM1jI0jN7Fl0hN3f/V1/yoWbZGpt5FyEsjU1OJ/IGPu3zS+zoHFQpVOTF4714igi8k
         ONJtSZ1A6z3Cx7u8KQUvAljMYOC4IkxFl+vgfTGlRk25V9N2jAK9b3LzEfilsEGeoCCw
         DOtf0os1iudCAMp4c1aoGU4IZbUMdzMIBIJJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225827; x=1730830627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOAoP8cuHmKGFhmeuvZS1Al8PeEIAn2DesMMCGjFrZU=;
        b=k4ZaOeOP6osanOJ2zY4Fmi68jZyO8RbZssYYcABJ3x2zYdK8mwKQszx4AtgN6dLS+7
         Uylm1WWSo5tso1bGReRN4gZnvWULY/qgZm+wZH6QM4PZH7vH9CE5teRubz+Dsa9cUcQs
         zlPoyNQ8qSL/Be62vzXV26nGMy9nMHvEeIoB3SzY+sKdBZkzwYeyBGx/NMPdVQmETOq7
         XvU1UC2GItWWyUEloDT14Jqtydmb/9zwOTs089G1JSbj9tRQRxpu7BQAuK/6ZUxMzERU
         2RUkexu5iWpOfCmWGbkDDNBQQU/mOsscwgla9Lc+oB9FOxBT9YeRFUfsJ17Vqdwz2vZv
         rCVg==
X-Gm-Message-State: AOJu0Ywe7HzufsOOf529jgEPCVtkeJlGfGi1Bt4kg5RAx6kjboWikRfL
	yz2Th/Yt8CUkad4lveIcdAm694zO6PNoniAxrx7KCy+26h/JoiCXm6zSD/bcmDxPaO64TCs67xH
	r
X-Google-Smtp-Source: AGHT+IGVxPqbkm6G3Esjtcz6v5YtREoyWp/z70cMdlWCcHGyBNNCNdUNyjxtP28BKt29zBqkKGX/aA==
X-Received: by 2002:a05:6402:90c:b0:5c7:2122:6ad with SMTP id 4fb4d7f45d1cf-5cbbf89a142mr10244671a12.14.1730225827189;
        Tue, 29 Oct 2024 11:17:07 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 5/6] xen/x86: Rename grant_opts to grant_version
Date: Tue, 29 Oct 2024 18:16:31 +0000
Message-ID: <20241029181632.69600-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and remove the macros that no longer exist.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 177f4024abca..a9130161969b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -956,7 +956,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_grant_version = opt_gnttab_max_version,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
-- 
2.47.0


