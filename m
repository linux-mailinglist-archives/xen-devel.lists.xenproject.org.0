Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924E9F5397
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859728.1271830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbOO-0001sC-LW; Tue, 17 Dec 2024 17:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859728.1271830; Tue, 17 Dec 2024 17:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNbOO-0001qa-Is; Tue, 17 Dec 2024 17:29:56 +0000
Received: by outflank-mailman (input) for mailman id 859728;
 Tue, 17 Dec 2024 17:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNbOM-0001qT-TF
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:29:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86d18c29-bc9c-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:29:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so60804835e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:29:53 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8015f77sm11600774f8f.26.2024.12.17.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:29:52 -0800 (PST)
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
X-Inumbo-ID: 86d18c29-bc9c-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734456592; x=1735061392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB8oEjq9ZSqRoE9MS1vzGSMKSvz1WjieQBNGzyPq31E=;
        b=Zs9ywTdIGKGdklIOFYqIvLxiyQpQDFKc5NAVzx3jotzBkzrS/iY+mFzK5Vz1RMFQnl
         1F4be//5iCmzaMki2mOvhCY0slksC6/oM7etlZOS+jyVil7tGWY6W2bk7SYmaaofT9XC
         zFtcCFFXtTidH/QENYkPgbwICOheFKwd39R8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456592; x=1735061392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB8oEjq9ZSqRoE9MS1vzGSMKSvz1WjieQBNGzyPq31E=;
        b=D5dCIqam9MNtFzzHTFlulQZMZ0H2/kxc1iDVweJfqz3YCuywJnTHMxgn14wFa+w88D
         ZS0KQLBKfd0blecBqY5wlu8V8GhPZ2bXr0g2qDQMRoplaKT/wQD5jsCvdAC232vVTA6W
         VJeGIqLEizFo+LFqG79uKgA1o6+vT92QBGTSHhKOjLBfMGVwcFvF5NHDA9KApwM+jtdn
         +IlYwhZ7JHEHFcFd864fHJ5EdoDlJNuzqSnCLw7WabxrIv60EtGtaH7+f254q2IqR+WX
         +UrIFBsfpUzTg2jGtizsAN/k+44vJTusVpV0J4I3C0eB0Ht+xGHbleAAYr9+2URP2R7I
         4QNA==
X-Gm-Message-State: AOJu0YyKmbFsc3Q+el7nqUwblJSDtTXwKUhM52kPo6VRQwM2C9F2N/wU
	ZSXBfV7PUMEISGOOcePw+WgOO9JLK9G63bFu3Zxz/I3LcDT4wy5KSV4XVyV3vghlKtgPY5d9oiL
	nkZo=
X-Gm-Gg: ASbGncsqE44IxT9lglGyTYQE7OXQuftzPIkxvw85u8CHis8EkmEdKpg41JckquwJS/G
	qZowcteC8k4WDw219qb0Q8IFo4NHaDjAvH7oPcct2tf3guwC26D6X3drZ3fPk43WLuZFlXP6gtN
	TuqlIRBya6QJHUGU8Ke6Iw9eNgKUonF/1mY3E6AV0rCmm2rACAIt0xiUJZ8mZrGcTW0rMyEB38f
	0FhjM6qsW0pGVUJsLYviGQKwDqPJh7UIciymbOsKEreOGD1Y6nHftgNVjIl6fI1UD1wjF/DJJn8
	bWmNu5ORYI+azPLlQRVY2LmFYyGfeTLnOyJA
X-Google-Smtp-Source: AGHT+IHUwydTs1PlYSTsVg1gLukHNq/4TvvejAgO9E/Szg76zWBzac9UdKJJULIz/pGn9zlC3tolow==
X-Received: by 2002:a05:600c:871b:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-4362aa93cb0mr135506755e9.20.1734456592591;
        Tue, 17 Dec 2024 09:29:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH] MISRA: Unmark Rules 1.1 and 2.1 as clean following Eclair upgrade
Date: Tue, 17 Dec 2024 17:29:50 +0000
Message-Id: <20241217172950.43626-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Updating the Eclair runner has had knock-on effects with previously-clean
rules now flagging violations:

 - x86:   Rule 1.1, 1940 violations
 - ARM64: Rule 1.1, 725 violations, Rule 2.1, 255 violations

Fixes: 631f535a3d4f ("xen: update ECLAIR service identifiers from MC3R1 to MC3A2.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

This is a speculative fix, but is the most simple fallback.

Nicola has posted a patch to fix the R1.1 failure (I can drop that hunk if the
fix is ok), but I see nothing so easy for ARM's R2.1 failure.

Also Xen 4.18 needs extra backports in order to build.
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index b5243185915f..982f506cc7b6 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -25,7 +25,6 @@ MC3A2.D2.1||
 MC3A2.D4.1||
 MC3A2.D4.11||
 MC3A2.D4.14||
-MC3A2.R1.1||
 MC3A2.R1.3||
 MC3A2.R1.4||
 MC3A2.R2.6||
@@ -116,7 +115,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3A2.R2.1||MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6||MC3A2.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6||MC3A2.R20.7"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}

base-commit: 631f535a3d4ffd66a270672f0f787d79f3bf38f8
-- 
2.39.5


