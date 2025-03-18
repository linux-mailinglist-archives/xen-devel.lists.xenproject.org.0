Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF2A66F8B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918737.1323424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6f-0002gu-PR; Tue, 18 Mar 2025 09:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918737.1323424; Tue, 18 Mar 2025 09:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6f-0002e4-KU; Tue, 18 Mar 2025 09:19:29 +0000
Received: by outflank-mailman (input) for mailman id 918737;
 Tue, 18 Mar 2025 09:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6e-0001Er-87
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:28 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ffc46ad-03da-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:19:15 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso3343590f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:15 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c83b6a5esm17233468f8f.27.2025.03.18.02.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:14 -0700 (PDT)
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
X-Inumbo-ID: 0ffc46ad-03da-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289555; x=1742894355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmrsNxmPFMcDU/0FE/LlGq4pqbqDd0zeMT19NxNaJd8=;
        b=qd7upFYqht9JmRL4K4Jb0QgDQSMTivU7q001rFxBZ4I0EsHNX4SYxqnc+sqgHBqSlg
         5D3D75Vz4EAn8igQnREy/RUiN+rfQXLaErrL3mbQmtwWh5AxoANB/3PlayGtgCAAWddr
         G9g90l4yLC1rOhIcIvabdjekGVFWG8CbQWfno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289555; x=1742894355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmrsNxmPFMcDU/0FE/LlGq4pqbqDd0zeMT19NxNaJd8=;
        b=GKgZIxF2dDU48OcssVulrK4hUBbOQbz/6ktrr7GONcjhsr3hufN1thbEyvi55h9Xdd
         tiwBLc2/YylBu8eLE3JoD+Jh/BP+2l7TibcOa8E4qZ5Z0ucwSu/1mB11PoFN8hJEN0qs
         lBxt8X4FhTSCKtEzqzA8IqVngK83OIq5gH3lEu80Wwdc0AbeYt8dCuO2bypi9DW9otfH
         SCZrljp97opvKLvuhhYfEvDXNaUaUpB21PQHzyLAQRM1Rt8Ysi/aWiGzgpUsMg0IB6Pv
         /WeAI15IEbX88IlqpzrVQLptPXWM9PbG7DjcEalxfcW8A7Tj5wLeWCTwyOsQ1EIJ7gW+
         5WfQ==
X-Gm-Message-State: AOJu0YxDKEKWgi1B60cJrvTt1gqurOA2H0rIxmKYHKI5kWle1lPFW+l0
	LgLwsCC9u4fiLzePlwgTNJdYcDF1gJo5lgVoi17rw0jYlCjUmJ+uBsFjnnwyu3iGbAeClhgTE8t
	J
X-Gm-Gg: ASbGncsU+n9ODOkAFMJ4DlAAU2FCtp8tgjJoV0u8ZBnhQ5nScjsqKZWqyM/3x3Cq6Dv
	u/utmtXQCa4QA67cn1toPRceVnxRpCBfQ/eEAALKWirdE45lc2buxjOUVhwlUjpa9ocq/oVJb2J
	BRE95RXUlWKbPTwRT3GKaz3nOTbFX2y1jGPip78bSN5VBOMEFa+zmyf6YSjfENcLs1QGPBq0F8L
	cTS3K+3vJKpFOf+XKdzdW0a9TzzZWOC4KE6XAkd2SPlkK2TdhfzYOBCKQaDIapyy2COhopTYvgV
	hZ9LFOjviRdNwMp6/WZJWvwN0HSNAp21x1uiZRywIKCkcyFEYA==
X-Google-Smtp-Source: AGHT+IGeTIvxd0nXZklEIGiktmO5oQTbEXQrwZr45Y5vjaaVlL2h8FIa7CWb/k+NcEwXxFNnCb6gJw==
X-Received: by 2002:a05:6000:1849:b0:391:3915:cfea with SMTP id ffacd0b85a97d-3972096266fmr22736642f8f.38.1742289554936;
        Tue, 18 Mar 2025 02:19:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/5] x86/ubsan: fix ubsan on clang + code fixes
Date: Tue, 18 Mar 2025 10:18:59 +0100
Message-ID: <20250318091904.52903-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This started as a series to fix UBSAN when using clang, and the first
patch do fix that.

Finally patches 2 to 4 fix bugs in the code highlighted by the clang UB
pointer arithmetic detection.

Patch 5 was the original goal of the series: be able to enable UBSAN for
randconfig.

Thanks, Roger.

Roger Pau Monne (5):
  x86/wait: prevent duplicated assembly labels
  x86/vga: fix mapping of the VGA text buffer
  x86/xlat: fix UB pointer arithmetic in COMPAT_ARG_XLAT_VIRT_BASE
  x86/shadow: fix UB pointer arithmetic in sh_mfn_is_a_page_table()
  kconfig/randconfig: enable UBSAN for randconfig

 xen/Kconfig                               |  4 ++++
 xen/Kconfig.debug                         |  2 +-
 xen/arch/x86/include/asm/x86_64/uaccess.h |  6 +++---
 xen/arch/x86/mm/shadow/private.h          |  3 ++-
 xen/common/wait.c                         | 10 ++++++++--
 xen/drivers/video/vga.c                   |  4 ++--
 xen/tools/kconfig/allrandom.config        |  1 -
 7 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.48.1


