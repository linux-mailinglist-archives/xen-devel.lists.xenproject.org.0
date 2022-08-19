Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE159A6AA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390439.627893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7ux-0005Q5-Rc; Fri, 19 Aug 2022 19:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390439.627893; Fri, 19 Aug 2022 19:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7ux-0005Jc-MR; Fri, 19 Aug 2022 19:44:31 +0000
Received: by outflank-mailman (input) for mailman id 390439;
 Fri, 19 Aug 2022 19:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7uw-0004jK-EK
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:30 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57100c84-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id fy5so10670938ejc.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:29 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:28 -0700 (PDT)
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
X-Inumbo-ID: 57100c84-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HDuuxFY/YE94TPNe9W54PeY/2YGWcZav7WGy8V8/S+M=;
        b=JQXRD4F6Ddf1NWf18s2PCtlt7A0tVn7g1AIawlf++LC6axyaosDtPLbWtF6A7HgklM
         2jUfPVwjdF0XfDzkxtqT82NO3Be+sTtaEX81qyBhK6VVCghh5A4pEJIxzPfwiIYUA+Zh
         fS6hYKTtvyn32GrBz16qW+VTOFVAMFONWyqMWf4s0B/J2dDniubKlRwrt6hKV6PINHgZ
         WoPlfgtDBLv109SelCcM+T4141Xa03AiXlOkmZiLZ1r8jp1iuMLT+V+Qwkjsiy8lJAD4
         gER8tGI+FNxkfemEnTeX82T1D5ppNZW5x80OsFWpgp4HvG7wcxpgqibLip0+0x3k6M9f
         hLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HDuuxFY/YE94TPNe9W54PeY/2YGWcZav7WGy8V8/S+M=;
        b=w3iGMnMI607yICipIqIyJU4ZivsoZ1x+J8doMu+iY3nbPOgyFMAcq+XJlVWUZywmEp
         YJ5fr+fIj9gZzOU2CeYz/5QPO3+oEE+5Z29HVTg0SGdgC1/iVkhokf1S4Des2Eio0vKh
         rvHJYB2fvCenTbz3YK8gK7DElQognEtIkhiEb+7bd5boZjysySlk7XY508B9o2TJUu5b
         QlJY3Cq8w0C7Z8MQMjjQrdr5unBrGMph6acef1jXNVDJ2kAXXZtTCYbIZ5gK71CN6d7f
         qDBZcd1nxVzx4bvfTyxer6Np1cfGq+QyBFnIDaQpHBHuO+IOlhrXWqmoEkWoPSnMyd3O
         9uXw==
X-Gm-Message-State: ACgBeo2aW24BIMhemK+SFwpCybw7WK1ZzDGvwhv7vZ6oNQh7N7z2uoox
	5Z6GTtziGddnDHZbzD5LVp9CtQ4vakY=
X-Google-Smtp-Source: AA6agR41DpyasU1bwDPTT9rxNNwBCW+BMdM30h+lAaNbCAPVmTDiDSK/SrHWCtmh/+oG1xinDHQBQw==
X-Received: by 2002:a17:906:cc0e:b0:731:6844:880a with SMTP id ml14-20020a170906cc0e00b007316844880amr5822271ejb.514.1660938269092;
        Fri, 19 Aug 2022 12:44:29 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/7] xen/elf: Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:55 +0300
Message-Id: <20220819194359.1196539-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macros ELF32_ST_TYPE() and ELF64_ST_TYPE(), add parentheses around the
macro parameter to prevent against unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xen/elfstructs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 616ebf9269..0a7c558a80 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -305,11 +305,11 @@ typedef struct {
 
 /* Extract symbol info - st_info */
 #define ELF32_ST_BIND(x)	((x) >> 4)
-#define ELF32_ST_TYPE(x)	(((unsigned int) x) & 0xf)
+#define ELF32_ST_TYPE(x)	(((unsigned int) (x)) & 0xf)
 #define ELF32_ST_INFO(b,t)	(((b) << 4) + ((t) & 0xf))
 
 #define ELF64_ST_BIND(x)	((x) >> 4)
-#define ELF64_ST_TYPE(x)	(((unsigned int) x) & 0xf)
+#define ELF64_ST_TYPE(x)	(((unsigned int) (x)) & 0xf)
 #define ELF64_ST_INFO(b,t)	(((b) << 4) + ((t) & 0xf))
 
 /* Symbol Binding - ELF32_ST_BIND - st_info */
-- 
2.34.1


