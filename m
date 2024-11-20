Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF79D3995
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 12:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841042.1256557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj09-000181-3G; Wed, 20 Nov 2024 11:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841042.1256557; Wed, 20 Nov 2024 11:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDj09-000163-0R; Wed, 20 Nov 2024 11:36:05 +0000
Received: by outflank-mailman (input) for mailman id 841042;
 Wed, 20 Nov 2024 11:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDj07-00015r-6g
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 11:36:03 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d231f9a-a733-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 12:35:59 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cfd2978f95so3933816a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 03:35:59 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dfffdb0sm768906066b.125.2024.11.20.03.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:35:58 -0800 (PST)
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
X-Inumbo-ID: 9d231f9a-a733-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkMjMxZjlhLWE3MzMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTAyNTU5LjQ5MjMyMiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732102559; x=1732707359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ46npOWgx/WbIOYgHqPXYUeHgCtD6U4gQy/xG8N7wY=;
        b=knl5M0fSsdlpWK4x5d1SdI+k4YZB+bCfHnud+R/SQUXmOiRgUgS2RNXmGS27KyqlIl
         y5LX1Ao65ImMPUju59DpL29jtDvUMfrLta0VQzRHn6Wm1Ol0nNR+v4k5gkBhPImkJhq+
         I444OFPxSFdv3swj+16+4K7pkWRNB2pVi7J44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732102559; x=1732707359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ46npOWgx/WbIOYgHqPXYUeHgCtD6U4gQy/xG8N7wY=;
        b=GEWzvokhqAJXruVQTDnOTIMGNMCEhLFd5q2gXy/zp8ZEPp4UuxRwKdIiQhqPiaBLGo
         3Jd9yyhDYA02cdjqso4CHOwqWYEKqnbV6l4f7jWiAxYI+ThklIQ7GaHZtNsXPw+XpVAc
         3kPKclH9MrXSFIEKEFvK4ZtHYV5cUxEnxmMqZ38OBuC+x3BCA7L6ATSqI/ZFCsYDCdP5
         jDOPHoXNBUTShNhVC9m61J4C7eFFLZSHw3Bi+t194NBtm1gz51aqEjWwVwZErgaymZ2H
         f0jKrSMKmKBZPmJR0WOxKe0B9nOeV/b273QWBhH7FDLyRiG476fdt1nDoJ5CMybJH70O
         s1AQ==
X-Gm-Message-State: AOJu0YzLgnjBDsqX2Mf6QB3OORwf7uFNhn0Zaa8tUbNOtJNZeRW2q5Ag
	FrF4l6aTAgifFegyoHYcszRWmpNHYqPe9DS8FeDrYehkPFa0ANisAkJ2Kug1kZi2PqWTbENaR9+
	D
X-Google-Smtp-Source: AGHT+IEemFG57UORNq0u0yeCst6K8CkUmxTMtpYDDk4WTfHuyNbOOth7yIiVUUt4nL6m8cumJ3HgBw==
X-Received: by 2002:a17:907:1b02:b0:a99:f0f4:463d with SMTP id a640c23a62f3a-aa4dd59e494mr247555966b.26.1732102558664;
        Wed, 20 Nov 2024 03:35:58 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/irq: fix calculation of maximum pIRQs for dom0
Date: Wed, 20 Nov 2024 12:35:53 +0100
Message-ID: <20241120113555.38146-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is a fix for the calculation of the max number of pIRQs
allowed to dom0, second patch fixes the print of dom0 pIRQ limits so
it's also printed for a PVH dom0.

Thanks, Roger.

Roger Pau Monne (2):
  x86/irq: fix calculation of max PV dom0 pIRQs
  x86/pvh: also print hardware domain pIRQ limit for PVH

 xen/arch/x86/io_apic.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.46.0


