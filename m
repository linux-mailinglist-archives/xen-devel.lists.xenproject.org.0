Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CF8A6627
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706736.1104078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweF4-000776-3r; Tue, 16 Apr 2024 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706736.1104078; Tue, 16 Apr 2024 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweF4-00075s-0r; Tue, 16 Apr 2024 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 706736;
 Tue, 16 Apr 2024 08:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heP+=LV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1rweF2-00075P-4j
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:32:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc4c370-fbcb-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 10:32:34 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516d1c8dc79so5168080e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 01:32:34 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a194316000000b00518afd9ee75sm910541lfa.307.2024.04.16.01.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 01:32:32 -0700 (PDT)
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
X-Inumbo-ID: dfc4c370-fbcb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713256353; x=1713861153; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6mAHSI+f/FD7i5IbFLen6ku7yCwkp6FcxxfiE3yT50=;
        b=KMbhgsmPI1M3azakWrfa9PrVHE4WXQvAQTnB6F/VuICQMECeB4Bg3/7OGpLM/eprgH
         bkVx/TySr4FBdTCHCESq2QRNCxHDZPzaJ1POs27iI7C6+nErKhxpBSIj40vP3W3jprDJ
         H73OQRFkdQOU3YOSBt59UvfnfjRCEBY7hFoWGUOlaWuiqwtjF7woHj5Y1pE4MVlZNJE4
         03iG7nSYE/x3gP0W3oWgeEWA7npe182YGZan4P5dCcYIO90USsp8Nl0tlxIt+0fKwiUL
         hexmh2Bd0+4Ak0jtTsSi/poQd+zIQfr6SUzlG7iwlBG5FsayZwHbd4OspLUS8YcKNmKg
         0q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256353; x=1713861153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6mAHSI+f/FD7i5IbFLen6ku7yCwkp6FcxxfiE3yT50=;
        b=usE6RB5HzQMKlNv2PpYnjtUFEjIxKG806pTnldzPcLEAGBeWlQRV2GqLfUrpFkHapf
         aJiZNZp/VMRhvMAik6jLHjVz5qQ4s0jrhOdhvXvAzJsF39wkmEUPNzxw1/4yzLsQSO6z
         Kt82YG0pToUlgheocKwkaoqaH6eTnBif3JyAEScnUW5XjF4nOKNsWBVYi/XciZfZkX5I
         wRUSr2viujBMdelaJzx0v3bgzR6ikf+XlXqOFYfiBWj5JD4Yiht2u4U8cv7VkC2+cMLI
         SaMmXPHmWU7jOXImep2OyyjnTCoKyevm1oso8fCBXsmCTAOMasiLg7GYPtduj94KgkGu
         952g==
X-Gm-Message-State: AOJu0YxSAoDtTvy+UgssqI/6AwDxvxiDWxtiaIWLPLEqOHmRIKjvGjK5
	BdgtlgCnR4DYafYQhvQOYBdJGNlfX+fLRcaukjeIwCTB13Xf9RkiZ8Ht81LI1RQ=
X-Google-Smtp-Source: AGHT+IGH+n71VzkKyRm5BN453lRj2Z0WCortjl9fgU0Sl+C0wmkmVpkJsHU/qdimVbDpvQPCmI06JA==
X-Received: by 2002:ac2:5931:0:b0:515:99f6:2ca4 with SMTP id v17-20020ac25931000000b0051599f62ca4mr7992554lfi.36.1713256352792;
        Tue, 16 Apr 2024 01:32:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v2 0/1] xen/arm: Annotate code symbols
Date: Tue, 16 Apr 2024 01:15:40 +0200
Message-Id: <20240415231541.4140052-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

On the way towards Xen safety certification we're evaluating the use
of tools to collect code-coverage/profiling information from execution
traces. Some tools rely on ELF symbols for code being declared with
type FUNC and having a symbol size.

We currently annotate some symbols but not all. Also, there seems to be
different ways to do the annotation so I'm sending out this series to
first figure out how we want to do things before I go ahead and edit
more of the ARM port.

In this first try I've followed the style from commit:
b3a9037550 x86: annotate entry points with type and size
IIUC, prefering to use macros from the generic framework in
xen/linkage.h in favor of ENTRY/ENDPROC.

But perhaps we would like to keep using ENTRY() for entry points
into the hypervisor?
Another way could be to add .type name, %function to the ENTRY macro
and use END from xen/linkage.h.

Or we can keep using ENTRY/GLOBAL/ENDPROC.

Any thoughts or better ideas?

Best regards,
Edgar

ChangeLog:
v1 -> v2:
* Drop RFC.
* Squash into a single patch to avoid confusion.


Edgar E. Iglesias (1):
  xen/arm64: entry: Add missing code symbol annotations

 xen/arch/arm/arm64/entry.S | 72 +++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 24 deletions(-)

-- 
2.40.1


