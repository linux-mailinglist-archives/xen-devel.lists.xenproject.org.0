Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FEB15DA0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063644.1429365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YT-00068j-3D; Wed, 30 Jul 2025 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063644.1429365; Wed, 30 Jul 2025 09:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YT-000671-0X; Wed, 30 Jul 2025 09:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1063644;
 Wed, 30 Jul 2025 09:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh3YS-00066r-6C
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:57:00 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ecf4e9-6d2b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:56:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6155fbff3caso364588a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:56:58 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a60e68sm722900966b.94.2025.07.30.02.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 02:56:56 -0700 (PDT)
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
X-Inumbo-ID: 87ecf4e9-6d2b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753869417; x=1754474217; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8yrUkDUbmvWw6QpOZUYaMzX5890jD05I/QnEOpFTEQ=;
        b=MOOg3Tw8pJ8J26bmaEumAiaIuDPKvZfx2qPvxL3WCwoFiMawVqkl09Dp9gSe52jkRJ
         teIRF6I/bGHxbT701u4RUnxcfIbCtVpiaq0hzRnKRBARP/huX6XlaOBj84rlH9sdm3nT
         KWeAVdXi5xiF40zn9WO8Mm23nB5KJb3Moc0JuDafqiGdaINRB5oeqJoNEP642TODyhXe
         DoieeEo384P4U/Kd40u+QVABo98oCd5wobRSVz7FOO5qAmvRBCeNVm3+DFlpIbOWGkk7
         yn2OQXJFhtPbtOnLGA42muQsLCEskNeB8f8ObhUDTT4A7wmjUI+4fSyJYV2HYtwY5Qfh
         3mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869417; x=1754474217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8yrUkDUbmvWw6QpOZUYaMzX5890jD05I/QnEOpFTEQ=;
        b=RxLJrkX4B7asyBC7C1tz/RE6n727T8TvdnwS55LXRDMNvwMkEmZMbdnQLcPlLOhRUC
         dt5Wtqkt+mQI4Xcg+KeK8Tw++mzqbCPI/ITRbqZEDhbJWnJGx0An3jlCvKqXpI1rDK6j
         jxnw+aVyIZ62UgGHJh8Xix1LPvVgBJSY5vLV2BpGVbgX1CPBOAz6F3Uq6lDkRNgeMtsf
         B111SGeO0oZm/MrLI+RMaypLdD6de/BLV3X91DtyFVgs4LpbwJt4/ytTR0WOUiSLY1Ng
         uwE2vCzo2lKlaUs27WHN27PKfql3O/Kon5z4GZ2L7CNBHIbJh9B26Bfrb6Fn5qSKDrUR
         4r9g==
X-Gm-Message-State: AOJu0YxDr/MIvvi8F7vv+K+wTTq8Ci9UEayyorEhOllbjDzjYi4TWuHp
	CNedEqpAPXqEHEiX2P86rPjvFtU3yn+jX+xHXEHOtqEZlUXvBLQWddGwz3p/x0G5IGc=
X-Gm-Gg: ASbGncvXRBaLv6iZ+8iohGGHVWyR+NncYalgEYWSc+IBNK+lXC0pQML4C5gNep7exPe
	NzCKIS5kQmbxlyAhchZem7qfMvZAecVpUeXCYasnZkwHwe5W2tVs85dON9U5sG3wki6VrPD9nn2
	qvmey/VEJ6uoX4orlK5iUjGXEfIdVjOJvWGaY4GxJ0RV8Jw7gVqei34VEB8PlfSiLPf2TMIcihw
	G5D3HLlCPMinJWZIwYt8tB4rB1yQ5tdrJ+5oieMBnibdd8cUbsoAnCliH9pJS10nx3C9+xWjBsq
	My4yEQxXLZXPcq68P4Cwh9uNNM1TdW6ion5bp7sASyQ8aeYKZonAURq/WGaSdPGUeUSEInrlJ5C
	Ta2PaFz8fT15y69cFJTGazTQAz2JfNSGvPrkl5SwyP2ou9Ex0Jh8X4w6vDVpBSIzXRtViXOwFrV
	/wZooO95q2r8t8bb5HRKhCXg==
X-Google-Smtp-Source: AGHT+IE4uoSE5LHw6IlbZF/JbcJjB2CfrMmbgBxywSYGu89UidpuotfblUPk2OYo1VUAfpdco8xWmA==
X-Received: by 2002:a17:907:7ea8:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-af8fd987440mr140261766b.9.1753869417106;
        Wed, 30 Jul 2025 02:56:57 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Wed, 30 Jul 2025 09:56:50 +0000
Message-Id: <cover.1753869323.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

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

Petr Beneš (3):
  tools: add sizeof_field and offsetof_end macros
  hvmloader: fix SMBIOS table length checks
  hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)

 tools/firmware/hvmloader/smbios.c       | 290 ++++++++++++++++++------
 tools/firmware/hvmloader/smbios_types.h | 109 +++++++--
 tools/include/xen-tools/common-macros.h |   5 +
 3 files changed, 317 insertions(+), 87 deletions(-)

-- 
2.34.1


