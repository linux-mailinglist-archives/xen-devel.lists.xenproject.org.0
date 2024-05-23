Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF738CD114
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728364.1133259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6R8-00064T-Ch; Thu, 23 May 2024 11:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728364.1133259; Thu, 23 May 2024 11:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6R8-00062z-9r; Thu, 23 May 2024 11:16:42 +0000
Received: by outflank-mailman (input) for mailman id 728364;
 Thu, 23 May 2024 11:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6R6-00062t-J0
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:40 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecb122b8-18f5-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 13:16:39 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6f12ff2da3fso2684885a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:39 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:35 -0700 (PDT)
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
X-Inumbo-ID: ecb122b8-18f5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716462997; x=1717067797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=io6NKi/HuBeU1oPKPl4oPHpp6HTYVxQANok6ys1P3tY=;
        b=ur0Go7nO/n1f/t8y2Dhmfq13i+hftaJm4rU2c25J7jWVQAvOlue96zHB8MbkaSGqoG
         XVwDR0ch+zEwmBKPOA2MGNBWkT88HEB5HZw42VONWqqfvMmsnbssy5pqbDAAIWpwneHc
         EzwHwV25alwY6LqQ1x57WqfyvOZy6HuDo+C4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462997; x=1717067797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=io6NKi/HuBeU1oPKPl4oPHpp6HTYVxQANok6ys1P3tY=;
        b=P528VAFPs/snnrs1xWzfaa2eCSfruTe02Bl3uBMXrnOToN0DgRdhUpLAhuOEN0JIuq
         4JmcCQClkEciuEFMZS584XiAt2A9MjXk8vssKLLcT39pL28zwjvJu2XgcKSpdZ0ZOPGW
         HHLOxaLIdkbS2Emx03pZNrT7JssFozLaklPJcFtkOt4OYHr32MfMh/myK8lNAl8QE2Sv
         a03QqrbikOkT/CcRUKPgDmpnV67jlYXdHmr45VXEZT4yqkLrBwCEcRG5omL9fv5T/vAm
         kORo1EbCh3uU0kVDBfnQ4/rzCZe2QwhzWo/+vJoKU7Tfdk40zQzs6z5B5ypbt+N1g2uu
         P4+A==
X-Gm-Message-State: AOJu0YxcpY72mSgJaBE1CaRPOhgdKWS67g2DdXlx96cq9gGfAE5pswkN
	9MaoDaPxGJBzZ/vuuTGVHn4QUqR51kiJgwTNUgP11tsB4VWtD0qTgndgyNRqw81dbnYOce4t543
	ll/E=
X-Google-Smtp-Source: AGHT+IFEpJLgLx9LJqjO15FS64H8Szi7raczWajXLknNr9EAY6IlUsgNwKl/yarlIrlfSZV2UnwJqQ==
X-Received: by 2002:a05:6830:11ce:b0:6f0:e381:77b1 with SMTP id 46e09a7af769-6f668e68a28mr5008281a34.27.1716462996976;
        Thu, 23 May 2024 04:16:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v3 0/7] x86/xstate: Fixes to size calculations
Date: Thu, 23 May 2024 12:16:20 +0100
Message-Id: <20240523111627.28896-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This has grown somewhat from v2, but is better for it IMO.

The headline change is patch 2 performing all the cross-checking at boot time.
This turned into needing prepare the Raw CPU policy earlier on boot (to avoid
further-adding to scheme we're already looking to retire).

The end result has been tested across the entire XenServer hardware lab.  This
found several false assupmtion about how the dynamic sizes behave.

Patches 1 and 6 the main bugfixes from this series.  There's still lots more
work to do in order to get AMX and/or CET working, but this is at least a 4-yo
series finally off my plate.

Andrew Cooper (7):
  x86/xstate: Fix initialisation of XSS cache
  x86/xstate: Cross-check dynamic XSTATE sizes at boot
  x86/boot: Collect the Raw CPU Policy earlier on boot
  x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
  x86/cpu-policy: Simplify recalculate_xstate()
  x86/cpuid: Fix handling of XSAVE dynamic leaves
  x86/defns: Clean up X86_{XCR0,XSS}_* constants

 xen/arch/x86/cpu-policy.c                   |  56 ++--
 xen/arch/x86/cpuid.c                        |  24 +-
 xen/arch/x86/domctl.c                       |   2 +-
 xen/arch/x86/hvm/hvm.c                      |   2 +-
 xen/arch/x86/i387.c                         |   2 +-
 xen/arch/x86/include/asm/x86-defns.h        |  55 ++--
 xen/arch/x86/include/asm/xstate.h           |   8 +-
 xen/arch/x86/setup.c                        |   4 +-
 xen/arch/x86/xstate.c                       | 286 +++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 xen/include/xen/lib/x86/cpu-policy.h        |   2 +-
 11 files changed, 322 insertions(+), 122 deletions(-)

-- 
2.30.2


