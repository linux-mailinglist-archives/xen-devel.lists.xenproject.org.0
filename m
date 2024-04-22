Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB38AC9DE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 11:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709843.1108842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLZ-0001ZK-FS; Mon, 22 Apr 2024 09:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709843.1108842; Mon, 22 Apr 2024 09:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLZ-0001XA-Co; Mon, 22 Apr 2024 09:52:25 +0000
Received: by outflank-mailman (input) for mailman id 709843;
 Mon, 22 Apr 2024 09:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryqLX-0001X4-T3
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 09:52:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 043dfcc4-008e-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 11:52:23 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso3262505f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 02:52:23 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b00418a9961c47sm16066367wmq.47.2024.04.22.02.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:52:21 -0700 (PDT)
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
X-Inumbo-ID: 043dfcc4-008e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713779542; x=1714384342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uk1cFAAYgFeZcZ3nq4TIQNPWC/a/D4KyF5q8SDc1gdQ=;
        b=LwADRRLsmuBTSmB64vpDWHaoTFdtzVbdCCMbrRLd7LDKjknnOKX6ETd9hbWKYjpm1S
         TLj//igd5p/ls6fmeoM8rKgNQew4j2EEd8hEeiJIpXMU/cYyBK87xK3o9x53Jmeomf2/
         1L/BL48ayX6dPy0xJ/NsP4RMsvNRiu2SiSsnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779542; x=1714384342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk1cFAAYgFeZcZ3nq4TIQNPWC/a/D4KyF5q8SDc1gdQ=;
        b=FW7ZoxW4bWRczIWDWOHEkle7MX/VnFBTaZyiUMe52Vx9IbpJXePkIOkCfWtLUbNFF6
         TvAUpyRetRcB7QUTMDhvXosbEybf7zwKqua4WkSDpcLUMi511F92cuqAyS7lsORjsGF1
         8He6u2jnocyCo8cChqGiRnByuVxBkbhGS3dzCrCZCt1FCtbXGg0TMZhUmZFg9gNbNVzZ
         NNQ4tvrS8Oxlm5/vzG3xC5e2ufKOMmxiwdaOwk3cmf+ek+n/0/pTWipE1L/ldy/jDkW6
         4jVoQr0bFLtjaKEUy1QaNJSZ1nzJZkkmHjcb7OTANmOB2yL/E6ni7xEKSHi2McxS153K
         2bdQ==
X-Gm-Message-State: AOJu0YxefqxnMGw//63hbV92vdgesivtbSnVxjv9pxd+D7sfN4vcIAkc
	3iug2gGLu2qw3wQ+wNc06HQQhFRAsZp8h7h3CBdH86aKmZjP6Xq+61R1HHpSRWITBfUY5IyByI9
	e
X-Google-Smtp-Source: AGHT+IH3wj8P77Bs8D0D+pT06Ga7zwvAJx75QtTx1LLtgq6XyeaSKPZG0F/AJPt/mLBzCmMgOYlk3g==
X-Received: by 2002:a5d:64e5:0:b0:34a:b477:3a17 with SMTP id g5-20020a5d64e5000000b0034ab4773a17mr4614429wri.39.1713779542168;
        Mon, 22 Apr 2024 02:52:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/pvh: fix VGA reporting when booted as a PVH guest
Date: Mon, 22 Apr 2024 11:52:14 +0200
Message-ID: <20240422095216.20211-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following patches are kind of unconnected after v1, but patch 1/2 is
still a helpful improvement.

Patch 2 fixes the (wrong) reporting of VGA information when Xen is
booted as a PVH guest.

Thanks, Roger.

Roger Pau Monne (2):
  x86/video: add boot_video_info offset generation to asm-offsets
  x86/pvh: zero VGA information

 xen/arch/x86/boot/video.S         | 83 ++++++++++++-------------------
 xen/arch/x86/boot/video.h         |  2 +
 xen/arch/x86/guest/xen/pvh-boot.c |  9 ++++
 xen/arch/x86/setup.c              |  1 -
 xen/arch/x86/x86_64/asm-offsets.c | 26 ++++++++++
 5 files changed, 69 insertions(+), 52 deletions(-)

-- 
2.44.0


