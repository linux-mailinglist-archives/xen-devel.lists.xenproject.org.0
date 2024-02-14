Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57385489E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680616.1058635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeF-0005SN-3b; Wed, 14 Feb 2024 11:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680616.1058635; Wed, 14 Feb 2024 11:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeF-0005Pk-0w; Wed, 14 Feb 2024 11:41:55 +0000
Received: by outflank-mailman (input) for mailman id 680616;
 Wed, 14 Feb 2024 11:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeE-0005Pc-EI
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:41:54 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c9b3f0d-cb2e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:41:53 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so18624511fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:41:53 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 pj35-20020a05620a1da300b00783ce19f9e6sm3686636qkn.57.2024.02.14.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:41:52 -0800 (PST)
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
X-Inumbo-ID: 0c9b3f0d-cb2e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910912; x=1708515712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4EJXnL9GIcqm26Ox9Uwndbf51pNFjXvmgGVjTtia4M=;
        b=by+3+J4eXUIoLQJCjeI9EmGEMpAfyhihY7sXaUIvjzYSpweCE2bnipjitfk00MMIwn
         K7VNVYbwNvJ52mz1suI0hy39FroVrBTkvaaqhajk/AY5sRkg/hLHNZebUZcPcykjDgu5
         Pqpa/+IVyZbbwLXQBid4g+rhNlVv7RCte4x24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910912; x=1708515712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4EJXnL9GIcqm26Ox9Uwndbf51pNFjXvmgGVjTtia4M=;
        b=mNA2Gq/oRkTtajE4vJjHqtStC0iWfg7NnRJ31RxVo1+qhLfMgqgaAidXw0VMRBReBM
         qtVn3tRNh1tQmz/TmIbOsJAHqIf+rR37ZP7uN68zokj8zcDFucn1kYqg+8l8wbicZhTO
         HxsKTjpHt/UHi7zOu6Ljuvt78QoGIrzgreapZ/2QikTtW6OmNaM4rRrJb6z4LM94nJai
         7K4XumSRaykW+UTs4eeH3vWWwalCCbnBdjgfp6aiNwJzYLBs2TCmuPCMDiDvbFE/Ofl6
         A2mKIHILIRhKiIH4A5815L8TaPcOEh6VTgrwqVAL+jfjm87wrt5V+6W9HJLfHcLsgUY5
         Hjbw==
X-Gm-Message-State: AOJu0Yy0Nr5T1YJFfX5nC++ke2DRKbgC3ffqJBk3s448Q6wBDEvGvG0B
	tsP8h9DfRFJQbnlj//ywHpW48vx3mm8fLQ1gy+9PToJZOFPLlyvpJtKSPS8FZJ/Xj0CrgrNOY6B
	4
X-Google-Smtp-Source: AGHT+IEPAJe00LaxPFcLum2WOIrjiERL8ZZyqWfPMdQ/7UY4MX5TO7wyMcau+RjaKHzOaGBGxpscMQ==
X-Received: by 2002:a2e:3614:0:b0:2d0:d336:d144 with SMTP id d20-20020a2e3614000000b002d0d336d144mr1724428lja.14.1707910912414;
        Wed, 14 Feb 2024 03:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgEpQj5AGX4u5g1D6mTmXMmV9dp+XBVo/w+lsneoU8l3aPkI9FGSSOqi297O0H1lww856b1s128dEhbxuBNbkn2csMLBS+bU2yPFyRF5VJB9CJ6VBhAswKseMvIIojs8otL6mGcHuzPuIn8TlXQXYSD36NRMDP4aeKEpscA1as6jLNATfg8IitIYQz0Nbsdy8XcqGRP4J3HZ5ZXV3gFEsy1YgIYNN32rKAF0ivVZeC9EdcqqYe8g38
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] Fix fallout from IVMD/RMRR unification checks
Date: Wed, 14 Feb 2024 11:37:36 +0100
Message-ID: <20240214103741.16189-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch is a fix for a silly mistake I introduced in
iommu_unity_region_ok().  The rest are additional chances requested in
that context.  Last patch adds __must_check to the gfn/mfn addition
handlers.

Thanks, Roger.

Roger Pau Monne (5):
  iommu/x86: fix IVMD/RMRR range checker loop increment
  iommu/x86: print RMRR/IVMD ranges using full addresses
  iommu/x86: use full addresses internally for the IVMD/RMRR range
    checks
  iommu/x86: print page type in IVMD/RMRR check in case of error
  mm: add the __must_check attribute to {gfn,mfn}_add()

 xen/drivers/passthrough/x86/iommu.c | 25 +++++++++++--------------
 xen/include/xen/mm-frame.h          |  4 ++--
 2 files changed, 13 insertions(+), 16 deletions(-)

-- 
2.43.0


