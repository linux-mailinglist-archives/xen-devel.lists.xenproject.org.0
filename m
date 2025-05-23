Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7379FAC1E8E
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 10:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995379.1377828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfd-0003Dr-Rn; Fri, 23 May 2025 08:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995379.1377828; Fri, 23 May 2025 08:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfd-0003CU-NM; Fri, 23 May 2025 08:22:25 +0000
Received: by outflank-mailman (input) for mailman id 995379;
 Fri, 23 May 2025 08:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uINfb-0003CJ-Oy
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 08:22:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ce9a0ff-37af-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 10:22:22 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a375888197so2971379f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 01:22:22 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a360b0b766sm25503071f8f.56.2025.05.23.01.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:22:21 -0700 (PDT)
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
X-Inumbo-ID: 0ce9a0ff-37af-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747988542; x=1748593342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgZEePaEwVB0+m6G/JqFr58XnjU0IvSkKGo6kRFhqJU=;
        b=i1OmdZ3schu0Brufn3lydtYtN3t53BT9EFK1xNsGNJJ4NiW651V1VNSOThnTSi7x0G
         +aVD/gGbye/lm7BPgkP7en59OEyeGrCfFEpzNwlYZI+58+ql6LWLVz4WbQ15AJ2lveB/
         yqXWAEZYyjbglb8n6RXA13rF1a25HYmP2j4xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988542; x=1748593342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgZEePaEwVB0+m6G/JqFr58XnjU0IvSkKGo6kRFhqJU=;
        b=llBVqCKoXBqP2n8Y5NFkNSbl5+fd/wfpw1JFtsLf7p4EUIF1ZySBhq1Ti1VlEWZTqP
         t/I7DgELsWlALBzboRcho5ygVQsPcS8oQgqJH9cu/My97DrDef7/WmxWl5GDRZ++SWBO
         rbnbeMmgHW4JzTxaTZ/AURsIk6uSow4K7y3KAtfTwoFp2BHQ4NFNpMrc1nQlpRgDXx3+
         NEs1NG32r1XXh/QW5bpQtHuSa/9OaPsqgtjSt6qYW74R/ELzOQsYpT1KGTqHkCUqCSMf
         WXhTB0YI/20P13g+C8iIQqc9hnnDpVt7YrkJT69K+oMI2iIIsuQUXH8v8vfLNwv5L3XT
         /1UQ==
X-Gm-Message-State: AOJu0YxnLyqrQvD8OaZAAgRGjOf3016stMm8/KS8cP2voRdxIttfGeQ4
	HKi2twW9/ysSj2bpinbAFZaGwO9mXCyn8mH9Xxb8QxJHe44WWxNYsj9Bh6w1ORHDPqq7KVa5cMw
	IpapZ
X-Gm-Gg: ASbGncsImS3RB/Fi5f9y0r4fnnaHp2LuTzFzgsemhK78nYiSCBmiJi7VumkQacRcs6Q
	9tDt8c1avhWhoqmKC7w2DxSpApxbltg/4Q5aAwR6GuMIq9b3xuSpyCleEMLqH+RM7jhyhUDOqlX
	qkWw7B3LxtFD8n9KVbI1V6g5txZnXTxJdPXPaENDAghgQMS7pUrdlKKFS3RyKHEQVE4pWQwWI6E
	rckW6YHLUGegB65DrqOZ6sLc6hpYbbCMxYcqK/KiTpgMSfrtWSUx9NN0/KowkszfxNKts0nBTzM
	rH+0kiEtNIs81xXK/gqqnLBm2SE3pvTG1qmJMzCcdsgoXEmSC9YHJNfHogHkCZUFRV/EjrBjyXZ
	cpy4lln7qiQEbDf1N8Ww=
X-Google-Smtp-Source: AGHT+IHwEpcM/WpnbnTHNgQ0C57KGN3yGk3JTYSr2dSsvpgBIgQfRMWN/ifbBebgdtO+nHBgHs9l7w==
X-Received: by 2002:a5d:4884:0:b0:3a4:c535:47c7 with SMTP id ffacd0b85a97d-3a4c535490emr426127f8f.28.1747988541716;
        Fri, 23 May 2025 01:22:21 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/3] x86/boot: provide better diagnostics in AP boot failure
Date: Fri, 23 May 2025 10:21:32 +0200
Message-ID: <20250523082135.18088-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series attempts to improve AP boot failure diagnosis by improving
the printed failure messages (patch 1) and detecting AP getting stuck
during bringup (patch 3).  Patch 2 is preparatory changes for the work
done in patch 3.

They should be non-functional changes for systems working correctly.

Thanks, Roger.

Roger Pau Monne (3):
  x86/boot: print CPU and APIC ID in bring up failure
  x86/traps: split code to dump execution state to a separate helper
  x86/boot: attempt to print trace and panic on AP bring up stall

 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               | 15 ++++++-
 xen/arch/x86/traps.c                 | 63 ++++++++++++++++++----------
 3 files changed, 54 insertions(+), 25 deletions(-)

-- 
2.49.0


