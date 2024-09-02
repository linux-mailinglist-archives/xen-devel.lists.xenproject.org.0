Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7CD968C22
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788264.1197742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4o-0002MU-BR; Mon, 02 Sep 2024 16:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788264.1197742; Mon, 02 Sep 2024 16:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slA4o-0002KX-7z; Mon, 02 Sep 2024 16:38:50 +0000
Received: by outflank-mailman (input) for mailman id 788264;
 Mon, 02 Sep 2024 16:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSuM=QA=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1slA4n-0002KR-EP
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:38:49 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c3b156-6949-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:38:47 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c25554ec1eso1441883a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:38:47 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c74184sm5714163a12.32.2024.09.02.09.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:38:46 -0700 (PDT)
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
X-Inumbo-ID: d3c3b156-6949-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725295127; x=1725899927; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bvaQLZ3SSfvR80IrbDb1ZIiEruL7absvB74n+D25Sas=;
        b=Oq0SOfzFSy1EalUmmZW8T6si9P/XUT7cVl5ijAAids3orePF9Jkq4iWCmMErTCgYJF
         P/pQCQIra2iPYo58puJfgzE0dNH5R1uCwZfJ+8iklNH89KqrtbQ3d/McsgSsY/scaxVs
         3OZUnchI+2h6aHg30RYZ650puj1AMMFm14uPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295127; x=1725899927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvaQLZ3SSfvR80IrbDb1ZIiEruL7absvB74n+D25Sas=;
        b=ZRbzBBzTNuUL6e28QmzW79WM680kmTMmg/m1rqnd1mHaY+VwZWWPGOv0bqosjpk9fC
         UPIv9AsvDkR+lJ2oT9bA3ydLHF9sBA4BxZZAC65G9e1lodfjbJaPiv2mtvxM9Zs9OA6U
         G5kSv1wGV0Wr366HbwiZJAolHvIP6HpCMN4o3uQimjhrVPkWXxrhmNq2mujeF/S1wzAa
         fh0buaQU1pvqLLcbFTpoCbj/Ix7ZQODHFpQ6nr8pgjz9mG2KUNHSBKU3lePGWn+XLCR/
         SaewUPkHlg6HG31B+qJpJ5zq3rUjQb0gOo4U8Vxm8FYJz3Onvqbqzf1m1KI7lOGrm+P0
         JO8Q==
X-Gm-Message-State: AOJu0YyhD8puZihSaVcp6F5u0tgfnd3CzQmbCYIPWgDHIFrr6WayGJuu
	iyH7duOl8kFrqy+GREhcOgXb2+K0Pf00p1VrIMX8k/c3tr2Fyi7oWXT/zSUijxt+N/2jVrfLsiu
	2YZo=
X-Google-Smtp-Source: AGHT+IG3zIgJ4J7G79EejWMgjSgGXXcyUjrOIz9MNDpJuVdbVZPZl5/zNTbNLnngtIEzqbXAKUMbYA==
X-Received: by 2002:a05:6402:1941:b0:5bf:fb:33b8 with SMTP id 4fb4d7f45d1cf-5c21ed9fd7dmr11178024a12.34.1725295127021;
        Mon, 02 Sep 2024 09:38:47 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v3 0/3] libxl: Fixes for libxl_xenconsole_readline()
Date: Mon,  2 Sep 2024 17:38:36 +0100
Message-ID: <cover.1725294334.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix nul-termination of the return value of
libxl_xen_console_read_line().  While at it, remove unneeded memset()s
to the buffer and improve the documentation of the function.

Changes since v2[0]:
  - Fixed comment format as suggested by Anthony
  - Clarified that 16384 is the default size of xen's console buffer.
  - Fixed `libxl_xen_console_read_line()` documentation as suggested by Alejandro and Andrew.
  - line_r -> buff in `tools/include/libxl.h` as well.

Changes since v1[1]:
  - Add Fixes: line to the first patch
  - Remove cr->count from the struct and make it a local variable in
    libxl_xen_console_read_line()
  - Improve the documentation of libxl_xen_console_read_line()

[0] https://lore.kernel.org/xen-devel/cover.1724430173.git.javi.merino@cloud.com/
[1] https://lore.kernel.org/xen-devel/ad7c89bbae34155566ae7c9ca2cb501f21c7d585.1724330921.git.javi.merino@cloud.com/

Javi Merino (3):
  libxl: Fix nul-termination of the return value of
    libxl_xen_console_read_line()
  libxl: Remove unnecessary buffer zeroing and zalloc()
  libxl: Update the documentation of libxl_xen_console_read_line()

 tools/include/libxl.h             |  2 +-
 tools/libs/light/libxl_console.c  | 52 +++++++++++++++++++++----------
 tools/libs/light/libxl_internal.h |  1 -
 3 files changed, 36 insertions(+), 19 deletions(-)

-- 
2.45.2


