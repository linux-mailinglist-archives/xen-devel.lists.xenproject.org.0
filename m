Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2D99709E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814888.1228601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFP-0004u2-Tl; Wed, 09 Oct 2024 16:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814888.1228601; Wed, 09 Oct 2024 16:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFP-0004sT-Q4; Wed, 09 Oct 2024 16:09:11 +0000
Received: by outflank-mailman (input) for mailman id 814888;
 Wed, 09 Oct 2024 16:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DQvJ=RF=flex--ardb.bounces.google.com=3pKoGZwgKCVMvCyw+13E19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@srs-se1.protection.inumbo.net>)
 id 1syZFO-0004OJ-36
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:10 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c1a763-8658-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:09:09 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e28690bc290so10523078276.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:09 -0700 (PDT)
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
X-Inumbo-ID: d0c1a763-8658-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490148; x=1729094948; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGJVSpQBdEJnufx8hCONnOeuil0ovqsMOkm2dztukRI=;
        b=cduC3QBSHUgaM6kX8XYcDNm5UlpCfR4JqoBRYlPOvXboAaGd/0hgHAPualA5BiL1bi
         wTAdO5v/Fgga0GiVwDwoTO1Z/rmPLgDyZK+IPhgydv6vnCYjyxDRLgsZfU0K+ePSJ88s
         mY3HyuKuKXE1ZbzrymApebtny3nBOVvDJoXFlKZ9pzHAUdM1QlvAa8yYbvBlthXIVQ05
         h/+l/Az853NXdoPpimnghTtDf6Gi+RiaVLIfmZcYXC+t8H5SmvzVQXBFXUzqLFnQRNyb
         +7pDJfbVATnnixkBRV5gGR5qpknzc7bb0dBlXMsj427CJniD8LRmrPT+hxckQ9+ExD/C
         NDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490148; x=1729094948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGJVSpQBdEJnufx8hCONnOeuil0ovqsMOkm2dztukRI=;
        b=QCPbC3pkCYqvuvAP8DUXpbJC6mbWElg5QMsqtGOi7M87fGlnA6yBYg5Slge916O7ah
         s4PrX+8J/6DLwsJvsfWwiysenEhOd7+omTvyZUGq76B4JuUiSwtIeJC8zG6EeYkqqC/5
         B0M8zOv6wl5uCI4q5oUvMIDte179Rh+2hhd98Xv7i6nL2z5QECXkr7kJevFUglBUcFuZ
         QgAIur73aNVS7l6ApoQ9uihrKPOZgntpnUVTEZX8dKOu4CF3d3t2akmkJkM7S7oNvtvi
         T44vy109Xr2O4auYiWZfBy/Yngij6wOjFy0BApAn2nTqsxTNgNHeY0EseJhU0iM6QBNc
         hJjw==
X-Forwarded-Encrypted: i=1; AJvYcCVwaNPafjP269cR1xjdQgTzrN8SYf6wJNsQMr+CBkFDUpqMiRa/jnoF9vtt0/DSCbjbq5vPptZtyK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvpjBQaVrfZtnOrC7Y6weaRlCIVfOk235kk9gZLWzfUq79+WzK
	Klf1k9QE3vspNQa0HwiSYu7XvpZOx8OBi2rjlPUA3fHSLzjNGa3wuTGFf0aFG05owz5nRQ==
X-Google-Smtp-Source: AGHT+IGcrpMuY+JUdG2304e6zDFXCrIjHXd1oEUvOKqh9gm+2UjFx6EJkS5NZtUvSSlBsb3U+IRyhrgW
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:b86:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e28fe516b5amr2248276.8.1728490148421; Wed, 09 Oct 2024 09:09:08
 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:41 +0200
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=ardb@kernel.org;
 h=from:subject; bh=2aGbXNWak6ut+XUg0ikYbMbWC3UWCn0/S+aA/QUouf0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5azmxVvPswZHXo+eZV99ILxaoHCZkO2ShWG1fzZfj
 dj+ce7DjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARy+2MDA/ZrgbNPbtsYlDP
 rOq9G7Q6V597L3Jqq9sCbs3/wpEGh5MYGb78MV6wNolJSO21T0+OoIGEyFzrXQ6zdnhMFmFb/nZ dCgcA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-9-ardb+git@google.com>
Subject: [PATCH v3 2/5] x86/pvh: Use correct size value in GDT descriptor
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The limit field in a GDT descriptor is an inclusive bound, and therefore
one less than the size of the covered range.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index ce4fd8d33da4..5a196fb3ebd8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -224,7 +224,7 @@ SYM_CODE_END(pvh_start_xen)
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
+	.word gdt_end - gdt_start - 1
 	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
-- 
2.47.0.rc0.187.ge670bccf7e-goog


