Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0932B154A3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063097.1428885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrow-0006Ql-HH; Tue, 29 Jul 2025 21:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063097.1428885; Tue, 29 Jul 2025 21:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrow-0006OY-EA; Tue, 29 Jul 2025 21:25:14 +0000
Received: by outflank-mailman (input) for mailman id 1063097;
 Tue, 29 Jul 2025 21:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gf+C=2K=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ugrou-0005Qf-Rj
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:25:12 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8222e94f-6cc2-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 23:25:11 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6154a5344b4so156588a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:25:11 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6156591fe7bsm1587728a12.51.2025.07.29.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 14:25:09 -0700 (PDT)
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
X-Inumbo-ID: 8222e94f-6cc2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753824310; x=1754429110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyDH7RFnvCWvPvskI7xAzNWOfu67uZaUykTUxLk+6pc=;
        b=ayncjUZAKpBANqn4lVJvuxB9nB8CpHG7KfMoOqCj6RPv7/O1vlBhgVjbRsjEAZRN9P
         s3K0wYOCQnYI2+xMj3JixJZe3zrM+V6AFTtiA4LEDHKGBFtcINjumpwe3c4ciR8v+dRA
         INczVYJCz+rRKkGUoYpJiXbDBAy2+7/X8Cc8hzla0ImdpU+jgjOrInzIGoVIFDWoYyuL
         /kzJXzEPKaKKEEZnQXkTPzLrs+4b65kR+i8+pCYGb1+XvBIMkb2Lm+eQKbDtNbcEM2V+
         Jq/X8tOOkuszkBODtxfyOJcvC6tg9fQktdk1M5CDSzjlX+NU7WHDlM/5A/1irXI5S0t7
         5AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824310; x=1754429110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyDH7RFnvCWvPvskI7xAzNWOfu67uZaUykTUxLk+6pc=;
        b=HBIwvMnN6oWpKebr71gbtydq/Hzr1D5lVL5J1sgFHnZdsZupfI36SQtULE6/0sy+1Q
         PIbU02kGGtonBY3VVUPpHMO1sOA+SWmQOP4uncuf4ut/nAnixz1coQGv5lfIvcSGCI58
         Q3eKVjm75rmDx0fyac97NhxDq7vLACvgfAJnih93QdJ6rg5HRbrDFYn5by3sXCG2XvmY
         rqBjnQPqBVIpDUx+eDBLWrg4+5esQIeoHPMLvoJ5TpqN67ZXyEg/hmbFA7oG6buszDYq
         C9RApYTMOdRjuKeG158r26XCMm2lfgVp4rCnnHRHOGB9gJkYNtlQO+QeCctiteYzHonF
         WMNg==
X-Gm-Message-State: AOJu0YzgeQCcocWRmPGjdCb33v4QtKKGD9LT0OGkNFHFf+yDJyPpKann
	Ov5mP6uV44U+kMASidVw5OnnN4UMcDJO14+ajKPnd4xEifp7g/F9QYRezAhrQvg5SfI=
X-Gm-Gg: ASbGnct8aIiQQST6bntwGJ2GOFkr6K8YdCgwX8DUYbLdF1zruTQUF+jpORC5Ko1b+M2
	IrV2apEmSTpaLuzQOsO7nUBGAF/oz3UUfWvJcSZXjHGxNYXkuNmfumkoEuWbsEapwCo7aGrJA0o
	MkWCEw/eu7uyWYdYEIRTk5lq1qkBL0oXOQIKLl1Ick4RYBOnUyKC6Vs4/KbJam013O2Mp9EvUF0
	X2tKEgXtuO4E3HY1eOgOhbiwGdFX0svaBPN62unw91pnsvfRPOif9ZIrg2ARKphuL5D6LfpA0JN
	rXzTlCzoxPadYgUwCAa7jAf+37cRyxTXjWEWaj07ucGxQKDJh+EFTJYraGMkrqu56/2rK++XnaO
	tZA7wWR4yIXrJRJVmAs7gx8Ny7LBD7OBux9YW9+33wZQ2Lp5+BDliKL5X3kdR5zJk5jT/e1MDY0
	Ls+UBNPf8NuQs5vKkgN6Q8MkM7+PVxtN/e
X-Google-Smtp-Source: AGHT+IF9Sgszkc0JO+NBXcSSMtrRUQq5q2mV/CfExnxPSjbsQtacYRnrcLC4A8QdN9Scclj619JSBA==
X-Received: by 2002:a05:6402:26c6:b0:615:7b62:c953 with SMTP id 4fb4d7f45d1cf-61586a7ebe5mr418551a12.0.1753824310172;
        Tue, 29 Jul 2025 14:25:10 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Tue, 29 Jul 2025 21:25:03 +0000
Message-Id: <cover.1753823663.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Changes since v2:
- Added sizeof_field and offsetofend macros to common-macros.h.
- Used offsetofend macro everywhere to make semantically sense.
- Added BUILD_BUG_ON to ensure offsets are correct based on the SMBIOS
  specification (with explanation in the comments).
- Fixed commit message of the second patch to mention the new smbios_pt_copy
  function.
- Fixed nits (empty lines, misplaced *).
- Retained the original comment "Only present when passed in" + added it to
  the new tables where applicable.
- Replaced hardcoded offset for chassis_handle in smbios_type_2_init.

Changes since v1:
- Swapped the order of S-o-b in the last commit message.

Resubmitting patch from Anton Belousov and addressing review comments
from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/2022-01/msg00725.html

Original message:
> SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection
> by malware using WMI-queries. New tables can be mapped to memory from binary
> file specified in "smbios_firmware" parameter of domain configuration.
> If particular table is absent in binary file, then it will not be mapped to
> memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
> critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
> provided, these tables will be skipped in write_smbios_tables function.

Further explanation:
Some malware samples are known to check presence of various hardware components
(like CPU fan, CPU temperature sensor, etc.) by WMI queries. If these components
are not present, then malware can assume that it is running in a sandbox and
will not execute its payload.

This patch will allow security researchers to create a custom SMBIOS
firmware binary file that contains these tables.

Petr Beneš (3):
  tools: add sizeof_field and offsetofend macros
  hvmloader: fix SMBIOS table length checks
  hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)

 tools/firmware/hvmloader/smbios.c       | 290 ++++++++++++++++++------
 tools/firmware/hvmloader/smbios_types.h | 109 +++++++--
 tools/include/xen-tools/common-macros.h |   5 +
 3 files changed, 317 insertions(+), 87 deletions(-)

-- 
2.34.1


