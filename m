Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1950854664
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680321.1058402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBs7-0002pi-QD; Wed, 14 Feb 2024 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680321.1058402; Wed, 14 Feb 2024 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBs7-0002nT-Ng; Wed, 14 Feb 2024 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 680321;
 Wed, 14 Feb 2024 09:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luzD=JX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1raBs6-0002nN-2w
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:48:06 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 266a492b-cb1e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:48:05 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5638c4a8d6eso136572a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:48:05 -0800 (PST)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 en14-20020a056402528e00b0055fef53460bsm4533356edb.0.2024.02.14.01.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:48:03 -0800 (PST)
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
X-Inumbo-ID: 266a492b-cb1e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707904084; x=1708508884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig7a6sezO7NNmP42wrTc3CZvvVY9+4eNvCDfnEN1+HM=;
        b=OCblBN70QJfBS2nmi+H+VAfed9opb11UrCAe8fmJn2JFUKtnzo3I81EQb5aRrJlCcP
         egIeorqyPaa4ggBE5T0ntKM3ICJTUCt+e1wt9YR357t3fYrLuaq4UU95MLzHDhTy849R
         ru4fCYaKKBbvCv8PShix1+ATBB8pK4obCf7xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904084; x=1708508884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig7a6sezO7NNmP42wrTc3CZvvVY9+4eNvCDfnEN1+HM=;
        b=WJ30B4ui+6SemLmAR6PSxRuiCfStPxesMmSGw9D9JLFDfwe1pX2ZjverlIp1LKfiL0
         pSsVgGxWvGbSDWuliySphhie0eMjmRKFO9kgDd1hJ0f3tTZim8Q1nsr5DxqNt8yzWXo3
         oW0jHPk7woQgT715+1GHdKzKwh34F5H7ONQomUQPoiwzRUH2RtXoYxfA+L8aB7cNWFJ0
         tNM/dsHJ7AQqOSfK/sdvjSxyZX3h56f64HQEnI1DHU6EgzlEzztCO1HZrJVV8b7XT6/z
         5gUaIOvcihzoeOaBYL/a33m5Kctvk/SRveY/c6qKWOnX1KWN9arnFx4Ss5VrHuq0H9ei
         dSKQ==
X-Gm-Message-State: AOJu0Yxrk/eNjqedPayfGcNQ0EWE69SQLXq1lTHjtdOlBfILGqdA14yA
	Ku5PQe5iirTigPdC7JA9VgaXwMbQCHSgrax3xHDd28B+aRQWkGNG5qkISqZITuXRVQFXRK93CIY
	eHL8cHw==
X-Google-Smtp-Source: AGHT+IHhPGxThXgl+Cl+4R/HAmEAJWeQORbF2Hq40kMHECeMXUANbn8YZYl48tmPJZb3SE0lHQXvzA==
X-Received: by 2002:aa7:cc0f:0:b0:561:fe3f:695c with SMTP id q15-20020aa7cc0f000000b00561fe3f695cmr1534882edt.36.1707904084169;
        Wed, 14 Feb 2024 01:48:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVHOdwH2E+s6sG0Is3Wplpaj7z45Q1NnJHErQnEBqkP8hwhcjCFfT2cL8IQMnmLkzSafatoS0gV/tle5Rp7jEtqRrvlhVUoYhsMwKulcVIY7p/nGjC/a7I/wyoIcU2NNMCsZmMPGin9BwN1kJUe5knvIiTUnLlyVPavoit+bv/nifEjdSz1x/z+DFgGmwT/KkYsTyj6KKXEOAiVCaHlq8bDtkjTyVdddRfRxRjh9fQ5f10AZCLizLDjsrh6QzMmtvn0Gp1K4MvGbN6
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2] Constify some parameters
Date: Wed, 14 Feb 2024 09:47:34 +0000
Message-Id: <20240214094734.13533-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make clear they are not changed in the functions.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
--
v2:
- fixed typo in commit message.
---
 xen/arch/x86/pv/callback.c | 4 ++--
 xen/common/sched/compat.c  | 2 +-
 xen/common/sched/core.c    | 2 +-
 xen/xsm/flask/flask_op.c   | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 17829304fe..caec4fb16f 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -48,7 +48,7 @@ static void unregister_guest_nmi_callback(void)
     memset(t, 0, sizeof(*t));
 }
 
-static long register_guest_callback(struct callback_register *reg)
+static long register_guest_callback(const struct callback_register *reg)
 {
     long ret = 0;
     struct vcpu *curr = current;
@@ -102,7 +102,7 @@ static long register_guest_callback(struct callback_register *reg)
     return ret;
 }
 
-static long unregister_guest_callback(struct callback_unregister *unreg)
+static long unregister_guest_callback(const struct callback_unregister *unreg)
 {
     long ret;
 
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index dd97593630..a02204ec9a 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -26,7 +26,7 @@ CHECK_sched_shutdown;
 CHECK_sched_remote_shutdown;
 #undef xen_sched_remote_shutdown
 
-static int compat_poll(struct compat_sched_poll *compat)
+static int compat_poll(const struct compat_sched_poll *compat)
 {
     struct sched_poll native;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d177c675c8..c5db373972 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1431,7 +1431,7 @@ static void vcpu_block_enable_events(void)
     vcpu_block();
 }
 
-static long do_poll(struct sched_poll *sched_poll)
+static long do_poll(const struct sched_poll *sched_poll)
 {
     struct vcpu   *v = current;
     struct domain *d = v->domain;
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index b866e8d05f..ea7dd10dc8 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -469,7 +469,7 @@ static int flask_security_load(struct xen_flask_load *load)
     return ret;
 }
 
-static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
+static int flask_devicetree_label(const struct xen_flask_devicetree_label *arg)
 {
     int rv;
     char *buf;
@@ -492,7 +492,7 @@ static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
 
 #ifndef COMPAT
 
-static int flask_ocontext_del(struct xen_flask_ocontext *arg)
+static int flask_ocontext_del(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -506,7 +506,7 @@ static int flask_ocontext_del(struct xen_flask_ocontext *arg)
     return security_ocontext_del(arg->ocon, arg->low, arg->high);
 }
 
-static int flask_ocontext_add(struct xen_flask_ocontext *arg)
+static int flask_ocontext_add(const struct xen_flask_ocontext *arg)
 {
     int rv;
 
@@ -550,7 +550,7 @@ static int flask_get_peer_sid(struct xen_flask_peersid *arg)
     return rv;
 }
 
-static int flask_relabel_domain(struct xen_flask_relabel *arg)
+static int flask_relabel_domain(const struct xen_flask_relabel *arg)
 {
     int rc;
     struct domain *d;
-- 
2.34.1


