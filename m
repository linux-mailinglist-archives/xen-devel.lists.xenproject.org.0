Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285138B7DEF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715127.1116649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qoj-0005dP-MW; Tue, 30 Apr 2024 16:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715127.1116649; Tue, 30 Apr 2024 16:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qoj-0005aR-Ix; Tue, 30 Apr 2024 16:58:57 +0000
Received: by outflank-mailman (input) for mailman id 715127;
 Tue, 30 Apr 2024 16:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ve62=MD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1qoj-0005YH-2O
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:58:57 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee33494b-0712-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:58:56 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-790c36dcee9so274621785a.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:58:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 o2-20020a0cecc2000000b006a0ddff6523sm786063qvq.1.2024.04.30.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:58:54 -0700 (PDT)
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
X-Inumbo-ID: ee33494b-0712-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714496334; x=1715101134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNxGxkMD9CJp8RRAVTh+aAIRYT3AomZutj/6p3QfXPs=;
        b=kb/fz8l3q+8CcxX+P0df7mNwZEM7BUoLCr7TPFhOdCCf9oMNTjsEnyHSp2ZeyJsbHG
         MAlQgkStFQG2vIyNpDumEKhZFJQCrckiTS4rlqAf0eARry3cHn99eS7PMlz2dPWeDt1+
         z96qvoUG4ORYJ2WZ0MBsyRYrPGeIguARGOhxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714496334; x=1715101134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNxGxkMD9CJp8RRAVTh+aAIRYT3AomZutj/6p3QfXPs=;
        b=QJr2XW0fHzA/w4HcKFGabES/D4VnKYUHUp4siPxEGbU5IbQSf/t0TbnCc8jc4Cvs73
         o8/JOPCZ349vHvzsvBakzkyM5rJ4l3TEmm2W8EXRwomVC2dbN2sKxolf273zsEtLShYz
         qSbtpJ0IWFvPiwEwybwrZu4yFLStRCa0REHnBjGfHododQx+/yJRzXN+qihyGvQZK/rY
         aE/qQlkqEDpTafzo8Ah5amHPCCLIInPp/Hi0SUpv6KGNnI99Ig5iAHROXv6SrTotxql6
         /c+izprxdGdSU5kXN9Wh63eNVfhFgGmssztTGCJuAOGf5BbdT5O0e2CCN4Cd09bPcPXc
         cKAg==
X-Gm-Message-State: AOJu0Yy56gB8nupf3tJ0J33bt7JWdf8RYZNvtbJhpAC0BRoM2c5Sdg7d
	bdB/W6vmCXA+Rk9ILz8bdQYQLILGaNOQg4omdAV7ARJHrRUfHs6O4iBsTNgOnNUdonZjtNoVnsD
	7
X-Google-Smtp-Source: AGHT+IGIEw5SaJlKnjse9LMPlVqJLSzEwi1GX59SBNFHCUwKSCPgohBf/Aa7moz39c88fYqz3XNEfQ==
X-Received: by 2002:ad4:40cd:0:b0:6a0:dda7:744f with SMTP id x13-20020ad440cd000000b006a0dda7744fmr2660422qvp.37.1714496334639;
        Tue, 30 Apr 2024 09:58:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.19? 0/2] xen/x86: support foreign mappings for HVM
Date: Tue, 30 Apr 2024 18:58:43 +0200
Message-ID: <20240430165845.81696-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series attempts to solve a shortcoming of HVM/PVH guests
with the lack of support for foreign mappings.  Such lack of support
prevents using PVH based guests as stubdomains for example.

Add support in a way similar to how it was done on Arm, by iterating
over the p2m based on the maximum gfn.

Mostly untested, sending early in case it could be considered for 4.19.

Thanks, Roger.

Roger Pau Monne (2):
  xen/x86: account for max guest gfn and number of foreign mappings in
    the p2m
  xen/x86: remove foreign mappings from the p2m on teardown

 CHANGELOG.md                   |  1 +
 xen/arch/x86/domain.c          |  6 +++
 xen/arch/x86/include/asm/p2m.h | 28 ++++++++++----
 xen/arch/x86/mm/p2m.c          | 70 ++++++++++++++++++++++++++++++++--
 4 files changed, 94 insertions(+), 11 deletions(-)

-- 
2.44.0


