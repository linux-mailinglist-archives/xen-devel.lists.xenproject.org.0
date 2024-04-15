Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BB18A52E1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 16:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706293.1103388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwN9c-0002By-3Q; Mon, 15 Apr 2024 14:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706293.1103388; Mon, 15 Apr 2024 14:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwN9c-00029Q-0c; Mon, 15 Apr 2024 14:17:52 +0000
Received: by outflank-mailman (input) for mailman id 706293;
 Mon, 15 Apr 2024 14:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/mT=LU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rwN9a-00027e-4N
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 14:17:50 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efff5675-fb32-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 16:17:49 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4347bcc2b47so14500851cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 07:17:49 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 t7-20020ac87607000000b00435163abba5sm5987974qtq.94.2024.04.15.07.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:17:48 -0700 (PDT)
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
X-Inumbo-ID: efff5675-fb32-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713190668; x=1713795468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27tQGw34RL0SwJjgwMX6PjGL+Bogfqv+9M2xZQMRSJU=;
        b=acKU7aR+y/0IrvFYqO4shA2VXEEcVdffe9YWUvnp0sa+L4FCrSRI3c7EO5qf0U2tXv
         jWZkL1K7dX7jIlqldSdbN4ygod4qhq46PegbTXW1Dfrc6mbxYy3af/sP+82dzRcX0ac5
         Y9xZtQ3xVek/zL2QVSHmNcQa2HmGBnvEbQsZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713190668; x=1713795468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27tQGw34RL0SwJjgwMX6PjGL+Bogfqv+9M2xZQMRSJU=;
        b=IU2rZVJeVgk1feLtcJHdYhTeefo4r+btd/8noSpi/l3BhusPFFFD/tquocKpORio1I
         6lityRYKhyrXxEsZBJgPe2aW+AzgEE9mao6V9YtghZksMMR19crdIaUIW87WV2c9VX3A
         X0Tw6EH6rbMSSJwqoV1OyboGHErIxCRSdPUnwtICUiO0LRDWYUJC3b/j+gBwNYgcYKCq
         bQAf/2UrEM9wBlc/xft8+G+qXn1KY1Ragef5JZit3JC77A5E9jZdQhPqQfHl/8vhsVe5
         2OBghcJB0AU7Bo85TjRsVR/3VxP/uVv6Ip49EDafHmqV/zvw0xN/u8wr0HrqQzeKGZ7x
         Fl8g==
X-Forwarded-Encrypted: i=1; AJvYcCXFqQ/jyQsNk8+endTAvlWmhuiDHARrSyhDkMY6MGIRp2cFls4XRAzbyPtAZHW5Q9ujgCg3vI4RgIH0kJGxKa4m1ftt4As1Z3Sqa1F0RKs=
X-Gm-Message-State: AOJu0YxHM+8/Tk7Cjf5Jbvjxsn+wnX7X54BC5xL5FfSJzNPXpcIF2vWN
	QIeA/iGTk/s2OYjaUO0KcvXkfRjeBVk5RfteaVf5zIV/vCwyQP1E7lT81Ztsykk=
X-Google-Smtp-Source: AGHT+IExIkpO8kzAKUopeuw/fxAsXnN6jFxRvMorbLUkIdPcl29k5cz4C35p1tyOdyh7wSmjFnCF3A==
X-Received: by 2002:a05:622a:1a81:b0:437:1ec3:3b6c with SMTP id s1-20020a05622a1a8100b004371ec33b6cmr1249107qtc.30.1713190668355;
        Mon, 15 Apr 2024 07:17:48 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.or,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/spec: fix reporting of BHB clearing usage from guest entry points
Date: Mon, 15 Apr 2024 16:17:37 +0200
Message-ID: <20240415141737.88236-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reporting whether the BHB clearing on entry is done for the different domains
types based on cpu_has_bhb_seq is incorrect, as that variable signals whether
there's a BHB clearing sequence selected, but that alone doesn't imply that
such sequence is used from the PV and/or HVM entry points.

Instead use opt_bhb_entry_{pv,hvm} which do signal whether BHB clearing is
performed on entry from PV/HVM.

Fixes: 689ad48ce9cf ('x86/spec-ctrl: Wire up the Native-BHI software sequences')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/spec_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index dd01e30844a1..29f5248d01d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -643,7 +643,7 @@ static void __init print_details(enum ind_thunk thunk)
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_hvm                              ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
-           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
+           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
 
 #endif
 #ifdef CONFIG_PV
@@ -658,7 +658,7 @@ static void __init print_details(enum ind_thunk thunk)
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_pv                               ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
-           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
+           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
            opt_xpti_hwdom ? "enabled" : "disabled",
-- 
2.44.0


