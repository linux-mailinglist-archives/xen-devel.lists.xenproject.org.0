Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCF9C09D2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831980.1247354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94EH-0003QA-1E; Thu, 07 Nov 2024 15:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831980.1247354; Thu, 07 Nov 2024 15:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94EG-0003Ni-UU; Thu, 07 Nov 2024 15:15:24 +0000
Received: by outflank-mailman (input) for mailman id 831980;
 Thu, 07 Nov 2024 15:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94EF-0002r4-BS
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:15:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0ba618-9d1b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:15:20 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso182704666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:15:20 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a4cbsm106948666b.62.2024.11.07.07.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:15:18 -0800 (PST)
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
X-Inumbo-ID: 1a0ba618-9d1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFhMGJhNjE4LTlkMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNTIwLjAyNDIxNiwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992519; x=1731597319; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IpdSP4ns8MXGdRIB2QmldxTpAvwYCXDF1K6TA3gwK0o=;
        b=EwMB5+LQFpsyWFPMdIFL5D5D6uErGdJlqZRdD6lRRZLKTnQ6Xa3MjFK+PQgzqmSoaZ
         hVT6GF+ofO0aTm2gCRnTl47KMfl6R6Wo75MfThLftEnfNLs8VQcYWT6DJA19UHtERK+U
         2Yr5sVbc+7V/pW1dgptt5EiNre7N8i1ZF5FJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992519; x=1731597319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpdSP4ns8MXGdRIB2QmldxTpAvwYCXDF1K6TA3gwK0o=;
        b=FcjlnazqTrrgNR/6agmFqmSYVAeYIX0lbxT80rWsGyxjR4HKvxJ0VkYJ4++z7kbLcp
         EUAOvo6o5Cv2siZF6Tqb5M2YSBpcqkC0ODesfnBn486P81KTuYYQMc2fxamLHpMaADPy
         1BKzlXkKuKmdla62tJdJo5pDhAsAvzG+rwf/llfsTJLFsx7YSWDET69lEq8hdm7YhztN
         HH+g6oFSGbfUqdS8Pjx7+/CxCr526pF78qF95LDRo71k5rokugGMYJ620SV4t/Kv55xh
         bIh/K/sFUHlqThdo+SH3ouyXx8pZW4toDZHB5WZwt8JAQH1BdyLT0ZA+yWf1zgZcYURy
         YsVA==
X-Gm-Message-State: AOJu0YzIL9DpC8tSJTK2WrHBwGWJY0uvFpKGzDfdjJW4EDK2RiUz6K9x
	CuyUG1tjt4Ba8Q3DSsuU4puXCnMbVdsC61U7eJ0awPiDYRDlliUr7KXGEhRR3zuDUhVeL3Ulj+k
	1
X-Google-Smtp-Source: AGHT+IECOrdk6KT+2gGI9vgWmR3uk53Ky40Huv2lySL1UBNAfjAhOL87GAP/tRc4/6u8KKoWw/ORGg==
X-Received: by 2002:a17:907:d09:b0:a9a:10c9:f4b8 with SMTP id a640c23a62f3a-a9eeb58a509mr25229866b.61.1730992519198;
        Thu, 07 Nov 2024 07:15:19 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/4] livepatch-build-tools: fix for livepatch hooks
Date: Thu,  7 Nov 2024 16:15:05 +0100
Message-ID: <20241107151509.73621-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First two patches in the series are misc (IMO trivial) fixes.  Last two
patches fix the usage of hooks.

Thanks, Roger.

Roger Pau Monne (4):
  livepatch-build: allow patch file name sizes up to 127 characters
  create-diff-object: update default alt_instr size
  create-diff-object: don't include symbols for .livepatch.hooks.*
    sections
  create-diff-object: also include relas that point to changed sections

 create-diff-object.c | 14 +++++++++-----
 livepatch-build      |  5 +++--
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.46.0


