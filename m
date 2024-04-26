Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31EC8B3965
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712819.1113672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M94-0008Ey-Rt; Fri, 26 Apr 2024 14:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712819.1113672; Fri, 26 Apr 2024 14:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M94-0008CT-Ov; Fri, 26 Apr 2024 14:01:46 +0000
Received: by outflank-mailman (input) for mailman id 712819;
 Fri, 26 Apr 2024 14:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0M93-0008CM-7I
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:01:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83377840-03d5-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 16:01:44 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so278969966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:01:44 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm10646714ejb.35.2024.04.26.07.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:01:42 -0700 (PDT)
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
X-Inumbo-ID: 83377840-03d5-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714140102; x=1714744902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZvV3Mym1kuc7YfIbhz+MVBip/WpHkSahKxnh4HzZJE=;
        b=gHGU4+R8TESO8NCy/0Wl9/G566W1i+qZk4PcutZwvXvlm6eMrel0J5d9EfB+6wtUdo
         OK1DFs5cH4jpLt/phA7piTVVNAPAqFHYeWLWD75otETYTjVx+M6qOoJ06IAWtyTbwN1v
         dePzcyCVeuAgdIPMmjRg2rl6Z5pJ07CgiRpbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140102; x=1714744902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZvV3Mym1kuc7YfIbhz+MVBip/WpHkSahKxnh4HzZJE=;
        b=L0ZiMv06rpG2urOfGubWiMVijPs6+po6JEcJmT6dfuFEUWtZE/PfYQpNPYg5SaS9+I
         6hNO4hT//CsXqzSucN7gZjJw61SnSp+axsDJYJCrbsNym0S7wU5Bi6b4vC90NHC5m/+Y
         5GeckYR1kU/NiveJ3mUJSz5XwmL1Vo7xA+i/Fwj/w+mjtoD4RWhocHdPAu2e8Y4nQ03v
         ToPkmwRbQKMYdJplLNzz4jnjYL5/mM3quQp26p/yQ9/xJy13TXbhICXWxhqifJ46EHVs
         sB5eoywllVShBCaM9iVJPaNJDDDGJtBFeiuAMV1GNkie822tOPxJXAT0sLHmmXOAc+B7
         p8fA==
X-Gm-Message-State: AOJu0YzyyOV2ugYGOa7C7tDUutBUhbB/UFwNjRcxh3D9UTLO3pSULXvq
	PWukfXLJwne5xmaasAJ9rhByRaUpLXO8DrqULv4ed55TrbYKZgvEm56eYEJQ1VzQuCYdfAeBUhO
	N
X-Google-Smtp-Source: AGHT+IGKH6+W9asgznr0awQHICzV0XMG50OjJHwErUwgg5xgokEK+mbjri2Uv7gAHn/rtfwKKwAWSg==
X-Received: by 2002:a17:906:5851:b0:a52:54d8:6d21 with SMTP id h17-20020a170906585100b00a5254d86d21mr2035389ejs.7.1714140102495;
        Fri, 26 Apr 2024 07:01:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 0/3] x86/boot: Untangling
Date: Fri, 26 Apr 2024 15:01:37 +0100
Message-Id: <20240426140140.465506-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This started out as another series trying to fix CPUID handling for SEV.

I'm still trying to sort out the SEV side of things, but I might need to
resort to something *far* more unpleasant in order to hit 4.19.

This series is some cleanup of module handling from the work I've done so far.
It interacts with the HyperLaunch Boot Module cleanup, but should make it
simpler overall.

Andrew Cooper (3):
  x86/boot: Explain how moving mod[0] works
  x86/boot: Explain discard_initial_images() and untangle PV initrd handling
  x86/boot: Refactor pvh_load_kernel() to have an initrd_len local

 xen/arch/x86/hvm/dom0_build.c |  9 +++++----
 xen/arch/x86/pv/dom0_build.c  | 22 +++++++++++-----------
 xen/arch/x86/setup.c          | 14 +++++++++++++-
 3 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.30.2


