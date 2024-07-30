Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4E941574
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767916.1178626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomt-0000bV-QG; Tue, 30 Jul 2024 15:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767916.1178626; Tue, 30 Jul 2024 15:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomt-0000Va-MY; Tue, 30 Jul 2024 15:29:19 +0000
Received: by outflank-mailman (input) for mailman id 767916;
 Tue, 30 Jul 2024 15:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYoms-0000QI-N2
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:29:18 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 795a58af-4e88-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 17:29:13 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-44fe9aa3bfaso27469771cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 08:29:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8416381sm50588551cf.93.2024.07.30.08.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 08:29:11 -0700 (PDT)
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
X-Inumbo-ID: 795a58af-4e88-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722353352; x=1722958152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqyKilccxUy2jU3Ab/ptPA12NAzfuMx58vq0oTSlKKE=;
        b=IIlIS96k6VeVMizy9rUCdxEdywu3dQ7HBbLQdxAfW/dSzREmOjmcnk9BZDbeYGxoMq
         fxpd4rDTVf6VxxSGVGCv3fW4osGKHj59T/hl/TfJaoivWVHaMmiKDZmpUXxykr5JWEJl
         1k92Ea9PZ/aTUEinettSCpPIljCvMt2hRC++c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353352; x=1722958152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqyKilccxUy2jU3Ab/ptPA12NAzfuMx58vq0oTSlKKE=;
        b=GKNtNgNr0VGXPgpvR5zOBqnew1fsfY9KNRoVZMkcwKQz6SxRhUi+RjLFEE4z8vG1G8
         5MC5g81vIkM7iqJM6FJ7hJ4km+F0V0mJOk3y4h5Mxb9Bk3/OYrrdpVnIFd2wrCuUAAeA
         gPjCPRROlmgpnu6rN8HDmgJGQdpQidK8VOjn75+tWiUqifE9zETiK78p+bgzx37xxGj8
         hIFo6He+NRC/5nC/u4TtLTgO2JoNlPrT/C+bvE50qjLFLmqVf+3zoSbPYhfpYOHui4o/
         aiHt02oLsNVRpOqcIhG+fFHp+YtfaItbeLsfpLpKvlCAQtZxgJcBdO+saBT2BRYOS13S
         E4JQ==
X-Gm-Message-State: AOJu0Yz+GMJAcYJD2AqccYwvpLxJEN98qmnP084BMGWVZRB1a4B0H5sE
	DahbeCURrHDiAczqx9hGQhpB96hNrz6sMAvBS8nbS/RA2a770PNh+XGfpqpaiZ8ptQsTRKjAmqb
	c
X-Google-Smtp-Source: AGHT+IFNWjblZqOrrPj0qXysM/Ynv14JREriGYcDNMLU6GXhH5tV66V7uQu3XcwYuDBVWtqpvfCGtg==
X-Received: by 2002:a05:622a:1347:b0:446:3927:5a9 with SMTP id d75a77b69052e-45004d6bacemr165696611cf.10.1722353352012;
        Tue, 30 Jul 2024 08:29:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/dom0: miscellaneous fixes for PV dom0 builder
Date: Tue, 30 Jul 2024 17:28:53 +0200
Message-ID: <20240730152855.48745-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

One fix to correctly restore the context on an error path, and another
fix to limit SMAP disabling to PV dom0 builder.  Previously part of the
Address Space Isolation series, now split for ease of review.

Thanks, Roger.

Roger Pau Monne (2):
  x86/dom0: fix restoring %cr3 and the mapcache override on PV build
    error
  x86/dom0: only disable SMAP for the PV dom0 build

 xen/arch/x86/pv/dom0_build.c | 15 +++++++++++++++
 xen/arch/x86/setup.c         | 17 -----------------
 2 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.45.2


