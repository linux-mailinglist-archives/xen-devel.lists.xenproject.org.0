Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249448B6115
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714343.1115524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-0002oH-4m; Mon, 29 Apr 2024 18:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714343.1115524; Mon, 29 Apr 2024 18:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-0002l3-1f; Mon, 29 Apr 2024 18:28:31 +0000
Received: by outflank-mailman (input) for mailman id 714343;
 Mon, 29 Apr 2024 18:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Vjo-0002kh-Sg
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:28:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45108856-0656-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 20:28:26 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57288691c07so1278725a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 11:28:26 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm13241293eda.96.2024.04.29.11.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 11:28:25 -0700 (PDT)
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
X-Inumbo-ID: 45108856-0656-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714415306; x=1715020106; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmraiI3B/VV+MWnmGuT6JxT2sWrleEhUYuV/0VlaKdQ=;
        b=OeR2sCfKUYFVWQ0uwve2s76TtesNk5L/7g1kgQyqBBOFgtgojQrgaH35VS2kasOiSO
         lYTCHnYvBHln74F9cngnASKQe6SHJ6m2ZZ5CAMJvcT2ZbPOGl/oYJ8es0E8ZLj8KPIPy
         K/zDWAcDxxS+6Ium9Fhy0P9GeM5fIxrvr8cqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415306; x=1715020106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmraiI3B/VV+MWnmGuT6JxT2sWrleEhUYuV/0VlaKdQ=;
        b=NSs7OryfWaK2C7yh0Kb0XYbHmWnZuQqtTwY8qW91Lj643HA0T6/NSREvBFLZeNr7Fl
         Q1oNqD0Ru9lXoUsziZKiGziwKuMRANwbgG1NZ9I6e+e57t9BLZhfC9BtveYMj4k7paiA
         /G0z17rBRuvt6zBn6YPR6lCbax1zFsmg51PYyvnliFTFwBIZqrn4FQhJvasKOSCVPJR8
         q8dy7AfS8m8Wt0DlXOcG/1H1AOJI8xlvMbDu5gB8xFaflCKBH0XShZPGeNOIajO8jDj3
         ScglouKrW/9JUG7LphY9i2z787ED+Nj32jWJA56HKEyGv6FoM1gTan2sDfXkAtgFnLgv
         4Dcg==
X-Gm-Message-State: AOJu0YxXEuDIVjUE82AIlLhbxwmTVqnS7HuwtC5QOKYZGzm40NhaEytT
	APgNNkM69zDzVV8BIyYMSZ5OYlWQQHUjPLJub6VlOisvPM4L+NGig4cMEWV9/EYFakv3c0ZP74y
	d
X-Google-Smtp-Source: AGHT+IF+Tfv1DaxC3n/ANdbdUGP1i45XbV5HN21tjNPzcZMr9TuD5T9QO7mVsY6mlLkInv5GixAYqQ==
X-Received: by 2002:a50:a45c:0:b0:56c:5a12:ac53 with SMTP id v28-20020a50a45c000000b0056c5a12ac53mr6642438edb.24.1714415306035;
        Mon, 29 Apr 2024 11:28:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/4] x86/xstate: Fixes to size calculations
Date: Mon, 29 Apr 2024 19:28:19 +0100
Message-Id: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various fixes and improvements to xsave image size calculations.

Since v1:
 * Rebase over exposing XSAVEC.  This has highlighted several latent bugs.
 * Rework the uncompressed size handling.  LWP / APX_F make for much sadness.

Be aware that Intel and AMD have different ABIs for the xstate layout.

Andrew Cooper (4):
  x86/hvm: Defer the size calculation in hvm_save_cpu_xsave_states()
  x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
  x86/cpu-policy: Simplify recalculate_xstate()
  x86/cpuid: Fix handling of xsave dynamic leaves

 xen/arch/x86/cpu-policy.c         |  55 ++++++---------
 xen/arch/x86/cpuid.c              |  24 +++----
 xen/arch/x86/domctl.c             |   2 +-
 xen/arch/x86/hvm/hvm.c            |  12 +++-
 xen/arch/x86/include/asm/xstate.h |   4 +-
 xen/arch/x86/xstate.c             | 111 ++++++++++++++++++++++++++++--
 6 files changed, 145 insertions(+), 63 deletions(-)

-- 
2.30.2


