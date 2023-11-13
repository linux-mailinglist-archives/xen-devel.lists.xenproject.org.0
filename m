Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8D7EA0FB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631764.985445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVu-0000nw-0M; Mon, 13 Nov 2023 16:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631764.985445; Mon, 13 Nov 2023 16:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVt-0000kW-Sb; Mon, 13 Nov 2023 16:10:13 +0000
Received: by outflank-mailman (input) for mailman id 631764;
 Mon, 13 Nov 2023 16:10:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2ZVr-0007jY-VE
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:10:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ead7e73-823f-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:10:10 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so40155545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 08:10:10 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b0040841e79715sm8384226wml.27.2023.11.13.08.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 08:10:09 -0800 (PST)
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
X-Inumbo-ID: 1ead7e73-823f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699891810; x=1700496610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCTudPDfl4JVCVJ7/7ycptzsMXd3LM+BUOrRBVuEaKY=;
        b=Z1Ny4zME9j2JnF53EKR9ISzftGXWoxEI5vOmTGSZ1L+imuOBYDotpaKV5teF2zxSDN
         AB/vT9f8bRmwHm1ps7g9FWL1tO+Ul3UrIKkETSVNDcp/mjGUfYQeMo96gQYHa3p9L6sb
         eb28JT+yyKRc9uXCCwNdHL+2oGzLeEFR6rGj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891810; x=1700496610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCTudPDfl4JVCVJ7/7ycptzsMXd3LM+BUOrRBVuEaKY=;
        b=d3u6HM1KNlLdGWBh2CTUTs8FrM5VL4pb4fyw9xkVpaO9nfIjfmRz6IrfTglPJafo8U
         25y5NwDF1UfsoIMLXwxaWi55zsjQQpAmM+sI0ajJ5g1v1ENQDU8Mh+rDcH6nQEGJ0DK3
         4MmqjWAzQxquGvT19sANgrezIdk/GCDsQQ3f77Wk1jVntdYZhbRTp7D4fugrof/+D8/R
         Q/pX9hoVCmi9Yrkrr7I0l4bNCmK61XzEeXW7zqD6EEFRNk4RBCfife9cRr+ytNrbSaiU
         v1rUqFkBHLL4L9+R3VHcBE6Zmvc8erkkbxj2IC9AJclfi2E0AZ+I2X6ouHRBz2gjRqUo
         mipA==
X-Gm-Message-State: AOJu0YzVTkCOyIXLkeYTgm33l+mhbtx+TrcpmsbQPEes/wqcFxe82FNO
	ZpXbs5gnW3xVQk9JtMkmPn2u1hNnbHxIdIoZhqk=
X-Google-Smtp-Source: AGHT+IFKpLifI676hGTagTHUAh2tF4bNspCbEiizrkn1Vn4B66vuiZ+f0rtB1VY/D9LpfRosGj6DDA==
X-Received: by 2002:a05:600c:35c9:b0:40a:206a:578d with SMTP id r9-20020a05600c35c900b0040a206a578dmr5867107wmq.31.1699891809812;
        Mon, 13 Nov 2023 08:10:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] livepatch-tools: fixes for building on non-glibc
Date: Mon, 13 Nov 2023 17:09:38 +0100
Message-ID: <20231113160940.52430-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

A couple of fixes to allow building the tools on non-glibc systems (BSD
and musl tested).

No functional changes intended for either of the two fixes.

Thanks, Roger.

Roger Pau Monne (2):
  livepatch-tools: add -largp option when required
  livepatch-tools: fix isnumber() function clash

 Makefile             | 4 ++++
 create-diff-object.c | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.42.0


