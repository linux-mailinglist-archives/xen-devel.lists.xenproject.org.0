Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD559C1F84
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832617.1247901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCV-0004Gq-RZ; Fri, 08 Nov 2024 14:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832617.1247901; Fri, 08 Nov 2024 14:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCV-0004Ey-OC; Fri, 08 Nov 2024 14:43:03 +0000
Received: by outflank-mailman (input) for mailman id 832617;
 Fri, 08 Nov 2024 14:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9QCU-0004Ee-AA
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:43:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6599e5-9ddf-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 15:42:59 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso365875266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:42:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a1769asm242652866b.1.2024.11.08.06.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:42:55 -0800 (PST)
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
X-Inumbo-ID: be6599e5-9ddf-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlNjU5OWU1LTlkZGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDc2OTc5LjM1ODUyNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731076976; x=1731681776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh3+rwx8/jiA2Wdt/b58ELRXBqK8S1uD7mJYN2j4Y+s=;
        b=YxenahuBpxVZIUfXBgtEpCX/VoE13oj2ogfVBeKI7fOBlEbhIJmgEbN2D7iPhX3qei
         Sft4pANtbP8m0nZvXCcOIiTsBg1y1LnRYp3llhu3H/pa6qbJBae0ARWxcZmKMcAmP2re
         FnKJuwgS/nfnXj9hbmLT/L9OgjomT2buCyACQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076976; x=1731681776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh3+rwx8/jiA2Wdt/b58ELRXBqK8S1uD7mJYN2j4Y+s=;
        b=RSvbiHA6sXPMW02GcaHms2gY0u8huCZuO/Rg14nxTZmIMmHPVwCB+bo2K5cwfzEjE4
         T4SamnjTA1bM5csNMiDzq69xb7uM3EiUQNcYwq3lF5jThkv10KbMGNK+k1FHQT9NL8nB
         H7Ing5UCvD+wKLkrNlKglBsqBHNFKS2TWqrAbcBtgAr5dC1gdSnbB4/wu/yERmP3/EQd
         RVjXhql20FS1ewQUCrc0BrYTRUFNmHDp7Ernki1pRhKXu57kuK9JGqzb3A3VLBpsImy8
         IEPH357YgR2pLg9OSsdfEIDc2aWtDxrfexdpF3LdimJRnhLaYTiQs7K4F+UT1R//Q8ny
         ERog==
X-Gm-Message-State: AOJu0Yzbke9bSeuV5S62+P6WmS+NwJ+B0/Ga5BOH+aZKu3lPZX98bSrL
	j/z4qT5wipcB4xzDZ+TtWjH53r359m0pRcoeIPBsaU/QXE7wkfyhvsNGtTuGxu3wNapMPvk8LNx
	v
X-Google-Smtp-Source: AGHT+IE1jgXerry7yyLadQmIM9Ql8rNRk+reNHu5T4qRwmiZ08BW7cb0lQ9wXsj6/OEPj6XgIkoVsQ==
X-Received: by 2002:a17:907:7baa:b0:a9a:2afc:e4e4 with SMTP id a640c23a62f3a-a9ef0052ae7mr283798166b.59.1731076975694;
        Fri, 08 Nov 2024 06:42:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/ucode: Untangle revision-relational logic
Date: Fri,  8 Nov 2024 14:42:49 +0000
Message-Id: <20241108144252.315604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: 20241107122117.4073266-1-andrew.cooper3@citrix.com
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, cpu_request_microcode() ends up consuming the currently-loaded
microcode revision (and discarding the answer), simply because the helpers are
too overloaded.

Andrew Cooper (3):
  x86/ucode: Rework Intel's microcode_update_match()
  x86/ucode: Rework AMD's microcode_fits()
  x86/ucode: Drop MIS_UCODE and microcode_match_result

 xen/arch/x86/cpu/microcode/amd.c     | 57 +++++++++++++---------------
 xen/arch/x86/cpu/microcode/core.c    |  5 +--
 xen/arch/x86/cpu/microcode/intel.c   | 35 ++++++++---------
 xen/arch/x86/cpu/microcode/private.h | 21 +++++-----
 4 files changed, 54 insertions(+), 64 deletions(-)

-- 
2.39.5


