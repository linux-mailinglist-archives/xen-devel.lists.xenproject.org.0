Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA7B32C52
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 00:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091559.1448076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhP-0001Oy-U2; Sat, 23 Aug 2025 22:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091559.1448076; Sat, 23 Aug 2025 22:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhP-0001Mx-Q6; Sat, 23 Aug 2025 22:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1091559;
 Sat, 23 Aug 2025 22:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFF/=3D=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1upwhO-0001Mm-8e
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 22:26:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474c3ff9-8070-11f0-a32b-13f23c93f187;
 Sun, 24 Aug 2025 00:26:57 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afe72d68b88so27166b.3
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 15:26:57 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fd37fbsm252045166b.47.2025.08.23.15.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 15:26:55 -0700 (PDT)
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
X-Inumbo-ID: 474c3ff9-8070-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755988016; x=1756592816; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWAQYC29GuHHgHDgQr6y7j5EKyvy8UjM5c+HdF6B8X8=;
        b=JTs7KXRtpm2PghiOSg0EgbIp0ZdUxBCn5qbeu4UjoDBxVbCR26fXQBA4QXCJQlD5DU
         xx8nphbbpLlA7iINJR9VEAQ1Fksi06KGdhZ5jZA/rtBqvV3cbpUNZklR0LSt58PMggDJ
         m73GWY4UbRzAp38uMui1BUqmwfyQZhBRL57smoddUq9jHPXZjE2VrFZvY68cPLfPnVdB
         APNI4mMTqJMxmnfYNmAGYBqZfXyPMzAAERNbSPguB4NtIL37ywTlU/n5570vAuLvibjN
         fwsNFJxjApAbWSsLHQ89C/Dnme/HrmlybKCOihGapZiexA8hKXoGHxUhoIGmV0JDTeQN
         RmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755988016; x=1756592816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWAQYC29GuHHgHDgQr6y7j5EKyvy8UjM5c+HdF6B8X8=;
        b=LrsHvj/DJgRZWRrxkxolFupEqxpazQ9HM9Y5nSTWKvSq8Z3an5oGBoaoQTfVZqHS4+
         tIi5/A+prCn6EuD1nPaFYt5zHTaYlCd+OEOQ68E69EF3s6WQXWhQbDqpOGh4HmB3bQ2s
         aGshIlkfAdgEZowixq1zEXrinnqLebJdEb7jI3DlcDTRDFw1o/sBNB8KGEUYlDpvVvjS
         v3V6aBu4Coyvgzlg0WQNzETDrrQBPJ7Ig87J4hyN3Lk/IR4WRI2D20ei77zuxlQqyWgN
         +BeeFzHFi6mj+DK9x8JlHL/zsocIRaiy6O9CXANtLMzDcjHDhQyAksRnMQClG9hvrOUw
         oezg==
X-Gm-Message-State: AOJu0YwrkkmW8VuAxmiyTdkj5aVNy2j8l7oATu0aD/ylkKlZ5f+Zykep
	p4SRTcuESegrjo1oQsxqOEXAx83PoNu7JOrQZKUIrDuEgIEUSMavRIYE+vDJFQ==
X-Gm-Gg: ASbGncsQqV/8hhvf5qjHbhAv6EFFnA7OujWjdBulRb3cu5JiC+NIhPeSEzsTwpJibfc
	eamdSRE16Mwl/tFSzyeDnO/0SnJcrHjVfsB+NkeNtkAiNky1G8RZHudi9wNGpPUWi7tPmPb6k0R
	QuXpuUWvmF4qer6YI2Nqp41Pu7RNnP1QZQRcV7+4pgMlI+bhB5fghIkVLJ+r+VfgVoVA9VB7PQ7
	TqqYeyvP8uk8RrWYXonVksVzqeXsrHY8Ia2cMtWTW6tro6FpiCNPSKSdgwoOwvCs8Ev8c6hp+D8
	GhFPTyuTrlgaATBWlJUeLhwXbgKRe2gozwBjRZiwg0K2Op8Mq/vE3RuIi1Eu7OydXgal94RYF70
	IzL/1N9WqKIH5u89b1pWg/3+RsxhyIhIlmgHx8v5q+LB37liNdfqMczbt74NmKO+0wfHmCyPH9Z
	cDMHAa5xjOCckJUDjjw/X18g==
X-Google-Smtp-Source: AGHT+IFNw91vjPbc0/vvlrWP6Bpqv6jy9sGlC/GDq/2jFHqc8E+81XvcNEqXVAL4mPKsSEXB95IqYQ==
X-Received: by 2002:a17:907:7f29:b0:af9:8a71:e090 with SMTP id a640c23a62f3a-afe294d9993mr335235266b.9.1755988016041;
        Sat, 23 Aug 2025 15:26:56 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 0/4] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Sat, 23 Aug 2025 22:26:48 +0000
Message-Id: <cover.1755987697.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Changes since v4:
- Renamed offsetof_end macro to endof_field.
- Added mention in CHANGELOG.md.

- hvmloader: fix SMBIOS table length checks
  - Changed `table_size` parameter name to `min_size` in the `smbios_pt_copy`
    function.
  - Fixed typo in `smbios_type_2_init` function where `smbios_type_3` was
    mistyped.

Changes since v3:
- Renamed offsetofend macro to offsetof_end.

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

Petr Beneš (4):
  tools: add sizeof_field and endof_field macros
  hvmloader: fix SMBIOS table length checks
  hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
  CHANGELOG.md: add new SMBIOS tables (7, 8, 9, 26, 27, 28)

 CHANGELOG.md                            |   1 +
 tools/firmware/hvmloader/smbios.c       | 289 ++++++++++++++++++------
 tools/firmware/hvmloader/smbios_types.h | 109 +++++++--
 tools/include/xen-tools/common-macros.h |   5 +
 4 files changed, 317 insertions(+), 87 deletions(-)

-- 
2.34.1


