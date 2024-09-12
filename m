Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603E976741
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797310.1207231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnG-0006Nb-5j; Thu, 12 Sep 2024 11:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797310.1207231; Thu, 12 Sep 2024 11:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnG-0006KV-2d; Thu, 12 Sep 2024 11:15:22 +0000
Received: by outflank-mailman (input) for mailman id 797310;
 Thu, 12 Sep 2024 11:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sohnE-0006KJ-NP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:15:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b3031e8-70f8-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 13:15:18 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9018103214so117780466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:15:18 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce96a7sm732152966b.158.2024.09.12.04.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:15:16 -0700 (PDT)
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
X-Inumbo-ID: 4b3031e8-70f8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726139717; x=1726744517; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh7I14a/cD0LKjyfbanLNAcqJyNFwB1xu5IFRF4oEGc=;
        b=tlWAqtqPePk/1DgrlyMQ4+mxl3Jocszdwd62xzFcG360YeYB6l5GlFU2reYPEbr37q
         7e0P8rpWFv8QPnEHvA1D/c83crZv2fouKZHTxTeFptykMf22pdvidcKDOrGr+bZK67kd
         YcvLl7UOHLGLcUVcbh1C8Z8JY1aXsj90xRxOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139717; x=1726744517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh7I14a/cD0LKjyfbanLNAcqJyNFwB1xu5IFRF4oEGc=;
        b=bg6YsBMb8jBF9DjfSqWprqO2mBKleWpoJa81xlAlyXUsYE/ezGnG3HrrxIYq5q0U5b
         16Q8R2z3L0w67/xxSh1r4GRfWiYeztzxYXzO9Ni3W4KLVmy9ReZsfgZPmKfMa18++vIn
         x7ICXU/2d+C2zKprX9wwW72yOqmpZZxe2BhnXSyVM3arZLe3aeJe2vNxbiypbM2h0cQj
         IGhDleEG3ilS/wssGNgHDNivem+LZ1ADgmzRGFctB0qncSmBXsAKXu+aj6Q1ahrzVAcA
         w31nU+atttIVdDCZrpmp1QVbib3TQ7wtLMb3iuVFRYOSsky0lI2WxxyfDNd/bJzwPzIo
         qmhw==
X-Gm-Message-State: AOJu0YwXCmpQdYQCYz7R3AYIZu2b0IEgmG0QqYrt0AvNx//HV8f50qs5
	Op0jIryfccthW+kSYFWexGuZ9E2dSkC3cgA8hrAeV7LNUo4lK/3T8lO7BHjfr4LhNvyLh3y+U3T
	o
X-Google-Smtp-Source: AGHT+IFey8W1xCGOVWJ7MOFU5zo6Ur5kPnebKBfgR8jV4SMK8ZU22aLG0EgbTE+CoZg4ifKQH9Tf0w==
X-Received: by 2002:a17:907:f1a9:b0:a8d:6261:23ff with SMTP id a640c23a62f3a-a902944492fmr213532866b.17.1726139717257;
        Thu, 12 Sep 2024 04:15:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 0/2] x86/time: improvements to wallclock logic
Date: Thu, 12 Sep 2024 13:15:12 +0200
Message-ID: <20240912111514.26934-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series started as an attempt to change the default wallclock
preference from EFI_GET_TIME to CMOS RTC, but has grown quite a lot.

Thanks, Roger.

Roger Pau Monne (2):
  x86/time: introduce command line option to select wallclock
  x86/time: prefer CMOS over EFI_GET_TIME

 docs/misc/xen-command-line.pandoc | 19 +++++++++++++
 xen/arch/x86/time.c               | 47 +++++++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 5 deletions(-)

-- 
2.46.0


