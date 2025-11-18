Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F59C6A5B1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165059.1491917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNoA-0005a0-JW; Tue, 18 Nov 2025 15:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165059.1491917; Tue, 18 Nov 2025 15:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNoA-0005YW-El; Tue, 18 Nov 2025 15:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1165059;
 Tue, 18 Nov 2025 15:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLNo8-0004bv-CJ
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:39:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a07829-c494-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:39:51 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so8422762a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:39:51 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-54.as6723.net. [185.5.253.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm1391385266b.40.2025.11.18.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:39:50 -0800 (PST)
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
X-Inumbo-ID: d2a07829-c494-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480391; x=1764085191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IRZHY2U62t3jJH8sNLFrWyIhFyWb8Ge0US4ibpnjnE=;
        b=LWRITPWh5gTFs20m/0PFieZwbbjZZyjFJ/JhTtbo64K/NvXUcL/9keHy/0G49j54uJ
         wMe7lQ4PFIRe709S7DDwwnRO+SIqm6Ma4o+c7tb+SQfHQQ2DkuSK23yJnM1ehQlw2R8M
         XgdVnue3uBjTM59NTG2viVEafHmlVvrbVNPYLAtQY/YuwpxISKv466yLZVf3m2ck2xqJ
         0/xQVHNaOll0PalrVuNfIvymB6YtIL7FQuGQoZmdFAGTAWFjdLFnPPZMP+reCiVySguu
         BI+1dtjR2/5ORHUv6Czeah+ZuY5+9+cx/kGYMzPtYnd0UiJUip1mzEzBTkTKLPCQ4I2x
         ApIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480391; x=1764085191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IRZHY2U62t3jJH8sNLFrWyIhFyWb8Ge0US4ibpnjnE=;
        b=XlqchoFdaG5rqWxTdFrNp6XAWdWAHSgOORhV97FFgeL1f4ZfkBCnOZJSE+D4WB0p2w
         QyYv0k8Dm4wC+JpVV22sLyphspLu3DExBYZCL8hC0ehnVmeMZcUMKGndQxwXUN1zr55q
         T0MhGSbCyRg5+UgrjdP56a+OdwzaGOMCUtoqPfwLcUxHrMh4TGTHpv5q30UGjigH+54/
         T/eQ7Zx00UfAvzTUDCgIRt3C0Iq+WzVw7mmsVfuvnE4t+kuJcAUWEcRy1wOiBsoRx8pj
         IMGo4zNpOm7FKOiWgRuKimb6B6HtdD2ULDvUhyDuRnipyzE7b48u4GlN7vKhuUgceQhW
         KKzg==
X-Gm-Message-State: AOJu0YyKwq7csbaKF1CRjbZ5pwoGgeQdTAYAHaOQ2KbKet2M03gHrC0v
	HsS8p9nKN0A3mjS222eCJ+9WJ0ijDSk40nazNvvFV9yNh5VJpVCN41/qBt0VYZ74HUE=
X-Gm-Gg: ASbGncsAgN8oWy9siWl4c9v5MhfcVYMnYsbF7I44u0UdxZVW+uGjBhOm7MNa+JWirjt
	H1js2bJyxfqxScilB3tF77Zj056/IiLPpMYckD+tyTJ29UvXp1UnO7S1gvGz/fsPG4AvelixALF
	+7F9cvSr3EFcT0Xw9umGrw8DfETuFHmAEMHq3v9yqJDUzrPtZNeb6yJFj3bApTxO3sNNOFhFQ02
	TjomYSIU8yCYk8HcKuiCoJeRE6jPVll2pIAAR7bi2TH68uLCLoGhzpZrZ6OWgLudVrn0d4aBjdC
	zO29U5Uto05pFygSWT87mP7uXdYC+XNDzQsb3DksyMcl70R444j5eJPovqVD25vPXb6w7TnNOv7
	ZkUF/Fz2lEjHR902OyKe5Shvdu2Wg6AqTZWi3uhPM+XG+qVi/SgKE6aPq40tBqop9wvu/eaPB5z
	sigy58areHr+Sq6J2XMgDtrKhypOneUl0Q
X-Google-Smtp-Source: AGHT+IG0on2rt+kR/hnHKEOXOoOo/qs/TkBN8/J/wlTjHcZFcjGqGEuTJtAJEvsKjtMhnCRCv7HwnA==
X-Received: by 2002:a17:907:1b02:b0:b73:8c6e:cf6f with SMTP id a640c23a62f3a-b738c6ef474mr1192116266b.32.1763480391021;
        Tue, 18 Nov 2025 07:39:51 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v14 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Tue, 18 Nov 2025 17:37:31 +0200
Message-ID: <8ed791c2471a23bf63715c16df519c86e0699157.1763479083.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763479083.git.xakep.amatop@gmail.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Chnages in v14:
- moved s2ram changelog to 4.22 release section
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c9932a2af0..fd4657ea42 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Added
 
+ - On Arm:
+   - Support for guest suspend and resume to/from RAM via vPSCI.
+     Applies only to non-hardware domain guests.
+
 ### Removed
 
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
-- 
2.43.0


