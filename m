Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCFA14144
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873682.1284712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU37-0008ST-1T; Thu, 16 Jan 2025 17:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873682.1284712; Thu, 16 Jan 2025 17:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU36-0008QJ-UT; Thu, 16 Jan 2025 17:52:56 +0000
Received: by outflank-mailman (input) for mailman id 873682;
 Thu, 16 Jan 2025 17:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU35-0007CP-KG
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:55 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6ab3639-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:55 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso4236583a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:55 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384d2d69fsm27215966b.79.2025.01.16.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:53 -0800 (PST)
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
X-Inumbo-ID: b6ab3639-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049974; x=1737654774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKB1yFs9c8qB7Ii2QUVBsCJgsFYCAo4Ha6+WZCUSBfI=;
        b=t6+0mhNL8ZhKyFpbFGHukojR9IGHOWUYKFDxhLCJhzpYt7aFSOJe5CkzjxSwdPXiI+
         aJFUm+EcQZMk9Use+Wgbj6LaSxsTXqwIavtJrYqFfPx+nieWj3WgTChzFSuzHKVogalC
         UCrEz2Z+6QcMc2ez88XvqRPqAhhJkhsMyqshc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049974; x=1737654774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKB1yFs9c8qB7Ii2QUVBsCJgsFYCAo4Ha6+WZCUSBfI=;
        b=ArxhJ1rppZqJYCs2Er8EDSIdDE3GengFkAU1/Qe6dx95uUFUvdqAgEs/oTyTZLuNJp
         GfbrtJ1fUg/Wa0xH9ZK8wDCYOOb9dKQZve6jatdl0sWWkzY7eyyAB91GZQ0X2N/ieuQ+
         d1bgaFBgvO6B4OeUjYCDgNU5yvrWnlgulXDVUmBBwVcZUgvU5PDyMpqUpQdrSWLwGlEB
         r1ylMRlOff82HRKKErPumNWhGOrowyxqa9vVIX7nB1QobwFpJk8efBIU01W5500fNu9q
         J9ZmRs8D1T4Ytx+8IoaonzjBlWDw4yTFgZwASQwaCTAlbllXilFVhjQlzYyu2/tjuKRO
         5OEA==
X-Gm-Message-State: AOJu0YzRV/p/bJQCIR/XdsIF9ALbUTMzo6CWUQlrpF5GTeECbAkGBD0W
	Wvego9liphsZg9ijKWH/ZHgwtLl3TP6imb+Kl2/D9UkxlbgjS6T/JdYRRNN848uB4KuCfSUbEzz
	j
X-Gm-Gg: ASbGnctW/52qFIo3oJk/prF33zQQjPtd50O4AQPl2L/Df3oCFpq4/DHDRNS9ifOw+Mh
	odJ9uO6Vb3c0RORprpRAUYjpu0FDCc4WpBpGjJJ5wPNFeljCinlkZ4NkPTBEFWpeT38VLGHjfZ+
	JR8Q1OxlRAvAXaEBIpeWXdDVjOHPFZP6epVI5sbi3/lZbAVfcEyB//U4DgugWA5e2+vxDHFmjqm
	pesEFAbcqv/8RcmKZlAU/tfAF90I/dDj5efyVASJjwFh62VdIHU8Md2/AJ5tw==
X-Google-Smtp-Source: AGHT+IGH4OzQgxrsJ/IwnTnRF18Pado6jmWcA1RPVb0SjpZkArfJzXDlTxxDnOmwH4JgvOnn9o1fdg==
X-Received: by 2002:a17:907:9d18:b0:ab3:85eb:377c with SMTP id a640c23a62f3a-ab385eb4029mr59295266b.17.1737049973869;
        Thu, 16 Jan 2025 09:52:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/7] create-diff-object: add .text.hot to the list of bundleable functions
Date: Thu, 16 Jan 2025 18:52:12 +0100
Message-ID: <20250116175214.83742-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

According to gcc8's man pages gcc can put functions into .text.unlikely
or .text.hot subfunctions during optimization. Add ".text.hot" to the
list of bundleable functions in is_bundleable().

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/common.c b/common.c
index 84ca14d3e397..b46fcf5cb6ca 100644
--- a/common.c
+++ b/common.c
@@ -131,6 +131,11 @@ static int is_bundleable(struct symbol *sym)
 			  !strncmp(sym->sec->name + 15, sym->name, strlen(sym->sec->name) - 15))))
 		return 1;
 
+	if (sym->type == STT_FUNC &&
+	    !strncmp(sym->sec->name, ".text.hot.",10) &&
+	    !strcmp(sym->sec->name + 10, sym->name))
+		return 1;
+
 	if (sym->type == STT_OBJECT &&
 	   !strncmp(sym->sec->name, ".data.",6) &&
 	   !strcmp(sym->sec->name + 6, sym->name))
-- 
2.46.0


