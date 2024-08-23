Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D852195D3FC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782500.1191998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXj7-0004FF-D1; Fri, 23 Aug 2024 17:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782500.1191998; Fri, 23 Aug 2024 17:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXj7-0004Cd-AL; Fri, 23 Aug 2024 17:05:29 +0000
Received: by outflank-mailman (input) for mailman id 782500;
 Fri, 23 Aug 2024 17:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLJ=PW=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1shXj5-00048i-FH
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:05:27 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4b939f4-6171-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 19:05:26 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b3so2908170a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:05:26 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eb329sm2311240a12.55.2024.08.23.10.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 10:05:25 -0700 (PDT)
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
X-Inumbo-ID: e4b939f4-6171-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724432726; x=1725037526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvsmhrQ58ty42PuHWnq4wbr6/fL17Z3aKlW9teCKYaU=;
        b=PWZxF8TsuPEnUt2TolfOqOkrB3ZspUmSGpYn9Qhi9DR+61oke33LvT3DSqhhwqZPWo
         JlQ7CqwxuZeJDbzjjoXkr4iHIAu4gILO1PGwglE+Bw1xDwuu5eELFwHNwtLzFQgClji1
         BfoQDWJkX552dlvxPeAvgI7CDhaX9nEHE+BdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432726; x=1725037526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvsmhrQ58ty42PuHWnq4wbr6/fL17Z3aKlW9teCKYaU=;
        b=XCSeiCzNm5KZ47mnZulrqbKafHcuMeGXF6mrLDwJWS6OOVapvYHymg3WqBSQR5Bqhn
         YchtVypoB7pAl05wXUexf9HoSxC/SbTis5sb4mwPbigUS/WIdQwR0VXTgy+atQqyLb9t
         pyu3MifQ8lYv27EcjIjMgIQnIMoxITQFupPSDNw3VRt82tCVobLFdbPqZYIGLErLlyMM
         xhCDGSMsE7d6+fIZpXnfte2bt7QDIn4cBor3kIF1i17wf+NlxIT1T1RBdvXs7Cns+zUg
         6k7FhMlJ2Rvynf3wAfTa+dSaTVrYwj7q7MpXjVrLDMrAr4T/MtVdAjLem04POnZXzHFW
         +BFg==
X-Gm-Message-State: AOJu0YxSWU5VJ16AcJERg7gslsTz/DrxrGrwTHrvTmxv9BuvqjCbfUns
	R1Yzo+J70w8odnu3CbAYmXf41i4nsB6L06BxIRkV7N4BH6lCWxas865NvaJsuW4q+/vPvElw8lX
	Y
X-Google-Smtp-Source: AGHT+IGV0yrZDqhOVx4JNFSFoQNS2SQlvfJx689/qtzw+625UvSPEP90JWnJn/JSguaXcYgLIwA+Nw==
X-Received: by 2002:a05:6402:40ce:b0:5be:db8a:7f60 with SMTP id 4fb4d7f45d1cf-5c0891a2680mr2403755a12.25.1724432726109;
        Fri, 23 Aug 2024 10:05:26 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 0/3] libxl: Fixes for libxl_xenconsole_readline()
Date: Fri, 23 Aug 2024 18:05:02 +0100
Message-ID: <cover.1724430173.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix nul-termination of the return value of
libxl_xen_console_read_line().  While at it, remove unneeded memset()s
to the buffer and improve the documentation of the function.

Changes since v1[0]:
  - Add Fixes: line to the first patch
  - Remove cr->count from the struct and make it a local variable in
    libxl_xen_console_read_line()
  - Improve the documentation of libxl_xen_console_read_line()

[0] https://lore.kernel.org/xen-devel/ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com/

Javi Merino (3):
  libxl: Fix nul-termination of the return value of
    libxl_xen_console_read_line()
  libxl: Remove unnecessary buffer zeroing and zalloc()
  libxl: Update the documentation of libxl_xen_console_read_line()

 tools/libs/light/libxl_console.c  | 40 ++++++++++++++++++-------------
 tools/libs/light/libxl_internal.h |  1 -
 2 files changed, 24 insertions(+), 17 deletions(-)

-- 
2.45.2


