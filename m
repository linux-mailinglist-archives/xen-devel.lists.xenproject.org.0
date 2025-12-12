Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B9CB8E4E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185387.1507595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36V-0001Jq-S3; Fri, 12 Dec 2025 13:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185387.1507595; Fri, 12 Dec 2025 13:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36V-0001GT-Ns; Fri, 12 Dec 2025 13:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1185387;
 Fri, 12 Dec 2025 13:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU36T-0000XM-Em
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f853638-d75d-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 14:22:35 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64979bee42aso1708755a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:35 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm5168260a12.19.2025.12.12.05.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:22:34 -0800 (PST)
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
X-Inumbo-ID: 9f853638-d75d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765545755; x=1766150555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDGYl4MwmHHOZvcQHRUCvu0R6OsEkqD5kONUFPAiJAw=;
        b=I+pOhUiSR6le9Q8CTIxXO417o7SX6ye+yqlL4pCROeerUXnieXVNH9/xpcLDJCUHop
         wfpWqGI7qR7F5+iB3ecwMMKm//DWx1Za7Er+tU0C2+Va2VQlKW1B9vSa+FeeHwz8JSUe
         yteOqA8fMpViW2oW8jVu0tiHUlgR8+N2ZVQrVJGr0wSkvinn6mlb1EmUfOaIEIxdI53w
         8CrRJFN7LtA14vSPW4XlqrZ84r0buDuLISAH+BzM21zsQYY23e/0nooAgfOocASYl0cz
         H08HxT9OsGShIQw6LeG9QL/Qcin7PhGK+NkElIeJB21HCmILBT/wCvazm96HwpttjST/
         h2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545755; x=1766150555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDGYl4MwmHHOZvcQHRUCvu0R6OsEkqD5kONUFPAiJAw=;
        b=TUovP2NydlEdxwab7j439Va0m+6XHjrQz0P7Yjc7leicqB++irR/VVwBPidXWT78ui
         2wJUi3huu3nmrqVS7vgDb26vrwC1n0Sjghm7vyfF3L9MhunPiWU9Veq0oghNG0FqXMcG
         SYF+wiMWTqIZ5MdFLMJ2Acg/Xue0WvF1JOjZdf88h7Rg+w3MXom+KseFox5gvHQpTZVI
         de/jelo1qLRRotWrFekTtWQq1A2TQWRP93ut//GnxV/Jwv4SaBAZb80aRTo/q6tmijBZ
         MnECRxTrfZbSi89cE/U4beJY+OfOmsE0Hv+NU4sBdNzVWnr9+zjoI4VbufuECpgXDDrq
         iMnA==
X-Gm-Message-State: AOJu0Yw3huBV+PHI7BlZNhhCx6EUrfiaAQnpuHMfLIk3fJ1VabhfjTs+
	2S4ZeLVXteErJCKASK2snpx6TYLHhYk0kvYX+diV4YsgCxp98pQ9ud3+ffbxUBJI
X-Gm-Gg: AY/fxX5l7Yp+8IZxnWzHSuu7+og+BBc9SXa3aUjGBnfbZFo7poVL1yDsglm/HW8MJFl
	BHxos2s3GFhD6OfvjEHaGWSWStFUDrx1WQrUPi/tJUJAWlBVbkKEbSJG1a2T28P9nZJx6sqpSz3
	bZNta0UH8p1a+oE3HbkTIxdm19Y1ecnwWJlMANWcbZanfTO7wkvYLF24GKvBleYdqp1HiTVT0bu
	JrjiSrtPwxMjUAAhz2KpWkGl3OJhv6WiJgzhlO8/AzmMA0nB++F5n88WcxzZtrQurq4k0sHsBhg
	XGlLjAAP6Ma5u0NB8h591P5VN5iVMRmcetwS1YsGUfWTHGjm3PiZ4diNEHxzHqq0HTZ0Um3WsxS
	XaRcG/gdAkodIFya37kvdpOPAzM4owd4stuOpq4ht3MvjWH5QoDkAym77N/0ENjOKe/SlIuNb3p
	skXz6viCFxDScHzKcRRH09udyfxIJaJjrOCRkdqQNEaC0TBKpw9f0=
X-Google-Smtp-Source: AGHT+IHPoA+7SlbyI79X70bXXauxfU4pvexgeUSee3mEG4eYs8eIhbd3Lcy8ZlmOC4qy2+TQsEHf9g==
X-Received: by 2002:a05:6402:2341:b0:647:b4cf:b4ff with SMTP id 4fb4d7f45d1cf-6499b1c27c0mr2279714a12.17.1765545754612;
        Fri, 12 Dec 2025 05:22:34 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v16 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Fri, 12 Dec 2025 15:18:21 +0200
Message-ID: <7cca9767665b9ab2e3e5cd28cdb61fda3018a7b5.1765533584.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765533584.git.mykola_kvach@epam.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v16:
- cosmetic changes after review.
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3aaf598623..724eeae454 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On Arm:
+   - Support for guest suspend and resume to/from RAM via vPSCI.
+     Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.43.0


