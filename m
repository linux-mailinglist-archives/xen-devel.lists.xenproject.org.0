Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5479D5C05
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841792.1257286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3S-0003SK-9Y; Fri, 22 Nov 2024 09:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841792.1257286; Fri, 22 Nov 2024 09:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3S-0003Qr-6n; Fri, 22 Nov 2024 09:34:22 +0000
Received: by outflank-mailman (input) for mailman id 841792;
 Fri, 22 Nov 2024 09:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6Qa=SR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tEQ3Q-0003Ql-Jx
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:34:20 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c8e8bf-a8b4-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 10:34:17 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53da209492cso2458122e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:34:17 -0800 (PST)
Received: from localhost.localdomain ([87.115.149.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16abasm21427775e9.19.2024.11.22.01.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:34:16 -0800 (PST)
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
X-Inumbo-ID: f1c8e8bf-a8b4-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYxYzhlOGJmLWE4YjQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjY4MDU3LjY0NjYwNywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732268057; x=1732872857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdhs4jcbDFlFFzmNHEzzHfFqOMcAoZVWgm6V10iGPu4=;
        b=QMTRpoHFYgRrpOMWC3oZO60pDCAJS22h5rGO7gYU5xY1ZujQO4wXO5qkK1RKiUSsg7
         fWh+Nxq7AvLlzTNYaECzSLvhsX/qoNtWnp0nj/TBHduV9dWpjMtzR24ahf4Nhv/B8Lva
         vnlrwPorsvkUG9AY+IyHG3E1Q0lN3jMU9CLNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268057; x=1732872857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdhs4jcbDFlFFzmNHEzzHfFqOMcAoZVWgm6V10iGPu4=;
        b=XigVV+a5dgjtjaBgmc4wBBokuVGDXJ5fwDqQVZ49tAqpFRabhVlXCu8JRU/6q+JIHC
         5wVnUTB6sb2vumInwDg1ieYyYzPThSPoesnWEdGtFrWMvZ46fW+8f7QqdA00RymhzKMw
         SHn29JgxwdWdpfUYmYSFaqHqutJbi2SYMB5klSUjABgLBk14Om8l2SQO4NvmpQEA+XXm
         glnk8X2uWzQMXMcav/VQIo9uvbM6iNMG95akl47mxVrU27WnRHRZW3VDadAacA00zqSs
         LXjv83Napeqx8d1GXJi2UaZdkP9DW/lP0FDh1a48GdqEsAKTSEohs4rzaL8qc0r6vntk
         7p5A==
X-Gm-Message-State: AOJu0YyPvYrqgHz4TMjwhBA9iHmOECfneLWkZhSQeORY3lLeXNbD1Xxv
	d5oLOuiiPDMYRymnH9vLvsq8qTQtiTFQEbcfkKCW2n9YrlNd9xTh/uZA6yDbenNz487z7kDw1NS
	k3SM=
X-Gm-Gg: ASbGncv1wqQblWQ6xxa27IL0bxGN15pUI8cQK4AnbGkDp/s0Nwaq8t/9jZIDAM/lm1G
	fpGJqRkps4U1e8LZF6tDi/U0pOdLmVr4KNxZlBPoQm8UDEWyFyZ8ohYpXP8OQI5H/rZMIVLgUfs
	lWchQLpejnNIqh8RlVamZZDqNo1HSFZb3C4+lwJd3yziWJvHSpwOYU/6yEwP6KA2JfH3WIccSPJ
	BuUgfrSCEUqGS8YGhV2Baz6ksA/xMvujU8M0R228iUlXLrLWZGXRnyrpKcZ3tKWvVp9dg==
X-Google-Smtp-Source: AGHT+IEV8aYIw9TpSIaQ5E1RHmGBfEw1kHFU5jxaLvXe6o5R5KYuVzDDQx+VVnWOhcQqblWwoFIc6w==
X-Received: by 2002:a05:6512:1089:b0:53d:d8c8:8324 with SMTP id 2adb3069b0e04-53dd8c88400mr281401e87.53.1732268056866;
        Fri, 22 Nov 2024 01:34:16 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/4] Move some boot code from assembly to C
Date: Fri, 22 Nov 2024 09:33:54 +0000
Message-Id: <20241122093358.478774-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a continuation of this series start sorting out the issue of headers
not compatible with 32 bit.
Instead of having to change headers which are almost only used for 64 bit
allows to override headers or move reusable definitions to new shared
headers.
This results in less changes.

Changes since v1:
- rebased (with conflicts).

Frediano Ziglio (4):
  Use an include/boot directory to override headers for boot code
  x86/boot: Use header to allows inclusion of public xen.h header
  x86/boot: Move some settings to C
  x86/boot: Use external symbols from cmdline_parse_early

 xen/arch/x86/boot/Makefile                |  2 +-
 xen/arch/x86/boot/build32.lds.S           |  4 ++++
 xen/arch/x86/boot/cmdline.c               | 14 ++++++++++--
 xen/arch/x86/boot/head.S                  | 19 +--------------
 xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
 xen/arch/x86/boot/trampoline.S            |  2 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
 xen/arch/x86/include/asm/setup.h          |  2 ++
 xen/arch/x86/include/boot/public/xen.h    | 28 +++++++++++++++++++++++
 xen/arch/x86/include/boot/xen/cpumask.h   |  1 +
 xen/arch/x86/include/boot/xen/string.h    | 10 ++++++++
 11 files changed, 83 insertions(+), 28 deletions(-)
 create mode 100644 xen/arch/x86/include/boot/public/xen.h
 create mode 100644 xen/arch/x86/include/boot/xen/cpumask.h
 create mode 100644 xen/arch/x86/include/boot/xen/string.h

-- 
2.34.1


