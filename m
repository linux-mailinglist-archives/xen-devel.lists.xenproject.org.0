Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F6977A61
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798035.1208173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1D8-0003yA-U5; Fri, 13 Sep 2024 07:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798035.1208173; Fri, 13 Sep 2024 07:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1D8-0003v2-RR; Fri, 13 Sep 2024 07:59:22 +0000
Received: by outflank-mailman (input) for mailman id 798035;
 Fri, 13 Sep 2024 07:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnXM=QL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sp1D7-0003uX-OX
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:59:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a8edb8-71a6-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 09:59:19 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so17537465e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 00:59:19 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b15d4f7sm14953375e9.27.2024.09.13.00.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:59:17 -0700 (PDT)
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
X-Inumbo-ID: 14a8edb8-71a6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726214358; x=1726819158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s81m4dDu+GsYDHEY38AuPUzrRd4NwgnfNSBYHB85vss=;
        b=N9XenvAFYeSzEKmX+EojbKYMtFxntYvToGLRQjxCrn9cUgbo7S2DKK8M+I0k4QVicu
         mdaUnBQb7ph4DU1y45pZcJO38aCUXxi0dF6MOp0Qf6JuDKgBqzm0MayaofdxrR1hOQuV
         16653A7hg6KJFMLy/ZC77FbNIc4tR8dF2LIPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726214358; x=1726819158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s81m4dDu+GsYDHEY38AuPUzrRd4NwgnfNSBYHB85vss=;
        b=Iuo85iceiJOO/S79HAJ7xvuYepnOEdZ/V1q/GekqQDJYO1ZbweqRYgYJsCcgIz10MC
         uXPxip7G/vQyrJTC9EoQc8waWA7sH3YEatkJ8RYmh7kKHURdigFWOMnFj2gzdSmVqeYv
         629Mc+ddke1I6P0GdKy9JiS5ZMdyJUqUVeMC5jiAs4oRfiZD4XN9SwEVqti50iolykQX
         ifyT4kBc1pZk4J8EF7j/L9gP2UF3k3yZ6wNylRYUZEk8pCu/eKzpaF8UrxqMuxKE1NNU
         RCkAXC0FddeGslGWPqKLPbsXSGg5yu/FOq1TiezmQWo5pUBN96JZ3qzPHYemCEtdzpuC
         hDiQ==
X-Gm-Message-State: AOJu0Yy69jXl9+pjmN3XbB4smO34yx8A0qH3W2BAhh73s9bG86dXa4sR
	hTjnZWbdS+vQojniP8h247CN4mUNh4ZQ+B4stZx6QNn3bKmEsRJKTOEP9OVuLPem88BrpL/oQ65
	N
X-Google-Smtp-Source: AGHT+IFzSyJwNoRRs8jUBkw25R0/ac4CSAb6dl2fjNOtzYQkvNr5B77oHC3O9fjSeDU2rMuuzsX5qg==
X-Received: by 2002:a05:600c:5248:b0:42c:de6e:7f4d with SMTP id 5b1f17b1804b1-42cde6e8056mr38634965e9.34.1726214357724;
        Fri, 13 Sep 2024 00:59:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 0/2] x86/time: improvements to wallclock logic
Date: Fri, 13 Sep 2024 09:59:05 +0200
Message-ID: <20240913075907.34460-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an attempt to change the default wallclock
preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.
Last remaining fixes, compared to v6 just some minor changes to the
option documentation and handling.

Thanks, Roger.

Roger Pau Monne (2):
  x86/time: introduce command line option to select wallclock
  x86/time: prefer CMOS over EFI_GET_TIME

 docs/misc/xen-command-line.pandoc | 21 +++++++++++++
 xen/arch/x86/time.c               | 49 +++++++++++++++++++++++++++----
 2 files changed, 65 insertions(+), 5 deletions(-)

-- 
2.46.0


