Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD158CC1E4
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727614.1132159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqC-0007Ar-95; Wed, 22 May 2024 13:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727614.1132159; Wed, 22 May 2024 13:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lqC-00078T-53; Wed, 22 May 2024 13:17:12 +0000
Received: by outflank-mailman (input) for mailman id 727614;
 Wed, 22 May 2024 13:17:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vsR+=MZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9lqB-0006aV-2w
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:17:11 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97a69ef7-183d-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:17:09 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-43f91aac792so5822141cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:17:09 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df8308580sm168782291cf.66.2024.05.22.06.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:17:07 -0700 (PDT)
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
X-Inumbo-ID: 97a69ef7-183d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383828; x=1716988628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYqG2PwvCby3wswfH3oW/bedkYG965aa/Kv7xf2kuwk=;
        b=X/VCmprySlTtYlIp7ojMaQIvp8JxJCjjbwZqu2cpJcT4y8lA5TPttjB1vdnrcEhwDG
         NYljR18N66fJKzUFoYc4PAzePngSSrd12MHL2AOwJukKX3nOvgbHQIvgxDtutO/sZ+GQ
         0ntw5mhoxV1jYwigBZ2G0QW3sLnkZH6yiHM9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383828; x=1716988628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYqG2PwvCby3wswfH3oW/bedkYG965aa/Kv7xf2kuwk=;
        b=kGHhNAWP2P69iLgQAaHHqfkZjHgyOnnJP7oOBu6IQUNlK22PFok7HYfRlZ8WX58/yX
         z3oP3GlcG7hJJU3qTUTNvN/lXgku1Nq3XP2WYEOBvBWKCc2Y0wpFdXohIH4u1Dtt8q5V
         qhmu/LhubCM/v7bdaR450mPHUBh5fijc4YIdtQaMyjP3tBSKYD75WNk7kv4djA0Ol3A6
         2IhRd/wiNtNlTUbaFIBn5Fzo6F32MlGfp5+cRLU0mGiDXS1nU1BCthZi6olacRoIW8xZ
         nzK8MKzSilwrk+G9EkwgYdqDLEnFHT13FTooltWa0fb4VR1u2KdPAqkZxr3u8vOoQMiE
         6LiQ==
X-Gm-Message-State: AOJu0Yy8tO1oQ1fjOwzDMvd8A1mLZtft+eNfZrMv4T5ccFV1n+wzrRoe
	UDxSuZ+d9t7NYgU3JDivQUK0gcQ7upMEj/F3tgU510LwwWKzs7g1nIRAUT2prHCzBq7T8YTLUZi
	ijv0=
X-Google-Smtp-Source: AGHT+IG7SzZjtJqMXc/0TJMsERyvpNvdjs1EKGm7srM0lFiRQ6FylYoUa4ZubQkO02MjAatJ0EJ8CA==
X-Received: by 2002:ac8:57c5:0:b0:43c:7755:961c with SMTP id d75a77b69052e-43f7a28f061mr206279971cf.5.1716383827910;
        Wed, 22 May 2024 06:17:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] x86/shadow: Trace fixes and cleanup
Date: Wed, 22 May 2024 14:16:59 +0100
Message-Id: <20240522131703.30839-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: 5133a01d-346d-4779-b319-a156ef944669@suse.com
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches 1-3 new, following reivew of Jan's bugfix (patch 4)

Andrew Cooper (3):
  x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
  x86/shadow: Introduce sh_trace_gl1e_va()
  x86/shadow: Rework trace_shadow_emulate_other() as sh_trace_gfn_va()

Jan Beulich (1):
  x86/shadow: Don't leave trace record field uninitialized

 xen/arch/x86/mm/shadow/multi.c | 150 ++++++++++++++-------------------
 1 file changed, 63 insertions(+), 87 deletions(-)


base-commit: 9c5444b01ad51369bc09197a442a93d87b4b76f2
-- 
2.30.2


