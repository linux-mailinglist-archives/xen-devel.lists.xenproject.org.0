Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015407C74BF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 19:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615947.957516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRw-0001VZ-MM; Thu, 12 Oct 2023 17:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615947.957516; Thu, 12 Oct 2023 17:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRw-0001Tn-J7; Thu, 12 Oct 2023 17:26:16 +0000
Received: by outflank-mailman (input) for mailman id 615947;
 Thu, 12 Oct 2023 17:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K032=F2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qqzRv-0001Tc-LX
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 17:26:15 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7162da70-6924-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 19:26:13 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ad810be221so195758866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 10:26:13 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a17090603db00b009829d2e892csm11522697eja.15.2023.10.12.10.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:26:12 -0700 (PDT)
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
X-Inumbo-ID: 7162da70-6924-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697131573; x=1697736373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsShQqItdUAwhDe8vQUoiwqJuVenLNYiRZwU25mI/Xg=;
        b=avsqImvwpe68CJpMFIdpjzZEZzolzbleHLmCRvpUJMAgefKyL0PRI21MVbnDJV9JJZ
         ZI7cNC1YXsqw6qf9Dga1+g5/1Lc+uSqqW5hlViqBwO3FbHFyarS4mLXGM4EOKJLxPKjK
         rUY0XHqUQ3G0ZORkFw4Yp/rCVVPyUnuKJqfWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131573; x=1697736373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsShQqItdUAwhDe8vQUoiwqJuVenLNYiRZwU25mI/Xg=;
        b=QnwqdAvPOEOWJYnAFWhmSP97NYmMFXgmO1Hx466yaWmcYRkZr5z2JLgi0SAtPI/zHv
         P92Ddz8bOWZFty/cyCeArpB36p2z207/xMlyYKV8mF9Sd2BCBpx49Ps6VPRyG5XCcvCg
         UBOWaBD1rdffy0laHyQjjLfgQLh8RW8vQqipaSwGi9tRvBnW2NY61s53bcYRBliHwouS
         i6MKSk+nBzgp8YehdNzrs6duH7P2CippHlRNdvlzGNEyT/h8sX79/iAA+akjA9d2QIND
         8ERpC8qJgkGLiYafpaOwEclJpeRZbB+iISWwESw6SnNBxHTtZ+MABfYGnibw/BzrPEDb
         SVjQ==
X-Gm-Message-State: AOJu0Yyi1hsSylNXdFrTSy1tcUUH65jOrSj+MYD7jclR0+4fLq0CBu8T
	BDr3botTIC1hZXuJzwN6vQlp2550cWsamxjR3Po=
X-Google-Smtp-Source: AGHT+IFTVJsJAm6naNKXyiX5c2mFJkV4lk+63Z6lPWEM2vseu03boGDXe8Vcm4Aa0ugQWdawYpF75g==
X-Received: by 2002:a17:906:318f:b0:9a1:b05a:c07c with SMTP id 15-20020a170906318f00b009a1b05ac07cmr20588428ejy.55.1697131573061;
        Thu, 12 Oct 2023 10:26:13 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 0/2] Fix AMD erratum #1485 on AMD Zen4
Date: Thu, 12 Oct 2023 18:25:59 +0100
Message-Id: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch should make it to 4.18, as it prevents random crashes on AMD
Zen4 running outdated microcode.

Under certain conditions Zen4 may corrupt its own code stream when SMT is
enabled and STIBP is not. The Linux thread in which this was highlighted is
in patch2's commit message.

NOTE: Still running in CI as of now, but tested locally. Pipeline here.
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1034895039

Patch 1: is just a minor refactor to ensure we don't get microarchitectures
         of different families mixed up now that we have 3 different
         families involved (Fam17h, Fam18h and Fam19h)
Patch 2: The actual fix. It involves setting a bit in an MSR if it's a non
         virtualized zen4. It's not a direct copy of the Linux patch, as we
         have started using macros to find out microarchitectures from
         CPUID bits, rather than relying on models.

Alejandro Vallejo (2):
  xen/x86: Add family guards to the is_zen[12]_uarch() macros
  x86/amd: Prevent potentially fetching wrong instruction bytes on Zen4

 xen/arch/x86/cpu/amd.c               | 16 +++++++++++++---
 xen/arch/x86/include/asm/amd.h       | 17 +++++++++++++----
 xen/arch/x86/include/asm/msr-index.h |  2 ++
 xen/arch/x86/spec_ctrl.c             |  3 ---
 4 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.34.1


