Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC346CD7E9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516185.799921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOZ-0008Jp-9a; Wed, 29 Mar 2023 10:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516185.799921; Wed, 29 Mar 2023 10:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOZ-0008HL-5a; Wed, 29 Mar 2023 10:51:11 +0000
Received: by outflank-mailman (input) for mailman id 516185;
 Wed, 29 Mar 2023 10:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phTOX-0007lb-4Y
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:51:09 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c23af94-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:51:07 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id t14so15603741ljd.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 03:51:07 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b004eb0f6b7ccfsm1173572lfh.134.2023.03.29.03.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 03:51:06 -0700 (PDT)
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
X-Inumbo-ID: 9c23af94-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680087067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DldPskHzgYoIvAYeHKpbfRQwsqZOEaBiKKquVpoPiN4=;
        b=NGek71g98vpT7REoy4T6NLVHYWa68X4Sp3dnCziNewPw/8I4LGvQLcnxihy/InMOyo
         YrEhUXAluKiWfKjoJzJeQDxWx0dC3kN0xeL7pzXwZEyGl+YHRtBybg42ZqaKEluXQnuE
         LEagycEAyZbURb9D6g4YFgUJzc077QUgllUFaKPJsOkQTKCWeLWnBZ4gHYn7wGBobAP/
         E02g8aLkxMS2RLgfYCJYlV+03uo0SR4zw8p9vNCqk3jZ1xODCOkybo7woq6cK+A+ooGu
         guIMDxW6U2tE2/JYI8loW0fRjeQylRadX9d6uSIjdfvQkuykeixeGK6T8IOLSaY9YFM8
         OQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DldPskHzgYoIvAYeHKpbfRQwsqZOEaBiKKquVpoPiN4=;
        b=bz9L22UYRgJVXG1vdLbUKlTr/Yp+QxS708BUpH27bYgKEeLWSeY7E6KK6v4LD9kHKw
         ezoFDDV795mYeAFUopwWIs91Re6T/DxAND+//F0qm7ECfSrG6fF1+lwHva0ZmUY2iLCR
         dsd7MzSuNkeVGEa5UZYDsn80ltI+JIo11zodsFEz8CQBzcbWr73f0/0EgqOVPZB+T0n9
         uLu10jpOcm3/ciVMVsq3eJURAiI3rRP+J6ymDqwxdBSoZjdafUAN7qHPw9PU8AsUvWme
         qhPIKrY/K0oJ9sjBSrwwZAOwY1gxj976c9AvQYrPBc7Fja60/70bO8aZ1zbnSJX+kQms
         gVKw==
X-Gm-Message-State: AAQBX9dOw2/7cIACxwkAbRyayi8uZlK/yB78WK6dOjC7hLvUGIyF/T8/
	mrhs590wyzFiEE1sDUAKRmvdxENVxMw=
X-Google-Smtp-Source: AKy350Z616Thnf37B8Qxl0dFhprg4uBVFFk/qBOlc5ZzDA8BzpZbYqD1+zq/MIFZ3gzv6fFLTudzSw==
X-Received: by 2002:a2e:80d6:0:b0:29d:d0b:7a78 with SMTP id r22-20020a2e80d6000000b0029d0d0b7a78mr5996097ljg.21.1680087067008;
        Wed, 29 Mar 2023 03:51:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 2/5] xen/arm: remove unused defines in <asm/bug.h>
Date: Wed, 29 Mar 2023 13:50:29 +0300
Message-Id: <b1f14f37c933fb4185d85b0ecf6fe9794ce81970.1680086655.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680086655.git.oleksii.kurochko@gmail.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
as unused.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 * Nothing changed
---
Changes in V8:
 * Update the commit message with Requested-by and Reviewed-by
---
 xen/arch/arm/include/asm/bug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..d6c98505bf 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -9,10 +9,6 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
-- 
2.39.2


