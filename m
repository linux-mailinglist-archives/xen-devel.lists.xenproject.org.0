Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517998A66DC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706798.1104207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevC-0001Ta-EY; Tue, 16 Apr 2024 09:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706798.1104207; Tue, 16 Apr 2024 09:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevC-0001Rr-97; Tue, 16 Apr 2024 09:16:10 +0000
Received: by outflank-mailman (input) for mailman id 706798;
 Tue, 16 Apr 2024 09:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwevA-0000j0-DQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f503c26e-fbd1-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 11:16:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso512106966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:07 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:05 -0700 (PDT)
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
X-Inumbo-ID: f503c26e-fbd1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258966; x=1713863766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L5gTKzhiipTLmXWv/M3h8GXKJ30XFqq9tUQkMs7y54=;
        b=bOkaKFjMhNuUeICsj4Kb/zaUNlqdoUInm5//RCaxOUjHwVX86j7VcuBkFSlJnAy50Y
         QEr70VoUrQBphwDXecZycAxA8caAV05DE/wGO71czteAjy+y7v3qDoxELqsGF4tyFHQ5
         +iH0yJG6HrLJnPZx4J9Uy7U2FwZNpojCH4UfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258966; x=1713863766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L5gTKzhiipTLmXWv/M3h8GXKJ30XFqq9tUQkMs7y54=;
        b=kOZk74AdXTIjlVIVhiLJT2pC9rJyup35fxRRwYRFgLWgdde7WXzS6+YGQn4couSmFd
         iCzhzjLWkOUSg2BxJFTiZBabXsah0zkAjYMq2O21Pj6dFLo161opdX181LTwe7h7CS5S
         /5574pv4dUwZlj9t8EQo2cXSZV9qHzGWGiv75fDDHPp0PZ10D94XjbCK8fjdLQ/k8XVt
         yiZmTvgXAlTBurUsalLV8Ggx+XypoNX1t938LZYP/9hJzQGNuJV8k8BSp94JDKYD4c8r
         n+5kIZHE9KKhLht1Gv8KXQ6lO4u5h0YnAI1kLpZGhL01qvXgeQsJUAQzk690i9Q2kZcO
         AK+g==
X-Gm-Message-State: AOJu0Yzb2IbWVRsr1qFgqs6+L6YEekf5Wr9wvkjWGm36dlLwbcF6V9Uy
	aI2JVqnfqBzgldtZ8RJQB//GZWbC5T84fDFgAdqm96tMLb0znjVuaw2P+U1msSEgzFbv4mpyHBv
	9
X-Google-Smtp-Source: AGHT+IFZEmBGqBvnw2Jp/PJNHnVx1tMBkCNCPTVTjpqTQ1tLdZHbYTcE8DSmFB2Nf2q5YLdd+VNC2Q==
X-Received: by 2002:a17:906:af14:b0:a52:68db:9fe7 with SMTP id lx20-20020a170906af1400b00a5268db9fe7mr4714628ejb.11.1713258966751;
        Tue, 16 Apr 2024 02:16:06 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/5] x86: Add usage() to print out usage message
Date: Tue, 16 Apr 2024 10:15:44 +0100
Message-ID: <20240416091546.11622-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416091546.11622-1-fouad.hilly@cloud.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor xen-ucode tool by adding usage() to handle usage\help messages
As we add more command options this will keep help\usage messages in common block

[v2]
1- Improved message description.
2- Fixed formatting and indentation.
3- Error message to print to stderr.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 tools/misc/xen-ucode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index c6ae6498d659..0c0b2337b4ea 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -17,6 +17,15 @@ static xc_interface *xch;
 static const char intel_id[] = "GenuineIntel";
 static const char   amd_id[] = "AuthenticAMD";
 
+static void usage(const char *name)
+{
+    printf("%s: Xen microcode updating tool\n"
+           "Usage: %s [microcode file] [options]\n"
+           "Options:\n"
+           "show-cou-info   show CPU information and exit\n",
+           name, name);
+}
+
 static void show_curr_cpu(FILE *f)
 {
     int ret;
-- 
2.42.0


