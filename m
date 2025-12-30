Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1ACE9D3A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194216.1512666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBG-0007Ua-S5; Tue, 30 Dec 2025 13:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194216.1512666; Tue, 30 Dec 2025 13:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBG-0007Rj-PI; Tue, 30 Dec 2025 13:54:34 +0000
Received: by outflank-mailman (input) for mailman id 1194216;
 Tue, 30 Dec 2025 13:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaaBG-0007RX-7A
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:54:34 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11be3e64-e587-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:54:33 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so48021825e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:54:33 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm70198245f8f.13.2025.12.30.05.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:54:31 -0800 (PST)
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
X-Inumbo-ID: 11be3e64-e587-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102872; x=1767707672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tu/fYS4END1+h4Qjl1KijmHV3ettMWF8gZSQ2ye7nw=;
        b=RK7Ngxsyc+t6fifWMZPUQV1i2iAARqJrkDet7fxI2YgWE01i42kLPjGuigxBTOTkcV
         m4lONeXO4/g3sDmUnAbF0st/nYp/0KSRinL4rXltojR73RUAngVqX2hWIs3hZ9rTg0B+
         Zc1oJwEw+TK909IeiOa0DJb1Kmd/yss0Dud9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102872; x=1767707672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tu/fYS4END1+h4Qjl1KijmHV3ettMWF8gZSQ2ye7nw=;
        b=UaJiJTzIO1KMCut3zhXBKXD8DsCYJZpTH+VQkV1NZNzQ5ozpwBIUONrcD9KMzsLtMt
         DRy/9TtLcgsmkuZdZhnhj26sIHYfHO+wOvYw+Ix7i6m+q9aGxNEexZsAnnNscukJO5eu
         W4oTRxNxw/aVA54c2QUc0uoMVV6Icnc7DRsjVocoSwYlseKAN4EDu5zNVppT3wOrqe9Q
         YgXrXAzm5eVHzkhifYESIDKQLAX/f60nInpwDw7V+/t2GxIkItwdH9uC577WGyWIu4VA
         JB9TD1MmxALhiyyeFAEraamEddnp+F5XRyI07+DOlGGszALEY8teRwenRavRAxr/ocOZ
         UPig==
X-Gm-Message-State: AOJu0YyCs8uqOIP5XFpVIPx19B/T6rZJEyMf+oo8dl96wvU+7h1Br+dl
	ui2g/BF+DW6UdF9oIwsFvEoRQxV/FC34TEm2m02280lXlHvQMWb1yyGGcrM5tSwZVbsSMwc3wtK
	1fZwZ
X-Gm-Gg: AY/fxX5sT7TPSyhXGHVNAItqQu83+RzJhe4LKVbAOIDFLk2yk5kYpk8DWdF+pNsBN1n
	njc+GxEV9AtN0E/hfet0lw9Y4hQazaiuAHpTpIEBSi8PuAYGlXhmRGrCCIWdQpUWcFV350ncpPP
	/tG8P0ul8vN1pPkwrLACfxQLjRDqFVZXYkaKeYOpo7PFHJexOF8qmFci2mNS5ZmYtIYrnvpZSjb
	vi6nfpztYxQGb522Tg5dUHjeZPSHvmpdbFPBjh4pI4qmyJQ/iz/a81me2KZN89JBFXRIQD1BNiE
	36wzlPFm0bnaz+4V7cmVliXs4+7bKcjEXTtlr63gFCJPzGwob7JaTjYKa3tUVD13NhDxeTVFLsp
	czWten+kRdqHsTG5xAYcJGxmPibECxDy2g7LCH5yKql8uTsD43ZTvD7Dzxqc+tFY+ivTrCfsMED
	ghWTBnfiOeVOaWI50CteKrareRdWYmblRztv8fIu0lbzVTLhyk8Sd85IcCWHLe/w==
X-Google-Smtp-Source: AGHT+IGds8JKrPJVYpKbJ/GPvHVI0B4u7sWhxmvUk4U3sCURN+engOa1QqvXgpOOIpTebHtcCpk7Vg==
X-Received: by 2002:a05:600c:46ce:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47d1953c020mr347828535e9.2.1767102871569;
        Tue, 30 Dec 2025 05:54:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] x86/asm: .byte removal
Date: Tue, 30 Dec 2025 13:54:23 +0000
Message-Id: <20251230135427.188440-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The remaining conversion of .byte to real instructions following the toolchain
upgrade.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2237162011

Andrew Cooper (4):
  x86/xstate: Deindent the logic in xrstor()
  x86/xstate: Rework XSAVE/XRSTOR given a newer toolchain baseline
  x86/i387: Rework fpu_fxrstor() given a newer toolchain baseline
  x86: Avoid using .byte for instructions where safe to do so

 xen/arch/x86/arch.mk                   |   4 +
 xen/arch/x86/i387.c                    |  65 ++++-----
 xen/arch/x86/include/asm/asm-defns.h   |   4 -
 xen/arch/x86/include/asm/msr.h         |   2 +
 xen/arch/x86/include/asm/prot-key.h    |   6 +-
 xen/arch/x86/include/asm/xstate.h      |   3 +-
 xen/arch/x86/x86_emulate/0f01.c        |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  34 +++--
 xen/arch/x86/xstate.c                  | 176 ++++++++++++-------------
 9 files changed, 143 insertions(+), 153 deletions(-)

-- 
2.39.5


