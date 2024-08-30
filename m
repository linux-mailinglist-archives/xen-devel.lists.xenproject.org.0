Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DE965D70
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786338.1195935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJG-0001yH-MN; Fri, 30 Aug 2024 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786338.1195935; Fri, 30 Aug 2024 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyJG-0001wi-JE; Fri, 30 Aug 2024 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 786338;
 Fri, 30 Aug 2024 09:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDj5=P5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjyJF-0001wW-Dt
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:52:49 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c87c29e-66b5-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 11:52:47 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c0abaae174so1740211a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:52:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7c3a8sm1744327a12.49.2024.08.30.02.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:52:45 -0700 (PDT)
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
X-Inumbo-ID: 9c87c29e-66b5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725011566; x=1725616366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQgY1SyYX8MA+74lGCoRJr6I7F44MZ2RJqqmsaAqQFU=;
        b=n3t2cVzXGde7tT8pVoi9Csr9RL8PWF+c1Rre6EIvxsFtnolBvbynp1GTakkd8XN+O1
         ZFI/0HBMiRpsWj3uJqkA4bLPqVkwTDaSTr+w3tLBJ0qO87R/yOrV+IW3oIIt+x+pDfXQ
         YbCThFE8HzUsEEQa4n/q5TVL4hEUbWBNTFJdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725011566; x=1725616366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQgY1SyYX8MA+74lGCoRJr6I7F44MZ2RJqqmsaAqQFU=;
        b=uvgc1SL/2i/eFztm1YMnoCPI2uJL18GRze47yfoLJXB+kc6bZ/jkR4jiz0g4YIloj6
         YP0/zjZTj2GPuzSw3l9jixsKDGYywvUHJ5mImdaRJ7qYhR7kuAFqZnHC0uI3gz+bMK8E
         1LGmHe+PRGvlpxvFcnwk7/CvhVW4couWOMXnktU9f/uizyARGAOoR+HZznnEIX4mXVrL
         2XPYgbiQDX6qcuzJbCe/a3+wg3O7FlNChDCAqhx9J9DytZG9aLO+WgfO5sL+ofp83G3w
         ycBL/CbEE6banvS1ZqtWdj/xHBnqKuZ1dVZdNMHSMTFKZhs2VjWajaWGTtBYARjvMHyU
         Zd0Q==
X-Gm-Message-State: AOJu0Yy7BKsxuaqCWcScoQz7/oAud5/mnbNFiYwZMv4SRi1JKyI0jrQ0
	PAoK9TuO9eRFHRF0uMiu3UiI+whnsMyiZYJ21FGAiYbvMpheGO+midnIZT0Kf4eOCmGrgMbmSq7
	o
X-Google-Smtp-Source: AGHT+IHUugu43YpkATjhrFqbJPq8Av3kIaXYJLWh2s4PKvc25daKnFMmsRASM0TvHgcU/K2wCGkGMg==
X-Received: by 2002:a05:6402:34d6:b0:5be:dbbb:2d49 with SMTP id 4fb4d7f45d1cf-5c21ed311d4mr4561645a12.1.1725011565863;
        Fri, 30 Aug 2024 02:52:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/time: prefer CMOS over EFI_GET_TIME
Date: Fri, 30 Aug 2024 11:52:18 +0200
Message-ID: <20240830095220.49473-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Workaround a common issue with x86 EFI implementations having broken
EFI_GET_TIME methods, and only resort to EFI_GET_TIME if CMOS is not
available.

First patch splits some of the CMOS probe and fetch logic into a
separate helper, so that patch 2 that actually performs the ordering
change is cleaner.

Thanks, Roger.

Roger Pau Monne (2):
  x86/time: split CMOS time fetching into wrapper
  x86/time: prefer CMOS over EFI_GET_TIME

 xen/arch/x86/time.c | 88 +++++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

-- 
2.46.0


