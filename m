Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F153A890329
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698985.1091310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprmt-0000RF-Os; Thu, 28 Mar 2024 15:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698985.1091310; Thu, 28 Mar 2024 15:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprmt-0000Ot-Ks; Thu, 28 Mar 2024 15:35:31 +0000
Received: by outflank-mailman (input) for mailman id 698985;
 Thu, 28 Mar 2024 15:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idZb=LC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rprms-0000On-Bp
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:35:30 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0437cc-ed18-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:35:29 +0100 (CET)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-430c32c04c7so5307351cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:35:29 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 cb9-20020a05622a1f8900b00430b907c234sm712604qtb.26.2024.03.28.08.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:35:26 -0700 (PDT)
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
X-Inumbo-ID: ce0437cc-ed18-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711640127; x=1712244927; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n7tN2Gb8zYsB5TxQEwfCgZyHBrjTC5mqLoPfYLQw3w=;
        b=e7XJX6Qm4P8d2+3yADnY+0yDoNZbmBunrDuCG2H3TjbROHmz4wkVWfvKgP9UbZ1fXA
         On/UIcBu/ECwln95cYTnWIDwIrvagrEM/b0RZqBA/ZtEKR40UJ8rpWgg2/4rzUD4Uosh
         viLkkJ/WS23UuVAdC/tC/nyB6qBilcRtj1VUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640127; x=1712244927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n7tN2Gb8zYsB5TxQEwfCgZyHBrjTC5mqLoPfYLQw3w=;
        b=ilr2Dti0qPqcwBLB3JEf1lYv8QCWw73JdAqbiNOLo5KFnDakmkgbfslLGLO+QejRGY
         RPwomKueFL58eC0Up+rPcjN8TQGx1bjYbsDBorFDyKdz3HLmZV3YPnki0EdDqVwbqlbA
         y4uZUUpMJGCxeQavbLFLFNTK9KMSfGwDSHJbZ7aOnCgAa4X0bDvy6uDa2PWpsXoQj9ng
         sHF8jT4Sm3IYznADUkwGjtMibUugKoiTr6DwIw9Y393ERMm9bL6R1Ec+hMYBeNQ0TfA8
         Zz/FKqzl67Wh1eGelZsl2HresaMYAmABLK6zmdcKBg98KVMO7362eOorsaxwBMKI4W7q
         A4UQ==
X-Gm-Message-State: AOJu0Yz5+a1ux3vsJvorI9CCQM/dO2lZm/+agxEYsiNYXANi1FPz/Xny
	E534kAEmANGBMi1+/B6FOWgiHlewCPANlSrOqNLDA1PeqV9nwYOvQYHddX5CQHU36pl30kbq2k6
	6
X-Google-Smtp-Source: AGHT+IFb9hWkirb9yBvLaUlKOOeCEDFnZ88pETqLp7Kax20zcgYG+ZuZEJ80ukiC3ql4ubVZm7v5TQ==
X-Received: by 2002:ac8:57d5:0:b0:432:b30b:7fd8 with SMTP id w21-20020ac857d5000000b00432b30b7fd8mr2740651qta.16.1711640127334;
        Thu, 28 Mar 2024 08:35:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/video: improve early video detection
Date: Thu, 28 Mar 2024 16:35:21 +0100
Message-ID: <20240328153523.4155-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The current video logic reports wrong values when booted in PVH mode, as
that boot path explicitly skips real-mode logic, and thus avoids any VGA
video detection.

First patch is cleanup of the offset declarations in boot_video_info.
Second patch attempts to fix Xen in PVH mode reporting VGA support.

Roger Pau Monne (2):
  x86/video: add boot_video_info offset generation to asm-offsets
  x86/video: do not assume a video mode to be unconditionally present

 xen/arch/x86/boot/video.S         | 88 +++++++++++--------------------
 xen/arch/x86/x86_64/asm-offsets.c | 26 +++++++++
 2 files changed, 58 insertions(+), 56 deletions(-)

-- 
2.44.0


